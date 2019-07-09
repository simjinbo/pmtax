package com.en.pmtax.user.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.en.pmtax.user.model.dao.UserDao;
import com.en.pmtax.user.model.vo.User;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	@Autowired
	private UserDao userDao;
	
	
	@Override
	public User userLogin(User user) {
		
		return userDao.selectUserLogin(mybatisSession, user);
	}

	@Override
	public int enrollUser(User user) {
		
		return userDao.enrollUser(mybatisSession, user);
	}

	@Override
	public int checkDuplicate(String userid) {
	
		return userDao.checkDuplicate(mybatisSession, userid);
	}



}
