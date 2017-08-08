/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.easyshop.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.easyshop.entity.QsIssue;

/**
 * 问题DAO接口
 * @author RuYang
 * @version 2017-08-08
 */
@MyBatisDao
public interface QsIssueDao extends CrudDao<QsIssue> {
	
}