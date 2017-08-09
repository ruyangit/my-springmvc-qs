/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.easyshop.web.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.easyshop.entity.QsAnswer;
import com.thinkgem.jeesite.modules.easyshop.entity.QsIssue;
import com.thinkgem.jeesite.modules.easyshop.entity.QsQuestion;
import com.thinkgem.jeesite.modules.easyshop.entity.User;
import com.thinkgem.jeesite.modules.easyshop.service.QsAnswerService;
import com.thinkgem.jeesite.modules.easyshop.service.QsIssueService;
import com.thinkgem.jeesite.modules.easyshop.service.QsQuestionService;

/**
 * 问卷Controller
 * @author RuYang
 * @version 2017-08-08
 */
@Controller
@RequestMapping(value = "${frontPath}/question")
public class QuestionController extends BaseController {

	@Autowired
	private QsIssueService qsIssueService;
	
	@Autowired
	private QsQuestionService qsQuestionService;
	
	@Autowired
	private QsAnswerService qsAnswerService;
	
	@RequestMapping(value = {"list", ""})
	public String list(QsQuestion qsQuestion, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = (User) request.getSession().getAttribute(User.SESSION_KEY);
		String questionId = request.getParameter("id");
		
		QsQuestion entity = null;
		if (StringUtils.isNotBlank(questionId)){
			entity = qsQuestionService.get(questionId);
		}
		if (entity == null){
			addMessage(model, "未获取到问卷信息");
			return "front/message";
		}else{
			
			QsAnswer qsAnswer = new QsAnswer();
			qsAnswer.setQuestionId(questionId);
			qsAnswer.setUserId(user.getId());
			List<QsAnswer> list = qsAnswerService.findList(qsAnswer);
			if(list!=null&&list.size()>0){
				addMessage(model, "已完成问卷调查，不可进行重复操作");
				return "front/message";
			}
			
			if(!entity.getStatus().equals("1")){
				addMessage(model, entity.getTitle()+",问卷还未发布");
				return "front/message";
			}
			
			model.addAttribute("qsQuestion", entity);
			QsIssue qsIssue = new QsIssue();
			qsIssue.setQuestionId(questionId);
			List<QsIssue> qsIssueList =  qsIssueService.findList(qsIssue);
			model.addAttribute("qsIssueList", qsIssueList);
		}
		return "front/question";
	}
}