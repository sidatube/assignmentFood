<%@ page import="com.example.assignmentfood.entity.Food" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.assignmentfood.entity.Category" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    HashMap<String, String> errors = (HashMap<String, String>) request.getAttribute("errors");
    if (errors == null) {
        errors = new HashMap<>();
    }
    String success = (String) request.getAttribute("success");
    String failure = (String) request.getAttribute("failure");
    Food food = (Food) request.getAttribute("food");
    if (food == null) {
        food = new Food();
    }
    ArrayList<Category> list = (ArrayList<Category>) request.getAttribute("listCategory");
    if (list == null) {
        list = new ArrayList<>();
    }

%>
<html>

<head>
    <meta charset="UTF-8">
    <title><%
        if (food.getId() > 0) {
    %>Update<%} else {%>Create
        <%}%></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<style>
    .hide {
        display: none;
    }
</style>
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
        <a href="/foods" class="btn btn-outline-primary md-3">Back</a>

        <%
            if (food.getId() == 0) {
        %>
        <form method="post" action="/foods/create" class="needs-validation" name="form-submit" novalidate>
            <div class="form-row">
                <div class="col-md-8 mb-3">
                    <% if (success != null) {
                    %>
                    <div class="alert alert-success" role="alert">
                        <span><%=success%>! Click <a href="/foods">Here</a> to show list food </span>
                    </div>
                    <%
                        }
                    %>
                    <% if (failure != null) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        <span><%=failure%>! Try again late</span>
                    </div>
                    <%
                        }
                    %>
                    <% if (errors.containsKey("name")) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        <%=errors.get("name")%>
                    </div>
                    <%
                        }
                    %>
                    <label for="foodName">Food name</label>
                    <input type="text" class="form-control" name="name" id="foodName" placeholder="Food"
                           required>
                    <div class="invalid-feedback">
                        Please enter food name.
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-8 mb-3">
                    <% if (errors.containsKey("categoryId")) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        <%=errors.get("categoryId")%>
                    </div>
                    <%
                        }
                    %>
                    <label for="categoryId">Category</label>
                    <select class="form-control" name="categoryId" id="categoryId" aria-label="Default select category"
                            required>
                        <option value="" selected>Open this select menu</option>
                        <%
                            for (Category cate : list
                            ) {
                        %>
                        <option value="<%=cate.getId()%>"><%=cate.getCategoryName()%>
                        </option>
                        <%
                            }%>
                    </select>
                    <div class="invalid-feedback">
                        Please chose category.
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-8 mb-3">
                    <label for="Description">Description</label>
                    <textarea  class="form-control" name="description" id="Description"
                           placeholder="Description"
                    ></textarea>
                    <div class="invalid-feedback">
                        Please enter description.
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-8 mb-3">
                    <label for="Thumbnail">Thumbnail</label>
                    <img src="" style="width: 200px" class="img-thumbnail form-control hide" id="preview-img">
                    <input type="hidden" class="form-control" name="thumbnail" value="<%=food.getThumbnail()%>"
                           id="Thumbnail" placeholder="Thumbnail"
                    >
                    <div class="invalid-feedback">
                        Please enter thumbnail.
                    </div>
                </div>
            </div>
            <button type="button" id="upload_widget" class="btn btn-outline-primary">Upload files</button>
            <div class="form-row">
                <div class="col-md-8 mb-3">
                    <% if (errors.containsKey("price")) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        <%=errors.get("price")%>
                    </div>
                    <%}%>
                    <label for="Price">Price</label>
                    <input type="number" class="form-control" name="price" id="Price" placeholder="Price"
                           required>
                    <div class="invalid-feedback">
                        Please enter price.
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-8 mb-3">
                    <label for="Status">Status</label>
                    <select class="form-control" name="status" id="Status" aria-label="Default select category"
                    >
                        <option value="" selected>Open this select menu</option>

                        <option value="1">On sale
                        </option>
                        <option value="2">Stop selling
                        </option>
                        <option value="3">Deleted
                        </option>

                    </select>
                    <div class="invalid-feedback">
                        Please chose status.
                    </div>
                </div>
            </div>
            <button class="btn btn-primary" type="submit">Submit</button>
        </form>

        <%} else {%>
        <form method="post" action="/foods/update?id=<%=food.getId()%>" name="form-submit" class="needs-validation"
              novalidate>
            <div class="form-row">
                <input type="hidden" name="id" value="<%=food.getId()%>">
                <div class="col-md-8 mb-3">
                    <% if (success != null) {
                    %>
                    <div class="alert alert-success" role="alert">
                        <span><%=success%>! Click <a href="/foods">Here</a> to show list food </span>
                    </div>
                    <%
                        }
                    %>
                    <% if (failure != null) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        <span><%=failure%>! Try again late</span>
                    </div>
                    <%
                        }
                    %>
                    <% if (errors.containsKey("name")) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        <%=errors.get("name")%>
                    </div>
                    <%
                        }
                    %>
                    <label for="foodName">Food name</label>
                    <input type="text" class="form-control" name="name" id="foodName" value="<%=food.getName()%>"
                           placeholder="Food"
                           required>
                    <div class="invalid-feedback">
                        Please enter food name.
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-8 mb-3">
                    <% if (errors.containsKey("categoryId")) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        <%=errors.get("categoryId")%>
                    </div>
                    <%
                        }
                    %>
                    <label for="categoryId">Category</label>
                    <select class="form-control" name="categoryId" id="categoryId" aria-label="Default select category"
                            required>
                        <option value="">Open this select menu</option>
                        <%
                            for (Category cate : list
                            ) {
                        %>
                        <option <%if (cate.getId()== food.getId()){%>selected<%}%>
                                value="<%=cate.getId()%>"><%=cate.getCategoryName()%>
                        </option>
                        <%}%>
                    </select>
                    <div class="invalid-feedback">
                        Please chose category.
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-8 mb-3">
                    <label for="Description">Description</label>
                    <textarea class="form-control" name="description"
                           id="Description"
                           placeholder="Description"
                    ><%=food.getDescription()%></textarea>
                    <div class="invalid-feedback">
                        Please enter description.
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-8 mb-3">
                    <label for="Thumbnail">Thumbnail</label>
                    <img src="<%=food.getThumbnail()%>" style="width: 200px" class="img-thumbnail form-control"
                         id="preview-img">
                    <input type="hidden" class="form-control" name="thumbnail" value="<%=food.getThumbnail()%>"
                           id="Thumbnail" placeholder="Thumbnail"
                    >
                    <div class="invalid-feedback">
                        Please enter thumbnail.
                    </div>
                </div>
            </div>
            <button type="button" id="upload_widget" class="btn btn-outline-primary">Upload files</button>

            <div class="form-row">
                <div class="col-md-8 mb-3">
                    <% if (errors.containsKey("price")) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        <%=errors.get("price")%>
                    </div>
                    <%}%>
                    <label for="Price">Price</label>
                    <input type="number" class="form-control" value="<%=food.getPrice()%>" name="price" id="Price"
                           placeholder="Price"
                           required>
                    <div class="invalid-feedback">
                        Please enter price.
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-8 mb-3">
                    <label for="Status">Status</label>
                    <select class="form-control" name="status" id="Status" aria-label="Default select category"
                    >
                        <option value="" selected>Open this select menu</option>

                        <option <%if (food.getStatus()==1){%>selected<%}%> value="1">On sale
                        </option>
                        <option <%if (food.getStatus()== 2){%>selected<%}%> value="2">Stop selling
                        </option>
                        <option <%if (food.getStatus()==3){%>selected<%}%> value="3">Deleted
                        </option>

                    </select>
                    <div class="invalid-feedback">
                        Please chose status.
                    </div>
                </div>
            </div>
            <button class="btn btn-primary" type="submit">Submit</button>
        </form>

        <%}%>

    </div>

</section>

<script src="https://upload-widget.cloudinary.com/global/all.js" type="text/javascript"></script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script type="text/javascript">


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
    var myWidget = cloudinary.createUploadWidget({
            cloudName: 'thanhbc',
            uploadPreset: 'xzfsuj2g'
        }, (error, result) => {
            if (!error && result && result.event === "success") {
                console.log('Done! Here is the image info: ', result.info);
                var img = document.getElementById("preview-img");
                img.classList.remove("hide");
                img.src = result.info.url
                document.forms['form-submit']['thumbnail'].value = result.info.url

            }
        }
    )

    document.getElementById("upload_widget").addEventListener("click", function () {
        myWidget.open();
    }, false);
</script>

</body>
</html>
