package com.en.pmtax.taxinfo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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
	public ArrayList<Taxinfo> selectTaxinfoList(HashMap<String, Object> map) {
		return taxinfoDao.selectTaxinfoList(mybatisSession, map);
	}

	@Override
	public Taxinfo selectTaxinfoDetail(int info_no) {
		return taxinfoDao.selectTaxinfoDetail(mybatisSession, info_no);
	}

	@Override
	public int insertTaxinfo(Taxinfo taxinfo) {
		return taxinfoDao.insertTaxinfo(mybatisSession, taxinfo);
	}

	@Override
	public int deleteTaxinfo(int info_no) {
		return taxinfoDao.deleteTaxinfo(mybatisSession, info_no);
	}

	@Override
	public int updateTaxinfo(Taxinfo taxinfo) {
		return taxinfoDao.updateTaxinfo(mybatisSession, taxinfo);
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return taxinfoDao.getTotalCount(mybatisSession);
	}
}
