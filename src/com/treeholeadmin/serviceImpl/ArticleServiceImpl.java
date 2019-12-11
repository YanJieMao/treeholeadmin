package com.treeholeadmin.serviceImpl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.treeholeadmin.domain.Article;
import com.treeholeadmin.mapper.ArticleMapper;
import com.treeholeadmin.service.ArticleService;


@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
@Service("articleService")

public class ArticleServiceImpl  implements ArticleService {
	
	/**
	 * 自动注入ArticleMapper
	 * */
	@Autowired
	private ArticleMapper articleMapper;

	/**
	 * ArticleService接口getAll方法实现
	 * @see { ArticleService }
	 * */
	@Transactional(readOnly=true)
	@Override
	public List<Article> getAll() {
		
		return articleMapper.findAll();
	}
	
	
	/**
	 * 删除方法实现
	 * 
	 * */
	@Override
	public void removeArticleById(Integer id) {
		articleMapper.delById(id);
		
	}
	
	


	
	
	

}
