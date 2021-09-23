package com.test.whimory.notice.model.service;

import java.util.ArrayList;

import com.test.whimory.common.Paging;
import com.test.whimory.common.SearchDate;
import com.test.whimory.notice.model.vo.Notice;

public interface NoticeService {
	
	ArrayList<Notice> selectList(Paging paging);
	int selectListCount();
	Notice selectNotice(int noticeNo);
	int updateAddReadcount(int noticeNo);
	ArrayList<Notice> selectSearchTitle(String keyword);
	ArrayList<Notice> selectSearchContent(String keyword);
	ArrayList<Notice> selectSearchDate(SearchDate sdate);
	
}
