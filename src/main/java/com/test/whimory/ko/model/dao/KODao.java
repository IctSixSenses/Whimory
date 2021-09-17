package com.test.whimory.ko.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.whimory.ko.model.vo.KO;

@Repository("koDao")
public class KODao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public ArrayList<KO> selectList() {
		List<KO> list = sqlSession.selectList("koMapper.selectList");
		return (ArrayList<KO>) list;
	}
	
	public ArrayList<KO> selectTop10(){
		List<KO> list = sqlSession.selectList("koMapper.selectTop10");
		return (ArrayList<KO>) list;
	}

	public ArrayList<KO> selectSearchCategory(String cate) {
		List<KO> list = sqlSession.selectList("koMapper.selectSearchCategory", cate);
		return (ArrayList<KO>) list;
	}

	public int selectListCount() {
		return sqlSession.selectOne("koMapper.selectListCount");
	}
	
	public KO selectKO(int ko_no) {
		return sqlSession.selectOne("koMapper.selectKO", ko_no);
	}

	public int updateAddReadCount(int ko_no) {
		return sqlSession.update("koMapper.updateAddReadCount", ko_no);
	}

	public ArrayList<KO> selectSearchKeyword(KO ko) {
		List<KO> list;
		
		if(ko.getKo_category().equals(" ")) {
			list = sqlSession.selectList("koMapper.selectSearchCateKeyword", ko);
		} else {
			list = sqlSession.selectList("koMapper.selectSearchKeyword", ko);
		}
		
		return (ArrayList<KO>) list;
	}

	public int insertKO(KO ko) {
		return sqlSession.insert("koMapper.insertKO", ko);
	}

	public int updateKO(KO ko) {
		return sqlSession.update("koMapper.updateKO", ko);
	}

	public int deleteKO(int ko_no) {
		return sqlSession.delete("koMapper.deleteKO", ko_no);
	}
	
}
