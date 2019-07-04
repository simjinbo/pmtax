package com.en.pmtax.inquiry.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.en.pmtax.inquiry.model.dao.InquiryDao;
import com.en.pmtax.inquiry.model.vo.Inquiry;

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
	
}
