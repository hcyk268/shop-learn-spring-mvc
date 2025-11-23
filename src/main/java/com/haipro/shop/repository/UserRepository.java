package com.haipro.shop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.haipro.shop.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User haipro);

    List<User> findByEmail(String email);

    List<User> findByEmailAndAddress(String email, String address);

    List<User> findAll();

    User findById(long id);

    void deleteById(long id);
}
