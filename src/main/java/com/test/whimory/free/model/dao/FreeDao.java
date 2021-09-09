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
	
	public ArrayList<Free> selectList(Paging page){
		List<Free> list = sqlSession.selectList("freeMapper.selectList", page);
		return (ArrayList<Free>)list;
	}
	
	public int selectListCount() {
		return sqlSession.selectOne("freeMapper.selectListCount");	
	}
	
}
