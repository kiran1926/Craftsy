package com.craftsy.webapp.database.entity;

import jakarta.persistence.*;
import lombok.*;
import org.apache.commons.lang3.builder.ToStringExclude;

import java.util.List;
import java.util.Set;

@Entity
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Table( name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column( name = "id")
    private Integer id;

    //one user to many userRoles : One to Many for userRoles
    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @ToStringExclude
    private List<UserRole> userRoles;

    //One user to many products : one to many for Product
    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @ToStringExclude
    private List<Product> products;

    //one user to many orders : One to Many for userRoles
    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @ToStringExclude
    private List<Order> orders;

    @Column( name = "firstname")
    private String firstName;

    @Column( name = "lastname")
    private String lastName;

    @Column( name = "email")
    private String email;

    @Column( name = "password")
    private String password;

}
