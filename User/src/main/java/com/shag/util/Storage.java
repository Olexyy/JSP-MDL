package com.shag.util;
 
import java.net.URL;
import org.hibernate.cfg.Configuration;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import java.util.List;
import org.hibernate.query.Query;

public class Storage<T> {

    private static Session session;
    private static StandardServiceRegistry registry;
    private static SessionFactory sessionFactory;
    private final Class<T> classType;

    //static {
        // IMPLICIT SOURCE SELECTION ->
        /*URL pathToResource = Thread.currentThread().getContextClassLoader().getResource("com/shag/util/hibernate.cfg.xml");
        if(pathToResource == null) {
            System.err.println("Sucks!!!");
        }*/
        //sessionFactory = (new Configuration()).configure(pathToResource).buildSessionFactory();
    //}

    public static Session session() {
        if(Storage.registry == null)
            Storage.registry = new StandardServiceRegistryBuilder().configure().build();
        if(Storage.registry != null && Storage.sessionFactory == null)
            Storage.sessionFactory = new MetadataSources(Storage.registry).buildMetadata().buildSessionFactory();
        if(Storage.session == null  ) //|| !Storage.session.isConnected() || !Storage.session.isOpen()
            Storage.session = Storage.sessionFactory.openSession();
        return Storage.session;
    }

    public void shutdown() {
        Storage.close();
    }
    
    public static void close() {
        if(Storage.session != null && Storage.session.isOpen() )
            Storage.session.close();
        Storage.session = null;
    }

    public Storage(Class<T> classType) {
       this.classType = classType;
    }

    public void add(T item) {
        //if(!Storage.session().getTransaction().isActive())
            Storage.session().beginTransaction();
        Storage.session().persist(item);
        Storage.session().getTransaction().commit();
        System.out.println("Saved::Details=" + item);
    }

    public void update(T item) {
        //if(!Storage.session().getTransaction().isActive())
            Storage.session().beginTransaction();
        Storage.session().update(item);
        Storage.session().getTransaction().commit();
        System.out.println("Updated::Details=" + item);
    }
    @SuppressWarnings("unchecked")
    public List<T> list() {
        String query = "from " + this.classType.getSimpleName();      
        //if(!Storage.session().getTransaction().isActive())
            Storage.session().beginTransaction(); 
        List<T> items = Storage.session().createQuery(query).list();
        Storage.session().getTransaction().commit();
        for(T item : items) {
            System.out.println("List::Item" + item);
        }
        return items;
    }

    public T get(int id) {
        if(!Storage.session().getTransaction().isActive())
            Storage.session().beginTransaction();
        T item = Storage.session().load(this.classType, id);
        Storage.session().getTransaction().commit();
        System.out.println("Loaded::Details=" + item);
        return item;
    }

    public void remove(T item) {
        if(!Storage.session().getTransaction().isActive())
            Storage.session().beginTransaction();
        Storage.session().delete(item);
        Storage.session().getTransaction().commit();
        System.out.println("Deleted::Details=" + item);
    }

    public void remove(int id) {
        T item = this.get(id);
        if(item != null)
            this.remove(item);
    }
    
    public List<T> where(String param, String value) {
        String name = this.classType.getSimpleName();
        if(!Storage.session().getTransaction().isActive())
            Storage.session().beginTransaction();
        String query_text = "from " + name + " where " + param + " = :value";
        Query<T> query = Storage.session().createQuery(query_text);
        query.setParameter("value", value);
        Storage.session().getTransaction().commit();
        return query.list();
    }
    
    
    /* TODO: search by field criteria builder
        Criteria cr = session.createCriteria(User.class)
        .setProjection(Projections.projectionList()
          .add(Projections.property("id"), "id")
          .add(Projections.property("Name"), "Name"))
        .setResultTransformer(Transformers.aliasToBean(User.class));

        List<User> list = cr.list();
    */

}