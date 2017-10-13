package com.shag.webuser;

import com.shag.util.Storage;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.FetchType;
import javax.persistence.CascadeType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.GenerationType;
import javax.persistence.Table;
import static javax.persistence.GenerationType.IDENTITY;
import java.io.Serializable;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "WebUser")
public class WebUser implements Serializable  {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(length = 11, name = "UserId", unique = true, nullable = false)
    private int id;

    @Column(name = "FirstName", length = 50)
    private String firstName;

    @Column(name = "LastName", length = 50)
    private String lastName;

    @Column(name = "Email", length = 50)
    private String email;
    
    private static Storage<WebUser> storage;
    
    public Storage<WebUser> getStorage(){
        if(WebUser.storage == null)
            WebUser.storage = new Storage(WebUser.class);
        return WebUser.storage;
    }

    public WebUser() {
    }
    
    public WebUser(String firstName, String lastName, String email) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
    }
    
    public void initialize(String firstName, String lastName, String email) {
        this.setFirstName(firstName);
        this.setLastName(lastName);
        this.setEmail(email);
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFirstName() {
        return this.firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return this.lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public boolean isAuthorized(){
        return this.email != null && this.email != "";
    }

}
