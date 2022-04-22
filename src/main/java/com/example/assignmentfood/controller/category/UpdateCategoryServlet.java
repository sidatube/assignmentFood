package com.example.assignmentfood.controller.category;

import com.example.assignmentfood.entity.Category;
import com.example.assignmentfood.model.UltraModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class UpdateCategoryServlet extends HttpServlet {
    UltraModel<Category> model;

    public UpdateCategoryServlet() {
        this.model = new UltraModel<>(Category.class);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id =0;
        try {
            id = Integer.parseInt(req.getParameter("id"));
        }catch (Exception e){
            resp.getWriter().println(e);
        }
        if (id<=0){
            resp.getWriter().println("Is valid information");
            return;
        }
        Category obj=model.findByPF(id);
        if (obj==null){
            resp.setStatus(404);
            resp.getWriter().println("Not found");
            return;
        }
        req.setAttribute("category",obj);
        req.getRequestDispatcher("/Admin/Categories/_id.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("utf-8");
        String cateName = req.getParameter("categoryName");
        HttpSession session = req.getSession();
        int id =0;
        try {
            id = Integer.parseInt(req.getParameter("id"));
        }catch (Exception e){
            resp.getWriter().println(e);
        }
        if (id<=0){
            resp.getWriter().println("Is valid information");
            return;
        }
        if (cateName == null || cateName.length() <= 4) {
            session.setAttribute("errors", "Category name is invalid");
            req.getRequestDispatcher("/Admin/Categories/_id.jsp").forward(req, resp);
            return;
        }
        //check
        Category cate = new Category();
        cate.setCategoryName(cateName);

        model.update(id,cate);
//        session.setAttribute("success", "Update success");
        resp.sendRedirect("/categories");
//        req.getRequestDispatcher("/Admin/Categories/_id.jsp").forward(req, resp);

    }
}
