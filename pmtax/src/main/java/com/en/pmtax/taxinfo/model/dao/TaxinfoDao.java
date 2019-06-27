package com.en.pmtax.taxinfo.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.en.pmtax.taxinfo.model.vo.Taxinfo;

@Repository("taxinfoDao")
public class TaxinfoDao {

	public ArrayList<Taxinfo> selectTaxinfoList(SqlSessionTemplate mybatisSession) {
		List<Taxinfo> list = mybatisSession.selectList("taxinfoMapper.selectTaxinfoList");
		return (ArrayList<Taxinfo>) list;
	}
}
