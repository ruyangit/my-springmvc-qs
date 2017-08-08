/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.easyshop.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.easyshop.entity.QsIssue;
import com.thinkgem.jeesite.modules.easyshop.entity.QsQuestion;
import com.thinkgem.jeesite.modules.easyshop.service.QsIssueService;
import com.thinkgem.jeesite.modules.easyshop.service.QsQuestionService;

/**
 * 问题Controller
 * @author RuYang
 * @version 2017-08-08
 */
@Controller
@RequestMapping(value = "${adminPath}/easyshop/qsIssue")
public class QsIssueController extends BaseController {

	@Autowired
	private QsIssueService qsIssueService;
	
	@Autowired
	private QsQuestionService qsQuestionService;
	
	@ModelAttribute
	public QsIssue get(@RequestParam(required=false) String id) {
		QsIssue entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = qsIssueService.get(id);
		}
		if (entity == null){
			entity = new QsIssue();
		}
		return entity;
	}
	
//	@RequiresPermissions("easyshop:qsIssue:edit")
	@RequestMapping(value = "save")
	public String save(QsIssue qsIssue, Model model,HttpServletRequest request, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, qsIssue)){
			return edit(qsIssue,request, model);
		}
		qsIssueService.save(qsIssue);
		addMessage(redirectAttributes, "保存问题成功");
		return "redirect:"+Global.getAdminPath()+"/easyshop/qsIssue/edit?questionId="+qsIssue.getQuestionId();
	}
	
//	@RequiresPermissions("easyshop:qsIssue:edit")
	@RequestMapping(value = "delete")
	public String delete(QsIssue qsIssue, RedirectAttributes redirectAttributes) {
		qsIssueService.delete(qsIssue);
		addMessage(redirectAttributes, "删除问题成功");
		return "redirect:"+Global.getAdminPath()+"/easyshop/qsIssue/edit?questionId="+qsIssue.getQuestionId();
	}

	//===========================================================================================
	
	@RequestMapping(value = "edit")
	public String edit(QsIssue qsIssue,HttpServletRequest request,Model model) {
		model.addAttribute("qsIssue", qsIssue);
		String questionId = request.getParameter("questionId");
		if(StringUtils.isNotBlank(qsIssue.getQuestionId())){
			questionId = qsIssue.getQuestionId();
		}
		QsQuestion entity = null;
		if (StringUtils.isNotBlank(questionId)){
			entity = qsQuestionService.get(questionId);
		}
		if (entity == null){
			entity = new QsQuestion();
		}
		model.addAttribute("qsQuestion", entity);
		qsIssue = new QsIssue();
		qsIssue.setQuestionId(questionId);
		List<QsIssue> qsIssueList =  qsIssueService.findList(qsIssue);
		model.addAttribute("qsIssueList", qsIssueList);
		return "modules/easyshop/qsIssueEdit";
	}
}