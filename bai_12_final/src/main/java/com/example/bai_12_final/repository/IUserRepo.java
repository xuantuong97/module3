package com.example.bai_12_final.repository;

import com.example.bai_12_final.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepo {
    public boolean insertUser(User user) ;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;
}
