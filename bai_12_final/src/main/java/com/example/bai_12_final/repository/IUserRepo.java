package com.example.bai_12_final.repository;

import com.example.bai_12_final.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepo {
     boolean insertUser(User user) ;
     List<User> sort(String sort);

     List<User> findByCountry(String country);
     User selectUser(int id);

     List<User> selectAllUsers();

     boolean deleteUser(int id) throws SQLException;

     boolean updateUser(User user) throws SQLException;
}
