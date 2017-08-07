/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.easyshop.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.TreeService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.easyshop.entity.Category;
import com.thinkgem.jeesite.modules.easyshop.dao.CategoryDao;

/**
 * 商品分类信息Service
 * @author RuYang
 * @version 2017-08-07
 */
@Service
@Transactional(readOnly = true)
public class CategoryService extends TreeService<CategoryDao, Category> {

	public Category get(String id) {
		return super.get(id);
	}
	
	public List<Category> findList(Category category) {
		if (StringUtils.isNotBlank(category.getParentIds())){
			category.setParentIds(","+category.getParentIds()+",");
		}
		return super.findList(category);
	}
	
	@Transactional(readOnly = false)
	public void save(Category category) {
		super.save(category);
	}
	
	@Transactional(readOnly = false)
	public void delete(Category category) {
		super.delete(category);
	}
	
}