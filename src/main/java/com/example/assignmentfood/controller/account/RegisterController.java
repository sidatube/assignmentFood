package com.example.assignmentfood.controller.account;

import com.example.assignmentfood.entity.Account;
import com.example.assignmentfood.model.UltraModel;
import com.example.assignmentfood.ulti.PasswordHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Calendar;

public class RegisterController extends HttpServlet {
    private UltraModel<Account> model = new UltraModel<>(Account.class);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/Authentication/register.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
//        Validate
        if (!password.equals(confirmPassword)){
            req.setAttribute("errorCreate","Error, password wasn't same confirm password");
            req.getRequestDispatcher("/Authentication/register.jsp").forward(req,resp);
            return;
        }
        Account acc = new Account();
        acc.setUsername(username);
        acc.setSalt(PasswordHandler.generateSalt());
        String passHash = PasswordHandler.getMd5(password,acc.getSalt());
        acc.setPasswordHash(passHash);
        acc.setCreatedAt(Calendar.getInstance().getTime().toString());
        if (model.save(acc)){
            req.setAttribute("successCreate","Create success");
            req.getRequestDispatcher("/Authentication/register.jsp").forward(req,resp);

        }
        else {
            req.setAttribute("errorCreate","Error, please try again late!");
            req.getRequestDispatcher("/Authentication/register.jsp").forward(req,resp);
        }
    }
}
