package com.thinkgem.jeesite.modules.easyshop.web.front;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.easyshop.entity.Goods;
import com.thinkgem.jeesite.modules.easyshop.entity.User;
import com.thinkgem.jeesite.modules.easyshop.service.GoodsService;
import com.thinkgem.jeesite.modules.easyshop.service.UserService;

/**
 * GoodsController
 * @author Ryan.Ru
 * @version 2017-05-25
 */
@Controller("frontGoodsController")
@RequestMapping(value = "${frontPath}/goods")
public class GoodsController extends BaseController {

	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value ="")
	public String index(Goods goods, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = (User) request.getSession().getAttribute(User.SESSION_KEY);
		request.getSession().setAttribute(User.SESSION_KEY, userService.get(user.getId()));
		model.addAttribute("user", user);
		return "front/goods";
	}
	
	@ResponseBody
	@RequestMapping(value = "list")
	public Map<String, Object> list(Goods goods, HttpServletRequest request, HttpServletResponse response, Model model) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 200);
		goods.setIsOnSale("1");
		Page<Goods> page = goodsService.findPage(new Page<Goods>(request, response), goods); 
		result.put("data", page);
		return result;
	}
	
	@RequestMapping(value ="detail")
	public String detail(HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = (User) request.getSession().getAttribute(User.SESSION_KEY);
		user = userService.get(user.getId());
		request.getSession().setAttribute(User.SESSION_KEY, user);
		String id = request.getParameter("id");
		if(StringUtils.isBlank(id)){
			addMessage(model, "商品编号不能为空");
			return "front/message";
		}
		Goods goods = goodsService.get(id);
		
		if (goods == null){
			addMessage(model, "未获取到商品信息");
			return "front/message";
		}
		
		if(!goods.getIsOnSale().equals("1")){
			addMessage(model, goods.getGoodsName()+"，未开放购买");
			return "front/message";
		}
		model.addAttribute("goods", goods);
		model.addAttribute("user", user);
		String buyStatus = "0";
		if(Integer.parseInt(goods.getGoodsNumber())<=0){
			buyStatus="1";
		}else if(Integer.parseInt(goods.getIntegral())>Integer.parseInt(user.getIntegral())){
			buyStatus="2";
		}
		model.addAttribute("buyStatus", buyStatus);
		return "front/detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "exchange", method = RequestMethod.POST)
	public Map<String, Object> exchange(HttpServletRequest request, Model model) {
		User user = (User) request.getSession().getAttribute(User.SESSION_KEY);
		user = userService.get(user.getId());
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 200);
		
		String id = request.getParameter("id");
		
		Goods goods = goodsService.get(id);
		
		if (goods == null){
			result.put("code", 404);
			result.put("message", "未获取到商品信息");
			return result;
		}
		
		if(!goods.getIsOnSale().equals("1")){
			result.put("code", 403);
			result.put("message", goods.getGoodsName()+"，未开放购买");
			return result;
		}
		
		if(Integer.parseInt(goods.getGoodsNumber())<=0){
			result.put("code", 405);
			result.put("message", "商品库存不足");
			return result;
		}else if(Integer.parseInt(goods.getIntegral())>Integer.parseInt(user.getIntegral())){
			result.put("code", 405);
			result.put("message", "您的积分不足");
			return result;
		}
		
		boolean bl = goodsService.exchange(goods, user);
		if(!bl){
			result.put("code", 405);
			result.put("message", "兑换失败");
			return result;
		}
		request.getSession().setAttribute(User.SESSION_KEY, user);
		return result;
	}
}