package com.mycompany.webapp.cinema.model;

public class Seat {
    private String seatNumber;
    private int showtimeId;
    private String seatStatus;

    public Seat() {
    }

    public Seat(String seatNumber, int showtimeId, String seatStatus) {
        this.seatNumber = seatNumber;
        this.showtimeId = showtimeId;
        this.seatStatus = seatStatus;
    }

    public String getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(String seatNumber) {
        this.seatNumber = seatNumber;
    }

    public int getShowtimeId() {
        return showtimeId;
    }

    public void setShowtimeId(int showtimeId) {
        this.showtimeId = showtimeId;
    }

    public String getSeatStatus() {
        return seatStatus;
    }

    public void setSeatStatus(String seatStatus) {
        this.seatStatus = seatStatus;
    }
}
