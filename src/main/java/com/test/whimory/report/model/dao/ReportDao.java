package com.test.whimory.report.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.whimory.common.Paging;
import com.test.whimory.report.model.vo.Report;

@Repository("reportDao")
public class ReportDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public ArrayList<Report> selectList(Paging page){
		List<Report> list = sqlSession.selectList("reportMapper.selectList", page);
		return (ArrayList<Report>)list;
	}
	
	public int selectListCount() {
		return sqlSession.selectOne("reportMapper.selectListCount");
	}

	public Report selectOne(int report_no) {
		return sqlSession.selectOne("reportMapper.selectOne", report_no);
	}
}
