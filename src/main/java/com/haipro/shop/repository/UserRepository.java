package com.haipro.shop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.haipro.shop.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User haipro);

    List<User> findByEmail(String email);

    List<User> findByEmailAndAddress(String email, String address);
}
