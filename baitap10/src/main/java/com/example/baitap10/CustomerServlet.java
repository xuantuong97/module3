package com.example.baitap10;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "customerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Kiệt", "23/09/2003","Đà Nẵng","https://i.imgur.com/glwLLhL.png"));
        customerList.add(new Customer("Kiệt", "23/09/2003","Đà Nẵng","https://i.imgur.com/glwLLhL.png"));
        customerList.add(new Customer("Kiệt", "23/09/2003","Đà Nẵng","https://i.imgur.com/glwLLhL.png"));
        customerList.add(new Customer("Kiệt", "23/09/2003","Đà Nẵng","https://i.imgur.com/glwLLhL.png"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("customerList", customerList);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("list.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
