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
	
	public ArrayList<Notice> selectSearchTitle(String keyword){
		List<Notice> list = sqlSession.selectList("noticeMapper.selectSearchTitle", keyword);
		return (ArrayList<Notice>)list;
	}
	
	public ArrayList<Notice> selectSearchContent(String keyword){
		List<Notice> list = sqlSession.selectList("noticeMapper.selectSearchContent", keyword);
		return (ArrayList<Notice>)list;
	}

	public ArrayList<Notice> selectSearchDate(SearchDate sdate){
		List<Notice> list = sqlSession.selectList("noticeMapper.selectSearchDate", sdate);
		return (ArrayList<Notice>)list;
	}
	
	
}





