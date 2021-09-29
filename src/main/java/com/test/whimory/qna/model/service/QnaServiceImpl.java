package com.test.whimory.qna.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.whimory.common.Paging;
import com.test.whimory.common.SearchDate;
import com.test.whimory.qna.model.dao.QnaDao;
import com.test.whimory.qna.model.vo.QnaAnswer;
import com.test.whimory.qna.model.vo.QnaQuestion;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaDao qnaDao;
	
	@Override
	public ArrayList<QnaQuestion> selectList(Paging page){
		return qnaDao.selectList(page);
	}
	
	@Override
	public QnaQuestion selectOne(int qq_no) {
		return qnaDao.selectOne(qq_no);
	}
	
	@Override
	public int insertQuestion(QnaQuestion question) {
		return qnaDao.insertQuestion(question);
	}
	
	@Override
	public int updateQuestion(QnaQuestion question) {
		return qnaDao.updateQuestion(question);
	}
	
	@Override
	public int deleteQuestion(int qq_no) {
		return qnaDao.deleteQuestion(qq_no);
	}
	
	@Override
	public int insertAnswer(QnaAnswer answer) {
		return qnaDao.insertAnswer(answer);
	}
	
	@Override
	public int deleteAnswer(int qa_no) {
		return qnaDao.deleteAnswer(qa_no);
	}
	
	@Override
	public int selectListCount() {
		return qnaDao.selectListCount();
	}
	
	@Override
	public ArrayList<QnaQuestion> selectSearchWriter(Paging paging){
		List<QnaQuestion> list = qnaDao.selectSearchWriter(paging);
		return (ArrayList<QnaQuestion>)list;
	}
	
	@Override
	public ArrayList<QnaQuestion> selectSearchTitle(Paging paging){
		List<QnaQuestion> list = qnaDao.selectSearchTitle(paging);
		return (ArrayList<QnaQuestion>)list;
	}
	
	@Override
	public ArrayList<QnaQuestion> selectSearchCategory(Paging paging){
		List<QnaQuestion> list = qnaDao.selectSearchCategory(paging);
		return (ArrayList<QnaQuestion>)list;
	}
	
	@Override
	public ArrayList<QnaQuestion> selectSearchDate(Paging paging){
		List<QnaQuestion> list = qnaDao.selectSearchDate(paging);
		return (ArrayList<QnaQuestion>)list;
	}
	
	@Override
	public int selectSearchWriterCount(String keyword) {
		return qnaDao.selectSearchWriterCount(keyword);
	}
	
	@Override
	public int selectSearchTitleCount(String keyword) {
		return qnaDao.selectSearchTitleCount(keyword);
	}
	
	@Override
	public int selectSearchCategoryCount(String keyword) {
		return qnaDao.selectSearchCategoryCount(keyword);
	}
	
	@Override
	public int selectSearchDateCount(Paging paging) {
		return qnaDao.selectSearchDateCount(paging);
	}
	
	@Override
	public ArrayList<QnaAnswer> selectAnswerList(int qq_no){
		return qnaDao.selectAnswerList(qq_no);
	}
	
	@Override
	public int updateQqyn(int qq_no) {
		return qnaDao.updateQqyn(qq_no);
	}
	
	@Override
	public int updateQQYN(int qq_no) {
		return qnaDao.updateQQYN(qq_no);
	}
	
	//나의 제보 내역 확인하기 추가
	@Override
	public ArrayList<QnaQuestion> selectListU(Paging page){
		return qnaDao.selectListU(page);
	}
}
