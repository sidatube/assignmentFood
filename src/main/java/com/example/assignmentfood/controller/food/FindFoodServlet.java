package com.example.assignmentfood.controller.food;

import com.example.assignmentfood.entity.Category;
import com.example.assignmentfood.entity.Food;
import com.example.assignmentfood.model.UltraModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FindFoodServlet extends HttpServlet {
    UltraModel<Food> model;
    UltraModel<Category> model2;

    public FindFoodServlet() {
        this.model = new UltraModel<>(Food.class);
        this.model2 = new UltraModel<>(Category.class);
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = 0;
        try {
            id = Integer.parseInt(req.getParameter("id"));
        } catch (Exception e) {
            resp.getWriter().println(e);
        }
        if (id <= 0) {
            resp.getWriter().println("Is valid information");
            return;
        }
        Food obj = model.findById(id);
        if (obj == null) {
            resp.setStatus(404);
            resp.getWriter().println("Not found");
            return;
        }
        req.setAttribute("food", obj);
        req.setAttribute("listCategory", model2.getList());
        req.getRequestDispatcher("/Admin/Food/detail.jsp").forward(req, resp);
    }
}
