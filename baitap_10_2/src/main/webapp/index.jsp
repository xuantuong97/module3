<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <title>Calculator</title>
</head>
<body>
<h1>Simple Calculator
</h1>
<br/>
<form action="/calculator" method="post">
    <table>
        <tr>
            <td><span>First operand</span></td>
            <td><input type="text" name = "num1"></td>
        </tr>
        <tr>
            <td><span>Operator</span></td>
            <td><select name="operator" id="operator">
                <option>Addition</option>
                <option>Multi</option>
                <option>Divide</option>
                <option>Minus</option>
            </select></td>
        </tr>
        <tr>
            <td><span>Second operand</span></td>
            <td><input type="text" name = "num2"></td>
        </tr>
        <tr>
            <td></td>
            <td><button type="submit" name="calculate">Calculator</button></td>
        </tr>
    </table>
</form>
</body>
</html>