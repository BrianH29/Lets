package com.kh.ee.user.lesson.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LessonController {

	@RequestMapping("kids.le")
	public String kidsCurriculum() {
		return "user/lesson/kidsCurriculumListView";
	}
	
	@RequestMapping("money.le")
	public String moneyCurriculum() {
		return "user/lesson/moneyCurriculumListView";
	}	
	
	@RequestMapping("career.le")
	public String careerCurriculum() {
		return "user/lesson/careerCurriculumListView";
	}	
	
	@RequestMapping("hobby.le")
	public String hobbyCurriculum() {
		return "user/lesson/hobbyCurriculumListView";
	}	
	
	@RequestMapping("preview.le")
	public String previewLesson() {
		return "user/lesson/previewLesson";
	}
	
	@RequestMapping("payClass.le")
	public String paymentDetail() {
		return"user/lesson/paymentDetailView";
	}
	
}