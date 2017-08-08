package com.thinkgem.jeesite.modules.easyshop.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.easyshop.entity.Goods;

/**
 * GoodsDAO接口
 * @author Ryan.Ru
 * @version 2017-05-25
 */
@MyBatisDao
public interface GoodsDao extends CrudDao<Goods> {
	/**
	 * 查询商品表的最大id
	 * @return
	 */
	public String getGoodsMaxId();
	
	/**
	 * 更新商品属性类型
	 * @param goods
	 * @return
	 */
	public int updateGoodsType(Goods goods);
}