package com.craftsy.webapp.database.entity;

import jakarta.persistence.*;
import lombok.*;
import org.apache.commons.lang3.builder.ToStringExclude;

@Entity
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "user_roles")
public class UserRole {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
   private Long id;

    //many to one with users table
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    @ToStringExclude
    private User user;

    @Column(name = "user_id" , insertable = false, updatable = false)
    private Long userId;

    @Column(name = "role_name")
    private String roleName;

}
