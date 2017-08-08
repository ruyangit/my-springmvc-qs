/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.easyshop.web.front;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.thinkgem.jeesite.common.utils.HttpUtil;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.easyshop.entity.User;
import com.thinkgem.jeesite.modules.easyshop.service.UserService;

/**
 * 会员Controller
 * 
 * @author RuYang
 * @version 2017-08-08
 */
@Controller("FrontUserController")
@RequestMapping(value = "${frontPath}/user")
public class UserController extends BaseController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = { "auth", "" }, method = RequestMethod.GET)
	public String index(HttpServletRequest request, Model model) {
		String callback = request.getParameter("callback");
		if (StringUtils.isNotEmpty(callback)) {
			model.addAttribute("callback", callback);
		}
		return "front/auth";
	}
	
	@RequestMapping(value = { "auth", "" }, method = RequestMethod.POST)
	public String auth(HttpServletRequest request, Model model) {
		String callback = request.getParameter("callback");
		if (StringUtils.isNotEmpty(callback)) {
			model.addAttribute("callback", callback);
		}
		
		String sn = request.getParameter("sn");
		// 获取文章内容
		User user = userService.getBySn(sn);
		if (user == null || !User.DEL_FLAG_NORMAL.equals(user.getDelFlag())) {
			addMessage(model, "用户信息获取失败");
			return "front/auth";
		}
		request.getSession().setAttribute(User.SESSION_KEY, user);
		/*
		 * 登录需要跳转登录前页面，自己处理 callback 使用 HttpUtil.decodeURL(xx) 解码后重定向
		 */
		if (StringUtils.isEmpty(callback)) {
			callback = frontPath;
		} else {
			callback = HttpUtil.decodeURL(callback);
		}
		return "redirect:" + callback;
	}
}