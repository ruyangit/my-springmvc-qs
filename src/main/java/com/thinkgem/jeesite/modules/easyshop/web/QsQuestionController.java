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
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.easyshop.entity.QsQuestion;
import com.thinkgem.jeesite.modules.easyshop.service.QsQuestionService;

/**
 * 问卷Controller
 * @author RuYang
 * @version 2017-08-08
 */
@Controller
@RequestMapping(value = "${adminPath}/easyshop/qsQuestion")
public class QsQuestionController extends BaseController {

	@Autowired
	private QsQuestionService qsQuestionService;
	
	@ModelAttribute
	public QsQuestion get(@RequestParam(required=false) String id) {
		QsQuestion entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = qsQuestionService.get(id);
		}
		if (entity == null){
			entity = new QsQuestion();
		}
		return entity;
	}
	
	@RequiresPermissions("easyshop:qsQuestion:view")
	@RequestMapping(value = {"list", ""})
	public String list(QsQuestion qsQuestion, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<QsQuestion> page = qsQuestionService.findPage(new Page<QsQuestion>(request, response), qsQuestion); 
		model.addAttribute("page", page);
		return "modules/easyshop/qsQuestionList";
	}

	@RequiresPermissions("easyshop:qsQuestion:view")
	@RequestMapping(value = "form")
	public String form(QsQuestion qsQuestion, Model model) {
		model.addAttribute("qsQuestion", qsQuestion);
		return "modules/easyshop/qsQuestionForm";
	}

	@RequiresPermissions("easyshop:qsQuestion:edit")
	@RequestMapping(value = "save")
	public String save(QsQuestion qsQuestion, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, qsQuestion)){
			return form(qsQuestion, model);
		}
		qsQuestionService.save(qsQuestion);
		addMessage(redirectAttributes, "保存问卷成功");
		return "redirect:"+Global.getAdminPath()+"/easyshop/qsQuestion/?repage";
	}
	
	@RequiresPermissions("easyshop:qsQuestion:edit")
	@RequestMapping(value = "delete")
	public String delete(QsQuestion qsQuestion, RedirectAttributes redirectAttributes) {
		qsQuestionService.delete(qsQuestion);
		addMessage(redirectAttributes, "删除问卷成功");
		return "redirect:"+Global.getAdminPath()+"/easyshop/qsQuestion/?repage";
	}
	
}