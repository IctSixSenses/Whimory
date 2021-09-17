package com.test.whimory.ko.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.whimory.ko.model.dao.KODao;
import com.test.whimory.ko.model.vo.KO;

@Service("koService")
public class KOServiceImpl implements KOService {
	
	@Autowired
	KODao koDao;

	@Override
	public ArrayList<KO> selectList() {
		List<KO> list = koDao.selectList();
		return (ArrayList<KO>)list;
	}
	
	@Override
	public ArrayList<KO> selectTop10(){
		List<KO> list = koDao.selectTop10();
		return (ArrayList<KO>)list;
	}

	@Override
	public ArrayList<KO> selectSearchCategory(String cate) {
		List<KO> list = koDao.selectSearchCategory(cate);
		return (ArrayList<KO>) list;
	}

	@Override
	public int selectListCount() {
		return koDao.selectListCount();
	}

	@Override
	public KO selectKO(int ko_no) {
		return koDao.selectKO(ko_no);
	}

	@Override
	public int updateAddReadCount(int ko_no) {
		return koDao.updateAddReadCount(ko_no);
	}

	@Override
	public ArrayList<KO> selectSearchKeyword(KO ko) {
		List<KO> list = koDao.selectSearchKeyword(ko);
		return (ArrayList<KO>) list;
	}

	@Override
	public int insertKO(KO ko) {
		return koDao.insertKO(ko);
	}

	@Override
	public int updateKO(KO ko) {
		return koDao.updateKO(ko);
	}

	@Override
	public int deleteKO(int ko_no) {
		return koDao.deleteKO(ko_no);
	}
	
}
