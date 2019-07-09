package com.en.pmtax.intro.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.en.pmtax.intro.model.dao.IntroDao;
import com.en.pmtax.intro.model.vo.IService;
import com.en.pmtax.intro.model.vo.Intro;

@Service("introService")
public class IntroServiceImpl implements IntroService {
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	@Autowired
	private IntroDao introDao;

	@Override
	public Intro getIntro() {
		return introDao.getIntro(mybatisSession);
	}

	@Override
	public ArrayList<IService> getServiceList() {
		return introDao.getServiceList(mybatisSession);
	}

	@Override
	public int deleteService(int service_no) {
		
		return introDao.deleteService(service_no, mybatisSession);
	}

	@Override
	public int insertService(IService service) {

		return introDao.insertService(mybatisSession, service);
	}

	@Override
	public int updateService(IService iservice) {

		return introDao.updateService(iservice,mybatisSession);
	}
	
	
}
