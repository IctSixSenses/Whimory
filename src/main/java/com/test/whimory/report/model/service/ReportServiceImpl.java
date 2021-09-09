package com.test.whimory.report.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.whimory.common.Paging;
import com.test.whimory.common.SearchDate;
import com.test.whimory.report.model.dao.ReportDao;
import com.test.whimory.report.model.vo.Report;

@Service("reportService")
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	ReportDao reportDao;
	
	@Override
	public ArrayList<Report> selectList(Paging page) {
		return reportDao.selectList(page);
	}

	@Override
	public int selectListCount() {
		return reportDao.selectListCount();
	}

	@Override
	public int selectOne(int report_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Report> selectSearchTitle(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Report> selectSearchWriter(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Report> selectSearchDate(SearchDate dates) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReport(Report report) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateComment(Report report) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReport(Report report) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReport(int report_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteComment(int report_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addReadCount(int report_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addLikeCount(int report_no) {
		// TODO Auto-generated method stub
		return 0;
	}

}