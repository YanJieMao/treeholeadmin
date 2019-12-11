package com.treeholeadmin.service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.treeholeadmin.domain.Article;


@Service
public interface ArticleService {
	
	
	/**
	 * 查找所有
	 * @return 对象集合
	 * */
	List<Article> getAll();
	
	
    //删除
	void removeArticleById(Integer id);


}
