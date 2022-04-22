package com.example.assignmentfood.controller.food;

import com.example.assignmentfood.entity.Food;
import com.example.assignmentfood.model.UltraModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class GetListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageIndex;
        try {
            pageIndex = Integer.parseInt(req.getParameter("pageIndex"));
        }catch (Exception e){
            pageIndex=1;
        }
        UltraModel<Food> model = new UltraModel<>(Food.class);
        ArrayList<Food> list = (ArrayList<Food>) model.getList(pageIndex);
        req.setAttribute("listFood",list);
        req.setAttribute("countFood",model.getCount());
        req.getRequestDispatcher("/Admin/Food/index.jsp").forward(req,resp);
    }
}
