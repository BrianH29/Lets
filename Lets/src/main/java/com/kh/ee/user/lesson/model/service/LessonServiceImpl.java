package com.kh.ee.user.lesson.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.curriculum.model.vo.Curriculum;
import com.kh.ee.user.curriculum.model.vo.Video;
import com.kh.ee.user.lesson.model.dao.LessonDao;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.lesson.model.vo.LessonFaq;
import com.kh.ee.user.lesson.model.vo.WishList;
import com.kh.ee.user.memPay.model.vo.MemPay;
import com.kh.ee.user.member.model.vo.Member;
import com.kh.ee.user.reply.model.vo.Reply;
import com.kh.ee.user.report.model.vo.Report;
import com.kh.ee.user.review.model.vo.Review;
import com.kh.ee.user.tutor.model.vo.Tutor;



@Service
public class LessonServiceImpl implements LessonService{

	@Autowired
	private SqlSessionTemplate ss;
	
	@Autowired
	private LessonDao lDao;

	@Override
	public ArrayList<Lesson> selectApproveLessonList(int memNo) {
		return lDao.selectApproveLessonList(ss, memNo);
	}

	@Override
	public ArrayList<Lesson> selectApproveStatusList(int memNo) {
		return lDao.selectApproveStatusList(ss, memNo);
	}

	//상세페이지 lesson 테이블 select (학천)
	@Override
	public Lesson selectLessonList(int lessonNo) {
		return lDao.selectLessonList(lessonNo, ss);
	}

	//상세페이지에서 보여질 후기 들 (학천)
	@Override
	public ArrayList<Review> selectReview(int lessonNo) {
		return lDao.selectReview(lessonNo, ss);
	}
	
	// 레슨 상세페이지 FAQ 전체 불러오기(학천)
	@Override
	public ArrayList<LessonFaq> selectLessonFaqList(int lessonNo) {
		return lDao.selectLessonFaqList(lessonNo, ss);
	}
	
	@Override
	public ArrayList<Curriculum> selectCurrList(int lessonNo) {
		return lDao.selectCurrList(lessonNo, ss);
	}
	
	
	// 커뮤니티 총 갯수 (학천)
	@Override
	public int selectListCount() {
		return lDao.selectListCount(ss);
	}
	
	@Override
	public ArrayList<Reply> selectReply(int totalNo, PageInfo pi) {
		return lDao.selectReply(totalNo,pi,ss);
	}
	@Override
	public int selectReplyCount(int totalNo) {
		return lDao.selectReplyCount(totalNo,ss);
	}

	//ajax 커뮤니티 댓글 작성(학천)
	@Override
	public int insertReply(Reply r) {
		return lDao.insertReply(r, ss);
	}
	
	//ajax 커뮤니티 댓글 삭제(학천)
	@Override
	public int deleteReply(int replyNo) {
		return lDao.deleteReply(replyNo, ss);
	}
	//ajax 커뮤니티 댓글 수정(학천)
	@Override
	public int updateReply(Reply r) {
		return lDao.updateReply(r,ss);
	}
	
	//ajax 커뮤니티 댓글 답장(학천)
	@Override
	public int insertReReply(Reply r) {
		return lDao.insertReReply(r,ss);
	}
	
	//ajax 커뮤니티 대댓글 삭제
	@Override
	public int deleteReReply(Reply r) {
		return lDao.deleteReReply(r, ss);
	}
	
	//ajax 커뮤니티 대댓글 수정
	@Override
	public int updateReReply(Reply r) {
		return lDao.updateReReply(r,ss);
	}
	
	//ajax 커뮤니티 신고 
	@Override
	public int reportReply(Report rpt) {
		return lDao.reportReply(rpt,ss);
	}
	
	@Override
	public Tutor selectTutorInfo(int lessonNo) {
		return lDao.selectTutorInfo(lessonNo, ss);
	}

	@Override
	public int deleteLesson(int lno) {
		return lDao.deleteLesson(ss, lno);
	}

	//키즈 화면에 뿌려줄것(학천)
	@Override
	public ArrayList<Lesson> selectKidsPop() {
		return lDao.selectKidsPop(ss);
	}
	@Override
	public ArrayList<Lesson> selectKidsNew() {
		return lDao.selectKidsNew(ss);
	}
	@Override
	public ArrayList<Lesson> selectKidsDisc() {
		return lDao.selectKidsDisc(ss);
	}
	@Override
	public ArrayList<Lesson> selectKidsAll() {
		return lDao.selectKidsAll(ss);
	}

	//머니 화면에 뿌려줄것(학천)
	@Override
	public ArrayList<Lesson> selectMoneyPop() {
		return lDao.selectMoneyPop(ss);
	}
	@Override
	public ArrayList<Lesson> selectMoneyNew() {
		return lDao.selectMoneyNew(ss);
	}
	@Override
	public ArrayList<Lesson> selectMoneyDisc() {
		return lDao.selectMoneyDisc(ss);
	}
	@Override
	public ArrayList<Lesson> selectMoneyAll() {
		return lDao.selectMoneyAll(ss);
	}

	//커리어 화면에 뿌려줄것(학천)
	@Override
	public ArrayList<Lesson> selectCareerPop() {
		return lDao.selectCareerPop(ss);
	}
	@Override
	public ArrayList<Lesson> selectCareerNew() {
		return lDao.selectCareerNew(ss);
	}
	@Override
	public ArrayList<Lesson> selectCareerDisc() {
		return lDao.selectCareerDisc(ss);
	}
	@Override
	public ArrayList<Lesson> selectCareerAll() {
		return lDao.selectCareerAll(ss);
	}
	
	//취미 화면에 뿌려줄것(학천)
	@Override
	public ArrayList<Lesson> selectHobbyPop() {
		return lDao.selectHobbyPop(ss);
	}
	@Override
	public ArrayList<Lesson> selectHobbyNew() {
		return lDao.selectHobbyNew(ss);
	}
	@Override
	public ArrayList<Lesson> selectHobbyDisc() {
		return lDao.selectHobbyDisc(ss);
	}
	@Override
	public ArrayList<Lesson> selectHobbyAll() {
		return lDao.selectHobbyAll(ss);
	}

	@Override
	public int insertLessonFaq(LessonFaq lfaq) {
		return lDao.insertLessonFaq(lfaq, ss);

	}
	
	@Override
	public int insertCurriculum(Curriculum element) {
		return lDao.insertCurriculum(element, ss);
	}
	
	@Override
	public int insertDelInfo(MemPay mp) {
		return lDao.insertDelInfo(mp,ss);

	}

	@Override
	public int dislikeCount(int lessonNo,WishList wl) {
		int result2 = lDao.deleteCount(wl,ss);
		int result = lDao.dislikeCount(lessonNo,ss);
		
		return result * result2;
	}

	@Override
	public int likeCount(int lessonNo, WishList wl) {
		int result2 = lDao.insertCount(wl,ss);
		int result = lDao.likeCount(lessonNo,ss);
		
		return result * result2;
	}

	@Override
	public int insertVideo(Video element) {
		return lDao.insertVideo(element, ss);
		
	}
	
	public int selectWL(WishList wl) {
		return lDao.selectWL(wl, ss);
	}

	@Override
	public int insertLesson(Lesson l) {
		return lDao.insertLesson(l, ss);
	}

	@Override
	public int CurriculumListNo() {
		return lDao.CurriculumListNo(ss);
	}

	
	@Override
	public int selectMemPayList(MemPay mp) {
		return lDao.selectMemPayList(mp, ss);
	}

	@Override
	public ArrayList<Video> selectVideoList(MemPay mp) {
		return lDao.selectVideoList(mp,ss);
	}

	@Override
	public int insertMemVideo(Map<String, Object> map) {
		return lDao.insertMemVideo(map,ss);
	}
	
	public int insertlessonNo() {
		return lDao.insertlessonNo(ss);
	}

	@Override
	public int selectSeqNo() {
		return lDao.selectSeqNo(ss);
	}














	
}
