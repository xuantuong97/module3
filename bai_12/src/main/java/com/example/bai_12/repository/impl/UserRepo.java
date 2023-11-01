package com.example.bai_12.repository.impl;

import com.example.bai_12.model.User;
import com.example.bai_12.repository.IUserRepo;

import java.sql.SQLException;
import java.util.List;

public class UserRepo implements IUserRepo {
    @Override
    public void insertUser(User user) throws SQLException {

    }

    @Override
    public User selectUser(int id) {
        return null;
    }

    @Override
    public List<User> selectAllUsers() {
        return null;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return false;
    }
}
