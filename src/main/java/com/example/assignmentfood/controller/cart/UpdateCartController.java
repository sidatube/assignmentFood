package com.example.assignmentfood.controller.cart;

import com.example.assignmentfood.entity.Cart;
import com.example.assignmentfood.entity.Food;
import com.example.assignmentfood.model.UltraModel;
import com.example.assignmentfood.ulti.CartSlaveFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateCartController extends HttpServlet {
    private UltraModel<Food> model = new UltraModel<>(Food.class);
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = 0;
        int qty = 0;
        try{
            id = Integer.parseInt(req.getParameter("id"));
        }catch (Exception ignored){
        }try{
            qty = Integer.parseInt(req.getParameter("qty"));
        }catch (Exception ignored){
        }
        if (id<=0||qty<=0){
            resp.setStatus(404);
            resp.getWriter().println("Invalid Info");
            return;
        }
        Food food = model.findById(id);
        if (food==null){
            resp.setStatus(404);
            resp.getWriter().println("Food is not exist");
            return;
        }
        Cart cart = CartSlaveFactory.getCart(req);
        cart.updateItem(food, qty);
        CartSlaveFactory.setCart(req, cart);
        req.getSession().setAttribute("AddSuccess", "Add Success");
        resp.sendRedirect("/foods/detail?id="+id);
    }
}
