package com.test.whimory.report.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.whimory.common.Paging;
import com.test.whimory.common.SearchDate;
import com.test.whimory.report.model.dao.ReportDao;
import com.test.whimory.report.model.vo.Report;
import com.test.whimory.report.model.vo.ReportLike;

@Service("reportService")
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	ReportDao reportDao;
	
	@Override
	public ArrayList<Report> selectList(Paging page) {
		return reportDao.selectList(page);
	}
	
	@Override
	public ArrayList<Report> selectListU(Paging page){
		return reportDao.selectListU(page);
	}

	@Override
	public int selectListCount() {
		return reportDao.selectListCount();
	}

	@Override
	public Report selectOne(int report_no) {
		return reportDao.selectOne(report_no);
	}

	@Override
	public ArrayList<Report> selectSearchTitle(String keyword) {
		return reportDao.selectSearchTitle(keyword);
	}

	@Override
	public ArrayList<Report> selectSearchWriter(String keyword) {
		return reportDao.selectSearchWriter(keyword);
	}

	@Override
	public ArrayList<Report> selectSearchDate(SearchDate dates) {
		return reportDao.selectSearchDate(dates);
	}

	@Override
	public int insertReport(Report report) {
		return reportDao.insertReport(report);
	}

	@Override
	public int updateComment(Report comment) {
		return reportDao.updateComment(comment);
	}

	@Override
	public int updateReport(Report report) {
		return reportDao.updateReport(report);
	}

	@Override
	public int deleteReport(int report_no) {
		return reportDao.deleteReport(report_no);
	}

	@Override
	public int deleteComment(int report_no) {
		return reportDao.deleteComment(report_no);
	}

	@Override
	public int updateAddReadCount(int report_no) {
		return reportDao.updateAddReadCount(report_no);
	}
	
	@Override
	public int insertAddLikeCount(ReportLike rplike) {
		return reportDao.insertAddLikeCount(rplike);
	}

	@Override
	public int updateAddLikeCount(int report_no) {
		return reportDao.updateAddLikeCount(report_no);
	}

	@Override
	public int selectReportLike(ReportLike rplike) {
		return reportDao.selectReportLike(rplike);
	}
	
}
