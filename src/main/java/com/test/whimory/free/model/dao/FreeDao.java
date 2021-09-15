package com.test.whimory.free.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.whimory.common.Paging;
import com.test.whimory.free.model.vo.Free;
import com.test.whimory.free.model.vo.FreeReply;

@Repository("freeDao")
public class FreeDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 전체 목록 조회
	public ArrayList<Free> selectList(Paging page){
		List<Free> list = sqlSession.selectList("freeMapper.selectList", page);
		return (ArrayList<Free>)list;
	}
	
	// 게시글 count
	public int selectListCount() {
		return sqlSession.selectOne("freeMapper.selectListCount");	
	}
	
	// 게시글 상세보기
	public Free selectOne(int free_no) {
		return sqlSession.selectOne("freeMapper.selectOne", free_no);
	}
	
	// 게시글 등록
	public int insertOrigin(Free free) {
		return sqlSession.insert("freeMapper.insertOrigin", free);
	}

	// 게시글 수정
	public int updateOrigin(Free free) {
		return sqlSession.update("freeMapper.updateOrigin", free);
	}
	
	// 게시글 삭제
	public int deleteOrigin(int free_no) {
		return sqlSession.delete("freeMapper.deleteOrigin", free_no);
	}
	
	// 전체 목록에서 '제목'으로 검색
	public ArrayList<Free> selectSearchTitle(String keyword) {
		List<Free> list = sqlSession.selectList("freeMapper.selectSearchTitle", keyword);
		return (ArrayList<Free>) list;
	}
	
	// 전체 목록에서 '작성자'로 검색
	public ArrayList<Free> selectSearchWriter(String keyword) {
		List<Free> list = sqlSession.selectList("freeMapper.selectSearchWriter", keyword);
		return (ArrayList<Free>) list;
	}

	// 전체 목록에서 '내용'으로 검색
	public ArrayList<Free> selectSearchContent(String keyword) {
		List<Free> list = sqlSession.selectList("freeMapper.selectSearchContent", keyword);
		return (ArrayList<Free>) list;
	}
	
	// 게시글 댓글 조회
	public ArrayList<FreeReply> selectReplyList(int free_no) {
		List<FreeReply> list = sqlSession.selectList("freeMapper.selectReplyList", free_no);
		return (ArrayList<FreeReply>)list;
	}
	
	// 댓글 등록
	public int insertReply(FreeReply freply) {
		return sqlSession.insert("freeMapper.insertReply", freply);
	}
	
	// 댓글 삭제
	public int deleteReply(int free_reply_no) {
		return sqlSession.delete("freeMapper.deleteReply", free_reply_no);
	}


	
	
}
