<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/1/2023
  Time: 1:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>Danh sách user</p>
<br>
<button type="button"><a href="/users?action=add">Add new</a></button>
<form action="/users" method="post">
  <table>
    <tr>
      <td>ID</td>
      <td>Name</td>
      <td>Email</td>
      <td>Country</td>
      <td>Edit</td>
      <td>Delete</td>
    </tr>
    <c:forEach items="${userList}" var="user" varStatus="status">
      <tr>
        <td>${status.count}</td>
        <td>${user.name}</td>
        <td>${user.email}</td>
        <td>${user.country}</td>
        <td><button type="button"><a href="/users?action=edit&id=${user.getId()}">Edit
        </a></button></td>
        <td><button type="button"><a href="/users?action=delete&id=${user.getId()}">Delete
        </a></button></td>
      </tr>
    </c:forEach>
  </table>
</form>
</body>
</html>
