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
	ArrayList<Notice> selectSearchTitle(Paging paging);
	ArrayList<Notice> selectSearchContent(String keyword);
	ArrayList<Notice> selectSearchDate(Paging paging);
	int insertNotice(Notice notice);
	int updateNotice(Notice notice);
	int deleteNotice(int notice_no);
	int selectSearchCount(String keyword);
	int selectSearchDateCount(Paging paging);
	
}
