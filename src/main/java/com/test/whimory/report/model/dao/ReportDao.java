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
	
	public int updateAddReadCount(int report_no) {
		return sqlSession.update("reportMapper.updateAddReadCount", report_no);
	}
	
	public int updateAddLikeCount(int report_no) {
		return sqlSession.update("reportMapper.updateAddLikeCount", report_no);
	}
	
	public int insertReport(Report report) {
		return sqlSession.insert("reportMapper.insertReport", report);
	}
	
	public int updateReport(Report report) {
		return sqlSession.update("reportMapper.updateReport", report);
	}
	
	public int deleteReport(int report_no) {
		return sqlSession.delete("reportMapper.deleteReport", report_no);
	}
}
