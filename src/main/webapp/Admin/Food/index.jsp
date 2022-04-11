<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.assignmentfood.entity.Food" %>
<%@ page import="com.example.assignmentfood.entity.Category" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.example.assignmentfood.ulti.PaginationSlave" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Food> list = (ArrayList<Food>) request.getAttribute("listFood");
    int pageIndex = 1;
    if (request.getParameter("pageIndex") != null && Integer.parseInt(request.getParameter("pageIndex")) != 0) {
        pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
    }
    int totalCount = 1;
    try {
        totalCount = (int) request.getAttribute("countFood");
    } catch (Exception ignored) {
    }
    if (list == null) {
        list = new ArrayList<>();
    }
    HashMap<Integer, Category> list2 = (HashMap<Integer, Category>) request.getAttribute("listCate");
    if (list2 == null) {
        list2 = new HashMap<>();
    }
%>
<html>
<head>
    <title>Foods</title>
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
<div class="container">
    <a href="/foods/create" class="btn btn-outline-primary float-right">Create</a>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Food name</th>
            <th scope="col">Image</th>
            <th scope="col">Description</th>
            <th scope="col">Price</th>
            <th scope="col">Category</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Food food : list
            ) {%>
        <tr>
            <td><%=food.getId()%>
            </td>
            <td><%=food.getName()%>
            </td>
            <td><img src="<%=food.getThumbnail()%>" width="200" alt=""></td>
            <td><%=food.getDescription()%>
            </td>
            <td><%=food.getPrice()%> VND</td>
            <td><%if (list2.containsKey(food.getCategoryId())) {%><%=list2.get(food.getCategoryId())%><%} else {%>No
                category<%}%></td>
            <td>
                <%--                <button>Detail</button>--%>
                <a href="/foods/detail?id=<%=food.getId()%>" class="btn btn-outline-primary">Detail</a>
                <a href="/foods/update?id=<%=food.getId()%>" class="btn btn-outline-success">Update</a>
                <a href="/foods/delete?id=<%=food.getId()%>" class="btn btn-outline-danger btn-delete">Delete</a>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
    <%
        if (((float) totalCount / PaginationSlave.pageSize) > 1) {
    %>
    <nav aria-label="...">
        <ul class="pagination">
            <li class="page-item <%if (pageIndex==1){%>disabled<%}%>">
                <a class="page-link" href="/foods?pageIndex=<%=pageIndex-1%>" tabindex="-1">Previous</a>
            </li>
            <%for (int i = 0; i <= totalCount / PaginationSlave.pageSize; i++) {%>
            <li class="page-item  <%if (pageIndex==i+1){%>active<%}%>"><a class="page-link"
                                                                          href="/foods?pageIndex=<%=i+1%>"><%=i + 1%>
            </a></li>
            <%}%>
            <li class="page-item  <%if (pageIndex>(totalCount/10)){%>disabled<%}%>">
                <a class="page-link" href="/foods?pageIndex=<%=pageIndex+1%>">Next</a>
            </li>
        </ul>
    </nav>
    <%
        }%>

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
