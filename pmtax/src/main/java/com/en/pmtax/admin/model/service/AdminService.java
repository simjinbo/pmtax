package com.en.pmtax.admin.model.service;

import java.util.ArrayList;

import com.en.pmtax.admin.model.vo.AdminQuestion;
import com.en.pmtax.admin.model.vo.AdminUser;

public interface AdminService {

	ArrayList<AdminQuestion> selectAdminQuestion(AdminQuestion qPage);

	int selectQuestionCount(AdminQuestion qPage);

	int deleteAdminQuestion(int inquiry_no);

	int selectUserCount(AdminUser uPage);

	ArrayList<AdminUser> selectAdminUser(AdminUser uPage);

	int updateAdminUser(int user_no);

}
