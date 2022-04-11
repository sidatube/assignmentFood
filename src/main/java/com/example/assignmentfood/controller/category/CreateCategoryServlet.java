package com.example.assignmentfood.controller.category;

import com.example.assignmentfood.entity.Category;
import com.example.assignmentfood.model.UltraModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class CreateCategoryServlet extends HttpServlet {
    private UltraModel<Category> modelCate;

    public CreateCategoryServlet() {
        this.modelCate = new UltraModel<>(Category.class);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/Admin/Categories/_id.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String cateName = req.getParameter("categoryName");
        HttpSession session = req.getSession();
        //validate
        if (cateName == null || cateName.length() <= 4) {
            session.setAttribute("errors", "Category name is invalid");
            req.getRequestDispatcher("/Admin/Categories/_id.jsp").forward(req, resp);
            return;
        }
        //check
        Category cate = new Category();
        cate.setCategoryName(cateName);
        if (modelCate.isHasObj("categoryName", cate)) {
            session.setAttribute("errors", cate.getCategoryName() + " already exists");
            req.getRequestDispatcher("/Admin/Categories/_id.jsp").forward(req, resp);
            return;
        }
        modelCate.save(cate);
        session.setAttribute("success", "Create success");

        req.getRequestDispatcher("/Admin/Categories/_id.jsp").forward(req, resp);

    }
}
