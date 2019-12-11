package com.treeholeadmin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 页面跳转控制器
 * */
@Controller
public class FormController{

	@RequestMapping(value="/loginForm")
	 public String loginForm(){
		// 跳转页面
		return "loginForm";
	}

}

