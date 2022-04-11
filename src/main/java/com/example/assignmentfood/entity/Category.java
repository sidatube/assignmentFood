package com.example.assignmentfood.entity;

import com.example.assignmentfood.annotation.Column;
import com.example.assignmentfood.annotation.Id;
import com.example.assignmentfood.annotation.Table;

@Table(name = "categories")
public class Category {
    @Id(AutoIncrement = true)
    @Column(name = "id",type = "INT")
    private int id;
    @Column(name = "categoryName",type = "VARCHAR(250)")
    private String categoryName;
    @Column(name = "status",type = "INT DEFAULT 1")
    private int status;

    public Category() {
    this.status=1;
    }
    public Category(int id, String categoryName) {
        this.id = id;
        this.categoryName = categoryName;
        this.status = 1;
    }
    public Category(int id, String categoryName, int status) {
        this.id = id;
        this.categoryName = categoryName;
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", categoryName='" + categoryName + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
