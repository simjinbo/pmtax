package com.en.pmtax.user.model.service;

import com.en.pmtax.user.model.vo.User;

public interface UserService {
	
	
	User userLogin(User user);

	int checkDuplicate(String userid);

	int enrollUser(User user);
}
