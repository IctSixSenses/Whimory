package com.test.whimory.ko.model.service;

import java.util.ArrayList;

import com.test.whimory.ko.model.vo.KO;

public interface KOService {
	
	ArrayList<KO> selectList();
	ArrayList<KO> selectSearchCategory(String cate);
	int selectListCount();
	KO selectKO(int ko_no);
	int updateAddReadCount(int ko_no);
	ArrayList<KO> selectSearchKeyword(KO ko);
	
	int insertKO(KO ko);
	int updateKO(KO ko);
	int deleteKO(int ko_no);
	
	
}
