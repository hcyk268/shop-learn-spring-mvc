package com.haipro.shop.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.haipro.shop.domain.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    User save(User haipro);
}
