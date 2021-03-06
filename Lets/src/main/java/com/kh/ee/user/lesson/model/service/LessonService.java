package com.kh.ee.user.lesson.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.curriculum.model.vo.Curriculum;
import com.kh.ee.user.curriculum.model.vo.Video;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.lesson.model.vo.LessonFaq;
import com.kh.ee.user.lesson.model.vo.WishList;
import com.kh.ee.user.memPay.model.vo.MemPay;
import com.kh.ee.user.reply.model.vo.Reply;
import com.kh.ee.user.report.model.vo.Report;
import com.kh.ee.user.review.model.vo.Review;
import com.kh.ee.user.tutor.model.vo.Tutor;

public interface LessonService {
	
	ArrayList<Lesson> selectApproveLessonList(int memNo);
	
	ArrayList<Lesson> selectApproveStatusList(int memNo);
	
	// 상세페이지에 뿌려줄 내용들 (학천)
	Lesson selectLessonList(int lessonNo);
	ArrayList<Review> selectReview(int lessonNo); 
	ArrayList<LessonFaq> selectLessonFaqList(int lessonNo); 
	Tutor selectTutorInfo(int lessonNo); 
	int selectListCount();
	//ajax(학천)
	ArrayList<Reply> selectReply(int totalNo, PageInfo pi);
	int selectReplyCount(int totalNo);
	int insertReply(Reply r);
	int deleteReply(int replyNo);
	int updateReply(Reply r);
	int insertReReply(Reply r);
	int deleteReReply(Reply r);
	int updateReReply(Reply r);
	int reportReply(Report rpt);
	int likeCount(int lessonNo, WishList wl); 
	int dislikeCount(int lessonNo, WishList wl);
	ArrayList<Curriculum> selectCurrList(int lessonNo);
	//
	
	int deleteLesson(int lno);

	//키즈 화면에 뿌려줄것(학천)
	ArrayList<Lesson> selectKidsPop();
	ArrayList<Lesson> selectKidsNew();
	ArrayList<Lesson> selectKidsDisc();
	ArrayList<Lesson> selectKidsAll();

	//머니 화면에 뿌려줄것(학천)
	ArrayList<Lesson> selectMoneyPop();
	ArrayList<Lesson> selectMoneyNew();
	ArrayList<Lesson> selectMoneyDisc();
	ArrayList<Lesson> selectMoneyAll();

	//커리어 화면에 뿌려줄것(학천)
	ArrayList<Lesson> selectCareerPop();
	ArrayList<Lesson> selectCareerNew();
	ArrayList<Lesson> selectCareerDisc();
	ArrayList<Lesson> selectCareerAll();

	//취미 화면에 뿌려줄것(학천)
	ArrayList<Lesson> selectHobbyPop();
	ArrayList<Lesson> selectHobbyNew();
	ArrayList<Lesson> selectHobbyDisc();
	ArrayList<Lesson> selectHobbyAll();
	
	//결제 내역 입력
	int insertDelInfo(MemPay mp); 
	int selectWL(WishList wl);

	// 클래스 등록(현선)
	int insertLessonFaq(LessonFaq lfaq);	
	int insertCurriculum(Curriculum element);
	int insertVideo(Video element);
	int insertLesson(Lesson l);
	int insertlessonNo();

	int CurriculumListNo();
	
	int selectMemPayList(MemPay mp);

	ArrayList<Video> selectVideoList(MemPay mp);

	int insertMemVideo(Map<String, Object> map);
	
	int selectSeqNo();





	

	

	












}
