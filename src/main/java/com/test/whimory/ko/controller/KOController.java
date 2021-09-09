package com.test.whimory.ko.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.whimory.ko.model.service.KOService;
import com.test.whimory.ko.model.vo.KO;

@Controller
public class KOController {
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	KOService koService;
	
	@RequestMapping("klist.do")
	public String koListMethod(Model model) {
		ArrayList<KO> list = koService.selectList();
		
		if(list.size() > 0) {
			model.addAttribute("list", list);
			return "ko/koListView";
		} else {
			model.addAttribute("message", "ko 전체 목록을 조회하는 것을 실패했습니다");
			return "common/error";
		}
		
	} // koListMethod
	
	@RequestMapping("kcate.do")
	public String koSearchCategory(@RequestParam("cate") String category, Model model) {
		ArrayList<KO> list = koService.selectSearchCategory(category);
		
		if(list.size() > 0) {
			model.addAttribute("list", list);
			return "ko/koListView";
		} else {
			model.addAttribute("message", category + "별 목록을 조회하는 데 실패했습니다.");
			return "common/error";
		}
		
	} // koSearchCategory
	
	
	
	
}




