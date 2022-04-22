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

public class DeleteCartItemController extends HttpServlet {
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
            Cart cart = CartSlaveFactory.getCart(req);
            cart.removeItem(obj);
            CartSlaveFactory.setCart(req,cart);
            resp.setStatus(200);
        }    }
}
