package com.example.bai_12_final.repository.impl;

import com.example.bai_12_final.model.User;
import com.example.bai_12_final.repository.IUserRepo;
import com.example.bai_12_final.util.Util;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepo implements IUserRepo {
    private final String SELECT_ALL = "select * from users;";
    private String SELECT_ALL_STORE = "{call getAll()};";
    private final String INSERT_INTO = "insert into users(name, email, country) values (?,?,?);";
    private static final String UPDATE_USER = "update users set name = ?,email= ?, country =? where id = ?;";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private final String UPDATE_USER_STORE = "call edit_user(?,?,?,?);";
    private static final String DELETE_USER = "delete from users where id = ?;";
    private final String INSERT_INTO_TEST = "insert into test_table(id) values (?);";
    private final String FIND_BY_COUNTRY = "select * from users where country like ?;";
    private final String SORT = "SELECT * FROM users ORDER BY name %s;";
    private final String DELETE_USER_STORE = "{call delete_user(?)};";

    @Override
    public boolean insertUser(User user) {
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

            while (resultSet.next()) {
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
    public List<User> sort(String sort) {
        List<User> userList = new ArrayList<>();
        Connection connection = Util.getConnectDB();
        try {
            String query = String.format(SORT, sort);
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(name, email, country);
                userList.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    @Override
    public List<User> findByCountry(String country) {
        List<User> userList = new ArrayList<>();
        Connection connection = Util.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_COUNTRY);
            preparedStatement.setString(1, "%" + country + "%");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country1 = resultSet.getString("country");
                User user = new User(name, email, country1);
                userList.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> userList = new ArrayList<>();
        Connection connection = Util.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String mail = resultSet.getString("email");
                String country = resultSet.getString("country");
                userList.add(new User(id, name, mail, country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    @Override
    public List<User> selectAllByStore() {
        List<User> userList = new ArrayList<>();
        Connection connection = Util.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String mail = resultSet.getString("email");
                String country = resultSet.getString("country");
                userList.add(new User(id, name, mail, country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        Connection connection = Util.getConnectDB();
        PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER);
        preparedStatement.setInt(1, id);
        return preparedStatement.executeUpdate() > 0;
    }

    @Override
    public boolean deleteUserStore(int id) throws SQLException {
        Connection connection = Util.getConnectDB();
        CallableStatement callableStatement = connection.prepareCall(DELETE_USER_STORE);
        callableStatement.setInt(1, id);
        return callableStatement.executeUpdate() > 0;
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

    @Override
    public boolean updateUserStore(User user) {
        boolean check = false;
        Connection connection = Util.getConnectDB();
        try {
            connection.setAutoCommit(false);
            CallableStatement callableStatement = connection.prepareCall(UPDATE_USER_STORE);
            callableStatement.setInt(1, user.getId());
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getEmail());
            callableStatement.setString(4, user.getCountry());
            check = callableStatement.executeUpdate() > 0;

            /*thực hiện tạo lỗi đây do insert vào 1 bảng chưa được tạo, thông tin user
            đã được cập nhật nhưng chưa được commit, khi gặp lỗi trước commit, luồng thực thi sẽ đi vào
            khối catch và thực hiện rollback về trạng thái cũ, dữ liệu vẫn chưa được cập nhật*/

            CallableStatement callableStatement1 = connection.prepareCall(INSERT_INTO_TEST);
            callableStatement1.setInt(1, user.getId());
            callableStatement1.executeUpdate();
            connection.commit();
            return check;
        } catch (SQLException e) {
            try {
                connection.rollback();
                return check;
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
        }
    }
}
