-- MySQL dump 10.13  Distrib 5.7.11, for Win64 (x86_64)
--
-- Host: 121.41.40.118    Database: easy_shop
-- ------------------------------------------------------
-- Server version	5.6.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `easyshop_ad`
--

DROP TABLE IF EXISTS `easyshop_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easyshop_ad` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `ad_position_id` smallint(5) unsigned DEFAULT '0',
  `media_type` tinyint(3) unsigned DEFAULT '0',
  `name` varchar(60) NOT NULL DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `image_url` text NOT NULL,
  `content` varchar(255) DEFAULT '',
  `end_time` int(11) DEFAULT '0',
  `sort` int(11) DEFAULT '0' COMMENT '排序号码',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `position_id` (`ad_position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easyshop_ad`
--

LOCK TABLES `easyshop_ad` WRITE;
/*!40000 ALTER TABLE `easyshop_ad` DISABLE KEYS */;
INSERT INTO `easyshop_ad` VALUES (1,0,0,'这是一个入口的广告位','','/userfiles/1/images/easyshop/ad/2017/08/bg-01.jpg','',0,0,'1','2017-08-16 13:43:19','5b0c55a97b6645d0b5df6466465df809','2017-08-16 15:02:49',NULL,'0'),(2,0,0,'测试广告位替换','','/userfiles/1/images/easyshop/ad/2017/08/bg-03.jpg','',0,0,'1','2017-08-16 13:58:10','1','2017-08-16 15:10:43',NULL,'0');
/*!40000 ALTER TABLE `easyshop_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easyshop_brand`
--

DROP TABLE IF EXISTS `easyshop_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easyshop_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id号 ',
  `brand_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '品牌名称 ',
  `brand_logo` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '上传图片 ',
  `brand_desc` text COLLATE utf8mb4_unicode_ci COMMENT '品牌描述',
  `site_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '品牌网址',
  `is_show` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '是否显示',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号码',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `is_show` (`is_show`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='商品品牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easyshop_brand`
--

LOCK TABLES `easyshop_brand` WRITE;
/*!40000 ALTER TABLE `easyshop_brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `easyshop_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easyshop_category`
--

DROP TABLE IF EXISTS `easyshop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easyshop_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id号 ',
  `cat_name` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  `cat_struct_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '中文名称分类结构',
  `category_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类图片',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类的关键字,可能是为了搜索',
  `cat_level` int(11) DEFAULT '1' COMMENT '层级',
  `cat_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类描述',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '该分类的父类ID,取值于该表的id字段 ',
  `parent_ids` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '该分类的父类ID,取值于该表的id字段 ',
  `template_file` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '不确定字段,按名和表设计猜,应该是该分类的单独模板文件的名字 ',
  `measure_unit` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '该分类的计量单位 ',
  `style` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '该分类的单独的样式表的包括文件部分的文件路径 ',
  `grade` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '该分类的最高和最低价之间的价格分级,当大于1时,会根据最大最小价格区间分成区间,会在页面显示价格范围,如0-300,300-600,600-900这种;',
  `filter_attr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '如果该字段有值,则该分类将还会按照该值对应在表goods_attr的goods_attr_id所对应的属性筛选，如，封面颜色下有红，黑分类筛选 ',
  `is_show` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '是否在前台页面显示1显示;0不显示 ',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号码',
  `create_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='商品分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easyshop_category`
--

LOCK TABLES `easyshop_category` WRITE;
/*!40000 ALTER TABLE `easyshop_category` DISABLE KEYS */;
INSERT INTO `easyshop_category` VALUES (1,'饮食','饮食','','',1,'',0,'0,',NULL,'',NULL,'1',NULL,'1',30,'1','2017-08-08 10:16:08','1','2017-08-08 10:16:08',NULL,'0');
/*!40000 ALTER TABLE `easyshop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easyshop_goods`
--

DROP TABLE IF EXISTS `easyshop_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easyshop_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品所属平台商品分类id,取值goods_category的id ',
  `goods_sn` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品的唯一货号 ',
  `goods_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品的名称 ',
  `goods_name_style` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '+' COMMENT '商品名称显示的样式；包括颜色和字体样式；格式如#ff00ff+strong',
  `click_count` int(10) NOT NULL DEFAULT '0' COMMENT '商品点击数 ',
  `brand_id` int(11) NOT NULL DEFAULT '0' COMMENT '品牌id，取值于goods_brand的id ',
  `provider_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '供货人的名称，程序还没实现该功能 ',
  `goods_number` smallint(5) NOT NULL DEFAULT '0' COMMENT '商品库存数量 ',
  `goods_weight` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '商品的重量，以千克为单位 ',
  `default_shipping` int(10) NOT NULL DEFAULT '0' COMMENT '默认配送',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场售价 ',
  `shop_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本店售价 ',
  `promote_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '促销价格',
  `promote_start_date` datetime DEFAULT NULL COMMENT '促销价格开始日期 ',
  `promote_end_date` datetime DEFAULT NULL COMMENT '促销价格结束日期 ',
  `warn_number` tinyint(3) NOT NULL DEFAULT '1' COMMENT '商品报警数量',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品关键字，放在商品页的关键字中，为搜索引擎收录用 ',
  `goods_brief` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品的简短描述 ',
  `goods_desc` text COLLATE utf8mb4_unicode_ci COMMENT '商品的详细描述 ',
  `goods_thumb` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品在前台显示的微缩图片，如在分类筛选时显示的小图片 ',
  `goods_img` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品的实际大小图片，如进入该商品页时介绍商品属性所显示的大图片 ',
  `original_img` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '应该是上传的商品的原始图片 ',
  `is_real` tinyint(3) NOT NULL DEFAULT '1' COMMENT '是否是实物，1，是；0，否；比如虚拟卡就为0，不是实物 ',
  `extension_code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品的扩展属性，比如像虚拟卡 ',
  `is_on_sale` tinyint(3) NOT NULL DEFAULT '1' COMMENT '该商品是否开放销售，1，是；0，否 ',
  `is_alone_sale` tinyint(3) NOT NULL DEFAULT '1' COMMENT '是否能单独销售，1，是；0，否；如果不能单独销售，则只能作为某商品的配件或者赠品销售 ',
  `is_shipping` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否包邮',
  `integral` int(10) NOT NULL DEFAULT '0' COMMENT '购买该商品可以使用的积分数量，估计应该是用积分代替金额消费；但程序好像还没有实现该功能',
  `create_date` datetime DEFAULT NULL COMMENT '商品的添加时间 ',
  `sort` smallint(5) NOT NULL DEFAULT '100' COMMENT '平台对商品的显示排序 ',
  `store_sort` smallint(5) NOT NULL DEFAULT '100' COMMENT '商家对商品的显示排序 ',
  `del_flag` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  `is_best` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否是精品；0，否；1，是 ',
  `is_new` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否是新品 ',
  `is_hot` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否热销，0，否；1，是 ',
  `is_promote` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否特价促销；0，否；1，是 ',
  `bonus_type_id` tinyint(3) NOT NULL DEFAULT '0' COMMENT '购买该商品所能领到的红包类型 ',
  `update_date` datetime DEFAULT NULL COMMENT '最近一次更新商品配置的时间 ',
  `goods_type` smallint(5) NOT NULL DEFAULT '0' COMMENT '商品所属类型id，取值表goods_type的id ',
  `seller_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品的商家备注，仅商家可见 ',
  `give_integral` int(11) NOT NULL DEFAULT '-1' COMMENT '购买该商品时每笔成功交易赠送的积分数量 ',
  `rank_integral` int(11) NOT NULL DEFAULT '-1' COMMENT '等级积分 ',
  `suppliers_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '供货商id ',
  `is_check` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否检查',
  `store_hot` tinyint(3) NOT NULL DEFAULT '0' COMMENT '商家加入推荐（0非热销，1热销） ',
  `store_new` tinyint(3) NOT NULL DEFAULT '0' COMMENT '商家加入推荐（0非新品，1新品） ',
  `store_best` tinyint(3) NOT NULL DEFAULT '0' COMMENT '商家加入推荐（0非精品，1精品） ',
  `group_number` smallint(5) NOT NULL DEFAULT '0' COMMENT '组合购买限制数量 ',
  `is_xiangou` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否限购',
  `xiangou_start_date` datetime DEFAULT NULL COMMENT '限购开始时间',
  `xiangou_end_date` datetime DEFAULT NULL COMMENT '限购结束时间',
  `xiangou_num` int(10) NOT NULL DEFAULT '0' COMMENT '限购设定数量',
  `review_status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '商品审核状态 ',
  `review_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品审核不通过内容 ',
  `comments_number` int(10) NOT NULL DEFAULT '0' COMMENT '评论数 ',
  `sales_volume` int(10) NOT NULL DEFAULT '0' COMMENT '商品销量 ',
  `model_price` tinyint(3) NOT NULL DEFAULT '0' COMMENT '商品价格模式（0-默认，1-仓库，2-地区） ',
  `model_inventory` tinyint(3) NOT NULL DEFAULT '0' COMMENT '商品库存模式（0-默认，1-仓库，2-地区） ',
  `model_attr` tinyint(3) NOT NULL DEFAULT '0' COMMENT '商品属性模式（0-默认，1-仓库，2-地区） ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_goods` (`id`,`store_id`),
  KEY `brand_id` (`brand_id`),
  KEY `cat_id` (`category_id`),
  KEY `goods_number` (`goods_number`),
  KEY `goods_sn` (`goods_sn`),
  KEY `goods_weight` (`goods_weight`),
  KEY `last_update` (`update_date`),
  KEY `promote_end_date` (`promote_end_date`),
  KEY `promote_start_date` (`promote_start_date`),
  KEY `sales_volume` (`sales_volume`),
  KEY `sort_order` (`sort`),
  KEY `store_id` (`store_id`),
  KEY `xiangou_end_date` (`xiangou_end_date`),
  KEY `xiangou_start_date` (`xiangou_start_date`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easyshop_goods`
--

LOCK TABLES `easyshop_goods` WRITE;
/*!40000 ALTER TABLE `easyshop_goods` DISABLE KEYS */;
INSERT INTO `easyshop_goods` VALUES (1,1,1,'RUS000001','美国进口李子（虽然大但还不如泾阳的好吃）','+',0,0,NULL,81,0.000,0,0.00,0.00,0.00,NULL,NULL,1,'','','<p>\r\n	<img alt=\"\" src=\"/userfiles/1/images/easyshop/brand/2017/08/1082_P_1477690581028.jpg\" style=\"width: 500px; height: 500px;\" /> <img alt=\"\" src=\"/userfiles/1/images/easyshop/brand/2017/08/1082_P_1477690581028.jpg\" style=\"width: 500px; height: 500px;\" /> <img alt=\"\" src=\"/userfiles/1/images/easyshop/brand/2017/08/1082_P_1477690581028.jpg\" style=\"width: 500px; height: 500px;\" /> <img alt=\"\" src=\"/userfiles/1/images/easyshop/brand/2017/08/1082_P_1477690581028.jpg\" style=\"width: 500px; height: 500px;\" /> <img alt=\"\" src=\"/userfiles/1/images/easyshop/brand/2017/08/1082_P_1477690581028.jpg\" style=\"width: 500px; height: 500px;\" /></p>',NULL,'/userfiles/1/images/easyshop/goods/2017/08/6a6aa85b5b88a409ec7edd83d8df5a52.jpg',NULL,0,NULL,1,1,0,3000,'2017-08-08 10:16:25',0,0,'1',0,0,0,0,0,'2017-08-10 19:08:48',0,NULL,-1,-1,0,0,0,0,0,0,0,NULL,NULL,0,1,NULL,0,0,0,0,0),(2,1,1,'RUS000002','苹果','+',0,0,NULL,0,0.000,0,0.00,0.00,0.00,NULL,NULL,1,'苹果','','',NULL,'/userfiles/1/images/easyshop/goods/2017/08/b75ff29071fd263a2b87bf0b856a6c71.jpg',NULL,0,NULL,0,1,0,0,'2017-08-08 10:18:25',0,0,'0',0,0,0,0,0,'2017-08-10 16:19:17',0,NULL,-1,-1,0,0,0,0,0,0,0,NULL,NULL,0,1,NULL,0,0,0,0,0),(3,1,1,'RUS000003','麻辣锅巴','+',0,0,NULL,994,0.000,0,0.00,0.00,0.00,NULL,NULL,1,'','','',NULL,'/userfiles/1/images/easyshop/goods/2017/08/5100f0176e27a167cc2aea08b1bd11d8.jpg',NULL,0,NULL,1,1,0,3000,'2017-08-08 10:23:37',0,0,'0',0,0,0,0,0,'2017-08-10 18:57:22',0,NULL,-1,-1,0,0,0,0,0,0,0,NULL,NULL,0,1,NULL,0,0,0,0,0),(4,1,1,'RUS000004','这是世界很有趣呢','+',0,0,NULL,0,0.000,0,0.00,0.00,0.00,NULL,NULL,1,NULL,NULL,'|/userfiles/1/images/easyshop/ad/2017/08/bg-03.jpg',NULL,'/userfiles/1/images/easyshop/goods/2017/08/b75ff29071fd263a2b87bf0b856a6c71.jpg',NULL,0,NULL,1,1,0,2000,'2017-08-08 10:27:52',0,0,'0',0,0,0,0,0,'2017-08-16 15:12:50',0,NULL,-1,-1,0,0,0,0,0,0,0,NULL,NULL,0,1,NULL,0,0,0,0,0),(5,1,1,'RUS000005','巴旦木','+',0,0,NULL,1,0.000,0,0.00,0.00,0.00,NULL,NULL,1,'','','',NULL,'/userfiles/1/images/easyshop/goods/2017/08/d8436c37c02065096d312c9d8d0b9034.jpg',NULL,0,NULL,0,1,0,1111,'2017-08-09 14:04:23',0,0,'0',0,0,0,0,0,'2017-08-10 16:19:39',0,NULL,-1,-1,0,0,0,0,0,0,0,NULL,NULL,0,1,NULL,0,0,0,0,0),(6,1,0,'RUS000006','测试i商品','+',0,0,NULL,1000,0.000,0,0.00,0.00,0.00,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,1,0,1000,'2017-08-10 17:27:02',0,0,'1',0,0,0,0,0,NULL,0,NULL,-1,-1,0,0,0,0,0,0,0,NULL,NULL,0,1,NULL,0,0,0,0,0),(7,1,0,'RUS000007','124','+',0,0,NULL,1000,0.000,0,0.00,0.00,0.00,NULL,NULL,1,NULL,NULL,'',NULL,'/userfiles/1/images/easyshop/goods/2017/08/6a6aa85b5b88a409ec7edd83d8df5a52.jpg',NULL,0,NULL,0,1,0,1000,'2017-08-10 17:34:10',0,0,'1',0,0,0,0,0,NULL,0,NULL,-1,-1,0,0,0,0,0,0,0,NULL,NULL,0,1,NULL,0,0,0,0,0),(8,1,0,'RUS000008','测试商品','+',0,0,NULL,1000,0.000,0,0.00,0.00,0.00,NULL,NULL,1,NULL,NULL,'',NULL,'/userfiles/1/images/easyshop/goods/2017/08/6a6aa85b5b88a409ec7edd83d8df5a52.jpg',NULL,0,NULL,0,1,0,1000,'2017-08-10 17:37:17',0,0,'1',0,0,0,0,0,NULL,0,NULL,-1,-1,0,0,0,0,0,0,0,NULL,NULL,0,1,NULL,0,0,0,0,0),(9,1,0,'RUS000009','测试黄桑坪','+',0,0,NULL,1000,0.000,0,0.00,0.00,0.00,NULL,NULL,1,NULL,NULL,'',NULL,'/userfiles/1/images/easyshop/goods/2017/08/5100f0176e27a167cc2aea08b1bd11d8.jpg',NULL,0,NULL,0,1,0,1000,'2017-08-10 17:39:24',0,0,'1',0,0,0,0,0,NULL,0,NULL,-1,-1,0,0,0,0,0,0,0,NULL,NULL,0,1,NULL,0,0,0,0,0),(10,1,0,'RUS000010','123123','+',0,0,NULL,1000,0.000,0,0.00,0.00,0.00,NULL,NULL,1,NULL,NULL,'',NULL,'',NULL,0,NULL,1,1,0,1000,'2017-08-10 17:40:35',0,0,'1',0,0,0,0,0,NULL,0,NULL,-1,-1,0,0,0,0,0,0,0,NULL,NULL,0,1,NULL,0,0,0,0,0),(11,1,0,'RUS000011','添加一个测试商品','+',0,0,NULL,997,0.000,0,0.00,0.00,0.00,NULL,NULL,1,NULL,NULL,'|/userfiles/1/images/easyshop/ad/2017/08/bg-03.jpg|/userfiles/1/images/easyshop/goods/2017/08/d8436c37c02065096d312c9d8d0b9034.jpg',NULL,'/userfiles/1/images/easyshop/goods/2017/08/d8436c37c02065096d312c9d8d0b9034.jpg',NULL,0,NULL,1,1,0,1000,'2017-08-10 18:17:02',0,0,'0',0,0,0,0,0,'2017-08-16 15:11:50',0,NULL,-1,-1,0,0,0,0,0,0,0,NULL,NULL,0,1,NULL,0,0,0,0,0),(12,1,0,'RUS000012','123333','+',0,0,NULL,1000,0.000,0,0.00,0.00,0.00,NULL,NULL,1,NULL,NULL,'<p>\r\n	<img alt=\"\" src=\"/userfiles/5b0c55a97b6645d0b5df6466465df809/images/easyshop/goods/2017/08/DSC_3375(1).jpg\" style=\"width: 1024px; height: 576px;\" /></p>',NULL,'',NULL,0,NULL,1,1,0,1000,'2017-08-16 13:42:56',0,0,'1',0,0,0,0,0,NULL,0,NULL,-1,-1,0,0,0,0,0,0,0,NULL,NULL,0,1,NULL,0,0,0,0,0),(13,1,0,'RUS000013','122222222222','+',0,0,NULL,1000,0.000,0,0.00,0.00,0.00,NULL,NULL,1,NULL,NULL,'<p>\r\n	<img alt=\"\" src=\"/userfiles/5b0c55a97b6645d0b5df6466465df809/images/easyshop/goods/2017/08/DSC_3467(1).jpg\" style=\"width: 1024px; height: 576px;\" /><img alt=\"\" src=\"/userfiles/5b0c55a97b6645d0b5df6466465df809/images/easyshop/goods/2017/08/DSC_3375(3).jpg\" style=\"width: 1024px; height: 576px;\" /></p>',NULL,'/userfiles/5b0c55a97b6645d0b5df6466465df809/images/easyshop/goods/2017/08/DSC_3467(1).jpg',NULL,0,NULL,1,1,0,1000,'2017-08-16 13:49:28',0,0,'1',0,0,0,0,0,'2017-08-16 13:56:07',0,NULL,-1,-1,0,0,0,0,0,0,0,NULL,NULL,0,1,NULL,0,0,0,0,0);
/*!40000 ALTER TABLE `easyshop_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easyshop_qs_answer`
--

DROP TABLE IF EXISTS `easyshop_qs_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easyshop_qs_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '问卷',
  `question_id` int(11) NOT NULL DEFAULT '0' COMMENT '问卷',
  `issue_id` int(1) DEFAULT '0' COMMENT '问题',
  `value` varchar(2000) DEFAULT '' COMMENT '答案',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='答案表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easyshop_qs_answer`
--

LOCK TABLES `easyshop_qs_answer` WRITE;
/*!40000 ALTER TABLE `easyshop_qs_answer` DISABLE KEYS */;
INSERT INTO `easyshop_qs_answer` VALUES (1,1,3,12,'5',NULL,'2017-08-10 20:20:24',NULL,'2017-08-10 20:20:24',NULL,'0'),(2,1,3,13,'1',NULL,'2017-08-10 20:20:24',NULL,'2017-08-10 20:20:24',NULL,'0'),(3,1,1,1,'0',NULL,'2017-08-14 16:48:08',NULL,'2017-08-14 16:48:08',NULL,'0'),(4,1,1,2,'1',NULL,'2017-08-14 16:48:08',NULL,'2017-08-14 16:48:08',NULL,'0'),(5,1,1,10,'5',NULL,'2017-08-14 16:48:08',NULL,'2017-08-14 16:48:08',NULL,'0'),(6,1,1,11,'9',NULL,'2017-08-14 16:48:08',NULL,'2017-08-14 16:48:08',NULL,'0'),(7,1,1,5,'2',NULL,'2017-08-14 16:48:08',NULL,'2017-08-14 16:48:08',NULL,'0'),(8,1,1,6,'挺好的',NULL,'2017-08-14 16:48:08',NULL,'2017-08-14 16:48:08',NULL,'0'),(9,1,4,15,'0',NULL,'2017-08-15 13:16:40',NULL,'2017-08-15 13:16:40',NULL,'0'),(10,1,4,14,'0',NULL,'2017-08-15 13:16:40',NULL,'2017-08-15 13:16:40',NULL,'0'),(11,2,4,15,'0',NULL,'2017-08-15 14:23:57',NULL,'2017-08-15 14:23:57',NULL,'0'),(12,2,4,14,'2',NULL,'2017-08-15 14:23:57',NULL,'2017-08-15 14:23:57',NULL,'0'),(13,3,4,15,'0','5b0c55a97b6645d0b5df6466465df809','2017-08-15 14:26:06','5b0c55a97b6645d0b5df6466465df809','2017-08-15 14:26:06',NULL,'0'),(14,3,4,14,'0','5b0c55a97b6645d0b5df6466465df809','2017-08-15 14:26:06','5b0c55a97b6645d0b5df6466465df809','2017-08-15 14:26:06',NULL,'0'),(15,1,5,16,'0','5b0c55a97b6645d0b5df6466465df809','2017-08-15 19:05:22','5b0c55a97b6645d0b5df6466465df809','2017-08-15 19:05:22',NULL,'0'),(16,1,6,17,'5','5b0c55a97b6645d0b5df6466465df809','2017-08-15 19:11:24','5b0c55a97b6645d0b5df6466465df809','2017-08-15 19:11:24',NULL,'0'),(17,2,6,17,'4',NULL,'2017-08-15 19:12:17',NULL,'2017-08-15 19:12:17',NULL,'0'),(18,4,6,17,'6','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:03:52','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:03:52',NULL,'0'),(19,1,7,18,'4','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:32:08','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:32:08',NULL,'0'),(20,1,7,19,'4','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:32:08','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:32:08',NULL,'0'),(21,1,7,20,'qqq','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:32:08','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:32:08',NULL,'0'),(22,1,7,21,'0,1,2','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:32:08','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:32:08',NULL,'0');
/*!40000 ALTER TABLE `easyshop_qs_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easyshop_qs_issue`
--

DROP TABLE IF EXISTS `easyshop_qs_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easyshop_qs_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(100) NOT NULL COMMENT '问题',
  `question_type` char(1) NOT NULL COMMENT '类型',
  `is_need` char(1) NOT NULL COMMENT '是否必填',
  `max_an` char(1) DEFAULT NULL COMMENT '最多答案，复选题使用',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `options` varchar(2000) DEFAULT NULL COMMENT '答案（多个答案以英文,号分割）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `question_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='问题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easyshop_qs_issue`
--

LOCK TABLES `easyshop_qs_issue` WRITE;
/*!40000 ALTER TABLE `easyshop_qs_issue` DISABLE KEYS */;
INSERT INTO `easyshop_qs_issue` VALUES (1,'这个苹果好吃吗？','2','1','',1,'好吃,不好吃,一般','1','2017-08-08 13:22:02','1','2017-08-08 14:50:50',NULL,'0',1),(2,'您意向的装箱大小。','3','1','3',2,'1公斤,3公斤,5公斤,10公斤,15公斤','1','2017-08-08 13:34:00','1','2017-08-08 14:50:54',NULL,'0',1),(3,'留下你的意见','1','0','',3,',,','1','2017-08-08 13:37:22','1','2017-08-08 13:37:22',NULL,'1',1),(4,'1234','1','1','',4,',,','1','2017-08-08 14:02:47','1','2017-08-08 14:02:47',NULL,'1',1),(5,'意向购买箱数。','2','1','',5,'1,2,3,4,5','1','2017-08-08 14:35:42','1','2017-08-08 14:50:58',NULL,'0',1),(6,'反馈意见','1','0','',6,'','1','2017-08-08 14:35:53','1','2017-08-08 14:51:03',NULL,'0',1),(7,'你最喜欢家里的人是谁？','2','1','',1,'爸爸,妈妈,祖父,祖母,哥哥,妹妹','1','2017-08-08 14:53:00','1','2017-08-08 14:53:00',NULL,'0',0),(8,'你毕业的学校是？','1','1','',3,'','1','2017-08-08 14:53:28','1','2017-08-08 14:53:28',NULL,'0',0),(9,'请对自己的学习成绩打个分数。','4','1','',2,'100','1','2017-08-08 14:54:07','1','2017-08-08 14:54:30',NULL,'0',0),(10,'评分','4','1','',3,'5','1','2017-08-08 19:04:08','1','2017-08-08 19:04:08',NULL,'0',1),(11,'添加一个10星评分','4','1','',4,'10','1','2017-08-08 19:19:31','1','2017-08-08 19:19:31',NULL,'0',1),(12,'1、给战狼打个分数','4','1','',1,'5','1','2017-08-10 17:01:40','1','2017-08-10 17:01:40',NULL,'0',3),(13,'2、对战狼进行一段简短的评语','1','1','',5,'','1','2017-08-10 17:17:14','1','2017-08-10 17:17:14',NULL,'0',3),(14,'第一个问题','2','1','',1,'AAAA,BBBB,CCCC','5b0c55a97b6645d0b5df6466465df809','2017-08-15 10:15:14','5b0c55a97b6645d0b5df6466465df809','2017-08-15 10:15:14',NULL,'0',4),(15,'第二个问题','3','1','2',0,'BBBBA，CCCDD，ssss','5b0c55a97b6645d0b5df6466465df809','2017-08-15 10:16:06','5b0c55a97b6645d0b5df6466465df809','2017-08-15 10:16:06',NULL,'0',4),(16,'第一个问题','2','1','',0,'AAAA,BBBB','5b0c55a97b6645d0b5df6466465df809','2017-08-15 19:01:18','5b0c55a97b6645d0b5df6466465df809','2017-08-15 19:01:18',NULL,'0',5),(17,'你好吗？','4','1','',1,'6','5b0c55a97b6645d0b5df6466465df809','2017-08-15 19:10:21','5b0c55a97b6645d0b5df6466465df809','2017-08-15 19:10:21',NULL,'0',6),(18,'请问您对我们的服务满意吗','4','1','',1,'5','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:28:39','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:28:39',NULL,'0',7),(19,'您对我们的工作人员满意吗？','4','1','',2,'5','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:29:03','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:29:03',NULL,'0',7),(20,'213213（必填）','1','1','',3,'','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:29:22','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:29:22',NULL,'0',7),(21,'你对我们那几个满意','3','1','3',4,'摄影,摄像,主持人,布置','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:30:12','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:30:12',NULL,'0',7);
/*!40000 ALTER TABLE `easyshop_qs_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easyshop_qs_question`
--

DROP TABLE IF EXISTS `easyshop_qs_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easyshop_qs_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `push_date` datetime DEFAULT NULL COMMENT '发布时间',
  `end_date` datetime DEFAULT NULL COMMENT '截止时间',
  `status` char(1) NOT NULL COMMENT '状态',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='问卷表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easyshop_qs_question`
--

LOCK TABLES `easyshop_qs_question` WRITE;
/*!40000 ALTER TABLE `easyshop_qs_question` DISABLE KEYS */;
INSERT INTO `easyshop_qs_question` VALUES (1,'第一份问卷调查','2017-08-08 11:43:46','2017-08-08 11:43:44','1',NULL,NULL,'1','2017-08-08 11:38:42','1','2017-08-08 14:51:35','','1'),(2,'第二份问卷调查','2017-08-08 14:54:52','2017-08-08 14:54:55','3',NULL,NULL,'1','2017-08-08 14:51:51','1','2017-08-08 14:54:57','','1'),(3,'第三份问卷调查',NULL,NULL,'1',NULL,NULL,'1','2017-08-10 17:00:59','1','2017-08-10 17:00:59','','1'),(4,'第三个问卷','2017-08-15 10:14:09','2017-08-19 10:14:11','1',NULL,NULL,'5b0c55a97b6645d0b5df6466465df809','2017-08-15 10:14:22','5b0c55a97b6645d0b5df6466465df809','2017-08-15 10:18:01','','1'),(5,'第四个',NULL,NULL,'1',NULL,0,'5b0c55a97b6645d0b5df6466465df809','2017-08-15 19:00:20','5b0c55a97b6645d0b5df6466465df809','2017-08-15 19:03:02','','0'),(6,'第五个',NULL,NULL,'1',NULL,0,'5b0c55a97b6645d0b5df6466465df809','2017-08-15 19:07:32','5b0c55a97b6645d0b5df6466465df809','2017-08-15 19:10:45','','0'),(7,'第六个',NULL,NULL,'1',NULL,0,'5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:28:19','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:28:19','','0');
/*!40000 ALTER TABLE `easyshop_qs_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easyshop_user`
--

DROP TABLE IF EXISTS `easyshop_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easyshop_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `sn` varchar(255) DEFAULT NULL COMMENT '编号',
  `name` varchar(64) NOT NULL COMMENT '姓名',
  `gender` char(1) DEFAULT '0' COMMENT '性别\n0：未知\n1：男\n2：女',
  `identity_card` varchar(36) DEFAULT NULL COMMENT '身份证',
  `wechat` varchar(50) DEFAULT NULL COMMENT '微信',
  `qq` varchar(20) DEFAULT NULL COMMENT 'QQ',
  `birth` date DEFAULT NULL COMMENT '出生日期',
  `birth_place` varchar(255) DEFAULT NULL COMMENT '出生地',
  `issue_place` varchar(255) DEFAULT NULL COMMENT '签发地',
  `issue_date` date DEFAULT NULL COMMENT '签发时间',
  `expiry_date` date DEFAULT NULL COMMENT '到期时间',
  `photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `passport` varchar(36) DEFAULT NULL COMMENT '护照',
  `passport_photo` varchar(255) DEFAULT NULL COMMENT '护照照片',
  `phone` varchar(36) DEFAULT NULL COMMENT '电话',
  `email` varchar(36) DEFAULT NULL COMMENT '邮件',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  `username` varchar(255) DEFAULT NULL COMMENT '登录名称',
  `password` varchar(255) DEFAULT NULL COMMENT '登录密码',
  `integral` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `passport_UNIQUE` (`passport`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easyshop_user`
--

LOCK TABLES `easyshop_user` WRITE;
/*!40000 ALTER TABLE `easyshop_user` DISABLE KEYS */;
INSERT INTO `easyshop_user` VALUES (1,'10001','小名',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-08-08 10:30:37','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:23:52','小明改名小名','0',NULL,NULL,500),(2,'10002','小萝卜头',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5b0c55a97b6645d0b5df6466465df809','2017-08-15 11:28:57','5b0c55a97b6645d0b5df6466465df809','2017-08-15 11:28:57','','0',NULL,NULL,10),(3,'10003','10003',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5b0c55a97b6645d0b5df6466465df809','2017-08-15 14:25:50','5b0c55a97b6645d0b5df6466465df809','2017-08-15 14:25:50','10003','0',NULL,NULL,1),(4,'10004','测试',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:02:56','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:03:19','测试帐号','0',NULL,NULL,19000),(5,'10005','123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:24:38','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:24:38','','0',NULL,NULL,5000);
/*!40000 ALTER TABLE `easyshop_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_scheme`
--

DROP TABLE IF EXISTS `gen_scheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_scheme` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `package_name` varchar(500) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) DEFAULT NULL COMMENT '生成表编号',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='生成方案';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_scheme`
--

LOCK TABLES `gen_scheme` WRITE;
/*!40000 ALTER TABLE `gen_scheme` DISABLE KEYS */;
INSERT INTO `gen_scheme` VALUES ('35a13dc260284a728a270db3f382664b','树结构','treeTable','com.thinkgem.jeesite.modules','easyshop','','商品分类信息','商品分类','RuYang','7f2ec7afa5854e5ba0fa4b9ad39443f8','1','2013-08-12 13:10:05','1','2017-08-07 18:17:49','','0'),('9c9de9db6da743bb899036c6546061ac','单表','curd','com.thinkgem.jeesite.modules','easyshop','','问题','问题','RuYang','2bb3f38e97864de09016f48de7775e58','1','2013-08-12 13:10:05','1','2017-08-08 11:23:09','','0'),('e6d905fd236b46d1af581dd32bdfb3b0','主子表','curd_many','com.thinkgem.jeesite.modules','test',NULL,'主子表生成','主子表','ThinkGem','43d6d5acffa14c258340ce6765e46c6f','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0');
/*!40000 ALTER TABLE `gen_scheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) DEFAULT NULL COMMENT '关联父表外键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_del_flag` (`del_flag`),
  KEY `gen_table_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table_column` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_column_del_flag` (`del_flag`),
  KEY `gen_table_column_name` (`name`),
  KEY `gen_table_column_sort` (`sort`),
  KEY `gen_table_column_table_id` (`gen_table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_template`
--

DROP TABLE IF EXISTS `gen_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_template` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `file_path` varchar(500) DEFAULT NULL COMMENT '生成文件路径',
  `file_name` varchar(200) DEFAULT NULL COMMENT '生成文件名',
  `content` text COMMENT '内容',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_template_del_falg` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代码模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_template`
--

LOCK TABLES `gen_template` WRITE;
/*!40000 ALTER TABLE `gen_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_area`
--

DROP TABLE IF EXISTS `sys_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_area_del_flag` (`del_flag`),
  KEY `sys_area_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='区域表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_area`
--

LOCK TABLES `sys_area` WRITE;
/*!40000 ALTER TABLE `sys_area` DISABLE KEYS */;
INSERT INTO `sys_area` VALUES ('1','0','0,','中国',10,'100000','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','山东省',20,'110000','2','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('3','2','0,1,2,','济南市',30,'110101','3','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('4','3','0,1,2,3,','历城区',40,'110102','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('49a507a649844281ba2f2d77017e08d4','1','0,1,','上海市',30,'310000','2','1','2017-04-27 11:13:42','1','2017-04-27 11:13:42','','0'),('5','3','0,1,2,3,','历下区',50,'110104','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('6','3','0,1,2,3,','高新区',60,'110105','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('e1376f56bf7946c4bb8684c16c3a38e3','49a507a649844281ba2f2d77017e08d4','0,1,49a507a649844281ba2f2d77017e08d4,','闵行区',30,'310112','4','1','2017-04-27 11:14:19','1','2017-04-27 11:14:19','','0');
/*!40000 ALTER TABLE `sys_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_del_flag` (`del_flag`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_value` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` VALUES ('092a98b6b34a481ca9aab97f7680d300','1','文本题','question_type','问答类型',10,'0','1','2017-08-08 10:43:53','1','2017-08-08 10:43:53','','0'),('1','0','正常','del_flag','删除标记',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','yellow','黄色','color','颜色值',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('100','java.util.Date','Date','gen_java_type','Java类型\0\0',50,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('101','com.thinkgem.jeesite.modules.sys.entity.User','User','gen_java_type','Java类型\0\0',60,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('102','com.thinkgem.jeesite.modules.sys.entity.Office','Office','gen_java_type','Java类型\0\0',70,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('103','com.thinkgem.jeesite.modules.sys.entity.Area','Area','gen_java_type','Java类型\0\0',80,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('104','Custom','Custom','gen_java_type','Java类型\0\0',90,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('105','1','会议通告\0\0\0\0','oa_notify_type','通知通告类型',10,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'1'),('106','2','奖惩通告\0\0\0\0','oa_notify_type','通知通告类型',20,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'1'),('107','3','活动通告\0\0\0\0','oa_notify_type','通知通告类型',30,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'1'),('108','0','草稿','oa_notify_status','通知通告状态',10,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'1'),('109','1','发布','oa_notify_status','通知通告状态',20,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'1'),('11','orange','橙色','color','颜色值',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('110','0','未读','oa_notify_read','通知通告状态',10,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'1'),('111','1','已读','oa_notify_read','通知通告状态',20,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'1'),('12','default','默认主题','theme','主题方案',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','cerulean','天蓝主题','theme','主题方案',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','readable','橙色主题','theme','主题方案',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','united','红色主题','theme','主题方案',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','flat','Flat主题','theme','主题方案',60,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','1','国家','sys_area_type','区域类型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','2','省份、直辖市','sys_area_type','区域类型',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','3','地市','sys_area_type','区域类型',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('1e89fcf3ea47451ab2d06fe369820a57','3','未发布','question_status','问卷发布状态',20,'0','1','2017-08-08 11:31:24','1','2017-08-08 11:31:24','','0'),('2','1','删除','del_flag','删除标记',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','4','区县','sys_area_type','区域类型',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','1','公司','sys_office_type','机构类型',60,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','2','部门','sys_office_type','机构类型',70,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','3','小组','sys_office_type','机构类型',80,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','4','其它','sys_office_type','机构类型',90,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2499df18d6c843799d6be9de44a0cd5c','1915','sms_config_comid','sms_config','短信配置',20,'0','5b0c55a97b6645d0b5df6466465df809','2017-08-16 11:17:39','5b0c55a97b6645d0b5df6466465df809','2017-08-16 11:17:39','企业编号','0'),('25','1','综合部','sys_office_common','快捷通用部门',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','2','开发部','sys_office_common','快捷通用部门',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','3','人力部','sys_office_common','快捷通用部门',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','1','一级','sys_office_grade','机构等级',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','2','二级','sys_office_grade','机构等级',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','1','显示','show_hide','显示/隐藏',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','3','三级','sys_office_grade','机构等级',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','4','四级','sys_office_grade','机构等级',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('316f47b6359e495bafcd4724034a3f87','2','单选题','question_type','问答类型',20,'0','1','2017-08-08 10:44:06','1','2017-08-08 10:44:06','','0'),('32','1','所有数据','sys_data_scope','数据范围',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','2','所在公司及以下数据','sys_data_scope','数据范围',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','3','所在公司数据','sys_data_scope','数据范围',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','4','所在部门及以下数据','sys_data_scope','数据范围',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','5','所在部门数据','sys_data_scope','数据范围',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','8','仅本人数据','sys_data_scope','数据范围',90,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','9','按明细设置','sys_data_scope','数据范围',100,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','1','系统管理','sys_user_type','用户类型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3e06b37914d84462945eebb6c9cf8f74','material','material','cms_theme','站点主题',30,'0','1','2017-05-04 10:24:40','1','2017-05-04 10:24:40','','1'),('4','0','隐藏','show_hide','显示/隐藏',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','2','部门经理','sys_user_type','用户类型',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','3','普通用户','sys_user_type','用户类型',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','basic','基础主题','cms_theme','站点主题',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('43','blue','蓝色主题','cms_theme','站点主题',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('44','red','红色主题','cms_theme','站点主题',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('45','article','文章模型','cms_module','栏目模型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('46','picture','图片模型','cms_module','栏目模型',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('47','download','下载模型','cms_module','栏目模型',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('48','link','链接模型','cms_module','栏目模型',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('48c50d02b9294e1d84c8249098c6fec7','shmaker','sms_config_username','sms_config','短信配置',20,'0','5b0c55a97b6645d0b5df6466465df809','2017-08-16 11:18:02','5b0c55a97b6645d0b5df6466465df809','2017-08-16 11:18:02','账户','0'),('49','special','专题模型','cms_module','栏目模型',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('5','1','是','yes_no','是/否',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','0','默认展现方式','cms_show_modes','展现方式',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('51','1','首栏目内容列表','cms_show_modes','展现方式',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('52','2','栏目第一条内容','cms_show_modes','展现方式',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('53','0','发布','cms_del_flag','内容状态',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('54','1','删除','cms_del_flag','内容状态',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('55','2','审核','cms_del_flag','内容状态',15,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('56','1','首页焦点图','cms_posid','推荐位',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('57','2','栏目页文章推荐','cms_posid','推荐位',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('58','1','咨询','cms_guestbook','留言板分类',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('59','2','建议','cms_guestbook','留言板分类',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('5ebec6d091a947e7846e36e2e4db1454','aa123456','sms_config_password','sms_config','短信配置',30,'0','5b0c55a97b6645d0b5df6466465df809','2017-08-16 11:18:25','5b0c55a97b6645d0b5df6466465df809','2017-08-16 11:18:25','','0'),('6','0','否','yes_no','是/否',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60','3','投诉','cms_guestbook','留言板分类',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('61','4','其它','cms_guestbook','留言板分类',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('62','1','公休','oa_leave_type','请假类型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('63','2','病假','oa_leave_type','请假类型',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('64','3','事假','oa_leave_type','请假类型',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('65','4','调休','oa_leave_type','请假类型',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('66','5','婚假','oa_leave_type','请假类型',60,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('67','1','接入日志','sys_log_type','日志类型',30,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('68','2','异常日志','sys_log_type','日志类型',40,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('68173e926fb6437ca8a0320159e8e332','3','复选题','question_type','问答类型',30,'0','1','2017-08-08 10:44:17','1','2017-08-08 10:44:17','','0'),('69','leave','请假流程','act_type','流程类型',10,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'1'),('7','red','红色','color','颜色值',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('70','test_audit','审批测试流程','act_type','流程类型',20,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'1'),('71','1','分类1','act_category','流程分类',10,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'1'),('72','2','分类2','act_category','流程分类',20,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'1'),('73','crud','增删改查','gen_category','代码生成分类',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('74','crud_many','增删改查（包含从表）','gen_category','代码生成分类',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('75','tree','树结构','gen_category','代码生成分类',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('75562b6f1dd64c17aefe22a1380cff71','4','评分题','question_type','问答类型',40,'0','1','2017-08-08 10:44:35','1','2017-08-08 10:44:35','','0'),('76','=','=','gen_query_type','查询方式',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('77','!=','!=','gen_query_type','查询方式',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('78','&gt;','&gt;','gen_query_type','查询方式',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('789551c781334739ac4f17d545cff351','17709222318','sms_config_mobile','sms_config','短信配置',10,'0','1','2017-08-16 10:31:24','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:34:32','','0'),('79','&lt;','&lt;','gen_query_type','查询方式',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('8','green','绿色','color','颜色值',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('80','between','Between','gen_query_type','查询方式',50,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('81','like','Like','gen_query_type','查询方式',60,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('82','left_like','Left Like','gen_query_type','查询方式',70,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('83','right_like','Right Like','gen_query_type','查询方式',80,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('84','input','文本框','gen_show_type','字段生成方案',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('85','textarea','文本域','gen_show_type','字段生成方案',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('86','select','下拉框','gen_show_type','字段生成方案',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('87','checkbox','复选框','gen_show_type','字段生成方案',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('88','radiobox','单选框','gen_show_type','字段生成方案',50,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('89','dateselect','日期选择','gen_show_type','字段生成方案',60,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('8e12adddc6e149d2b69b87c6497b4034','1','已发布','question_status','问卷发布状态',10,'0','1','2017-08-08 11:31:00','1','2017-08-08 11:32:31','','0'),('9','blue','蓝色','color','颜色值',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('90','userselect','人员选择\0','gen_show_type','字段生成方案',70,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('91','officeselect','部门选择','gen_show_type','字段生成方案',80,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('92','areaselect','区域选择','gen_show_type','字段生成方案',90,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('93','String','String','gen_java_type','Java类型',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('94','Long','Long','gen_java_type','Java类型',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('95','dao','仅持久层','gen_category','代码生成分类\0\0\0\0\0\0',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('96','1','男','sex','性别',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0'),('97','2','女','sex','性别',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0'),('98','Integer','Integer','gen_java_type','Java类型\0\0',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('99','Double','Double','gen_java_type','Java类型\0\0',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('9e017a5f966c46c19950b723e0c4f09a','【橙子科技】订单编号:%C% 有一个新的问卷反馈，请注意查收。','sms_config_content_2','sms_config','短信配置',50,'0','5b0c55a97b6645d0b5df6466465df809','2017-08-16 11:21:50','5b0c55a97b6645d0b5df6466465df809','2017-08-16 11:21:50','短信内容模版','0'),('bd177f5b6bdc4dc3883a8d7cac7ec604','【橙子科技】订单编号:%C% 有新的积分兑换，请注意查收。','sms_config_content_1','sms_config','短信配置',40,'0','5b0c55a97b6645d0b5df6466465df809','2017-08-16 11:21:13','5b0c55a97b6645d0b5df6466465df809','2017-08-16 11:21:13','短信模版内容','0'),('e8724f68708349b191d615b34ac74ae7','weixin','微信主题','cms_theme','站点主题',20,'0','1','2017-04-27 14:41:31','1','2017-04-27 14:41:31','','1'),('ed0417f059304fcca2c7fd73a775bfff','2','发布中','question_status','问卷发布状态',30,'0','1','2017-08-08 11:31:37','1','2017-08-08 11:31:37','','0');
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_create_date` (`create_date`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_mdict`
--

DROP TABLE IF EXISTS `sys_mdict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_mdict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_del_flag` (`del_flag`),
  KEY `sys_mdict_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='多级字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_mdict`
--

LOCK TABLES `sys_mdict` WRITE;
/*!40000 ALTER TABLE `sys_mdict` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_mdict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_del_flag` (`del_flag`),
  KEY `sys_menu_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES ('0b2ebd4d639e4c2b83c2dd0764522f24','ba8092291b40482db8fe7fc006ea3d76','0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,','编辑',60,'','','','0','test:testData:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','1'),('0ca004d6b1bf4bcab9670a5060d82a55','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','树结构',90,'/test/testTree','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','1'),('0ca281e0a3a94996a101d1a5a8d3bb39','8af7a6f854874ad39a65ebfe9aebadba','0,1,8af7a6f854874ad39a65ebfe9aebadba,','问卷管理',30,'','','','1','','1','2017-08-08 11:25:40','1','2017-08-08 11:25:40','','0'),('0ff4d6d968804a6b8b753cc3ac8d6965','89','0,1,62,88,89,','查看',30,'','','','0','easyshop:user:view','1','2017-08-07 18:22:12','1','2017-08-07 18:22:12','','0'),('1','0','0,','功能菜单',0,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','3','0,1,2,3,','字典管理',60,'/sys/dict/',NULL,'th-list','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','10','0,1,2,3,10,','查看',30,NULL,NULL,NULL,'0','sys:dict:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','10','0,1,2,3,10,','修改',40,NULL,NULL,NULL,'0','sys:dict:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','2','0,1,2,','机构用户',970,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','13','0,1,2,13,','区域管理',50,'/sys/area/',NULL,'th','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','14','0,1,2,13,14,','查看',30,NULL,NULL,NULL,'0','sys:area:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','14','0,1,2,13,14,','修改',40,NULL,NULL,NULL,'0','sys:area:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','13','0,1,2,13,','机构管理',40,'/sys/office/',NULL,'th-large','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','17','0,1,2,13,17,','查看',30,NULL,NULL,NULL,'0','sys:office:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','17','0,1,2,13,17,','修改',40,NULL,NULL,NULL,'0','sys:office:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','系统设置',900,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','13','0,1,2,13,','用户管理',30,'/sys/user/index',NULL,'user','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','20','0,1,2,13,20,','查看',30,NULL,NULL,NULL,'0','sys:user:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','20','0,1,2,13,20,','修改',40,NULL,NULL,NULL,'0','sys:user:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','2','0,1,2,','关于帮助',990,NULL,NULL,NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('24','23','0,1,2,23','官方首页',30,'http://jeesite.com','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','23','0,1,2,23','项目支持',50,'http://jeesite.com/donation.html','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('26','23','0,1,2,23','论坛交流',80,'http://bbs.jeesite.com','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('27','1','0,1,','我的面板',100,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','27','0,1,27,','个人信息',30,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','28','0,1,27,28,','个人信息',30,'/sys/user/info',NULL,'user','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','2','0,1,2,','系统设置',980,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','28','0,1,27,28,','修改密码',40,'/sys/user/modifyPwd',NULL,'lock','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','1','0,1,','商品中心',500,'','','','1','','1','2013-05-27 08:00:00','1','2017-08-07 17:32:29','','0'),('32','31','0,1,31,','栏目设置',990,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('33','32','0,1,31,32','栏目管理',30,'/cms/category/',NULL,'align-justify','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','33','0,1,31,32,33,','查看',30,NULL,NULL,NULL,'0','cms:category:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('34865102aba243359fc8f063733cbde5','60fb64c4bd9946dca8c80cbf0b4b4a1d','0,1,8af7a6f854874ad39a65ebfe9aebadba,0ca281e0a3a94996a101d1a5a8d3bb39,60fb64c4bd9946dca8c80cbf0b4b4a1d,','查看',30,'','','','0','easyshop:qsQuestion:view','1','2017-08-08 11:28:19','1','2017-08-08 11:28:19','','0'),('35','33','0,1,31,32,33,','修改',40,NULL,NULL,NULL,'0','cms:category:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('36','32','0,1,31,32','站点设置',40,'/cms/site/',NULL,'certificate','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','36','0,1,31,32,36,','查看',30,NULL,NULL,NULL,'0','cms:site:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('38','36','0,1,31,32,36,','修改',40,NULL,NULL,NULL,'0','cms:site:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('39','32','0,1,31,32','切换站点',50,'/cms/site/select',NULL,'retweet','1','cms:site:select','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3c92c17886944d0687e73e286cada573','79','0,1,79,','生成示例',120,'','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','1'),('4','3','0,1,2,3,','菜单管理',30,'/sys/menu/',NULL,'list-alt','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','31','0,1,31,','基础管理',2,'','','','1','cms:view','1','2013-05-27 08:00:00','1','2017-08-07 17:32:39','','0'),('41','40','0,1,31,40,','品牌管理',30,'/easyshop/brand','','briefcase','1','','1','2013-05-27 08:00:00','1','2017-08-10 16:21:53','','0'),('42','41','0,1,31,40,41,','文章模型',40,'/cms/article/',NULL,'file','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('43','42','0,1,31,40,41,42,','查看',30,NULL,NULL,NULL,'0','cms:article:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('44','42','0,1,31,40,41,42,','修改',40,NULL,NULL,NULL,'0','cms:article:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('44491c63399040c38519e7aa26702688','60','0,1,31,60,','新增商品',20,'/easyshop/goods/form','','filter','1','','1','2017-08-08 09:16:47','1','2017-08-10 16:28:18','','0'),('45','42','0,1,31,40,41,42,','审核',50,NULL,NULL,NULL,'0','cms:article:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('4553b744494f45c9ad9de383018681ad','41','0,1,31,40,41,','编辑',30,'','','','0','easyshop:brand:edit','1','2017-08-07 18:23:38','1','2017-08-07 18:23:52','','0'),('46','41','0,1,31,40,41,','链接模型',60,'/cms/link/',NULL,'random','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('47','46','0,1,31,40,41,46,','查看',30,NULL,NULL,NULL,'0','cms:link:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('48','46','0,1,31,40,41,46,','修改',40,NULL,NULL,NULL,'0','cms:link:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('4855cf3b25c244fb8500a380db189d97','b1f6d1b86ba24365bae7fd86c5082317','0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','查看',30,'','','','0','test:testDataMain:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','1'),('49','46','0,1,31,40,41,46,','审核',50,NULL,NULL,NULL,'0','cms:link:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('5','4','0,1,2,3,4,','查看',30,NULL,NULL,NULL,'0','sys:menu:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','40','0,1,31,40,','分类管理',40,'/easyshop/category','','comment','1','','1','2013-05-27 08:00:00','1','2017-08-07 18:24:19','','0'),('51','50','0,1,31,40,50,','查看',30,'','','','0','easyshop:category:view','1','2013-05-27 08:00:00','1','2017-08-07 18:24:44','','0'),('52','50','0,1,31,40,50,','审核',40,'','','','0','easyshop:category:edit','1','2013-05-27 08:00:00','1','2017-08-07 18:24:54','','0'),('53','40','0,1,31,40,','公共留言',80,'/cms/guestbook/?status=2',NULL,'glass','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('54','53','0,1,31,40,53,','查看',30,NULL,NULL,NULL,'0','cms:guestbook:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('55','53','0,1,31,40,53,','审核',40,NULL,NULL,NULL,'0','cms:guestbook:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('56','71','0,1,27,71,','文件管理',90,'/../static/ckfinder/ckfinder.html','','folder-open','1','','1','2013-05-27 08:00:00','1','2017-08-10 16:21:57','','0'),('57','56','0,1,27,40,56,','查看',30,NULL,NULL,NULL,'0','cms:ckfinder:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('575d9262167c4d4f9a17293bbe3ffbad','3','0,1,2,3,','背景设置',90,'/easyshop/ad','','picture','1','','1','2017-08-16 13:36:21','1','2017-08-16 13:36:21','','0'),('58','56','0,1,27,40,56,','上传',40,NULL,NULL,NULL,'0','cms:ckfinder:upload','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('59','56','0,1,27,40,56,','修改',50,NULL,NULL,NULL,'0','cms:ckfinder:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','4','0,1,2,3,4,','修改',40,NULL,NULL,NULL,'0','sys:menu:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60','31','0,1,31,','商品管理',1,'','','','1','','1','2013-05-27 08:00:00','1','2017-08-07 17:32:49','','0'),('60fb64c4bd9946dca8c80cbf0b4b4a1d','0ca281e0a3a94996a101d1a5a8d3bb39','0,1,8af7a6f854874ad39a65ebfe9aebadba,0ca281e0a3a94996a101d1a5a8d3bb39,','问卷列表',30,'/easyshop/qsQuestion','','comment','1','','1','2017-08-08 11:26:39','1','2017-08-08 11:26:39','','0'),('61','60','0,1,31,60,','商品列表',30,'/easyshop/goods','','tasks','1','','1','2013-05-27 08:00:00','1','2017-08-08 09:15:15','','0'),('62','1','0,1,','会员中心',200,'','','','1','','1','2013-05-27 08:00:00','1','2017-08-07 17:31:48','','0'),('63','62','0,1,62,','个人办公',30,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('64','63','0,1,62,63,','请假办理',300,'/oa/leave',NULL,'leaf','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('65','64','0,1,62,63,64,','查看',30,NULL,NULL,NULL,'0','oa:leave:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('66','64','0,1,62,63,64,','修改',40,NULL,NULL,NULL,'0','oa:leave:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('67','2','0,1,2,','日志查询',985,NULL,NULL,NULL,'1',NULL,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('68','67','0,1,2,67,','日志查询',30,'/sys/log',NULL,'pencil','1','sys:log:view','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('69','62','0,1,62,','流程管理',300,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('7','3','0,1,2,3,','角色管理',50,'/sys/role/','','reorder','1','','1','2013-05-27 08:00:00','1','2017-05-16 15:43:09','','0'),('70','69','0,1,62,69,','流程管理',50,'/act/process',NULL,'road','1','act:process:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('7059900c745e4eedbbb7d652046342e6','575d9262167c4d4f9a17293bbe3ffbad','0,1,2,3,575d9262167c4d4f9a17293bbe3ffbad,','查看',30,'','','','0','easyshop:ad:view','1','2017-08-16 13:36:49','1','2017-08-16 13:36:49','','0'),('71','27','0,1,27,','文件管理',90,'','','','1','','1','2013-05-27 08:00:00','1','2017-08-10 16:21:48','','0'),('72','69','0,1,62,69,','模型管理',100,'/act/model',NULL,'road','1','act:model:edit','1','2013-09-20 08:00:00','1','2013-09-20 08:00:00',NULL,'1'),('73','63','0,1,62,63,','我的任务',50,'/act/task/todo/',NULL,'tasks','1',NULL,'1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'1'),('74','63','0,1,62,63,','审批测试',100,'/oa/testAudit',NULL,NULL,'1','oa:testAudit:view,oa:testAudit:edit','1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'1'),('75','1','0,1,','在线演示',3000,NULL,NULL,NULL,'1',NULL,'1','2013-10-08 08:00:00','1','2013-10-08 08:00:00',NULL,'1'),('7709c1082b824f08a4e980b85ed9694d','2','0,1,2,','系统配置',960,'','','','1','','1','2017-08-16 11:08:29','1','2017-08-16 11:09:31','','1'),('79','1','0,1,','代码生成',5000,NULL,NULL,NULL,'1',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('8','7','0,1,2,3,7,','查看',30,NULL,NULL,NULL,'0','sys:role:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('80','79','0,1,79,','代码生成',50,NULL,NULL,NULL,'1',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('81','80','0,1,79,80,','生成方案配置',30,'/gen/genScheme',NULL,NULL,'1','gen:genScheme:view,gen:genScheme:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('82','80','0,1,79,80,','业务表配置',20,'/gen/genTable',NULL,NULL,'1','gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('83','80','0,1,79,80,','代码模板管理',90,'/gen/genTemplate',NULL,NULL,'1','gen:genTemplate:view,gen:genTemplate:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'1'),('84','67','0,1,2,67,','连接池监视',40,'/../druid',NULL,NULL,'1',NULL,'1','2013-10-18 08:00:00','1','2013-10-18 08:00:00',NULL,'0'),('85','76','0,1,75,76,','行政区域',80,'/../static/map/map-city.html',NULL,NULL,'1',NULL,'1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'0'),('86','75','0,1,75,','组件演示',50,NULL,NULL,NULL,'1',NULL,'1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'1'),('87','86','0,1,75,86,','组件演示',30,'/test/test/form',NULL,NULL,'1','test:test:view,test:test:edit','1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'1'),('88','62','0,1,62,','会员管理',20,'','','','1','','1','2013-11-08 08:00:00','1','2017-08-07 17:31:59','','0'),('89','88','0,1,62,88,','会员列表',30,'/easyshop/user','','','1','','1','2013-11-08 08:00:00','1','2017-08-07 18:21:53','','0'),('8af7a6f854874ad39a65ebfe9aebadba','1','0,1,','问卷调查',700,'','','','1','','1','2017-08-08 11:25:21','1','2017-08-08 11:25:21','','0'),('9','7','0,1,2,3,7,','修改',40,NULL,NULL,NULL,'0','sys:role:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('90','88','0,1,62,88,','通告管理',50,'/oa/oaNotify','','','1','oa:oaNotify:view,oa:oaNotify:edit','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'1'),('a5e55ff7862a4e7fb2fd1f372a9dcb71','60fb64c4bd9946dca8c80cbf0b4b4a1d','0,1,8af7a6f854874ad39a65ebfe9aebadba,0ca281e0a3a94996a101d1a5a8d3bb39,60fb64c4bd9946dca8c80cbf0b4b4a1d,','编辑',60,'','','','0','easyshop:qsQuestion:edit','1','2017-08-08 11:28:33','1','2017-08-08 11:28:33','','0'),('afab2db430e2457f9cf3a11feaa8b869','0ca004d6b1bf4bcab9670a5060d82a55','0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,','编辑',60,'','','','0','test:testTree:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','1'),('b1d061db4ba246fe8c341b3d123770ab','41','0,1,31,40,41,','查看',30,'','','','0','easyshop:brand:view','1','2017-08-07 18:23:21','1','2017-08-07 18:23:21','','0'),('b1f6d1b86ba24365bae7fd86c5082317','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','主子表',60,'/test/testDataMain','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','1'),('b304e22022284d69b7c514e9a764e099','7709c1082b824f08a4e980b85ed9694d','0,1,2,7709c1082b824f08a4e980b85ed9694d,','短信配置',30,'/sys/dict/list?type=sys_config','','envelope-alt','1','','1','2017-08-16 11:09:18','1','2017-08-16 11:12:14','','1'),('ba8092291b40482db8fe7fc006ea3d76','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','单表',30,'/test/testData','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','1'),('c2e4d9082a0b4386884a0b203afe2c5c','0ca004d6b1bf4bcab9670a5060d82a55','0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,','查看',30,'','','','0','test:testTree:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','1'),('d15ec45a4c5449c3bbd7a61d5f9dd1d2','b1f6d1b86ba24365bae7fd86c5082317','0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','编辑',60,'','','','0','test:testDataMain:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','1'),('d47191c831804293be8fe78129ab1050','89','0,1,62,88,89,','编辑',60,'','','','0','easyshop:user:edit','1','2017-08-07 18:22:26','1','2017-08-07 18:22:26','','0'),('df7ce823c5b24ff9bada43d992f373e2','ba8092291b40482db8fe7fc006ea3d76','0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,','查看',30,'','','','0','test:testData:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','1'),('ea54df7d2a594cde8400ea0b78f17325','575d9262167c4d4f9a17293bbe3ffbad','0,1,2,3,575d9262167c4d4f9a17293bbe3ffbad,','编辑',60,'','','','0','easyshop:ad:edit','1','2017-08-16 13:37:08','1','2017-08-16 13:37:08','','0');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_office`
--

DROP TABLE IF EXISTS `sys_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) NOT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) NOT NULL COMMENT '机构类型',
  `grade` char(1) NOT NULL COMMENT '机构等级',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) DEFAULT NULL COMMENT '传真',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) DEFAULT NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) DEFAULT NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) DEFAULT NULL COMMENT '副负责人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='机构表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_office`
--

LOCK TABLES `sys_office` WRITE;
/*!40000 ALTER TABLE `sys_office` DISABLE KEYS */;
INSERT INTO `sys_office` VALUES ('05c224a285cb47b6a69b2d75b9de7560','3268149d7a5e414d866acc5d1ae0eec5','0,3268149d7a5e414d866acc5d1ae0eec5,','综合部',30,'49a507a649844281ba2f2d77017e08d4','100001','2','2','','','','','','','1','','','1','2017-04-27 11:17:46','1','2017-04-27 12:33:34','','0'),('09112e0493894a6f84a7ec4c88248838','e9102f4f44344457ad3bb7dd1c19399e','0,3268149d7a5e414d866acc5d1ae0eec5,e9102f4f44344457ad3bb7dd1c19399e,','综合部',30,'49a507a649844281ba2f2d77017e08d4','200001','2','3','','','','','','','1','','','1','2017-04-27 11:19:26','1','2017-04-27 12:34:33','','1'),('1','0','0,','山东省总公司',10,'2','100000','1','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('10','7','0,1,7,','市场部',30,'3','200003','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('107fdbb540ae438396be901faf67fee4','3268149d7a5e414d866acc5d1ae0eec5','0,3268149d7a5e414d866acc5d1ae0eec5,','开发部',30,'49a507a649844281ba2f2d77017e08d4','100002','2','2','','','','','','','1','','','1','2017-04-27 11:17:46','1','2017-04-27 12:34:08','','0'),('109bfb3f03ca436fb7a7602987329e4e','3268149d7a5e414d866acc5d1ae0eec5','0,3268149d7a5e414d866acc5d1ae0eec5,','人力部',30,'49a507a649844281ba2f2d77017e08d4','100003','2','2','','','','','','','1','','','1','2017-04-27 11:17:46','1','2017-04-27 12:33:49','','0'),('11','7','0,1,7,','技术部',40,'3','200004','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('12','7','0,1,7,','历城区分公司',0,'4','201000','1','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('13','12','0,1,7,12,','公司领导',10,'4','201001','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('14','12','0,1,7,12,','综合部',20,'4','201002','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('15','12','0,1,7,12,','市场部',30,'4','201003','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('16','12','0,1,7,12,','技术部',40,'4','201004','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('17','7','0,1,7,','历下区分公司',40,'5','201010','1','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('18','17','0,1,7,17,','公司领导',10,'5','201011','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('19','17','0,1,7,17,','综合部',20,'5','201012','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('2','1','0,1,','公司领导',10,'2','100001','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('20','17','0,1,7,17,','市场部',30,'5','201013','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('21','17','0,1,7,17,','技术部',40,'5','201014','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('22','7','0,1,7,','高新区分公司',50,'6','201010','1','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('23','22','0,1,7,22,','公司领导',10,'6','201011','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('24','22','0,1,7,22,','综合部',20,'6','201012','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('25','22','0,1,7,22,','市场部',30,'6','201013','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('26','22','0,1,7,22,','技术部',40,'6','201014','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('3','1','0,1,','综合部',20,'2','100002','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('3268149d7a5e414d866acc5d1ae0eec5','0','0,','阿里弟弟（西安）有限公司',30,'49a507a649844281ba2f2d77017e08d4','100000','1','1','','','','','','','1','','','1','2017-04-27 11:17:45','1','2017-08-07 17:20:39','','0'),('4','1','0,1,','市场部',30,'2','100003','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('5','1','0,1,','技术部',40,'2','100004','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('6','1','0,1,','研发部',50,'2','100005','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('7','1','0,1,','济南市分公司',20,'3','200000','1','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('8','7','0,1,7,','公司领导',10,'3','200001','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('9','7','0,1,7,','综合部',20,'3','200002','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('e9102f4f44344457ad3bb7dd1c19399e','3268149d7a5e414d866acc5d1ae0eec5','0,3268149d7a5e414d866acc5d1ae0eec5,','上海掌上育儿网络科技有限公司',30,'49a507a649844281ba2f2d77017e08d4','200000','1','2','','','','','','','1','','','1','2017-04-27 11:19:26','1','2017-04-27 12:31:09','','1');
/*!40000 ALTER TABLE `sys_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES ('1','1','系统管理员','dept','assignment','1',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('2','107fdbb540ae438396be901faf67fee4','系统管理员','system manager','assignment','1','1','1','1','2013-05-27 08:00:00','1','2017-08-07 17:22:53','','0'),('3','05c224a285cb47b6a69b2d75b9de7560','本公司管理员','a','assignment','3','1','1','1','2013-05-27 08:00:00','1','2017-05-11 15:16:14','','1'),('4','1','部门管理员','b','assignment','4',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('48171b4e2c9b491ab2930deab9828d3d','107fdbb540ae438396be901faf67fee4','运营','yunying',NULL,'1','1','1','1','2017-08-10 16:23:49','1','2017-08-16 15:02:21','','0'),('5','107fdbb540ae438396be901faf67fee4','本部门管理员','c','assignment','3','1','1','1','2013-05-27 08:00:00','1','2017-05-11 15:13:46','','1'),('6','1','普通用户','d','assignment','8',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('7','7','济南市管理员','e','assignment','9',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色-菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES ('1','1'),('1','10'),('1','11'),('1','12'),('1','13'),('1','14'),('1','15'),('1','16'),('1','17'),('1','18'),('1','19'),('1','2'),('1','20'),('1','21'),('1','22'),('1','23'),('1','24'),('1','25'),('1','26'),('1','27'),('1','28'),('1','29'),('1','3'),('1','30'),('1','31'),('1','32'),('1','33'),('1','34'),('1','35'),('1','36'),('1','37'),('1','38'),('1','39'),('1','4'),('1','40'),('1','41'),('1','42'),('1','43'),('1','44'),('1','45'),('1','46'),('1','47'),('1','48'),('1','49'),('1','5'),('1','50'),('1','51'),('1','52'),('1','53'),('1','54'),('1','55'),('1','56'),('1','57'),('1','58'),('1','59'),('1','6'),('1','60'),('1','61'),('1','62'),('1','63'),('1','64'),('1','65'),('1','66'),('1','67'),('1','68'),('1','69'),('1','7'),('1','70'),('1','71'),('1','72'),('1','73'),('1','74'),('1','75'),('1','76'),('1','77'),('1','78'),('1','79'),('1','8'),('1','80'),('1','81'),('1','82'),('1','83'),('1','84'),('1','85'),('1','86'),('1','87'),('1','88'),('1','89'),('1','9'),('1','90'),('2','0b2ebd4d639e4c2b83c2dd0764522f24'),('2','0ca004d6b1bf4bcab9670a5060d82a55'),('2','1'),('2','10'),('2','11'),('2','12'),('2','13'),('2','14'),('2','15'),('2','16'),('2','17'),('2','18'),('2','19'),('2','2'),('2','20'),('2','21'),('2','22'),('2','23'),('2','24'),('2','27'),('2','28'),('2','29'),('2','3'),('2','30'),('2','31'),('2','32'),('2','33'),('2','34'),('2','35'),('2','36'),('2','37'),('2','38'),('2','39'),('2','3c92c17886944d0687e73e286cada573'),('2','4'),('2','40'),('2','41'),('2','42'),('2','43'),('2','44'),('2','45'),('2','46'),('2','47'),('2','48'),('2','4855cf3b25c244fb8500a380db189d97'),('2','49'),('2','5'),('2','50'),('2','51'),('2','52'),('2','53'),('2','54'),('2','55'),('2','56'),('2','57'),('2','58'),('2','59'),('2','6'),('2','60'),('2','61'),('2','62'),('2','63'),('2','64'),('2','65'),('2','66'),('2','67'),('2','68'),('2','69'),('2','7'),('2','70'),('2','71'),('2','72'),('2','73'),('2','74'),('2','79'),('2','8'),('2','80'),('2','81'),('2','82'),('2','84'),('2','85'),('2','88'),('2','89'),('2','9'),('2','90'),('2','afab2db430e2457f9cf3a11feaa8b869'),('2','b1f6d1b86ba24365bae7fd86c5082317'),('2','ba8092291b40482db8fe7fc006ea3d76'),('2','c2e4d9082a0b4386884a0b203afe2c5c'),('2','d15ec45a4c5449c3bbd7a61d5f9dd1d2'),('2','df7ce823c5b24ff9bada43d992f373e2'),('3','1'),('3','27'),('3','28'),('3','29'),('3','30'),('48171b4e2c9b491ab2930deab9828d3d','0ca281e0a3a94996a101d1a5a8d3bb39'),('48171b4e2c9b491ab2930deab9828d3d','0ff4d6d968804a6b8b753cc3ac8d6965'),('48171b4e2c9b491ab2930deab9828d3d','1'),('48171b4e2c9b491ab2930deab9828d3d','10'),('48171b4e2c9b491ab2930deab9828d3d','11'),('48171b4e2c9b491ab2930deab9828d3d','12'),('48171b4e2c9b491ab2930deab9828d3d','2'),('48171b4e2c9b491ab2930deab9828d3d','27'),('48171b4e2c9b491ab2930deab9828d3d','28'),('48171b4e2c9b491ab2930deab9828d3d','29'),('48171b4e2c9b491ab2930deab9828d3d','3'),('48171b4e2c9b491ab2930deab9828d3d','30'),('48171b4e2c9b491ab2930deab9828d3d','31'),('48171b4e2c9b491ab2930deab9828d3d','34865102aba243359fc8f063733cbde5'),('48171b4e2c9b491ab2930deab9828d3d','44491c63399040c38519e7aa26702688'),('48171b4e2c9b491ab2930deab9828d3d','56'),('48171b4e2c9b491ab2930deab9828d3d','57'),('48171b4e2c9b491ab2930deab9828d3d','575d9262167c4d4f9a17293bbe3ffbad'),('48171b4e2c9b491ab2930deab9828d3d','58'),('48171b4e2c9b491ab2930deab9828d3d','59'),('48171b4e2c9b491ab2930deab9828d3d','60'),('48171b4e2c9b491ab2930deab9828d3d','60fb64c4bd9946dca8c80cbf0b4b4a1d'),('48171b4e2c9b491ab2930deab9828d3d','61'),('48171b4e2c9b491ab2930deab9828d3d','62'),('48171b4e2c9b491ab2930deab9828d3d','7059900c745e4eedbbb7d652046342e6'),('48171b4e2c9b491ab2930deab9828d3d','71'),('48171b4e2c9b491ab2930deab9828d3d','88'),('48171b4e2c9b491ab2930deab9828d3d','89'),('48171b4e2c9b491ab2930deab9828d3d','8af7a6f854874ad39a65ebfe9aebadba'),('48171b4e2c9b491ab2930deab9828d3d','a5e55ff7862a4e7fb2fd1f372a9dcb71'),('48171b4e2c9b491ab2930deab9828d3d','d47191c831804293be8fe78129ab1050'),('48171b4e2c9b491ab2930deab9828d3d','ea54df7d2a594cde8400ea0b78f17325'),('5','1'),('5','27'),('5','28'),('5','29'),('5','30'),('5','31'),('5','60'),('5','61'),('5','85');
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_office`
--

DROP TABLE IF EXISTS `sys_role_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色-机构';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_office`
--

LOCK TABLES `sys_role_office` WRITE;
/*!40000 ALTER TABLE `sys_role_office` DISABLE KEYS */;
INSERT INTO `sys_role_office` VALUES ('7','10'),('7','11'),('7','12'),('7','13'),('7','14'),('7','15'),('7','16'),('7','17'),('7','18'),('7','19'),('7','20'),('7','21'),('7','22'),('7','23'),('7','24'),('7','25'),('7','26'),('7','7'),('7','8'),('7','9');
/*!40000 ALTER TABLE `sys_role_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `company_id` varchar(64) NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `user_type` char(1) DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_del_flag` (`del_flag`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_update_date` (`update_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('1','3268149d7a5e414d866acc5d1ae0eec5','107fdbb540ae438396be901faf67fee4','admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0001','系统管理员','ruyangit@163.com','8675','8675','1','','124.114.248.152','2017-08-16 15:18:04','1','1','2013-05-27 08:00:00','1','2017-08-07 17:35:03','最高管理员','0'),('2','3268149d7a5e414d866acc5d1ae0eec5','05c224a285cb47b6a69b2d75b9de7560','zs_admin','649429f3b3e528af90c5bfd0df2dc9e83189098cad0a3a6986274092','0002','管理员','','','','','','10.166.1.200','2017-05-08 11:06:40','1','1','2013-05-27 08:00:00','1','2017-05-08 11:06:35','','1'),('3','e9102f4f44344457ad3bb7dd1c19399e','09112e0493894a6f84a7ec4c88248838','zy_zhb','d5219f9df2fc565152a1f1fbbd07c0eef6aa2261ab700e88c103a30c','0003','综合部','','','','','','127.0.0.1','2017-05-11 15:16:45','1','1','2013-05-27 08:00:00','3','2017-05-11 15:17:37','','1'),('5b0c55a97b6645d0b5df6466465df809','3268149d7a5e414d866acc5d1ae0eec5','05c224a285cb47b6a69b2d75b9de7560','admin_yy','6cb68c3d8b063939ec78885825f3c178aba92142081039ee35b90333','100001','管理员','370777409@qq.com','029-85219932','17709222318','1','','180.168.53.250','2017-08-16 15:16:37','1','1','2017-08-10 16:25:38','5b0c55a97b6645d0b5df6466465df809','2017-08-16 13:27:21','','0');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户-角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES ('1','2'),('10','2'),('11','3'),('12','4'),('13','5'),('14','6'),('2','1'),('3','3'),('4','3'),('5','4'),('5b0c55a97b6645d0b5df6466465df809','48171b4e2c9b491ab2930deab9828d3d'),('6','5'),('7','2'),('7','7'),('8','2'),('9','1');
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'easy_shop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-16 16:55:03
