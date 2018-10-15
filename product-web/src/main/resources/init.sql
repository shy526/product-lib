 /**
  * 表格初始化
  */

/**
    访问码表
 */
CREATE TABLE IF NOT EXISTS  `t_access_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `access_key` varchar(6) DEFAULT NULL COMMENT 'key',
  `access_power` text COMMENT '关于访问权利描述',
  `manager_power` int(1) DEFAULT '0' COMMENT '管理权限',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `data_status` int(1) DEFAULT '0' COMMENT '是否可用',
  `update_time` bigint(13) DEFAULT NULL COMMENT '更新时间',
  `create_time` bigint(13) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO  `t_access_key` VALUES(1,'guest','all',0,'默认游客账号,无法删除',0,NOW()*1000,NOW()*1000);
INSERT INTO  `t_access_key` VALUES(2,'manager','all',1,'默认管理账号,无法删除和修改',0,NOW()*1000,NOW()*1000);
/*
 * 图片资源表
 */
CREATE TABLE IF NOT EXISTS  `t_img_resource` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `local_path` varchar(500) NOT NULL COMMENT '本地地址',
  `show_url` varchar(500) NOT NULL COMMENT '展示地址',
  `img_type` int(255) DEFAULT NULL COMMENT '图片类型',
  `create_time` bigint(13) DEFAULT NULL,
  `update_time` bigint(13) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*
 * 产品表
 */
CREATE TABLE IF NOT EXISTS `t_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL COMMENT '类型id',
  `name` varchar(20) DEFAULT NULL COMMENT '产品名',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `data_status` int(1) DEFAULT '0' COMMENT '是否可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/**
    产品关联 img 表格
 */
CREATE TABLE IF NOT EXISTS  `t_product_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `img_id` int(11) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/**
   产品类目
 */
CREATE TABLE IF NOT EXISTS `t_product_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '类目名称',
  `paren` int(11) DEFAULT NULL COMMENT '父id',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `data_status` int(11) DEFAULT '0' COMMENT '是否可用',
  PRIMARY KEY (`id`),
  KEY `paren` (`paren`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
