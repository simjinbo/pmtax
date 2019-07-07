package com.en.pmtax.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.en.pmtax.admin.model.dao.AdminDao;
import com.en.pmtax.admin.model.vo.AdminQuestion;
import com.en.pmtax.admin.model.vo.AdminUser;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;

	@Autowired
	private AdminDao adminDao;

	@Override
	public ArrayList<AdminQuestion> selectAdminQuestion(AdminQuestion qPage) {
		return adminDao.selectAdminQuestion(mybatisSession, qPage);
	}

	@Override
	public int selectQuestionCount(AdminQuestion qPage) {
		return adminDao.selectQuestionCount(mybatisSession, qPage);
	}

	@Override
	public int deleteAdminQuestion(int inquiry_no) {
		return adminDao.deleteAdminQuestion(mybatisSession, inquiry_no);
	}

	@Override
	public int selectUserCount(AdminUser uPage) {
		return adminDao.selectUserCount(mybatisSession, uPage);
	}

	@Override
	public ArrayList<AdminUser> selectAdminUser(AdminUser uPage) {
		return adminDao.selectAdminUser(mybatisSession, uPage);
	}

	@Override
	public int updateAdminUser(int user_no) {
		return adminDao.updateAdminUser(mybatisSession, user_no);
	}
}
