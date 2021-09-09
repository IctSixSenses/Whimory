package com.test.whimory.free.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.whimory.common.Paging;
import com.test.whimory.free.model.vo.Free;

@Repository("freeDao")
public class FreeDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 전체 목록 조회
	public ArrayList<Free> selectList(Paging page){
		List<Free> list = sqlSession.selectList("freeMapper.selectList", page);
		return (ArrayList<Free>)list;
	}
	
	// 게시글 count
	public int selectListCount() {
		return sqlSession.selectOne("freeMapper.selectListCount");	
	}
	
	// 게시글 상세보기
	public Free selectOne(int free_no) {
		return sqlSession.selectOne("freeMapper.selectOne", free_no);
	}
	
	
	
	
}
