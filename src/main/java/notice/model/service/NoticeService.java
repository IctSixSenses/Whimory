package notice.model.service;

import static common.JDBCTemp.getSession;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;

public class NoticeService {

   // DI (의존성 주입)
   private NoticeDao ndao = new NoticeDao();

   public ArrayList<Notice> selectList() {
      SqlSession session = getSession();
      ArrayList<Notice> list = ndao.selectList(session);
      session.close();
      return list;

   }

   public Notice selectOne(int notice_No) {
      SqlSession session = getSession();
      Notice notice = ndao.selectOne(session, notice_No);
      session.close();
      return notice;

   }

   public int insertNotice(Notice notice) {
      SqlSession session = getSession();
      int result = ndao.insertNotice(session, notice);

      if (result > 0) {
         session.commit();
      } else {
         session.rollback();
      }
      session.close();
      return result;
   }

   public int updateNotice(Notice notice) {
      SqlSession session = getSession();
      int result = ndao.updateNotice(session, notice);

      if (result > 0) {
         session.commit();
      } else {
         session.rollback();
      }
      session.close();
      return result;

   }

   public int deleteNotice(int notice_No) {
      SqlSession session = getSession();
      int result = ndao.deleteNotice(session, notice_No);

      if (result > 0) {
         session.commit();
      } else {
         session.rollback();
      }
      session.close();
      return result;
   }

   public ArrayList<Notice> selectNewTop3() {
      SqlSession session = getSession();
      ArrayList<Notice> list = ndao.selectNewTop3(session);
      session.close();
      return list;

   }

}