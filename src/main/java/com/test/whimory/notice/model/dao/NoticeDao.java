package com.test.whimory.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.whimory.common.Paging;
import com.test.whimory.common.SearchDate;
import com.test.whimory.notice.model.vo.Notice;

@Repository("noticeDao")
public class NoticeDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public ArrayList<Notice> selectList(Paging paging) {
		List<Notice> list = sqlSession.selectList("noticeMapper.selectList", paging);
		return (ArrayList<Notice>) list;
	}
	
	public int selectListCount() {
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}
	
	public Notice selectNotice(int noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}
	
	public int updateAddReadcount(int noticeNo) {
		return sqlSession.update("noticeMapper.updateAddReadcount", noticeNo);
	}
	
	public ArrayList<Notice> selectSearchTitle(Paging paging){
		List<Notice> list = sqlSession.selectList("noticeMapper.selectSearchTitle", paging);
		return (ArrayList<Notice>)list;
	}
	
	public ArrayList<Notice> selectSearchContent(String keyword){
		List<Notice> list = sqlSession.selectList("noticeMapper.selectSearchContent", keyword);
		return (ArrayList<Notice>)list;
	}

	public ArrayList<Notice> selectSearchDate(Paging paging){
		List<Notice> list = sqlSession.selectList("noticeMapper.selectSearchDate", paging);
		return (ArrayList<Notice>)list;
	}
	
	// 공지사항 글 등록
	public int insertNotice(Notice notice) {
		return sqlSession.insert("noticeMapper.insertNotice", notice);
	}

	// 공지사항 글 수정
	public int updateNotice(Notice notice) {
		return sqlSession.update("noticeMapper.updateNotice", notice);
	}

	// 공지사항 글 삭제
	public int deleteNotice(int notice_no) {
		return sqlSession.delete("noticeMapper.deleteNotice", notice_no);
	}

	public int selectSearchCount(String keyword) {
		return sqlSession.selectOne("noticeMapper.selectSearchCount");
	}

	public int selectSearchDateCount(Paging paging) {
		return sqlSession.selectOne("noticeMapper.selectSearchDateCount");
	}
	
	
}





