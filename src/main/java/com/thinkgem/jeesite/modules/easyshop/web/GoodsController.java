package com.thinkgem.jeesite.modules.easyshop.web;

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
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.easyshop.entity.Category;
import com.thinkgem.jeesite.modules.easyshop.entity.Goods;
import com.thinkgem.jeesite.modules.easyshop.service.CategoryService;
import com.thinkgem.jeesite.modules.easyshop.service.GoodsService;

/**
 * GoodsController
 * @author Ryan.Ru
 * @version 2017-05-25
 */
@Controller
@RequestMapping(value = "${adminPath}/easyshop/goods")
public class GoodsController extends BaseController {

	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private CategoryService categoryService;
	
	@ModelAttribute
	public Goods get(@RequestParam(required=false) String id) {
		Goods entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = goodsService.get(id);
		}
		if (entity == null){
			entity = new Goods();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(Goods goods, HttpServletRequest request, HttpServletResponse response, Model model) {
//		goods.setStoreId(MerchantUtils.getCurrentMerchantSessionUser().getMerchantsId());
		goods.setIsOnSale(null);
		Page<Goods> page = goodsService.findPage(new Page<Goods>(request, response), goods); 
		model.addAttribute("page", page);
		return "modules/easyshop/goodsList";
	}
	
//	@RequestMapping(value = "add")
//	public String add(Goods goods, Model model) {
//		model.addAttribute("goods", goods);
//		model.addAttribute("categoryList", categoryService.findList(new Category()));
//		return "modules/easyshop/goodsAdd";
//	}

	@RequestMapping(value = "form")
	public String form(Goods goods, Model model,HttpServletRequest request) {
//		String viewName = request.getParameter("viewName");
//		if(StringUtils.isNotBlank(viewName)){
			
//			//获取关联图片
//			if("goodsFormGallery".equals(viewName)){
//				//地址格式以|分隔
//				GoodsGallery goodsGallery = goodsGalleryService.getGroupConcatByGoodsId(goods.getId());
//				if(goodsGallery!=null&&StringUtils.isNotBlank(goodsGallery.getImgUrl())){
//					goods.setGoodsGalleryImgUrl(goodsGallery.getImgUrl().replaceAll(",", "|"));
//				}
//			}else if("goodsFormAttr".equals(viewName)){
//				GoodsType goodsType = new GoodsType();
//				goodsType.setStoreId(MerchantUtils.getCurrentMerchantSessionUser().getMerchantsId());
//				goodsType.setEnabled(Global.YES);
//				model.addAttribute("goodsTypeList", goodsTypeService.findList(goodsType));
//				
//				//获取属性
//				GoodsAttr goodsAttr = new GoodsAttr();
//				goodsAttr.setGoodsId(goods.getId());
//				List<GoodsAttr> goodsAttrList = goodsAttrService.findListJoinAttr(goodsAttr);
//				
//				model.addAttribute("goodsAttrListJson", JsonMapper.toJsonString(goodsAttrList));
//			}else if("goodsFormProducts".equals(viewName)){
//				Map<String, Object> params = new HashMap<String, Object>();
//				params.put("goodsId", goods.getId());
//				List<Map<String, Object>> list = goodsAttrService.findListGoodsAttr(params);
//				if(list!=null){
//					for (Map<String, Object> map : list) {
//						String attrValue = StringUtils.toString(map.get("attrValue"), "");
//						String attrValues = StringUtils.toString(map.get("attrValues"), "");
//						String avss[] = attrValues.split(",");
//						List<Map<String, Object>> attrObjList = new ArrayList<Map<String, Object>>();
//						for (int i=0;i<avss.length;i++) {
//							//System.out.println(Arrays.asList(attrValue.split(",")).contains(i+""));
//							if(Arrays.asList(attrValue.split(",")).contains(i+"")){
//								Map<String, Object> attrObj = new HashMap<String, Object>();
//								attrObj.put("value", i);
//								attrObj.put("label", avss[i]);
//								attrObjList.add(attrObj);
//							}
//						}
//						
//						map.put("attrObjList", attrObjList);
//						map.remove("attrValue");
//						map.remove("attrValues");
//					}
//					
//					System.out.println(list);
//					model.addAttribute("list", list);
//					
//				}
//			}
			
//			model.addAttribute("goods", goods);
//			model.addAttribute("viewName", viewName);
//			return "modules/easyshop/"+viewName;
//		}else{
//			goods.setStoreId(MerchantUtils.getCurrentMerchantSessionUser().getMerchantsId());
//			goods.setCategory(categoryService.get(goods.getCategory().getId()));
//			MerchantsGoodsCategory merchantsGoodsCategory = new MerchantsGoodsCategory();
//			merchantsGoodsCategory.setStoreId(MerchantUtils.getCurrentMerchantSessionUser().getMerchantsId());
//			model.addAttribute("merchantsGoodsCategoryList", merchantsGoodsCategoryService.findList(merchantsGoodsCategory));
			model.addAttribute("goods", goods);
			return "modules/easyshop/goodsForm";
//		}
	}

	@RequestMapping(value = "save")
	public String save(Goods goods, Model model, RedirectAttributes redirectAttributes,HttpServletRequest request) {
		if (!beanValidator(model, goods)){
			return form(goods, model,request);
		}
		
		//String viewName = request.getParameter("viewName");
		//if(StringUtils.isNotBlank(viewName)){
//			if("goodsFormGallery".equals(viewName)){
//				goodsGalleryService.saveEasy(goods);
//			}else if("goodsFormAttr".equals(viewName)){
//				String id = request.getParameter("id");
//				String goodsType = request.getParameter("goodsType");
//				String attr_id_list[] = request.getParameterValues("attr_id_list[]");
//				String attr_value_list[] = request.getParameterValues("attr_value_list[]");
//				String attr_price_list[] = request.getParameterValues("attr_price_list[]");
//				goodsAttrService.saveEasy(id, goodsType, attr_id_list, attr_value_list, attr_price_list);
//			}else{
				//goodsService.saveEasy(goods);
//			}
		//	addMessage(redirectAttributes, "保存成功");
			//return "redirect:"+Global.getAdminPath()+"/easyshop/goods/form?id="+goods.getId()+"&viewName="+viewName;
		//}else{
			goodsService.saveEasy(goods);
			addMessage(redirectAttributes, "保存成功");
			return "redirect:"+Global.getAdminPath()+"/easyshop/goods/?repage";
		//}
	}
	
	@RequestMapping(value = "delete")
	public String delete(Goods goods, RedirectAttributes redirectAttributes) {
		goodsService.delete(goods);
		addMessage(redirectAttributes, "删除商品成功");
		return "redirect:"+Global.getAdminPath()+"/easyshop/goods/?repage";
	}

}