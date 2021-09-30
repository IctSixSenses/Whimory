package com.test.whimory.report.model.service;

import java.util.ArrayList;

import com.test.whimory.common.Paging;
import com.test.whimory.common.SearchDate;
import com.test.whimory.report.model.vo.Report;
import com.test.whimory.report.model.vo.ReportLike;

public interface ReportService {
	ArrayList<Report> selectList(Paging page);
	ArrayList<Report> selectListU(Paging page);//현주 추가 부분 - 나의 제보 내역 보기
	int selectListCount();
	Report selectOne(int report_no);
	ArrayList<Report> selectSearchTitle(Paging paging);
	ArrayList<Report> selectSearchWriter(Paging paging);
	ArrayList<Report> selectSearchDate(Paging paging);
	int insertReport(Report report);
	int updateComment(Report report);
	int updateReport(Report report);
	int deleteReport(int report_no);
	int deleteComment(int report_no);
	int updateAddReadCount(int report_no);
	int insertAddLikeCount(ReportLike rplike);
	int updateAddLikeCount(int report_no);
	int selectReportLike(ReportLike rplike);
	ArrayList<Report> selectListA(Paging paging); //현주 추가 - 관리자 반영 내역 확인용
	int selectSearchTitleCount(String keyword);
	int selectSearchWriterCount(String keyword);
	int selectSearchDateCount(Paging paging);
	int selectListCountU(String user_id); //현주 추가 - 선택된 회원 페이지 리스트
}
