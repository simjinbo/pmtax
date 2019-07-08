package com.en.pmtax.common.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.en.pmtax.taxinfo.model.vo.Taxinfo;

@Repository("commonDao")
public class CommonDao {

	public ArrayList<Taxinfo> selectTaxinfoTop10(SqlSessionTemplate session) {
		List<Taxinfo> list = session.selectList("taxinfoMapper.selectTaxinfoList");
		return (ArrayList<Taxinfo>) list;
	}

}
