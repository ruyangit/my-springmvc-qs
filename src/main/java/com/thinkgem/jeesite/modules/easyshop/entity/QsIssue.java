/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.easyshop.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 问题Entity
 * @author RuYang
 * @version 2017-08-08
 */
public class QsIssue extends DataEntity<QsIssue> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 问题
	private String questionType;		// 类型
	private String isNeed;		// 是否必填
	private String maxAn;		// 最多答案，复选题使用
	private String sort;		// 排序（升序）
	private String questionId;		// question_id
	private String options;		// 答案（多个答案以英文,号分割）
	
	private String value; //答案
	
	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public QsIssue() {
		super();
		this.isNeed="1";
	}

	public QsIssue(String id){
		super(id);
	}

	@Length(min=1, max=100, message="问题长度必须介于 1 和 100 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=1, max=1, message="类型长度必须介于 1 和 1 之间")
	public String getQuestionType() {
		return questionType;
	}

	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}
	
	@Length(min=1, max=1, message="是否必填长度必须介于 1 和 1 之间")
	public String getIsNeed() {
		return isNeed;
	}

	public void setIsNeed(String isNeed) {
		this.isNeed = isNeed;
	}
	
	@Length(min=0, max=1, message="最多答案，复选题使用长度必须介于 0 和 1 之间")
	public String getMaxAn() {
		return maxAn;
	}

	public void setMaxAn(String maxAn) {
		this.maxAn = maxAn;
	}
	
	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}
	
	@Length(min=0, max=2000, message="答案（多个答案以英文,号分割）长度必须介于 0 和 2000 之间")
	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
	}
	
	@Length(min=1, max=11, message="question_id长度必须介于 1 和 11 之间")
	public String getQuestionId() {
		return questionId;
	}

	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}

}