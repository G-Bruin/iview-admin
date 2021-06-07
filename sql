CREATE TABLE `wisdom`.`office_building` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`title` varchar(255) COMMENT 'title',
	`picture` text COMMENT '数组项目图片',
	`position_picture` text COMMENT '数组位置图片',
	`type` varchar(255) COMMENT '类型',
	`address` varchar(255) COMMENT '地址',
	`floor` varchar(255) COMMENT '楼层',
	`elevator` varchar(255) COMMENT '电梯',
	`property` varchar(255) COMMENT '物业',
	`property_free` varchar(255) COMMENT '物业管理费',
	`day_rent` varchar(255) COMMENT '日租金均价',
	`complete_day` varchar(255) COMMENT '竣工年月',
	`developer` varchar(255) COMMENT '开发商',
	`area` varchar(255) COMMENT '总建筑面积',
	`marker_area` varchar(255) COMMENT '标准层面积',
	`clear_height` varchar(255) COMMENT '净高',
	`parking_space` varchar(255) COMMENT '停车位',
	`parking_free` varchar(255) COMMENT '每月车位费',
	`utility_rate` varchar(255) COMMENT '实用率',
	`greening_rate` varchar(255) COMMENT '绿化率',
	`rentable_area` text COMMENT '数组出租面积',
	`introduce` text COMMENT '项目介绍',
	`hotel_etc` text COMMENT '周边酒店、餐饮、银行介绍',
	`traffic` text COMMENT '周边交通介绍',
	`company` text COMMENT '周边入驻企业',
	`phone` varchar(255) COMMENT '手机号',
	`created_by` int(11) COMMENT '创建人',
	`updated_by` int(11) COMMENT '更新人',
    `created_at` datetime DEFAULT NULL,
    `updated_at` datetime DEFAULT NULL,
    `deleted_at` datetime DEFAULT NULL,
	PRIMARY KEY (`id`),
	KEY `created_by` (`created_by`) USING BTREE,
	KEY `updated_by` (`updated_by`) USING BTREE
) COMMENT='公寓楼出租';
