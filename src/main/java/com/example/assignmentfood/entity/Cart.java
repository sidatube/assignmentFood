package com.example.assignmentfood.entity;

import java.util.ArrayList;
import java.util.HashMap;

public class Cart {
    private int id;
    private double total;
    private String shipName;
    private String shipPhone;
    private String shipAddress;
    private HashMap<Integer, CartItem> mapItem;

    public Cart() {
        mapItem = new HashMap<>();
    }

    public Cart(int id, double total, String shipName, String shipPhone, String shipAddress, HashMap<Integer, CartItem> mapItem) {
        this.id = id;
        this.total = total;
        this.shipName = shipName;
        this.shipPhone = shipPhone;
        this.shipAddress = shipAddress;
        this.mapItem = mapItem;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getShipName() {
        return shipName;
    }

    public void setShipName(String shipName) {
        this.shipName = shipName;
    }

    public String getShipPhone() {
        return shipPhone;
    }

    public void setShipPhone(String shipPhone) {
        this.shipPhone = shipPhone;
    }

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    public HashMap<Integer, CartItem> getMapItem() {
        return mapItem;
    }

    public ArrayList<CartItem> getListItem() {
        return new ArrayList<>(mapItem.values());
    }

    public void setMapItem(HashMap<Integer, CartItem> mapItem) {
        this.mapItem = mapItem;
    }

    public void addItem(Food obj, int qty) {
        CartItem item = null;
        if (mapItem.containsKey(obj.getId())) {
            item = mapItem.get(obj.getId());
        } else {
            item = new CartItem();
            item.setFoodId(obj.getId());
            item.setFoodName(obj.getName());
            item.setThumbnail(obj.getThumbnail());
            item.setUtilPRice(obj.getPrice());
        }
        item.setQty(item.getQty() + qty);
        mapItem.put(obj.getId(), item);
    }

    public void updateItem(Food obj, int qty) {
        CartItem item = null;
        if (mapItem.containsKey(obj.getId())) {
            item = mapItem.get(obj.getId());
        }
        item.setQty(qty);
        mapItem.put(obj.getId(), item);
    }

    public void removeItem(Food obj) {
        mapItem.remove(obj.getId());
    }

    public void clearCart() {
        mapItem.clear();
    }
}
