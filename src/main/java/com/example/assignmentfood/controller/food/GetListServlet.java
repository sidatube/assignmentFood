package com.example.assignmentfood.controller.food;

import com.example.assignmentfood.entity.Category;
import com.example.assignmentfood.entity.Food;
import com.example.assignmentfood.model.UltraModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

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
        UltraModel<Category> model2 = new UltraModel<>(Category.class);
        ArrayList<Food> list = (ArrayList<Food>) model.getList(pageIndex);
        ArrayList<Category> list2 = (ArrayList<Category>) model2.getList();
        HashMap<Integer,String> cateHashmap = new HashMap<>();
        for (Category cate: list2
             ) {
            cateHashmap.put(cate.getId(),cate.getCategoryName());
        }
        req.setAttribute("listFood",list);
        req.setAttribute("countFood",model.getCount());
        req.setAttribute("listCate",cateHashmap);
        req.getRequestDispatcher("/Admin/Food/index.jsp").forward(req,resp);
    }
}
