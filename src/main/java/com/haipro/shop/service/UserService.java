package com.haipro.shop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.haipro.shop.domain.User;
import com.haipro.shop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUsersByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public User getUserById(long id) {
        // List<User> allUsers = this.userRepository.findAll();
        // User userdetail = new User();
        // for (User user : allUsers) {
        // if (user.getId() == id) {
        // userdetail = user;
        // break;
        // }
        // }
        // return userdetail;

        return this.userRepository.findById(id);
    }

    public User handleSaveUser(User user) {
        User haipro = this.userRepository.save(user);
        System.out.println(haipro);
        return haipro;
    }

    public void deleteUserById(long id) {
        this.userRepository.deleteById(id);
    }
}
