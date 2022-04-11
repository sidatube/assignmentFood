package com.example.assignmentfood.controller.cart;

import com.example.assignmentfood.entity.Cart;
import com.example.assignmentfood.ulti.CartSlaveFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GetCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cart cart = CartSlaveFactory.getCart(req);
        req.setAttribute("cart",cart);
        req.getRequestDispatcher("/Cart/cart.jsp").forward(req, resp);
    }
}
