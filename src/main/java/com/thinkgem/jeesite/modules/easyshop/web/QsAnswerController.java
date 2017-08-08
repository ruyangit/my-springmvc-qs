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
import com.thinkgem.jeesite.modules.easyshop.entity.QsAnswer;
import com.thinkgem.jeesite.modules.easyshop.service.QsAnswerService;

/**
 * 答案Controller
 * @author RuYang
 * @version 2017-08-08
 */
@Controller
@RequestMapping(value = "${adminPath}/easyshop/qsAnswer")
public class QsAnswerController extends BaseController {

	@Autowired
	private QsAnswerService qsAnswerService;
	
	@ModelAttribute
	public QsAnswer get(@RequestParam(required=false) String id) {
		QsAnswer entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = qsAnswerService.get(id);
		}
		if (entity == null){
			entity = new QsAnswer();
		}
		return entity;
	}
	
	@RequiresPermissions("easyshop:qsAnswer:view")
	@RequestMapping(value = {"list", ""})
	public String list(QsAnswer qsAnswer, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<QsAnswer> page = qsAnswerService.findPage(new Page<QsAnswer>(request, response), qsAnswer); 
		model.addAttribute("page", page);
		return "modules/easyshop/qsAnswerList";
	}

	@RequiresPermissions("easyshop:qsAnswer:view")
	@RequestMapping(value = "form")
	public String form(QsAnswer qsAnswer, Model model) {
		model.addAttribute("qsAnswer", qsAnswer);
		return "modules/easyshop/qsAnswerForm";
	}

	@RequiresPermissions("easyshop:qsAnswer:edit")
	@RequestMapping(value = "save")
	public String save(QsAnswer qsAnswer, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, qsAnswer)){
			return form(qsAnswer, model);
		}
		qsAnswerService.save(qsAnswer);
		addMessage(redirectAttributes, "保存答案成功");
		return "redirect:"+Global.getAdminPath()+"/easyshop/qsAnswer/?repage";
	}
	
	@RequiresPermissions("easyshop:qsAnswer:edit")
	@RequestMapping(value = "delete")
	public String delete(QsAnswer qsAnswer, RedirectAttributes redirectAttributes) {
		qsAnswerService.delete(qsAnswer);
		addMessage(redirectAttributes, "删除答案成功");
		return "redirect:"+Global.getAdminPath()+"/easyshop/qsAnswer/?repage";
	}

}