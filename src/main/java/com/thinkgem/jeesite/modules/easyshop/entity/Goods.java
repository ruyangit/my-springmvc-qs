package com.thinkgem.jeesite.modules.easyshop.entity;

import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * GoodsEntity
 * @author Ryan.Ru
 * @version 2017-05-25
 */
public class Goods extends DataEntity<Goods> {
	
	private static final long serialVersionUID = 1L;
	private String storeId;		// 店铺id
//	private String catId;		// 商品所属平台商品分类id,取值goods_category的id
	private Category category;
//	private String merchantCatId;		// 品所属商家商品分类id，取值merchants_goods_category的id
//	private MerchantsGoodsCategory merchantsGoodsCategory;
	private String goodsSn;		// 商品的唯一货号
	private String goodsName;		// 商品的名称
	private String goodsNameStyle;		// 商品名称显示的样式；包括颜色和字体样式；格式如#ff00ff+strong
	private String clickCount;		// 商品点击数
	private String brandId;		// 品牌id，取值于goods_brand的id
	private String providerName;		// 供货人的名称，程序还没实现该功能
	private String goodsNumber;		// 商品库存数量
	private String goodsWeight;		// 商品的重量，以千克为单位
	private String defaultShipping;		// 默认配送
	private String marketPrice;		// 市场售价
	private String shopPrice;		// 本店售价
	private String promotePrice;		// 促销价格
	private Date promoteStartDate;		// 促销价格开始日期
	private Date promoteEndDate;		// 促销价格结束日期
	private String warnNumber;		// 商品报警数量
	private String keywords;		// 商品关键字，放在商品页的关键字中，为搜索引擎收录用
	private String goodsBrief;		// 商品的简短描述
	private String goodsDesc;		// 商品的详细描述
	private String goodsThumb;		// 商品在前台显示的微缩图片，如在分类筛选时显示的小图片
	private String goodsImg;		// 商品的实际大小图片，如进入该商品页时介绍商品属性所显示的大图片
	private String originalImg;		// 应该是上传的商品的原始图片
	private String isReal;		// 是否是实物，1，是；0，否；比如虚拟卡就为0，不是实物
	private String extensionCode;		// 商品的扩展属性，比如像虚拟卡
	private String isOnSale;		// 该商品是否开放销售，1，是；0，否
	private String isAloneSale;		// 是否能单独销售，1，是；0，否；如果不能单独销售，则只能作为某商品的配件或者赠品销售
	private String isShipping;		// 是否购买
	private String integral;		// 购买该商品可以使用的积分数量，估计应该是用积分代替金额消费；但程序好像还没有实现该功能
	private String sort;		// 平台对商品的显示排序
	private String storeSort;		// 商家对商品的显示排序
	private String isBest;		// 是否是精品；0，否；1，是
	private String isNew;		// 是否是新品
	private String isHot;		// 是否热销，0，否；1，是
	private String isPromote;		// 是否特价促销；0，否；1，是
	private String bonusTypeId;		// 购买该商品所能领到的红包类型
	private String goodsType;		// 商品所属类型id，取值表goods_type的id
	private String sellerNote;		// 商品的商家备注，仅商家可见
	private String giveIntegral;		// 购买该商品时每笔成功交易赠送的积分数量
	private String rankIntegral;		// 等级积分
	private String suppliersId;		// 供货商id
	private String isCheck;		// 是否检查
	private String storeHot;		// 商家加入推荐（0非热销，1热销）
	private String storeNew;		// 商家加入推荐（0非新品，1新品）
	private String storeBest;		// 商家加入推荐（0非精品，1精品）
	private String groupNumber;		// 组合购买限制数量
	private String isXiangou;		// 是否限购
	private Date xiangouStartDate;		// 限购开始时间
	private Date xiangouEndDate;		// 限购结束时间
	private String xiangouNum;		// 限购设定数量
	private String reviewStatus;		// 商品审核状态
	private String reviewContent;		// 商品审核不通过内容
	private String commentsNumber;		// 评论数
	private String salesVolume;		// 商品销量
	private String modelPrice;		// 商品价格模式（0-默认，1-仓库，2-地区）
	private String modelInventory;		// 商品库存模式（0-默认，1-仓库，2-地区）
	private String modelAttr;		// 商品属性模式（0-默认，1-仓库，2-地区）
	
	private String goodsGalleryImgUrl;//关联图片 集  ，每一个图片以|分割
	
	public Goods() {
		super();
		this.category= new Category();
		this.category.setId("0");
		
		this.storeId = "1";
		this.goodsNumber = "1000";
		this.shopPrice="0";
		this.marketPrice="0";
		this.warnNumber="1";
		this.isAloneSale="1";
		this.isShipping="0";
		this.isOnSale="1";
		this.isBest="0";
		this.isNew="0";
		this.isHot="0";
		this.sort="0";
		this.storeSort="0";
		this.goodsWeight = "0";
		this.isReal="0";
		this.integral = "1000";
	}

	public Goods(String id){
		super(id);
	}

	@Length(min=1, max=10, message="店铺id长度必须介于 1 和 10 之间")
	public String getStoreId() {
		return storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}
	
//	@Length(min=1, max=5, message="商品所属平台商品分类id,取值goods_category的id长度必须介于 1 和 5 之间")
//	public String getCatId() {
//		return catId;
//	}
//
//	public void setCatId(String catId) {
//		this.catId = catId;
//	}
	

	@Length(min=0, max=60, message="商品的唯一货号长度必须介于 0 和 60 之间")
	public String getGoodsSn() {
		return goodsSn;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public void setGoodsSn(String goodsSn) {
		this.goodsSn = goodsSn;
	}
	
	@Length(min=1, max=120, message="商品的名称长度必须介于 1 和 120 之间")
	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	
	public String getGoodsNameStyle() {
		return goodsNameStyle;
	}

	public void setGoodsNameStyle(String goodsNameStyle) {
		this.goodsNameStyle = goodsNameStyle;
	}
	
	public String getClickCount() {
		return clickCount;
	}

	public void setClickCount(String clickCount) {
		this.clickCount = clickCount;
	}
	
	public String getBrandId() {
		return brandId;
	}

	public void setBrandId(String brandId) {
		this.brandId = brandId;
	}
	
	public String getProviderName() {
		return providerName;
	}

	public void setProviderName(String providerName) {
		this.providerName = providerName;
	}
	
	@Length(min=1, max=5, message="商品库存数量长度必须介于 1 和 5 之间")
	public String getGoodsNumber() {
		return goodsNumber;
	}

	public void setGoodsNumber(String goodsNumber) {
		this.goodsNumber = goodsNumber;
	}
	
	public String getGoodsWeight() {
		return goodsWeight;
	}

	public void setGoodsWeight(String goodsWeight) {
		this.goodsWeight = goodsWeight;
	}
	
	public String getDefaultShipping() {
		return defaultShipping;
	}

	public void setDefaultShipping(String defaultShipping) {
		this.defaultShipping = defaultShipping;
	}
	
	public String getMarketPrice() {
		return marketPrice;
	}

	public void setMarketPrice(String marketPrice) {
		this.marketPrice = marketPrice;
	}
	
	public String getShopPrice() {
		return shopPrice;
	}

	public void setShopPrice(String shopPrice) {
		this.shopPrice = shopPrice;
	}
	
	public String getPromotePrice() {
		return promotePrice;
	}

	public void setPromotePrice(String promotePrice) {
		this.promotePrice = promotePrice;
	}
	
	public Date getPromoteStartDate() {
		return promoteStartDate;
	}

	public void setPromoteStartDate(Date promoteStartDate) {
		this.promoteStartDate = promoteStartDate;
	}
	
	public Date getPromoteEndDate() {
		return promoteEndDate;
	}

	public void setPromoteEndDate(Date promoteEndDate) {
		this.promoteEndDate = promoteEndDate;
	}
	
	@Length(min=1, max=3, message="商品报警数量长度必须介于 1 和 3 之间")
	public String getWarnNumber() {
		return warnNumber;
	}

	public void setWarnNumber(String warnNumber) {
		this.warnNumber = warnNumber;
	}
	
	@Length(min=0, max=255, message="商品关键字，放在商品页的关键字中，为搜索引擎收录用长度必须介于 0 和 255 之间")
	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	
	@Length(min=0, max=255, message="商品的简短描述长度必须介于 0 和 255 之间")
	public String getGoodsBrief() {
		return goodsBrief;
	}

	public void setGoodsBrief(String goodsBrief) {
		this.goodsBrief = goodsBrief;
	}
	
	public String getGoodsDesc() {
		return goodsDesc;
	}

	public void setGoodsDesc(String goodsDesc) {
		this.goodsDesc = goodsDesc;
	}
	
	@Length(min=0, max=150, message="商品在前台显示的微缩图片，如在分类筛选时显示的小图片长度必须介于 0 和 150 之间")
	public String getGoodsThumb() {
		return goodsThumb;
	}

	public void setGoodsThumb(String goodsThumb) {
		this.goodsThumb = goodsThumb;
	}
	
	@Length(min=0, max=150, message="商品的实际大小图片，如进入该商品页时介绍商品属性所显示的大图片长度必须介于 0 和 150 之间")
	public String getGoodsImg() {
		return goodsImg;
	}

	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg;
	}
	
	@Length(min=0, max=150, message="应该是上传的商品的原始图片长度必须介于 0 和 150 之间")
	public String getOriginalImg() {
		return originalImg;
	}

	public void setOriginalImg(String originalImg) {
		this.originalImg = originalImg;
	}
	
	@Length(min=1, max=3, message="是否是实物，1，是；0，否；比如虚拟卡就为0，不是实物长度必须介于 1 和 3 之间")
	public String getIsReal() {
		return isReal;
	}

	public void setIsReal(String isReal) {
		this.isReal = isReal;
	}
	
	@Length(min=0, max=30, message="商品的扩展属性，比如像虚拟卡长度必须介于 0 和 30 之间")
	public String getExtensionCode() {
		return extensionCode;
	}

	public void setExtensionCode(String extensionCode) {
		this.extensionCode = extensionCode;
	}
	
	@Length(min=1, max=3, message="该商品是否开放销售，1，是；0，否长度必须介于 1 和 3 之间")
	public String getIsOnSale() {
		return isOnSale;
	}

	public void setIsOnSale(String isOnSale) {
		this.isOnSale = isOnSale;
	}
	
	@Length(min=1, max=3, message="是否能单独销售，1，是；0，否；如果不能单独销售，则只能作为某商品的配件或者赠品销售长度必须介于 1 和 3 之间")
	public String getIsAloneSale() {
		return isAloneSale;
	}

	public void setIsAloneSale(String isAloneSale) {
		this.isAloneSale = isAloneSale;
	}
	
	@Length(min=1, max=3, message="是否购买长度必须介于 1 和 3 之间")
	public String getIsShipping() {
		return isShipping;
	}

	public void setIsShipping(String isShipping) {
		this.isShipping = isShipping;
	}
	
	public String getIntegral() {
		return integral;
	}

	public void setIntegral(String integral) {
		this.integral = integral;
	}
	
	@Length(min=1, max=5, message="平台对商品的显示排序长度必须介于 1 和 5 之间")
	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}
	
	@Length(min=1, max=5, message="商家对商品的显示排序长度必须介于 1 和 5 之间")
	public String getStoreSort() {
		return storeSort;
	}

	public void setStoreSort(String storeSort) {
		this.storeSort = storeSort;
	}
	
	@Length(min=1, max=3, message="是否是精品；0，否；1，是长度必须介于 1 和 3 之间")
	public String getIsBest() {
		return isBest;
	}

	public void setIsBest(String isBest) {
		this.isBest = isBest;
	}
	
	@Length(min=1, max=3, message="是否是新品长度必须介于 1 和 3 之间")
	public String getIsNew() {
		return isNew;
	}

	public void setIsNew(String isNew) {
		this.isNew = isNew;
	}
	
	@Length(min=1, max=3, message="是否热销，0，否；1，是长度必须介于 1 和 3 之间")
	public String getIsHot() {
		return isHot;
	}

	public void setIsHot(String isHot) {
		this.isHot = isHot;
	}
	
	public String getIsPromote() {
		return isPromote;
	}

	public void setIsPromote(String isPromote) {
		this.isPromote = isPromote;
	}
	
	public String getBonusTypeId() {
		return bonusTypeId;
	}

	public void setBonusTypeId(String bonusTypeId) {
		this.bonusTypeId = bonusTypeId;
	}
	
	public String getGoodsType() {
		return goodsType;
	}

	public void setGoodsType(String goodsType) {
		this.goodsType = goodsType;
	}
	
	@Length(min=0, max=255, message="商品的商家备注，仅商家可见长度必须介于 0 和 255 之间")
	public String getSellerNote() {
		return sellerNote;
	}

	public void setSellerNote(String sellerNote) {
		this.sellerNote = sellerNote;
	}
	
	public String getGiveIntegral() {
		return giveIntegral;
	}

	public void setGiveIntegral(String giveIntegral) {
		this.giveIntegral = giveIntegral;
	}
	
	public String getRankIntegral() {
		return rankIntegral;
	}

	public void setRankIntegral(String rankIntegral) {
		this.rankIntegral = rankIntegral;
	}
	
	public String getSuppliersId() {
		return suppliersId;
	}

	public void setSuppliersId(String suppliersId) {
		this.suppliersId = suppliersId;
	}
	
	public String getIsCheck() {
		return isCheck;
	}

	public void setIsCheck(String isCheck) {
		this.isCheck = isCheck;
	}
	
	public String getStoreHot() {
		return storeHot;
	}

	public void setStoreHot(String storeHot) {
		this.storeHot = storeHot;
	}
	
	public String getStoreNew() {
		return storeNew;
	}

	public void setStoreNew(String storeNew) {
		this.storeNew = storeNew;
	}
	
	public String getStoreBest() {
		return storeBest;
	}

	public void setStoreBest(String storeBest) {
		this.storeBest = storeBest;
	}
	
	public String getGroupNumber() {
		return groupNumber;
	}

	public void setGroupNumber(String groupNumber) {
		this.groupNumber = groupNumber;
	}
	
	public String getIsXiangou() {
		return isXiangou;
	}

	public void setIsXiangou(String isXiangou) {
		this.isXiangou = isXiangou;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getXiangouStartDate() {
		return xiangouStartDate;
	}

	public void setXiangouStartDate(Date xiangouStartDate) {
		this.xiangouStartDate = xiangouStartDate;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getXiangouEndDate() {
		return xiangouEndDate;
	}

	public void setXiangouEndDate(Date xiangouEndDate) {
		this.xiangouEndDate = xiangouEndDate;
	}
	
	public String getXiangouNum() {
		return xiangouNum;
	}

	public void setXiangouNum(String xiangouNum) {
		this.xiangouNum = xiangouNum;
	}
	
	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}
	
	@Length(min=0, max=255, message="商品审核不通过内容长度必须介于 0 和 255 之间")
	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	
	public String getCommentsNumber() {
		return commentsNumber;
	}

	public void setCommentsNumber(String commentsNumber) {
		this.commentsNumber = commentsNumber;
	}
	
	public String getSalesVolume() {
		return salesVolume;
	}

	public void setSalesVolume(String salesVolume) {
		this.salesVolume = salesVolume;
	}
	
	public String getModelPrice() {
		return modelPrice;
	}

	public void setModelPrice(String modelPrice) {
		this.modelPrice = modelPrice;
	}
	
	public String getModelInventory() {
		return modelInventory;
	}

	public void setModelInventory(String modelInventory) {
		this.modelInventory = modelInventory;
	}
	
	public String getModelAttr() {
		return modelAttr;
	}

	public void setModelAttr(String modelAttr) {
		this.modelAttr = modelAttr;
	}

	public String getGoodsGalleryImgUrl() {
		return goodsGalleryImgUrl;
	}

	public void setGoodsGalleryImgUrl(String goodsGalleryImgUrl) {
		this.goodsGalleryImgUrl = goodsGalleryImgUrl;
	}

	
	
}