package com.jt.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jt.mapper.UserMapper;
import com.jt.pojo.User;
@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return userMapper.selectList(null);
	}

	@Override
	public int updataUser(User entity, Integer[] userIds) {
		// TODO Auto-generated method stub
		return userMapper.updateById(entity);
	}

	@Override
	public int deleteUser(Integer id) {
		// TODO Auto-generated method stub
		return userMapper.deleteById(id);
	}

}
