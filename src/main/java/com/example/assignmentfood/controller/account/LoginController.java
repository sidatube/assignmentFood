package com.example.assignmentfood.controller.account;

import com.example.assignmentfood.entity.Account;
import com.example.assignmentfood.model.AccountModel;
import com.example.assignmentfood.ulti.PasswordHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

public class LoginController extends HttpServlet {
    private AccountModel model = new AccountModel();
    private static final  int MAX_COUNT = 3;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("Authentication/login.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Account  account =model.findAccountByUsername(username);
        if (account==null){
            req.setAttribute("errorsLog","Invalid information!");
            req.getRequestDispatcher("/Authentication/login.jsp").forward(req,resp);
            return;
        }
        if (account.getStatus()==2){
            if (LocalDateTime.now().compareTo(account.getLockTime())>0){
                account.setStatus(1);
                account.setFailureCount(0);
                model.updateLock(account.getUsername(),account);
            }else {
                req.setAttribute("errorsLog","Account has been locked, please try again after "+account.getLockTime());
                req.getRequestDispatcher("/Authentication/login.jsp").forward(req,resp);
                return;
            }
        }
        if(PasswordHandler.checkPassword(password,account.getPasswordHash(),account.getSalt())){
            req.getSession().setAttribute("currentUser",account);
            resp.sendRedirect("/");
        }else
        {
            account.setFailureCount(account.getFailureCount()+1);
            if (account.getFailureCount()==MAX_COUNT){
                account.setStatus(2);
                account.setLockTime(LocalDateTime.now().plusMinutes(5));
                model.updateLock(account.getUsername(),account);
            }
            req.setAttribute("errorsLog","Invalid information!");
            req.getRequestDispatcher("/Authentication/login.jsp").forward(req,resp);
        }
    }
}
