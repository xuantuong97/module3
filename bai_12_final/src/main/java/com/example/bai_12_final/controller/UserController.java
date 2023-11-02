package com.example.bai_12_final.controller;

import com.example.bai_12_final.model.User;
import com.example.bai_12_final.service.IUserService;
import com.example.bai_12_final.service.impl.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


@WebServlet(name = "userController", value = "/users")
public class UserController extends HttpServlet {
    private final IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showAdd(req, resp);
                break;
            case "edit":
                showEdit(req, resp);
                break;
            case "delete":
                delete(req, resp);
                break;
            case "findByCountry":
                findByCountry(req, resp);
                break;
            case "sort":
                sort(req, resp);
                break;
            default:
                showAll(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                add(req, resp);
                break;
            case "edit":
                edit(req, resp);
                break;
            default:
                showAll(req, resp);
        }
    }

    private void sort(HttpServletRequest req, HttpServletResponse resp) {
        String sort = req.getParameter("sort");
        if (!sort.equals("reset")) {
            List<User> userList = userService.sort(sort);
            req.setAttribute("userList", userList);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/user/list.jsp");
            try {
                requestDispatcher.forward(req, resp);
            } catch (ServletException | IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            showAll(req, resp);
        }
    }

    private void findByCountry(HttpServletRequest req, HttpServletResponse resp) {
        String country = req.getParameter("country");
        List<User> userList = userService.findByCountry(country);
        req.setAttribute("listUser", userList);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/user/country.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        try {
            userService.deleteUser(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            resp.sendRedirect("/users");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        User user = userService.selectUser(id);
        req.setAttribute("user", user);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/user/edit.jsp");
        requestDispatcher.forward(req, resp);
    }


    private void edit(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        User user = new User(id, name, email, country);
        try {
            userService.updateUser(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
            resp.sendRedirect("/users");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void add(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        User user = new User(name, email, country);
        if (userService.insertUser(user)) {
            resp.sendRedirect("/users");
        } else {
            resp.sendRedirect("view/user/add_fail.jsp");
        }
    }

    private void showAdd(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/user/add.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showAll(HttpServletRequest req, HttpServletResponse resp) {
        List<User> userList = userService.selectAllUsers();
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/user/list.jsp");
        req.setAttribute("userList", userList);
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
