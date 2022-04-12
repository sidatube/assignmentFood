<%@ page import="com.example.assignmentfood.entity.Cart" %>
<%@ page import="com.example.assignmentfood.entity.Food" %>
<%@ page import="com.example.assignmentfood.entity.CartItem" %>
<%@ page import="com.example.assignmentfood.entity.Account" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/04/2022
  Time: 12:10 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    Cart cart = (Cart) request.getAttribute("cart");
    if (cart==null){
        cart = new Cart();
    }

    double grandTotal=0;
    Account account = (Account) session.getAttribute("currentUser");
    boolean login = false;
    if (account != null) {
        login = true;
    }
    String Username = account == null ? "Guest" : account.getUsername();
%>
<html>
<head>
    <title>Cart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
<ul class="nav align-items-center">
    <li class="nav-item">
        <a class="nav-link active" href="/"> <img src="../../Image/E6ZdPfXX0AAn-vN.jpg" width="100"
                                                  class="rounded-circle">
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/foods">Food</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/categories">Categories</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/cart">Cart</a>
    </li>
    <li class="nav-item float-right">
        <% if (login) {
        %><%=Username%> <a href="/logout">(Logout)</a>
        <%
        } else {%>
        <a href="/login">Login</a> or <a href="/register">Register</a>
        <%}%>
    </li>
</ul>
<div class="container">
    <a href="/" class="btn btn-outline-primary float-right">Home</a>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Food name</th>
            <th scope="col">Image</th>
            <th scope="col">Qty</th>
            <th scope="col">Price</th>
            <th scope="col">Total</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (CartItem food : cart.getListItem()
            ) {
                grandTotal += food.getTotal();%>
        <tr>
            <td><%=food.getFoodId()%>
            </td>
            <td><%=food.getFoodName()%>
            </td>
            <td><img src="<%=food.getThumbnail()%>" width="200" alt=""></td>
            <td><%=food.getQty()%>
<%--                <form action="/cart/update" method="post">--%>
<%--                    <div class="form-group">--%>
<%--                        <input type="number" value="<%=food.getQty()%>" onchange="document.location.submit()" class="form-control" aria-describedby="emailHelp" placeholder="Qty">--%>
<%--                    </div>--%>
<%--                </form>--%>
            </td>
            <td><%=food.getUtilPRice()%> VND</td>
          <td><%=food.getTotal()%> VND</td>
            <td>
                <%--                <button>Detail</button>--%>
                <a href="/foods/detail?id=<%=food.getFoodId()%>" class="btn btn-outline-primary">Detail</a>
                <a href="/cart/delete?id=<%=food.getFoodId()%>" class="btn btn-outline-danger btn-delete">Delete</a>
            </td>
        </tr>
        <%}%>
        </tbody>
        <tfood>
            <tr>
                <td>Tổng:<%=grandTotal%> VND </td>
            </tr>
        </tfood>
    </table>
</div>
</body>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        let listDeleteBtn = document.querySelectorAll('.btn-delete');
        for (let i = 0; i < listDeleteBtn.length; i++) {
            listDeleteBtn[i].addEventListener('click', function (event) {
                event.preventDefault();
                if (confirm("Are U sure?")) {
                    let xhr = new XMLHttpRequest();
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == 4 && xhr.status == 200) {
                            alert("Deleted!")
                            window.location.reload()
                        }
                    }
                    xhr.open('DELETE', this.href, false);
                    xhr.send();

                }
            })
        }
    })

</script>
</html>
