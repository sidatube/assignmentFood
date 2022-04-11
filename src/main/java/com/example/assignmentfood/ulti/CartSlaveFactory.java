package com.example.assignmentfood.ulti;

import com.example.assignmentfood.entity.Cart;

import javax.servlet.http.HttpServletRequest;

public class CartSlaveFactory {
    public static final String CART_STRING= "cartShopping";
    public static Cart getCart(HttpServletRequest request) {
        Cart cart = (Cart) request.getSession().getAttribute(CART_STRING);
        if (cart == null) {
            cart = new Cart();
        }
        return cart;
    }
    public static void setCart(HttpServletRequest request,Cart cart){
        request.getSession().setAttribute(CART_STRING,cart);
    }
}
