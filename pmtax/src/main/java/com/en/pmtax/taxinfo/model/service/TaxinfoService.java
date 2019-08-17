package com.en.pmtax.taxinfo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.en.pmtax.taxinfo.model.vo.Taxinfo;

public interface TaxinfoService {
	ArrayList<Taxinfo> selectTaxinfoList(HashMap<String, Object> map);

	Taxinfo selectTaxinfoDetail(int info_no);

	int insertTaxinfo(Taxinfo taxinfo);

	int deleteTaxinfo(int info_no);

	int updateTaxinfo(Taxinfo taxinfo);

	int getTotalCount();
}
