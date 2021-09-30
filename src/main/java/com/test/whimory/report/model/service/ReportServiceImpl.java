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
	public int selectListCount() {
		return reportDao.selectListCount();
	}

	@Override
	public Report selectOne(int report_no) {
		return reportDao.selectOne(report_no);
	}

	@Override
	public ArrayList<Report> selectSearchTitle(Paging paging) {
		return reportDao.selectSearchTitle(paging);
	}

	@Override
	public ArrayList<Report> selectSearchWriter(Paging paging) {
		return reportDao.selectSearchWriter(paging);
	}

	@Override
	public ArrayList<Report> selectSearchDate(Paging paging) {
		return reportDao.selectSearchDate(paging);
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
	
	//현주 추가 : 회원 - 제보한 리스트 목록 보기용
	@Override
	public ArrayList<Report> selectListU(Paging page){
		return reportDao.selectListU(page);
	}
	
	//현주 추가 : 관리자 - 제보 내역 반영 여부 확인용
	@Override
	public ArrayList<Report> selectListA(Paging page){
		return reportDao.selectListU(page);
	}


	@Override
	public int selectSearchTitleCount(String keyword) {
		return reportDao.selectSearchTitleCount(keyword);
	}


	@Override
	public int selectSearchWriterCount(String keyword) {
		return reportDao.selectSearchWriterCount(keyword);
	}


	@Override
	public int selectSearchDateCount(Paging paging) {
		return reportDao.selectSearchDateCount(paging);
	}
	
	@Override
	public int selectListCountU(String user_id) {
		return reportDao.selectListCountU(user_id);
	}
	
}
