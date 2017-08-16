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
import com.thinkgem.jeesite.modules.easyshop.entity.Ad;
import com.thinkgem.jeesite.modules.easyshop.service.AdService;

/**
 * 广告Controller
 * @author RuYang
 * @version 2017-08-16
 */
@Controller
@RequestMapping(value = "${adminPath}/easyshop/ad")
public class AdController extends BaseController {

	@Autowired
	private AdService adService;
	
	@ModelAttribute
	public Ad get(@RequestParam(required=false) String id) {
		Ad entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = adService.get(id);
		}
		if (entity == null){
			entity = new Ad();
		}
		return entity;
	}
	
	@RequiresPermissions("easyshop:ad:view")
	@RequestMapping(value = {"list", ""})
	public String list(Ad ad, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Ad> page = adService.findPage(new Page<Ad>(request, response), ad); 
		model.addAttribute("page", page);
		return "modules/easyshop/adList";
	}

	@RequiresPermissions("easyshop:ad:view")
	@RequestMapping(value = "form")
	public String form(Ad ad, Model model) {
		model.addAttribute("ad", ad);
		return "modules/easyshop/adForm";
	}

	@RequiresPermissions("easyshop:ad:edit")
	@RequestMapping(value = "save")
	public String save(Ad ad, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, ad)){
			return form(ad, model);
		}
		adService.save(ad);
		addMessage(redirectAttributes, "保存广告成功");
		return "redirect:"+Global.getAdminPath()+"/easyshop/ad/?repage";
	}
	
	@RequiresPermissions("easyshop:ad:edit")
	@RequestMapping(value = "delete")
	public String delete(Ad ad, RedirectAttributes redirectAttributes) {
		adService.delete(ad);
		addMessage(redirectAttributes, "删除广告成功");
		return "redirect:"+Global.getAdminPath()+"/easyshop/ad/?repage";
	}

}