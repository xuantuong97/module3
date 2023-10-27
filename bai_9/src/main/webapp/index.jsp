<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10/27/2023
  Time: 1:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Calculator</title>
</head>
<body>
<form action="/calculator" method="post">
  <input name="productDescription"  placeholder="Product Description">
  <input name="price"  placeholder="List Price">
  <input name="discount"  placeholder="Discount Percent">
  <button type="submit">Calculator</button>
</form>
</body>
</html>
