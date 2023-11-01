<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/1/2023
  Time: 5:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table >
  <tr>
    <th>No.</th>
    <th>Name</th>
    <th>Email</th>
    <th>Country</th>
    <th>Edit</th>
    <th>Delete</th>
  </tr>
  <c:forEach items="${listUser}" var="user" varStatus="status">
    <tr>
      <td>${status.count}</td>
      <td>${user.name}</td>
      <td>${user.email}</td>
      <td>${user.country}</td>

      <td><a href="/users?action=edit&id=${user.getId()}">
        <button>Edit</button>
      </a></td>
      <td><a href="/users?action=delete&id=${user.getId()}">
        <button>Delete</button>
      </a></td>
    </tr>
  </c:forEach>
</table>
<button type="button"><a href="/users">Back</a></button>
</body>
</html>
