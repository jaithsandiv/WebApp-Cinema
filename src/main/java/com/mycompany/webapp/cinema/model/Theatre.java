package com.mycompany.webapp.cinema.model;

public class Theatre {
    private int id;
    private String name;
    private String location;
    private String image_path;

    // Getters and Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }
    public String getImagePath() {
        return image_path;
    }
    public void setImagePath(String image_path) {
        this.image_path = image_path;
    }
}