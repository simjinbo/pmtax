package com.en.pmtax.common.model.service;

import java.util.ArrayList;

import com.en.pmtax.taxinfo.model.vo.Taxinfo;

public interface CommonService {

	ArrayList<Taxinfo> selectTaxinfoTop10();
}
