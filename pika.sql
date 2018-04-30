/*
Navicat MySQL Data Transfer

Source Server         : 192.168.0.107
Source Server Version : 50721
Source Host           : 192.168.0.107:3306
Source Database       : pika

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-04-30 23:54:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_app
-- ----------------------------
DROP TABLE IF EXISTS `sys_app`;
CREATE TABLE `sys_app` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '名称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL COMMENT '是否启用',
  `code` varchar(50) NOT NULL COMMENT '编码',
  `icon` varchar(30) NOT NULL COMMENT '图标',
  `online` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上线，0：未上线，1：已上线',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of sys_app
-- ----------------------------
INSERT INTO `sys_app` VALUES ('4', 'BOSS系统管理中心', '1', '2017-12-07 00:07:42', '2017-12-07 00:07:42', '0', 'zb-center-web-boss', '', '1');
INSERT INTO `sys_app` VALUES ('105', '应用监控系统', '2', '2017-12-07 00:40:52', '2017-12-07 00:40:52', '0', 'zb-center-web-monitor', '', '0');
INSERT INTO `sys_app` VALUES ('106', '定时任务管理系统', '3', '2017-12-22 01:39:53', '2017-12-07 00:41:24', '0', 'zb-center-web-task', '', '0');
INSERT INTO `sys_app` VALUES ('107', '订单管理系统', '4', '2017-12-22 01:21:21', '2017-12-07 00:42:03', '1', 'zb-center-web-order', '', '0');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `sort` varchar(100) DEFAULT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `permission_code` varchar(50) NOT NULL COMMENT '所需权限',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `app_id` bigint(20) NOT NULL COMMENT '菜单所属应用id',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '#', '0', '1', 'fa fa-cogs', '0', 'sys:mgt', '0', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('2', '用户管理', '/user/toUserListView', '1', '2', '', '1', 'user:mgt', '0', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('4', '角色管理', '/role/toRoleListView', '1', '4', null, '1', 'role:mgt', '0', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('5', '权限管理', '/permission/toListView', '1', '3', null, '1', 'permission:mgt', '0', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('6', '微信开发', '#', '0', '1', 'fa fa-wechat', '0', 'wechat:mgt', '1', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('7', '模板消息', '/wechat/template/toTemplateMsgView', '6', '2', '', '1', 'template:msg:send', '1', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('9', '实时监控', '#', '0', '1', 'fa fa-bar-chart-o', '0', 'monitor:mgt', '1', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('10', 'tomcat日志实时监控', '/socket/tomcatlog', '9', '2', null, '1', 'monitor:tomcat:log', '1', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('11', '消息推送', '#', '0', '1', 'fa fa-send-o', '0', 'socket:push:mgt', '1', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('12', '在线聊天', '#', '0', '1', 'fa fa-commenting-o', '0', 'chat:mgt', '1', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('13', 'netty实现在线聊天', '/chat/toChatView', '12', '2', null, '1', 'chat:netty:service', '1', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('14', 'activiti工作流', '#', '0', '1', 'fa fa-sliders', '0', 'activiti:mgt', '1', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('15', 'OA请假申请', '/oa/toOaApplyView', '14', '3', null, '1', 'activiti:oa:apply', '1', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('16', '已部署工作流程', '/activiti/toProcessListView', '14', '2', null, '1', 'activiti:process:list', '1', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('17', '我发起的请假流程', '/oa/toMyLeaveApplyView', '14', '4', null, '1', 'activiti:myprocess:leaveapply', '1', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('18', '部门领导审批', '/oa/toDeptleaderAuditView', '14', '5', null, '1', 'activiti:deptleader:audit', '1', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('19', '请假调整申请', '/oa/toMyLeaveApplyTurndownView', '14', '6', null, '1', 'activiti:myleaveapply:modify', '1', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('20', '我的请假历史', '/oa/toMyLeaveApplyHistoryView', '14', '7', null, '1', 'activiti:myleaveapplyed:history', '1', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('21', '人事审批', '/oa/toHrAuditView', '14', '8', null, '1', 'activiti:hr:audit', '1', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('22', '推送消息给当前用户', '/socket/userpush', '11', '2', null, '1', 'socket:user:msgpush', '1', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('23', '推送消息给所有用户', '/socket/userpush/all', '11', '3', null, '1', 'socket:alluser:msgpush', '1', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('24', '应用管理', '/app/toAppListView', '1', '1', null, '1', 'app:mgt', '0', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('25', '菜单管理', '/menu/toMenuListView', '1', '5', '', '1', 'menu:mgt', '0', '4', '2017-12-02 03:00:00', '2017-12-02 03:00:00');
INSERT INTO `sys_menu` VALUES ('26', '菜单测试2369', '#', '0', '12369', 'fa fa-stop', '0', 'menu:test2369', '1', '4', '2017-12-03 03:22:54', '2017-12-03 03:22:56');
INSERT INTO `sys_menu` VALUES ('27', '测试的555', '#', '0', '666', 'kkk', '0', 'xxx', '1', '4', '2017-12-03 06:50:37', '2017-12-03 06:50:37');
INSERT INTO `sys_menu` VALUES ('28', 'xx', '#', '0', '4', 'xcx', '0', 'xx', '1', '4', '2017-12-03 06:53:38', '2017-12-03 06:53:38');
INSERT INTO `sys_menu` VALUES ('29', '5', '#', '0', '5', 'fa fa-key', '0', '5', '1', '4', '2017-12-03 06:59:06', '2017-12-03 06:59:06');
INSERT INTO `sys_menu` VALUES ('30', '56', '#', '0', '56', '56', '0', '56', '1', '4', '2017-12-03 06:59:12', '2017-12-03 06:59:12');
INSERT INTO `sys_menu` VALUES ('31', '7', '7', '29', '7', '', '1', '7', '1', '4', '2017-12-03 06:59:26', '2017-12-03 06:59:26');
INSERT INTO `sys_menu` VALUES ('32', '79', '79', '30', '9', '', '1', '79', '1', '4', '2017-12-03 06:59:38', '2017-12-03 06:59:38');
INSERT INTO `sys_menu` VALUES ('33', '79', '79', '30', '9', '', '1', '79', '1', '4', '2017-12-03 06:59:39', '2017-12-03 06:59:39');
INSERT INTO `sys_menu` VALUES ('34', '8', '8', '30', '8', '', '1', '8', '1', '4', '2017-12-03 07:00:15', '2017-12-03 07:00:15');
INSERT INTO `sys_menu` VALUES ('35', '8', '#', '31', '8', '', '1', '8', '1', '4', '2017-12-03 07:00:22', '2017-12-03 07:00:22');
INSERT INTO `sys_menu` VALUES ('36', '文件打印', '#', '0', '3', 'fa fa-print', '0', 'file:print:mgt', '0', '4', '2017-12-20 18:07:23', '2017-12-20 18:07:23');
INSERT INTO `sys_menu` VALUES ('37', 'PDF文件打印', '/pdf/print/view', '36', '1', '', '1', 'pdf:file:print', '0', '4', '2017-12-20 18:09:46', '2017-12-20 18:09:46');
INSERT INTO `sys_menu` VALUES ('38', '定时任务', '#', '0', '2', 'fa fa-clock-o', '0', 'task:mgt', '0', '4', '2017-12-20 23:40:30', '2017-12-20 23:40:30');
INSERT INTO `sys_menu` VALUES ('39', '代码生成器', '#', '0', '4', 'fa fa-code', '0', 'code:generator:mgt', '0', '4', '2017-12-22 19:52:32', '2017-12-22 19:52:32');
INSERT INTO `sys_menu` VALUES ('40', '数据库表反向生成', '/generator/table/view', '39', '1', '', '1', 'code:table:generator', '0', '4', '2017-12-22 19:57:49', '2017-12-22 19:57:49');
INSERT INTO `sys_menu` VALUES ('41', '定时任务列表', '/task/view/list', '38', '1', '', '1', 'task:list', '0', '4', '2017-12-22 20:02:04', '2017-12-22 20:02:04');
INSERT INTO `sys_menu` VALUES ('42', '分布式任务调度平台', '/task/platform/view', '38', '2', '', '1', 'task:platform:view', '0', '4', '2017-12-25 15:13:26', '2017-12-25 15:13:26');
INSERT INTO `sys_menu` VALUES ('43', '在线资源管理器', '#', '0', '5', 'fa fa-cubes', '0', 'source:web:view', '0', '4', '2018-01-03 23:40:08', '2018-01-03 23:40:08');
INSERT INTO `sys_menu` VALUES ('44', 'finder-web', 'finder', '43', '1', '', '1', 'finder:web:view', '0', '4', '2018-01-03 23:41:09', '2018-01-03 23:41:09');
INSERT INTO `sys_menu` VALUES ('45', '在线聊天', '#', '0', '6', 'fa fa-comments', '0', 'online:chat:mgt', '0', '4', '2018-01-08 19:10:07', '2018-01-08 19:10:07');
INSERT INTO `sys_menu` VALUES ('46', 'netty实现在线聊天', '/chat/netty/view', '45', '1', '', '1', 'online:chat:netty:view', '0', '4', '2018-01-08 19:11:46', '2018-01-08 19:11:46');
INSERT INTO `sys_menu` VALUES ('47', '之前的', '/chat/netty/view2', '45', '2', '', '1', 'online:chat:netty:view', '0', '4', '2018-01-09 00:18:50', '2018-01-09 00:18:50');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '权限名称',
  `code` varchar(50) NOT NULL COMMENT '权限代码',
  `description` varchar(50) DEFAULT NULL COMMENT '描述',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态，0：可用，1：不可用',
  `app_id` bigint(20) NOT NULL COMMENT '所属应用id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '系统管理', 'sys:mgt', '对系统模块的管理', '0', '0', '4');
INSERT INTO `sys_permission` VALUES ('2', '人员管理', 'user:mgt', '对人员进行管理', '1', '0', '4');
INSERT INTO `sys_permission` VALUES ('3', '角色管理', 'role:mgt', '对角色进行管理', '1', '0', '4');
INSERT INTO `sys_permission` VALUES ('4', '权限管理', 'permission:mgt', '对权限进行管理', '1', '0', '4');
INSERT INTO `sys_permission` VALUES ('9', '查看用户列表', 'user:list', '可以查看用户列表', '2', '0', '4');
INSERT INTO `sys_permission` VALUES ('10', '编辑用户信息', 'user:edit', '是否能进入编辑用户信息页面', '9', '0', '4');
INSERT INTO `sys_permission` VALUES ('11', '删除用户', 'user:delete', '可以删除用户', '9', '0', '4');
INSERT INTO `sys_permission` VALUES ('12', '查看角色列表', 'role:list', '可以查看角色列表', '3', '0', '4');
INSERT INTO `sys_permission` VALUES ('13', '查看权限列表', 'permission:list', null, '4', '0', '4');
INSERT INTO `sys_permission` VALUES ('14', '新增角色', 'role:add', '新增角色信息', '12', '0', '4');
INSERT INTO `sys_permission` VALUES ('15', '更新角色', 'role:update', '是否可以提交更新', '12', '0', '4');
INSERT INTO `sys_permission` VALUES ('16', '删除角色', 'role:delete', '可以删除角色', '12', '0', '4');
INSERT INTO `sys_permission` VALUES ('17', '新增权限', 'permission:add', '可以添加新权限', '13', '0', '4');
INSERT INTO `sys_permission` VALUES ('18', '编辑权限', 'permission:edit', '是否能进入权限编辑页面', '13', '0', '4');
INSERT INTO `sys_permission` VALUES ('19', '删除权限', 'permission:delete', '可以删除权限数据', '13', '0', '4');
INSERT INTO `sys_permission` VALUES ('20', '添加用户', 'user:add', '可以添加新的用户', '9', '0', '4');
INSERT INTO `sys_permission` VALUES ('21', '微信开发', 'wechat:mgt', '微信相关功能开发演示', '0', '0', '4');
INSERT INTO `sys_permission` VALUES ('22', '微信模板消息', 'template:msg:send', '测试发送微信模板消息', '21', '0', '4');
INSERT INTO `sys_permission` VALUES ('23', '监控管理', 'monitor:mgt', '监控管理', '0', '0', '4');
INSERT INTO `sys_permission` VALUES ('24', 'tomcat日志监控', 'monitor:tomcat:log', '可以查看服务器上tomcat的实时打印日志', '23', '0', '4');
INSERT INTO `sys_permission` VALUES ('25', '服务器消息推送', 'socket:push:mgt', '服务器消息推送', '0', '0', '4');
INSERT INTO `sys_permission` VALUES ('26', '在线聊天', 'chat:mgt', '在线聊天', '0', '0', '4');
INSERT INTO `sys_permission` VALUES ('27', 'netty实现在线聊天', 'chat:netty:service', 'netty实现在线聊天', '26', '0', '4');
INSERT INTO `sys_permission` VALUES ('28', 'activiti工作流', 'activiti:mgt', 'activiti工作流相关技术', '0', '0', '4');
INSERT INTO `sys_permission` VALUES ('29', 'OA请假流程', 'activiti:oa:apply', '基于工作流实现OA请假', '28', '0', '4');
INSERT INTO `sys_permission` VALUES ('30', '已部署的工作流', 'activiti:process:list', '已部署的工作流', '28', '0', '4');
INSERT INTO `sys_permission` VALUES ('31', '我发起的请假流程', 'activiti:myprocess:leaveapply', '我发起的请假流程', '28', '0', '4');
INSERT INTO `sys_permission` VALUES ('32', '部门领导审批', 'activiti:deptleader:audit', '部门领导审批', '28', '0', '4');
INSERT INTO `sys_permission` VALUES ('33', '请假调整申请', 'activiti:myleaveapply:modify', '重新修改被驳回的请假申请', '28', '0', '4');
INSERT INTO `sys_permission` VALUES ('34', '我的请假历史', 'activiti:myleaveapplyed:history', '我的请假历史', '28', '0', '4');
INSERT INTO `sys_permission` VALUES ('35', '人事审批请假申请', 'activiti:hr:audit', '人事审批请假申请', '28', '0', '4');
INSERT INTO `sys_permission` VALUES ('39', '推送消息给自己', 'socket:user:msgpush', '推送消息给自己', '25', '0', '4');
INSERT INTO `sys_permission` VALUES ('40', '推送消息给所有人', 'socket:alluser:msgpush', '推送消息给所有人', '25', '0', '4');
INSERT INTO `sys_permission` VALUES ('43', '应用管理', 'app:mgt', '应用管理', '1', '0', '4');
INSERT INTO `sys_permission` VALUES ('44', '查看应用列表', 'app:list', '查看应用列表', '43', '0', '4');
INSERT INTO `sys_permission` VALUES ('45', '应用编辑', 'app:edit', '是否能进入应用编辑页面', '44', '0', '4');
INSERT INTO `sys_permission` VALUES ('46', '删除应用', 'app:delete', '删除应用', '44', '0', '4');
INSERT INTO `sys_permission` VALUES ('47', '添加应用', 'app:add', '添加应用', '44', '0', '4');
INSERT INTO `sys_permission` VALUES ('48', '为用户分配应用', 'user:assign:app', '为用户分配应用', '9', '0', '4');
INSERT INTO `sys_permission` VALUES ('49', '为用户分配角色', 'user:assign:role', '为用户分配角色', '9', '0', '4');
INSERT INTO `sys_permission` VALUES ('50', '菜单管理', 'menu:mgt', '菜单管理', '1', '0', '4');
INSERT INTO `sys_permission` VALUES ('53', '测试034', '测试034', '测试03', '57', '0', '85');
INSERT INTO `sys_permission` VALUES ('55', '888', '888', '888', '53', '0', '85');
INSERT INTO `sys_permission` VALUES ('56', '5', '5', '5', '55', '0', '85');
INSERT INTO `sys_permission` VALUES ('57', '678', '678', '678', '0', '1', '85');
INSERT INTO `sys_permission` VALUES ('58', '890', '890', '890', '0', '0', '85');
INSERT INTO `sys_permission` VALUES ('59', '777', '777', '777', '58', '1', '85');
INSERT INTO `sys_permission` VALUES ('61', '6', '6', '6', '0', '0', '87');
INSERT INTO `sys_permission` VALUES ('62', '65', '65', '65', '61', '1', '87');
INSERT INTO `sys_permission` VALUES ('63', '656', '656', '656', '0', '1', '85');
INSERT INTO `sys_permission` VALUES ('64', '什么鬼', '什么鬼', '什么鬼', '62', '1', '87');
INSERT INTO `sys_permission` VALUES ('70', '查看菜单列表', 'menu:list', '查看菜单列表', '50', '0', '4');
INSERT INTO `sys_permission` VALUES ('73', 'OA请假审批员', 'oa:qingjia:shenpi', 'OA请假审批员', '0', '0', '89');
INSERT INTO `sys_permission` VALUES ('74', '公众号运营员', 'wechat:yunying:person', '公众号运营员', '0', '0', '86');
INSERT INTO `sys_permission` VALUES ('75', '新增菜单', 'menu:add', '可以添加新菜单', '50', '0', '4');
INSERT INTO `sys_permission` VALUES ('76', '删除菜单', 'menu:delete', '可以删除菜单', '50', '0', '4');
INSERT INTO `sys_permission` VALUES ('77', '编辑菜单', 'menu:edit', '是否能进入菜单编辑页面', '50', '0', '4');
INSERT INTO `sys_permission` VALUES ('78', '删除已经部署的工作流', 'activiti:process:delete', '删除已经部署的工作流', '30', '0', '4');
INSERT INTO `sys_permission` VALUES ('79', '上传流程文件', 'activiti:process:upload', '上传流程文件', '30', '0', '4');
INSERT INTO `sys_permission` VALUES ('80', '查看流程文件内容', 'activiti:process:detail', '查看流程文件内容', '30', '0', '4');
INSERT INTO `sys_permission` VALUES ('81', '编辑角色', 'role:edit', '是否能进入编辑页面', '12', '0', '4');
INSERT INTO `sys_permission` VALUES ('82', '更新菜单', 'menu:update', '提交更新菜单信息', '50', '0', '4');
INSERT INTO `sys_permission` VALUES ('83', '更新用户信息', 'user:update', '更新用户信息', '9', '0', '4');
INSERT INTO `sys_permission` VALUES ('84', '更新权限', 'permission:update', '是否可以提交更新', '13', '0', '4');
INSERT INTO `sys_permission` VALUES ('85', '更新应用信息', 'app:update', '是否可以提交更新', '44', '0', '4');
INSERT INTO `sys_permission` VALUES ('86', '文件打印管理', 'file:print:mgt', '文件打印管理', '0', '0', '4');
INSERT INTO `sys_permission` VALUES ('87', 'pdf文件打印', 'pdf:file:print', 'pdf文件打印', '86', '0', '4');
INSERT INTO `sys_permission` VALUES ('88', '定时任务', 'task:mgt', '定时任务', '0', '0', '4');
INSERT INTO `sys_permission` VALUES ('89', '代码生成器', 'code:generator:mgt', '代码生成器管理', '0', '0', '4');
INSERT INTO `sys_permission` VALUES ('90', '代码生成页面', 'code:table:generator', '进入基于Table表反向生成的页面', '89', '0', '4');
INSERT INTO `sys_permission` VALUES ('91', '定时任务列表', 'task:list', '查看定时任务列表', '88', '0', '4');
INSERT INTO `sys_permission` VALUES ('92', '分布式任务调度平台', 'task:platform:view', '进入分布式任务调度平台系统', '88', '0', '4');
INSERT INTO `sys_permission` VALUES ('93', '资源管理器', 'source:web:view', '在线版的资源管理器', '0', '0', '4');
INSERT INTO `sys_permission` VALUES ('94', 'finder-web', 'finder:web:view', 'web版在线资源管理器-finder-web', '93', '0', '4');
INSERT INTO `sys_permission` VALUES ('95', '在线聊天', 'online:chat:mgt', '在线聊天', '0', '0', '4');
INSERT INTO `sys_permission` VALUES ('96', 'netty实现在线聊天', 'online:chat:netty:view', '进入在线聊天的页面', '95', '0', '4');

-- ----------------------------
-- Table structure for sys_re_user_app
-- ----------------------------
DROP TABLE IF EXISTS `sys_re_user_app`;
CREATE TABLE `sys_re_user_app` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NOT NULL COMMENT '用户id',
  `app_id` bigint(11) NOT NULL COMMENT '应用id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_re_user_app
-- ----------------------------
INSERT INTO `sys_re_user_app` VALUES ('3', '41', '1');
INSERT INTO `sys_re_user_app` VALUES ('100', '47', '4');
INSERT INTO `sys_re_user_app` VALUES ('119', '1', '4');
INSERT INTO `sys_re_user_app` VALUES ('127', '39', '86');
INSERT INTO `sys_re_user_app` VALUES ('133', '34', '89');
INSERT INTO `sys_re_user_app` VALUES ('136', '36', '4');
INSERT INTO `sys_re_user_app` VALUES ('137', '38', '4');
INSERT INTO `sys_re_user_app` VALUES ('138', '40', '4');
INSERT INTO `sys_re_user_app` VALUES ('139', '43', '4');
INSERT INTO `sys_re_user_app` VALUES ('140', '48', '4');
INSERT INTO `sys_re_user_app` VALUES ('144', '49', '4');
INSERT INTO `sys_re_user_app` VALUES ('145', '50', '4');
INSERT INTO `sys_re_user_app` VALUES ('146', '51', '4');
INSERT INTO `sys_re_user_app` VALUES ('147', '52', '4');
INSERT INTO `sys_re_user_app` VALUES ('148', '53', '4');
INSERT INTO `sys_re_user_app` VALUES ('149', '54', '4');
INSERT INTO `sys_re_user_app` VALUES ('150', '55', '4');
INSERT INTO `sys_re_user_app` VALUES ('151', '56', '4');
INSERT INTO `sys_re_user_app` VALUES ('152', '57', '4');
INSERT INTO `sys_re_user_app` VALUES ('153', '58', '4');
INSERT INTO `sys_re_user_app` VALUES ('154', '59', '4');
INSERT INTO `sys_re_user_app` VALUES ('155', '60', '4');
INSERT INTO `sys_re_user_app` VALUES ('156', '61', '4');
INSERT INTO `sys_re_user_app` VALUES ('157', '62', '4');
INSERT INTO `sys_re_user_app` VALUES ('158', '63', '4');
INSERT INTO `sys_re_user_app` VALUES ('159', '64', '4');
INSERT INTO `sys_re_user_app` VALUES ('160', '65', '4');
INSERT INTO `sys_re_user_app` VALUES ('161', '66', '4');
INSERT INTO `sys_re_user_app` VALUES ('162', '67', '4');
INSERT INTO `sys_re_user_app` VALUES ('163', '68', '4');
INSERT INTO `sys_re_user_app` VALUES ('164', '69', '4');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `app_id` bigint(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(50) DEFAULT NULL COMMENT '描述',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `update_time` datetime NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '4', '超级管理员', '最高级别权限管理员', '0', '2016-08-01 15:17:52', '2016-08-01 15:17:53');
INSERT INTO `sys_role` VALUES ('2', '4', '员工', '基层员工', '0', '2016-08-01 15:18:21', '2016-08-01 15:18:23');
INSERT INTO `sys_role` VALUES ('3', '4', '财务', '财务部角色', '0', '2016-08-03 13:21:56', '2016-08-03 13:21:58');
INSERT INTO `sys_role` VALUES ('4', '4', '人事', '人事', '0', '2017-03-21 13:19:34', '2017-03-21 13:19:34');
INSERT INTO `sys_role` VALUES ('6', '4', '出纳员', '出纳员', '0', '2017-03-21 13:22:06', '2017-03-21 13:22:06');
INSERT INTO `sys_role` VALUES ('7', '4', '采购经理', '采购经理', '0', '2017-03-21 13:22:23', '2017-03-21 13:22:23');
INSERT INTO `sys_role` VALUES ('8', '4', '总经理', '总经理', '0', '2017-03-21 13:23:03', '2017-03-21 13:23:03');
INSERT INTO `sys_role` VALUES ('15', '4', 'OA审批员', 'OA审批员', '0', '2017-12-03 16:23:11', '2017-12-03 16:23:11');
INSERT INTO `sys_role` VALUES ('16', '4', '公众号运营员', '公众号运营员', '0', '2017-12-03 16:25:33', '2017-12-03 16:25:33');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `app_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3712 DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('2667', '6', '1', '4');
INSERT INTO `sys_role_permission` VALUES ('2668', '6', '2', '4');
INSERT INTO `sys_role_permission` VALUES ('2669', '6', '9', '4');
INSERT INTO `sys_role_permission` VALUES ('2670', '6', '21', '4');
INSERT INTO `sys_role_permission` VALUES ('2671', '6', '22', '4');
INSERT INTO `sys_role_permission` VALUES ('2672', '6', '23', '4');
INSERT INTO `sys_role_permission` VALUES ('2673', '6', '24', '4');
INSERT INTO `sys_role_permission` VALUES ('2674', '6', '25', '4');
INSERT INTO `sys_role_permission` VALUES ('2675', '6', '39', '4');
INSERT INTO `sys_role_permission` VALUES ('2676', '6', '40', '4');
INSERT INTO `sys_role_permission` VALUES ('2677', '6', '26', '4');
INSERT INTO `sys_role_permission` VALUES ('2678', '6', '27', '4');
INSERT INTO `sys_role_permission` VALUES ('3238', '7', '1', '4');
INSERT INTO `sys_role_permission` VALUES ('3239', '7', '2', '4');
INSERT INTO `sys_role_permission` VALUES ('3240', '7', '9', '4');
INSERT INTO `sys_role_permission` VALUES ('3241', '7', '10', '4');
INSERT INTO `sys_role_permission` VALUES ('3242', '7', '43', '4');
INSERT INTO `sys_role_permission` VALUES ('3243', '7', '44', '4');
INSERT INTO `sys_role_permission` VALUES ('3244', '7', '45', '4');
INSERT INTO `sys_role_permission` VALUES ('3274', '15', '1', '4');
INSERT INTO `sys_role_permission` VALUES ('3275', '15', '2', '4');
INSERT INTO `sys_role_permission` VALUES ('3276', '15', '9', '4');
INSERT INTO `sys_role_permission` VALUES ('3277', '3', '1', '4');
INSERT INTO `sys_role_permission` VALUES ('3278', '3', '2', '4');
INSERT INTO `sys_role_permission` VALUES ('3279', '3', '9', '4');
INSERT INTO `sys_role_permission` VALUES ('3280', '3', '10', '4');
INSERT INTO `sys_role_permission` VALUES ('3281', '2', '1', '4');
INSERT INTO `sys_role_permission` VALUES ('3282', '2', '2', '4');
INSERT INTO `sys_role_permission` VALUES ('3283', '2', '9', '4');
INSERT INTO `sys_role_permission` VALUES ('3284', '2', '10', '4');
INSERT INTO `sys_role_permission` VALUES ('3285', '2', '21', '4');
INSERT INTO `sys_role_permission` VALUES ('3286', '2', '22', '4');
INSERT INTO `sys_role_permission` VALUES ('3287', '2', '23', '4');
INSERT INTO `sys_role_permission` VALUES ('3288', '2', '24', '4');
INSERT INTO `sys_role_permission` VALUES ('3289', '2', '25', '4');
INSERT INTO `sys_role_permission` VALUES ('3290', '2', '39', '4');
INSERT INTO `sys_role_permission` VALUES ('3291', '2', '40', '4');
INSERT INTO `sys_role_permission` VALUES ('3292', '2', '26', '4');
INSERT INTO `sys_role_permission` VALUES ('3293', '2', '27', '4');
INSERT INTO `sys_role_permission` VALUES ('3294', '2', '28', '4');
INSERT INTO `sys_role_permission` VALUES ('3295', '2', '29', '4');
INSERT INTO `sys_role_permission` VALUES ('3296', '2', '30', '4');
INSERT INTO `sys_role_permission` VALUES ('3297', '2', '78', '4');
INSERT INTO `sys_role_permission` VALUES ('3298', '2', '79', '4');
INSERT INTO `sys_role_permission` VALUES ('3299', '2', '80', '4');
INSERT INTO `sys_role_permission` VALUES ('3300', '2', '31', '4');
INSERT INTO `sys_role_permission` VALUES ('3301', '2', '32', '4');
INSERT INTO `sys_role_permission` VALUES ('3302', '2', '33', '4');
INSERT INTO `sys_role_permission` VALUES ('3303', '2', '34', '4');
INSERT INTO `sys_role_permission` VALUES ('3304', '2', '35', '4');
INSERT INTO `sys_role_permission` VALUES ('3329', '16', '1', '4');
INSERT INTO `sys_role_permission` VALUES ('3330', '16', '2', '4');
INSERT INTO `sys_role_permission` VALUES ('3331', '16', '9', '4');
INSERT INTO `sys_role_permission` VALUES ('3478', '8', '1', '4');
INSERT INTO `sys_role_permission` VALUES ('3479', '8', '2', '4');
INSERT INTO `sys_role_permission` VALUES ('3480', '8', '9', '4');
INSERT INTO `sys_role_permission` VALUES ('3481', '8', '10', '4');
INSERT INTO `sys_role_permission` VALUES ('3482', '8', '21', '4');
INSERT INTO `sys_role_permission` VALUES ('3483', '8', '22', '4');
INSERT INTO `sys_role_permission` VALUES ('3484', '8', '23', '4');
INSERT INTO `sys_role_permission` VALUES ('3485', '8', '24', '4');
INSERT INTO `sys_role_permission` VALUES ('3486', '8', '25', '4');
INSERT INTO `sys_role_permission` VALUES ('3487', '8', '39', '4');
INSERT INTO `sys_role_permission` VALUES ('3488', '8', '40', '4');
INSERT INTO `sys_role_permission` VALUES ('3489', '8', '26', '4');
INSERT INTO `sys_role_permission` VALUES ('3490', '8', '27', '4');
INSERT INTO `sys_role_permission` VALUES ('3491', '8', '28', '4');
INSERT INTO `sys_role_permission` VALUES ('3492', '8', '29', '4');
INSERT INTO `sys_role_permission` VALUES ('3493', '8', '30', '4');
INSERT INTO `sys_role_permission` VALUES ('3494', '8', '31', '4');
INSERT INTO `sys_role_permission` VALUES ('3495', '8', '32', '4');
INSERT INTO `sys_role_permission` VALUES ('3496', '8', '33', '4');
INSERT INTO `sys_role_permission` VALUES ('3497', '8', '34', '4');
INSERT INTO `sys_role_permission` VALUES ('3498', '8', '35', '4');
INSERT INTO `sys_role_permission` VALUES ('3499', '4', '1', '4');
INSERT INTO `sys_role_permission` VALUES ('3500', '4', '2', '4');
INSERT INTO `sys_role_permission` VALUES ('3501', '4', '9', '4');
INSERT INTO `sys_role_permission` VALUES ('3502', '4', '10', '4');
INSERT INTO `sys_role_permission` VALUES ('3503', '4', '83', '4');
INSERT INTO `sys_role_permission` VALUES ('3504', '4', '28', '4');
INSERT INTO `sys_role_permission` VALUES ('3505', '4', '30', '4');
INSERT INTO `sys_role_permission` VALUES ('3506', '4', '35', '4');
INSERT INTO `sys_role_permission` VALUES ('3674', '1', '1', '4');
INSERT INTO `sys_role_permission` VALUES ('3675', '1', '2', '4');
INSERT INTO `sys_role_permission` VALUES ('3676', '1', '9', '4');
INSERT INTO `sys_role_permission` VALUES ('3677', '1', '10', '4');
INSERT INTO `sys_role_permission` VALUES ('3678', '1', '20', '4');
INSERT INTO `sys_role_permission` VALUES ('3679', '1', '48', '4');
INSERT INTO `sys_role_permission` VALUES ('3680', '1', '49', '4');
INSERT INTO `sys_role_permission` VALUES ('3681', '1', '3', '4');
INSERT INTO `sys_role_permission` VALUES ('3682', '1', '12', '4');
INSERT INTO `sys_role_permission` VALUES ('3683', '1', '14', '4');
INSERT INTO `sys_role_permission` VALUES ('3684', '1', '15', '4');
INSERT INTO `sys_role_permission` VALUES ('3685', '1', '81', '4');
INSERT INTO `sys_role_permission` VALUES ('3686', '1', '4', '4');
INSERT INTO `sys_role_permission` VALUES ('3687', '1', '13', '4');
INSERT INTO `sys_role_permission` VALUES ('3688', '1', '17', '4');
INSERT INTO `sys_role_permission` VALUES ('3689', '1', '18', '4');
INSERT INTO `sys_role_permission` VALUES ('3690', '1', '84', '4');
INSERT INTO `sys_role_permission` VALUES ('3691', '1', '43', '4');
INSERT INTO `sys_role_permission` VALUES ('3692', '1', '44', '4');
INSERT INTO `sys_role_permission` VALUES ('3693', '1', '45', '4');
INSERT INTO `sys_role_permission` VALUES ('3694', '1', '47', '4');
INSERT INTO `sys_role_permission` VALUES ('3695', '1', '85', '4');
INSERT INTO `sys_role_permission` VALUES ('3696', '1', '50', '4');
INSERT INTO `sys_role_permission` VALUES ('3697', '1', '70', '4');
INSERT INTO `sys_role_permission` VALUES ('3698', '1', '75', '4');
INSERT INTO `sys_role_permission` VALUES ('3699', '1', '77', '4');
INSERT INTO `sys_role_permission` VALUES ('3700', '1', '82', '4');
INSERT INTO `sys_role_permission` VALUES ('3701', '1', '86', '4');
INSERT INTO `sys_role_permission` VALUES ('3702', '1', '87', '4');
INSERT INTO `sys_role_permission` VALUES ('3703', '1', '88', '4');
INSERT INTO `sys_role_permission` VALUES ('3704', '1', '91', '4');
INSERT INTO `sys_role_permission` VALUES ('3705', '1', '92', '4');
INSERT INTO `sys_role_permission` VALUES ('3706', '1', '89', '4');
INSERT INTO `sys_role_permission` VALUES ('3707', '1', '90', '4');
INSERT INTO `sys_role_permission` VALUES ('3708', '1', '93', '4');
INSERT INTO `sys_role_permission` VALUES ('3709', '1', '94', '4');
INSERT INTO `sys_role_permission` VALUES ('3710', '1', '95', '4');
INSERT INTO `sys_role_permission` VALUES ('3711', '1', '96', '4');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL COMMENT '登录用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `real_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '账号状态',
  `open_id` varchar(50) DEFAULT NULL COMMENT '微信openid',
  `from_system` tinyint(4) NOT NULL DEFAULT '0' COMMENT '来源哪个系统。(后期会进行与第三方系统做用户数据对接，默认为当前系统用户中心)',
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员', '0', null, '0', '2016-08-03 13:22:46', '2017-11-30 01:58:35');
INSERT INTO `sys_user` VALUES ('34', 'chunayuan', 'e10adc3949ba59abbe56e057f20f883e', '李斯', '0', null, '0', '2017-07-11 16:41:36', '2017-11-30 02:15:43');
INSERT INTO `sys_user` VALUES ('38', 'libai', 'e10adc3949ba59abbe56e057f20f883e', '李白', '0', null, '0', '2017-07-11 16:42:56', '2017-12-07 00:51:04');
INSERT INTO `sys_user` VALUES ('39', 'zongjingli', 'e10adc3949ba59abbe56e057f20f883e', '王化', '1', null, '0', '2017-07-11 16:43:18', '2017-10-25 16:11:34');
INSERT INTO `sys_user` VALUES ('40', 'sunbin', 'e10adc3949ba59abbe56e057f20f883e', '孙膑', '0', null, '0', '2017-08-17 10:49:04', '2017-12-07 00:50:55');
INSERT INTO `sys_user` VALUES ('43', 'sunshangxiang', 'e10adc3949ba59abbe56e057f20f883e', '孙尚香', '0', null, '0', '2017-08-22 00:10:42', '2017-09-12 00:40:34');
INSERT INTO `sys_user` VALUES ('47', 'wuzetian', 'e10adc3949ba59abbe56e057f20f883e', '武则天', '0', null, '0', '2017-09-12 00:25:05', '2017-12-07 00:50:44');
INSERT INTO `sys_user` VALUES ('57', 'zhangliang', 'e10adc3949ba59abbe56e057f20f883e', '张良', '0', null, '0', '2017-12-07 00:51:19', '2017-12-07 00:51:19');
INSERT INTO `sys_user` VALUES ('58', 'sunwukong', 'e10adc3949ba59abbe56e057f20f883e', '孙悟空', '0', null, '0', '2017-12-07 00:51:40', '2017-12-07 00:51:40');
INSERT INTO `sys_user` VALUES ('59', 'zhouyu', 'e10adc3949ba59abbe56e057f20f883e', '周瑜', '2', null, '0', '2017-12-07 00:52:17', '2017-12-07 00:52:17');
INSERT INTO `sys_user` VALUES ('60', 'diaochan', 'e10adc3949ba59abbe56e057f20f883e', '貂蝉', '1', null, '0', '2017-12-07 00:52:32', '2017-12-07 00:52:32');
INSERT INTO `sys_user` VALUES ('61', 'bailishouyue', 'e10adc3949ba59abbe56e057f20f883e', '百里守约', '0', null, '0', '2017-12-07 00:52:52', '2017-12-07 00:52:52');
INSERT INTO `sys_user` VALUES ('62', 'laofuzi', 'e10adc3949ba59abbe56e057f20f883e', '老夫子', '2', null, '0', '2017-12-07 00:53:40', '2017-12-07 00:53:40');
INSERT INTO `sys_user` VALUES ('63', 'zhugeliang', 'e10adc3949ba59abbe56e057f20f883e', '诸葛亮', '0', null, '0', '2017-12-21 16:51:51', '2017-12-21 16:51:51');
INSERT INTO `sys_user` VALUES ('64', 'daji2017', 'e10adc3949ba59abbe56e057f20f883e', '妲己', '0', null, '0', '2017-12-21 16:52:32', '2017-12-21 16:52:32');
INSERT INTO `sys_user` VALUES ('65', 'zhongkui', 'e10adc3949ba59abbe56e057f20f883e', '钟馗', '0', null, '0', '2017-12-21 16:53:38', '2017-12-21 16:53:38');
INSERT INTO `sys_user` VALUES ('66', 'zhenji', 'e10adc3949ba59abbe56e057f20f883e', '甄姬', '0', null, '0', '2017-12-21 16:53:51', '2017-12-21 16:53:51');
INSERT INTO `sys_user` VALUES ('67', 'taiyizhenren', 'e10adc3949ba59abbe56e057f20f883e', '太乙真人', '0', null, '0', '2017-12-21 16:54:13', '2017-12-21 16:54:13');
INSERT INTO `sys_user` VALUES ('68', 'mingshiyin', 'e10adc3949ba59abbe56e057f20f883e', '明世隐', '0', null, '0', '2017-12-21 16:54:24', '2017-12-21 16:54:24');
INSERT INTO `sys_user` VALUES ('69', 'nvwa2017', 'e10adc3949ba59abbe56e057f20f883e', '女娲', '1', null, '0', '2017-12-21 16:54:48', '2017-12-21 16:54:48');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `app_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('121', '38', '7', '4');
INSERT INTO `sys_user_role` VALUES ('220', '1', '1', '4');
INSERT INTO `sys_user_role` VALUES ('221', '34', '15', '89');
INSERT INTO `sys_user_role` VALUES ('223', '39', '16', '86');
INSERT INTO `sys_user_role` VALUES ('237', '43', '2', '4');
INSERT INTO `sys_user_role` VALUES ('240', '40', '2', '4');
INSERT INTO `sys_user_role` VALUES ('241', '47', '4', '4');
INSERT INTO `sys_user_role` VALUES ('242', '59', '2', '4');
INSERT INTO `sys_user_role` VALUES ('243', '60', '2', '4');
