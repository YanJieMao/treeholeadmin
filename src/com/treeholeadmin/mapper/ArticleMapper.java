package com.treeholeadmin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;


import com.treeholeadmin.domain.Article;;

public interface ArticleMapper {
	
	
	/**
	 * 查询所有
	 * @return 对象集合
	 * */
	@Select(" select * from article ")
	List<Article> findAll();
	//删除
	@Delete(" delete from article where id=#{id}")
	  void delById(int id);
	
	
	

}
