package com.example.assignmentfood.model;

import com.example.assignmentfood.entity.Category;
import com.example.assignmentfood.entity.Food;
import org.junit.jupiter.api.Test;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import static org.junit.jupiter.api.Assertions.*;

class UltraModelTest {

    @Test
    void save() {

//        UltraModel<Category> model2 = new UltraModel<>(Category.class);
//        model2.save(new Category(1,"ASD"));
        UltraModel<Food> model = new UltraModel<>(Food.class);
        Food food = model.findById(1);
        food.setUpdatedAt(null);
        food.setCreatedAt(food.getCreatedAt());
//        food.setCreatedAt(null);
        model.update(food.getId(),food);
    }

    @Test
    void findByColumns() {
        UltraModel<Category> model2 = new UltraModel<>(Category.class);
        System.out.println(model2.findByColumns("categoryName",new Category(0,"ASD")));
    }
}