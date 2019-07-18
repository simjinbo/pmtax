package com.en.pmtax.intro.model.service;

import java.util.ArrayList;

import com.en.pmtax.intro.model.vo.IService;
import com.en.pmtax.intro.model.vo.Intro;

public interface IntroService {

	Intro getIntro();

	ArrayList<IService> getServiceList();

	int deleteService(int service_no);

	int insertService(IService service);

	int updateService(IService iservice);

	int updateIntro(Intro intro);
	
}
