package com.treeholeadmin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.treeholeadmin.domain.Article;
import com.treeholeadmin.service.ArticleService;

/**
 * 处理main请求控制器
 * */
@Controller
@RequestMapping(value="/main")
public class ArticleController {
	
	/**
	 * 自动注入ArticleService
	 * */
	@Autowired
	@Qualifier("articleService")
	private ArticleService articleService;

	/**
	 * 处理/query请求
	 * */
	
	
	@RequestMapping(value="admin")
	public ModelAndView query(){
		List<Article> article_list = articleService.getAll();
		ModelAndView mav=new ModelAndView();
		mav.addObject("main", article_list);
		mav.setViewName("main");
		return mav;
	}
	
	//删除操作
	@RequestMapping(value="delete")
	@ResponseBody
	public String delete(@RequestParam(value="id") String id){
		articleService.removeArticleById(Integer.parseInt(id));
		return "ok";
	}
	
	
	
	
}
