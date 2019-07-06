package com.en.pmtax.inquiry.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.en.pmtax.inquiry.model.dao.InquiryDao;
import com.en.pmtax.inquiry.model.vo.Inquiry;
import com.en.pmtax.inquiry.model.vo.Member;

@Service("inquiryService")
public class InquiryServiceImpl implements InquiryService {
	@Autowired
	private SqlSessionTemplate mybatisSession;

	@Autowired
	private InquiryDao inquiryDao;

	@Override
	public int insertInquiry(Inquiry inquiry) {
		return inquiryDao.insertInquiry(mybatisSession, inquiry);
	}

	@Override
	public ArrayList<Member> selectIntroduceMemberView() {
		return inquiryDao.selectIntroduceMemberView(mybatisSession);
	}

	@Override
	public int insertMember(Member member) {
		return inquiryDao.insertMember(mybatisSession, member);
	}
	
	@Override
	public int updateMember(Member member) {
		return inquiryDao.updateMember(mybatisSession, member);
	}
	
	@Override
	public int deleteMember(int member_no) {
		return inquiryDao.deleteMember(mybatisSession, member_no);
	}

	
}
