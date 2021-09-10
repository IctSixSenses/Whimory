package com.test.whimory.news.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.whimory.common.SearchDate;
import com.test.whimory.news.model.vo.News;

@Repository("newsDao")
public class NewsDao {
	@Autowired
	SqlSessionTemplate sqlSession;	// Spring DI
	
	// 언론보도 전체 조회
	public ArrayList<News> selectList(){
		List<News> list = sqlSession.selectList("newsMapper.selectList");
		return (ArrayList<News>) list;
	}
	
	// 언론보도 글 번호로 상세보기
	public News selectOne(int news_no) {
		return sqlSession.selectOne("newsMapper.selectOne", news_no);
	}
	
	// 언론보도 글 등록
	public int insertNews(News news) {
		return sqlSession.insert("newsMapper.insertNews", news);
	}
	
	// 언론보도 글 수정
	public int updateNews(News news) {
		return sqlSession.update("newsMapper.updateNews", news);
	}
	
	// 언론보도 글 삭제
	public int deleteNews(int news_no) {
		return sqlSession.delete("newsMapper.deleteNews", news_no);
	}
	
	// 글 내용으로 검색하기
	public ArrayList<News> selectSearchContent(String keyword){
		List<News> list = sqlSession.selectList("newsMapper.selectSearchContent", keyword);
		return (ArrayList<News>) list;
	}
	
	// 글 제목으로 검색하기
	public ArrayList<News> selectSearchTitle(String keyword){
		List<News> list = sqlSession.selectList("newsMapper.selectSearchTitle", keyword);
		return (ArrayList<News>) list;
	}
	
	// 글 등록날짜로 검색하기
	public ArrayList<News> selectSearchDate(SearchDate sdate){
		List<News> list = sqlSession.selectList("newsMapper.selectNew3", sdate);
		return (ArrayList<News>) list;
	}
	
	// new 3
	public ArrayList<News> selectNew3(){
		List<News> list = sqlSession.selectList("newsMapper.selectNew3");
		return (ArrayList<News>) list;
	}
}
