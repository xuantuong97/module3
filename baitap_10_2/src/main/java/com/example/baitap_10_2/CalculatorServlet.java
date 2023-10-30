package com.example.baitap_10_2;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "calculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    private static double calculate(float num1, float num2, String calculator){

        switch (calculator){
            case "Addition" : return num1 + num2;
            case "Multi" : return num1 *num2;
            case "Divide": return num1/num2;
            default:  return num1 - num2;

        }
    }

    private static String mark(String mark){
        switch (mark){
            case "Addition" : return "+";
            case "Multi" : return "*";
            case "Divide": return "/";
            default:  return "-";

        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        float num1 = Float.parseFloat(req.getParameter("num1"));
        float num2 = Float.parseFloat(req.getParameter("num2"));
        String operator = req.getParameter("operator");

        double result = calculate(num1, num2, operator);
        String mark = mark(operator);

        req.setAttribute("num1", num1);
        req.setAttribute("num2", num2);
        req.setAttribute("mark", mark);
        req.setAttribute("result", result);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/result.jsp");
        requestDispatcher.forward(req, resp);
    }
}
