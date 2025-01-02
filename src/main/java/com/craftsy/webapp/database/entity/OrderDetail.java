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
@Table(name = "order_details")
public class OrderDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column( name = "id")
    private Long id;

    // many order_details to one product : many to one with products
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "product_id", nullable = false)
    @ToStringExclude
    private Product products;

    @Column( name = "product_id" , insertable = false, updatable = false)
    private Long productId;

    // many order_details to one product : many to one with products
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "order_id", nullable = false)
    @ToStringExclude
    private Order orders;

    @Column( name = "order_id" , insertable = false, updatable = false)
    private Long orderId;

    @Column( name = "quantity")
    private int quantity;

}
