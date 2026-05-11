package com.travel.booking.model;

import java.time.LocalDateTime;
import java.util.List;

public class TravelBookingSystem {

    private Long id;
    private String systemName;
    private LocalDateTime createdAt;
    private List<User> users;
    private List<Trip> trips;
    private List<TravelPackage> packages;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSystemName() {
        return systemName;
    }

    public void setSystemName(String systemName) {
        this.systemName = systemName;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public List<Trip> getTrips() {
        return trips;
    }

    public void setTrips(List<Trip> trips) {
        this.trips = trips;
    }

    public List<TravelPackage> getPackages() {
        return packages;
    }

    public void setPackages(List<TravelPackage> packages) {
        this.packages = packages;
    }
}