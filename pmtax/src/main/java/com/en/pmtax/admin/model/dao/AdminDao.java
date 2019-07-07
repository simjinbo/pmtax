package com.en.pmtax.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.en.pmtax.admin.model.vo.AdminQuestion;
import com.en.pmtax.admin.model.vo.AdminUser;

@Repository("adminDao")
public class AdminDao {

	public ArrayList<AdminQuestion> selectAdminQuestion(SqlSessionTemplate mybatisSession, AdminQuestion qPage) {
		List<AdminQuestion> list = mybatisSession.selectList("adminMapper.selectAdminQuestion", qPage);
		return (ArrayList<AdminQuestion>)list;
	}

	public int selectQuestionCount(SqlSessionTemplate mybatisSession, AdminQuestion qPage) {
		return mybatisSession.selectOne("adminMapper.selectQuestionCount", qPage);
	}

	public int deleteAdminQuestion(SqlSessionTemplate mybatisSession, int inquiry_no) {
		return mybatisSession.delete("adminMapper.deleteAdminQuestion", inquiry_no);
	}

	public ArrayList<AdminUser> selectAdminUser(SqlSessionTemplate mybatisSession, AdminUser uPage) {
		List<AdminUser> list = mybatisSession.selectList("adminMapper.selectAdminUser", uPage);
		return (ArrayList<AdminUser>)list;
	}

	public int selectUserCount(SqlSessionTemplate mybatisSession, AdminUser uPage) {
		return mybatisSession.selectOne("adminMapper.selectUserCount", uPage);
	}

	public int updateAdminUser(SqlSessionTemplate mybatisSession, int user_no) {
		return mybatisSession.update("adminMapper.updateAdminUser", user_no);
	}

}
