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
<br>
<form action="/users">
  <table >
    <tr>
      <td><input hidden="hidden" type="text" name="action" value="findByCountry"></td>

      <td><input type="text" name="country"><button>Search By Country</button></td>
    </tr>
  </table>
</form>
<br>
<form action="/users">
  <table>
    <tr>
      <td>Sắp xếp theo tên</td>
      <td><input hidden="hidden" type="text" name="action" value="sort"></td>
      <td>
        <label><input type="radio" name="sort" value="asc"> Asc</label>
        <label><input type="radio" name="sort" value="desc"> Desc</label>
        <label><input type="radio" name="sort" value="reset"> Reset</label>
      </td>
      <td>
        <button type="submit">Gửi</button>
      </td>
    </tr>
  </table>
</form>
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
