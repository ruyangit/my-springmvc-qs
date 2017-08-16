/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.easyshop.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.easyshop.entity.QsIssue;
import com.thinkgem.jeesite.modules.easyshop.dao.QsIssueDao;

/**
 * 问题Service
 * @author RuYang
 * @version 2017-08-08
 */
@Service
@Transactional(readOnly = true)
public class QsIssueService extends CrudService<QsIssueDao, QsIssue> {

	public QsIssue get(String id) {
		return super.get(id);
	}
	
	public List<QsIssue> findList(QsIssue qsIssue) {
		return super.findList(qsIssue);
	}
	
	public Page<QsIssue> findPage(Page<QsIssue> page, QsIssue qsIssue) {
		return super.findPage(page, qsIssue);
	}
	
	@Transactional(readOnly = false)
	public void save(QsIssue qsIssue) {
		super.save(qsIssue);
	}
	
	@Transactional(readOnly = false)
	public void delete(QsIssue qsIssue) {
		super.delete(qsIssue);
	}
	
	public List<QsIssue> findListAndAnswer(Map<String, Object> param){
		return dao.findListAndAnswer(param);
	}
}