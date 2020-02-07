package com.jt.Service;

import java.util.List;

import com.jt.pojo.User;

public interface UserService {

	List<User> findAll();

	int updataUser(User entity, Integer[] userIds);

	int deleteUser(Integer id);

	
}
