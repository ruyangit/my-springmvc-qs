/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.easyshop.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 广告Entity
 * @author RuYang
 * @version 2017-08-16
 */
public class Ad extends DataEntity<Ad> {
	
	private static final long serialVersionUID = 1L;
	private String adPositionId;		// ad_position_id
	private String mediaType;		// media_type
	private String name;		// name
	private String link;		// link
	private String imageUrl;		// image_url
	private String content;		// content
	private String endTime;		// end_time
	private String sort;		// 排序号码
	
	public Ad() {
		super();
	}

	public Ad(String id){
		super(id);
	}

	@Length(min=0, max=5, message="ad_position_id长度必须介于 0 和 5 之间")
	public String getAdPositionId() {
		return adPositionId;
	}

	public void setAdPositionId(String adPositionId) {
		this.adPositionId = adPositionId;
	}
	
	@Length(min=0, max=3, message="media_type长度必须介于 0 和 3 之间")
	public String getMediaType() {
		return mediaType;
	}

	public void setMediaType(String mediaType) {
		this.mediaType = mediaType;
	}
	
	@Length(min=1, max=60, message="name长度必须介于 1 和 60 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=255, message="link长度必须介于 0 和 255 之间")
	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
	
	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	@Length(min=0, max=255, message="content长度必须介于 0 和 255 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=11, message="end_time长度必须介于 0 和 11 之间")
	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	@Length(min=0, max=11, message="排序号码长度必须介于 0 和 11 之间")
	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}
	
}