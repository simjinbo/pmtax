package com.en.pmtax.inquiry.model.service;

import java.util.ArrayList;

import com.en.pmtax.inquiry.model.vo.Inquiry;
import com.en.pmtax.inquiry.model.vo.Member;

public interface InquiryService {

	int insertInquiry(Inquiry inquiry);
	ArrayList<Member> selectIntroduceMemberView();
	int insertMember(Member member);
	int updateMember(Member member);
	int deleteMember(int member_no);

}
