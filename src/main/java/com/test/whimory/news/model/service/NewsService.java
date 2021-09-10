package com.test.whimory.news.model.service;

import java.util.ArrayList;

import com.test.whimory.common.SearchDate;
import com.test.whimory.news.model.vo.News;

public interface NewsService {
	ArrayList<News> selectList();
	News selectOne(int news_no);
	int insertNews(News news);
	int updateNews(News news);
	int deleteNews(int news_no);
	ArrayList<News> selectSearchContent(String keyword);
	ArrayList<News> selectSearchTitle (String keyword);
	ArrayList<News> selectSearchDate (SearchDate sdate);
	ArrayList<News> selectNew3();
}
