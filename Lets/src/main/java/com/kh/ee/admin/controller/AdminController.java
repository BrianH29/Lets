package com.kh.ee.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.ee.admin.model.service.AdminService;
import com.kh.ee.admin.model.vo.SearchCondition;
import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.common.template.Pagination;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService as; 
	
	@RequestMapping("memberManagement.ad")
	public String memberManagement(){
		return "admin/memberManagementView";
	}
	
	@RequestMapping("classManagement.ad")
	public String classManagement(){
		return "admin/classManagementView";
	}
	
	@RequestMapping("classPayment.ad")
	public String classPayment(){
		return "admin/classPaymentView";
	}
	
	@RequestMapping("saleManagement.ad")
	public String saleManagement(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model){
		int listCount = as.selectListCount(); 
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Member> m = as.selectDiscountList(pi);
		
		model.addAttribute("m",m); 
		model.addAttribute("pi",pi); 
		return "admin/discountManagementView"; 
	}
	
	@RequestMapping("blacklistManagement.ad")
	public String blacklistManagement(){
		return "admin/blacklistManagementView";
	}
	
	@RequestMapping("inqueryManagement.ad")
	public String inqueryManagement(){
		return "admin/inqueryManagementView";
	}
	
	@RequestMapping("reportManagement.ad")
	public String reportManagement(){
		return "admin/reportManagementView";
	}
	
	@RequestMapping("noticeManagement.ad")
	public String noticeManagement(){
		return "admin/noticeManagementView";
	}

	@RequestMapping("faqManagement.ad")
	public String faqManagement(){
		return "admin/faqManagementView";
	}
	
	@ResponseBody
	@RequestMapping("discountSet.ad")
	public String discountSet(Lesson l) {
		int result = as.discountSet(l); 
		
		if(result>0) {
			return "success";
		}else {
			return "fail"; 
		}
	}
	
	@RequestMapping("searchDiscount.ad")
	public String searchDiscount(String condition, String keyword,int currentPage, Model model) {
		
		SearchCondition sc = new SearchCondition(); 
		
		switch(condition) {
		case "writer" : sc.setWriter(keyword); break;
		case "percentage" : sc.setTitle(keyword); break;
		case "content" : sc.setContent(keyword);
		}
		
		int listCount = as.searchDiscountCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Member> m = as.searchDiscountList(sc,pi); 
		
		model.addAttribute("pi",pi);
		model.addAttribute("m",m);
		model.addAttribute("condition",condition);
		model.addAttribute("sc",sc);
		model.addAttribute("keyword",keyword);
		
		return "admin/discountManagementView";
		
	}
	
	@RequestMapping("discountUnApplied.ad")
	public String searchDiscountUnApplied(int currentPage, Model model) {
		int listCount = as.countDiscountUnApplied();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Member> m = as.searchDiscountUnApplied(pi);

		model.addAttribute("m",m);
		model.addAttribute("pi",pi);
		
		return "admin/discountManagementView";
	}
	
	@RequestMapping("discountApplied.ad")
	public String searchDiscountApplied(int currentPage, Model model) {
		int listCount = as.countDiscountApplied();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Member> m = as.searchDiscountApplied(pi);

		model.addAttribute("m",m);
		model.addAttribute("pi",pi);
		
		return "admin/discountManagementView";
	}
}