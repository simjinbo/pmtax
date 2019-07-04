package com.en.pmtax.inquiry.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.en.pmtax.inquiry.model.vo.Inquiry;

@Repository("inquiryDao")
public class InquiryDao {

	public int insertInquiry(SqlSessionTemplate mybatisSession, Inquiry inquiry) {
		return mybatisSession.insert("inquiryMapper.insertInquiry", inquiry);
	}

}
