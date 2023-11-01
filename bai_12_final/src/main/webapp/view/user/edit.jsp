<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/1/2023
  Time: 3:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/users?action=edit" method="post">
    <input type="hidden" name = "id" value="${user.getId()}" >
    <table>
        <tr>
            <td>Name</td>
            <td><input type="text" name="name" id="name" value="${user.getName()}"></td>
        </tr>
        <tr>
            <td>Name</td>
            <td><input type="text" name="email" id="email" value="${user.getEmail()}"></td>
        </tr>
        <tr>
            <td>Name</td>
            <td><input type="text" name="country" id="country" value="${user.getCountry()}"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Edit product"></td>
        </tr>
    </table>
</form>
</body>
</html>
