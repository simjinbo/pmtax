package com.en.pmtax.taxinfo.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.en.pmtax.taxinfo.model.dao.TaxinfoDao;
import com.en.pmtax.taxinfo.model.vo.Taxinfo;

@Service("taxinfoService")
public class TaxinfoServiceImpl implements TaxinfoService{
	@Autowired
	private SqlSessionTemplate mybatisSession;

	@Autowired
	private TaxinfoDao taxinfoDao;
	
	@Override
	public ArrayList<Taxinfo> selectTaxinfoList() {
		return taxinfoDao.selectTaxinfoList(mybatisSession);
	}
}
