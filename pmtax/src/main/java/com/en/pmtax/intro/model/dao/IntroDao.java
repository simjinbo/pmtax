package com.en.pmtax.intro.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.en.pmtax.intro.model.vo.IService;
import com.en.pmtax.intro.model.vo.Intro;

@Repository("introDao")
public class IntroDao {

	public Intro getIntro(SqlSessionTemplate mybatisSession) {
		Intro intro = mybatisSession.selectOne("introMapper.getIntro");
		
		return intro; 
	}

	public ArrayList<IService> getServiceList(SqlSessionTemplate mybatisSession) {
		List<IService> slist = mybatisSession.selectList("introMapper.getServiceList");
		return (ArrayList<IService>)slist;
	}

	public int deleteService(int service_no, SqlSessionTemplate mybatisSession) {
		int result = mybatisSession.delete("introMapper.deleteService",service_no);
		return result;
	}

	public int insertService(SqlSessionTemplate mybatisSession, IService service) {
		int result = mybatisSession.insert("introMapper.insertService", service);
		return result;
	}

	public int updateService(IService iservice, SqlSessionTemplate mybatisSession) {
		int result = mybatisSession.update("introMapper.updateService", iservice);
		return result;
	}

}
