package com.craftsy.webapp.database.entity;

import jakarta.persistence.*;
import lombok.*;
import org.apache.commons.lang3.builder.ToStringExclude;

import java.sql.Timestamp;
import java.util.List;

@Entity
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Table( name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column( name = "id")
    private Integer id;

    //  one Order to many orderDetails : One to Many for order details
    @OneToMany(mappedBy = "order", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @ToString.Exclude
    private List<OrderDetail> orderDetails;

    //many to one with users table
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false , insertable = false, updatable = false)
    @ToString.Exclude
    private User user;

    @Column( name = "user_id")
    private Integer userId;

    @Column( name = "order_date")
    private Timestamp orderDate;

    @Column( name = "order_status")
    private String orderStatus;

}
