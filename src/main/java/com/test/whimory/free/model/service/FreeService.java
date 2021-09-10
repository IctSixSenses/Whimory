package com.test.whimory.free.model.service;

import java.util.ArrayList;

import com.test.whimory.common.Paging;
import com.test.whimory.free.model.vo.Free;
import com.test.whimory.free.model.vo.FreeReply;

public interface FreeService {
	ArrayList<Free> selectList(Paging page);	//전체 목록 조회
	int selectListCount();				//게시글 count
	Free selectOne(int free_no);		//게시글 상세보기
	ArrayList<Free> selectSearchTitle(String keyword);		//글 제목 검색
	ArrayList<Free> selectSearchWriter(String keyword);		//작성자 검색
	ArrayList<Free> selectSearchContent(String keyword);	//글 내용 검색
	ArrayList<FreeReply> selectReplyList(int free_no);		//댓글 목록(원글의 상세보기 page)
	int insertOrigin(Free free);	//원글 등록
	int insertReply(Free free);		//댓글 등록
	int updateOrigin(Free free);	//원글 수정
	int deleteOrigin(int free_no);	//원글 삭제
	int deleteReply(int free_reply_no);	//댓글 삭제
	int addReadCount(int free_no);	//조회수 증가
	int addLikeCount(int free_no);	//추천수 증가
	int addBadCount(int free_no);	//신고수 증가
	
	//신고 추천 관련은 추후 작성
	
	
	
	
}
