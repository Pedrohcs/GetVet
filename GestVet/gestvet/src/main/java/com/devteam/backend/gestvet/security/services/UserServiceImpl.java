package com.devteam.backend.gestvet.security.services;

import com.devteam.backend.gestvet.model.User;
import com.devteam.backend.gestvet.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository repository;

    @Override
    public User create(User user) {
        return repository.save(user);
    }


    @Override
    public List<User> findAll() {
        List<User> users = repository.findAll();
        users.forEach(user -> user.setPassword(""));
        return users;
    }

    @Override
    public Optional<User> findById(Long id){
        Optional<User> user = repository.findById(id);
        user.get().setPassword("");
        return user;
    }

    @Override
    public User findByName(String name){
        User user = repository.findByName(name);
        user.setPassword("");
        return user;
    }

    @Override
    public User upgrade(User user) {
        User userSave = repository.save(user);
        userSave.setPassword("");
        return user;
    }
}
