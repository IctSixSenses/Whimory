package com.test.whimory.free.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.whimory.common.Paging;
import com.test.whimory.free.model.dao.FreeDao;
import com.test.whimory.free.model.vo.Free;
import com.test.whimory.free.model.vo.FreeReply;

@Service("FreeService")
public class FreeServiceImpl implements FreeService {

	@Autowired
	FreeDao freeDao;
	
	@Override
	public ArrayList<Free> selectList(Paging page) {
		return freeDao.selectList(page);
	}

	@Override
	public int selectListCount() {
		return freeDao.selectListCount();
	}

	@Override
	public Free selectOne(int free_no) {
		return freeDao.selectOne(free_no);
	}

	@Override
	public ArrayList<Free> selectSearchTitle(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Free> selectSearchWriter(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Free> selectSearchContent(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<FreeReply> selectReplyList(int free_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertOrigin(Free free) {
		return freeDao.insertOrigin(free);
	}

	@Override
	public int insertReply(Free free) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateOrigin(Free free) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteOrigin(int free_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply(int free_reply_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addReadCount(int free_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addLikeCount(int free_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addBadCount(int free_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
