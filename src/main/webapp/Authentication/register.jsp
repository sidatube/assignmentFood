
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%    String errors = (String) request.getAttribute("errorCreate");
  String success = (String) request.getAttribute("successCreate");
%>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <% if (!(errors == null || errors
            .length() < 4)) {
    %>
    <div class="alert alert-danger" role="alert">
        <span><%=errors%></span>
    </div>
    <%
        }
    %><% if (!(success == null || success
        .length() < 4)) {
%>
    <div class="alert alert-success" role="alert">
        <span><%=success%>! Click <a href="/login">here</a> to sign in</span>
    </div>
    <%
        }
    %>
    <form action="/register" method="post" class="needs-validation" novalidate>
        <div class="form-group">
            <label for="exampleInputEmail1">Username</label>
            <input type="text" name="username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required placeholder="Enter username">
            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            <div class="invalid-feedback">
                Please enter username.
            </div>
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input type="password" class="form-control" id="exampleInputPassword1" name="password" placeholder="Password" required>
            <div class="invalid-feedback">
                Please enter password.
            </div>
        </div>
        <div class="form-group">
            <label for="confirmPassword">Confirm password</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required placeholder="Confirm password">
            <div class="invalid-feedback">
                Please enter confirm password.
            </div>
        </div>
        <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    <div class="jumbotron">
        <p class="lead">Already have an account? <a href="/login">Sign in</a>.</p>
    </div>
</div>
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
