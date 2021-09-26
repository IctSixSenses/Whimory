package com.test.whimory.notice.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.whimory.common.Paging;
import com.test.whimory.common.SearchDate;
import com.test.whimory.notice.model.dao.NoticeDao;
import com.test.whimory.notice.model.vo.Notice;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDao noticeDao;
	
	@Override
	public ArrayList<Notice> selectList(Paging paging) {
		List<Notice> list = noticeDao.selectList(paging);
		return (ArrayList<Notice>)list;
	}

	@Override
	public int selectListCount() {
		return noticeDao.selectListCount();
	}

	@Override
	public Notice selectNotice(int noticeNo) {
		return noticeDao.selectNotice(noticeNo);
	}

	@Override
	public int updateAddReadcount(int noticeNo) {
		return noticeDao.updateAddReadcount(noticeNo);
	}

	@Override
	public ArrayList<Notice> selectSearchTitle(Paging paging) {
		List<Notice> list = noticeDao.selectSearchTitle(paging);
		return (ArrayList<Notice>)list;
	}

	@Override
	public ArrayList<Notice> selectSearchContent(Paging paging) {
		List<Notice> list = noticeDao.selectSearchContent(paging);
		return (ArrayList<Notice>)list;
	}

	@Override
	public ArrayList<Notice> selectSearchDate(Paging paging) {
		List<Notice> list = noticeDao.selectSearchDate(paging);
		return (ArrayList<Notice>)list;
	}
	
	@Override
	public int insertNotice(Notice notice) {
		return noticeDao.insertNotice(notice);
	}
	
	@Override
	public int updateNotice(Notice notice) {
		return noticeDao.updateNotice(notice);
	}
	
	@Override
	public int deleteNotice(int notice_no) {
		return noticeDao.deleteNotice(notice_no);
	}

	@Override
	public int selectSearchTitleCount(String keyword) {
		return noticeDao.selectSearchTitleCount(keyword);
	}

	@Override
	public int selectSearchContentCount(String keyword) {
		return noticeDao.selectSearchContentCount(keyword);
	}
	
	@Override
	public int selectSearchDateCount(Paging paging) {
		return noticeDao.selectSearchDateCount(paging);
	}
	

}



