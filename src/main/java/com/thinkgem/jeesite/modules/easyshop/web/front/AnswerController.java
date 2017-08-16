/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.easyshop.web.front;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.easyshop.entity.QsAnswer;
import com.thinkgem.jeesite.modules.easyshop.entity.QsIssue;
import com.thinkgem.jeesite.modules.easyshop.entity.User;
import com.thinkgem.jeesite.modules.easyshop.service.QsAnswerService;
import com.thinkgem.jeesite.modules.easyshop.service.QsIssueService;
import com.thinkgem.jeesite.modules.easyshop.utils.SmsUtil;

/**
 * 答案Controller
 * @author RuYang
 * @version 2017-08-08
 */
@Controller("frontAnswerController")
@RequestMapping(value = "${frontPath}/answer")
public class AnswerController extends BaseController {

	@Autowired
	private QsAnswerService qsAnswerService;
	
	@Autowired
	private QsIssueService qsIssueService;
	
	@ResponseBody
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public Map<String, Object> save(HttpServletRequest request, Model model) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 200);
		String questionId = request.getParameter("questionId");
		if(StringUtils.isBlank(questionId)){
			result.put("code", 400);
			result.put("message", "问卷编号不能为空");
			return result;
		}
		User user = (User) request.getSession().getAttribute(User.SESSION_KEY);
		
		QsIssue qsIssue = new QsIssue();
		qsIssue.setQuestionId(questionId);
		List<QsIssue> qsIssueList =  qsIssueService.findList(qsIssue);
		if(qsIssueList==null){
			result.put("code", 400);
			result.put("message", "未获取到问题列表");
			return result;
		}
		
		QsAnswer qsAnswer = new QsAnswer();
		qsAnswer.setQuestionId(questionId);
		qsAnswer.setUserId(user.getId());
		List<QsAnswer> answerList = qsAnswerService.findList(qsAnswer);
		if(answerList!=null&&answerList.size()>0){
			result.put("code", 400);
			result.put("message", "您已完成问卷调查");
			return result;
		}
		
		List<QsAnswer> list = new ArrayList<QsAnswer>();
		for (int i = 1; i <= qsIssueList.size(); i++) {
			QsIssue qi = qsIssueList.get(i-1);
			QsAnswer answer = new QsAnswer();
			answer.setUser(user);
			answer.setQuestionId(questionId);
			answer.setIssueId(qi.getId());
			
			if(qi.getQuestionType().equals("3")){
				String[] values = request.getParameterValues("name"+i);
				
				if(values==null||values.length==0){
					result.put("code", 400);
					result.put("message", "你有未完成的答案");
					return result;
				}
				
				String value = "";
				for(int j=0;j<values.length;j++){ 
					value+=","+values[j];
				}
				answer.setValue(value.substring(1));
			}else{
				String value = request.getParameter("name"+i);
				if(StringUtils.isBlank(value)){
					result.put("code", 400);
					result.put("message", "你有未完成的答案");
					return result;
				}
				answer.setValue(value);
			}
			list.add(answer);
		}
		
		qsAnswerService.save(list);
		new SmsUtil(2, user.getSn()).start();
		return result;
	}

}