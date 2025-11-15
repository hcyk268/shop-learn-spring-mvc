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

    public User handleSaveUser(User user) {
        User haipro = this.userRepository.save(user);
        System.out.println(haipro);
        return haipro;
    }
}
