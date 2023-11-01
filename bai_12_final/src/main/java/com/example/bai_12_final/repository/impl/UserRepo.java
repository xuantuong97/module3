package com.example.bai_12_final.repository.impl;

import com.example.bai_12_final.model.User;
import com.example.bai_12_final.repository.IUserRepo;
import com.example.bai_12_final.util.Util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepo implements IUserRepo {
    private final String SELECT_ALL = "select * from users;";
    private final String INSERT_INTO = "insert into users(name, email, country) values (?,?,?);";
    private static final String UPDATE_USER = "update users set name = ?,email= ?, country =? where id = ?;";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";

    private static final String DELETE_USER = "delete from users where id = ?;";

    @Override
    public boolean insertUser(User user)  {
        Connection connection = Util.getConnectDB();

        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            return (preparedStatement.executeUpdate() == 1);
        } catch (SQLException e) {
            return false;
        }
    }

    @Override
    public User selectUser(int id) {
        Connection connection = Util.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id, name, email, country);
                return user;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> userList = new ArrayList<>();
        Connection connection = Util.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String mail = resultSet.getString("email");
                String country = resultSet.getString("country");

                userList.add ( new User(id, name, mail, country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean check;
        Connection connection = Util.getConnectDB();
        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER);
        preparedStatement.setString(1, user.getName());
        preparedStatement.setString(2, user.getEmail());
        preparedStatement.setString(3, user.getCountry());
        preparedStatement.setInt(4, user.getId());

        check = preparedStatement.executeUpdate() > 0;
        return check;
    }
}
