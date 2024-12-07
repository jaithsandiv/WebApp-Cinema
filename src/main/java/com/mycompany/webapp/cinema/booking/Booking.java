package com.mycompany.webapp.cinema.booking;

public class Booking {
    private int id;
    private String title;
    private String type;
    private double cost;
    private String status;

    public Booking(int id, String title, String type, double cost, String status) {
        this.id = id;
        this.title = title;
        this.type = type;
        this.cost = cost;
        this.status = status;
    }

    // Getters
    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getType() {
        return type;
    }

    public double getCost() {
        return cost;
    }

    public String getStatus() {
        return status;
    }
}
