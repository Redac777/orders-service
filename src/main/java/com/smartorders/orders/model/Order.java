package com.smartorders.orders.model;
import jakarta.persistence.*;
import lombok.Data;


@Data
@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String product;

    private Integer quantity;

    private String status;
}
