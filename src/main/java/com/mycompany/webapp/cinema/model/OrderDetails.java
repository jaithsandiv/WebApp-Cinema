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
    private final String movieName;
    private final float subtotal;
    private final float tax;
    private final float total;

    // Constructor to initialize OrderDetail with movie details
    public OrderDetails(String movieName, String subtotal, String tax, String total) {
        this.movieName = movieName;
        this.subtotal = Float.parseFloat(subtotal);
        this.tax = Float.parseFloat(tax);
        this.total = calculateTotal();
    }

    // Getters for the fields
    private float calculateTotal(){
          return this.subtotal + this.tax;

    }
    public String getMovieName() {
        return movieName;
    }

    public String getSubtotal() {
        return String.format("%.2f", subtotal);
    }

    public String getTax() {
        return String.format("%.2f", tax);
    }

    public String getTotal() {
        return String.format("%.2f", total);
    }
     
}
