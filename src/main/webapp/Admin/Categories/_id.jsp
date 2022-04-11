<%@ page import="com.example.assignmentfood.entity.Category" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String errors = (String) session.getAttribute("errors");
    session.removeAttribute("errors");
    String success = (String) session.getAttribute("success");
    session.removeAttribute("success");
    Category category = (Category) request.getAttribute("category");
    if (category == null) {
        category = new Category();
    }
%>
<html>

<head>
    <meta charset="UTF-8">
    <title><%
        if (category.getId() > 0) {
    %>Update<%} else {%>Create
        <%}%></title>
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
</ul>
<section class="section">
    <div class="container">
        <a href="/categories" class="btn btn-outline-primary  mb-3">Back</a>

    <%
        if (category.getId() == 0) {
    %>
        <form method="post" action="/categories/create" class="needs-validation" novalidate>
            <div class="form-row">
                <div class="col-md-8 mb-3">
                    <% if (!(success == null || success
                            .length() < 4)) {
                    %>
                    <div class="alert alert-success" role="alert">
                        <span><%=success%>! Click <a href="/categories">Here</a> to show list category </span>
                    </div>
                    <%
                        }
                    %>
                    <% if (!(errors == null || errors.length() < 4)) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        <%=errors%>
                    </div>
                    <%
                        }
                    %>
                    <label for="categoryName">Category Name</label>
                    <input type="text" class="form-control" name="categoryName" id="categoryName" placeholder="Category"
                           required>
                    <div class="invalid-feedback">
                        Please enter category name.
                    </div>
                </div>
            </div>
            <button class="btn btn-primary" type="submit">Submit</button>
        </form>

    <%} else {%>
        <form method="post" action="/categories/update?id=<%=category.getId()%>" class="needs-validation" novalidate>
            <div class="form-row">
                <div class="col-md-8 mb-3">
                    <input type="hidden" name="id" value="<%=category.getId()%>">
                    <% if (!(success == null || success
                            .length() < 4)) {
                    %>
                    <div class="alert alert-success" role="alert">
                        <span><%=success%>! Click <a href="/categories">Here</a> to show list category </span>
                    </div>
                    <%
                        }
                    %>
                    <% if (!(errors == null || errors.length() < 4)) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        <%=errors%>
                    </div>
                    <%
                        }
                    %>
                    <label for="categoryName">Category Name</label>
                    <input type="text" class="form-control" name="categoryName" id="categoryName" value="<%=category.getCategoryName()%>" placeholder="Category"
                           required>
                    <div class="invalid-feedback">
                        Please enter category name.
                    </div>
                </div>
            </div>
            <button class="btn btn-primary" type="submit">Submit</button>
        </form>
    <%
        }%>
    </div>


</section>

</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
        'use strict';
        window.addEventListener('load', function () {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>
</html>
