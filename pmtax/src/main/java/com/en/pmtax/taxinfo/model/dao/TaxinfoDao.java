package com.en.pmtax.taxinfo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.en.pmtax.taxinfo.model.vo.Taxinfo;

@Repository("taxinfoDao")
public class TaxinfoDao {

	public ArrayList<Taxinfo> selectTaxinfoList(SqlSessionTemplate mybatisSession, HashMap<String, Object> map) {
		List<Taxinfo> list = mybatisSession.selectList("taxinfoMapper.selectTaxinfoList", map);
		return (ArrayList<Taxinfo>) list;
	}

	public Taxinfo selectTaxinfoDetail(SqlSessionTemplate mybatisSession, int info_no) {
		int result = mybatisSession.update("taxinfoMapper.updateHits", info_no);
		Taxinfo taxinfo = mybatisSession.selectOne("taxinfoMapper.selectTaxinfo", info_no);
		return taxinfo;
	}

	public int insertTaxinfo(SqlSessionTemplate mybatisSession, Taxinfo taxinfo) {
		int result = mybatisSession.insert("taxinfoMapper.insertTaxinfo", taxinfo);
		return result;
	}

	public int deleteTaxinfo(SqlSessionTemplate mybatisSession, int info_no) {
		int result = mybatisSession.delete("taxinfoMapper.deleteTaxinfo", info_no);
		return result;
	}

	public int updateTaxinfo(SqlSessionTemplate mybatisSession, Taxinfo taxinfo) {
		int result = mybatisSession.update("taxinfoMapper.updateTaxinfo", taxinfo);
		return result;
	}

	public int getTotalCount(SqlSessionTemplate mybatisSession) {
		int result = mybatisSession.selectOne("taxinfoMapper.findTotalCount");
		return result;
	}
}
