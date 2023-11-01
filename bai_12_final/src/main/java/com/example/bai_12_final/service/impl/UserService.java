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
    public User selectUser(int id) {
        return userRepo.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userRepo.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
       return userRepo.updateUser(user);
    }
}
