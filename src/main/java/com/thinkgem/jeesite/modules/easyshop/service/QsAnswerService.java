/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.easyshop.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.easyshop.entity.QsAnswer;
import com.thinkgem.jeesite.modules.easyshop.dao.QsAnswerDao;

/**
 * 答案Service
 * @author RuYang
 * @version 2017-08-08
 */
@Service
@Transactional(readOnly = true)
public class QsAnswerService extends CrudService<QsAnswerDao, QsAnswer> {

	public QsAnswer get(String id) {
		return super.get(id);
	}
	
	public List<QsAnswer> findList(QsAnswer qsAnswer) {
		return super.findList(qsAnswer);
	}
	
	public Page<QsAnswer> findPage(Page<QsAnswer> page, QsAnswer qsAnswer) {
		return super.findPage(page, qsAnswer);
	}
	
	@Transactional(readOnly = false)
	public void save(QsAnswer qsAnswer) {
		super.save(qsAnswer);
	}
	
	@Transactional(readOnly = false)
	public void delete(QsAnswer qsAnswer) {
		super.delete(qsAnswer);
	}
	
}