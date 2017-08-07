/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.easyshop.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.easyshop.entity.User;
import com.thinkgem.jeesite.modules.easyshop.service.UserService;

/**
 * 会员信息Controller
 * @author RuYang
 * @version 2017-08-07
 */
@Controller("EasyshopUserController")
@RequestMapping(value = "${adminPath}/easyshop/user")
public class UserController extends BaseController {

	@Autowired
	private UserService userService;
	
	@ModelAttribute
	public User get(@RequestParam(required=false) String id) {
		User entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = userService.get(id);
		}
		if (entity == null){
			entity = new User();
		}
		return entity;
	}
	
	@RequiresPermissions("easyshop:user:view")
	@RequestMapping(value = {"list", ""})
	public String list(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<User> page = userService.findPage(new Page<User>(request, response), user); 
		model.addAttribute("page", page);
		return "modules/easyshop/userList";
	}

	@RequiresPermissions("easyshop:user:view")
	@RequestMapping(value = "form")
	public String form(User user, Model model) {
		model.addAttribute("user", user);
		return "modules/easyshop/userForm";
	}

	@RequiresPermissions("easyshop:user:edit")
	@RequestMapping(value = "save")
	public String save(User user, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, user)){
			return form(user, model);
		}
		userService.save(user);
		addMessage(redirectAttributes, "保存会员信息成功");
		return "redirect:"+Global.getAdminPath()+"/easyshop/user/?repage";
	}
	
	@RequiresPermissions("easyshop:user:edit")
	@RequestMapping(value = "delete")
	public String delete(User user, RedirectAttributes redirectAttributes) {
		userService.delete(user);
		addMessage(redirectAttributes, "删除会员信息成功");
		return "redirect:"+Global.getAdminPath()+"/easyshop/user/?repage";
	}

}