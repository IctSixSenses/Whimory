package com.test.whimory.news.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.whimory.common.SearchDate;
import com.test.whimory.news.model.dao.NewsDao;
import com.test.whimory.news.model.vo.News;

@Service("newsService")
public class NewsServiceImpl implements NewsService {
	
	@Autowired
	private NewsDao newsDao;
	
	@Override
	public ArrayList<News> selectList(){
		return newsDao.selectList();
	}
	
	@Override
	public News selectOne(int news_no) {
		return newsDao.selectOne(news_no);
	}
	
	@Override
	public int insertNews(News news) {
		return newsDao.insertNews(news);
	}
	
	@Override
	public int updateNews(News news) {
		return newsDao.updateNews(news);
	}
	
	@Override
	public int deleteNews(int news_no) {
		return newsDao.deleteNews(news_no);
	}
	
	@Override
	public ArrayList<News> selectSearchContent(String keyword){
		return newsDao.selectSearchContent(keyword);
	}
	
	@Override
	public ArrayList<News> selectSearchTitle(String keyword){
		return newsDao.selectSearchTitle(keyword);
	}
	
	@Override
	public ArrayList<News> selectSearchDate(SearchDate sdate){
		return newsDao.selectSearchDate(sdate);
	}
	
	@Override
	public ArrayList<News> selectNew3(){
		return newsDao.selectNew3();
	}

}
