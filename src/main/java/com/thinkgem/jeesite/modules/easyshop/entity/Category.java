/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.easyshop.entity;

import org.hibernate.validator.constraints.Length;
import com.fasterxml.jackson.annotation.JsonBackReference;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.TreeEntity;

/**
 * 商品分类信息Entity
 * @author RuYang
 * @version 2017-08-07
 */
public class Category extends TreeEntity<Category> {
	
	private static final long serialVersionUID = 1L;
	private String catName;		// 分类名称
	private String catStructName;		// 中文名称分类结构
	private String categoryImg;		// 分类图片
	private String keywords;		// 分类的关键字,可能是为了搜索
	private String catLevel;		// 层级
	private String catDesc;		// 分类描述
	private Category parent;		// 该分类的父类ID,取值于该表的id字段
	private String parentIds;		// 该分类的父类ID,取值于该表的id字段
	private String templateFile;		// 不确定字段,按名和表设计猜,应该是该分类的单独模板文件的名字
	private String measureUnit;		// 该分类的计量单位
	private String style;		// 该分类的单独的样式表的包括文件部分的文件路径
	private String grade;		// 该分类的最高和最低价之间的价格分级,当大于1时,会根据最大最小价格区间分成区间,会在页面显示价格范围,如0-300,300-600,600-900这种;
	private String filterAttr;		// 如果该字段有值,则该分类将还会按照该值对应在表goods_attr的goods_attr_id所对应的属性筛选，如，封面颜色下有红，黑分类筛选
	private String isShow;		// 是否在前台页面显示1显示;0不显示
	
	public Category() {
		super();
	}

	public Category(String id){
		super(id);
	}

	@Length(min=1, max=90, message="分类名称长度必须介于 1 和 90 之间")
	public String getCatName() {
		return catName;
	}

	public void setCatName(String catName) {
		this.catName = catName;
	}
	
	@Length(min=0, max=255, message="中文名称分类结构长度必须介于 0 和 255 之间")
	public String getCatStructName() {
		return catStructName;
	}

	public void setCatStructName(String catStructName) {
		this.catStructName = catStructName;
	}
	
	@Length(min=0, max=255, message="分类图片长度必须介于 0 和 255 之间")
	public String getCategoryImg() {
		return categoryImg;
	}

	public void setCategoryImg(String categoryImg) {
		this.categoryImg = categoryImg;
	}
	
	@Length(min=0, max=255, message="分类的关键字,可能是为了搜索长度必须介于 0 和 255 之间")
	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	
	@Length(min=0, max=11, message="层级长度必须介于 0 和 11 之间")
	public String getCatLevel() {
		return catLevel;
	}

	public void setCatLevel(String catLevel) {
		this.catLevel = catLevel;
	}
	
	@Length(min=0, max=255, message="分类描述长度必须介于 0 和 255 之间")
	public String getCatDesc() {
		return catDesc;
	}

	public void setCatDesc(String catDesc) {
		this.catDesc = catDesc;
	}
	
	@JsonBackReference
	@NotNull(message="该分类的父类ID,取值于该表的id字段不能为空")
	public Category getParent() {
		return parent;
	}

	public void setParent(Category parent) {
		this.parent = parent;
	}
	
	@Length(min=0, max=2000, message="该分类的父类ID,取值于该表的id字段长度必须介于 0 和 2000 之间")
	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}
	
	@Length(min=0, max=50, message="不确定字段,按名和表设计猜,应该是该分类的单独模板文件的名字长度必须介于 0 和 50 之间")
	public String getTemplateFile() {
		return templateFile;
	}

	public void setTemplateFile(String templateFile) {
		this.templateFile = templateFile;
	}
	
	@Length(min=0, max=15, message="该分类的计量单位长度必须介于 0 和 15 之间")
	public String getMeasureUnit() {
		return measureUnit;
	}

	public void setMeasureUnit(String measureUnit) {
		this.measureUnit = measureUnit;
	}
	
	@Length(min=0, max=150, message="该分类的单独的样式表的包括文件部分的文件路径长度必须介于 0 和 150 之间")
	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}
	
	@Length(min=1, max=1, message="该分类的最高和最低价之间的价格分级,当大于1时,会根据最大最小价格区间分成区间,会在页面显示价格范围,如0-300,300-600,600-900这种;长度必须介于 1 和 1 之间")
	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	@Length(min=0, max=255, message="如果该字段有值,则该分类将还会按照该值对应在表goods_attr的goods_attr_id所对应的属性筛选，如，封面颜色下有红，黑分类筛选长度必须介于 0 和 255 之间")
	public String getFilterAttr() {
		return filterAttr;
	}

	public void setFilterAttr(String filterAttr) {
		this.filterAttr = filterAttr;
	}
	
	@Length(min=1, max=1, message="是否在前台页面显示1显示;0不显示长度必须介于 1 和 1 之间")
	public String getIsShow() {
		return isShow;
	}

	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}
	
	
	public String getParentId() {
		return parent != null && parent.getId() != null ? parent.getId() : "0";
	}
}