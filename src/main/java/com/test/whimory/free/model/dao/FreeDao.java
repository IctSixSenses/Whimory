package com.test.whimory.free.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.whimory.common.Paging;
import com.test.whimory.free.model.vo.Free;
import com.test.whimory.free.model.vo.FreeBad;
import com.test.whimory.free.model.vo.FreeLike;
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
	public ArrayList<Free> selectSearchTitle(Paging paging) {
		List<Free> list = sqlSession.selectList("freeMapper.selectSearchTitle", paging);
		return (ArrayList<Free>) list;
	}
	
	// 전체 목록에서 '작성자'로 검색
	public ArrayList<Free> selectSearchWriter(Paging paging) {
		List<Free> list = sqlSession.selectList("freeMapper.selectSearchWriter", paging);
		return (ArrayList<Free>) list;
	}

	// 전체 목록에서 '내용'으로 검색
	public ArrayList<Free> selectSearchContent(Paging paging) {
		List<Free> list = sqlSession.selectList("freeMapper.selectSearchContent", paging);
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
	
	// 게시글 조회수 증가
	public int updateAddReadCount(int free_no) {
		return sqlSession.update("freeMapper.updateAddReadCount", free_no);
	}

	// 게시글 추천수 증가
	public int updateAddLikeCount(int free_no) {
		return sqlSession.update("freeMapper.updateAddLikeCount", free_no);
	}

	// 게시글 신고수 증가
	public int updateAddBadCount(int free_no) {
		return sqlSession.update("freeMapper.updateAddBadCount", free_no);
	}

	// 추천 여부
	public int selectLikeYN(FreeLike flike) {
		return sqlSession.selectOne("freeMapper.selectLikeYN", flike);
	}

	// 신고 여부
	public int selectBadYN(FreeBad fbad) {
		return sqlSession.selectOne("freeMapper.selectBadYN", fbad);
	}

	// 추천수 조회
	public int selectLikeCount(FreeLike flike) {
		return sqlSession.selectOne("freeMapper.selectLikeCount", flike);
	}

	// 신고수 조회
	public int selectBadCount(FreeBad fbad) {
		return sqlSession.selectOne("freeMapper.selectBadCount", fbad);
	}

	// 추천 등록
	public int insertAddLikeCount(FreeLike flike) {
		return sqlSession.insert("freeMapper.insertAddLikeCount", flike);
	}

	// 신고 등록
	public int insertAddBadCount(FreeBad fbad) {
		return sqlSession.insert("freeMapper.insertAddBadCount", fbad);
	}
	
	// 인기게시글 5개 조회
	public ArrayList<Free> selectFreeTop5() {
		List<Free> list = sqlSession.selectList("freeMapper.selectFreeTop5");
		return (ArrayList<Free>)list;
	}

	// '제목'검색 후 페이징 처리
	public int selectSearchTitleCount(String keyword) {
		return sqlSession.selectOne("freeMapper.selectSearchTitleCount", keyword);
	}

	// '작성자'검색 후 페이징 처리
	public int selectSearchWriterCount(String keyword) {
		return sqlSession.selectOne("freeMapper.selectSearchWriterCount", keyword);
	}
	
	// '내용'검색 후 페이징 처리
	public int selectSearchContentCount(String keyword) {
		return sqlSession.selectOne("freeMapper.selectSearchContentCount", keyword);
	}
	
}
