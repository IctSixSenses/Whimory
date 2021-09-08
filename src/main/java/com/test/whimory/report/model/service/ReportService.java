package com.test.whimory.report.model.service;

import java.util.ArrayList;

import com.test.whimory.common.Paging;
import com.test.whimory.common.SearchDate;
import com.test.whimory.report.model.vo.Report;

public interface ReportService {
	ArrayList<Report> selectList(Paging page);
	int selectListCount();
	int selectOne(int report_no);
	ArrayList<Report> selectSearchTitle(String keyword);
	ArrayList<Report> selectSearchWriter(String keyword);
	ArrayList<Report> selectSearchDate(SearchDate dates);
	int insertReport(Report report);
	int updateComment(Report report);
	int updateReport(Report report);
	int deleteReport(int report_no);
	int deleteComment(int report_no);
	int addReadCount(int report_no);
	int addLikeCount(int report_no);
}
