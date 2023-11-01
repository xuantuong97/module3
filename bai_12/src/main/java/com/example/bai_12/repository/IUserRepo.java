package com.example.bai_12.repository;

import com.example.bai_12.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepo {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

}
