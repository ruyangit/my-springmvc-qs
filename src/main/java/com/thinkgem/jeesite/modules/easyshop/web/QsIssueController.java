/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.easyshop.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	
	@RequestMapping("view")
	public String index(QsQuestion qsQuestion, HttpServletRequest request, HttpServletResponse response, Model model) {
		QsQuestion entity = new QsQuestion();
		entity.setStatus("1");
		List<QsQuestion> qlist = qsQuestionService.findList(qsQuestion);
		
		if (qlist!=null&&qlist.size()>0){
			entity = qlist.get(0);
		}else{
			addMessage(model, "未获取到问卷信息");
			return "modules/easyshop/qsIssueView";
		}
		model.addAttribute("qsQuestion", entity);
		String sn = request.getParameter("sn");
		model.addAttribute("sn", sn);
		String userId = request.getParameter("userId");
		model.addAttribute("userId", userId);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("questionId", entity.getId());
		param.put("userId", userId);
		List<QsIssue> qsIssueList = qsIssueService.findListAndAnswer(param);
		
		for (QsIssue qsIssue : qsIssueList) {
			if(qsIssue.getQuestionType().equals("1")){
				//文本
			}else if(qsIssue.getQuestionType().equals("2")||qsIssue.getQuestionType().equals("3")){
				//单选
				String[] os  = qsIssue.getOptions().split(",");
				String[] vs  = qsIssue.getValue().split(",");
				String value = "";
				for (int i=0;i<os.length;i++) {
					for (int j=0;j<vs.length;j++) {
						if(vs[j].equals(i+"")){
							value += ","+os[i];
						}
					}
				}
				if(value.length()>0){
					qsIssue.setValue(value.substring(1));
				}
				
			}else if(qsIssue.getQuestionType().equals("4")){
				//评分
				qsIssue.setValue(qsIssue.getValue()+"星");
			}
		}
		
		model.addAttribute("qsIssueList", qsIssueList);
		return "modules/easyshop/qsIssueView";
	}

}