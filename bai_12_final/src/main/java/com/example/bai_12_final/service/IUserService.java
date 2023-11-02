package com.example.bai_12_final.service;

import com.example.bai_12_final.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    public boolean insertUser(User user) ;
    List<User> findByCountry(String country);

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;
    List<User> sort(String sort);
    List<User> selectAllByStore();
    boolean updateUserStore(User user) throws SQLException;
    boolean deleteUserStore(int id) throws SQLException;
}
