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
    private Integer id;

    // many order_details to one product : many to one with products
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "product_id", nullable = false, insertable = false, updatable = false)
    @ToString.Exclude
    private Product product;

    @Column( name = "product_id")
    private Integer productId;

    // many order_details to one order : many to one with products
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "order_id", nullable = false, insertable = false, updatable = false)
    @ToString.Exclude
    private Order order;

    @Column( name = "order_id")
    private Integer orderId;

    @Column( name = "quantity", columnDefinition = "bigint")
    private Integer quantity;

}
