/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : kitecms

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-07-11 22:57:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kite_addons
-- ----------------------------
DROP TABLE IF EXISTS `kite_addons`;
CREATE TABLE `kite_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text DEFAULT NULL COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态 0 未安装 1 启用 2禁用 3损坏',
  `config` text DEFAULT NULL COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否有后台列表',
  `create_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of kite_addons
-- ----------------------------
INSERT INTO `kite_addons` VALUES ('3', 'demo', '演示插件', '用于演示插件', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"4\",\"display\":\"1\",\"id\":\"3\"}', 'kitecms', '1.0', '1', null, null);

-- ----------------------------
-- Table structure for kite_auth_role
-- ----------------------------
DROP TABLE IF EXISTS `kite_auth_role`;
CREATE TABLE `kite_auth_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `rule_ids` varchar(1024) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '角色拥有的权限集合',
  `site_ids` varchar(1024) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '站点ID集合',
  `lang_var` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '语言表示',
  `sort` int(11) DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_auth_role
-- ----------------------------
INSERT INTO `kite_auth_role` VALUES ('1', '管理员', '10,97,108,107,98,99,100,101,109,110,111,112,113,114,102,103,104,105,106,3,24,36,37,38,25,39,40,41,29,30,31,32,33,34,35,6,26,27,28,5,42,43,44,45,46,47,48,49,50,82,55,73,74,83,85,94,95,96,86,52,87,88,65,66,67,68,69,70,71,56,57,58,59,60,61,62,75,76,77,78,79,80,81,51,53,54,4,7,18,19,20,21,8,15,16,17,2,1,12,13,14,9,11,22,23,72,89,90,91,92,93,63,64', '1,2', 'Administrator', '1');
INSERT INTO `kite_auth_role` VALUES ('2', '编辑员', '10,3,24,36,37,38,25,39,40,41,29,30,31,32,33,34,35,6,26,27,28', '', 'Editor', '2');
INSERT INTO `kite_auth_role` VALUES ('3', '注册用户', '10,97,108,107,98,99,100,101,109,110,111,112,113,114,102,103,104,105,106', '', 'Member', '2');

-- ----------------------------
-- Table structure for kite_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `kite_auth_rule`;
CREATE TABLE `kite_auth_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `module` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '规则所属模型',
  `name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '规则名称',
  `url` varchar(64) CHARACTER SET utf8 NOT NULL,
  `menu` tinyint(1) DEFAULT 0 COMMENT '是否为菜单0 否 1是',
  `icon` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT 'fa fa-circle-o' COMMENT '图标',
  `sort` int(11) DEFAULT 0 COMMENT '排序',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '备注说明',
  `lang_var` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '语言表示',
  PRIMARY KEY (`id`),
  KEY `permission_url` (`url`) USING BTREE,
  KEY `lang_var` (`lang_var`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_auth_rule
-- ----------------------------
INSERT INTO `kite_auth_rule` VALUES ('1', '0', 'admin', '系统管理', '#', '1', 'fa fa-laptop', '6', '', 'System');
INSERT INTO `kite_auth_rule` VALUES ('2', '8', 'admin', '站点授权', 'admin/role/siteAuth', '0', '', '3', '', 'Site authorize');
INSERT INTO `kite_auth_rule` VALUES ('3', '0', 'admin', '信息管理', '#', '1', 'fa fa-file-word-o', '2', '', 'Information');
INSERT INTO `kite_auth_rule` VALUES ('4', '0', 'admin', '会员管理', '#', '0', 'fa fa-user', '4', '', 'User');
INSERT INTO `kite_auth_rule` VALUES ('5', '0', 'admin', '功能扩展', '#', '1', 'fa fa-chrome', '3', '', 'Extended');
INSERT INTO `kite_auth_rule` VALUES ('6', '3', 'admin', '模型管理', 'admin/documentModel/index', '1', 'fa fa-cube', '4', '', 'Document model');
INSERT INTO `kite_auth_rule` VALUES ('7', '1', 'admin', '用户管理', 'admin/user/index', '1', 'fa fa-user', '1', '', 'User');
INSERT INTO `kite_auth_rule` VALUES ('8', '1', 'admin', '角色管理', 'admin/role/index', '1', 'fa fa-users', '2', '', 'Role');
INSERT INTO `kite_auth_rule` VALUES ('9', '1', 'admin', '站点管理', 'admin/site/index', '1', 'fa fa-globe', '4', '', 'Sites');
INSERT INTO `kite_auth_rule` VALUES ('10', '0', 'admin', '站点首页', 'admin/index/index', '1', 'fa fa-dashboard ', '1', '', 'Control panel');
INSERT INTO `kite_auth_rule` VALUES ('11', '9', 'admin', '创建站点', 'admin/site/create', '0', 'fa fa-circle-o', '0', '', 'Create site');
INSERT INTO `kite_auth_rule` VALUES ('12', '1', 'admin', '权限配置', 'admin/rule/index', '1', 'fa fa-shield', '3', '', 'Permission');
INSERT INTO `kite_auth_rule` VALUES ('13', '12', 'admin', '增加权限', 'admin/rule/create', '0', 'fa fa-circle-o', '0', '', 'Create');
INSERT INTO `kite_auth_rule` VALUES ('14', '12', 'admin', '权限编辑', 'admin/rule/edit', '0', '', '0', '', 'Edit');
INSERT INTO `kite_auth_rule` VALUES ('15', '8', 'admin', '增加角色', 'admin/role/create', '0', '', '0', '', 'Create');
INSERT INTO `kite_auth_rule` VALUES ('16', '8', 'admin', '角色编辑', 'admin/role/edit', '0', '', '0', '', 'Edit');
INSERT INTO `kite_auth_rule` VALUES ('17', '8', 'admin', '角色授权', 'admin/role/auth', '0', '', '0', '', 'Role authorization');
INSERT INTO `kite_auth_rule` VALUES ('18', '7', 'admin', '创建管理员', 'admin/user/create', '0', '', '0', '', 'Create');
INSERT INTO `kite_auth_rule` VALUES ('19', '7', 'admin', '更新管理员', 'admin/user/edit', '0', '', '0', '', 'Update');
INSERT INTO `kite_auth_rule` VALUES ('20', '7', 'admin', '删除管理员', 'admin/user/remove', '0', '', '0', '', 'Delete');
INSERT INTO `kite_auth_rule` VALUES ('21', '7', 'admin', '管理员批量操作', 'admin/user/handle', '0', '', '0', '', 'Batch operation');
INSERT INTO `kite_auth_rule` VALUES ('22', '9', 'admin', '编辑站点', 'admin/site/edit', '0', '', '0', '', 'Edit');
INSERT INTO `kite_auth_rule` VALUES ('23', '9', 'admin', '删除站点', 'admin/site/remove', '0', '', '0', '', 'Delete');
INSERT INTO `kite_auth_rule` VALUES ('24', '3', 'admin', '文档信息', 'admin/document/index', '1', 'fa fa-file-text-o', '1', '', 'Document');
INSERT INTO `kite_auth_rule` VALUES ('25', '3', 'admin', '栏目分类', 'admin/category/index', '1', 'fa fa-list-ol', '2', '', 'Category');
INSERT INTO `kite_auth_rule` VALUES ('26', '6', 'admin', '创建模型', 'admin/documentModel/create', '0', '', '0', '', 'Create');
INSERT INTO `kite_auth_rule` VALUES ('27', '6', 'admin', '编辑模型', 'admin/documentModel/edit', '0', '', '0', '', 'Edit');
INSERT INTO `kite_auth_rule` VALUES ('28', '6', 'admin', '删除模型', 'admin/documentModel/remove', '0', '', '0', '', 'Remove');
INSERT INTO `kite_auth_rule` VALUES ('29', '3', 'admin', '字段管理', 'admin/documentField/index', '1', 'fa fa-cubes', '3', '', 'Document Field');
INSERT INTO `kite_auth_rule` VALUES ('30', '29', 'admin', '创建字段', 'admin/documentField/create', '0', '', '0', '', 'Create document field');
INSERT INTO `kite_auth_rule` VALUES ('31', '29', 'admin', '编辑字段', 'admin/documentField/edit', '0', '', '0', '', 'Edit');
INSERT INTO `kite_auth_rule` VALUES ('32', '29', 'admin', '删除字段', 'admin/documentField/remove', '0', '', '0', '', 'Remove');
INSERT INTO `kite_auth_rule` VALUES ('33', '29', 'admin', '字段类别', 'admin/documentField/category', '0', '', '0', '', 'Document field category');
INSERT INTO `kite_auth_rule` VALUES ('34', '29', 'admin', '删除字段分类', 'admin/documentField/removeCategory', '0', '', '0', '', 'Remove');
INSERT INTO `kite_auth_rule` VALUES ('35', '29', 'admin', '批量操作字段分类', 'admin/documentField/handleCategory', '0', '', '0', '', 'Handle');
INSERT INTO `kite_auth_rule` VALUES ('36', '24', 'admin', '创建文档', 'admin/document/create', '0', '', '0', '', 'Create');
INSERT INTO `kite_auth_rule` VALUES ('37', '24', 'admin', '更新文档', 'admin/document/edit', '0', '', '0', '', 'Edit');
INSERT INTO `kite_auth_rule` VALUES ('38', '24', 'admin', '删除文档', 'admin/document/remove', '0', '', '0', '', 'Remove');
INSERT INTO `kite_auth_rule` VALUES ('39', '25', 'admin', '创建文档', 'admin/category/create', '0', '', '0', '', 'Create');
INSERT INTO `kite_auth_rule` VALUES ('40', '25', 'admin', '更新文档', 'admin/category/edit', '0', '', '0', '', 'Edit');
INSERT INTO `kite_auth_rule` VALUES ('41', '25', 'admin', '删除文档', 'admin/category/remove', '0', '', '0', '', 'Remove');
INSERT INTO `kite_auth_rule` VALUES ('42', '1', 'admin', '插件管理', 'admin/addons/index', '1', 'fa fa-plus-square', '0', '', 'Addons');
INSERT INTO `kite_auth_rule` VALUES ('43', '42', 'admin', '插件安装', 'admin/addons/install', '0', '', '0', '', 'Addons install');
INSERT INTO `kite_auth_rule` VALUES ('44', '42', 'admin', '插件卸载', 'admin/addons/uninstall', '0', '', '0', '', 'Addons uninstall');
INSERT INTO `kite_auth_rule` VALUES ('45', '42', 'admin', '插件启用', 'admin/addons/enable', '0', '', '0', '', 'Addons enable');
INSERT INTO `kite_auth_rule` VALUES ('46', '42', 'admin', '插件禁用', 'admin/addons/disable', '0', '', '0', '', 'Addons disable');
INSERT INTO `kite_auth_rule` VALUES ('47', '42', 'admin', '插件配置', 'admin/addons/config', '0', '', '0', '', 'Addons config');
INSERT INTO `kite_auth_rule` VALUES ('48', '1', 'admin', '钩子管理', 'admin/hooks/index', '1', 'fa fa-gg-circle', '0', '', 'Hooks');
INSERT INTO `kite_auth_rule` VALUES ('49', '48', 'admin', '钩子添加', 'admin/hooks/create', '0', '', '0', '', 'Create');
INSERT INTO `kite_auth_rule` VALUES ('50', '48', 'admin', '钩子编辑', 'admin/hooks/edit', '0', '', '0', '', 'Edit');
INSERT INTO `kite_auth_rule` VALUES ('51', '5', 'admin', '订单', 'admin/order/index', '1', 'fa fa-shopping-cart', '10', '', 'Order');
INSERT INTO `kite_auth_rule` VALUES ('52', '86', 'admin', '编辑评论', 'admin/comments/edit', '0', '', '0', '', 'Edit');
INSERT INTO `kite_auth_rule` VALUES ('53', '51', 'admin', '订单详情', 'admin/order/edit', '0', 'fa fa-circle-o', '0', '', 'Detail');
INSERT INTO `kite_auth_rule` VALUES ('54', '51', 'admin', '删除', 'admin/order/remove', '0', 'fa fa-circle-o', '0', '', 'Remove');
INSERT INTO `kite_auth_rule` VALUES ('56', '5', 'admin', '友情链接', 'admin/link/index', '1', 'fa fa-link', '3', '', 'Link');
INSERT INTO `kite_auth_rule` VALUES ('57', '56', 'admin', '创建友情链接', 'admin/link/create', '0', '', '0', '', 'Create');
INSERT INTO `kite_auth_rule` VALUES ('58', '56', 'admin', '编辑友情链接', 'admin/link/edit', '0', '', '0', '', 'Edit');
INSERT INTO `kite_auth_rule` VALUES ('59', '56', 'admin', '删除友情链接', 'admin/link/remove', '0', '', '0', '', 'Remove');
INSERT INTO `kite_auth_rule` VALUES ('60', '56', 'admin', '友情链接类别', 'admin/link/category', '0', '', '0', '', 'Link category');
INSERT INTO `kite_auth_rule` VALUES ('61', '56', 'admin', '删除友情链接分类', 'admin/link/removeCategory', '0', '', '0', '', 'Remove');
INSERT INTO `kite_auth_rule` VALUES ('62', '56', 'admin', '批量操作友情链接分类', 'admin/link/handleCategory', '0', '', '0', '', 'Handle');
INSERT INTO `kite_auth_rule` VALUES ('63', '1', 'admin', '模板管理', 'admin/template/filelist', '1', 'fa fa-file-code-o', '8', '', 'Template file');
INSERT INTO `kite_auth_rule` VALUES ('64', '63', 'admin', '模板修改', 'admin/template/fileedit', '0', '', '0', '', 'Template file edit');
INSERT INTO `kite_auth_rule` VALUES ('65', '5', 'admin', '幻灯片', 'admin/slider/index', '1', 'fa fa-file-image-o', '2', '', 'Slider');
INSERT INTO `kite_auth_rule` VALUES ('66', '65', 'admin', '创建幻灯片', 'admin/slider/create', '0', '', '0', '', 'Create');
INSERT INTO `kite_auth_rule` VALUES ('67', '65', 'admin', '编辑幻灯片', 'admin/slider/edit', '0', '', '0', '', 'Edit');
INSERT INTO `kite_auth_rule` VALUES ('68', '65', 'admin', '删除幻灯片', 'admin/slider/remove', '0', '', '0', '', 'Remove');
INSERT INTO `kite_auth_rule` VALUES ('69', '65', 'admin', '类别', 'admin/slider/category', '0', '', '0', '', 'Slider category');
INSERT INTO `kite_auth_rule` VALUES ('70', '65', 'admin', '删除幻灯片分类', 'admin/slider/removeCategory', '0', '', '0', '', 'Remove');
INSERT INTO `kite_auth_rule` VALUES ('71', '65', 'admin', '批量操作幻灯片分类', 'admin/slider/handleCategory', '0', '', '0', '', 'Handle');
INSERT INTO `kite_auth_rule` VALUES ('72', '1', 'admin', '参数配置', 'admin/site/config', '1', 'fa fa-wrench', '5', '', 'Site config');
INSERT INTO `kite_auth_rule` VALUES ('75', '5', 'admin', '内容区块', 'admin/block/index', '1', 'fa fa-code', '4', '', 'Block');
INSERT INTO `kite_auth_rule` VALUES ('76', '75', 'admin', '创建区块', 'admin/block/create', '0', '', '0', '', 'Create');
INSERT INTO `kite_auth_rule` VALUES ('77', '75', 'admin', '编辑区块', 'admin/block/edit', '0', '', '0', '', 'Edit');
INSERT INTO `kite_auth_rule` VALUES ('78', '75', 'admin', '删除区块', 'admin/block/remove', '0', '', '0', '', 'Remove');
INSERT INTO `kite_auth_rule` VALUES ('79', '75', 'admin', '区块类别', 'admin/block/category', '0', '', '0', '', 'Block category');
INSERT INTO `kite_auth_rule` VALUES ('80', '75', 'admin', '删除区块分类', 'admin/block/removeCategory', '0', '', '0', '', 'Remove');
INSERT INTO `kite_auth_rule` VALUES ('81', '75', 'admin', '批量操作区块分类', 'admin/block/handleCategory', '0', '', '0', '', 'Handle');
INSERT INTO `kite_auth_rule` VALUES ('82', '48', 'admin', '钩子删除', 'admin/hooks/delete', '0', 'fa fa-circle-o', '0', '', 'Delete');
INSERT INTO `kite_auth_rule` VALUES ('86', '5', 'admin', '评论管理', 'admin/comments/index', '1', 'fa fa-comments', '1', '', 'Comments');
INSERT INTO `kite_auth_rule` VALUES ('87', '86', 'admin', '删除评论', 'admin/comments/remove', '0', '', '0', '', 'Remove');
INSERT INTO `kite_auth_rule` VALUES ('88', '86', 'admin', '批量操作评论', 'admin/comments/handle', '0', '', '0', '', 'Handle comments');
INSERT INTO `kite_auth_rule` VALUES ('89', '1', 'admin', '系统日志', 'admin/log/index', '1', 'fa fa-history', '6', '', 'Log');
INSERT INTO `kite_auth_rule` VALUES ('90', '1', 'admin', '编辑菜单', 'admin/navigation/index', '1', 'fa fa-navicon', '7', '', 'Navigation');
INSERT INTO `kite_auth_rule` VALUES ('91', '90', 'admin', '菜单管理', 'admin/navigation/category', '0', '', '0', '', 'Navigation category');
INSERT INTO `kite_auth_rule` VALUES ('92', '90', 'admin', '删除菜单', 'admin/navigation/removeCategory', '0', '', '0', '', 'Remove');
INSERT INTO `kite_auth_rule` VALUES ('93', '90', 'admin', '批量操作菜单', 'admin/navigation/handleCategory', '0', '', '0', '', 'Handle');
INSERT INTO `kite_auth_rule` VALUES ('55', '5', 'admin', '留言反馈', 'admin/feedback/index', '1', 'fa fa-commenting-o', '0', '', 'Feedback');
INSERT INTO `kite_auth_rule` VALUES ('73', '55', 'admin', '回复', 'admin/feedback/edit', '0', 'fa fa-circle-o', '0', '', 'Reply');
INSERT INTO `kite_auth_rule` VALUES ('74', '55', 'admin', '删除', 'admin/feedback/remove', '0', 'fa fa-circle-o', '0', '', 'Remove');
INSERT INTO `kite_auth_rule` VALUES ('83', '55', 'admin', '批量操作', 'admin/feedback/handle', '0', 'fa fa-circle-o', '0', '', 'Handle');
INSERT INTO `kite_auth_rule` VALUES ('85', '5', 'admin', 'Tags', 'admin/tags/index', '1', 'fa fa-tags', '0', '', 'Tags');
INSERT INTO `kite_auth_rule` VALUES ('94', '85', 'admin', '删除', 'admin/tags/remove', '0', 'fa fa-circle-o', '0', '', 'Remove');
INSERT INTO `kite_auth_rule` VALUES ('95', '85', 'admin', '编辑', 'admin/tags/edit', '0', 'fa fa-circle-o', '0', '', 'Edit');
INSERT INTO `kite_auth_rule` VALUES ('96', '85', 'admin', '操作', 'admin/tags/handle', '0', 'fa fa-circle-o', '0', '', 'Handle');
INSERT INTO `kite_auth_rule` VALUES ('97', '0', 'member', '会员中心', 'member/index/index', '1', 'fa fa-laptop', '1', '', 'Member center');
INSERT INTO `kite_auth_rule` VALUES ('98', '108', 'member', '发布信息', 'member/document/create', '1', 'fa fa-edit', '2', '', 'Create');
INSERT INTO `kite_auth_rule` VALUES ('99', '108', 'member', '修改信息', 'member/document/edit', '0', 'fa fa-circle-o', '3', '', 'Edit');
INSERT INTO `kite_auth_rule` VALUES ('100', '108', 'member', '删除信息', 'member/document/remove', '0', 'fa fa-circle-o', '4', '', 'Remove');
INSERT INTO `kite_auth_rule` VALUES ('101', '97', 'member', '账户设置', '#', '1', 'fa fa-user', '5', '', 'Account setting');
INSERT INTO `kite_auth_rule` VALUES ('102', '101', 'member', '个人资料', 'member/member/profile', '1', 'fa fa-circle-o text-red', '6', '', 'Member profile');
INSERT INTO `kite_auth_rule` VALUES ('103', '101', 'member', '账户绑定', 'member/member/bind', '1', 'fa fa-circle-o text-yellow', '7', '', 'Member bind');
INSERT INTO `kite_auth_rule` VALUES ('104', '101', 'member', '手机绑定', 'member/member/mobileBind', '0', 'fa fa-circle-o', '8', '', 'Mobile bind');
INSERT INTO `kite_auth_rule` VALUES ('105', '101', 'member', '邮箱绑定', 'member/member/emailBind', '0', 'fa fa-circle-o', '9', '', 'Email bind');
INSERT INTO `kite_auth_rule` VALUES ('106', '101', 'member', '密码修改', 'member/member/password', '1', 'fa fa-circle-o text-aqua', '10', '', 'Password update');
INSERT INTO `kite_auth_rule` VALUES ('107', '108', 'member', '信息列表', 'member/document/index', '1', 'fa fa-book', '0', '', 'Document');
INSERT INTO `kite_auth_rule` VALUES ('108', '97', 'member', '信息管理', '#', '1', 'fa fa-laptop', '1', '', 'My document');
INSERT INTO `kite_auth_rule` VALUES ('109', '101', 'member', '手机解绑', 'member/member/mobileUnbind', '0', 'fa fa-circle-o', '0', '', 'Mobile unbind');
INSERT INTO `kite_auth_rule` VALUES ('110', '101', 'member', '邮箱解绑', 'member/member/emailUnbind', '0', 'fa fa-circle-o', '0', '', 'Email unbind');
INSERT INTO `kite_auth_rule` VALUES ('111', '101', 'member', '头像设置', 'member/member/avatar', '0', 'fa fa-circle-o', '0', '', 'Member avatar');
INSERT INTO `kite_auth_rule` VALUES ('112', '101', 'member', '创建订单', 'member/order/create', '0', 'fa fa-circle-o', '0', '', 'Create order');
INSERT INTO `kite_auth_rule` VALUES ('113', '101', 'member', '我的订单', 'member/order/my', '1', 'fa fa-circle-o', '0', '', 'My order');
INSERT INTO `kite_auth_rule` VALUES ('114', '101', 'member', '订单详情', 'member/order/detail', '0', 'fa fa-circle-o', '0', '', 'Detail');

-- ----------------------------
-- Table structure for kite_auth_user
-- ----------------------------
DROP TABLE IF EXISTS `kite_auth_user`;
CREATE TABLE `kite_auth_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'UID',
  `role_ids` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户所属角色组',
  `username` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '管理员密码',
  `phone` char(11) COLLATE utf8_bin DEFAULT '' COMMENT '手机号',
  `email` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '电子邮箱',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态 0 正常 1禁用',
  `score` int(11) DEFAULT NULL COMMENT '积分',
  `avatar` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '头像',
  `create_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `user_id` (`uid`) USING BTREE,
  UNIQUE KEY `user_name` (`username`) USING BTREE,
  KEY `created` (`create_at`) USING BTREE,
  KEY `phone` (`phone`) USING BTREE,
  KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_auth_user
-- ----------------------------
INSERT INTO `kite_auth_user` VALUES ('1', '1,2,3', 'admin', '$2y$10$dwyRopGNopJ1dsGWN/RBHOpOkxaTf4AbTOKzv9CFO1SxEvfzixOae', '18780221108', 'kite@kitesky.com', '0', '584', '/upload/20190627/aba796d04ef17b1862880b988a5b47d8.png', '1561568316', '1562598374');
INSERT INTO `kite_auth_user` VALUES ('2', '3', 'kite', '$2y$10$99iZt/YBVSWHu.2wixnar.yjf8Ly1t9v337gVcaAv/1u6uBbdMTbS', '', 'kite@kitesky.com', '0', '50', '', '1562595397', '1562600544');

-- ----------------------------
-- Table structure for kite_block
-- ----------------------------
DROP TABLE IF EXISTS `kite_block`;
CREATE TABLE `kite_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cid` int(11) DEFAULT 0 COMMENT '友情链接分类ID',
  `site_id` char(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '网站编号',
  `name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '网站名称',
  `variable` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '区块变量标识',
  `content` text COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态： 0隐藏  1 显示',
  `create_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_block
-- ----------------------------

-- ----------------------------
-- Table structure for kite_document_category
-- ----------------------------
DROP TABLE IF EXISTS `kite_document_category`;
CREATE TABLE `kite_document_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上级父ID',
  `site_id` int(11) NOT NULL COMMENT '模型归属站点',
  `model_id` int(11) NOT NULL COMMENT '模型ID',
  `sort` int(11) DEFAULT 0 COMMENT '权重排序',
  `title` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '文档标题',
  `keywords` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '文档关键词',
  `description` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '描述',
  `content` text COLLATE utf8_bin DEFAULT NULL COMMENT '文档内容',
  `list_rows` int(11) NOT NULL DEFAULT 10 COMMENT '列表显示条数',
  `list_tpl` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '栏目模板',
  `detail_tpl` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '内容模板',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 隐藏 1 显示',
  `create_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_document_category
-- ----------------------------
INSERT INTO `kite_document_category` VALUES ('1', '9', '1', '1', '0', 'PHP编程', '', '', '', '10', 'category/article-list-sidebar', 'document/article-detail-sidebar', '1', null, '1561002621');
INSERT INTO `kite_document_category` VALUES ('2', '9', '1', '1', '0', '前端技术', '', '', '', '10', 'category/article-list-sidebar', 'document/article-detail-sidebar', '1', '1541328648', '1561029529');
INSERT INTO `kite_document_category` VALUES ('3', '9', '1', '1', '0', 'SEO搜索优化', '', '', 0x3C703EE585B3E4BA8EE68891E4BBAC3C2F703E, '10', 'category/article-list-sidebar', 'document/article-detail-sidebar', '1', '1552019863', '1561002638');
INSERT INTO `kite_document_category` VALUES ('4', '9', '1', '1', '0', '视频课程', '', '', '', '10', 'category/article-list-sidebar', 'document/article-detail-sidebar', '1', '1552019887', '1561002728');
INSERT INTO `kite_document_category` VALUES ('5', '0', '1', '1', '0', '服务项目', '', '', '', '10', '', '', '1', '1552019904', '1561888222');
INSERT INTO `kite_document_category` VALUES ('6', '0', '1', '1', '0', '手册', '', '', '', '10', 'category/list', '', '1', '1552271505', '1561973137');
INSERT INTO `kite_document_category` VALUES ('7', '0', '1', '1', '0', '下载', 'cms', '下载', '', '10', 'category/down', '', '1', '1561001820', '1561003786');
INSERT INTO `kite_document_category` VALUES ('8', '0', '1', '5', '0', '模板主题', '', '', '', '10', 'category/grid', '', '1', '1561001864', '1561946897');
INSERT INTO `kite_document_category` VALUES ('9', '0', '1', '1', '0', '教程', '', '', '', '10', '', '', '1', '1561001879', '1561001905');
INSERT INTO `kite_document_category` VALUES ('10', '9', '1', '1', '0', '使用帮助', '', '', '', '10', 'category/article-list-sidebar', 'document/article-detail-sidebar', '1', '1561001886', '1561027591');
INSERT INTO `kite_document_category` VALUES ('11', '9', '1', '1', '0', '模板制作', '', '', '', '10', 'category/article-list-sidebar', 'document/article-detail-sidebar', '1', '1561002000', '1561027600');
INSERT INTO `kite_document_category` VALUES ('12', '9', '1', '1', '0', '二次开发', '', '', '', '10', 'category/article-list-sidebar', 'document/article-detail-sidebar', '1', '1561002022', '1561027606');
INSERT INTO `kite_document_category` VALUES ('13', '9', '1', '1', '0', '数据字典', '', '', '', '10', 'category/article-list-sidebar', 'document/article-detail-sidebar', '1', '1561002056', '1561027614');
INSERT INTO `kite_document_category` VALUES ('14', '0', '1', '1', '0', '联系我们', '', '', '', '10', 'category/contact', '', '1', '1561003161', '1561003161');
INSERT INTO `kite_document_category` VALUES ('15', '0', '1', '2', '0', '新闻', '', '', '', '10', 'category/index', 'document/index', '1', '1561563507', '1562067028');
INSERT INTO `kite_document_category` VALUES ('16', '0', '1', '5', '0', '产品', '', '', '', '10', 'category/shop', 'document/shop-detail', '1', '1561563518', '1562500544');
INSERT INTO `kite_document_category` VALUES ('17', '0', '1', '3', '0', '招聘', '', '', '', '10', 'category/index', 'document/index', '1', '1561563531', '1562066582');
INSERT INTO `kite_document_category` VALUES ('18', '0', '1', '2', '0', '公司介绍', '', '', 0x3C703EE8BF99E9878CE698AFE585ACE58FB8E58685E5AEB9EFBC8CE9809AE8BF87E5908EE58FB0E7AEA1E79086E380823C2F703E, '10', 'category/about_us', '', '1', '1562055550', '1562059767');
INSERT INTO `kite_document_category` VALUES ('19', '0', '2', '0', '0', '关于我们', '', '', '', '0', 'category/about_us', '', '1', '1562135953', '1562135953');

-- ----------------------------
-- Table structure for kite_document_comments
-- ----------------------------
DROP TABLE IF EXISTS `kite_document_comments`;
CREATE TABLE `kite_document_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `site_id` int(11) NOT NULL COMMENT '网站ID',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '评论上级ID',
  `uid` int(11) NOT NULL COMMENT '评论人mid ',
  `document_id` int(11) NOT NULL COMMENT '评论文档ID',
  `content` text COLLATE utf8_bin NOT NULL COMMENT '评论内容',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 隐藏 1 显示',
  `create_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_document_comments
-- ----------------------------
INSERT INTO `kite_document_comments` VALUES ('1', '1', '0', '2', '2', 0x3131, '1', '1560851402', '1562211181');

-- ----------------------------
-- Table structure for kite_document_comments_like
-- ----------------------------
DROP TABLE IF EXISTS `kite_document_comments_like`;
CREATE TABLE `kite_document_comments_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments_id` int(11) NOT NULL COMMENT '文档ID',
  `like` tinyint(1) NOT NULL DEFAULT 0 COMMENT '[顶]',
  `unlike` tinyint(1) NOT NULL DEFAULT 0 COMMENT '[踩]',
  `ip` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '客户端IP',
  `create_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_document_comments_like
-- ----------------------------
INSERT INTO `kite_document_comments_like` VALUES ('1', '1', '0', '1', '127.0.0.1', '1560939442', '1560939442');

-- ----------------------------
-- Table structure for kite_document_content
-- ----------------------------
DROP TABLE IF EXISTS `kite_document_content`;
CREATE TABLE `kite_document_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT 0 COMMENT '文档分类ID',
  `site_id` int(11) NOT NULL COMMENT '内容归属站点',
  `uid` int(11) DEFAULT NULL COMMENT '后台管理员发布者 UID',
  `title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '文档标题',
  `keywords` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '文档关键词',
  `description` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '描述',
  `content` longtext COLLATE utf8_bin DEFAULT NULL COMMENT '文档内容',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '文档封面',
  `attach` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '文件',
  `album` text COLLATE utf8_bin DEFAULT NULL COMMENT '图片集合',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 待审 1通过',
  `image_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '图片类型标识',
  `video_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '视频类型标识',
  `attach_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '附件类型标识',
  `hot_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '热门标识',
  `recommend_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '推荐标识',
  `focus_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '焦点标识',
  `top_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '置顶标识',
  `pv` int(11) NOT NULL DEFAULT 0 COMMENT '访问次数',
  `price` decimal(8,2) DEFAULT 0.00 COMMENT '售价',
  `role_id` int(11) NOT NULL DEFAULT 0 COMMENT '阅读权限限 0:游客组',
  `create_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `title` (`title`) USING BTREE,
  KEY `site_id` (`site_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_document_content
-- ----------------------------
INSERT INTO `kite_document_content` VALUES ('4', '12', '1', '1', 'HP Support Assistant v8.7.50.3 для Windows Бесплатно', '', '', 0x3C70207374796C653D22626F782D73697A696E673A20696E68657269743B206D617267696E2D746F703A203070783B206D617267696E2D626F74746F6D3A203172656D3B206C696E652D6865696768743A20323570783B20636F6C6F723A20726762283130332C203132382C20313539293B20666F6E742D66616D696C793A20526F626F746F2C2073616E732D73657269663B20666F6E742D73697A653A20313570783B2077686974652D73706163653A206E6F726D616C3B206261636B67726F756E642D636F6C6F723A20726762283235352C203235352C20323535293B223E3C7370616E207374796C653D22626F782D73697A696E673A20696E68657269743B20666F6E742D7765696768743A20626F6C6465723B223E485020537570706F727420417373697374616E74266E6273703B3C2F7370616E3EE2809320D0BED184D0B8D186D0B8D0B0D0BBD18CD0BDD18BD0B920D0BFD0B0D0BAD0B5D18220D0BFD180D0BED0B3D180D0B0D0BCD0BCD0BDD0BED0B3D0BE20D0BED0B1D0B5D181D0BFD0B5D187D0B5D0BDD0B8D18F20D0B4D0BBD18F20D180D0B0D0B1D0BED182D18B20D18120D0BED0B1D0BED180D183D0B4D0BED0B2D0B0D0BDD0B8D0B5D0BC20D0BED18220D0BAD0BED0BCD0BFD0B0D0BDD0B8D0B8204865776C657474205061636B6172642C20D0B220D187D0B8D181D0BBD0BE20D0BAD0BED182D0BED180D0BED0B3D0BE20D0B2D185D0BED0B4D0B8D18220D0BFD180D0B8D0BDD182D0B5D180D18B2C20D181D0BAD0B0D0BDD0B5D180D18B2C20D0BDD0BED183D182D0B1D183D0BAD0B82C20D0BFD0B5D180D181D0BED0BDD0B0D0BBD18CD0BDD18BD0B520D0BAD0BED0BCD0BFD18CD18ED182D0B5D180D18B20D0B820D0BCD0BDD0BED0B3D0BED0B520D0B4D180D183D0B3D0BED0B52E3C2F703E3C70207374796C653D22626F782D73697A696E673A20696E68657269743B206D617267696E2D746F703A203070783B206D617267696E2D626F74746F6D3A203172656D3B206C696E652D6865696768743A20323570783B20636F6C6F723A20726762283130332C203132382C20313539293B20666F6E742D66616D696C793A20526F626F746F2C2073616E732D73657269663B20666F6E742D73697A653A20313570783B2077686974652D73706163653A206E6F726D616C3B206261636B67726F756E642D636F6C6F723A20726762283235352C203235352C20323535293B223ED09FD180D0BED0B3D180D0B0D0BCD0BCD0B020D0B0D181D181D0B8D181D182D0B5D0BDD18220D0BFD0BE20D183D0BCD0BED0BBD187D0B0D0BDD0B8D18E20D0BFD180D0B5D0B4D183D181D182D0B0D0BDD0BED0B2D0BBD0B5D0BDD0B020D0BDD0B020D0B2D181D0B5D18520D0BDD0BED183D182D0B1D183D0BAD0B0D18520D0B820D0BAD0BED0BCD0BFD18CD18ED182D0B5D180D0B0D18520D0BED1822048502C20D0BDD0BE20D182D0B0D0BAD0B6D0B520D0BCD0BED0B6D0BDD0BE20D183D181D182D0B0D0BDD0BED0B2D0B8D182D18C20D0B820D0BDD0B020D0BBD18ED0B1D18BD0B520D0B4D180D183D0B3D0B8D0B520D0BAD0BED0BCD0BFD18CD18ED182D0B5D180D18B2C20D0B5D181D0BBD0B820D18DD182D0BE20D0BDD0B5D0BED0B1D185D0BED0B4D0B8D0BCD0BE2E3C2F703E3C70207374796C653D22626F782D73697A696E673A20696E68657269743B206D617267696E2D746F703A203070783B206D617267696E2D626F74746F6D3A203172656D3B206C696E652D6865696768743A20323570783B20636F6C6F723A20726762283130332C203132382C20313539293B20666F6E742D66616D696C793A20526F626F746F2C2073616E732D73657269663B20666F6E742D73697A653A20313570783B2077686974652D73706163653A206E6F726D616C3B206261636B67726F756E642D636F6C6F723A20726762283235352C203235352C20323535293B223ED09ED181D0BDD0BED0B2D0BDD0B0D18F20D0B7D0B0D0B4D0B0D187D0B020D0B0D181D181D0B8D181D182D0B5D0BDD182D0B020D183D0BFD180D0BED181D182D0B8D182D18C20D0B2D0B7D0B0D0B8D0BCD0BED0B4D0B5D0B9D181D182D0B2D0B8D0B520D0BCD0B5D0B6D0B4D18320D0BFD0BED0BBD18CD0B7D0BED0B2D0B0D182D0B5D0BBD0B5D0BC2C20D0BED0B1D0BED180D183D0B4D0BED0B2D0B0D0BDD0B8D0B5D0BC20D0B820D0BFD180D0BED0B3D180D0B0D0BCD0BCD0BDD18BD0BC20D0BED0B1D0B5D181D0BFD0B5D187D0B5D0BDD0B8D0B5D0BC2C20D0B7D0B020D181D187D0B5D18220D182D0BED0B3D0BE2C20D187D182D0BE20D0BFD180D0BED0B3D180D0B0D0BCD0BCD0B020D0B1D0B5D180D0B5D18220D0BDD0B020D181D0B5D0B1D18F20D0B2D181D0B520D0BED181D0BDD0BED0B2D0BDD18BD0B520D0B7D0B0D0B4D0B0D187D0B820D0BFD0BE20D0BED0BFD182D0B8D0BCD0B8D0B7D0B0D186D0B8D0B82C20D0BED0B1D0BDD0BED0B2D0BBD0B5D0BDD0B8D18E20D0BFD180D0BED0B3D180D0B0D0BCD0BCD0BDD0BED0B3D0BE20D0BED0B1D0B5D181D0BFD0B5D187D0B5D0BDD0B8D18F2C20D0B820D0BDD0B0D181D182D180D0BED0B9D0BAD0B820D0BAD0BED0BDD184D0B8D0B3D183D180D0B0D186D0B8D0B82C20D187D182D0BE20D0B220D181D0B2D0BED18E20D0BED187D0B5D180D0B5D0B4D18C20D0BFD180D0B8D0B2D0BED0B4D0B8D18220D0BA20D182D0BED0BCD18320D187D182D0BE20D0BFD180D18FD0BCD0BED0B520D183D187D0B0D181D182D0B8D0B520D0BFD0BED0BBD18CD0B7D0BED0B2D0B0D182D0B5D0BBD18F20D181D0B2D0BED0B4D0B8D182D181D18F20D0BA20D0BCD0B8D0BDD0B8D0BCD183D0BCD1832E3C2F703E3C70207374796C653D22626F782D73697A696E673A20696E68657269743B206D617267696E2D746F703A203070783B206D617267696E2D626F74746F6D3A203172656D3B206C696E652D6865696768743A20323570783B20636F6C6F723A20726762283130332C203132382C20313539293B20666F6E742D66616D696C793A20526F626F746F2C2073616E732D73657269663B20666F6E742D73697A653A20313570783B2077686974652D73706163653A206E6F726D616C3B206261636B67726F756E642D636F6C6F723A20726762283235352C203235352C20323535293B223ED09AD180D0BED0BCD0B520D182D0BED0B3D0BE2C20D181D182D0BED0B8D18220D0BED182D0BCD0B5D182D0B8D182D18C20D187D182D0BE20D0B220D181D0BED181D182D0B0D0B220485020537570706F727420417373697374616E7420D0B2D185D0BED0B4D0B8D18220D0BED0B1D188D0B8D180D0BDD0B0D18F20D0B4D0BED0BAD183D0BCD0B5D0BDD182D0B0D186D0B8D18F20D0B820D181D0BFD180D0B0D0B2D0BAD0B020D0BFD0BE20D0B2D181D0B5D0BC20D0B2D0B8D0B4D0B0D0BC20D0B2D18BD0BFD183D181D0BAD0B0D0B5D0BCD0BED0B920D0BFD180D0BED0B4D183D0BAD186D0B8D0B820D0BED1822048502C20D0B820D0B220D181D0BBD183D187D0B0D0B520D0BFD180D0BED0B1D0BBD0B5D0BC2C20D0BDD0B0D0BFD180D0B8D0BCD0B5D1802C20D18120D0BFD180D0B8D0BDD182D0B5D180D0BED0BC2C20D0BFD0BED0BBD18CD0B7D0BED0B2D0B0D182D0B5D0BBD18C20D0BBD0B5D0B3D0BAD0BE20D0BDD0B0D0B9D0B4D0B5D18220D0B2D181D18E20D0BDD0B5D0BED0B1D185D0BED0B4D0B8D0BCD183D18E20D0B8D0BDD184D0BED180D0BCD0B0D186D0B8D18E2C20D0BDD0B520D0BFD180D0B8D0B1D0B5D0B3D0B0D18F20D0BA20D0BFD0BED0B8D181D0BAD18320D0B220D0B8D0BDD182D0B5D180D0BDD0B5D182D0B52E3C2F703E3C70207374796C653D22626F782D73697A696E673A20696E68657269743B206D617267696E2D746F703A203070783B206D617267696E2D626F74746F6D3A203172656D3B206C696E652D6865696768743A20323570783B20636F6C6F723A20726762283130332C203132382C20313539293B20666F6E742D66616D696C793A20526F626F746F2C2073616E732D73657269663B20666F6E742D73697A653A20313570783B2077686974652D73706163653A206E6F726D616C3B206261636B67726F756E642D636F6C6F723A20726762283235352C203235352C20323535293B223ED095D189D0B520D0BED0B4D0BDD0BED0B920D0BFD0BED0BBD0B5D0B7D0BDD0BED0B920D0BDD0B020D0BCD0BED0B920D0B2D0B7D0B3D0BBD18FD0B420D0BED0BFD186D0B8D0B5D0B920D18FD0B2D0BBD18FD0B5D182D181D18F20D0B0D0B2D182D0BED0BCD0B0D182D0B8D187D0B5D181D0BAD0BED0B520D0BED0B1D0BDD0BED0B2D0BBD0B5D0BDD0B8D0B520D0B4D180D0B0D0B9D0B2D0B5D180D0BED0B22C20D0BED0BFD18FD182D18C20D0B6D0B520D0BFD180D0B8D0B2D0BED0B4D0B8D18220D0BA20D182D0BED0BCD18320D187D182D0BE20D0BFD0BED0BBD18CD0B7D0BED0B2D0B0D182D0B5D0BBD18E20D0BDD0B520D0BFD180D0B8D0B4D191D182D181D18F20D0B8D181D0BFD0BED0BBD18CD0B7D0BED0B2D0B0D182D18C2043442F44564420D0BFD180D0B8D0B2D0BED0B420D0B4D0BBD18F20D0B7D0B0D0BFD183D181D0BAD0B020D0B4D0B8D181D0BAD0B020D0B820D0B8D0BDD181D182D0B0D0BBD0BBD18FD186D0B8D0B820D0B4D180D0B0D0B9D0B2D0B5D180D0BED0B220D0B220D180D183D187D0BDD0BED0BC20D180D0B5D0B6D0B8D0BCD0B52C20D0B8D0BBD0B820D0BA20D0BFD0BED0B8D181D0BAD18320D187D0B5D180D0B5D0B720D0B8D0BDD182D0B5D180D0BDD0B5D1822C20D0B2D181D0B520D0BED0B1D0BED180D183D0B4D0BED0B2D0B0D0BDD0B8D0B520D0B1D183D0B4D0B5D18220D0BED0BFD180D0B5D0B4D0B5D0BBD0B5D0BDD0BE20D0B0D0B2D182D0BED0BCD0B0D182D0B8D187D0B5D181D0BAD0B820D0B820D0BFD180D0BED0B8D0BDD181D182D0B0D0BBD0BBD0B8D180D0BED0B2D0B0D0BDD18B20D0BFD0BED181D0BBD0B5D0B4D0BDD0B8D0B520D0B2D0B5D180D181D0B8D0B820D0B4D180D0B0D0B9D0B2D0B5D180D0BED0B22E3C2F703E3C70207374796C653D22626F782D73697A696E673A20696E68657269743B206D617267696E2D746F703A203070783B206D617267696E2D626F74746F6D3A203172656D3B206C696E652D6865696768743A20323570783B20636F6C6F723A20726762283130332C203132382C20313539293B20666F6E742D66616D696C793A20526F626F746F2C2073616E732D73657269663B20666F6E742D73697A653A20313570783B2077686974652D73706163653A206E6F726D616C3B206261636B67726F756E642D636F6C6F723A20726762283235352C203235352C20323535293B223ED09DD0BE20D0B820D18DD182D0BE20D0B5D189D0B520D0BDD0B520D0B2D181D0B52C20D090D181D181D0B8D181D182D0B5D0BDD18220D0BFD180D0B5D0B4D0BBD0B0D0B3D0B0D0B5D18220D0BDD0B0D0BC20D0B2D181D182D180D0BED0B5D0BDD0BDD18BD0B520D0B0D0B2D182D0BED0BCD0B0D182D0B8D0B7D0B8D180D0BED0B2D0B0D0BDD0BDD18BD0B520D181D180D0B5D0B4D181D182D0B2D0B020D0B4D0BBD18F20D180D0B5D188D0B5D0BDD0B8D18F20D0BFD180D0BED0B1D0BBD0B5D0BC20D0B2D0BED0B7D0BDD0B8D0BAD0BDD183D0B2D188D0B8D18520D0BDD0B5D0BFD0BED0BBD0B0D0B4D0BED0BA20D18120D0BED0B1D0BED180D183D0B4D0BED0B2D0B0D0BDD0B8D0B5D0BC2048502C20D0BFD0BED0B7D0B2D0BED0BBD18FD0B5D18220D180D0B5D188D0B8D182D18C20D181D0B0D0BCD18BD0B520D180D0B0D181D0BFD180D0BED181D182D180D0B0D0BDD191D0BDD0BDD18BD0B520D0BDD0B5D0BFD0BED0BBD0B0D0B4D0BAD0B82C20D0B020D0B5D181D0BBD0B820D0BDD0B520D0BFD0BED0BBD183D187D0B0D0B5D182D181D18F20D183D181D182D180D0B0D0BDD0B8D182D18C20D0BFD180D0BED0B1D0BBD0B5D0BCD1832C20D0BED182D0BFD180D0B0D0B2D0BBD18FD0B5D18220D0BDD0B0D18120D0BDD0B020D0BED184D0B8D186D0B8D0B0D0BBD18CD0BDD18BD0B520D181D0B0D0B9D1822C20D0B3D0B4D0B520D0BDD0B0D0BC20D0BFD0BED0BCD0BED0B3D183D18220D183D0B6D0B520D181D0BFD0B5D186D0B8D0B0D0BBD0B8D181D18220D0BAD0BED0BCD0BFD0B0D0BDD0B8D0B82E3C2F703E3C703E3C62722F3E3C2F703E, '/upload/20190616/744f5ca2fa8aad72596801fc5d4ccc32.png', '', '', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0.00', '0', '1560620717', '1560853788');
INSERT INTO `kite_document_content` VALUES ('5', '16', '1', '1', 'test123123123', '', '', 0x3C703EE998BFE890A8E5BEB7E6B395E5B888E68993E58F913C2F703E, null, '/upload/20190703/a550bead63f8a8738bf743d07a954718.rar', '', '1', '0', '0', '0', '0', '0', '0', '0', '160', '0.00', '0', '1560746522', '1562603453');
INSERT INTO `kite_document_content` VALUES ('7', '8', '1', '1', '图文资讯模板', '', '图文资讯模板', 0x3C703EE6A8A1E69DBF3C2F703E, '/upload/20190620/c0b302b007e8aef9e27036f4cbe7aeb3.jpg', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '152', '0.00', '0', '1561008838', '1562589665');
INSERT INTO `kite_document_content` VALUES ('8', '11', '1', '1', '标签使用', '', '这是要给描述信息', 0x3C703E3131313C2F703E, null, '', '', '1', '0', '0', '0', '0', '0', '0', '0', '160', '0.10', '0', '1561011185', '1562495626');
INSERT INTO `kite_document_content` VALUES ('9', '17', '1', '1', '高级PHP工程师', '', '', 0x3C703EE8818CE4BD8DE68F8FE8BFB0EFBC9A3C2F703E3C703E3C62722F3E3C2F703E3C703EEFBC91EFBC8EE38080E99DA2E59091E5AFB9E8B1A1E79A84E5BC80E58F91EFBC8CE7869FE68289E887B3E5B091E4B880E4B8AAE4B8BBE6B581E5BC80E58F91E6A186E69EB6EFBC8CE69C89EFBD90EFBD88EFBD90E58F8AE585B6E79BB8E585B3E6A186E69EB6EFBC88E5A682EFBCACEFBD81EFBD92EFBD81EFBD96EFBD85EFBD8CEFBC89E5BC80E58F91E7BB8FE9AA8CE88085E4BC98E58588EFBC9B3C2F703E3C703EEFBC92EFBC8EE38080E5AFB9EFBCA7EFBD8FEFBD8CEFBD81EFBD8EEFBD87E69C89E585B4E8B6A3E68896E69C89E7BB8FE9AA8CE88085E4BC98E585883C2F703E3C703EEFBC93EFBC8EE38080E7869FE68289EFBD8DEFBD99EFBD93EFBD91EFBD8CE68896EFBD8DEFBD8FEFBD8EEFBD87EFBD8FE695B0E68DAEE5BA93E4BDBFE794A8E59CBAE699AF3C2F703E3C703EEFBC94EFBC8EE38080E980BBE8BE91E6B885E6A59AEFBC8CE6809DE7BBB4E6B885E699B0EFBC8CE6B29FE9809AE889AFE5A5BDEFBC8CE585B7E5A487E889AFE5A5BDE79A84E58886E69E90E38081E79086E8A7A3E38081E8A7A3E586B3E997AEE9A298E79A84E883BDE58A9BEFBC9B3C2F703E3C703EEFBC95EFBC8EE38080E5AF8CE69C89E59BA2E9989FE7B2BEE7A59EEFBC8CE684BFE6848FE68EA5E58F97E696B0E68A80E69CAFE696B0E6809DE7BBB4EFBC8CE5ADA6E4B9A0E883BDE58A9BE889AFE5A5BDE4BBA5E4B88AE380823C2F703E3C703E3C62722F3EE4BBBBE8818CE8A681E6B182EFBC9A3C2F703E3C703E3C62722F3EEFBC91E38081E887B3E5B091EFBC93E5B9B4E79A84E99DA2E59091E5AFB9E8B1A1E79A84EFBCB0EFBCA8EFBCB0E7BC96E7A88BE7BB8FE9AA8CE380823C62722F3EEFBC92E38081E68BA5E69C89E59CA8E7BABFE7BD91E7AB99E5AE9EE99985E7A094E58F91E7BB8FE9AA8CEFBC9B3C62722F3EEFBC93E38081E7B2BEE9809AEFBCADEFBD99EFBCB3EFBCB1EFBCACE695B0E68DAEE5BA93EFBC8CE8A1A8E8AEBEE8AEA1EFBC8CE680A7E883BDE8B083E4BC98EFBC8CE695B0E68DAEE5BA93EFBCB3EFBD88EFBD81EFBD92EFBD84E8AEBEE8AEA1EFBC88E695B0E68DAEE5BA93E58886E589B2EFBC8CE8A1A8E58886E589B2EFBC8CE69E84E5BBBAE695B0E68DAEE5BA93E99B86E7BEA4EFBC89EFBC9B3C62722F3EEFBC94E38081E7869FE68289E4B880E7A78DE4BBA5E4B88AE79A84EFBCB0EFBCA8EFBCB0E6A186E69EB63C62722F3EEFBC95E38081E8B4A3E4BBBBE5BF83E5BCBAEFBC8CE585B7E69C89E889AFE5A5BDE79A84E6B29FE9809AE38081E58D8FE4BD9CE883BDE58A9BE5928CE59BA2E9989FE59088E4BD9CE6848FE8AF86E380823C2F703E, '/upload/20190626/d4ba27fe921bc66b9d1bdb40e2dac63f.png', '', '', '1', '1', '0', '0', '0', '0', '0', '0', '6', '0.00', '0', '1561564146', '1562588915');
INSERT INTO `kite_document_content` VALUES ('10', '15', '1', '1', '中国自己的域名根服务器来了', '', '', 0x3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4B8ADE59BBDE887AAE5B7B1E79A84E59F9FE5908DE6A0B9E69C8DE58AA1E599A8E69DA5E4BA863C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE5B7A5E4BFA1E983A8E8A1A8E7A4BAEFBC8CE5908CE6848FE4B8ADE59BBDE4BA92E88194E7BD91E7BB9CE4BFA1E681AFE4B8ADE5BF83E8AEBEE7AB8BE59F9FE5908DE6A0B9E69C8DE58AA1E599A8EFBC88EFBCA6E38081EFBCA9E38081EFBCABE38081EFBCACE6A0B9E9959CE5838FE69C8DE58AA1E599A8EFBC89E58F8AE59F9FE5908DE6A0B9E69C8DE58AA1E599A8E8BF90E8A18CE69CBAE69E84EFBC8CE8B49FE8B4A3E8BF90E8A18CE38081E7BBB4E68AA4E5928CE7AEA1E79086E7BC96E58FB7E58886E588ABE4B8BAEFBCAAEFBCB8EFBC90EFBC90EFBC90EFBC91EFBCA6E38081EFBCAAEFBCB8EFBC90EFBC90EFBC90EFBC92EFBCA6E38081EFBCAAEFBCB8EFBC90EFBC90EFBC90EFBC93EFBCA9E38081EFBCAAEFBCB8EFBC90EFBC90EFBC90EFBC94EFBCABE38081EFBCAAEFBCB8EFBC90EFBC90EFBC90EFBC95EFBCACE38081EFBCAAEFBCB8EFBC90EFBC90EFBC90EFBC96EFBCACE79A84E59F9FE5908DE6A0B9E69C8DE58AA1E599A8E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE5908CE697B6EFBC8CE5B7A5E4BFA1E983A8E8A681E6B182E4B8ADE59BBDE4BA92E88194E7BD91E7BB9CE4BFA1E681AFE4B8ADE5BF83E8A681E4B8A5E6A0BCE981B5E5AE88E3808AE4BA92E88194E7BD91E59F9FE5908DE7AEA1E79086E58A9EE6B395E3808BE3808AE9809AE4BFA1E7BD91E7BB9CE5AE89E585A8E998B2E68AA4E7AEA1E79086E58A9EE6B395E3808BE58F8AE79BB8E585B3E6B395E5BE8BE6B395E8A784E38081E8A18CE694BFE8A784E7ABA0E58F8AE8A18CE4B89AE7AEA1E79086E8A784E5AE9AEFBC8CE68EA5E58F97E68891E983A8E79A84E7AEA1E79086E5928CE79B91E79DA3E6A380E69FA5EFBC8CE5BBBAE7AB8BE7ACA6E59088E68891E983A8E8A681E6B182E79A84E4BFA1E681AFE7AEA1E79086E7B3BBE7BB9FE5B9B6E4B88EE68891E983A8E68C87E5AE9AE79A84E7AEA1E79086E7B3BBE7BB9FE5AFB9E68EA5EFBC8CE4BF9DE8AF81E59F9FE5908DE6A0B9E69C8DE58AA1E599A8E5AE89E585A8E38081E58FAFE99DA0E8BF90E8A18CEFBC8CE4B8BAE794A8E688B7E68F90E4BE9BE5AE89E585A8E38081E696B9E4BEBFE79A84E59F9FE5908DE69C8DE58AA1EFBC8CE4BF9DE99A9CE69C8DE58AA1E8B4A8E9878FEFBC8CE4BF9DE68AA4E794A8E688B7E4B8AAE4BABAE4BFA1E681AFE5AE89E585A8EFBC8CE7BBB4E68AA4E59BBDE5AEB6E588A9E79B8AE5928CE794A8E688B7E69D83E79B8AE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE68FB4E5BC95E887AAE799BEE5BAA6E799BEE7A791E4BB8BE7BB8DEFBC9AE6A0B9E69C8DE58AA1E599A8E4B8BBE8A681E794A8E69DA5E7AEA1E79086E4BA92E88194E7BD91E79A84E4B8BBE79BAEE5BD95EFBC8CE585A8E4B896E7958CEFBCA9EFBCB0EFBD96EFBC94E6A0B9E69C8DE58AA1E599A8E58FAAE69C89EFBC91EFBC93E58FB0EFBC88E8BF99EFBC91EFBC93E58FB0EFBCA9EFBCB0EFBD96EFBC94E6A0B9E59F9FE5908DE69C8DE58AA1E599A8E5908DE5AD97E58886E588ABE4B8BAE2809CEFBCA1E2809DE887B3E2809CEFBCADE2809DEFBC89EFBC8CEFBC91E4B8AAE4B8BAE4B8BBE6A0B9E69C8DE58AA1E599A8E59CA8E7BE8EE59BBDE38082E585B6E4BD99EFBC91EFBC92E4B8AAE59D87E4B8BAE8BE85E6A0B9E69C8DE58AA1E599A8EFBC8CE585B6E4B8ADEFBC99E4B8AAE59CA8E7BE8EE59BBDEFBC8CE6ACA7E6B4B2EFBC92E4B8AAEFBC8CE4BD8DE4BA8EE88BB1E59BBDE5928CE7919EE585B8EFBC8CE4BA9AE6B4B2EFBC91E4B8AAE4BD8DE4BA8EE697A5E69CACE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE59CA8E4B88EE78EB0E69C89EFBCA9EFBCB0EFBD96EFBC94E6A0B9E69C8DE58AA1E599A8E4BD93E7B3BBE69EB6E69E84E58585E58886E585BCE5AEB9E59FBAE7A180E4B88AEFBC8CE4B8ADE59BBDE4B8BBE5AFBCE2809CE99BAAE4BABAE8AEA1E58892E2809DE4BA8EEFBC92EFBC90EFBC91EFBC96E5B9B4E59CA8E585A8E79083EFBC91EFBC96E4B8AAE59BBDE5AEB6E5AE8CE68890EFBC92EFBC95E58FB0EFBCA9EFBCB0EFBD96EFBC96E6A0B9E69C8DE58AA1E599A8E69EB6E8AEBEEFBC8CE4BA8BE5AE9EE4B88AE5BDA2E68890E4BA86EFBC91EFBC93E58FB0E58E9FE69C89E6A0B9E58AA0EFBC92EFBC95E58FB0EFBCA9EFBCB0EFBD96EFBC96E6A0B9E79A84E696B0E6A0BCE5B180E38082E4B8ADE59BBDE983A8E7BDB2E4BA86E585B6E4B8ADE79A84EFBC94E58FB0EFBC8CE794B1EFBC91E58FB0E4B8BBE6A0B9E69C8DE58AA1E599A8E5928CEFBC93E58FB0E8BE85E6A0B9E69C8DE58AA1E599A8E7BB84E68890EFBC8CE68993E7A0B4E4BA86E4B8ADE59BBDE8BF87E58EBBE6B2A1E69C89E6A0B9E69C8DE58AA1E599A8E79A84E59BB0E5A283E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4BBA5E4B88BE698AFE5B7A5E4BFA1E983A8E689B9E5A48DE585A8E69687EFBC9A3C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4B8ADE59BBDE4BA92E88194E7BD91E7BB9CE4BFA1E681AFE4B8ADE5BF83EFBC9A3C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4BDA0E4B8ADE5BF83E585B3E4BA8EE8AEBEE7AB8BE59F9FE5908DE6A0B9E69C8DE58AA1E599A8EFBC88EFBCA6E38081EFBCA9E38081EFBCABE38081EFBCACE6A0B9E9959CE5838FE69C8DE58AA1E599A8EFBC89E58F8AE59F9FE5908DE6A0B9E69C8DE58AA1E599A8E8BF90E8A18CE69CBAE69E84E79A84E794B3E8AFB7E694B6E68289E38082E6A0B9E68DAEE3808AE4BA92E88194E7BD91E59F9FE5908DE7AEA1E79086E58A9EE6B395E3808BEFBC88E5B7A5E4B89AE5928CE4BFA1E681AFE58C96E983A8E4BBA4E7ACACEFBC94EFBC93E58FB7EFBC89E69C89E585B3E8A784E5AE9AEFBC8CE7BB8FE5AEA1E69FA5EFBC8CE78EB0E689B9E5A48DE5A682E4B88BEFBC9A3C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4B880E38081E5908CE6848FE4BDA0E4B8ADE5BF83E8AEBEE7AB8BE59F9FE5908DE6A0B9E69C8DE58AA1E599A8EFBC88EFBCA6E38081EFBCA9E38081EFBCABE38081EFBCACE6A0B9E9959CE5838FE69C8DE58AA1E599A8EFBC89E58F8AE68890E4B8BAE59F9FE5908DE6A0B9E69C8DE58AA1E599A8E8BF90E8A18CE69CBAE69E84EFBC8CE8B49FE8B4A3E8BF90E8A18CE38081E7BBB4E68AA4E5928CE7AEA1E79086E7BC96E58FB7E58886E588ABE4B8BAEFBCAAEFBCB8EFBC90EFBC90EFBC90EFBC91EFBCA6E38081EFBCAAEFBCB8EFBC90EFBC90EFBC90EFBC92EFBCA6E38081EFBCAAEFBCB8EFBC90EFBC90EFBC90EFBC93EFBCA9E38081EFBCAAEFBCB8EFBC90EFBC90EFBC90EFBC94EFBCABE38081EFBCAAEFBCB8EFBC90EFBC90EFBC90EFBC95EFBCACE38081EFBCAAEFBCB8EFBC90EFBC90EFBC90EFBC96EFBCACE79A84E59F9FE5908DE6A0B9E69C8DE58AA1E599A8E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4BA8CE38081E4BDA0E4B8ADE5BF83E5BA94E4B8A5E6A0BCE981B5E5AE88E3808AE4BA92E88194E7BD91E59F9FE5908DE7AEA1E79086E58A9EE6B395E3808BE3808AE9809AE4BFA1E7BD91E7BB9CE5AE89E585A8E998B2E68AA4E7AEA1E79086E58A9EE6B395E3808BE58F8AE79BB8E585B3E6B395E5BE8BE6B395E8A784E38081E8A18CE694BFE8A784E7ABA0E58F8AE8A18CE4B89AE7AEA1E79086E8A784E5AE9AEFBC8CE68EA5E58F97E68891E983A8E79A84E7AEA1E79086E5928CE79B91E79DA3E6A380E69FA5EFBC8CE5BBBAE7AB8BE7ACA6E59088E68891E983A8E8A681E6B182E79A84E4BFA1E681AFE7AEA1E79086E7B3BBE7BB9FE5B9B6E4B88EE68891E983A8E68C87E5AE9AE79A84E7AEA1E79086E7B3BBE7BB9FE5AFB9E68EA5EFBC8CE4BF9DE8AF81E59F9FE5908DE6A0B9E69C8DE58AA1E599A8E5AE89E585A8E38081E58FAFE99DA0E8BF90E8A18CEFBC8CE4B8BAE794A8E688B7E68F90E4BE9BE5AE89E585A8E38081E696B9E4BEBFE79A84E59F9FE5908DE69C8DE58AA1EFBC8CE4BF9DE99A9CE69C8DE58AA1E8B4A8E9878FEFBC8CE4BF9DE68AA4E794A8E688B7E4B8AAE4BABAE4BFA1E681AFE5AE89E585A8EFBC8CE7BBB4E68AA4E59BBDE5AEB6E588A9E79B8AE5928CE794A8E688B7E69D83E79B8AE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4B889E38081E4BDA0E4B8ADE5BF83E5BA94E5BD93E588B6E5AE9AE5B9B6E4B88DE696ADE5AE8CE59684E59F9FE5908DE6A0B9E69C8DE58AA1E599A8E58F8AE59F9FE5908DE6A0B9E69C8DE58AA1E599A8E8BF90E8A18CE69CBAE69E84E79A84E7AEA1E79086E588B6E5BAA6EFBC9BE68C87E5AE9AE4B893E997A8E4BABAE59198E8B49FE8B4A3E59F9FE5908DE6A0B9E69C8DE58AA1E599A8E79A84E8BF90E8A18CE38081E7BBB4E68AA4E5928CE7AEA1E79086E5B7A5E4BD9CEFBC8CE5BBBAE7AB8BE59BBAE5AE9AE79A84E88194E7B3BBE69CBAE588B6EFBC9BE98089E68BA9E585B7E5A487E8B584E8B4A8E79A84E7BD91E7BB9CE68EA5E585A5E69C8DE58AA1E68F90E4BE9BE88085E4B8BAE59F9FE5908DE6A0B9E69C8DE58AA1E599A8E68F90E4BE9BE68EA5E585A5E69C8DE58AA1EFBC9BE59F9FE5908DE6A0B9E69C8DE58AA1E599A8E69CBAE688BFE59CB0E59D80E38081E4BA92E88194E7BD91E58D8FE8AEAEEFBC88EFBCA9EFBCB0EFBC89E59CB0E59D80E5928CE887AAE6B2BBE59F9FEFBC88EFBCA1EFBCB3EFBC89E58FB7E7A081E7AD89E4BFA1E681AFE58F91E7949FE58F98E69BB4E697B6EFBC8CE5BA94E5BD93E59CA8E58F98E69BB4E4B98BE697A5E5898DEFBC91EFBC95E697A5E4BBA5E4B9A6E99DA2E5BDA2E5BC8FE68AA5E98081E68891E983A8E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE59B9BE38081E4BDA0E4B8ADE5BF83E5BA94E9858DE7BDAEE5BF85E8A681E79A84E7BD91E7BB9CE8B584E6BA90E4BBA5E58F8AE7BD91E7BB9CE5928CE9809AE4BFA1E5BA94E680A5E8AEBEE5A487EFBC8CE588B6E5AE9AE58887E5AE9EE69C89E69588E79A84E7BD91E7BB9CE9809AE4BFA1E4BF9DE99A9CE5928CE7BD91E7BB9CE4B88EE4BFA1E681AFE5AE89E585A8E5BA94E680A5E9A284E6A188EFBC8CE8AEBEE7AB8BE38081E9858DE5A487E4B893E8818CE7BD91E7BB9CE4B88EE4BFA1E681AFE5AE89E585A8E7AEA1E79086E69CBAE69E84E5928CE4BABAE59198EFBC8CE5BBBAE7AB8BE581A5E585A8E7BD91E7BB9CE4B88EE4BFA1E681AFE5AE89E585A8E588B6E5BAA6E4B88EE4BF9DE99A9CE68EAAE696BDEFBC8CE5BBBAE7AB8BE79BB8E5BA94E79A84E4B89AE58AA1E4B88EE5AE89E585A8E7AEA1E79086E7B3BBE7BB9FEFBC8CE5BBBAE8AEBEE79B91E6B58BE9A284E8ADA6E38081E5BA94E680A5E5A484E7BDAEE38081E695B0E68DAEE5A487E4BBBDE7AD89E5BF85E8A681E79A84E68A80E69CAFE6898BE6AEB5EFBC8CE5AE9AE69C9FE68AA5E98081E4BFA1E681AFEFBC8CE69C8DE4BB8EE68891E983A8E79A84E7BB9FE4B880E68C87E68CA5E4B88EE58D8FE8B083EFBC8CE9858DE59088E5BC80E5B195E79BB8E585B3E6B58BE8AF95E5928CE6BC94E7BB83EFBC8CE981B5E5AE88E79BB8E5BA94E79A84E7AEA1E79086E8A681E6B182E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4BA94E38081E4BDA0E4B8ADE5BF83E5BA94E5BD93E59CA8E6AF8FE5ADA3E5BAA6E7BB93E69D9FE5908EE79A84EFBC95E4B8AAE5B7A5E4BD9CE697A5E58685E5B086E59F9FE5908DE6A0B9E69C8DE58AA1E599A8E4B88AE4B880E5ADA3E5BAA6E79A84E4B89AE58AA1E5BC80E5B195E68385E586B5E38081E5AE89E585A8E8BF90E8A18CE68385E586B5E7AD89E4BFA1E681AFE68AA5E98081E68891E983A8EFBC88E4BCA0E79C9FEFBC9AEFBC90EFBC91EFBC90EFBC8DEFBC96EFBC96EFBC90EFBC93EFBC97EFBC90EFBC99EFBC97EFBC9BE794B5E5AD90E982AEE4BBB6EFBC9AEFBD84EFBD8FEFBD8DEFBD81EFBD89EFBD8EEFBCA0EFBD8DEFBD89EFBD89EFBD94EFBC8EEFBD87EFBD8FEFBD96EFBC8EEFBD83EFBD8EEFBC89E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE585ADE38081E4BDA0E4B8ADE5BF83E59CA8E8BF90E8A18CE38081E7BBB4E68AA4E5928CE7AEA1E79086E59F9FE5908DE6A0B9E69C8DE58AA1E599A8E8BF87E7A88BE4B8ADE98187E588B0E997AEE9A298EFBC8CE99C80E58F8AE697B6E4BBA5E4B9A6E99DA2E5BDA2E5BC8FE68AA5E98081E68891E983A8E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4B883E38081E6ADA4E689B9E5A48DE887AAE58F91E5B883E4B98BE697A5E8B5B7E7949FE69588EFBC8CE69C89E69588E69C9FE4B8BAEFBC95E5B9B4E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE6ADA4E5A48DE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE5B7A5E4B89AE5928CE4BFA1E681AFE58C96E983A83C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EEFBC92EFBC90EFBC91EFBC99E5B9B4EFBC96E69C88EFBC92EFBC94E697A5E38080E380803C2F703E, '/upload/20190626/f8594d9dc116ee24ec265deb036cd916.png', '', '', '1', '1', '0', '0', '0', '0', '0', '0', '1', '0.00', '0', '1561564244', '1562509215');
INSERT INTO `kite_document_content` VALUES ('11', '15', '1', '1', '央视快评：用青春诠释共产党人的初心和使命', '', '近日，习近平总书记对黄文秀同志先进事迹作出重要指示强调，黄文秀同志研究生毕业后，放弃大城市的工作机会，毅然回到家乡，在脱贫攻坚第一线倾情投入、奉献自我，用美好青春诠释了共产党人的初心使命，谱写了新时代的青春之歌。', 0x3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE8BF91E697A5EFBC8CE4B9A0E8BF91E5B9B3E680BBE4B9A6E8AEB0E5AFB9E9BB84E69687E7A780E5908CE5BF97E58588E8BF9BE4BA8BE8BFB9E4BD9CE587BAE9878DE8A681E68C87E7A4BAE5BCBAE8B083EFBC8CE9BB84E69687E7A780E5908CE5BF97E7A094E7A9B6E7949FE6AF95E4B89AE5908EEFBC8CE694BEE5BC83E5A4A7E59F8EE5B882E79A84E5B7A5E4BD9CE69CBAE4BC9AEFBC8CE6AF85E784B6E59B9EE588B0E5AEB6E4B9A1EFBC8CE59CA8E884B1E8B4ABE694BBE59D9AE7ACACE4B880E7BABFE580BEE68385E68A95E585A5E38081E5A589E78CAEE887AAE68891EFBC8CE794A8E7BE8EE5A5BDE99D92E698A5E8AFA0E9878AE4BA86E585B1E4BAA7E5859AE4BABAE79A84E5889DE5BF83E4BDBFE591BDEFBC8CE8B0B1E58699E4BA86E696B0E697B6E4BBA3E79A84E99D92E698A5E4B98BE6AD8CE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4B9A0E8BF91E5B9B3E680BBE4B9A6E8AEB0E79A84E9878DE8A681E68C87E7A4BAEFBC8CE9AB98E5BAA6E8B59EE689ACE4BA86E9BB84E69687E7A780E59D9AE5AE88E5889DE5BF83E38081E68B85E5BD93E4BDBFE591BDE79A84E4BFA1E4BBB0E68385E68080EFBC8CE58585E58886E5BDB0E698BEE4BA86E5AFB9E4B880E7BABFE5A58BE69697E88085E79A84E4BAB2E58887E585B3E68080EFBC8CE5AFB9E9BB84E69687E7A780E8BF99E4BD8DE4BC98E7A780E585B1E4BAA7E5859AE59198E79A84E9AB98E5BAA6E8A492E5A596E38082E680BBE4B9A6E8AEB0E79A84E9878DE8A681E68C87E7A4BAEFBC8CE5BF85E5B086E6BF80E58F91E8B5B7E585A8E5859AE38081E585A8E7A4BEE4BC9AE789B9E588ABE698AFE5B9BFE5A4A7E99D92E5B9B4E5859AE59198E5B9B2E983A8EFBC8CE68A95E585A5E588B0E884B1E8B4ABE694BBE59D9AE7ACACE4B880E7BABFE7AD89E7A596E59BBDE69C80E99C80E8A681E79A84E5B297E4BD8DE4B88AEFBC8CE5BBBAE58A9FE696B0E697B6E4BBA3E38081E5A58BE69697E6B0B8E4B88DE681AFE79A84E8B1AAE8BF88E783ADE68385E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE5B487E9AB98E79A84E4BFA1E4BBB0E6BF80E58F91E5BCBAE5A4A7E79A84E58A9BE9878FEFBC8CE8BF9CE5A4A7E79A84E79BAEE6A087E59D9AE5AE9AE5898DE8A18CE79A84E696B9E59091E38082E696B0E697B6E4BBA3E79A84E4BC98E7A780E585B1E4BAA7E5859AE59198E9BB84E69687E7A780E4BBA5E99D92E698A5E697A0E68294E79A84E98089E68BA9E38081E59D9AE99FA7E4B88DE68B94E79A84E6AF85E58A9BE38081E6B0B8E4B88DE68788E680A0E79A84E5B9B2E58AB2E8B0B1E58699E587BAE4B880E69BB2E88AB3E58D8EE79280E792A8E79A84E99D92E698A5E4B98BE6AD8CEFBC8CE4B8BAE585A8E5859AE585A8E7A4BEE4BC9AE6A091E7AB8BE8B5B7E4B880E5908DE4BC98E7A780E585B1E4BAA7E5859AE4BABAE79A84E7B2BEE7A59EE6A087E69D86E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE59091E9BB84E69687E7A780E5ADA6E4B9A0EFBC8CE5B0B1E8A681E5ADA6E4B9A0E5A5B9E6B0B8E68080E5889DE5BF83E79A84E8B5A4E5AD90E4B98BE68385E38082E58D81E5B9B4E5AF92E7AA97EFBC8CE9BB84E69687E7A780E8B5B0E587BAE5A4A7E5B1B1EFBC9BE5908DE6A0A1E6AF95E4B89AEFBC8CE5A5B9E58F88E59B9EE588B0E5A4A7E5B1B1E38082E69CACE883BDE79599E59CA8E5A4A7E59F8EE5B882E79A84E5A5B9E98089E68BA9E794A8E99D92E698A5E6898EE6A0B9E59FBAE5B182E38081E68A8AE6B7B1E68385E5A589E78CAEE4B9A1E59C9FE38081E4BBA5E8A18CE58AA8E8AFA0E9878AE8B5A4E8AF9AEFBC8CE698AFE5859AE79A84E5889DE5BF83E5928CE4BDBFE591BDE79A84E5BFA0E5AE9EE4BFA1E4BBB0E88085E5928CE79FA2E5BF97E8B7B5E8A18CE88085E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE59091E9BB84E69687E7A780E5ADA6E4B9A0EFBC8CE5B0B1E8A681E5ADA6E4B9A0E5A5B9E58B87E4BA8EE68B85E5BD93E79A84E59381E6A0BCE38082E5A5B9E4BBA5E4B88DE88EB7E585A8E8839CE4B88DE692A4E98080E79A84E689B6E8B4ABE7B2BEE7A59EEFBC8CE5B086E8B4A3E4BBBBE6899BE59CA8E882A9E4B88AEFBC8CE68A8AE59BB0E99ABEE8B8A9E59CA8E8849AE4B88BEFBC8CE9A9BBE69D91E4B880E5B9B4E997B4EFBC8CE5A5B9E4BBA5E4B8A4E4B887E4BA94E58D83E585ACE9878CE79A84E8A18CE8BDA6E9878CE7A88BE8B5B0E587BAE4BA86E4B880E4B8AAE689B6E8B4ABE694BBE59D9AE79A84E2809CE696B0E995BFE5BE81E2809DEFBC8CE4BBA5E69E81E5BCBAE79A84E4BDBFE591BDE6849FE8B4A3E4BBBBE6849FE5AE8CE68890E59084E9A1B9E884B1E8B4ABE694BBE59D9AE4BBBBE58AA1E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE59091E9BB84E69687E7A780E5ADA6E4B9A0EFBC8CE5B0B1E8A681E5ADA6E4B9A0E5A5B9E79498E4BA8EE5A589E78CAEE58B87E4BA8EE5AE9EE5B9B2E79A84E7B2BEE7A59EE38082E4BD9CE4B8BAE9A9BBE69D91E7ACACE4B880E4B9A6E8AEB0EFBC8CE9BB84E69687E7A780E8849AE8B88FE5AE9EE59CB0E59F8BE5A4B4E88BA6E5B9B2EFBC8CE4B880E5B9B4E997B4E5B0B1E5B8A6E9A286EFBC98EFBC98E688B7EFBC94EFBC91EFBC98E5908DE8B4ABE59BB0E7BEA4E4BC97E884B1E8B4ABEFBC8CE585A8E69D91E8B4ABE59BB0E58F91E7949FE78E87E4B88BE9998DEFBC92EFBC90EFBC85E4BBA5E4B88AE38082E59CA8E5B9B3E587A1E5B297E4BD8DE4B88AEFBC8CE5A5B9E4B9A6E58699E4B88BE4BA86E99D9EE587A1E79A84E4B89AE7BBA9E38082E59CA8E884B1E8B4ABE694BBE59D9AE8BF99E4B880E58E86E58FB2E4B98BE5BDB9E4B8ADEFBC8CE8BF98E69C89EFBC92EFBC90E4B887E7ACACE4B880E4B9A6E8AEB0E38081EFBC97EFBC90E4B887E9A9BBE69D91E5B9B2E983A8E5928CE587A0E799BEE4B887E59FBAE5B182E5B9B2E983A8E38082E9BB84E69687E7A780E79A84E6849FE4BABAE4BA8BE8BFB9EFBC8CE5BF85E5B086E6BF80E58AB1E5B9BFE5A4A7E5859AE59198E5B9B2E983A8E4B8BAE585A8E99DA2E5BBBAE68890E5B08FE5BAB7E7A4BEE4BC9AE8808CE58B87E5BE80E79BB4E5898DE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4B88DE5BF98E5889DE5BF83EFBC8CE696B9E5BE97E5A78BE7BB88E38082E697A0E8AEBAE698AFE68898E781ABE7BAB7E9A39EE79A84E99DA9E591BDE5B281E69C88EFBC8CE8BF98E698AFE783ADE781ABE69C9DE5A4A9E79A84E5BBBAE8AEBEE5B9B4E4BBA3EFBC8CE4BAA6E68896E698AFE7A0A5E7A0BAE5898DE8A18CE79A84E694B9E99DA9E5BC80E694BEE697B6E69C9FEFBC8CE4B880E4BBA3E4BBA3E585B1E4BAA7E5859AE4BABAE5A78BE7BB88E59D9AE68C81E2809CE4B8BAE4B8ADE59BBDE4BABAE6B091E8B08BE5B9B8E7A68FEFBC8CE4B8BAE4B8ADE58D8EE6B091E6978FE8B08BE5A48DE585B4E2809DEFBC8CE68EA8E58AA8E4B8ADE58D8EE6B091E6978FE5AE9EE78EB0E4BA86E4BB8EE7AB99E8B5B7E69DA5E38081E5AF8CE8B5B7E69DA5E5868DE588B0E5BCBAE8B5B7E69DA5E79A84E4BC9FE5A4A7E8B7A8E8B68AE38082E7BD97E998B3E38081E5BB96E4BF8AE6B3A2E38081E9BB84E5A4A7E5B9B4E38081E69D9CE5AF8CE59BBDE38081E5BCA0E5AF8CE6B885E38081E9BB84E69687E7A780E280A6E280A6E4B880E4B8AAE4B8AAE79498E4BA8EE5A589E78CAEE79A84E4BC98E7A780E585B1E4BAA7E5859AE59198E794A8E5AE9EE99985E8A18CE58AA8EFBC8CE5BDB0E698BEE79D80E5889DE5BF83E4BDBFE591BDE79A84E5BCBAE5A4A7E58A9BE9878FEFBC9BE4B880E4B8AAE4B8AAE6849FE5A4A9E58AA8E59CB0E79A84E5A58BE69697E69585E4BA8BEFBC8CE6B187E8819AE68890E5A594E59091E6B091E6978FE5A48DE585B4E6B3A2E6BE9CE5A3AEE99894E79A84E58E86E58FB2E794BBE58DB7E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE6A69CE6A0B7E79A84E58A9BE9878FE698AFE697A0E7A9B7E79A84E38082E585A8E5859AE5908CE5BF97E8A681E6B7B1E588BBE5ADA6E4B9A0E9A286E4BC9AE4B9A0E8BF91E5B9B3E680BBE4B9A6E8AEB0E5AFB9E9BB84E69687E7A780E5908CE5BF97E58588E8BF9BE4BA8BE8BFB9E9878DE8A681E68C87E7A4BAE79A84E7B2BEE7A59EEFBC8CE697B6E588BBE789A2E8AEB0E2809CE8B5B0E5BE97E5868DE8BF9CE38081E8B5B0E588B0E5868DE58589E8BE89E79A84E69CAAE69DA5EFBC8CE4B99FE4B88DE883BDE5BF98E8AEB0E8B5B0E8BF87E79A84E8BF87E58EBBEFBC8CE4B88DE883BDE5BF98E8AEB0E4B8BAE4BB80E4B988E587BAE58F91E2809DEFBC8CE887AAE8A789E4BBA5E9BB84E69687E7A780E5908CE5BF97E4B8BAE6A69CE6A0B7EFBC8CE789A2E8AEB0E5889DE5BF83E4BDBFE591BDEFBC8CE58B87E4BA8EE5A589E78CAEE68B85E5BD93EFBC8CE59CA8E696B0E697B6E4BBA3E79A84E995BFE5BE81E8B7AFE4B88AE5819AE587BAE696B0E79A84E69BB4E5A4A7E8B4A1E78CAEE380823C2F703E3C703E3C62722F3E3C2F703E, '/upload/20190702/4e2c560750620b81f99a66274e62af88.jpg', '', '', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0.00', '0', '1562043940', '1562509009');
INSERT INTO `kite_document_content` VALUES ('12', '15', '1', '1', '保险重买照片重拍，签证中心“套路”该管管了', '', '“保险不符合要求最好再买一份”，“照片底色不够白要重拍”，花２５０元买个ＶＩＰ可以少排队数小时，快递费６０元不然就得自己跑一趟……近日，新京报对部分签证中心乱象进行了报道，引发舆论关注。', 0x3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223E3C7370616E207374796C653D22746578742D696E64656E743A2032656D3B223EE69687E38080EFBD9CE38080E69DA8E58AB2E69DBE3C2F7370616E3E3C62722F3E3C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE2809CE4BF9DE999A9E4B88DE7ACA6E59088E8A681E6B182E69C80E5A5BDE5868DE4B9B0E4B880E4BBBDE2809DEFBC8CE2809CE785A7E78987E5BA95E889B2E4B88DE5A49FE799BDE8A681E9878DE68B8DE2809DEFBC8CE88AB1EFBC92EFBC95EFBC90E58583E4B9B0E4B8AAEFBCB6EFBCA9EFBCB0E58FAFE4BBA5E5B091E68E92E9989FE695B0E5B08FE697B6EFBC8CE5BFABE98092E8B4B9EFBC96EFBC90E58583E4B88DE784B6E5B0B1E5BE97E887AAE5B7B1E8B791E4B880E8B69FE280A6E280A6E8BF91E697A5EFBC8CE696B0E4BAACE68AA5E5AFB9E983A8E58886E7ADBEE8AF81E4B8ADE5BF83E4B9B1E8B1A1E8BF9BE8A18CE4BA86E68AA5E98193EFBC8CE5BC95E58F91E88886E8AEBAE585B3E6B3A8E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4B88DE59088E79086E694B6E8B4B9E38081E5A597E8B7AFE5A49AE38081E6B688E8B4B9E4BD93E9AA8CE5B7AEE38081E587BAE7ADBEE8BF87E7A88BE4B88DE9808FE6988EE38081E697A0E6B395E588A4E696ADE7ADBEE8AF81E4B8ADE5BF83E8A18CE4B8BAE698AFE590A6E8AF9AE4BFA1E280A6E280A6E983A8E58886E7ADBEE8AF81E4B8ADE5BF83E5AD98E59CA8E79A84E8BF99E4BA9BE997AEE9A298EFBC8CE697A0E79691E8B79FE5BD93E4B88BE79A84E2809CE6B688E8B4B9E58D87E7BAA7E2809DE8AF89E6B182E4B88DE59088E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4BD9CE4B8BAE99C80E6B182E9A9B1E58AA8E4B88BE79A84E5B882E59CBAE58C96E7BB84E7BB87EFBC8CE7ADBEE8AF81E4B8ADE5BF83E79A84E8AEBEE7AB8BEFBC8CE58E9FE69CACE698AFE79BAEE79A84E59CB0E4B8BAE4B8ADE59BBDE587BAE5A283E6B8B8E5AEA2E2809CE5878FE8B49FE2809DE79A84E4BEBFE588A9E4B98BE4B8BEE38082E8BF91E5B9B4E69DA5EFBC8CE4B8ADE59BBDE587BAE5A283E5B882E59CBAE58F91E5B195E8BF85E78C9BEFBC8CE5B0B1E68BBFEFBC92EFBC90EFBC91EFBC98E5B9B4E69DA5E8AFB4EFBC8CE4B8ADE59BBDE587BAE5A283E6B8B8E5AEA2E8A784E6A8A1E680BBE9878FE8BEBEE588B0EFBC91EFBC8EEFBC94EFBC99E4BABFE4BABAE6ACA1EFBC8CE8BE83EFBC92EFBC90EFBC91EFBC97E5B9B4E5908CE6AF94E5A29EE995BFEFBC91EFBC94EFBC8EEFBC97EFBC85E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4B8ADE59BBDE5B7A8E5A4A7E79A84E587BAE5A283E5B882E59CBAE8A784E6A8A1E5928CE5BFABE9809FE79A84E58F91E5B195E9809FE5BAA6EFBC8CE5BC95E8B5B7E4B896E7958CE4BC97E5A49AE587BAE5A283E79BAEE79A84E59CB0E79A84E585B3E6B3A8E38082E4B88DE5B091E59BBDE5AEB6E98787E58F96E8AFB8E5A49AE68EAAE696BDE69DA5E590B8E5BC95E4B8ADE59BBDE6B8B8E5AEA2EFBC8CE8808CE59CA8E58AA0E5BCBAE5AFB9E58D8EE4BF83E99480E38081E5BC80E58F91E4B8ADE59BBDE6B8B8E5AEA2E5969CE788B1E79A84E69785E6B8B8E4BAA7E59381E7AD89E68EAAE696BDE4B98BE5A496EFBC8CE7AE80E58C96E7ADBEE8AF81E6898BE7BBADE69BB4E698AFE585B6E4B8ADE79A84E585B3E994AEE4B880E78EAFE38082E7ADBEE8AF81E4B8ADE5BF83E69CACE698AFE4B8BAE4BA86E2809CE4BEBFE6B091E2809DE8808CE7949FE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE58FAFE4BB8EE68AA5E98193E79C8BEFBC8CE69C89E4BA9BE7ADBEE8AF81E4B8ADE5BF83E79A84E4BD9CE4B8BAE5B7B2E6988EE698BEE5818FE7A6BBE4BA86E38080E2809CE5889DE5BF83E2809DE38082E7ADBEE8AF81E4B8ADE5BF83E58886E5B883E8B68AE69DA5E8B68AE5AF86E99B86E4BA86EFBC8CE58FAFE7BB99E6B8B8E5AEA2E5B8A6E69DA5E79A84EFBC8CE5B9B6E99D9EE7ADBEE8AF81E69C8DE58AA1E79A84E69BB4E58AA0E4BEBFE588A9EFBC8CE8808CE698AFE8B68AE69DA5E8B68AE5A49AE79A84E4B88DE6BBA1E5928CE59090E6A7BDE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE68891E8AEA4E4B8BAEFBC8CE7ADBEE8AF81E4B8ADE5BF83E4B9B1E8B1A1E4B98BE68980E4BBA5E5AD98E59CA8EFBC8CE4B8BBE8A681E6BA90E4BA8EE4BFA1E681AFE4B88DE5AFB9E7A7B0E5928CE79B91E7AEA1E8B584E6BA90E68A95E585A5E79A84E4B88DE58CB9E9858DE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE5B0B1E5BD93E4B88BE8808CE8A880EFBC8CE5A4A7E983A8E58886E4BABAE5AFB9E587BAE5A283E7ADBEE8AF81E4B8ADE5BF83E79A84E680A7E8B4A8E38081E58A9FE883BDE5928CE8BF90E4BD9CE6A8A1E5BC8FEFBC8CE4BE9DE784B6E698AFE4B880E5A4B4E99BBEE6B0B4EFBC9BE585B6E5BE97E588B0E4BB80E4B988E6A0B7E79A84E68E88E69D83EFBC8CE69D83E588A9E5928CE4B989E58AA1E79A84E8BEB9E7958CE59CA8E593AAE9878CE7AD89E997AEE9A298EFBC8CE4B99FE8AEA9E4BABAE5BC84E4B88DE6B885E6A59AE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4B8BAE4BA86E887AAE8BAABE588A9E79B8AEFBC8CE69C89E79A84E7ADBEE8AF81E4B8ADE5BF83E4B99FE98787E58F96E6A8A1E7B38AE79A84E68081E5BAA6EFBC8CE69C89E588A9E4BA8EE887AAE8BAABE588A9E79B8AE79A84E5819AE6B395E5928CE8AFB4E6B395E5B0B1E5A4A7E5BCA0E69797E9BC93EFBC8CE4B88DE588A9E4BA8EE887AAE8BAABE588A9E79B8AE79A84E8AFB4E6B395E5B0B1E59084E7A78DE68998E8AF8DE38082E6AF94E5A682E2809CE587BAE7ADBEE4BA86E698AFE7ADBEE8AF81E4B8ADE5BF83E79A84E58A9FE58AB3EFBC8CE68B92E7ADBEE4BA86E5B0B1E698AFE4BDBFE9A286E9A686E79A84E586B3E5AE9AE2809DE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE8808CE5AFB9E4BA8EE7ADBEE8AF81E4B8ADE5BF83E79A84E5A682E6ADA4E4BD9CE4B8BAEFBC8CE79BAEE79A84E59CB0E4BD9CE4B8BAE5A794E68998E696B9EFBC8CE68891E59BBDE79BB8E585B3E983A8E997A8E4BD9CE4B8BAE79B91E7AEA1E696B9EFBC8CE983BDE69C89E5BE88E5A49AE5B7A5E4BD9CE99C80E8A681E5819AE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE5AFB9E4BA8EE79BAEE79A84E59CB0EFBC8CE7ADBEE8AF81E4BEBFE588A9E58C96E79A84E7AEA1E79086E5928CE8BDBDE4BD93E4B88DE883BDE4B880E8BDACE4BA86E4B98BEFBC8CE99C80E8A681E69C89E69BB4E9808FE6988EE79A84E68E88E69D83E5928CE69C8DE58AA1E8AF84E4BBB7E6A087E58786E38082E585B6E4B8ADE69C80E4B8BAE9878DE8A681E79A84EFBC8CE698AFE69C89E4BBB7E580BCE79A84E4BFA1E681AFE68F90E4BE9BE5928CE69C89E69588E79A84E69C8DE58AA1EFBC8CE8BF99E4BBA3E8A1A8E79D80E587BAE5A283E79BAEE79A84E59CB0E79A84E59381E7898CE5BDA2E8B1A1E5928CE58FA3E7A291E8B4A8E9878FE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE59CA8E7ADBEE8AF81E4B8ADE5BF83E697A5E79B8AE59091E4BA8CE4B889E7BABFE59F8EE5B882E689A9E5B195E79A84E5BD93E4B88BEFBC8CE696B0E5A29EE79A84E587BAE5A283E4BABAE7BEA4E4BA8BE5AE9EE4B88AE99C80E8A681E69BB4E5A49AE79A84E4BFA1E681AFE5928CE79BB8E585B3E69C8DE58AA1EFBC8CE4BB96E4BBACE79A84E7ACACE4B880E6ACA1E5B09DE8AF95E6848FE591B3E79D80E69CAAE69DA5E69BB4E5A49AE58FAFE883BDE680A7E38082E5A682E69E9CE79BAEE79A84E59CB0E68980E98089E68BA9E79A84E7ADBEE8AF81E4B8ADE5BF83E8A1A8E78EB0E587BAE68980E8B093E2809CE681B6E6848FE2809DEFBC8CE982A3E4B988E5B0B1E4BC9AE4BDBFE79BAEE79A84E59CB0E79A84E5BDA2E8B1A1E58F97E588B0E99ABEE4BBA5E5BCA5E8A1A5E79A84E68D9FE5AEB3EFBC8CE4B88EE58E9FE69DA5E79A84E69C9FE69C9BE58D97E8BE95E58C97E8BE99E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE8808CE5AFB9E4BA8EE79BB8E585B3E7AEA1E79086E983A8E997A8EFBC8CE5A4A7E8A784E6A8A1E9AB98E9809FE5BAA6E79A84E587BAE5A283E69785E6B8B8E5B882E59CBAE5A29EE995BFEFBC8CE99C80E8A681E69BB4E7B2BEE7BB86E58C96E79A84E7AEA1E79086E6A8A1E5BC8FEFBC8CE585ACE585B1E69C8DE58AA1E79A84E6848FE8AF86E4B88DE883BDE4B8A2E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE6808EE4B988E4BF9DE8AF81E59BBDE6B091E68EA5E8A7A6E79A84E4BFA1E681AFE79C9FE5AE9EE69C89E69588EFBC8CE88EB7E58F96E69C8DE58AA1E79A84E8BF87E7A88BE69BB4E58AA0E9808FE6988EE585ACE6ADA3EFBC8CE58F91E7949FE997AEE9A298E5908EE5BE97E588B0E58F8AE697B6E58F8DE9A688E5928CE5A484E79086E280A6E280A6E8AFB8E5A682E6ADA4E7B1BBE79A84E997AEE9A298EFBC8CE5AE9EE99985E4B88AE983BDE698AFE69785E6B8B8E4BAA7E4B89AE5928CE5B882E59CBAE68980E6B8B4E6B182E79A84E5BF85E8A681E585ACE585B1E69C8DE58AA1E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE58FAAE69C89E69C89E69588E59CB0E58EBBE999A4E4BFA1E681AFE5A381E59E92EFBC8CE5AE9EE78EB0E5BF85E8A681E79A84E8BF87E7A88BE79B91E7AEA1EFBC8CE4B8BAE6B8B8E5AEA2E68F90E4BE9BE7B3BBE7BB9FE694AFE68C81EFBC8CE4BDBFE6B8B8E5AEA2E59CA8E7ADBEE8AF81E4B8ADE5BF83E58A9EE79086E5898DE4B88DE8A2ABE4BD8EE4BCB0EFBC8CE59CA8E5AE9EE99985E6898BE7BBADE697B6E5BF83E9878CE4B88DE6858CE4B88DE680B5EFBC8CE6898DE883BDE4BB8EE6A0B9E69CACE4B88AE993B2E999A4E7ADBEE8AF81E4B8ADE5BF83E4B9B1E8B1A1E5AD98E59CA8E79A84E59C9FE5A3A4E380823C2F703E3C703E3C62722F3E3C2F703E, '/upload/20190702/4fabb6d93aa8e3f67a77f6dacf3e9c62.jpg', '', '', '1', '0', '0', '0', '0', '0', '1', '0', '8', '0.00', '0', '1562044428', '1562588931');
INSERT INTO `kite_document_content` VALUES ('13', '15', '1', '1', '有信心让亿万百姓端稳“饭碗”', '', '', 0x3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE8BF9BE585A5EFBC97E69C88EFBC8CE58F88E4B880E689B9E5A4A7E5ADA6E7949FE5B086E8B5B0E4B88AE7A4BEE4BC9AE38082E2809CE8BAABE8BEB9E4B88DE5B091E5908CE5ADA6E6898BE68FA1E4B8A4E4B889E4BBBDE5BD95E794A8E9809AE79FA5EFBC8CE5898DE699AFE983BDE4B88DE99499EFBC81E2809DE58DB3E5B086E8BF9BE585A5E4B880E5AEB6E69CBAE6A2B0E4BC81E4B89AE4BB8EE4BA8BE7A094E58F91E5B7A5E4BD9CE79A84E9878DE5BA86E5A4A7E5ADA6E6AF95E4B89AE7949FE7BD97E5B08FE58D8EE9808FE79D80E4B990E8A782EFBC8CE2809CE58FAAE8A681E683B3E5B7A5E4BD9CEFBC8CE69CBAE4BC9AE69C89E5BE88E5A49AEFBC81E2809D3C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE79B9BE5A48FE588B0E69DA5EFBC8CE58F88E4B880E689B9E6B5B7E5A496E8AEA2E58D95E4BCA0E79C9FE588B0E5B9BFE4B89CE78FA0E6B5B7E59BBDE4BDB3E696B0E69D90E585ACE58FB8E38082E585ACE58FB8E9AB98E7AEA1E5BCA0E5BF97E6B19FE69C89E782B9E5BF83E680A5EFBC8CE2809CE8AEA2E58D95E4B88DE696ADEFBC8CE7949FE4BAA7E59083E7B4A7EFBC8CE68891E5BE97E5868DE68B9BE4BA9BE68A80E5B7A5EFBC81E2809D3C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE5B0B1E4B89AEFBC8CE4B880E5A4B4E789B5E79D80E58D83E4B887E5AEB6E5BAADEFBC8CE4B880E5A4B4E8BF9EE79D80E7BB8FE6B58EE5A4A7E58ABFE38082E2809CE9A5ADE7A297E2809DE7ABAFE7A8B3E4BA86EFBC8CE697A5E5AD90E6898DE883BDE5AE89E5AE9AE38081E8B88FE5AE9EE38081E69C89E5A594E5A4B4EFBC9BE5B0B1E4B89AE7A8B3E4BD8FE4BA86EFBC8CE58F91E5B195E6898DE883BDE4BB8EE5AEB9E38081E59D9AE5AE9AE38081E69C89E5BA95E6B094E38082E2809CE5B0B1E4B89AE698AFE69C80E5A4A7E79A84E6B091E7949FE5B7A5E7A88BE38081E6B091E5BF83E5B7A5E7A88BE38081E6A0B9E59FBAE5B7A5E7A88BEFBC8CE698AFE7A4BEE4BC9AE7A8B3E5AE9AE79A84E9878DE8A681E4BF9DE99A9CEFBC8CE5BF85E9A1BBE68A93E7B4A7E68A93E5AE9EE68A93E5A5BDE2809DEFBC8CE58EBBE5B9B4E4B88BE58D8AE5B9B4E4BBA5E69DA5EFBC8CE4BBA5E4B9A0E8BF91E5B9B3E5908CE5BF97E4B8BAE6A0B8E5BF83E79A84E5859AE4B8ADE5A4AEE68A8AE7A8B3E5B0B1E4B89AE58897E4B8BAE2809CE585ADE7A8B3E2809DE4B98BE9A696EFBC8CE59084E9A1B9E7A8B3E5B0B1E4B89AE38081E4BF83E5B0B1E4B89AE694BFE7AD96E7BAB7E7BAB7E587BAE58FB0EFBC8CE4BB8AE5B9B4E58F88E9A696E6ACA1E5B086E5B0B1E4B89AE4BC98E58588E694BFE7AD96E7BDAEE4BA8EE5AE8FE8A782E694BFE7AD96E5B182E99DA2E38082E694BFE7AD96E7BAA2E588A9E5A682E698A5E9A38EE68B82E99DA2EFBC8CE890A5E980A0E4BA86E889AFE5A5BDE79A84E5B0B1E4B89AE6B09BE59BB4E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE5BD93E5898DE68891E59BBDE5B0B1E4B89AE5BDA2E58ABFE7A9B6E7AB9FE5A682E4BD95EFBC9FE4B896E7958CE7BB8FE6B58EE8BF90E8A18CE9A38EE999A9E5928CE4B88DE7A1AEE5AE9AE680A7E4B88AE58D87E4BC9AE7BB99E68891E59BBDE5B0B1E4B89AE5B8A6E69DA5E593AAE4BA9BE5BDB1E5938DEFBC8CE68891E4BBACE883BDE590A6E68890E58A9FE58C96E8A7A3EFBC9FE8AEB0E88085E8BF9BE8A18CE4BA86E8B083E69FA5E98787E8AEBFE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE79C8BE5B0B1E4B89AE5A4A7E5B180E28094E280943C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE8A784E6A8A1E68C81E7BBADE689A9E5A4A7EFBC8CE5BDA2E58ABFE680BBE4BD93E5B9B3E7A8B33C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE585A8E5B9B4E59F8EE99587E696B0E5A29EE5B0B1E4B89AEFBC91EFBC93EFBC96EFBC91E4B887E4BABAEFBC8CE5868DE5889BE58E86E58FB2E696B0E9AB98EFBC8CE59F8EE99587E8B083E69FA5E5A4B1E4B89AE78E87E4BF9DE68C81EFBC95EFBC85E5B7A6E58FB3E8BE83E4BD8EE6B0B4E5B9B3E280A6E280A6EFBC92EFBC90EFBC91EFBC98E5B9B4EFBC8CE68891E59BBDE5B0B1E4B89AE68890E7BBA9E5969CE4BABAE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4BB8AE5B9B4EFBC91E28094EFBC95E69C88E59F8EE99587E696B0E5A29EE5B0B1E4B89AEFBC95EFBC99EFBC97E4B887E4BABAEFBC8CE5AE8CE68890E585A8E5B9B4E8AEA1E58892E79A84EFBC95EFBC94EFBC85EFBC8CEFBC92EFBC95E28094EFBC95EFBC99E5B281E4BABAE58FA3E8B083E69FA5E5A4B1E4B89AE78E87E8BF9EE7BBADEFBC93E4B8AAE69C88E4B88BE9998DE280A6E280A6EFBC92EFBC90EFBC91EFBC99E5B9B4EFBC8CE68891E59BBDE5B0B1E4B89AE68C87E6A087E4BE9DE784B6E68AA2E79CBCE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE2809CE8BF99E4BA9BE695B0E68DAEE983BDE8A1A8E6988EEFBC8CE68891E59BBDE58AB3E58AA8E58A9BE5B882E59CBAE5B7B2E68EA5E8BF91E58585E58886E5B0B1E4B89AE6B0B4E5B9B3EFBC8CE59BBDE99985E5B882E59CBAE79A84E4B88DE7A1AEE5AE9AE680A7E6B2A1E69C89E5AFB9E5B0B1E4B89AE980A0E68890E6988EE698BEE586B2E587BBE38082E2809DE4B8ADE59BBDE7A4BEE7A791E999A2E4BABAE58FA3E4B88EE58AB3E58AA8E7BB8FE6B58EE7A094E7A9B6E68980E589AFE68980E995BFE983BDE998B3E8A1A8E7A4BAE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE5A496E983A8E7BB8FE6B58EE78EAFE5A283E680BBE4BD93E8B68BE7B4A7EFBC8CE59BBDE58685E7BB8FE6B58EE5AD98E59CA8E4B88BE8A18CE58E8BE58A9BEFBC8CE68891E4BBACE4BD95E4BBA5E883BDE5AE9EE78EB0E5B0B1E4B89AE8A784E6A8A1E68C81E7BBADE689A9E5A4A7E38081E5B0B1E4B89AE5BDA2E58ABFE680BBE4BD93E5B9B3E7A8B3EFBC9F3C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4B8ADE59BBDE7BB8FE6B58EE7A8B3E4B8ADE59091E5A5BDEFBC8CE4B8BAE5B0B1E4B89AE5A5A0E5AE9AE4BA86E59D9AE5AE9EE59FBAE7A180E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE68C89E785A7E7BB8FE6B58EE5ADA6E4B8ADE79A84E2809CE5A5A5E882AFE5AE9AE5BE8BE2809DEFBC8CE5B0B1E4B89AE8A784E6A8A1E4B88EE7BB8FE6B58EE5A29EE9809FE9AB98E5BAA6E79BB8E585B3EFBC8CE5A29EE9809FE4B88BE9998DE5BE80E5BE80E5B8A6E69DA5E5B0B1E4B89AE4B88BE6BB91E38082E58FAFE698AFEFBC8CE8BF99E4B880E8A784E5BE8BE58DB4E59CA8E8BDACE585A5E4B8ADE9AB98E9809FE5A29EE995BFE998B6E6AEB5E79A84E4B8ADE59BBDE2809CE5A4B1E781B5E2809DE4BA86E28094E28094E5B0BDE7AEA1E7BB8FE6B58EE5A29EE9809FE69C89E68980E694BEE7BC93EFBC8CE59F8EE99587E696B0E5A29EE5B0B1E4B89AE58DB4E8BF9EE7BBADEFBC96E5B9B4E4BF9DE68C81EFBC91EFBC93EFBC90EFBC90E4B887E4BABAE4BBA5E4B88AE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE2809CE68891E59BBDE7BB8FE6B58EE680BBE9878FE5B7B2E7AA81E7A0B4EFBC99EFBC90E4B887E4BABFE58583EFBC8CE58DB3E4BDBFE698AFEFBC96EFBC85E79A84E5A29EE9809FEFBC8CE7BB9DE5AFB9E5A29EE58AA0E580BCE4B99FE69C89EFBC95EFBC8EEFBC94E4B887E4BABFE58583E38082E2809DE4B8ADE59BBDE58AB3E58AA8E5928CE7A4BEE4BC9AE4BF9DE99A9CE7A791E5ADA6E7A094E7A9B6E999A2E589AFE999A2E995BFE88EABE88DA3E98193E587BAE58E9FE5A794EFBC9AE59FBAE695B0E5A4A7E4BA86EFBC8CE58DB3E4BEBFE5A29EE9809FE69C89E68980E4B88BE9998DEFBC8CE5B7A8E5A4A7E79A84E7BB8FE6B58EE5A29EE9878FE4BE9DE697A7E883BDE694AFE69291E58FAFE8A782E79A84E5B0B1E4B89AE5A29EE995BFE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4BAA7E4B89AE7BB93E69E84E4BC98E58C96E58D87E7BAA7EFBC8CE4B99FE5A29EE5BCBAE4BA86E7BB8FE6B58EE5A29EE995BFE5AFB9E5B0B1E4B89AE79A84E68B89E58AA8E883BDE58A9BE38082E5908CE6A0B7E698AFEFBCA7EFBCA4EFBCB0E5A29EE995BFEFBC91E4B8AAE799BEE58886E782B9EFBC8CE59CA8E2809CE58D81E4BA8CE4BA94E2809DE697B6E69C9FEFBC8CE58FAFE5A29EE58AA0E99D9EE5869CE5B0B1E4B89AEFBC91EFBC96EFBC90E4B887E4BABAEFBC8CE8808CE59CA8E2809CE58D81E4B889E4BA94E2809DEFBC8CE58FAFE5A29EE58AA0EFBC91EFBC98EFBC90E4B887E28094EFBC92EFBC90EFBC90E4B887E4BABAE38082E8BF99E8838CE5908EEFBC8CE5BE97E79B8AE4BA8EE69C8DE58AA1E4B89AE79A84E5BC82E5869BE7AA81E8B5B7E38082E68DAEE7BB9FE8AEA1EFBC8CE7ACACE4B889E4BAA7E4B89AE6AF8FE799BEE4B887E58583E5A29EE58AA0E580BCE590B8E7BAB3E79A84E5B0B1E4B89AE4B8BAEFBC98EFBC8EEFBC91E4BABAEFBC8CE6AF94E7ACACE4BA8CE4BAA7E4B89AE9AB98E587BAEFBC91EFBC8EEFBC96E4BABAE38082E69C80E8BF91E587A0E5B9B4EFBC8CE69C8DE58AA1E4B89AE5A29EE58AA0E580BCE58DA0EFBCA7EFBCA4EFBCB0E6AF94E9878DE68C81E7BBADE8B685E8BF87E4B880E58D8AEFBC8CE5B0B1E4B89AE4BABAE695B0E5B7B2E8BF91EFBC93EFBC8EEFBC96E4BABFE4BABAE38082E590B8E7BAB3E5908CE6A0B7E695B0E9878FE5B0B1E4B89AEFBC8CE9998DE9809FE68F90E8B4A8E68B93E5B195E79A84E7A9BAE997B4E69BB4E5A4A7E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE696B0E58AA8E883BDE9878AE694BEE58585E6B29BE6B4BBE58A9BEFBC8CE4B8BAE5B0B1E4B89AE5889BE980A0E4BA86E5B9BFE99894E7A9BAE997B4E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE2809CE5BBBAE6A8A1E38081E4BC98E58C96E38081E8BFADE4BBA3EFBC8CE4BB8EE5BC80E58F91E588B0E4B88AE7BABFEFBC8CE695B4E4B8AAEFBC95E69C88E4BBBDEFBC8CE68891E4B880E5A4A9E6B2A1E6AD87E79D80E38082E2809DE4BABAE5B7A5E699BAE883BDE5B7A5E7A88BE5B888E4BC8DE5A4A7E58B87E8AFB4EFBC8CE4BABAE5B7A5E699BAE883BDE68A80E69CAFE6ADA3E5B8A6E69DA5E4B880E59CBAE589A7E78388E58F98E99DA9EFBC8CE2809CE5B882E59CBAE5AFB9E68891E4BBACE8BF99E8A18CE79A84E99C80E6B182E4BC9AE8B68AE69DA5E8B68AE5A4A7E38082E2809D3C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4BA91E8AEA1E7AE97E5B7A5E7A88BE68A80E69CAFE4BABAE59198E38081E789A9E88194E7BD91E5AE89E8A385E8B083E8AF95E59198E38081E697A0E4BABAE69CBAE9A9BEE9A9B6E59198E7AD89E696B0E8818CE4B89AE68284E784B6E8808CE887B3EFBC8CE695B0E5AD97E7BB8FE6B58EE9A286E59F9FE5B0B1E4B89AE5B297E4BD8DE8BEBEE588B0EFBC91EFBC8EEFBC99EFBC91E4BABFE4B8AAE280A6E280A6E8BF91E5B9B4E69DA5EFBC8CE696B0E68A80E69CAFE38081E696B0E4BAA7E4B89AE38081E696B0E4B89AE68081E893ACE58B83E58F91E5B195EFBC8CE698BEE89197E68B93E5B195E4BA86E5B0B1E4B89AE7A9BAE997B4E38082E4BB8EEFBC92EFBC90EFBC91EFBC95E5B9B4E588B0EFBC92EFBC90EFBC91EFBC97E5B9B4EFBC8CE68891E59BBDE7BB8FE6B58EE58F91E5B195E696B0E58AA8E883BDE68C87E695B0E5B9B4E59D87E5A29EE5B985E8BEBEE588B0EFBC92EFBC98EFBC85EFBC9BEFBC92EFBC90EFBC91EFBC98E5B9B4EFBC8CE696B0E58AA8E883BDE5AFB9E696B0E5A29EE5B0B1E4B89AE79A84E8B4A1E78CAEE78E87E8B685E8BF87EFBC92EFBC8FEFBC93E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE5B7A8E5A4A7E79A84E5B882E59CBAE5928CE58CBAE59F9FE7A9BAE997B4EFBC8CE4B8BAE5B0B1E4B89AE7A7AFE89384E4BA86E58FAFE8A782E6BD9CE58A9BE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE2809CE79BAEE5898DEFBC8CE585A8E59BBDE69C89E5AEB6E694BFE99C80E6B182E79A84E5AEB6E5BAADE8B685E8BF87EFBC97EFBC90EFBC90EFBC90E4B887E688B7EFBC8CE8808CE4BB8EE4B89AE4BABAE59198E4BB85EFBC92EFBC90EFBC90EFBC90E5A49AE4B887E4BABAEFBC8CE794A8E5B7A5E7BCBAE58FA3E5BE88E5A4A7EFBC81E2809DE2809CE4BA91E5AEB6E694BFE2809DE5889BE5A78BE4BABAE8969BE5B885E4BCB0E7AE97E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE882B2E584BFE38081E585BBE88081E38081E69785E6B8B8E38081E69599E882B2E38081E581A5E8BAABE280A6E280A6E79C8BE5B882E59CBAE6A0BCE5B180EFBC8CE4B88DE696ADE58D87E7BAA7E79A84E697BAE79B9BE99C80E6B182E4B8BAE5B0B1E4B89AE68F90E4BE9BE4BA86E5B7A8E5A4A7E79A84E8BDACE59CBAE7A9BAE997B4EFBC9BE79C8BE58CBAE59F9FE6A0BCE5B180EFBC8CE8B584E6BA90E4B8B0E5AF8CE38081E8A681E7B4A0E68890E69CACE4BD8EE38081E5B882E59CBAE6BD9CE58A9BE5A4A7E79A84E4B8ADE8A5BFE983A8E59CB0E58CBAE5B086E68890E4B8BAE9878DE8A681E79A84E4BAA7E4B89AE2809CE689BFE68EA5E59CB0E2809DE38081E5B0B1E4B89AE2809CE89384E6B0B4E6B1A0E2809DE38082EFBC92EFBC90EFBC91EFBC98E5B9B4EFBC8CE59CA8E4B8ADE8A5BFE983A8E59CB0E58CBAE58AA1E5B7A5E79A84E5869CE6B091E5B7A5E4BABAE695B0E8BEBEEFBC91EFBC92EFBC90EFBC94EFBC94E4B887E4BABAEFBC8CE5A29EE995BFEFBC93EFBC8EEFBC92EFBC85EFBC8CE5A29EE9809FE5BFABE4BA8EE585A8E59BBDEFBC92EFBC8EEFBC96E4B8AAE799BEE58886E782B9E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE694B9E99DA9E7BAA2E588A9E68C81E7BBADE9878AE694BEEFBC8CE4B99FE4B8BAE5B0B1E4B89AE782B9E78783E4BA86E5BCBAE5A4A7E5BC95E6938EE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE5AE9EE696BDE6B3A8E5868CE8B584E69CACE799BBE8AEB0E588B6E5BAA6E694B9E99DA9EFBC8CE5BC80E5B195E2809CE5A49AE8AF81E59088E4B880E2809DE2809CE8AF81E785A7E58886E7A6BBE2809DE7AD89E5B882E59CBAE4B8BBE4BD93E58786E585A5E694B9E99DA9E280A6E280A6E59CA8E2809CE694BEE7AEA1E69C8DE2809DE694B9E99DA9E79A84E68EA8E58AA8E4B88BEFBC8CE4BB8AE5B9B4E5898DEFBC95E4B8AAE69C88EFBC8CE68891E59BBDE696B0E799BBE8AEB0E4BC81E4B89AE8BEBEEFBC92EFBC98EFBC96E4B887E688B7EFBC8CE697A5E59D87EFBC91EFBC8EEFBC98EFBC99E4B887E688B7E38082E6B290E6B5B4E998B3E58589E99BA8E99CB2E79A84E6B091E890A5E38081E5B08FE5BEAEE4BC81E4B89AE59CA8E5B0B1E4B89AE4B8ADE6ADA3E689AEE6BC94E8B68AE69DA5E8B68AE9878DE8A681E79A84E8A792E889B2E28094E28094E58EBBE5B9B4EFBC91EFBC92E69C88EFBC8CE59F8EE99587E7A781E890A5E4BC81E4B89AE5928CE4B8AAE4BD93E5B7A5E59586E688B7E5B0B1E4B89AE4BABAE695B0E5908CE6AF94E58886E588ABE5A29EE995BFEFBC95EFBC8EEFBC97EFBC85E5928CEFBC96EFBC8EEFBC97EFBC85E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE79C8BE5A496E983A8E9A38EE999A9E28094E280943C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE680BBE4BD93E79C8BE5AFB9E5B0B1E4B89AE5BDB1E5938DE69C89E99990E38081E9A38EE999A9E58FAFE68EA73C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE59CA8E79C8BE588B0E69C89E588A9E69DA1E4BBB6E79A84E5908CE697B6EFBC8CE58F97E8AEBFE88085E7BAB7E7BAB7E8A1A8E7A4BAEFBC8CE5A496E983A8E78EAFE5A283E4B98BE58F98E7A1AEE5AE9EE4BC9AE7BB99E5B0B1E4B89AE5B8A6E69DA5E4B880E5AE9AE79A84E4B88DE7A1AEE5AE9AE680A7EFBC8CE4BD86E680BBE4BD93E79C8BE5BDB1E5938DE69C89E99990E38081E9A38EE999A9E58FAFE68EA7EFBC8CE68891E4BBACE5AE8CE585A8E69C89E883BDE58A9BE38081E69C89E69DA1E4BBB6E38081E69C89E4BFA1E5BF83E5BA94E5AFB9E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE887AAE4BFA1EFBC8CE6BA90E4BA8EE5AFB9E7BB8FE6B58EE8BF90E8A18CE79A84E79086E680A7E58886E69E90EFBC8CE4B99FE6BA90E4BA8EE59084E696B9E4BABAE5A3ABE79A84E5AE9EE8B7B5E4BD93E9AA8CEFBC9A3C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE28094E28094E4BB8EE58FAFE883BDE79A84E6B3A2E58F8AE88C83E59BB4E4B88AE79C8BEFBC8CE59BBDE99985E5B882E59CBAE79A84E4B88DE7A1AEE5AE9AE680A7E5AFB9E5B0B1E4B89AE2809CE5A4A7E79B98E2809DE5BDB1E5938DE69C89E99990E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4B880E69DA5EFBC8CE587BAE58FA3E69CACE8BAABE6B2A1E982A3E4B988E88486E5BCB1E38082E2809CE78BACE789B9E79A84E8AEBEE8AEA1E38081E5889BE696B0E79A84E69D90E69699E38081E4B8A5E6A0BCE79A84E8A385E8AEA2E8A681E6B182EFBC8CE58FAAE69C89E4B8ADE59BBDE6898DE883BDE7949FE4BAA7E587BAE68891E4BBACE683B3E5819AE79A84E59BBEE4B9A6E38082E2809DE7BE8EE59BBDE587BAE78988E59586E4B8B9E5B0BCE5B094C2B7E99BB7E8AFBAE5BEB7E79BB4E8A880E38082E59586E58AA1E983A8E7A094E7A9B6E999A2E7A094E7A9B6E59198E6A285E696B0E882B2E4B99FE8AEA4E4B8BAEFBC8CE2809CE4B8ADE59BBDE4BAA7E59381E59CA8E5A496E59BBDE5B882E59CBAE4B88AE7AB9EE4BA89E58A9BE79A84E789A2E59BBAE7A88BE5BAA6EFBC8CE8B685E587BAE4BA86E8AEB8E5A49AE5B882E59CBAE58F82E4B88EE88085E79A84E683B3E8B1A1E38082E2809DE4BB8AE5B9B4EFBC91E28094EFBC95E69C88EFBC8CE68891E59BBDE587BAE58FA3E9A29DE8BEBEEFBC96EFBC94EFBC99EFBC98EFBC97E4BABFE58583EFBC8CE5908CE6AF94E5A29EE995BFEFBC96EFBC8EEFBC91EFBC85EFBC8CE4BF9DE68C81E8BE83E5BFABE5A29EE9809FEFBC8CE4B99FE69C89E58A9BE59CB0E8AF81E6988EE4BA86E8BF99E4B880E782B9E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4BA8CE69DA5EFBC8CE587BAE58FA3E5AFB9E5B0B1E4B89AE79A84E68B96E7B4AFE5B9B6E4B88DE5A4A7E38082E8BF91E5B9B4E69DA5EFBC8CE99A8FE79D80E58685E99C80E6BD9CE58A9BE6BA90E6BA90E9878AE694BEEFBC8CE6B688E8B4B9E5B7B2E68890E4B8BAE68B89E58AA8E7BB8FE6B58EE79A84E2809CE4B8BBE5BC95E6938EE2809DEFBC8CE794B1E587BAE58FA3E5B8A6E58AA8E79A84E5B0B1E4B89AE59CA8E680BBE8A784E6A8A1E4B8ADE79A84E6AF94E9878DE79BB8E5BA94E9998DE4BD8EE38082E5868DE88085EFBC8CE79BAEE5898DE68891E59BBDE5B0B1E4B89AE79A84E2809CE4B8BBE58A9BE5869BE2809DE28094E28094E69C8DE58AA1E4B89AE79A84E58FAFE8B4B8E69893E5B19EE680A7E6AF94E588B6E980A0E4B89AE4BD8EEFBC8CE58F97E586B2E587BBE79A84E58FAFE883BDE680A7E4B99FE69BB4E5B08FE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE28094E28094E4BB8EE887AAE8BAABE79A84E689BFE58E8BE883BDE58A9BE69DA5E8AEB2EFBC8CE68891E59BBDE69C89E58585E8B6B3E79A84E2809CE5BA95E7898CE2809DE5BA94E5AFB9E59BBDE99985E5B882E59CBAE4B88DE7A1AEE5AE9AE680A7E5AFB9E5B0B1E4B89AE79A84E5BDB1E5938DE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE5AE8CE5A487E79A84E4BAA7E4B89AE4BD93E7B3BBEFBC8CE4BC9AE4BDBFE588B6E980A0E4B89AE4BAA7E883BDE9BB8FE680A7E5BCBAE38081E5B297E4BD8DE4B88DE5AEB9E69893E6B581E5A4B1E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE2809CE68BBFE588B0E8AEA2E58D95E5908EE58FAAE99C80E4B8A4E5A4A9EFBC8CE5B0B1E883BDE59CA8E78FA0E4B889E8A792E68A8AE58E9FE69699E38081E8BE85E69699E38081E5B7A5E585B7E38081E58C85E8A385E585A8E5A487E9BD90EFBC8CE8BF99E59CA8E585B6E4BB96E59BBDE5AEB6E7AE80E79BB4E4B88DE58FAFE683B3E8B1A1E38082E2809DE5BCA0E5BF97E6B19FE8AFB4EFBC8CE8BF99E4B8A4E5B9B4E69C89E4BC81E4B89AE5B086E983A8E58886E4BAA7E883BDE8BDACE7A7BBE588B0E4B89CE58D97E4BA9AE7AD89E2809CE68890E69CACE6B4BCE59CB0E2809DEFBC8CE2809CE58FAFE4B880E7AE97E68890E69CACE38081E69588E78E87E38081E8B4A8E9878FE79A84E680BBE8B4A6EFBC8CE8BF98E698AFE79599E59CA8E59BBDE58685E58892E5BE97E69DA5E38082E2809DE5928CE5BCA0E5BF97E6B19FE4B880E6A0B7EFBC8CE4B88DE5B091E58F97E8AEBFE88085E8AEA4E4B8BAEFBC8CE68891E59BBDE59D9AE5AE9EE79A84E4BAA7E4B89AE59FBAE7A180E38081E5BCBAE5A4A7E79A84E9858DE5A597E883BDE58A9BE4BBA5E58F8AE4B88EE697A5E4BFB1E5A29EE79A84E5889BE696B0E5AE9EE58A9BEFBC8CE5B086E4BDBFE588B6E980A0E4B89AE8B5A2E5BE97E8BDACE59E8BE58D87E7BAA7E79A84E5AE9DE8B4B5E7AA97E58FA3E69C9FEFBC8CE68C81E7BBADE694AFE69291E5BA9EE5A4A7E79A84E5B0B1E4B89AE4BD93E9878FE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE5BCBAE5A4A7E79A84E59BBDE58685E5B882E59CBAEFBC8CE4BC9AE4B88DE696ADE9878AE694BEE5928CE8A18DE7949FE696B0E99C80E6B182EFBC8CE5889BE980A0E69BB4E5A49AE5B297E4BD8DE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE2809CE58F97E5A496E983A8E78EAFE5A283E58F98E58C96E5BDB1E5938DEFBC8CE69C89E79A84E5AEA2E688B7E5878FE5B091E4BA86E8AEA2E8B4A7E9878FEFBC8CE58FAFE8BF99E7BB9DE4B88DE4BC9AE68993E4B9B1E68891E4BBACE689A9E5A4A7E7949FE4BAA7E38081E5A29EE58AA0E68B9BE88198E79A84E586B3E5BF83E38082E2809DE5B7A5E4B89AE69CBAE599A8E4BABAE5B7A8E5A4B4E5BA93E58DA1E79A84E4B8ADE59BBDE9A696E5B8ADE689A7E8A18CE5AE98E78E8BE6B19FE585B5E8AEA4E4B8BAEFBC8CE4B8ADE59BBDE588B6E980A0E4B89AE6ADA3E58AA0E5BFABE8BDACE59E8BEFBC8CE5AFB9E7949FE4BAA7E7BABFE79A84E99C80E6B182E8B68AE58F91E5A49AE58583EFBC8CE2809CE995BFE8BF9CE69DA5E79C8BEFBC8CE5B7A5E4B89AE69CBAE599A8E4BABAE59CA8E4B8ADE59BBDE5898DE699AFE5B9BFE99894EFBC8CE697A0E8AEBAE59FBAE7A180E7A094E7A9B6E38081E68A80E69CAFE5BC80E58F91E8BF98E698AFE594AEE5908EE69C8DE58AA1E983BDE99C80E8A681E5A4A7E689B9E4BABAE79A84E58AA0E585A5E38082E2809DE5B195E69C9BE69CAAE69DA5EFBC8CE4BCA0E7BB9FE588B6E980A0E4B89AE694B9E980A0E58D87E7BAA7E38081E696B0E59E8BE59F8EE99587E58C96E58AA0E5BFABE58F91E5B195E38081E5B185E6B091E6B688E8B4B9E883BDE58A9BE5A29EE5BCBAE7AD89E8AFB8E5A49AE59BA0E7B4A0EFBC8CE983BDE5B086E4B8BAE68891E59BBDE4B88DE696ADE9878AE694BEE696B0E79A84E5B882E59CBAE99C80E6B182E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE2809CE69C8BE58F8BE59C88E2809DE68C81E7BBADE689A9E5A4A7EFBC8CE4BC9AE9998DE4BD8EE68891E59BBDE5AFB9E5B091E695B0E59BBDE5AEB6E79A84E5A496E8B4B8E4BE9DE5AD98EFBC8CE5878FE5B091E585B6E5AFB9E5B0B1E4B89AE79A84E5BDB1E5938DE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE2809CE78EB0E59CA8EFBC8CE69C89E4BA9BE59BBDE5AEB6E79A84E8AEA2E58D95E5878FE4BA86E4B880E4BA9BEFBC8CE58FAFE6ACA7E6B4B2E38081E4B8ADE4B89CE5B882E59CBAE8B5B7E69DA5E4BA86EFBC8CE890A5E694B6E980BCE8BF91E28098E58D8AE5A381E6B19FE5B1B1E28099EFBC8CE69CAAE69DA5E8BF98E4BC9AE69BB4E9AB98E38082E2809DE6B599E6B19FE9BE99E7BF94E7BABAE7BB87E585ACE58FB8E680BBE7BB8FE79086E78E8BE7BAAFE5AFB9E69CAAE69DA5E58585E6BBA1E69C9FE5BE85EFBC8CE2809CE58FAAE8A681E59D9AE68C81E8BDACE59E8BE38081E5BC80E68B93E5A49AE58583E5B882E59CBAEFBC8CE5B0B1E883BDE7A8B3E4BD8FE4BAA7E883BDE38081E7A8B3E5AE9AE4BABAE5BF83E38082E2809DE2809CE8BF91E5B9B4E69DA5EFBC8CE68891E59BBDE68F90E587BAE79A84E28098E4B880E5B8A6E4B880E8B7AFE28099E580A1E8AEAEE5B9BFE58F97E8AEA4E58FAFEFBC8CE59088E4BD9CE58F96E5BE97E4B8B0E7A195E68890E69E9CEFBC8CE69C89E588A9E4BA8EE5A496E8B4B8E6A0BCE5B180E69BB4E5A49AE58583EFBC8CE4B99FE5B086E68AB5E6B688E59BBDE99985E5B882E59CBAE4B88DE7A1AEE5AE9AE680A7E58FAFE883BDE5B8A6E69DA5E79A84E5B0B1E4B89AE68D9FE5A4B1E38082E2809DE5AFB9E5A496E7BB8FE8B4B8E5A4A7E5ADA6E585ACE585B1E7AEA1E79086E5ADA6E999A2E69599E68E88E69D8EE995BFE5AE89E8AFB4E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE79C8BE58F91E5B195E68081E58ABFE28094E280943C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE58FAAE8A681E5BA94E5AFB9E5BE97E5BD93EFBC8CE5B0B1E883BDE5AE9EE78EB0E69BB4E9AB98E8B4A8E9878FE5B0B1E4B89A3C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE79C8BE8BF87E58EBBEFBC8CE68890E7BBA9E69690E784B6EFBC8CE79C8BE69CAAE69DA5EFBC8CE68C91E68898E78AB9E5AD98E28094E28094E680BBE9878FE58E8BE58A9BE4B88DE5878FE38081E7BB93E69E84E680A7E79F9BE79BBEE587B8E698BEEFBC8CE696B0E79A84E5BDB1E5938DE59BA0E7B4A0E8BF98E59CA8E5A29EE58AA0E38082E4B88DE8BF87EFBC8CE58F97E8AEBFE88085E699AEE9818DE8AEA4E4B8BAEFBC8CE58FAAE8A681E68A8AE5B0B1E4B89AE69186E59CA8E69BB4E58AA0E7AA81E587BAE4BD8DE7BDAEEFBC8CE5BA94E5AFB9E5BE97E5BD93E38081E68EAAE696BDE69C89E58A9BEFBC8CE5B0B1E883BDE4BF9DE8AF81E5B0B1E4B89AE7A8B3E5AE9AE38081E5AE9EE78EB0E69BB4E9AB98E8B4A8E9878FE5B0B1E4B89AE38082E58EBBE5B9B4E4BBA5E69DA5EFBC8CE4B880E7B3BBE58897E7A8B3E5A29EE995BFE38081E7A8B3E5B0B1E4B89AE68EAAE696BDE79BB8E7BBA7E890BDE59CB0EFBC8CE5B7B2E7BB8FE8AF81E6988EE4BA86E5BA94E5AFB9E79A84E69C89E69588E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE5A4A7E8A784E6A8A1E5878FE7A88EE9998DE8B4B9EFBC8CE8AEA9E4BC81E4B89AE2809CE8BDBBE8A385E4B88AE998B5E2809DEFBC8CE69E81E5A4A7E5A29EE5BCBAE4BA86E590B8E7BAB3E5B0B1E4B89AE883BDE58A9BE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE9998DE4BD8EE5A29EE580BCE7A88EE7A88EE78E87E38081E9998DE4BD8EE7A4BEE4BF9DE7BCB4E8B4B9E6AF94E4BE8BE38081E9998DE4BD8EE4B880E888ACE5B7A5E59586E4B89AE794B5E4BBB7E280A6E280A6E5878FE7A88EE9998DE8B4B9E8BF91EFBC92E4B887E4BABFE58583E79A84E9878DE5A4A7E588A9E5A5BDEFBC8CE5B086E5B9BFE6B39BE683A0E58F8AE59084E7B1BBE4BC81E4B89AE38082E2809CE68891E4BBACE5B19EE4BA8EE9A39FE59381E99BB6E594AEE4B89AEFBC8CE4BABAE59198E5AF86E99B86E38081E588A9E6B6A6E7A9BAE997B4E5B08FE38082E6A0B9E68DAEE4BB8AE5B9B4E79A84E5B08FE5BEAEE4BC81E4B89AE699AEE683A0E680A7E5878FE5858DE694BFE7AD96EFBC8CE68891E4BBACE4BB85E4BC81E4B89AE68980E5BE97E7A88EE5B0B1E883BDE79C81E4B88BEFBC92EFBC96E4B887E58583E38082E2809DE6ADA3E5A682E5B1B1E4B89CE99A86E6B3B0E9A39FE59381E585ACE58FB8E8B49FE8B4A3E4BABAE983ADE7A780E585B0E68980E8AFB4EFBC8CE694BFE7AD96E588A9E5A5BDE69E81E5A4A7E5878FE8BDBBE4BA86E8B584E98791E58E8BE58A9BEFBC8CE8AEA9E4BC81E4B89AE5B9B2E58AB2E69BB4E9AB98E38081E5B8A6E58AA8E5B0B1E4B89AE883BDE58A9BE69BB4E5BCBAE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE5A4A7E4BC81E4B89AE9A1B6E5A4A9E7AB8BE59CB0EFBC8CE5B08FE4BC81E4B89AE993BAE5A4A9E79B96E59CB0EFBC8CE890A5E980A0E889AFE5A5BDE78EAFE5A283EFBC8CE9BC93E58AB1E5889BE696B0E5889BE4B89AE5889BE980A0EFBC8CE58FAFE58585E58886E58F91E68CA5E5889BE4B89AE5B8A6E58AA8E5B0B1E4B89AE79A84E5808DE5A29EE69588E5BA94E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4BC97E5889BE7A9BAE997B4E695B0E9878FE8BEBEEFBC95EFBC95EFBC90EFBC90E5A49AE5AEB6EFBC8CE7A791E68A80E4BC81E4B89AE5ADB5E58C96E599A8E8B685EFBC94EFBC90EFBC90EFBC90E5AEB6EFBC8CE5889BE4B89AE68A95E8B584E69CBAE69E84E980BEEFBC93EFBC95EFBC90EFBC90E5AEB6E280A6E280A6E68891E59BBDE5B7B2E698AFE4B896E7958CE4B88AE7ACACE4BA8CE5A4A7E5889BE4B89AE68A95E8B584E5B882E59CBAE38082E8BF91E5B9B4E69DA5EFBC8CE68891E59BBDE5889BE696B0E5889BE4B89AE5889BE980A0E783ADE781ABE69C9DE5A4A9EFBC8CE690ADE5BBBAE8B5B7E5B9BFE99894E79A84E5B0B1E4B89AE8889EE58FB0E38082E2809CE68891E4BBACE5B086E58AA0E5A4A7E7A88EE694B6E38081E89E8DE8B584E38081E794A8E59CB0E7AD89E696B9E99DA2E694BFE7AD96E694AFE68C81EFBC8CE7A7AFE69E81E58F91E5B195E5889BE4B89AE5ADB5E58C96E59FBAE59CB0EFBC8CE9BC93E58AB1E69BB4E5A49AE58AB3E58AA8E88085E9809AE8BF87E5889BE696B0E5889BE4B89AE5889BE980A0E5AE9EE78EB0E5B0B1E4B89AE38082E2809DE59BBDE5AEB6E58F91E694B9E5A794E696B0E997BBE58F91E8A880E4BABAE5AD9FE78EAEE8AFB4E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4BF83E8BF9BE5BDA2E68890E5BCBAE5A4A7E59BBDE58685E5B882E59CBAEFBC8CE883BDE8AEA9E696B0E7A9BAE997B4E2809CE995BFE2809DE8B5B7E69DA5E38081E696B0E5B297E4BD8DE2809CE58692E2809DE587BAE69DA5E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EEFBC96E69C88EFBC96E697A5EFBC8CE99A8FE79D80E5B7A5E4BFA1E983A8E59091EFBC94E5AEB6E4BC81E4B89AE58F91E694BEEFBC95EFBCA7E59586E794A8E7898CE785A7EFBC8CE68891E59BBDE78E87E58588E8BF9BE585A5EFBC95EFBCA7E697B6E4BBA3E38082E69C89E4BABAE9A284E6B58BEFBC8CE588B0EFBC92EFBC90EFBC92EFBC95E5B9B4EFBC8CEFBC95EFBCA7E5B086E5B8A6E58AA8E7BB8FE6B58EE4BAA7E587BAEFBC93EFBC95EFBC8EEFBC94E4B887E4BABFE58583E38081E68F90E4BE9BEFBC93EFBC90EFBC90E4B887E4B8AAE5B0B1E4B89AE5B297E4BD8DE38082EFBC95EFBCA7E38081E6B1BDE8BDA6E38081E5AEB6E794B5E280A6E280A6E4BB8AE5B9B4E5889DEFBC8CE68891E59BBDE59BB4E7BB95E4BF83E8BF9BE6B688E8B4B9E38081E689A9E5A4A7E58685E99C80E588B6E5AE9AE4BA86E8AFA6E7BB86E696B9E6A188EFBC8CE4B88DE5B091E4BC81E4B89AE9A1BAE58ABFE8808CE4B8BAEFBC8CE7BAB7E7BAB7E8BFBDE58AA0E68A95E8B584E38081E689A9E5A4A7E7949FE4BAA7E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE5819AE5A4A7E5B0B1E4B89AE680BBE9878FE79A84E5908CE697B6EFBC8CE68891E59BBDE4B99FE6ADA3E4BB8EE4BE9BE7BB99E4BEA7E58F91E58A9BEFBC8CE58D83E696B9E799BEE8AEA1E68F90E9AB98E58AB3E58AA8E88085E7B4A0E8B4A8EFBC8CE4BDBFE4BE9BE99C80E69BB4E58CB9E9858DE38081E5B0B1E4B89AE7BB93E69E84E69BB4E4BC98E58C96E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE2809CE58E82E9878CE4B88AE4BA86E699BAE883BDE7949FE4BAA7E7BABFEFBC8CE5ADA6E4BC9AE7BC96E7A88BE5B0B1E69C89E5B88CE69C9BE8BDACE5B297E68890E4B8BAE7B3BBE7BB9FE6938DE4BD9CE59198E38082E2809DE69C80E8BF91EFBC8CE995BFE6B299E4B880E5AEB6E7BABAE7BB87E58E82E79A84E8818CE5B7A5E688B4E78EB2E799BDE5A4A9E4B88AE78FADE38081E6999AE4B88AE58F82E58AA0E59FB9E8AEADEFBC8CE2809CE69CACE4BA8BE5A4A7E4BA86EFBC8CE9A5ADE7A297E883BDE69BB4E28098E99381E28099EFBC81E2809D3C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4B880E8BEB9E2809CE69C89E6B4BBE6B2A1E4BABAE5B9B2E2809DEFBC8CE4B880E8BEB9E2809CE69C89E4BABAE6B2A1E6B4BBE5B9B2E2809DE280A6E280A6E8BF87E58EBBEFBC8CE7BB93E69E84E680A7E79F9BE79BBEE588B6E7BAA6E4BA86E5B0B1E4B89AE8B4A8E9878FE68F90E58D87E38082E4BB8AE5B9B4EFBC8CE9AB98E8818CE999A2E6A0A1E689A9E68B9BEFBC91EFBC90EFBC90E4B887E4BABAEFBC8CE9BC93E58AB1E69BB4E5A49AE9AB98E4B8ADE7949FE38081E4B88BE5B297E8818CE5B7A5E38081E5869CE6B091E5B7A5E68AA5E88083EFBC9BEFBC93E5B9B4E58685EFBC8CE5BC80E5B195E59084E7B1BBE8A1A5E8B4B4E680A7E8818CE4B89AE68A80E883BDE59FB9E8AEADEFBC95EFBC90EFBC90EFBC90E4B887E4BABAE6ACA1E4BBA5E4B88AE280A6E280A6E8818CE4B89AE69599E882B2E5928CE68A80E883BDE59FB9E8AEADE79A84E58AA0E5BCBAEFBC8CE697A2E883BDE4B8BAE9AB98E8B4A8E9878FE58F91E5B195E5A29EE5BCBAE4BABAE6898DE4BE9BE7BB99EFBC8CE4B99FE69C89E588A9E4BA8EE2809CE4BABAE5B0BDE585B6E6898DE38081E4BABAE69C89E585B6E5B297E2809DE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE2809CE99DA2E5AFB9E59BBDE99985E5B882E59CBAE79A84E4B88DE7A1AEE5AE9AE680A7EFBC8CE68891E4BBACE69C89E58585E8B6B3E79A84E694BFE7AD96E5B7A5E585B7E38082E6AF94E5A682E98787E58F96E8B4A2E694BFE68896E8B4A7E5B881E694BFE7AD96E4BBA5E7A8B3E5AE9AE5A29EE995BFE38081E5A29EE58AA0E68A95E8B584E38081E68B89E58AA8E5B0B1E4B89AEFBC8CE4B99FE58FAFE98787E58F96E68FB4E4BC81E7A8B3E5B297E38081E5A29EE58AA0E585ACE79B8AE680A7E5B297E4BD8DE4BE9BE7BB99E38081E58AA0E5BCBAE5B0B1E4B89AE59BB0E99ABEE4BABAE59198E5B8AEE689B6E7AD89E68EAAE696BDE38082E2809DE88EABE88DA3E8A1A8E7A4BAEFBC8CE4BB8EE5898DEFBC95E4B8AAE69C88E5B0B1E4B89AE8BF90E8A18CE68385E586B5E79C8BEFBC8CE68891E59BBDE4BB8AE5B9B4E5AE8CE585A8E58FAFE4BBA5E5AE9EE78EB0E2809CE59F8EE99587E696B0E5A29EE5B0B1E4B89AEFBC91EFBC91EFBC90EFBC90E4B887E4BABAE4BBA5E4B88AEFBC8CE59F8EE99587E8B083E69FA5E5A4B1E4B89AE78E87EFBC95EFBC8EEFBC95EFBC85E5B7A6E58FB3EFBC8CE59F8EE99587E799BBE8AEB0E5A4B1E4B89AE78E87EFBC94EFBC8EEFBC95EFBC85E4BBA5E58685E2809DE79A84E9A284E69C9FE79BAEE6A087EFBC8CE789A2E789A2E5AE88E4BD8FE5B0B1E4B89AE59FBAE69CACE99DA2EFBC8CE4BB8EE8808CE8AEA9E4BABFE4B887E799BEE5A793E2809CE9A5ADE7A297E2809DE7ABAFE5BE97E69BB4E7A8B3E38081E7BB8FE6B58EE5BA94E5AFB9E9A38EE999A9E5928CE68C91E68898E79A84E5BA95E6B094E69BB4E8B6B3E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE3808AE38080E4BABAE6B091E697A5E68AA5E38080E3808BEFBC88E38080EFBC92EFBC90EFBC91EFBC99E5B9B4EFBC90EFBC97E69C88EFBC90EFBC92E697A5E38080EFBC90EFBC91E38080E78988EFBC893C2F703E3C703E3C62722F3E3C2F703E, '/upload/20190702/f3d2f0d2d9f49f4aca7f3fbafde94f1c.jpg', '', '', '1', '0', '0', '0', '1', '0', '1', '0', '66', '0.00', '0', '1562044556', '1562588769');
INSERT INTO `kite_document_content` VALUES ('14', '15', '1', '1', '“中国神船”真要来了！南北船合并获确认，市值飙升超200亿', '', '', 0x3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE58D97E58C97E888B9E59088E5B9B6E7BB88E4BA8EE8A681E68890E4BA8BE5AE9EEFBC81EFBC97E69C88EFBC91E697A5E6999AE997B4EFBC8CE4B8ADE59BBDE9878DE5B7A5EFBC88EFBC96EFBC90EFBC91EFBC99EFBC98EFBC99EFBC89E38081E4B8ADE59BBDE6B5B7E998B2EFBC88EFBC96EFBC90EFBC90EFBC97EFBC96EFBC94EFBC89E38081E4B985E4B98BE6B48BEFBC88EFBC93EFBC90EFBC90EFBC95EFBC91EFBC96EFBC89E38081E4B8ADE59BBDE58AA8E58A9BEFBC88EFBC96EFBC90EFBC90EFBC94EFBC98EFBC92EFBC89E38081E4B8ADE59BBDE5BA94E680A5EFBC88EFBC93EFBC90EFBC90EFBC95EFBC92EFBC97EFBC89E38081E4B8ADE888B9E998B2E58AA1EFBC88EFBC96EFBC90EFBC90EFBC96EFBC98EFBC95EFBC89E38081E4B8ADE888B9E7A791E68A80EFBC88EFBC96EFBC90EFBC90EFBC90EFBC97EFBC92EFBC89E38081E4B8ADE59BBDE888B9E888B6EFBC88EFBC96EFBC90EFBC90EFBC91EFBC95EFBC90EFBC89E7AD89EFBC98E5AEB6E4B88AE5B882E585ACE58FB8E59D87E58F91E5B883E585ACE5918AEFBC8CE585ACE58FB8EFBC97E69C88EFBC91E697A5E68EA5E5AE9EE99985E68EA7E588B6E4BABAE9809AE79FA5EFBC8CE4B8ADE888B9E9878DE5B7A5E6ADA3E4B88EE4B8ADE59BBDE888B9E888B6E5B7A5E4B89AE99B86E59BA2E69C89E99990E585ACE58FB8E7ADB9E58892E68898E795A5E680A7E9878DE7BB84EFBC8CE69C89E585B3E696B9E6A188E5B09AE69CAAE7A1AEE5AE9AEFBC8CE696B9E6A188E4BAA6E99C80E88EB7E5BE97E79BB8E585B3E4B8BBE7AEA1E983A8E997A8E689B9E58786E380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE4BB8AE5B9B4EFBC95E69C88E4BBBDEFBC8CE4B8ADE888B9E9878DE5B7A5E5B0B1E58FACE5BC80E695B4E59088E9878DE7BB84E5B7A5E4BD9CE68EA8E8BF9BE4BC9AEFBC8CE7A7B0E5B086E4BB8EE8BF91E69C9FE5928CE995BFE8BF9CE58F91E5B195E79A84E8A792E5BAA6E695B4E4BD93E68EA8E58AA8E695B4E59088E9878DE7BB84E5B7A5E4BD9CE38082E4BB8AE5B9B4E4BA8CE5ADA3E5BAA6E4BBA5E69DA5EFBC8CE58D97E58C97E888B9E4BD93E7B3BBE8B584E69CACE8BF90E4BD9CE79A84E88A82E5A58FE6988EE698BEE58AA0E5BFABE380823C2F703E3C70207374796C653D22746578742D696E64656E743A2032656D3B20746578742D616C69676E3A206C6566743B223EE887AAEFBC96E69C88E4BBBDE4BBA5E69DA5EFBC8CE4B88AE8BFB0EFBC98E5AEB6E4B88AE5B882E585ACE58FB8E587A0E4B98EE585A8E983A8E4B88AE6B6A8EFBC8CE4BB85E4B8ADE59BBDE5BA94E680A5E587BAE78EB0E5B08FE5B985E4B88BE8B78CE38082E688AAE887B3EFBC97E69C88EFBC91E697A5EFBC8CEFBC98E5AEB6E4B88AE5B882E585ACE58FB8E680BBE5B882E580BCE4B8BAEFBC92EFBC95EFBC90EFBC91EFBC8EEFBC96EFBC96E4BABFE58583EFBC8CE8808CE59CA8E4B880E4B8AAE69C88E5898DEFBC88EFBC96E69C88EFBC91E697A5EFBC89EFBC98E5AEB6E59088E8AEA1E5B882E580BCE4B8BAEFBC92EFBC92EFBC99EFBC90EFBC8EEFBC92EFBC92E4BABFE58583EFBC8CE58DB3E4B880E4B8AAE69C88E697B6E997B4EFBC8CEFBC98E585ACE58FB8E5B882E580BCE9A399E58D87EFBC92EFBC91EFBC91EFBC8EEFBC94EFBC95E4BABFE58583E380823C2F703E3C703E3C62722F3E3C2F703E, '/upload/20190702/f388fc84054bc26fda1365f4b3866805.jpg', '/upload/20190703/a8980e7251c41bea937bfd351b2ed41c.rar', '', '1', '0', '0', '0', '1', '0', '0', '1', '38', '0.00', '0', '1562044681', '1562603442');
INSERT INTO `kite_document_content` VALUES ('20', '5', '1', '1', '图e', '', '', 0x3C703EE8808CE99D9EE59CB0E696B93C2F703E, null, '', '', '1', '0', '0', '0', '0', '0', '0', '0', '4', '0.00', '0', '1562139163', '1562601736');
INSERT INTO `kite_document_content` VALUES ('21', '5', '1', '1', '图e4342', '', '', 0x3C703EE8808CE99D9EE59CB0E696B93C2F703E, null, '', '', '1', '0', '0', '0', '0', '0', '0', '0', '5', '0.00', '0', '1562139208', '1562512579');
INSERT INTO `kite_document_content` VALUES ('22', '5', '1', '1', '222', '', '', 0x3C703E3232323C2F703E, null, '', '', '1', '0', '0', '0', '0', '0', '0', '0', '68', '0.00', '0', '1562389751', '1562593304');

-- ----------------------------
-- Table structure for kite_document_content_extra
-- ----------------------------
DROP TABLE IF EXISTS `kite_document_content_extra`;
CREATE TABLE `kite_document_content_extra` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文档内容自定义ID',
  `document_id` int(11) NOT NULL COMMENT '文档ID',
  `type` char(20) COLLATE utf8_bin NOT NULL COMMENT '字段内容类型',
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '字段名称',
  `variable` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '字段变量',
  `key` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '字段选项原始值',
  `value` text COLLATE utf8_bin DEFAULT NULL COMMENT '字段值',
  `create_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `document_id` (`document_id`) USING BTREE,
  KEY `variable` (`variable`) USING BTREE,
  KEY `key` (`key`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_document_content_extra
-- ----------------------------
INSERT INTO `kite_document_content_extra` VALUES ('1', '9', 'checkbox', '职位', 'zw', '3', 0xE7BE8EE69CAFE8AEBEE8AEA12C504850E5B7A5E7A88BE5B888, null, null);
INSERT INTO `kite_document_content_extra` VALUES ('2', '9', 'radio', '薪资待遇', 'dy', '2', 0x383030307E3130303030, null, null);
INSERT INTO `kite_document_content_extra` VALUES ('3', '9', 'radio', '工作地点', 'dd', '1', 0xE68890E983BD, null, null);
INSERT INTO `kite_document_content_extra` VALUES ('4', '5', 'text', '模板演示地址', 'ys', 'http://www.19981.com', 0x687474703A2F2F7777772E31393938312E636F6D, null, null);
INSERT INTO `kite_document_content_extra` VALUES ('5', '5', 'radio', '模板类型', 'type', '2', 0xE7A791E68A80, null, null);

-- ----------------------------
-- Table structure for kite_document_content_like
-- ----------------------------
DROP TABLE IF EXISTS `kite_document_content_like`;
CREATE TABLE `kite_document_content_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL COMMENT '文档ID',
  `like` tinyint(1) NOT NULL DEFAULT 0 COMMENT '[顶]',
  `unlike` tinyint(1) NOT NULL DEFAULT 0 COMMENT '[踩]',
  `ip` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '客户端IP',
  `create_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_document_content_like
-- ----------------------------
INSERT INTO `kite_document_content_like` VALUES ('1', '7', '0', '1', '127.0.0.1', '1561977096', '1561977096');
INSERT INTO `kite_document_content_like` VALUES ('2', '14', '0', '1', '127.0.0.1', '1562051682', '1562051682');

-- ----------------------------
-- Table structure for kite_document_field
-- ----------------------------
DROP TABLE IF EXISTS `kite_document_field`;
CREATE TABLE `kite_document_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '字段归类',
  `site_id` int(11) NOT NULL COMMENT '模型归属站点',
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '字段名称',
  `variable` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '字段列名',
  `type` char(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '字段类型',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '权重排序',
  `is_require` tinyint(1) DEFAULT 0 COMMENT '0 正常 1必填',
  `is_filter` tinyint(1) DEFAULT NULL COMMENT '0正常 1筛选条件',
  `option` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '字段内容选项',
  `description` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '描述',
  `regular` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '正则表达式',
  `msg` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '验证失败提示语',
  `create_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_document_field
-- ----------------------------
INSERT INTO `kite_document_field` VALUES ('1', '1', '1', '工作地点', 'dd', 'radio', '0', '0', '1', '1=成都\r\n2=绵阳\r\n3=重庆', '', '', '', '1561563781', '1562046255');
INSERT INTO `kite_document_field` VALUES ('2', '1', '1', '薪资待遇', 'dy', 'radio', '0', '0', '1', '1=5000~8000\r\n2=8000~10000\r\n3=大于10000', '', '', '', '1561563839', '1562065096');
INSERT INTO `kite_document_field` VALUES ('3', '1', '1', '职位', 'zw', 'checkbox', '0', '0', '1', '1=前台\r\n2=客服\r\n3=美术设计\r\n4=PHP工程师', '', '', '', '1561563949', '1562046262');
INSERT INTO `kite_document_field` VALUES ('4', '1', '1', '模板类型', 'type', 'radio', '0', '0', '1', '1=企业\r\n2=科技\r\n3=现代\r\n4=商业\r\n5=创意\r\n6=博客\r\n7=杂志\r\n8=营销\r\n9=单页\r\n10=政府\r\n11=多用途', '', '', '', '1561946863', '1561953848');
INSERT INTO `kite_document_field` VALUES ('5', '1', '1', '模板演示地址', 'ys', 'text', '0', '1', '0', '', '', '', '', '1562134771', '1562134771');

-- ----------------------------
-- Table structure for kite_document_model
-- ----------------------------
DROP TABLE IF EXISTS `kite_document_model`;
CREATE TABLE `kite_document_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `site_id` int(11) NOT NULL COMMENT '模型归属站点',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '模型名称',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 越小越靠前',
  `create_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_document_model
-- ----------------------------
INSERT INTO `kite_document_model` VALUES ('1', '1', '空模型', '1', '1541328594', '1561077574');
INSERT INTO `kite_document_model` VALUES ('2', '1', '空模型', '1', '1561563483', '1561563483');
INSERT INTO `kite_document_model` VALUES ('3', '1', '招聘模型', '2', '1561563667', '1561563961');
INSERT INTO `kite_document_model` VALUES ('4', '1', '产品模型', '3', '1561563677', '1561563677');
INSERT INTO `kite_document_model` VALUES ('5', '1', '模板模型', '2', '1561946081', '1562134800');

-- ----------------------------
-- Table structure for kite_document_model_field
-- ----------------------------
DROP TABLE IF EXISTS `kite_document_model_field`;
CREATE TABLE `kite_document_model_field` (
  `model_id` int(11) NOT NULL COMMENT '模型ID',
  `field_id` int(11) NOT NULL COMMENT '字段ID',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_document_model_field
-- ----------------------------
INSERT INTO `kite_document_model_field` VALUES ('3', '3', '0');
INSERT INTO `kite_document_model_field` VALUES ('3', '2', '1');
INSERT INTO `kite_document_model_field` VALUES ('3', '1', '2');
INSERT INTO `kite_document_model_field` VALUES ('5', '5', '0');
INSERT INTO `kite_document_model_field` VALUES ('5', '4', '1');

-- ----------------------------
-- Table structure for kite_feedback
-- ----------------------------
DROP TABLE IF EXISTS `kite_feedback`;
CREATE TABLE `kite_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `site_id` int(11) NOT NULL COMMENT '网站ID',
  `uid` int(11) DEFAULT NULL COMMENT '评论人mid ',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '反馈标题',
  `username` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '反馈者姓名',
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '反馈者邮箱',
  `phone` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '反馈者电话',
  `content` text COLLATE utf8_bin NOT NULL COMMENT '反馈内容',
  `reply` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 隐藏 1 显示',
  `create_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_feedback
-- ----------------------------
INSERT INTO `kite_feedback` VALUES ('1', '1', '2', '', '', null, '', 0x3131, '32322', '0', '1560851402', '1562211256');
INSERT INTO `kite_feedback` VALUES ('2', '1', '0', '', '', 'nsssh@163.com', '18780221108', 0xE59388E59388, null, '0', '1562213590', '1562213590');
INSERT INTO `kite_feedback` VALUES ('3', '1', '0', '', '', 'nsssh@163.com', '18780221108', 0xE59388E59388, null, '0', '1562213643', '1562213643');

-- ----------------------------
-- Table structure for kite_hooks
-- ----------------------------
DROP TABLE IF EXISTS `kite_hooks`;
CREATE TABLE `kite_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text DEFAULT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '类型',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `create_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kite_hooks
-- ----------------------------
INSERT INTO `kite_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '', '1', '1561561552', '1561561552');
INSERT INTO `kite_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '', '1', '1561561552', '1561561552');
INSERT INTO `kite_hooks` VALUES ('3', 'AdminIndex', '首页小格子个性化显示', '2', 'demo', '1', '1561561552', '1562602365');

-- ----------------------------
-- Table structure for kite_language
-- ----------------------------
DROP TABLE IF EXISTS `kite_language`;
CREATE TABLE `kite_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '语言名称',
  `icon` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '权重排序 越大越靠后',
  `designation` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_language
-- ----------------------------
INSERT INTO `kite_language` VALUES ('1', 'zh-cn', null, '1', '简体中文(中国) ');
INSERT INTO `kite_language` VALUES ('2', 'en-us', null, '2', '英语(美国) ');

-- ----------------------------
-- Table structure for kite_link
-- ----------------------------
DROP TABLE IF EXISTS `kite_link`;
CREATE TABLE `kite_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cid` int(11) DEFAULT 0 COMMENT '友情链接分类ID',
  `site_id` char(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '网站编号',
  `name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '网站名称',
  `url` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '网站地址',
  `logo` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'logo地址',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态： 0隐藏  1 显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_link
-- ----------------------------
INSERT INTO `kite_link` VALUES ('1', '1', '1', '袖珍书', 'http://www.xiuzhenshu.com', '', '1', '1');
INSERT INTO `kite_link` VALUES ('2', '1', '2', 'KiteCMS', 'https://www.19981.com', '', '0', '1');
INSERT INTO `kite_link` VALUES ('3', '1', '2', '风筝的Blog', 'http://www.kitesky.com', '', '2', '1');

-- ----------------------------
-- Table structure for kite_log
-- ----------------------------
DROP TABLE IF EXISTS `kite_log`;
CREATE TABLE `kite_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '操作类型',
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '操作内容',
  `ip` char(32) COLLATE utf8_bin DEFAULT NULL,
  `create_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=251 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_log
-- ----------------------------
INSERT INTO `kite_log` VALUES ('226', '1', null, null, null, '127.0.0.1', '1562047388');
INSERT INTO `kite_log` VALUES ('227', '1', null, null, null, '127.0.0.1', '1562052000');
INSERT INTO `kite_log` VALUES ('228', '1', null, null, null, '127.0.0.1', '1562113698');
INSERT INTO `kite_log` VALUES ('229', '1', null, null, null, '127.0.0.1', '1562116322');
INSERT INTO `kite_log` VALUES ('230', '1', null, null, null, '127.0.0.1', '1562132502');
INSERT INTO `kite_log` VALUES ('231', '1', null, null, null, '127.0.0.1', '1562132502');
INSERT INTO `kite_log` VALUES ('232', '1', null, null, null, '127.0.0.1', '1562132502');
INSERT INTO `kite_log` VALUES ('233', '1', null, null, null, '127.0.0.1', '1562132502');
INSERT INTO `kite_log` VALUES ('234', '1', null, null, null, '127.0.0.1', '1562132503');
INSERT INTO `kite_log` VALUES ('235', '1', null, null, null, '127.0.0.1', '1562132509');
INSERT INTO `kite_log` VALUES ('236', '1', null, null, null, '127.0.0.1', '1562132509');
INSERT INTO `kite_log` VALUES ('237', '1', null, null, null, '127.0.0.1', '1562132509');
INSERT INTO `kite_log` VALUES ('238', '1', null, null, null, '127.0.0.1', '1562132509');
INSERT INTO `kite_log` VALUES ('239', '1', null, null, null, '127.0.0.1', '1562149606');
INSERT INTO `kite_log` VALUES ('240', '1', null, null, null, '127.0.0.1', '1562209028');
INSERT INTO `kite_log` VALUES ('241', '1', null, null, null, '127.0.0.1', '1562326681');
INSERT INTO `kite_log` VALUES ('242', '1', null, null, null, '127.0.0.1', '1562483144');
INSERT INTO `kite_log` VALUES ('243', '1', null, null, null, '127.0.0.1', '1562549523');
INSERT INTO `kite_log` VALUES ('244', '1', null, null, null, '127.0.0.1', '1562596638');
INSERT INTO `kite_log` VALUES ('245', '2', null, null, null, '127.0.0.1', '1562598218');
INSERT INTO `kite_log` VALUES ('246', '1', null, null, null, '127.0.0.1', '1562598260');
INSERT INTO `kite_log` VALUES ('247', '1', null, null, null, '127.0.0.1', '1562598364');
INSERT INTO `kite_log` VALUES ('248', '2', null, null, null, '127.0.0.1', '1562603304');
INSERT INTO `kite_log` VALUES ('249', '1', null, null, null, '127.0.0.1', '1562603322');
INSERT INTO `kite_log` VALUES ('250', '1', null, null, null, '127.0.0.1', '1562768878');

-- ----------------------------
-- Table structure for kite_message
-- ----------------------------
DROP TABLE IF EXISTS `kite_message`;
CREATE TABLE `kite_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '信息编号',
  `site_id` int(11) NOT NULL COMMENT '网站ID',
  `type` tinyint(1) NOT NULL COMMENT '信息类型 1 系统消息 2 短信 3 邮件',
  `subject` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '信息标题',
  `body` text COLLATE utf8_bin DEFAULT NULL COMMENT '信息内容',
  `code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '动态码',
  `mid` int(11) DEFAULT NULL COMMENT '系统消息接收人mid',
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '邮件消息接收人email',
  `phone` char(11) COLLATE utf8_bin DEFAULT NULL COMMENT '短信接收人手机号码',
  `send_status` varchar(255) COLLATE utf8_bin NOT NULL COMMENT ' success 发送成功  fail 发送失败',
  `send_error` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '错误代码',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 正常 1 失效',
  `create_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_message
-- ----------------------------

-- ----------------------------
-- Table structure for kite_navigation
-- ----------------------------
DROP TABLE IF EXISTS `kite_navigation`;
CREATE TABLE `kite_navigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT 0 COMMENT '导航分类ID',
  `cat_id` int(11) NOT NULL COMMENT '文章栏目分类ID',
  `pid` int(11) NOT NULL DEFAULT 0,
  `site_id` char(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '网站编号',
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单URL',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 栏目 2自定义URL',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_navigation
-- ----------------------------
INSERT INTO `kite_navigation` VALUES ('26', '1', '15', '0', '1', '新闻', '', '1', '2', '1562046143', '1562055588');
INSERT INTO `kite_navigation` VALUES ('27', '1', '16', '0', '1', '产品', '', '1', '3', '1562046144', '1562055588');
INSERT INTO `kite_navigation` VALUES ('28', '1', '17', '0', '1', '招聘', '', '1', '4', '1562046144', '1562055630');
INSERT INTO `kite_navigation` VALUES ('29', '1', '18', '0', '1', '公司介绍', '', '1', '1', '1562055562', '1562055588');
INSERT INTO `kite_navigation` VALUES ('30', '1', '0', '0', '1', '首页', 'http://www.19981.com', '2', '0', '1562055585', '1562055585');
INSERT INTO `kite_navigation` VALUES ('31', '1', '0', '0', '1', '系统下载', 'http://www.19981.com', '2', '5', '1562055627', '1562055630');
INSERT INTO `kite_navigation` VALUES ('32', '1', '5', '0', '1', '服务项目', '', '1', '0', '1562392984', '1562392984');

-- ----------------------------
-- Table structure for kite_order
-- ----------------------------
DROP TABLE IF EXISTS `kite_order`;
CREATE TABLE `kite_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `uid` int(11) NOT NULL COMMENT '购买者UID',
  `document_id` int(11) NOT NULL COMMENT '商品ID',
  `trade_no` char(32) DEFAULT '' COMMENT '支付交易单号',
  `out_trade_no` char(32) DEFAULT '' COMMENT '订单编号',
  `total_amount` varchar(8) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `payment_type` tinyint(1) DEFAULT 0 COMMENT '0 未支付 1支付宝 2微信',
  `status` int(1) DEFAULT 0 COMMENT '0 待付款 1 已经付款 2退款 ',
  `create_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kite_order
-- ----------------------------
INSERT INTO `kite_order` VALUES ('56', '1', '1', '8', '', '2019062954975655', '0.10', '0', '0', '1561802694', '1561802694');
INSERT INTO `kite_order` VALUES ('57', '1', '1', '8', '', '2019062955981015', '0.10', '0', '0', '1561802695', '1561802695');
INSERT INTO `kite_order` VALUES ('58', '1', '1', '8', '', '2019062910110056', '0.10', '0', '0', '1561802702', '1561802702');
INSERT INTO `kite_order` VALUES ('59', '1', '1', '8', '', '2019062952505310', '0.10', '0', '0', '1561802724', '1561802724');
INSERT INTO `kite_order` VALUES ('60', '1', '1', '8', '', '2019062955511015', '0.10', '0', '0', '1561802807', '1561802807');
INSERT INTO `kite_order` VALUES ('61', '1', '1', '8', '', '2019062956991025', '0.10', '0', '0', '1561802808', '1561802808');
INSERT INTO `kite_order` VALUES ('62', '1', '1', '8', '', '2019062952555150', '0.10', '0', '0', '1561802836', '1561802836');
INSERT INTO `kite_order` VALUES ('63', '1', '1', '8', '', '2019062955565397', '0.10', '0', '0', '1561802839', '1561802839');
INSERT INTO `kite_order` VALUES ('64', '1', '1', '8', '', '2019062949100535', '0.10', '0', '0', '1561802865', '1561802865');
INSERT INTO `kite_order` VALUES ('65', '1', '1', '8', '', '2019062910256541', '0.10', '0', '0', '1561802927', '1561802927');
INSERT INTO `kite_order` VALUES ('66', '1', '1', '8', '', '2019062952101485', '0.10', '0', '0', '1561803364', '1561803364');
INSERT INTO `kite_order` VALUES ('67', '1', '1', '8', '', '2019062953565048', '0.10', '0', '0', '1561803381', '1561803381');
INSERT INTO `kite_order` VALUES ('68', '1', '1', '8', '', '2019062999100574', '0.10', '0', '0', '1561803388', '1561803388');
INSERT INTO `kite_order` VALUES ('69', '1', '1', '8', '', '2019062954551005', '0.10', '0', '0', '1561803398', '1561803398');
INSERT INTO `kite_order` VALUES ('70', '1', '1', '8', '', '2019062998102485', '0.10', '0', '0', '1561803691', '1561803691');
INSERT INTO `kite_order` VALUES ('71', '1', '1', '8', '', '2019062952481029', '0.10', '0', '0', '1561803812', '1561803812');
INSERT INTO `kite_order` VALUES ('72', '1', '1', '8', '', '2019062950511014', '0.10', '0', '0', '1561803842', '1561803842');
INSERT INTO `kite_order` VALUES ('73', '1', '1', '8', '', '2019062953485655', '0.10', '0', '0', '1561803893', '1561803893');
INSERT INTO `kite_order` VALUES ('74', '1', '1', '8', '', '2019062954985648', '0.10', '0', '0', '1561803894', '1561803894');
INSERT INTO `kite_order` VALUES ('75', '1', '1', '8', '', '2019062954529949', '0.10', '0', '0', '1561804118', '1561804118');
INSERT INTO `kite_order` VALUES ('76', '1', '1', '8', '', '2019062949505799', '0.10', '0', '0', '1561804129', '1561804129');
INSERT INTO `kite_order` VALUES ('77', '1', '1', '8', '', '2019062954985410', '0.10', '0', '0', '1561804806', '1561804806');
INSERT INTO `kite_order` VALUES ('78', '1', '1', '8', '', '2019062954535699', '0.10', '0', '0', '1561810470', '1561810470');
INSERT INTO `kite_order` VALUES ('80', '1', '1', '5', '', '2019070351515110', '0.00', '0', '0', '1562128307', '1562128307');
INSERT INTO `kite_order` VALUES ('81', '1', '1', '5', '', '2019070351491021', '0.10', '0', '0', '1562128531', '1562128531');
INSERT INTO `kite_order` VALUES ('82', '1', '1', '5', '', '2019070398975055', '0.10', '0', '0', '1562132923', '1562132923');
INSERT INTO `kite_order` VALUES ('83', '1', '1', '5', '', '2019070310299100', '0.10', '0', '0', '1562134687', '1562134687');
INSERT INTO `kite_order` VALUES ('84', '1', '1', '8', '', '2019070810057555', '0.10', '0', '0', '1562552477', '1562552477');
INSERT INTO `kite_order` VALUES ('85', '1', '1', '8', '', '2019070810252544', '0.10', '0', '0', '1562552511', '1562552511');
INSERT INTO `kite_order` VALUES ('86', '1', '1', '8', '', '2019070853535298', '0.10', '0', '0', '1562552565', '1562552565');
INSERT INTO `kite_order` VALUES ('87', '1', '1', '8', '', '2019070897519956', '0.10', '0', '0', '1562552570', '1562552570');
INSERT INTO `kite_order` VALUES ('88', '1', '1', '8', '', '2019070810050101', '0.10', '0', '0', '1562552573', '1562552573');
INSERT INTO `kite_order` VALUES ('89', '1', '1', '8', '', '2019070810297975', '0.10', '0', '0', '1562552591', '1562552591');
INSERT INTO `kite_order` VALUES ('90', '1', '1', '8', '', '2019070851991025', '0.10', '0', '0', '1562552595', '1562552595');
INSERT INTO `kite_order` VALUES ('91', '1', '1', '8', '', '2019070855505055', '0.10', '0', '0', '1562552647', '1562552647');
INSERT INTO `kite_order` VALUES ('92', '1', '1', '8', '', '2019070857101102', '0.10', '0', '0', '1562552649', '1562552649');
INSERT INTO `kite_order` VALUES ('93', '1', '1', '8', '', '2019070810049561', '0.10', '0', '0', '1562552653', '1562552653');
INSERT INTO `kite_order` VALUES ('94', '1', '1', '8', '', '2019070810098481', '0.10', '0', '0', '1562552653', '1562552653');
INSERT INTO `kite_order` VALUES ('95', '1', '1', '8', '', '2019070898491025', '0.10', '0', '0', '1562552667', '1562552667');
INSERT INTO `kite_order` VALUES ('96', '1', '1', '8', '', '2019070810252499', '0.10', '0', '0', '1562552671', '1562552671');
INSERT INTO `kite_order` VALUES ('97', '1', '1', '8', '', '2019070850544950', '0.10', '0', '0', '1562552674', '1562552674');
INSERT INTO `kite_order` VALUES ('98', '1', '1', '8', '', '2019070856102484', '0.10', '0', '0', '1562556232', '1562556232');
INSERT INTO `kite_order` VALUES ('99', '1', '1', '7', '', '2019070851511019', '0.00', '0', '0', '1562556243', '1562556243');
INSERT INTO `kite_order` VALUES ('100', '1', '1', '7', '', '2019070853484997', '0.00', '0', '0', '1562556245', '1562556245');
INSERT INTO `kite_order` VALUES ('101', '1', '1', '7', '', '2019070810010099', '0.00', '0', '0', '1562556253', '1562556253');
INSERT INTO `kite_order` VALUES ('102', '1', '1', '7', '', '2019070855519910', '0.00', '0', '0', '1562556295', '1562556295');
INSERT INTO `kite_order` VALUES ('103', '1', '1', '8', '', '2019070856494999', '0.10', '0', '0', '1562556296', '1562556296');
INSERT INTO `kite_order` VALUES ('104', '1', '1', '8', '', '2019070857569853', '0.10', '0', '0', '1562556297', '1562556297');
INSERT INTO `kite_order` VALUES ('105', '1', '1', '8', '', '2019070854995557', '0.10', '0', '0', '1562561702', '1562561702');
INSERT INTO `kite_order` VALUES ('106', '1', '1', '8', '', '2019070855974957', '0.10', '0', '0', '1562561703', '1562561703');
INSERT INTO `kite_order` VALUES ('107', '1', '1', '8', '', '2019070898575049', '0.10', '0', '0', '1562561739', '1562561739');
INSERT INTO `kite_order` VALUES ('108', '1', '1', '8', '', '2019070857561021', '0.10', '0', '0', '1562561769', '1562561769');
INSERT INTO `kite_order` VALUES ('109', '1', '1', '8', '', '2019070899551001', '0.10', '0', '0', '1562561788', '1562561788');
INSERT INTO `kite_order` VALUES ('110', '1', '1', '8', '', '2019070810148979', '0.10', '0', '0', '1562561790', '1562561790');
INSERT INTO `kite_order` VALUES ('111', '1', '1', '8', '', '2019070853971011', '0.10', '0', '0', '1562561829', '1562561829');
INSERT INTO `kite_order` VALUES ('112', '1', '1', '8', '', '2019070855515356', '0.10', '0', '0', '1562561831', '1562561831');
INSERT INTO `kite_order` VALUES ('113', '1', '1', '8', '', '2019070899561015', '0.10', '0', '0', '1562561884', '1562561884');
INSERT INTO `kite_order` VALUES ('114', '1', '1', '8', '', '2019070850555657', '0.10', '0', '0', '1562561890', '1562561890');
INSERT INTO `kite_order` VALUES ('115', '1', '1', '8', '', '2019070810256100', '0.10', '0', '0', '1562561919', '1562561919');
INSERT INTO `kite_order` VALUES ('116', '1', '1', '8', '', '2019070853564857', '0.10', '0', '0', '1562562053', '1562562053');
INSERT INTO `kite_order` VALUES ('117', '1', '1', '8', '', '2019070852505698', '0.10', '0', '0', '1562562100', '1562562100');
INSERT INTO `kite_order` VALUES ('118', '1', '1', '8', '', '2019070851481015', '0.10', '0', '0', '1562562131', '1562562131');
INSERT INTO `kite_order` VALUES ('119', '1', '1', '8', '', '2019070899985549', '0.10', '0', '0', '1562562156', '1562562156');
INSERT INTO `kite_order` VALUES ('120', '1', '1', '8', '', '2019070810098509', '0.10', '0', '0', '1562562157', '1562562157');
INSERT INTO `kite_order` VALUES ('121', '1', '1', '8', '', '2019070810056549', '0.10', '0', '0', '1562562173', '1562562173');
INSERT INTO `kite_order` VALUES ('122', '1', '1', '8', '', '2019070850100499', '0.10', '0', '0', '1562562194', '1562562194');
INSERT INTO `kite_order` VALUES ('123', '1', '1', '8', '', '2019070853985099', '0.10', '0', '0', '1562562213', '1562562213');
INSERT INTO `kite_order` VALUES ('124', '1', '1', '8', '', '2019070855102495', '0.10', '0', '0', '1562562215', '1562562215');
INSERT INTO `kite_order` VALUES ('125', '1', '1', '8', '', '2019070855504849', '0.10', '0', '0', '1562562263', '1562562263');
INSERT INTO `kite_order` VALUES ('126', '1', '1', '8', '', '2019070897579952', '0.10', '0', '0', '1562562266', '1562562266');
INSERT INTO `kite_order` VALUES ('127', '1', '1', '8', '', '2019070810210150', '0.10', '0', '0', '1562562495', '1562562495');
INSERT INTO `kite_order` VALUES ('128', '1', '1', '8', '', '2019070850535257', '0.10', '0', '0', '1562562754', '1562562754');
INSERT INTO `kite_order` VALUES ('129', '1', '1', '8', '', '2019070851989848', '0.10', '0', '0', '1562562755', '1562562755');
INSERT INTO `kite_order` VALUES ('130', '1', '1', '8', '', '2019070854505649', '0.10', '0', '0', '1562562758', '1562562758');
INSERT INTO `kite_order` VALUES ('131', '1', '1', '8', '', '2019070856551029', '0.10', '0', '0', '1562562792', '1562562792');
INSERT INTO `kite_order` VALUES ('132', '1', '1', '8', '', '2019070849555552', '0.10', '0', '0', '1562562801', '1562562801');
INSERT INTO `kite_order` VALUES ('133', '1', '1', '8', '', '2019070855515697', '0.10', '0', '0', '1562562807', '1562562807');
INSERT INTO `kite_order` VALUES ('134', '1', '1', '8', '', '2019070848100544', '0.10', '0', '0', '1562562848', '1562562848');
INSERT INTO `kite_order` VALUES ('135', '1', '1', '8', '', '2019070852549997', '0.10', '0', '0', '1562562852', '1562562852');
INSERT INTO `kite_order` VALUES ('136', '1', '1', '8', '', '2019070810254491', '0.10', '0', '0', '1562562863', '1562562863');
INSERT INTO `kite_order` VALUES ('137', '1', '1', '8', '', '2019070853555210', '0.10', '0', '0', '1562562869', '1562562869');
INSERT INTO `kite_order` VALUES ('138', '1', '1', '8', '', '2019070854535410', '0.10', '0', '0', '1562562870', '1562562870');
INSERT INTO `kite_order` VALUES ('139', '1', '1', '8', '', '2019070855100509', '0.10', '0', '0', '1562562871', '1562562871');
INSERT INTO `kite_order` VALUES ('140', '1', '1', '8', '', '2019070852579797', '0.10', '0', '0', '1562562884', '1562562884');
INSERT INTO `kite_order` VALUES ('141', '1', '1', '8', '', '2019070856101565', '0.10', '0', '0', '1562562888', '1562562888');
INSERT INTO `kite_order` VALUES ('142', '1', '1', '8', '', '2019070854541005', '0.10', '0', '0', '1562562966', '1562562966');

-- ----------------------------
-- Table structure for kite_score
-- ----------------------------
DROP TABLE IF EXISTS `kite_score`;
CREATE TABLE `kite_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分记录编号',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `sum` int(11) NOT NULL COMMENT '剩余总数',
  `score` int(11) DEFAULT 0 COMMENT '积分数量',
  `source` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '获取原因',
  `create_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_score
-- ----------------------------
INSERT INTO `kite_score` VALUES ('82', '1', '1', '504', '10', 'login_score', '1562379319', '1562379319');
INSERT INTO `kite_score` VALUES ('83', '1', '1', '514', '10', 'publish_score', '1562389751', '1562389751');
INSERT INTO `kite_score` VALUES ('84', '1', '1', '524', '10', 'publish_score', '1562391504', '1562391504');
INSERT INTO `kite_score` VALUES ('85', '1', '1', '534', '10', 'login_score', '1562482963', '1562482963');
INSERT INTO `kite_score` VALUES ('86', '1', '1', '544', '10', 'login_score', '1562552252', '1562552252');
INSERT INTO `kite_score` VALUES ('87', '1', '1', '554', '10', 'login_score', '1562593299', '1562593299');
INSERT INTO `kite_score` VALUES ('88', '1', '1', '564', '10', 'login_score', '1562595371', '1562595371');
INSERT INTO `kite_score` VALUES ('89', '1', '2', '10', '10', 'login_score', '1562595407', '1562595407');
INSERT INTO `kite_score` VALUES ('90', '1', '2', '20', '10', 'login_score', '1562595755', '1562595755');
INSERT INTO `kite_score` VALUES ('91', '1', '2', '30', '10', 'login_score', '1562595833', '1562595833');
INSERT INTO `kite_score` VALUES ('92', '1', '1', '574', '10', 'login_score', '1562596211', '1562596211');
INSERT INTO `kite_score` VALUES ('93', '1', '2', '40', '10', 'login_score', '1562596466', '1562596466');
INSERT INTO `kite_score` VALUES ('94', '1', '1', '584', '10', 'login_score', '1562597674', '1562597674');
INSERT INTO `kite_score` VALUES ('95', '1', '2', '50', '10', 'login_score', '1562600533', '1562600533');

-- ----------------------------
-- Table structure for kite_site
-- ----------------------------
DROP TABLE IF EXISTS `kite_site`;
CREATE TABLE `kite_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '网站SID',
  `name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '站点名称',
  `logo` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT 'LOGO',
  `domain` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '站点绑定域名',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序 越小越靠前',
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '站点标题',
  `keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '站点关键词',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '站点描述',
  `theme` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '模板名称',
  `copyright` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '版权信息',
  `icp` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'ICP备案号',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 正常 1关闭',
  `create_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `site_name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_site
-- ----------------------------
INSERT INTO `kite_site` VALUES ('1', '默认站点', '/upload/20190702/61126f8e5831cadc75aacf845122c8a8.png', 'http://f.19981.com', '0', '默认站点', '默认站点', '默认站点', 'compact', 'Copyright © 2019 19981.com. All Right Reserved.', '蜀ICP备12004586号-2', '0', '1541387367', '1562552217');
INSERT INTO `kite_site` VALUES ('2', '测试站点', '', 'http://doc.19981.com', '0', '', '', '', 'clumb', '', '', '0', '1562135923', '1562135923');

-- ----------------------------
-- Table structure for kite_site_config
-- ----------------------------
DROP TABLE IF EXISTS `kite_site_config`;
CREATE TABLE `kite_site_config` (
  `site_id` int(11) NOT NULL COMMENT '网站ID',
  `k` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '键名',
  `v` text COLLATE utf8_bin DEFAULT NULL COMMENT '键值',
  `create_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) DEFAULT NULL COMMENT '更新时间',
  KEY `key` (`k`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_site_config
-- ----------------------------
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_publish_document', 0x30, '1529499606', '1529499606');
INSERT INTO `kite_site_config` VALUES ('1', 'register_score', 0x313030, '1529499198', '1529499198');
INSERT INTO `kite_site_config` VALUES ('1', 'login_score', 0x3130, '1529499387', '1529499387');
INSERT INTO `kite_site_config` VALUES ('1', 'publish_score', 0x3130, '1529499540', '1529499540');
INSERT INTO `kite_site_config` VALUES ('1', 'comment_score', 0x2D35, '1529499606', '1529499606');
INSERT INTO `kite_site_config` VALUES ('1', 'upload_type', 0x6C6F63616C, '1529499606', '1529499606');
INSERT INTO `kite_site_config` VALUES ('1', 'upload_size', 0x6A70672C706E672C676966, '1529499606', '1529499606');
INSERT INTO `kite_site_config` VALUES ('1', 'upload_ext', 0x6A70672C706E672C676966, '1529499606', '1529499606');
INSERT INTO `kite_site_config` VALUES ('1', 'upload_path', 0x75706C6F6164, '1529499606', '1529499606');
INSERT INTO `kite_site_config` VALUES ('1', 'alioss_key', 0x34483543346A5162784241736277796531, '1529499606', '1529499606');
INSERT INTO `kite_site_config` VALUES ('1', 'alioss_secret', 0x5535426539564C5A437079386F436F377354515343713830367377714756, '1529499606', '1529499606');
INSERT INTO `kite_site_config` VALUES ('1', 'alioss_endpoint', 0x6F73732D636E2D7368656E7A68656E2E616C6979756E63732E636F6D, '1529499606', '1529499606');
INSERT INTO `kite_site_config` VALUES ('1', 'alioss_bucket', 0x6B697465736B79, '1529499606', '1529499606');
INSERT INTO `kite_site_config` VALUES ('1', 'qiniu_ak', 0x3956577A66316A6953336745414C42695F587477454C4861487A484A49654358453557344B744A74, '1530071701', '1530071701');
INSERT INTO `kite_site_config` VALUES ('1', 'qiniu_sk', 0x54474E6432317877662D794847576E3346774E3337666B5257704F7A7A4D685843356A4566677238, '1530071701', '1530071701');
INSERT INTO `kite_site_config` VALUES ('1', 'qiniu_bucket', 0x6B697465736B79, '1530071701', '1530071701');
INSERT INTO `kite_site_config` VALUES ('1', 'qiniu_domain', 0x687474703A2F2F6F6E7872386D7438792E626B742E636C6F7564646E2E636F6D, '1530071701', '1530071701');
INSERT INTO `kite_site_config` VALUES ('1', 'link_category', 0x5B7B226E616D65223A22E69687E5AD97E993BEE68EA5222C22736F7274223A2231222C226964223A317D2C7B226E616D65223A223232222C22736F7274223A223232222C226964223A327D2C7B226E616D65223A22333333222C22736F7274223A22333333222C226964223A337D5D, '1531141510', '1531141510');
INSERT INTO `kite_site_config` VALUES ('1', 'slider_category', 0x5B5D, '1531147967', '1531147967');
INSERT INTO `kite_site_config` VALUES ('1', 'field_category', 0x5B7B226E616D65223A22E6A8A1E69DBFE7B1BB222C22736F7274223A2231222C226964223A317D5D, '1531147967', '1531147967');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useZh', 0x30, '1531213657', '1531213657');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useImgBg', 0x30, '1531213657', '1531213657');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_fontSize', 0x3234, '1531213657', '1531213657');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_imageH', 0x3430, '1531213657', '1531213657');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_imageW', 0x323030, '1531213657', '1531213657');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_length', 0x34, '1531213657', '1531213657');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_member_register', 0x30, '1531213657', '1531213657');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_member_login', 0x30, '1531213657', '1531213657');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_publish_comment', 0x30, '1531213657', '1531213657');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_publish_feedback', 0x30, '1531213657', '1531213657');
INSERT INTO `kite_site_config` VALUES ('1', 'water_logo', 0x2F7075626C69632F7374617469632F61646D696E2F646973742F696D672F6E6F7069632E706E67, '1531213845', '1531213845');
INSERT INTO `kite_site_config` VALUES ('1', 'water_position', 0x39, '1531213845', '1531213845');
INSERT INTO `kite_site_config` VALUES ('1', 'water_quality', 0x3830, '1531213845', '1531213845');
INSERT INTO `kite_site_config` VALUES ('1', 'water_status', 0x30, '1531213845', '1531213845');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useCurve', 0x30, '1531217269', '1531217269');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useNoise', 0x30, '1531217269', '1531217269');
INSERT INTO `kite_site_config` VALUES ('1', 'sms_type', 0x6479736D73, '1531371550', '1531371550');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key', '', '1531371550', '1531371550');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key_secret', '', '1531371550', '1531371550');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_sign_name', '', '1531371550', '1531371550');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_template_code', '', '1531371550', '1531371550');
INSERT INTO `kite_site_config` VALUES ('1', 'email_host', 0x736D74702E3136332E636F6D, '1531378668', '1531378668');
INSERT INTO `kite_site_config` VALUES ('1', 'email_port', 0x343635313332, '1531378668', '1531378668');
INSERT INTO `kite_site_config` VALUES ('1', 'email_username', 0x6E73737368, '1531378668', '1531378668');
INSERT INTO `kite_site_config` VALUES ('1', 'email_password', 0x77616E677A68656E67, '1531378668', '1531378668');
INSERT INTO `kite_site_config` VALUES ('1', 'member_register', 0x30, '1531378916', '1531378916');
INSERT INTO `kite_site_config` VALUES ('1', 'email_from_email', 0x6E73737368403136332E636F6D, '1531383066', '1531383066');
INSERT INTO `kite_site_config` VALUES ('1', 'email_from_name', 0x4B697465434D53, '1531383066', '1531383066');
INSERT INTO `kite_site_config` VALUES ('1', 'block_category', 0x5B5D, '1531981998', '1531981998');
INSERT INTO `kite_site_config` VALUES ('1', 'upload_image_ext', 0x6A70672C706E672C676966, '1532327020', '1532327020');
INSERT INTO `kite_site_config` VALUES ('1', 'upload_image_size', 0x32303438, '1532327020', '1532327020');
INSERT INTO `kite_site_config` VALUES ('1', 'upload_video_ext', 0x726D2C726D76622C776D762C3367702C6D70342C6D6F762C6176692C666C76, '1532327020', '1532327020');
INSERT INTO `kite_site_config` VALUES ('1', 'upload_video_size', 0x3130323430, '1532327020', '1532327020');
INSERT INTO `kite_site_config` VALUES ('1', 'upload_attach_ext', 0x646F632C786C732C7261722C7A69702C377A, '1532327020', '1532327020');
INSERT INTO `kite_site_config` VALUES ('1', 'upload_attach_size', 0x3130323430, '1532327020', '1532327020');
INSERT INTO `kite_site_config` VALUES ('1', 'navigation_category', 0x5B7B226E616D65223A22E9A1B6E983A8E5AFBCE888AA222C22736F7274223A2231222C226964223A317D2C7B226E616D65223A22E5BA95E983A8E5AFBCE888AA222C22736F7274223A2232222C226964223A327D5D, '1532675827', '1532675827');
INSERT INTO `kite_site_config` VALUES ('1', 'email_code_template', 0xE5B08AE695ACE79A84E4BC9AE59198247B757365726E616D657D20EFBC8CE682A8E69CACE6ACA1E79A84E9AA8CE8AF81E7A081E4B8BAEFBC9A247B636F64657D20EFBC8CE9AA8CE8AF81E7A081E59CA835E58886E9929FE58685E69C89E69588E38082, '1532856848', '1532856848');
INSERT INTO `kite_site_config` VALUES ('1', 'email_register_template', 0xE5B08AE695ACE79A84E4BC9AE59198247B757365726E616D657D20EFBC8CE682A8E5B7B2E7BB8FE68890E58A9FE6B3A8E5868CEFBC8CE8AFB7E8B0A8E8AEB0E682A8E79A84E794A8E688B7E5908DE58F8AE5AF86E7A081E38082, '1532856848', '1532856848');
INSERT INTO `kite_site_config` VALUES ('1', 'send_email_register', 0x30, '1532856848', '1532856848');
INSERT INTO `kite_site_config` VALUES ('2', 'field_category', 0x5B7B226E616D65223A22636D73222C22736F7274223A2231222C226964223A317D2C7B226E616D65223A22E4BAA7E59381222C22736F7274223A2232222C226964223A327D5D, '1541487138', '1541487138');
INSERT INTO `kite_site_config` VALUES ('2', 'slider_category', null, '1548224151', '1548224151');
INSERT INTO `kite_site_config` VALUES ('2', 'link_category', 0x5B7B226E616D65223A22E5BA95E983A8E993BEE68EA5222C22736F7274223A2231222C226964223A317D5D, '1548224152', '1548224152');
INSERT INTO `kite_site_config` VALUES ('2', 'block_category', 0x5B7B226E616D65223A2254455354222C22736F7274223A2231222C226964223A317D5D, '1548224152', '1548224152');
INSERT INTO `kite_site_config` VALUES ('2', 'register_score', 0x313030, '1548224155', '1548224155');
INSERT INTO `kite_site_config` VALUES ('2', 'login_score', 0x31, '1548224155', '1548224155');
INSERT INTO `kite_site_config` VALUES ('2', 'publish_score', 0x3130, '1548224155', '1548224155');
INSERT INTO `kite_site_config` VALUES ('2', 'comment_score', 0x35, '1548224156', '1548224156');
INSERT INTO `kite_site_config` VALUES ('2', 'email_host', 0x736D74702E3136332E636F6D, '1548224167', '1548224167');
INSERT INTO `kite_site_config` VALUES ('2', 'email_port', 0x343635, '1548224167', '1548224167');
INSERT INTO `kite_site_config` VALUES ('2', 'email_username', 0x6B697465333635, '1548224167', '1548224167');
INSERT INTO `kite_site_config` VALUES ('2', 'email_password', 0x77616E677A68656E67, '1548224167', '1548224167');
INSERT INTO `kite_site_config` VALUES ('2', 'email_from_email', 0x6B697465406B697465736B792E636F6D, '1548224167', '1548224167');
INSERT INTO `kite_site_config` VALUES ('2', 'email_from_name', 0x4B697465434D53, '1548224167', '1548224167');
INSERT INTO `kite_site_config` VALUES ('2', 'email_code_template', 0xE5B08AE695ACE79A84E4BC9AE59198247B757365726E616D657D20EFBC8CE682A8E69CACE6ACA1E79A84E9AA8CE8AF81E7A081E4B8BAEFBC9A247B636F64657D20EFBC8CE9AA8CE8AF81E7A081E59CA835E58886E9929FE58685E69C89E69588E38082, '1548224167', '1548224167');
INSERT INTO `kite_site_config` VALUES ('2', 'email_register_template', 0xE5B08AE695ACE79A84E4BC9AE59198247B757365726E616D657D20EFBC8CE682A8E5B7B2E7BB8FE68890E58A9FE6B3A8E5868CEFBC8CE8AFB7E8B0A8E8AEB0E682A8E79A84E794A8E688B7E5908DE58F8AE5AF86E7A081E38082, '1548224167', '1548224167');
INSERT INTO `kite_site_config` VALUES ('2', 'send_email_register', 0x30, '1548224167', '1548224167');
INSERT INTO `kite_site_config` VALUES ('2', 'upload_type', 0x6C6F63616C, '1548224168', '1548224168');
INSERT INTO `kite_site_config` VALUES ('2', 'upload_image_ext', 0x6A70672C706E672C676966, '1548224168', '1548224168');
INSERT INTO `kite_site_config` VALUES ('2', 'upload_image_size', 0x32303430303030, '1548224168', '1548224168');
INSERT INTO `kite_site_config` VALUES ('2', 'upload_video_ext', 0x726D2C726D76622C776D762C3367702C6D70342C6D6F762C6176692C666C76, '1548224168', '1548224168');
INSERT INTO `kite_site_config` VALUES ('2', 'upload_video_size', 0x32303430303030, '1548224168', '1548224168');
INSERT INTO `kite_site_config` VALUES ('2', 'upload_attach_ext', 0x646F632C786C732C7261722C7A6970, '1548224168', '1548224168');
INSERT INTO `kite_site_config` VALUES ('2', 'upload_attach_size', 0x32303430303030, '1548224168', '1548224168');
INSERT INTO `kite_site_config` VALUES ('2', 'upload_path', 0x75706C6F6164, '1548224168', '1548224168');
INSERT INTO `kite_site_config` VALUES ('2', 'alioss_key', 0x34483543346A51627842417362777965, '1548224168', '1548224168');
INSERT INTO `kite_site_config` VALUES ('2', 'alioss_secret', 0x5535426539564C5A437079386F436F377354515343713830367377714756, '1548224168', '1548224168');
INSERT INTO `kite_site_config` VALUES ('2', 'alioss_endpoint', 0x6F73732D636E2D7368656E7A68656E2E616C6979756E63732E636F6D, '1548224168', '1548224168');
INSERT INTO `kite_site_config` VALUES ('2', 'alioss_bucket', 0x6B697465736B79, '1548224168', '1548224168');
INSERT INTO `kite_site_config` VALUES ('2', 'qiniu_ak', 0x3956577A66316A6953336745414C42695F587477454C4861487A484A49654358453557344B744A74, '1548224168', '1548224168');
INSERT INTO `kite_site_config` VALUES ('2', 'qiniu_sk', 0x794847576E3346774E3337666B5257704F7A7A4D685843356A4566677238, '1548224168', '1548224168');
INSERT INTO `kite_site_config` VALUES ('2', 'qiniu_bucket', 0x6B697465736B79, '1548224168', '1548224168');
INSERT INTO `kite_site_config` VALUES ('2', 'qiniu_domain', 0x687474703A2F2F6F6E7872386D7438792E626B742E636C6F7564646E2E636F6D, '1548224168', '1548224168');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_useZh', 0x30, '1548224169', '1548224169');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_useImgBg', 0x30, '1548224169', '1548224169');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_fontSize', 0x3134, '1548224169', '1548224169');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_imageH', 0x30, '1548224169', '1548224169');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_imageW', 0x30, '1548224169', '1548224169');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_length', 0x36, '1548224169', '1548224169');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_useCurve', 0x30, '1548224169', '1548224169');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_useNoise', 0x30, '1548224169', '1548224169');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_member_register', 0x30, '1548224169', '1548224169');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_member_login', 0x30, '1548224169', '1548224169');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_publish_document', 0x30, '1548224169', '1548224169');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_publish_comment', 0x30, '1548224169', '1548224169');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_publish_feedback', 0x30, '1548224169', '1548224169');
INSERT INTO `kite_site_config` VALUES ('2', 'navigation_category', 0x5B7B226E616D65223A22E9A1B6E983A8E5AFBCE888AA222C22736F7274223A22222C226964223A317D5D, '1548224170', '1548224170');
INSERT INTO `kite_site_config` VALUES ('4', 'field_category', null, '1551153424', '1551153424');
INSERT INTO `kite_site_config` VALUES ('4', 'link_category', null, '1551153427', '1551153427');
INSERT INTO `kite_site_config` VALUES ('4', 'slider_category', null, '1551153466', '1551153466');
INSERT INTO `kite_site_config` VALUES ('4', 'block_category', null, '1551153468', '1551153468');
INSERT INTO `kite_site_config` VALUES ('4', 'navigation_category', null, '1551153507', '1551153507');
INSERT INTO `kite_site_config` VALUES ('3', 'field_category', null, '1551343953', '1551343953');
INSERT INTO `kite_site_config` VALUES ('3', 'navigation_category', null, '1553520030', '1553520030');
INSERT INTO `kite_site_config` VALUES ('2', 'sms_type', 0x6479736D73, '1553582312', '1553582312');
INSERT INTO `kite_site_config` VALUES ('2', 'ali_access_key', 0x4163636573734B6579204944, '1553582312', '1553582312');
INSERT INTO `kite_site_config` VALUES ('2', 'ali_access_key_secret', 0x416363657373204B657920536563726574, '1553582312', '1553582312');
INSERT INTO `kite_site_config` VALUES ('2', 'ali_sign_name', 0x31393938312E636F6D, '1553582312', '1553582312');
INSERT INTO `kite_site_config` VALUES ('2', 'ali_template_code', 0x534D535F31323334, '1553582312', '1553582312');
INSERT INTO `kite_site_config` VALUES ('2', 'water_logo', 0x2F7075626C69632F7374617469632F61646D696E2F646973742F696D672F6E6F7069632E706E67, '1553582314', '1553582314');
INSERT INTO `kite_site_config` VALUES ('2', 'water_position', 0x39, '1553582315', '1553582315');
INSERT INTO `kite_site_config` VALUES ('2', 'water_quality', 0x3830, '1553582315', '1553582315');
INSERT INTO `kite_site_config` VALUES ('2', 'water_status', 0x30, '1553582315', '1553582315');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_appid', 0x32303136303332313031323330343937, '1561704850', '1561704850');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_private_key', 0x4D4949456F77494241414B434151454170724A774436677164554241786F366578764D7556416968683279696E6B696B666F3831575546517455663349707842516C6A36324D6D71364350646D72626A49666256435164732B676E564455326A777961314C71784453615A446B64344D384B4931616C4E382B595265734D75344B446D6B6941705633336C4853324F7A467365464A322F6E62644B664B56535676687A3037742B6D612F6170797354584B77416A384165716E782F456C4C67746450454272457471684E544D7A56636259314D413466357173674479492F56486A336C7236434A6532772F4F485855776B7A7573656A776F33327264526F3734766D496152706E3756665773547546663570347A73587842396E6B4676764E574B387142724A5653753942496536585875656B62316657794431593032394259556B6B4131534276327168683770544F306866746175706F71776A695558624154424E684B51494441514142416F494241514346745153726D6C434D4163437A51736B457656514174586553333346456B7248576A646E56774D305379796D51696C4C522B2F736733676D4738425731486C4C7245456871574A6C787157644A7032666568584B3467425873776A3761686F684D6A313957374B61476F55557566416B33777079565065304A4E6763596B6C793476637178436C4A51526176436841556B47366665336D646E6D38387652466E754E4D75656F52656254353163504150346F6E3378364C5874706842514A6F704B79366F43496B69456C4476746F494D5368676A4B347A2B443267505849706E30614C4A4B3934335947324664506441422B792F7573326F7654736F6E78473256384B7933396A345134454F7032616E33742F5045567369744B51706E323262705265514A6D524C36522B6F55684D682B35526B464F42426474704754505746566A4F6B37524662733548747638464E422B637742416F4742414E54554466735759356E4E765648455A6966476A6F4C694C41487931357A6D597245483932622F7438366B4F5A6A4E744C50797A456D6A696D766F3841503031524C6D524976767564687A7A797A4E39676D6770394A334E41464C4D6849754854634A7671342B6F64677A6552614272373476745765344F4D46567839616F7532694674394C696437394547624A752F76342B437133586F34444444524F784E4158522B334E3161585370416F4742414D694331584E736C78715A736635374E64326A6B447538465968326D556E35766A4273374861774A393465666A697A5861705363674365325034666A68626D397A504E6E75313546304548743669596364484D75337951567564595A423141647869656239787A76484C6A6C484E57416C51357A65705869757167442F50635A374466566C53316D657943787341656E6E573058316B684A6F4743456838633433482B6B78574C47646942416F4741514A44636450494434574D6A4C6930772B4A7771473962566C766D2F4936425A44472F6F5246304C764372694E6C4D686F50336C722B6C6E55766C6C3579316466744251743074517A44504742456576667067346B59634D52654130486F50533553475673584C6130715936382F4D41422B69645667767A572B50554C6E45642B63576E554E6A586A7A5476767377686D367669765836503462354B7431437041614D456237434D2F3545436759424E6841627738484961486F4470574D696950724672356E4B4D70777A7278466A3662364761344D3849313945454B704E7A5852776C6B554E694F75433769643758634136597A38396C6E49347235344E5A4545554C4375494E33655957534F3342337235774132342F48437776796E687342307A4C34377759714869435668726744666461474472426247315A7148797146476B6F452B444841486E772F5549517439493036656D3841514B42674649384D636356456B773655702B677738716A2B594A6F306D78354D32674B543742346F4E4F39564D562F43557041784732326B4B2B453371736D5452444B41632B4F374E455266375858774A5241686C35344F4A634E63697074642B746D3835453077654D62352F51446B7A4E7A536A764D6151534941373846706970553238716B73555137634D4A3235317677546472577365742F33355661367333656B364230385A466871775453, '1561704850', '1561704850');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_public_key', 0x4D494942496A414E42676B71686B6947397730424151454641414F43415138414D49494343674B43415145416A7144333234747062714469706C7071316B62377242374B7352465A4555314B6A7650746A6851536A34427964527955674F725655705331584755564E4A665A2F4A65315A5A676C6747456579337776746E55724E49587A733751576A787134757067777744485846784756376E75726E4173744667597372495A4179736B446D6655434D674C686842694961435A2B4C724A592F545272704D68704B732B414E456F7567317A52706E6B6374474479707A4A4F4D767A43597454704C5843667130354157323976704E384A2F5573384A6B43435531515930736E487542544A2B57665548322B544A58686C383764774669665979766B4B54714F65446369472B6A4248463965333071306D77663667646C75447130346A6D2B51444E553642496867566763506D423937586F774E657677713534614E506C4C6B666E45396B6B62653248654D4D79543457747A4E32793853495977494441514142, '1561704850', '1561704850');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_notify_url', 0x687474703A2F2F6465762E6B697465736B792E636F6D2F6D656D6265722F6F726465722F616C694E6F74696679, '1561704850', '1561704850');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_return_url', 0x687474703A2F2F6465762E6B697465736B792E636F6D2F6D656D6265722F6F726465722F72657475726E, '1561704850', '1561704850');
INSERT INTO `kite_site_config` VALUES ('2', 'ali_appid', '', '1562046555', '1562046555');
INSERT INTO `kite_site_config` VALUES ('2', 'ali_private_key', '', '1562046555', '1562046555');
INSERT INTO `kite_site_config` VALUES ('2', 'ali_public_key', '', '1562046555', '1562046555');
INSERT INTO `kite_site_config` VALUES ('2', 'ali_notify_url', '', '1562046555', '1562046555');
INSERT INTO `kite_site_config` VALUES ('2', 'ali_return_url', '', '1562046555', '1562046555');
INSERT INTO `kite_site_config` VALUES ('2', 'member_allow_register', 0x31, '1562063662', '1562063662');
INSERT INTO `kite_site_config` VALUES ('2', 'member_allow_comment', 0x31, '1562063662', '1562063662');
INSERT INTO `kite_site_config` VALUES ('2', 'list_rows', 0x3135, '1562065361', '1562065361');
INSERT INTO `kite_site_config` VALUES ('2', 'list_row', 0x3135, '1562067176', '1562067176');
INSERT INTO `kite_site_config` VALUES ('1', 'member_allow_register', 0x31, '1562122709', '1562122709');
INSERT INTO `kite_site_config` VALUES ('1', 'member_allow_comment', 0x31, '1562122709', '1562122709');
INSERT INTO `kite_site_config` VALUES ('1', 'list_rows', 0x3135, '1562122709', '1562122709');
INSERT INTO `kite_site_config` VALUES ('1', 'water_status', 0x30, '1562381353', '1562381353');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key', 0x4163636573734B6579204944, '1562381354', '1562381354');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key_secret', 0x416363657373204B657920536563726574, '1562381354', '1562381354');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_sign_name', 0x31393938312E636F6D, '1562381354', '1562381354');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_template_code', 0x534D535F31323334, '1562381354', '1562381354');
INSERT INTO `kite_site_config` VALUES ('1', 'send_email_register', 0x30, '1562381355', '1562381355');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key', 0x4163636573734B6579204944, '1562381367', '1562381367');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key_secret', 0x416363657373204B657920536563726574, '1562381367', '1562381367');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_sign_name', 0x31393938312E636F6D, '1562381367', '1562381367');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_template_code', 0x534D535F31323334, '1562381367', '1562381367');
INSERT INTO `kite_site_config` VALUES ('1', 'send_email_register', 0x30, '1562381369', '1562381369');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key', 0x4163636573734B6579204944, '1562381369', '1562381369');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key_secret', 0x416363657373204B657920536563726574, '1562381369', '1562381369');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_sign_name', 0x31393938312E636F6D, '1562381369', '1562381369');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_template_code', 0x534D535F31323334, '1562381369', '1562381369');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key', 0x4163636573734B6579204944, '1562381370', '1562381370');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key_secret', 0x416363657373204B657920536563726574, '1562381370', '1562381370');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_sign_name', 0x31393938312E636F6D, '1562381370', '1562381370');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_template_code', 0x534D535F31323334, '1562381370', '1562381370');
INSERT INTO `kite_site_config` VALUES ('1', 'water_status', 0x30, '1562381370', '1562381370');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key', 0x4163636573734B6579204944, '1562483152', '1562483152');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key_secret', 0x416363657373204B657920536563726574, '1562483152', '1562483152');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_sign_name', 0x31393938312E636F6D, '1562483152', '1562483152');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_template_code', 0x534D535F31323334, '1562483152', '1562483152');
INSERT INTO `kite_site_config` VALUES ('1', 'send_email_register', 0x30, '1562483161', '1562483161');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key', 0x4163636573734B6579204944, '1562483172', '1562483172');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key_secret', 0x416363657373204B657920536563726574, '1562483172', '1562483172');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_sign_name', 0x31393938312E636F6D, '1562483172', '1562483172');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_template_code', 0x534D535F31323334, '1562483172', '1562483172');
INSERT INTO `kite_site_config` VALUES ('1', 'send_email_register', 0x30, '1562483173', '1562483173');
INSERT INTO `kite_site_config` VALUES ('1', 'send_email_register', 0x30, '1562488885', '1562488885');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useZh', 0x30, '1562488885', '1562488885');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useImgBg', 0x30, '1562488885', '1562488885');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useCurve', 0x30, '1562488885', '1562488885');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useNoise', 0x30, '1562488885', '1562488885');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_member_register', 0x30, '1562488885', '1562488885');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_member_login', 0x30, '1562488885', '1562488885');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_publish_document', 0x30, '1562488885', '1562488885');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_publish_comment', 0x30, '1562488885', '1562488885');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_publish_feedback', 0x30, '1562488885', '1562488885');
INSERT INTO `kite_site_config` VALUES ('1', 'water_status', 0x30, '1562488886', '1562488886');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_appid', 0x31, '1562560385', '1562560385');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_mch_id', 0x32, '1562560385', '1562560385');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_notify_url', 0x33, '1562560385', '1562560385');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_key', 0x34, '1562560385', '1562560385');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_appid', 0x31, '1562560401', '1562560401');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_mch_id', 0x32, '1562560401', '1562560401');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_notify_url', 0x33, '1562560401', '1562560401');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_key', 0x34, '1562560401', '1562560401');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_key', 0x34, '1562562599', '1562562599');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_notify_url', 0x33, '1562562599', '1562562599');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_mch_id', 0x32, '1562562599', '1562562599');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_appid', 0x31, '1562562599', '1562562599');
INSERT INTO `kite_site_config` VALUES ('1', 'water_status', 0x30, '1562562608', '1562562608');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_appid', 0x31, '1562562610', '1562562610');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_mch_id', 0x32, '1562562610', '1562562610');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_notify_url', 0x33, '1562562610', '1562562610');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_key', 0x34, '1562562610', '1562562610');
INSERT INTO `kite_site_config` VALUES ('1', 'water_status', 0x30, '1562562612', '1562562612');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useZh', 0x30, '1562562613', '1562562613');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useImgBg', 0x30, '1562562613', '1562562613');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useCurve', 0x30, '1562562613', '1562562613');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useNoise', 0x30, '1562562613', '1562562613');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_member_register', 0x30, '1562562613', '1562562613');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_member_login', 0x30, '1562562613', '1562562613');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_publish_document', 0x30, '1562562613', '1562562613');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_publish_comment', 0x30, '1562562613', '1562562613');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_publish_feedback', 0x30, '1562562613', '1562562613');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key', 0x4163636573734B6579204944, '1562562614', '1562562614');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key_secret', 0x416363657373204B657920536563726574, '1562562614', '1562562614');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_sign_name', 0x31393938312E636F6D, '1562562614', '1562562614');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_template_code', 0x534D535F31323334, '1562562614', '1562562614');
INSERT INTO `kite_site_config` VALUES ('1', 'send_email_register', 0x30, '1562562615', '1562562615');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_appid', 0x31, '1562562617', '1562562617');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_mch_id', 0x32, '1562562617', '1562562617');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_notify_url', 0x33, '1562562617', '1562562617');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_key', 0x34, '1562562617', '1562562617');
INSERT INTO `kite_site_config` VALUES ('1', 'water_status', 0x30, '1562562652', '1562562652');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useZh', 0x30, '1562562652', '1562562652');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useImgBg', 0x30, '1562562652', '1562562652');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useCurve', 0x30, '1562562652', '1562562652');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useNoise', 0x30, '1562562652', '1562562652');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_member_register', 0x30, '1562562652', '1562562652');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_member_login', 0x30, '1562562652', '1562562652');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_publish_document', 0x30, '1562562652', '1562562652');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_publish_comment', 0x30, '1562562652', '1562562652');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_publish_feedback', 0x30, '1562562652', '1562562652');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key', 0x4163636573734B6579204944, '1562562653', '1562562653');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key_secret', 0x416363657373204B657920536563726574, '1562562653', '1562562653');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_sign_name', 0x31393938312E636F6D, '1562562653', '1562562653');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_template_code', 0x534D535F31323334, '1562562653', '1562562653');
INSERT INTO `kite_site_config` VALUES ('1', 'send_email_register', 0x30, '1562562654', '1562562654');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_appid', 0x31, '1562562655', '1562562655');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_mch_id', 0x32, '1562562655', '1562562655');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_notify_url', 0x33, '1562562655', '1562562655');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_key', 0x34, '1562562655', '1562562655');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_appid', 0x31, '1562562686', '1562562686');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_mch_id', 0x32, '1562562686', '1562562686');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_notify_url', 0x33, '1562562686', '1562562686');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_key', 0x34, '1562562686', '1562562686');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_appid', 0x31, '1562562711', '1562562711');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_mch_id', 0x32, '1562562711', '1562562711');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_notify_url', 0x33, '1562562711', '1562562711');
INSERT INTO `kite_site_config` VALUES ('1', 'wx_key', 0x34, '1562562711', '1562562711');
INSERT INTO `kite_site_config` VALUES ('1', 'water_status', 0x30, '1562562979', '1562562979');
INSERT INTO `kite_site_config` VALUES ('1', 'send_email_register', 0x30, '1562562979', '1562562979');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key', 0x4163636573734B6579204944, '1562587516', '1562587516');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key_secret', 0x416363657373204B657920536563726574, '1562587516', '1562587516');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_sign_name', 0x31393938312E636F6D, '1562587516', '1562587516');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_template_code', 0x534D535F31323334, '1562587516', '1562587516');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key', 0x4163636573734B6579204944, '1562587517', '1562587517');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key_secret', 0x416363657373204B657920536563726574, '1562587517', '1562587517');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_sign_name', 0x31393938312E636F6D, '1562587517', '1562587517');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_template_code', 0x534D535F31323334, '1562587517', '1562587517');
INSERT INTO `kite_site_config` VALUES ('1', 'water_status', 0x30, '1562587518', '1562587518');
INSERT INTO `kite_site_config` VALUES ('1', 'send_email_register', 0x30, '1562587552', '1562587552');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useZh', 0x30, '1562587554', '1562587554');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useImgBg', 0x30, '1562587554', '1562587554');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useCurve', 0x30, '1562587554', '1562587554');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useNoise', 0x30, '1562587554', '1562587554');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_member_register', 0x30, '1562587554', '1562587554');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_member_login', 0x30, '1562587554', '1562587554');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_publish_document', 0x30, '1562587554', '1562587554');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_publish_comment', 0x30, '1562587554', '1562587554');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_publish_feedback', 0x30, '1562587554', '1562587554');
INSERT INTO `kite_site_config` VALUES ('1', 'water_status', 0x30, '1562587554', '1562587554');
INSERT INTO `kite_site_config` VALUES ('1', 'send_email_register', 0x30, '1562587557', '1562587557');
INSERT INTO `kite_site_config` VALUES ('0', 'field_category', null, '1562597748', '1562597748');
INSERT INTO `kite_site_config` VALUES ('0', 'member_allow_register', 0x31, '1562597917', '1562597917');
INSERT INTO `kite_site_config` VALUES ('0', 'member_allow_comment', 0x31, '1562597917', '1562597917');
INSERT INTO `kite_site_config` VALUES ('0', 'list_rows', 0x3135, '1562597917', '1562597917');
INSERT INTO `kite_site_config` VALUES ('0', 'navigation_category', null, '1562597919', '1562597919');
INSERT INTO `kite_site_config` VALUES ('1', 'send_email_register', 0x30, '1562599086', '1562599086');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key', 0x4163636573734B6579204944, '1562599086', '1562599086');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key_secret', 0x416363657373204B657920536563726574, '1562599086', '1562599086');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_sign_name', 0x31393938312E636F6D, '1562599086', '1562599086');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_template_code', 0x534D535F31323334, '1562599086', '1562599086');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useZh', 0x30, '1562599087', '1562599087');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useImgBg', 0x30, '1562599087', '1562599087');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useCurve', 0x30, '1562599087', '1562599087');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useNoise', 0x30, '1562599087', '1562599087');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_member_register', 0x30, '1562599087', '1562599087');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_member_login', 0x30, '1562599087', '1562599087');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_publish_document', 0x30, '1562599087', '1562599087');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_publish_comment', 0x30, '1562599087', '1562599087');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_publish_feedback', 0x30, '1562599087', '1562599087');
INSERT INTO `kite_site_config` VALUES ('1', 'water_status', 0x30, '1562599087', '1562599087');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_useZh', 0x30, '1562603284', '1562603284');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_useImgBg', 0x30, '1562603284', '1562603284');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_imageH', 0x30, '1562603284', '1562603284');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_imageW', 0x30, '1562603284', '1562603284');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_useCurve', 0x30, '1562603284', '1562603284');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_useNoise', 0x30, '1562603284', '1562603284');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_member_register', 0x30, '1562603284', '1562603284');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_member_login', 0x30, '1562603284', '1562603284');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_publish_document', 0x30, '1562603284', '1562603284');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_publish_comment', 0x30, '1562603284', '1562603284');
INSERT INTO `kite_site_config` VALUES ('2', 'captcha_publish_feedback', 0x30, '1562603284', '1562603284');
INSERT INTO `kite_site_config` VALUES ('2', 'ali_appid', '', '1562603286', '1562603286');
INSERT INTO `kite_site_config` VALUES ('2', 'ali_private_key', '', '1562603286', '1562603286');
INSERT INTO `kite_site_config` VALUES ('2', 'ali_public_key', '', '1562603286', '1562603286');
INSERT INTO `kite_site_config` VALUES ('2', 'ali_notify_url', '', '1562603286', '1562603286');
INSERT INTO `kite_site_config` VALUES ('2', 'ali_return_url', '', '1562603286', '1562603286');
INSERT INTO `kite_site_config` VALUES ('2', 'wx_appid', '', '1562603286', '1562603286');
INSERT INTO `kite_site_config` VALUES ('2', 'wx_mch_id', '', '1562603286', '1562603286');
INSERT INTO `kite_site_config` VALUES ('2', 'wx_notify_url', '', '1562603286', '1562603286');
INSERT INTO `kite_site_config` VALUES ('2', 'wx_key', '', '1562603286', '1562603286');
INSERT INTO `kite_site_config` VALUES ('2', 'send_email_register', 0x30, '1562603287', '1562603287');
INSERT INTO `kite_site_config` VALUES ('1', 'send_email_register', 0x30, '1562603290', '1562603290');
INSERT INTO `kite_site_config` VALUES ('1', 'send_email_register', 0x30, '1562769736', '1562769736');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key', 0x4163636573734B6579204944, '1562769737', '1562769737');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key_secret', 0x416363657373204B657920536563726574, '1562769737', '1562769737');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_sign_name', 0x31393938312E636F6D, '1562769737', '1562769737');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_template_code', 0x534D535F31323334, '1562769737', '1562769737');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key', 0x4163636573734B6579204944, '1562769737', '1562769737');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key_secret', 0x416363657373204B657920536563726574, '1562769737', '1562769737');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_sign_name', 0x31393938312E636F6D, '1562769737', '1562769737');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_template_code', 0x534D535F31323334, '1562769737', '1562769737');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useZh', 0x30, '1562769737', '1562769737');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useImgBg', 0x30, '1562769737', '1562769737');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useCurve', 0x30, '1562769737', '1562769737');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_useNoise', 0x30, '1562769737', '1562769737');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_member_register', 0x30, '1562769737', '1562769737');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_member_login', 0x30, '1562769737', '1562769737');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_publish_document', 0x30, '1562769737', '1562769737');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_publish_comment', 0x30, '1562769737', '1562769737');
INSERT INTO `kite_site_config` VALUES ('1', 'captcha_publish_feedback', 0x30, '1562769737', '1562769737');
INSERT INTO `kite_site_config` VALUES ('1', 'send_email_register', 0x30, '1562769740', '1562769740');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key', 0x4163636573734B6579204944, '1562769740', '1562769740');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key_secret', 0x416363657373204B657920536563726574, '1562769740', '1562769740');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_sign_name', 0x31393938312E636F6D, '1562769740', '1562769740');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_template_code', 0x534D535F31323334, '1562769740', '1562769740');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key', 0x4163636573734B6579204944, '1562769741', '1562769741');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_access_key_secret', 0x416363657373204B657920536563726574, '1562769741', '1562769741');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_sign_name', 0x31393938312E636F6D, '1562769741', '1562769741');
INSERT INTO `kite_site_config` VALUES ('1', 'ali_template_code', 0x534D535F31323334, '1562769741', '1562769741');
INSERT INTO `kite_site_config` VALUES ('1', 'water_status', 0x30, '1562769741', '1562769741');

-- ----------------------------
-- Table structure for kite_site_file
-- ----------------------------
DROP TABLE IF EXISTS `kite_site_file`;
CREATE TABLE `kite_site_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `site_id` int(11) NOT NULL COMMENT '网站ID',
  `upload_type` char(20) COLLATE utf8_bin NOT NULL COMMENT '上传方式',
  `title` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '图片原始名称',
  `name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '图片上传后生成名字',
  `ext` char(20) COLLATE utf8_bin NOT NULL COMMENT '图片后缀',
  `url` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '图片URL',
  `thumb` text COLLATE utf8_bin DEFAULT NULL COMMENT '本地生成缩略图记录 多个用逗号隔开。方便以后清理',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 上传未被引用; 1 上传后被引用',
  `create_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_site_file
-- ----------------------------
INSERT INTO `kite_site_file` VALUES ('1', '1', 'local', 'hyd.png', 'c75a61ac9a55d8d79e08a273137480d9.png', 'png', '/upload/20181104/c75a61ac9a55d8d79e08a273137480d9.png', 0x2F75706C6F61642F32303138313130342F63373561363161633961353564386437396530386132373331333734383064395F323530783235302E706E672C2F75706C6F61642F32303138313130342F63373561363161633961353564386437396530386132373331333734383064395F3132307837352E706E672C2F75706C6F61642F32303138313130342F63373561363161633961353564386437396530386132373331333734383064395F323230783134302E706E672C2F75706C6F61642F32303138313130342F63373561363161633961353564386437396530386132373331333734383064395F333530783233302E706E672C2F75706C6F61642F32303138313130342F63373561363161633961353564386437396530386132373331333734383064395F333530783233302E706E67, '0', '1541328538', '1541536786');
INSERT INTO `kite_site_file` VALUES ('2', '1', 'local', '1990992729264925_7CA46AC3814E2BC32AAA040E472BFE2F.jpg', 'b5375810e31069b7f959a00109ca7931.jpg', 'jpg', '/upload/20190226/b5375810e31069b7f959a00109ca7931.jpg', null, '0', '1551152426', '1551152426');
INSERT INTO `kite_site_file` VALUES ('3', '1', 'local', '1990992729264925_BCF67AF8238E28A665B8471C711CA097.jpg', '04b1d8ca8be54fed70ff036692de5843.jpg', 'jpg', '/upload/20190227/04b1d8ca8be54fed70ff036692de5843.jpg', null, '0', '1551251079', '1551251079');
INSERT INTO `kite_site_file` VALUES ('4', '1', 'local', '1.png', '8e6b5a7a4331080f3fad9607d49ed7f4.png', 'png', '/upload/20190308/8e6b5a7a4331080f3fad9607d49ed7f4.png', null, '0', '1552019787', '1552019787');
INSERT INTO `kite_site_file` VALUES ('8', '1', 'local', '1544174368(1).png', '82c6bc12eebe1bfa5845ec1032518b05.png', 'png', '/upload/20190314/82c6bc12eebe1bfa5845ec1032518b05.png', null, '0', '1552549390', '1552549390');
INSERT INTO `kite_site_file` VALUES ('9', '2', 'local', '808.jpg', '102082a52c00d370b792a457f2fef68c.jpg', 'jpg', '/upload/20190409/102082a52c00d370b792a457f2fef68c.jpg', null, '0', '1554787624', '1554787624');
INSERT INTO `kite_site_file` VALUES ('10', '2', 'local', '20180816110115375.png', 'f4657a745bd8bca6cb61f8259071379a.png', 'png', '/upload/20190409/f4657a745bd8bca6cb61f8259071379a.png', null, '0', '1554787635', '1554787635');
INSERT INTO `kite_site_file` VALUES ('11', '2', 'local', '1.jpg', 'bfd807741131ab395bde82d6e0fd21f9.jpg', 'jpg', '/upload/20190418/bfd807741131ab395bde82d6e0fd21f9.jpg', null, '0', '1555600044', '1555600044');
INSERT INTO `kite_site_file` VALUES ('12', '2', 'local', '4.png', '555ffc45f99a4ad9ab8d5ecab5ea8a77.png', 'png', '/upload/20190611/555ffc45f99a4ad9ab8d5ecab5ea8a77.png', null, '0', '1560247108', '1560247108');
INSERT INTO `kite_site_file` VALUES ('13', '2', 'local', 'u=3187049305,1981836037&fm=26&gp=0.jpg', 'b188bd2bbf38d9baf3cd06b0b9a47e78.jpg', 'jpg', '/upload/20190615/b188bd2bbf38d9baf3cd06b0b9a47e78.jpg', null, '0', '1560573779', '1560573779');
INSERT INTO `kite_site_file` VALUES ('14', '2', 'local', '下载 (1).jpg', '1a9210884e726089f5d0874556f3aeb1.jpg', 'jpg', '/upload/20190615/1a9210884e726089f5d0874556f3aeb1.jpg', null, '0', '1560573786', '1560573786');
INSERT INTO `kite_site_file` VALUES ('15', '2', 'local', 'netlimiter.png', '744f5ca2fa8aad72596801fc5d4ccc32.png', 'png', '/upload/20190616/744f5ca2fa8aad72596801fc5d4ccc32.png', null, '0', '1560620713', '1560620713');
INSERT INTO `kite_site_file` VALUES ('16', '1', 'local', 'logo.png', '18afca7dec141738ee9602b41cd7698d.png', 'png', '/upload/20190618/18afca7dec141738ee9602b41cd7698d.png', null, '0', '1560838006', '1560838006');
INSERT INTO `kite_site_file` VALUES ('17', '1', 'local', '40.png', '47b08ccd14af32d048e1fb5fcd287143.png', 'png', '/upload/20190618/47b08ccd14af32d048e1fb5fcd287143.png', null, '0', '1560838026', '1560838026');
INSERT INTO `kite_site_file` VALUES ('18', '1', 'local', 'favicon.png', 'e62b9f5b991b2b30b4dec26666714590.png', 'png', '/upload/20190618/e62b9f5b991b2b30b4dec26666714590.png', 0x2F75706C6F61642F32303139303631382F65363262396635623939316232623330623464656332363636363731343539305F36307836302E706E67, '0', '1560839387', '1560839388');
INSERT INTO `kite_site_file` VALUES ('19', '1', 'local', 'favicon.png', '83b56ac13413773672ac9cfbeaccba85.png', 'png', '/upload/20190618/83b56ac13413773672ac9cfbeaccba85.png', 0x2F75706C6F61642F32303139303631382F38336235366163313334313337373336373261633963666265616363626138355F36307836302E706E672C2F75706C6F61642F32303139303631382F38336235366163313334313337373336373261633963666265616363626138355F34307834302E706E67, '0', '1560843695', '1560851429');
INSERT INTO `kite_site_file` VALUES ('20', '1', 'local', '1.jpg', 'c0b302b007e8aef9e27036f4cbe7aeb3.jpg', 'jpg', '/upload/20190620/c0b302b007e8aef9e27036f4cbe7aeb3.jpg', 0x2F75706C6F61642F32303139303632302F63306233303262303037653861656639653237303336663463626537616562335F333730783331372E6A70672C2F75706C6F61642F32303139303632302F63306233303262303037653861656639653237303336663463626537616562335F333730783331372E6A70672C2F75706C6F61642F32303139303632302F63306233303262303037653861656639653237303336663463626537616562335F333730783331372E6A70672C2F75706C6F61642F32303139303632302F63306233303262303037653861656639653237303336663463626537616562335F333730783331372E6A70672C2F75706C6F61642F32303139303632302F63306233303262303037653861656639653237303336663463626537616562335F333435783239362E6A70672C2F75706C6F61642F32303139303632302F63306233303262303037653861656639653237303336663463626537616562335F35307835302E6A70672C2F75706C6F61642F32303139303632302F63306233303262303037653861656639653237303336663463626537616562335F3132307837352E6A70672C2F75706C6F61642F32303139303632302F63306233303262303037653861656639653237303336663463626537616562335F333530783233302E6A70672C2F75706C6F61642F32303139303632302F63306233303262303037653861656639653237303336663463626537616562335F323530783235302E6A70672C2F75706C6F61642F32303139303632302F63306233303262303037653861656639653237303336663463626537616562335F323230783134302E6A70672C2F75706C6F61642F32303139303632302F63306233303262303037653861656639653237303336663463626537616562335F333730783237372E6A70672C2F75706C6F61642F32303139303632302F63306233303262303037653861656639653237303336663463626537616562335F323835783231332E6A70672C2F75706C6F61642F32303139303632302F63306233303262303037653861656639653237303336663463626537616562335F323030783135302E6A70672C2F75706C6F61642F32303139303632302F63306233303262303037653861656639653237303336663463626537616562335F333730783232302E6A70672C2F75706C6F61642F32303139303632302F63306233303262303037653861656639653237303336663463626537616562335F37307837302E6A7067, '0', '1561023546', '1562113641');
INSERT INTO `kite_site_file` VALUES ('21', '2', 'local', '1.png', 'd4ba27fe921bc66b9d1bdb40e2dac63f.png', 'png', '/upload/20190626/d4ba27fe921bc66b9d1bdb40e2dac63f.png', 0x2F75706C6F61642F32303139303632362F64346261323766653932316263363662396431626462343065326461633633665F323530783235302E706E672C2F75706C6F61642F32303139303632362F64346261323766653932316263363662396431626462343065326461633633665F3132307837352E706E672C2F75706C6F61642F32303139303632362F64346261323766653932316263363662396431626462343065326461633633665F333530783233302E706E672C2F75706C6F61642F32303139303632362F64346261323766653932316263363662396431626462343065326461633633665F333730783232302E706E672C2F75706C6F61642F32303139303632362F64346261323766653932316263363662396431626462343065326461633633665F333730783237372E706E672C2F75706C6F61642F32303139303632362F64346261323766653932316263363662396431626462343065326461633633665F333435783239362E706E672C2F75706C6F61642F32303139303632362F64346261323766653932316263363662396431626462343065326461633633665F333730783331372E706E672C2F75706C6F61642F32303139303632362F64346261323766653932316263363662396431626462343065326461633633665F35307835302E706E67, '0', '1561564139', '1562128687');
INSERT INTO `kite_site_file` VALUES ('22', '2', 'local', '1.png', 'f8594d9dc116ee24ec265deb036cd916.png', 'png', '/upload/20190626/f8594d9dc116ee24ec265deb036cd916.png', 0x2F75706C6F61642F32303139303632362F66383539346439646331313665653234656332363564656230333663643931365F323530783235302E706E672C2F75706C6F61642F32303139303632362F66383539346439646331313665653234656332363564656230333663643931365F3132307837352E706E672C2F75706C6F61642F32303139303632362F66383539346439646331313665653234656332363564656230333663643931365F333530783233302E706E672C2F75706C6F61642F32303139303632362F66383539346439646331313665653234656332363564656230333663643931365F333730783232302E706E672C2F75706C6F61642F32303139303632362F66383539346439646331313665653234656332363564656230333663643931365F333730783237372E706E672C2F75706C6F61642F32303139303632362F66383539346439646331313665653234656332363564656230333663643931365F333435783239362E706E672C2F75706C6F61642F32303139303632362F66383539346439646331313665653234656332363564656230333663643931365F333730783331372E706E672C2F75706C6F61642F32303139303632362F66383539346439646331313665653234656332363564656230333663643931365F35307835302E706E67, '0', '1561564227', '1562128687');
INSERT INTO `kite_site_file` VALUES ('23', '1', 'local', 'xampp-logo-ac950edf.png', 'aba796d04ef17b1862880b988a5b47d8.png', 'png', '/upload/20190627/aba796d04ef17b1862880b988a5b47d8.png', 0x2F75706C6F61642F32303139303632372F61626137393664303465663137623138363238383062393838613562343764385F36307836302E706E67, '0', '1561565703', '1561565705');
INSERT INTO `kite_site_file` VALUES ('24', '1', 'local', 'logo.png', 'bdaa754cba6226b71dfd9fc1ce22df21.png', 'png', '/upload/20190701/bdaa754cba6226b71dfd9fc1ce22df21.png', null, '0', '1561943525', '1561943525');
INSERT INTO `kite_site_file` VALUES ('25', '1', 'local', 'logo.png', 'e7e3d8ec3733a986ff7cd769667e8454.png', 'png', '/upload/20190702/e7e3d8ec3733a986ff7cd769667e8454.png', null, '0', '1562043535', '1562043535');
INSERT INTO `kite_site_file` VALUES ('26', '2', 'local', 'logo.png', '61126f8e5831cadc75aacf845122c8a8.png', 'png', '/upload/20190702/61126f8e5831cadc75aacf845122c8a8.png', null, '0', '1562043625', '1562043625');
INSERT INTO `kite_site_file` VALUES ('27', '2', 'local', '1.jpg', '4e2c560750620b81f99a66274e62af88.jpg', 'jpg', '/upload/20190702/4e2c560750620b81f99a66274e62af88.jpg', 0x2F75706C6F61642F32303139303730322F34653263353630373530363230623831663939613636323734653632616638385F323530783235302E6A70672C2F75706C6F61642F32303139303730322F34653263353630373530363230623831663939613636323734653632616638385F3132307837352E6A70672C2F75706C6F61642F32303139303730322F34653263353630373530363230623831663939613636323734653632616638385F333530783233302E6A70672C2F75706C6F61642F32303139303730322F34653263353630373530363230623831663939613636323734653632616638385F333730783232302E6A70672C2F75706C6F61642F32303139303730322F34653263353630373530363230623831663939613636323734653632616638385F37307837302E6A70672C2F75706C6F61642F32303139303730322F34653263353630373530363230623831663939613636323734653632616638385F333730783237372E6A70672C2F75706C6F61642F32303139303730322F34653263353630373530363230623831663939613636323734653632616638385F333435783239362E6A70672C2F75706C6F61642F32303139303730322F34653263353630373530363230623831663939613636323734653632616638385F333730783331372E6A70672C2F75706C6F61642F32303139303730322F34653263353630373530363230623831663939613636323734653632616638385F35307835302E6A7067, '0', '1562043932', '1562128687');
INSERT INTO `kite_site_file` VALUES ('28', '2', 'local', '1.jpg', '4fabb6d93aa8e3f67a77f6dacf3e9c62.jpg', 'jpg', '/upload/20190702/4fabb6d93aa8e3f67a77f6dacf3e9c62.jpg', 0x2F75706C6F61642F32303139303730322F34666162623664393361613865336636376137376636646163663365396336325F323530783230302E6A70672C2F75706C6F61642F32303139303730322F34666162623664393361613865336636376137376636646163663365396336325F323530783235302E6A70672C2F75706C6F61642F32303139303730322F34666162623664393361613865336636376137376636646163663365396336325F3132307837352E6A70672C2F75706C6F61642F32303139303730322F34666162623664393361613865336636376137376636646163663365396336325F333530783233302E6A70672C2F75706C6F61642F32303139303730322F34666162623664393361613865336636376137376636646163663365396336325F323230783134302E6A70672C2F75706C6F61642F32303139303730322F34666162623664393361613865336636376137376636646163663365396336325F333730783232302E6A70672C2F75706C6F61642F32303139303730322F34666162623664393361613865336636376137376636646163663365396336325F37307837302E6A70672C2F75706C6F61642F32303139303730322F34666162623664393361613865336636376137376636646163663365396336325F333730783237372E6A70672C2F75706C6F61642F32303139303730322F34666162623664393361613865336636376137376636646163663365396336325F333435783239362E6A70672C2F75706C6F61642F32303139303730322F34666162623664393361613865336636376137376636646163663365396336325F333730783331372E6A70672C2F75706C6F61642F32303139303730322F34666162623664393361613865336636376137376636646163663365396336325F35307835302E6A7067, '0', '1562044409', '1562128687');
INSERT INTO `kite_site_file` VALUES ('29', '2', 'local', '1.jpg', 'f3d2f0d2d9f49f4aca7f3fbafde94f1c.jpg', 'jpg', '/upload/20190702/f3d2f0d2d9f49f4aca7f3fbafde94f1c.jpg', 0x2F75706C6F61642F32303139303730322F66336432663064326439663439663461636137663366626166646539346631635F323530783235302E6A70672C2F75706C6F61642F32303139303730322F66336432663064326439663439663461636137663366626166646539346631635F333530783233302E6A70672C2F75706C6F61642F32303139303730322F66336432663064326439663439663461636137663366626166646539346631635F3132307837352E6A70672C2F75706C6F61642F32303139303730322F66336432663064326439663439663461636137663366626166646539346631635F323530783230302E6A70672C2F75706C6F61642F32303139303730322F66336432663064326439663439663461636137663366626166646539346631635F333530783232302E6A70672C2F75706C6F61642F32303139303730322F66336432663064326439663439663461636137663366626166646539346631635F323230783134302E6A70672C2F75706C6F61642F32303139303730322F66336432663064326439663439663461636137663366626166646539346631635F333730783232302E6A70672C2F75706C6F61642F32303139303730322F66336432663064326439663439663461636137663366626166646539346631635F37307837302E6A70672C2F75706C6F61642F32303139303730322F66336432663064326439663439663461636137663366626166646539346631635F333730783237372E6A70672C2F75706C6F61642F32303139303730322F66336432663064326439663439663461636137663366626166646539346631635F333435783239362E6A70672C2F75706C6F61642F32303139303730322F66336432663064326439663439663461636137663366626166646539346631635F333730783331372E6A70672C2F75706C6F61642F32303139303730322F66336432663064326439663439663461636137663366626166646539346631635F35307835302E6A7067, '0', '1562044553', '1562128687');
INSERT INTO `kite_site_file` VALUES ('30', '2', 'local', '1.jpg', 'f388fc84054bc26fda1365f4b3866805.jpg', 'jpg', '/upload/20190702/f388fc84054bc26fda1365f4b3866805.jpg', 0x2F75706C6F61642F32303139303730322F66333838666338343035346263323666646131333635663462333836363830355F323530783230302E6A70672C2F75706C6F61642F32303139303730322F66333838666338343035346263323666646131333635663462333836363830355F323530783235302E6A70672C2F75706C6F61642F32303139303730322F66333838666338343035346263323666646131333635663462333836363830355F333530783233302E6A70672C2F75706C6F61642F32303139303730322F66333838666338343035346263323666646131333635663462333836363830355F353030783430302E6A70672C2F75706C6F61642F32303139303730322F66333838666338343035346263323666646131333635663462333836363830355F333530783232302E6A70672C2F75706C6F61642F32303139303730322F66333838666338343035346263323666646131333635663462333836363830355F3132307837352E6A70672C2F75706C6F61642F32303139303730322F66333838666338343035346263323666646131333635663462333836363830355F323230783134302E6A70672C2F75706C6F61642F32303139303730322F66333838666338343035346263323666646131333635663462333836363830355F333730783232302E6A70672C2F75706C6F61642F32303139303730322F66333838666338343035346263323666646131333635663462333836363830355F37307837302E6A70672C2F75706C6F61642F32303139303730322F66333838666338343035346263323666646131333635663462333836363830355F333730783237372E6A70672C2F75706C6F61642F32303139303730322F66333838666338343035346263323666646131333635663462333836363830355F333435783239362E6A70672C2F75706C6F61642F32303139303730322F66333838666338343035346263323666646131333635663462333836363830355F333730783331372E6A70672C2F75706C6F61642F32303139303730322F66333838666338343035346263323666646131333635663462333836363830355F35307835302E6A7067, '0', '1562044671', '1562128687');
INSERT INTO `kite_site_file` VALUES ('31', '1', 'local', 'clumbhtml.rar', '07ddf4e42108cb3ec053193b28d74cf1.rar', 'rar', '/upload/20190703/07ddf4e42108cb3ec053193b28d74cf1.rar', null, '0', '1562122889', '1562122889');
INSERT INTO `kite_site_file` VALUES ('32', '1', 'local', 'clumbhtml.rar', '206d8cb2de1a61b4def1ab70db1f417b.rar', 'rar', '/upload/20190703/206d8cb2de1a61b4def1ab70db1f417b.rar', null, '0', '1562122896', '1562122896');
INSERT INTO `kite_site_file` VALUES ('33', '1', 'local', '1.png', 'c06b0487f9c478a3edb01ba047c4a9f0.png', 'png', '/upload/20190703/c06b0487f9c478a3edb01ba047c4a9f0.png', null, '0', '1562123044', '1562123044');
INSERT INTO `kite_site_file` VALUES ('34', '1', 'local', '课程1.png', 'ffcc210fae567630f4df8e2a089682ab.png', 'png', '/upload/20190703/ffcc210fae567630f4df8e2a089682ab.png', null, '0', '1562123057', '1562123057');
INSERT INTO `kite_site_file` VALUES ('35', '1', 'local', 'clumbhtml.rar', '96c18f5be5a8bf614f00d8a162c9b9b7.rar', 'rar', '/upload/20190703/96c18f5be5a8bf614f00d8a162c9b9b7.rar', null, '0', '1562123178', '1562123178');
INSERT INTO `kite_site_file` VALUES ('36', '1', 'local', 'clumbhtml.rar', 'af2735a4435b970907e82d0c8db74201.rar', 'rar', '/upload/20190703/af2735a4435b970907e82d0c8db74201.rar', null, '0', '1562123324', '1562123324');
INSERT INTO `kite_site_file` VALUES ('37', '1', 'local', 'clumbhtml.rar', 'c20b64d7c7152889026c03d4ab594a53.rar', 'rar', '/upload/20190703/c20b64d7c7152889026c03d4ab594a53.rar', null, '0', '1562123434', '1562123434');
INSERT INTO `kite_site_file` VALUES ('38', '1', 'local', 'clumbhtml.rar', 'a8980e7251c41bea937bfd351b2ed41c.rar', 'rar', '/upload/20190703/a8980e7251c41bea937bfd351b2ed41c.rar', null, '0', '1562123455', '1562123455');
INSERT INTO `kite_site_file` VALUES ('39', '1', 'local', 'clumbhtml.rar', 'b8b240e5699a5a92791021208a667fe1.rar', 'rar', '/upload/20190703/b8b240e5699a5a92791021208a667fe1.rar', null, '0', '1562123554', '1562123554');
INSERT INTO `kite_site_file` VALUES ('40', '1', 'local', 'clumbhtml.rar', 'd1ca80fd9bd5a2f851cfb96e7ea34a40.rar', 'rar', '/upload/20190703/d1ca80fd9bd5a2f851cfb96e7ea34a40.rar', null, '0', '1562123946', '1562123946');
INSERT INTO `kite_site_file` VALUES ('41', '1', 'local', 'clumbhtml.rar', 'bb8642c406dff75456b24cb002b37f77.rar', 'rar', '/upload/20190703/bb8642c406dff75456b24cb002b37f77.rar', null, '0', '1562123955', '1562123955');
INSERT INTO `kite_site_file` VALUES ('42', '1', 'local', 'clumbhtml.rar', 'be1f0b74ea9722dd19dbf2978e1f97e2.rar', 'rar', '/upload/20190703/be1f0b74ea9722dd19dbf2978e1f97e2.rar', null, '0', '1562124008', '1562124008');
INSERT INTO `kite_site_file` VALUES ('43', '1', 'local', 'clumbhtml.rar', '4247e097b42d92d48d80b739c04b4818.rar', 'rar', '/upload/20190703/4247e097b42d92d48d80b739c04b4818.rar', null, '0', '1562124024', '1562124024');
INSERT INTO `kite_site_file` VALUES ('44', '1', 'local', 'php.jpg', 'c172a4c1a0cba438ad50aade43eb8d81.jpg', 'jpg', '/upload/20190703/c172a4c1a0cba438ad50aade43eb8d81.jpg', null, '0', '1562134156', '1562134156');
INSERT INTO `kite_site_file` VALUES ('45', '1', 'local', 'clumbhtml.rar', '6f289c0d880c3b4383e6c8e002aaa18a.rar', 'rar', '/upload/20190703/6f289c0d880c3b4383e6c8e002aaa18a.rar', null, '0', '1562134165', '1562134165');
INSERT INTO `kite_site_file` VALUES ('46', '1', 'local', '4247e097b42d92d48d80b739c04b4818.rar', 'a550bead63f8a8738bf743d07a954718.rar', 'rar', '/upload/20190703/a550bead63f8a8738bf743d07a954718.rar', null, '0', '1562134249', '1562134249');
INSERT INTO `kite_site_file` VALUES ('47', '1', 'local', 'company.zip', 'c76505607f66e930605d723da3d61da0.zip', 'zip', '/upload/20190703/c76505607f66e930605d723da3d61da0.zip', null, '0', '1562149927', '1562149927');

-- ----------------------------
-- Table structure for kite_slider
-- ----------------------------
DROP TABLE IF EXISTS `kite_slider`;
CREATE TABLE `kite_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cid` int(11) DEFAULT 0 COMMENT '友情链接分类ID',
  `site_id` char(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '网站编号',
  `name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '网站名称',
  `url` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '网站地址',
  `image` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'logo地址',
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述内容',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态： 0隐藏  1 显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kite_slider
-- ----------------------------

-- ----------------------------
-- Table structure for kite_tags
-- ----------------------------
DROP TABLE IF EXISTS `kite_tags`;
CREATE TABLE `kite_tags` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tag ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `tag_name` varchar(64) NOT NULL COMMENT 'Tag 名称',
  `count` int(11) DEFAULT 0 COMMENT 'Tag引用次数',
  `sort` int(11) DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kite_tags
-- ----------------------------
INSERT INTO `kite_tags` VALUES ('1', '1', '111', '0', '111');
INSERT INTO `kite_tags` VALUES ('2', '1', '222', '0', '222');
INSERT INTO `kite_tags` VALUES ('3', '1', '333', '0', '333');

-- ----------------------------
-- Table structure for kite_tags_mapping
-- ----------------------------
DROP TABLE IF EXISTS `kite_tags_mapping`;
CREATE TABLE `kite_tags_mapping` (
  `tag_id` int(11) NOT NULL,
  `document_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kite_tags_mapping
-- ----------------------------
INSERT INTO `kite_tags_mapping` VALUES ('1', '22');
INSERT INTO `kite_tags_mapping` VALUES ('3', '22');
INSERT INTO `kite_tags_mapping` VALUES ('2', '22');
