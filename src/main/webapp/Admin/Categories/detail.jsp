<%@ page import="com.example.assignmentfood.entity.Account" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 07/04/2022
  Time: 10:17 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Account account = (Account) session.getAttribute("currentUser");
    boolean login = false;
    if (account != null) {
        login = true;
    }
    String Username = account == null ? "Guest" : account.getUsername();
%>
<html>
<head>
    <title>Title</title>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
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
    <div class="card">
        <div class="container-fliud">
            <div class="wrapper row">
                <div class="preview col-md-6">

                    <div class="preview-pic tab-content">
                        <div class="tab-pane active" id="pic-1"><img src="http://placekitten.com/400/252" /></div>
                        <div class="tab-pane" id="pic-2"><img src="http://placekitten.com/400/252" /></div>
                        <div class="tab-pane" id="pic-3"><img src="http://placekitten.com/400/252" /></div>
                        <div class="tab-pane" id="pic-4"><img src="http://placekitten.com/400/252" /></div>
                        <div class="tab-pane" id="pic-5"><img src="http://placekitten.com/400/252" /></div>
                    </div>
                    <ul class="preview-thumbnail nav nav-tabs">
                        <li class="active"><a data-target="#pic-1" data-toggle="tab"><img src="http://placekitten.com/200/126" /></a></li>
                        <li><a data-target="#pic-2" data-toggle="tab"><img src="http://placekitten.com/200/126" /></a></li>
                        <li><a data-target="#pic-3" data-toggle="tab"><img src="http://placekitten.com/200/126" /></a></li>
                        <li><a data-target="#pic-4" data-toggle="tab"><img src="http://placekitten.com/200/126" /></a></li>
                        <li><a data-target="#pic-5" data-toggle="tab"><img src="http://placekitten.com/200/126" /></a></li>
                    </ul>

                </div>
                <div class="details col-md-6">
                    <h3 class="product-title">men's shoes fashion</h3>
                    <div class="rating">
                        <div class="stars">
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                        </div>
                        <span class="review-no">41 reviews</span>
                    </div>
                    <p class="product-description">Suspendisse quos? Tempus cras iure temporibus? Eu laudantium cubilia sem sem! Repudiandae et! Massa senectus enim minim sociosqu delectus posuere.</p>
                    <h4 class="price">current price: <span>$180</span></h4>
                    <p class="vote"><strong>91%</strong> of buyers enjoyed this product! <strong>(87 votes)</strong></p>
                    <h5 class="sizes">sizes:
                        <span class="size" data-toggle="tooltip" title="small">s</span>
                        <span class="size" data-toggle="tooltip" title="medium">m</span>
                        <span class="size" data-toggle="tooltip" title="large">l</span>
                        <span class="size" data-toggle="tooltip" title="xtra large">xl</span>
                    </h5>
                    <h5 class="colors">colors:
                        <span class="color orange not-available" data-toggle="tooltip" title="Not In store"></span>
                        <span class="color green"></span>
                        <span class="color blue"></span>
                    </h5>
                    <div class="action">
                        <button class="add-to-cart btn btn-default" type="button">add to cart</button>
                        <button class="like btn btn-default" type="button"><span class="fa fa-heart"></span></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
