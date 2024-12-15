package com.mycompany.webapp.cinema.model;

import java.sql.Date;
import java.sql.Time;

public class Movie {

    private int id;
    private String title;
    private String description;
    private Date release_date;
    private String status;
    private String genre;
    private Time duration;
    private String image_path;
    private Float imdb_rating;
    private String actors;
    private String characters;
    private String director;
    private String produce;
    private String writer;
    private String music;
    private Date last_updated;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getRelease_date() {
        return release_date;
    }

    public void setRelease_date(Date release_date) {
        this.release_date = release_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public Time getDuration() {
        return duration;
    }

    public void setDuration(Time duration) {
        this.duration = duration;
    }

    public String getImage_path() {
        return image_path;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }

    public Float getImdb_rating() {
        return imdb_rating;
    }

    public void setImdb_rating(Float imdb_rating) {
        this.imdb_rating = imdb_rating;
    }

    public String getActors() {
        return actors;
    }

    public void setActors(String actors) {
        this.actors = actors;
    }

    public String getCharacters() {
        return characters;
    }

    public void setCharacters(String characters) {
        this.characters = characters;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getProduce() {
        return produce;
    }

    public void setProduce(String produce) {
        this.produce = produce;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getMusic() {
        return music;
    }

    public void setMusic(String music) {
        this.music = music;
    }

    public Date getLast_updated() {
        return last_updated;
    }

    public void setLast_updated(Date last_updated) {
        this.last_updated = last_updated;
    }
}
