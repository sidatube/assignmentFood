package com.example.assignmentfood.controller.food;

import com.example.assignmentfood.entity.Category;
import com.example.assignmentfood.entity.Food;
import com.example.assignmentfood.model.UltraModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteFoodServlet extends HttpServlet {
    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UltraModel<Food> model = new UltraModel<>(Food.class);
        int id =0;
        try {
            id = Integer.parseInt(req.getParameter("id"));

        }catch (Exception e){
            resp.getWriter().println("Invalid Id");
        }
        Food  obj = model.findByPF(id);
        if (obj == null) {
            resp.setStatus(404);
            resp.getWriter().println("Not found");
        } else {
            model.delete(id,3);
            resp.setStatus(200);
        }
    }
}
