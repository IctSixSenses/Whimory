package com.test.whimory.free.model.service;

import java.util.ArrayList;

import com.test.whimory.common.Paging;
import com.test.whimory.free.model.vo.Free;
import com.test.whimory.free.model.vo.FreeBad;
import com.test.whimory.free.model.vo.FreeLike;
import com.test.whimory.free.model.vo.FreeReply;

public interface FreeService {
	ArrayList<Free> selectList(Paging page);	//전체 목록 조회
	int selectListCount();				//게시글 count
	Free selectOne(int free_no);		//게시글 상세보기
	ArrayList<Free> selectSearchTitle(Paging paging);		//글 제목 검색
	ArrayList<Free> selectSearchWriter(Paging paging);		//작성자 검색
	ArrayList<Free> selectSearchContent(Paging paging);	//글 내용 검색
	ArrayList<FreeReply> selectReplyList(int free_no);		//댓글 목록(원글의 상세보기 page)
	int insertOrigin(Free free);	//원글 등록
	int insertReply(FreeReply freply);		//댓글 등록
	int updateOrigin(Free free);	//원글 수정
	int deleteOrigin(int free_no);	//원글 삭제
	int deleteReply(int free_reply_no);	//댓글 삭제
	int updateAddReadCount(int free_no);	//조회수 증가
	int selectLikeYN(FreeLike flike);	//추천 검사(추천 여부)
	int selectBadYN(FreeBad fbad);	//신고 검사(신고 여부)
	int selectLikeCount(FreeLike flike);	//추천수 조회
	int selectBadCount(FreeBad fbad);	//신고수 조회
	int insertAddLikeCount(FreeLike flike);	//추천수 등록
	int insertAddBadCount(FreeBad fbad);		//신고수 등록
	int updateAddLikeCount(int free_no);	//추천수 증가
	int updateAddBadCount(int free_no);	 //신고수 증가
	ArrayList<Free> selectFreeTop5();	//인기게시글 조회
	int selectSearchTitleCount(String keyword);	 //'제목' 검색 페이징 처리
	int selectSearchWriterCount(String keyword);	//'작성자' 검색 페이징 처리
	int selectSearchContentCount(String keyword);	// '내용' 검색 페이징 처리
}
