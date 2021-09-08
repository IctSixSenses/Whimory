package notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import notice.model.vo.Notice;

public class NoticeDao {

   // 공지사항 전체 조회 : 공지사항 목록보기용
   public ArrayList<Notice> selectList(SqlSession session){
      
      List<Notice> list = session.selectList("noticeMapper.selectList");
      return (ArrayList<Notice>)list;
   }
   
   // 공지글 번호로 1개 조회 : 공지사항 상세보기 처리용
   public Notice selectOne(SqlSession session, int notice_No) {
      
      return session.selectOne("noticeMapper.selectOne", notice_No);
   }
   
   // 새 공지글 등록
   public int insertNotice(SqlSession session, Notice notice) {
      
      return session.insert("noticeMapper.insertNotice", notice);
   }
   
   // 공지글 수정
   public int updateNotice(SqlSession session, Notice notice) {
      
      return session.update("noticeMapper.updateNotice", notice);
   }
   
   // 공지글 삭제
   public int deleteNotice(SqlSession session, int notice_No) {
      
      return session.delete("noticeMapper.deleteNotice", notice_No);
   }
   
   // 새 공지글 3개를 리턴 : 작성날짜로 top-3 분석 이용함
   public ArrayList<Notice> selectNewTop3(SqlSession session){
      
      List<Notice> list = session.selectList("noticeMapper.selectNewTop3");
      return (ArrayList<Notice>)list;
   }

}