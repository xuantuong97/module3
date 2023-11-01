<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/1/2023
  Time: 2:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/users?action=add" method="post">
  <table>
    <tr>
      <td>Name</td>
      <td><input type="text" name = "name"></td>
    </tr>
    <tr>
      <td>Email</td>
      <td><input type="text" name = "email"></td>
    </tr>
    <tr>
      <td>Country</td>
      <td><input type="text" name = "country"></td>
    </tr>
    <tr>
      <td><button type="submit">Add</button></td>
      <td></td>
    </tr>
  </table>
</form>
</body>
</html>
