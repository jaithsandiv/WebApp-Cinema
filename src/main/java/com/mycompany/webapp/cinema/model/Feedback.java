package com.mycompany.webapp.cinema.model;

public class Feedback {

    private int feedbackId;
    private String comment;
    private int rating; // Change to int


    // Getters and Setters
    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public int getRating() { // Change to int
        return rating;
    }

    public void setRating(int rating) { // Change to int
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

}
