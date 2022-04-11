package com.example.assignmentfood.controller.food;

import com.example.assignmentfood.entity.Category;
import com.example.assignmentfood.entity.Food;
import com.example.assignmentfood.model.UltraModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

public class UpdateFoodServlet extends HttpServlet {
    UltraModel<Food> model;
    UltraModel<Category> model2;

    public UpdateFoodServlet() {
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
        req.getRequestDispatcher("/Admin/Food/_id.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("utf-8");
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
        int status = 0;
        int categoryId = 0;
        double price = 0;
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String thumbnail = req.getParameter("thumbnail");
        req.setAttribute("listCategory", model2.getList());
        try {
            categoryId = Integer.parseInt(req.getParameter("categoryId"));
        } catch (Exception e) {
            System.err.println(e);
        }
        try {
            status = Integer.parseInt(req.getParameter("status"));
        } catch (Exception e) {
            System.err.println(e);
        }
        try {
            price = Double.parseDouble(req.getParameter("price"));
        } catch (Exception e) {
            System.err.println(e);
        }
        obj.setName(name);
        obj.setDescription(description);
        obj.setThumbnail(thumbnail);
        if (status != 0) {
            obj.setStatus(status);
        }
        obj.setPrice(price);
        obj.setCategoryId(categoryId);
        HashMap<String, String> errors;
        errors = obj.getErrors();
        if (model2.findById(categoryId) == null) {
            errors.put("categoryId", "Is valid category");
        }
        if (errors.size() > 0) {
            req.setAttribute("errors", errors);
            req.getRequestDispatcher("/Admin/Food/_id.jsp").forward(req, resp);
            return;
        }
        obj.setUpdatedAt(null);
        if (model.update(id, obj)) {
            resp.sendRedirect("/foods");
        } else {
            req.setAttribute("failure", "Updated fail");
        }

//        req.getRequestDispatcher("/Admin/Food/_id.jsp").forward(req, resp);

    }
}
