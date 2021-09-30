package com.test.whimory.qna.model.service;

import java.util.ArrayList;

import com.test.whimory.common.Paging;
import com.test.whimory.common.SearchDate;
import com.test.whimory.qna.model.vo.QnaAnswer;
import com.test.whimory.qna.model.vo.QnaQuestion;

public interface QnaService {
	ArrayList<QnaQuestion> selectList(Paging page);
	QnaQuestion selectOne(int qq_no);
	int insertQuestion(QnaQuestion question);
	int updateQuestion(QnaQuestion question);
	int deleteQuestion(int qq_no);
	int insertAnswer(QnaAnswer answer);
	int deleteAnswer(int qa_no);
	int selectListCount();
	ArrayList<QnaQuestion> selectSearchWriter(Paging paging);
	ArrayList<QnaQuestion> selectSearchTitle(Paging paging);
	ArrayList<QnaQuestion> selectSearchCategory(Paging paging);
	ArrayList<QnaQuestion> selectSearchDate(Paging paging);
	int selectSearchWriterCount(String keyword);
	int selectSearchTitleCount(String keyword);
	int selectSearchCategoryCount(String keyword);
	int selectSearchDateCount(Paging paging);
	ArrayList<QnaAnswer> selectAnswerList(int qq_no);
	int updateQqyn(int qq_no);	// 답변여부 y로 바꾸기
	int updateQQYN(int qq_no);	// 답변여부 n
	ArrayList<QnaQuestion> selectListU(Paging page); //현주 : 내 qna 질문 내역 보기
	int selectListCountU(String user_id);//현주 추가 : 내 qna 리스트 페이징 처리
}
