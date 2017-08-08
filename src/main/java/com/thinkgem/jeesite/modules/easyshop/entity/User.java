/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.easyshop.entity;

import org.apache.ibatis.type.Alias;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 会员Entity
 * 
 * @author RuYang
 * @version 2017-08-08
 */
@Alias("EasyshopUser")
public class User extends DataEntity<User> {

	public final static String SESSION_KEY = "USER_SESSION_KEY";

	private static final long serialVersionUID = 1L;
	private String name; // 姓名
	private String sn; // 编号
	private String gender; // 性别0：未知1：男2：女
	private String identityCard; // 身份证
	private String wechat; // 微信
	private String qq; // QQ
	private Date birth; // 出生日期
	private String birthPlace; // 出生地
	private String issuePlace; // 签发地
	private Date issueDate; // 签发时间
	private Date expiryDate; // 到期时间
	private String photo; // 头像
	private String passport; // 护照
	private String passportPhoto; // 护照照片
	private String phone; // 电话
	private String email; // 邮件
	private String username; // 登录名称
	private String password; // 登录密码
	private String integral; // integral

	public User() {
		super();
	}

	public User(String id) {
		super(id);
	}

	@Length(min = 1, max = 64, message = "姓名长度必须介于 1 和 64 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Length(min = 0, max = 255, message = "编号长度必须介于 0 和 255 之间")
	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

	@Length(min = 0, max = 1, message = "性别0：未知1：男2：女长度必须介于 0 和 1 之间")
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Length(min = 0, max = 36, message = "身份证长度必须介于 0 和 36 之间")
	public String getIdentityCard() {
		return identityCard;
	}

	public void setIdentityCard(String identityCard) {
		this.identityCard = identityCard;
	}

	@Length(min = 0, max = 50, message = "微信长度必须介于 0 和 50 之间")
	public String getWechat() {
		return wechat;
	}

	public void setWechat(String wechat) {
		this.wechat = wechat;
	}

	@Length(min = 0, max = 20, message = "QQ长度必须介于 0 和 20 之间")
	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	@Length(min = 0, max = 255, message = "出生地长度必须介于 0 和 255 之间")
	public String getBirthPlace() {
		return birthPlace;
	}

	public void setBirthPlace(String birthPlace) {
		this.birthPlace = birthPlace;
	}

	@Length(min = 0, max = 255, message = "签发地长度必须介于 0 和 255 之间")
	public String getIssuePlace() {
		return issuePlace;
	}

	public void setIssuePlace(String issuePlace) {
		this.issuePlace = issuePlace;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}

	@Length(min = 0, max = 255, message = "头像长度必须介于 0 和 255 之间")
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Length(min = 0, max = 36, message = "护照长度必须介于 0 和 36 之间")
	public String getPassport() {
		return passport;
	}

	public void setPassport(String passport) {
		this.passport = passport;
	}

	@Length(min = 0, max = 255, message = "护照照片长度必须介于 0 和 255 之间")
	public String getPassportPhoto() {
		return passportPhoto;
	}

	public void setPassportPhoto(String passportPhoto) {
		this.passportPhoto = passportPhoto;
	}

	@Length(min = 0, max = 36, message = "电话长度必须介于 0 和 36 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Length(min = 0, max = 36, message = "邮件长度必须介于 0 和 36 之间")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Length(min = 0, max = 255, message = "登录名称长度必须介于 0 和 255 之间")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Length(min = 0, max = 255, message = "登录密码长度必须介于 0 和 255 之间")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Length(min = 1, max = 11, message = "integral长度必须介于 1 和 11 之间")
	public String getIntegral() {
		return integral;
	}

	public void setIntegral(String integral) {
		this.integral = integral;
	}

}