/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.easyshop.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 商品品牌信息Entity
 * @author RuYang
 * @version 2017-08-07
 */
public class Brand extends DataEntity<Brand> {
	
	private static final long serialVersionUID = 1L;
	private String brandName;		// 品牌名称
	private String brandLogo;		// 上传图片
	private String brandDesc;		// 品牌描述
	private String siteUrl;		// 品牌网址
	private String isShow;		// 是否显示
	private String sort;		// 排序号码
	
	public Brand() {
		super();
	}

	public Brand(String id){
		super(id);
	}

	@Length(min=1, max=60, message="品牌名称长度必须介于 1 和 60 之间")
	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	
	@Length(min=0, max=80, message="上传图片长度必须介于 0 和 80 之间")
	public String getBrandLogo() {
		return brandLogo;
	}

	public void setBrandLogo(String brandLogo) {
		this.brandLogo = brandLogo;
	}
	
	public String getBrandDesc() {
		return brandDesc;
	}

	public void setBrandDesc(String brandDesc) {
		this.brandDesc = brandDesc;
	}
	
	@Length(min=0, max=255, message="品牌网址长度必须介于 0 和 255 之间")
	public String getSiteUrl() {
		return siteUrl;
	}

	public void setSiteUrl(String siteUrl) {
		this.siteUrl = siteUrl;
	}
	
	@Length(min=1, max=1, message="是否显示长度必须介于 1 和 1 之间")
	public String getIsShow() {
		return isShow;
	}

	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}
	
	@Length(min=1, max=11, message="排序号码长度必须介于 1 和 11 之间")
	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}
	
}