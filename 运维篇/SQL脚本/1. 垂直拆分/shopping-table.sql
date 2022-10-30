DROP TABLE IF EXISTS tb_goods_base;

CREATE TABLE tb_goods_base (
  id bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  seller_id varchar(20) DEFAULT NULL COMMENT '商家ID',
  goods_name varchar(100) DEFAULT NULL COMMENT 'SPU名',
  audit_status varchar(2) DEFAULT NULL COMMENT '状态',
  is_marketable varchar(1) DEFAULT NULL COMMENT '是否上架',
  brand_id bigint DEFAULT NULL COMMENT '品牌',
  caption varchar(100) DEFAULT NULL COMMENT '副标题',
  category1_id bigint DEFAULT NULL COMMENT '一级类目',
  category2_id bigint DEFAULT NULL COMMENT '二级类目',
  category3_id bigint DEFAULT NULL COMMENT '三级类目',
  small_pic varchar(150) DEFAULT NULL COMMENT '小图',
  price decimal(10,2) DEFAULT NULL COMMENT '商城价',
  is_delete varchar(1) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (id)
) ENGINE=InnoDB ;

DROP TABLE IF EXISTS tb_goods_brand;

CREATE TABLE tb_goods_brand (
  id int NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  name varchar(100) NOT NULL COMMENT '品牌名称',
  letter char(1) DEFAULT '' COMMENT '品牌的首字母',
  seq int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS tb_goods_cat;

CREATE TABLE tb_goods_cat (
  id bigint NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  parent_id bigint DEFAULT NULL COMMENT '父类目ID=0时，代表的是一级的类目',
  name varchar(50) DEFAULT NULL COMMENT '类目名称',
  type_id bigint DEFAULT NULL COMMENT '类型id',
  PRIMARY KEY (id),
  KEY parent_id (parent_id)
) ENGINE=InnoDB COMMENT='商品类目';

DROP TABLE IF EXISTS tb_goods_desc;

CREATE TABLE tb_goods_desc (
  goods_id bigint NOT NULL COMMENT 'SPU_ID',
  specification_items varchar(3000) DEFAULT NULL COMMENT '规格结果集，所有规格，包含isSelected',
  custom_attribute_items varchar(3000) DEFAULT NULL COMMENT '自定义属性',
  item_images varchar(3000) DEFAULT NULL,
  package_list varchar(3000) DEFAULT NULL COMMENT '包装列表',
  sale_service varchar(3000) DEFAULT NULL COMMENT '售后服务',
  PRIMARY KEY (goods_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS tb_goods_item;

CREATE TABLE tb_goods_item (
  id bigint NOT NULL AUTO_INCREMENT COMMENT '商品id，同时也是商品编号',
  title varchar(100) NOT NULL COMMENT '商品标题',
  price decimal(20,2) NOT NULL COMMENT '商品价格，单位为：元',
  stock_count int DEFAULT NULL,
  num int NOT NULL COMMENT '库存数量',
  barcode varchar(30) DEFAULT NULL COMMENT '商品条形码',
  image varchar(2000) DEFAULT NULL COMMENT '商品图片',
  categoryId bigint NOT NULL COMMENT '所属类目，叶子类目',
  status varchar(1) NOT NULL COMMENT '商品状态，1-正常，2-下架，3-删除',
  create_time datetime NOT NULL COMMENT '创建时间',
  update_time datetime NOT NULL COMMENT '更新时间',
  item_sn varchar(30) DEFAULT NULL,
  cost_pirce decimal(10,2) DEFAULT NULL,
  market_price decimal(10,2) DEFAULT NULL,
  is_default varchar(1) DEFAULT NULL,
  goods_id bigint DEFAULT NULL,
  seller_id varchar(30) DEFAULT NULL,
  cart_thumbnail varchar(150) DEFAULT NULL,
  category varchar(200) DEFAULT NULL,
  brand varchar(100) DEFAULT NULL,
  spec varchar(200) DEFAULT NULL,
  seller varchar(200) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY cid (categoryId),
  KEY status (status),
  KEY updated (update_time)
) ENGINE=InnoDB COMMENT='商品表';

DROP TABLE IF EXISTS tb_order_item;

CREATE TABLE tb_order_item (
  id bigint NOT NULL,
  item_id bigint NOT NULL COMMENT 'SKU_ID',
  goods_id bigint DEFAULT NULL COMMENT 'SPU_ID',
  order_id bigint NOT NULL COMMENT '订单id',
  title varchar(200) DEFAULT NULL COMMENT '商品标题',
  price decimal(20,2) DEFAULT NULL COMMENT '商品单价',
  num int DEFAULT NULL COMMENT '商品购买数量',
  total_fee decimal(20,2) DEFAULT NULL COMMENT '商品总金额',
  pic_path varchar(200) DEFAULT NULL COMMENT '商品图片地址',
  seller_id varchar(100) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY item_id (item_id),
  KEY order_id (order_id)
) ENGINE=InnoDB ;

DROP TABLE IF EXISTS tb_order_master;

CREATE TABLE tb_order_master (
  order_id bigint NOT NULL COMMENT '订单id',
  payment decimal(20,2) DEFAULT NULL COMMENT '实付金额',
  payment_type varchar(1) DEFAULT NULL COMMENT '支付类型',
  post_fee varchar(50) DEFAULT NULL COMMENT '邮费',
  status varchar(1) DEFAULT NULL COMMENT '状态',
  create_time datetime DEFAULT NULL COMMENT '订单创建时间',
  update_time datetime DEFAULT NULL COMMENT '订单更新时间',
  payment_time datetime DEFAULT NULL COMMENT '付款时间',
  consign_time datetime DEFAULT NULL COMMENT '发货时间',
  end_time datetime DEFAULT NULL COMMENT '交易完成时间',
  close_time datetime DEFAULT NULL COMMENT '交易关闭时间',
  shipping_name varchar(20) DEFAULT NULL COMMENT '物流名称',
  shipping_code varchar(20) DEFAULT NULL COMMENT '物流单号',
  user_id varchar(50) DEFAULT NULL COMMENT '用户id',
  buyer_message varchar(100) DEFAULT NULL COMMENT '买家留言',
  buyer_nick varchar(50) DEFAULT NULL COMMENT '买家昵称',
  buyer_rate varchar(2) DEFAULT NULL COMMENT '买家是否已经评价',
  receiver_province varchar(100) DEFAULT NULL COMMENT '收货人地区名称',
  receiver_city varchar(12) DEFAULT NULL COMMENT '收货人手机',
  receiver_region varchar(15) DEFAULT NULL COMMENT '收货人邮编',
  receiver varchar(50) DEFAULT NULL COMMENT '收货人',
  expire datetime DEFAULT NULL COMMENT '过期时间，定期清理',
  invoice_type varchar(1) DEFAULT NULL COMMENT '发票类型',
  source_type varchar(1) DEFAULT NULL COMMENT '订单来源',
  seller_id varchar(100) DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (order_id),
  KEY create_time (create_time),
  KEY buyer_nick (buyer_nick),
  KEY status (status),
  KEY payment_type (payment_type)
) ENGINE=InnoDB ;

DROP TABLE IF EXISTS tb_order_pay_log;

CREATE TABLE tb_order_pay_log (
  out_trade_no varchar(30) NOT NULL COMMENT '支付订单号',
  create_time datetime DEFAULT NULL COMMENT '创建日期',
  pay_time datetime DEFAULT NULL COMMENT '支付完成时间',
  total_fee bigint DEFAULT NULL COMMENT '支付金额',
  user_id varchar(50) DEFAULT NULL COMMENT '用户ID',
  transaction_id varchar(30) DEFAULT NULL COMMENT '交易号码',
  trade_state varchar(1) DEFAULT NULL COMMENT '交易状态',
  order_list varchar(200) DEFAULT NULL COMMENT '订单编号列表',
  pay_type varchar(1) DEFAULT NULL COMMENT '支付类型',
  PRIMARY KEY (out_trade_no)
) ENGINE=InnoDB ;


DROP TABLE IF EXISTS tb_user;

CREATE TABLE tb_user (
  id bigint NOT NULL AUTO_INCREMENT,
  username varchar(50) NOT NULL COMMENT '用户名',
  password varchar(32) NOT NULL COMMENT '密码，加密存储',
  phone varchar(20) DEFAULT NULL COMMENT '注册手机号',
  email varchar(50) DEFAULT NULL COMMENT '注册邮箱',
  created datetime NOT NULL COMMENT '创建时间',
  updated datetime NOT NULL,
  source_type varchar(1) DEFAULT NULL COMMENT '会员来源',
  nick_name varchar(50) DEFAULT NULL COMMENT '昵称',
  name varchar(50) DEFAULT NULL COMMENT '真实姓名',
  status varchar(1) DEFAULT NULL COMMENT '使用状态',
  PRIMARY KEY (id),
  UNIQUE KEY username (username)
) ENGINE=InnoDB  COMMENT='用户表';

DROP TABLE IF EXISTS tb_user_address;

CREATE TABLE tb_user_address (
  id bigint NOT NULL AUTO_INCREMENT,
  user_id varchar(50) DEFAULT NULL COMMENT '用户ID',
  province_id varchar(10) DEFAULT NULL COMMENT '省',
  city_id varchar(10) DEFAULT NULL COMMENT '市',
  town_id varchar(10) DEFAULT NULL COMMENT '县/区',
  mobile varchar(255) DEFAULT NULL COMMENT '手机',
  address varchar(255) DEFAULT NULL COMMENT '详细地址',
  contact varchar(255) DEFAULT NULL COMMENT '联系人',
  is_default varchar(1) DEFAULT NULL COMMENT '是否是默认 1默认 0否',
  create_date datetime DEFAULT NULL COMMENT '创建日期',
  alias varchar(50) DEFAULT NULL COMMENT '别名',
  PRIMARY KEY (id)
) ENGINE=InnoDB ;

DROP TABLE IF EXISTS tb_areas_city;

CREATE TABLE tb_areas_city (
  id int NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  cityid varchar(20) NOT NULL COMMENT '城市ID',
  city varchar(50) NOT NULL COMMENT '城市名称',
  provinceid varchar(20) NOT NULL COMMENT '省份ID',
  PRIMARY KEY (id)
) ENGINE=InnoDB  COMMENT='行政区域地州市信息表';

DROP TABLE IF EXISTS tb_areas_provinces;

CREATE TABLE tb_areas_provinces (
  id int NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  provinceid varchar(20) NOT NULL COMMENT '省份ID',
  province varchar(50) NOT NULL COMMENT '省份名称',
  PRIMARY KEY (id)
) ENGINE=InnoDB  COMMENT='省份信息表';

DROP TABLE IF EXISTS tb_areas_region;

CREATE TABLE tb_areas_region (
  id int NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  areaid varchar(20) NOT NULL COMMENT '区域ID',
  area varchar(50) NOT NULL COMMENT '区域名称',
  cityid varchar(20) NOT NULL COMMENT '城市ID',
  PRIMARY KEY (id)
) ENGINE=InnoDB  COMMENT='行政区域县区信息表';










