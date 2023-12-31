package com.example.bai_12_final.service.impl;

import com.example.bai_12_final.model.User;
import com.example.bai_12_final.repository.IUserRepo;
import com.example.bai_12_final.repository.impl.UserRepo;
import com.example.bai_12_final.service.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    private final IUserRepo userRepo = new UserRepo();
    @Override
    public boolean insertUser(User user) {
        return userRepo.insertUser(user);
    }

    @Override
    public List<User> findByCountry(String country) {
        return userRepo.findByCountry(country);
    }

    @Override
    public User selectUser(int id) {
        return userRepo.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userRepo.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userRepo.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
       return userRepo.updateUser(user);
    }

    @Override
    public List<User> sort(String sort) {
        return userRepo.sort(sort);
    }

    @Override
    public List<User> selectAllByStore() {
        return userRepo.selectAllByStore();
    }

    @Override
    public boolean updateUserStore(User user) throws SQLException {
        return userRepo.updateUserStore(user);
    }

    @Override
    public boolean deleteUserStore(int id) throws SQLException {
        return userRepo.deleteUserStore(id);
    }

}
