package com.haipro.shop.service;

import org.springframework.stereotype.Service;

import com.haipro.shop.domain.User;
import com.haipro.shop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User handleSaveUser(User user) {
        User haipro = this.userRepository.save(user);
        System.out.println(haipro);
        return haipro;
    }
}
