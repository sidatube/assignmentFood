<%@ page import="com.example.assignmentfood.entity.Food" %>
<%@ page import="com.example.assignmentfood.entity.Account" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 07/04/2022
  Time: 10:17 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String success = (String) session.getAttribute("AddSuccess");
    session.removeAttribute("AddSuccess");
    Food food = (Food) request.getAttribute("food");
    if (food == null) {
        food = new Food();
    }
    Account account = (Account) session.getAttribute("currentUser");
    boolean login = false;
    if (account != null) {
        login = true;
    }
    String Username = account == null ? "Guest" : account.getUsername();
%>

<html>
<head>
    <title>Detail</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
    integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
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
    <a href="/foods" class="btn btn-outline-primary  mb-3">Back</a>
    <% if (success != null) {
    %>
    <div class="alert alert-success" role="alert">
        <span><%=success%>! Click <a href="/cart">Here</a> to show cart </span>
    </div>
    <%
        }
    %>
    <div class="card">
        <div class="container-fliud">
            <div class="wrapper row">
                <div class="preview col-md-6">

                    <div class="preview-pic tab-content">
                        <div class="tab-pane active" id="pic-1"><img style="width: 500px" src="<%=food.getThumbnail()%>" /></div>
                    </div>


                </div>
                <div class="details col-md-6">
                    <h3 class="product-title"><%=food.getName()%></h3>

                    <p class="product-description"><%=food.getDescription()%></p>
                    <h4 class="price">current price: <span><%=food.getPrice()%> VND</span></h4>
                    <form  class="action" method="get" action="/cart/add">
                        <div class="form-group">
                            <label for="formGroupExampleInput2">Quantity</label>
                            <input type="hidden" value="<%=food.getId()%>" name="id">
                            <input type="number" value="1" class="form-control mb-2 w-50" id="formGroupExampleInput2" name="qty" placeholder="Quantity">
                            <button  class=" btn btn-outline-primary" type="submit">add to cart</button>
                        </div>
                    </form>

                </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
