package com.example.assignmentfood.controller.category;

import com.example.assignmentfood.entity.Category;
import com.example.assignmentfood.model.UltraModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class GetListCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int pageIndex;
        try {
            pageIndex = Integer.parseInt(req.getParameter("pageIndex"));
        }catch (Exception e){
            pageIndex=1;
        }
        UltraModel<Category> model = new UltraModel<>(Category.class);

        ArrayList<Category> list = (ArrayList<Category>) model.getList(pageIndex);
        req.setAttribute("listCategory",list);
        req.setAttribute("totalCate",model.getCount());
        req.getRequestDispatcher("/Admin/Categories/index.jsp").forward(req,resp);
    }
}
