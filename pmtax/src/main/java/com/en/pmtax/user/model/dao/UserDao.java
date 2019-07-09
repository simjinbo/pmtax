package com.en.pmtax.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.en.pmtax.user.model.vo.User;

@Repository("userDao")
public class UserDao {
	
	public User selectUserLogin(SqlSessionTemplate mybatisSession, User user) {
		User loginUser = mybatisSession.selectOne("userMapper.loginUser", user);
		
		return loginUser;
	}

	public int checkDuplicate(SqlSessionTemplate mybatisSession, String userid) {
		int checkDuplicate = mybatisSession.selectOne("userMapper.checkDuplicate", userid);
		
		return checkDuplicate;
	}

	public int enrollUser(SqlSessionTemplate mybatisSession, User user) {
		int enrollUser = mybatisSession.insert("userMapper.insertUser", user);
		
		
		return enrollUser;
	}
}
