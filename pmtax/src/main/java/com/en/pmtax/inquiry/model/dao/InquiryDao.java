package com.en.pmtax.inquiry.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.en.pmtax.inquiry.model.vo.Inquiry;
import com.en.pmtax.inquiry.model.vo.Member;

@Repository("inquiryDao")
public class InquiryDao {

	public int insertInquiry(SqlSessionTemplate mybatisSession, Inquiry inquiry) {
		return mybatisSession.insert("inquiryMapper.insertInquiry", inquiry);
	}

	public ArrayList<Member> selectIntroduceMemberView(SqlSessionTemplate mybatisSession) {
		List<Member> selectIntroduceMemberView = mybatisSession.selectList("inquiryMapper.selectIntroduceMemberView");
		return (ArrayList<Member>)selectIntroduceMemberView;
		
	}
	
	public int insertMember(SqlSessionTemplate mybatisSession, Member member) {
		return mybatisSession.insert("inquiryMapper.insertMember", member);
	}
	
	public int updateMember(SqlSessionTemplate mybatisSession, Member member) {
		return mybatisSession.delete("inquiryMapper.updateMember", member);
	}

	public int deleteMember(SqlSessionTemplate mybatisSession, int member_no) {
		return mybatisSession.delete("inquiryMapper.deleteMember", member_no);
	}

}
