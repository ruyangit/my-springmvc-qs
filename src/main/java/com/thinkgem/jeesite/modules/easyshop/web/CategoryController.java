/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.easyshop.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.easyshop.entity.Category;
import com.thinkgem.jeesite.modules.easyshop.service.CategoryService;

/**
 * 商品分类信息Controller
 * @author RuYang
 * @version 2017-08-07
 */
@Controller
@RequestMapping(value = "${adminPath}/easyshop/category")
public class CategoryController extends BaseController {

	@Autowired
	private CategoryService categoryService;
	
	@ModelAttribute
	public Category get(@RequestParam(required=false) String id) {
		Category entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = categoryService.get(id);
		}
		if (entity == null){
			entity = new Category();
		}
		return entity;
	}
	
	@RequiresPermissions("easyshop:category:view")
	@RequestMapping(value = {"list", ""})
	public String list(Category category, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<Category> list = categoryService.findList(category); 
		model.addAttribute("list", list);
		return "modules/easyshop/categoryList";
	}

	@RequiresPermissions("easyshop:category:view")
	@RequestMapping(value = "form")
	public String form(Category category, Model model) {
		if (category.getParent()!=null && StringUtils.isNotBlank(category.getParent().getId())){
			category.setParent(categoryService.get(category.getParent().getId()));
			// 获取排序号，最末节点排序号+30
			if (StringUtils.isBlank(category.getId())){
				Category categoryChild = new Category();
				categoryChild.setParent(new Category(category.getParent().getId()));
				List<Category> list = categoryService.findList(category); 
				if (list.size() > 0){
					category.setSort(list.get(list.size()-1).getSort());
					if (category.getSort() != null){
						category.setSort(category.getSort() + 30);
					}
				}
			}
		}
		if (category.getSort() == null){
			category.setSort(30);
		}
		model.addAttribute("category", category);
		return "modules/easyshop/categoryForm";
	}

	@RequiresPermissions("easyshop:category:edit")
	@RequestMapping(value = "save")
	public String save(Category category, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, category)){
			return form(category, model);
		}
		categoryService.save(category);
		addMessage(redirectAttributes, "保存商品分类成功");
		return "redirect:"+Global.getAdminPath()+"/easyshop/category/?repage";
	}
	
	@RequiresPermissions("easyshop:category:edit")
	@RequestMapping(value = "delete")
	public String delete(Category category, RedirectAttributes redirectAttributes) {
		categoryService.delete(category);
		addMessage(redirectAttributes, "删除商品分类成功");
		return "redirect:"+Global.getAdminPath()+"/easyshop/category/?repage";
	}

	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<Category> list = categoryService.findList(new Category());
		for (int i=0; i<list.size(); i++){
			Category e = list.get(i);
			if (StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",")==-1)){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParentId());
				map.put("name", e.getName());
				mapList.add(map);
			}
		}
		return mapList;
	}
	
}