package com.craftsy.webapp.database.entity;

import jakarta.persistence.*;
import lombok.*;
import org.apache.commons.lang3.builder.ToStringExclude;

import java.util.List;

@Entity
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Table( name = "products")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column( name = "id")
    private Long id;

    //  one product to many orderDetails : One to Many for order details
    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @ToStringExclude
    private List<OrderDetail> orderDetails;

    //  many to one with users table
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    @ToStringExclude
    private User user;

    @Column(name = "user_id", insertable = false, updatable = false)
    private Long userId;

    @Column( name = "name")
    private String name;

    @Column( name = "description")
    private String description;

    @Column( name = "price")
    private double price;

    @Column( name = "stock_quantity")
    private int stockQuantity;

}
