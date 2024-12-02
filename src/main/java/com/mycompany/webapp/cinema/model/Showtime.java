package com.mycompany.webapp.cinema.model;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Showtime {
    private int id;
    private Movie movie; // Reference to Movie object
    private Theatre theatre; // Reference to Theatre object
    private String showDate;
    private Date showTime; 

    // Constructor
    public Showtime(int id, Movie movie, Theatre theatre, String showDate, String showTime) throws ParseException {
        this.id = id;
        this.movie = movie;
        this.theatre = theatre;
        this.showDate = showDate;
        SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
        this.showTime = format.parse(showTime);
    }

    // Getters
    public int getId() {
        return id;
    }

    public Movie getMovie() {
        return movie;
    }

    public Theatre getTheatre() {
        return theatre;
    }

    public String getShowDate() {
        return showDate;
    }

    public Date getShowTime() {
        return showTime;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public void setTheatre(Theatre theatre) {
        this.theatre = theatre;
    }

    public void setShowDate(String showDate) {
        this.showDate = showDate;
    }

    public void setShowTime(String showTime) throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
        this.showTime = format.parse(showTime);
    }
}