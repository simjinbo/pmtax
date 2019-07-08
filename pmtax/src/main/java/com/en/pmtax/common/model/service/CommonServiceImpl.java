package com.en.pmtax.common.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.en.pmtax.common.model.dao.CommonDao;
import com.en.pmtax.taxinfo.model.vo.Taxinfo;

@Service("commonService")
public class CommonServiceImpl implements CommonService {
	@Autowired
	private SqlSessionTemplate session;

	@Autowired
	private CommonDao commonDao;

	@Override
	public ArrayList<Taxinfo> selectTaxinfoTop10() {	
		return commonDao.selectTaxinfoTop10(session);
	}

}
