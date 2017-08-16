package com.thinkgem.jeesite.modules.easyshop.service;

import java.util.List;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.easyshop.dao.GoodsDao;
import com.thinkgem.jeesite.modules.easyshop.entity.Goods;
import com.thinkgem.jeesite.modules.easyshop.entity.User;

/**
 * GoodsService
 * @author Ryan.Ru
 * @version 2017-05-25
 */
@Service
@Transactional(readOnly = true)
public class GoodsService extends CrudService<GoodsDao, Goods> {
	
	@Autowired
	private UserService userService;

	public Goods get(String id) {
		return super.get(id);
	}
	
	public List<Goods> findList(Goods goods) {
		return super.findList(goods);
	}
	
	public Page<Goods> findPage(Page<Goods> page, Goods goods) {
		return super.findPage(page, goods);
	}
	
	@Transactional(readOnly = false)
	public void save(Goods goods) {
		super.save(goods);
	}
	
	@Transactional(readOnly = false)
	public int updateGoodsType(Goods goods) {
		return dao.updateGoodsType(goods);
	}
	
	@Transactional(readOnly = false)
	public void saveEasy(Goods goods) {
		if (goods.getGoodsDesc()!=null){
			goods.setGoodsDesc(StringEscapeUtils.unescapeHtml4(goods.getGoodsDesc()));
		}
		
		if (goods.getIsNewRecord()){
			goods.preInsert();
			
			String goodSn = goods.getGoodsSn();
			if(StringUtils.isBlank(goodSn)){//如果前端没有输入商品的唯一货号   则自动生成唯一货号
				String sns = "RUS000000";
				String maxId = dao.getGoodsMaxId();
				String gsn = sns.substring(0, sns.length()-maxId.length())+maxId;
				goods.setGoodsSn(gsn);
			}
			
			dao.insert(goods);
		}else{
			goods.preUpdate();
			dao.update(goods);
		}
	}
	
	@Transactional(readOnly = false)
	public boolean exchange(Goods goods,User user) {
		goods = get(goods.getId());
		user = userService.get(user.getId());
		int integral = Integer.parseInt(user.getIntegral())-Integer.parseInt(goods.getIntegral());
//		int goodsNumber = Integer.parseInt(goods.getGoodsNumber())-1;
//		if(integral<0||goodsNumber<0){
		if(integral<0){
			return false;
		}
		user.setIntegral(integral+"");
		userService.save(user);
		
//		goods.preUpdate();
//		goods.setGoodsNumber(goodsNumber+"");
//		dao.update(goods);
		return true;
	}
	
	@Transactional(readOnly = false)
	public void delete(Goods goods) {
		super.delete(goods);
	}
	
}