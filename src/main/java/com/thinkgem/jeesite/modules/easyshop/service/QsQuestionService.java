/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.easyshop.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.easyshop.entity.QsQuestion;
import com.thinkgem.jeesite.modules.easyshop.dao.QsQuestionDao;

/**
 * 问卷Service
 * @author RuYang
 * @version 2017-08-08
 */
@Service
@Transactional(readOnly = true)
public class QsQuestionService extends CrudService<QsQuestionDao, QsQuestion> {

	public QsQuestion get(String id) {
		return super.get(id);
	}
	
	public List<QsQuestion> findList(QsQuestion qsQuestion) {
		return super.findList(qsQuestion);
	}
	
	public Page<QsQuestion> findPage(Page<QsQuestion> page, QsQuestion qsQuestion) {
		return super.findPage(page, qsQuestion);
	}
	
	@Transactional(readOnly = false)
	public void save(QsQuestion qsQuestion) {
		super.save(qsQuestion);
	}
	
	@Transactional(readOnly = false)
	public void delete(QsQuestion qsQuestion) {
		super.delete(qsQuestion);
	}
	
}