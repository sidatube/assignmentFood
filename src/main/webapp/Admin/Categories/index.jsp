<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.assignmentfood.entity.Category" %>
<%@ page import="com.example.assignmentfood.ulti.PaginationSlave" %>
<%@ page import="com.example.assignmentfood.entity.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Category> list = (ArrayList<Category>) request.getAttribute("listCategory");
    if (list==null){
        list = new ArrayList<>();
    }
    int pageIndex = 1;
    if (request.getParameter("pageIndex") != null && Integer.parseInt(request.getParameter("pageIndex")) != 0) {
        pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
    }
    int totalCount = 1;
    try {
        totalCount = (int) request.getAttribute("totalCate");
    } catch (Exception ignored) {
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
    <title>Categories</title>
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
    <a href="/admin/categories/create" class="btn btn-outline-primary float-right">Create</a>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Category name</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Category cate: list
                 ){%>
        <tr>
            <td><%=cate.getId()%></td>
            <td><%=cate.getCategoryName()%></td>
            <td>
<%--                <button>Detail</button>--%>
<%--                <a href="/categories/detail?id=<%=cate.getId()%>" class="btn btn-outline-primary">Detail</a>--%>
                <a href="/admin/categories/update?id=<%=cate.getId()%>" class="btn btn-outline-success">Update</a>

                <a href="/admin/categories/delete?id=<%=cate.getId()%>" class="btn btn-outline-danger btn-delete">Delete</a>
            </td>
        </tr><%}%>


        </tbody>
    </table>
    <%
        if ( ((float)totalCount / PaginationSlave.pageSize) > 1) {
    %>
    <nav aria-label="...">
        <ul class="pagination">
            <li class="page-item <%if (pageIndex==1){%>disabled<%}%>">
                <a class="page-link" href="?pageIndex=<%=pageIndex-1%>" tabindex="-1">Previous</a>
            </li>
            <%for (int i = 0; i <= totalCount / PaginationSlave.pageSize; i++) {%>
            <li class="page-item  <%if (pageIndex==i+1){%>active<%}%>"><a class="page-link"
                                                                          href="?pageIndex=<%=i+1%>"><%=i + 1%>
            </a></li>
            <%}%>
            <li class="page-item  <%if (pageIndex>(totalCount/10)){%>disabled<%}%>">
                <a class="page-link" href="?pageIndex=<%=pageIndex+1%>">Next</a>
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
