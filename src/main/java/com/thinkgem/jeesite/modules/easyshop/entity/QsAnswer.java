/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.easyshop.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 答案Entity
 * @author RuYang
 * @version 2017-08-08
 */
public class QsAnswer extends DataEntity<QsAnswer> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 问卷
	private String questionId;		// 问卷
	private String anId;		// 问题
	private String value;		// 答案
	
	public QsAnswer() {
		super();
	}

	public QsAnswer(String id){
		super(id);
	}

	@NotNull(message="问卷不能为空")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=1, max=11, message="问卷长度必须介于 1 和 11 之间")
	public String getQuestionId() {
		return questionId;
	}

	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}
	
	@Length(min=1, max=1, message="问题长度必须介于 1 和 1 之间")
	public String getAnId() {
		return anId;
	}

	public void setAnId(String anId) {
		this.anId = anId;
	}
	
	@Length(min=1, max=2000, message="答案长度必须介于 1 和 2000 之间")
	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
}