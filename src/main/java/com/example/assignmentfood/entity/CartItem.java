package com.example.assignmentfood.entity;

public class CartItem {
    private int foodId;
    private String foodName;
    private String thumbnail;
    private int qty;
    private double utilPRice;
    public CartItem() {
    }
    public CartItem(int foodId, String foodName, String thumbnail, int qty, double utilPRice) {
        this.foodId = foodId;
        this.foodName = foodName;
        this.thumbnail = thumbnail;
        this.qty = qty;
        this.utilPRice = utilPRice;
    }

    public double getTotal() {
        return qty*utilPRice;
    }

    public int getFoodId() {
        return foodId;
    }

    public void setFoodId(int foodId) {
        this.foodId = foodId;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public double getUtilPRice() {
        return utilPRice;
    }

    public void setUtilPRice(double utilPRice) {
        this.utilPRice = utilPRice;
    }
}

