/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.webapp.cinema.model;

/**
 *
 * @author M S I
 */

 
public class OrderDetails {
    private String movieName;
    private float price;
    private float tax;
    private float total;

    public OrderDetails(String movieName, float price, float tax, float total) {
        this.movieName = movieName;
        this.price = price;
        this.tax = tax;
        this.total = total;
    }

    public String getMovieName() {
        return movieName;
    }

    public String getPrice() {
        return String.format("%.2f", price);
    }

    public String getTax() {
        return String.format("%.2f", tax);
    }

    public String getTotal() {
        return String.format("%.2f", total);
    }
}
