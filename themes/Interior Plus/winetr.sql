-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 �?01 �?18 �?09:49
-- 服务器版本: 5.5.47
-- PHP 版本: 5.5.30

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `winetr`
--

-- --------------------------------------------------------

--
-- 表的结构 `winter_ad`
--

CREATE TABLE IF NOT EXISTS `winter_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `winter_asset`
--

CREATE TABLE IF NOT EXISTS `winter_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `winter_auth_access`
--

CREATE TABLE IF NOT EXISTS `winter_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- --------------------------------------------------------

--
-- 表的结构 `winter_auth_rule`
--

CREATE TABLE IF NOT EXISTS `winter_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='权限规则表' AUTO_INCREMENT=174 ;

--
-- 转存表中的数据 `winter_auth_rule`
--

INSERT INTO `winter_auth_rule` (`id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition`) VALUES
(1, 'Admin', 'admin_url', 'admin/content/default', NULL, '内容管理', 1, ''),
(2, 'Api', 'admin_url', 'api/guestbookadmin/index', NULL, '所有留言', 1, ''),
(3, 'Api', 'admin_url', 'api/guestbookadmin/delete', NULL, '删除网站留言', 1, ''),
(4, 'Comment', 'admin_url', 'comment/commentadmin/index', NULL, '评论管理', 1, ''),
(5, 'Comment', 'admin_url', 'comment/commentadmin/delete', NULL, '删除评论', 1, ''),
(6, 'Comment', 'admin_url', 'comment/commentadmin/check', NULL, '评论审核', 1, ''),
(7, 'Portal', 'admin_url', 'portal/adminpost/index', NULL, '文章管理', 1, ''),
(8, 'Portal', 'admin_url', 'portal/adminpost/listorders', NULL, '文章排序', 1, ''),
(9, 'Portal', 'admin_url', 'portal/adminpost/top', NULL, '文章置顶', 1, ''),
(10, 'Portal', 'admin_url', 'portal/adminpost/recommend', NULL, '文章推荐', 1, ''),
(11, 'Portal', 'admin_url', 'portal/adminpost/move', NULL, '批量移动', 1, ''),
(12, 'Portal', 'admin_url', 'portal/adminpost/check', NULL, '文章审核', 1, ''),
(13, 'Portal', 'admin_url', 'portal/adminpost/delete', NULL, '删除文章', 1, ''),
(14, 'Portal', 'admin_url', 'portal/adminpost/edit', NULL, '编辑文章', 1, ''),
(15, 'Portal', 'admin_url', 'portal/adminpost/edit_post', NULL, '提交编辑', 1, ''),
(16, 'Portal', 'admin_url', 'portal/adminpost/add', NULL, '添加文章', 1, ''),
(17, 'Portal', 'admin_url', 'portal/adminpost/add_post', NULL, '提交添加', 1, ''),
(18, 'Portal', 'admin_url', 'portal/adminterm/index', NULL, '分类管理', 1, ''),
(19, 'Portal', 'admin_url', 'portal/adminterm/listorders', NULL, '文章分类排序', 1, ''),
(20, 'Portal', 'admin_url', 'portal/adminterm/delete', NULL, '删除分类', 1, ''),
(21, 'Portal', 'admin_url', 'portal/adminterm/edit', NULL, '编辑分类', 1, ''),
(22, 'Portal', 'admin_url', 'portal/adminterm/edit_post', NULL, '提交编辑', 1, ''),
(23, 'Portal', 'admin_url', 'portal/adminterm/add', NULL, '添加分类', 1, ''),
(24, 'Portal', 'admin_url', 'portal/adminterm/add_post', NULL, '提交添加', 1, ''),
(25, 'Portal', 'admin_url', 'portal/adminpage/index', NULL, '页面管理', 1, ''),
(26, 'Portal', 'admin_url', 'portal/adminpage/listorders', NULL, '页面排序', 1, ''),
(27, 'Portal', 'admin_url', 'portal/adminpage/delete', NULL, '删除页面', 1, ''),
(28, 'Portal', 'admin_url', 'portal/adminpage/edit', NULL, '编辑页面', 1, ''),
(29, 'Portal', 'admin_url', 'portal/adminpage/edit_post', NULL, '提交编辑', 1, ''),
(30, 'Portal', 'admin_url', 'portal/adminpage/add', NULL, '添加页面', 1, ''),
(31, 'Portal', 'admin_url', 'portal/adminpage/add_post', NULL, '提交添加', 1, ''),
(32, 'Admin', 'admin_url', 'admin/recycle/default', NULL, '回收站', 1, ''),
(33, 'Portal', 'admin_url', 'portal/adminpost/recyclebin', NULL, '文章回收', 1, ''),
(34, 'Portal', 'admin_url', 'portal/adminpost/restore', NULL, '文章还原', 1, ''),
(35, 'Portal', 'admin_url', 'portal/adminpost/clean', NULL, '彻底删除', 1, ''),
(36, 'Portal', 'admin_url', 'portal/adminpage/recyclebin', NULL, '页面回收', 1, ''),
(37, 'Portal', 'admin_url', 'portal/adminpage/clean', NULL, '彻底删除', 1, ''),
(38, 'Portal', 'admin_url', 'portal/adminpage/restore', NULL, '页面还原', 1, ''),
(39, 'Admin', 'admin_url', 'admin/extension/default', NULL, '扩展工具', 1, ''),
(40, 'Admin', 'admin_url', 'admin/backup/default', NULL, '备份管理', 1, ''),
(41, 'Admin', 'admin_url', 'admin/backup/restore', NULL, '数据还原', 1, ''),
(42, 'Admin', 'admin_url', 'admin/backup/index', NULL, '数据备份', 1, ''),
(43, 'Admin', 'admin_url', 'admin/backup/index_post', NULL, '提交数据备份', 1, ''),
(44, 'Admin', 'admin_url', 'admin/backup/download', NULL, '下载备份', 1, ''),
(45, 'Admin', 'admin_url', 'admin/backup/del_backup', NULL, '删除备份', 1, ''),
(46, 'Admin', 'admin_url', 'admin/backup/import', NULL, '数据备份导入', 1, ''),
(47, 'Admin', 'admin_url', 'admin/plugin/index', NULL, '插件管理', 1, ''),
(48, 'Admin', 'admin_url', 'admin/plugin/toggle', NULL, '插件启用切换', 1, ''),
(49, 'Admin', 'admin_url', 'admin/plugin/setting', NULL, '插件设置', 1, ''),
(50, 'Admin', 'admin_url', 'admin/plugin/setting_post', NULL, '插件设置提交', 1, ''),
(51, 'Admin', 'admin_url', 'admin/plugin/install', NULL, '插件安装', 1, ''),
(52, 'Admin', 'admin_url', 'admin/plugin/uninstall', NULL, '插件卸载', 1, ''),
(53, 'Admin', 'admin_url', 'admin/slide/default', NULL, '幻灯片', 1, ''),
(54, 'Admin', 'admin_url', 'admin/slide/index', NULL, '幻灯片管理', 1, ''),
(55, 'Admin', 'admin_url', 'admin/slide/listorders', NULL, '幻灯片排序', 1, ''),
(56, 'Admin', 'admin_url', 'admin/slide/toggle', NULL, '幻灯片显示切换', 1, ''),
(57, 'Admin', 'admin_url', 'admin/slide/delete', NULL, '删除幻灯片', 1, ''),
(58, 'Admin', 'admin_url', 'admin/slide/edit', NULL, '编辑幻灯片', 1, ''),
(59, 'Admin', 'admin_url', 'admin/slide/edit_post', NULL, '提交编辑', 1, ''),
(60, 'Admin', 'admin_url', 'admin/slide/add', NULL, '添加幻灯片', 1, ''),
(61, 'Admin', 'admin_url', 'admin/slide/add_post', NULL, '提交添加', 1, ''),
(62, 'Admin', 'admin_url', 'admin/slidecat/index', NULL, '幻灯片分类', 1, ''),
(63, 'Admin', 'admin_url', 'admin/slidecat/delete', NULL, '删除分类', 1, ''),
(64, 'Admin', 'admin_url', 'admin/slidecat/edit', NULL, '编辑分类', 1, ''),
(65, 'Admin', 'admin_url', 'admin/slidecat/edit_post', NULL, '提交编辑', 1, ''),
(66, 'Admin', 'admin_url', 'admin/slidecat/add', NULL, '添加分类', 1, ''),
(67, 'Admin', 'admin_url', 'admin/slidecat/add_post', NULL, '提交添加', 1, ''),
(68, 'Admin', 'admin_url', 'admin/ad/index', NULL, '网站广告', 1, ''),
(69, 'Admin', 'admin_url', 'admin/ad/toggle', NULL, '广告显示切换', 1, ''),
(70, 'Admin', 'admin_url', 'admin/ad/delete', NULL, '删除广告', 1, ''),
(71, 'Admin', 'admin_url', 'admin/ad/edit', NULL, '编辑广告', 1, ''),
(72, 'Admin', 'admin_url', 'admin/ad/edit_post', NULL, '提交编辑', 1, ''),
(73, 'Admin', 'admin_url', 'admin/ad/add', NULL, '添加广告', 1, ''),
(74, 'Admin', 'admin_url', 'admin/ad/add_post', NULL, '提交添加', 1, ''),
(75, 'Admin', 'admin_url', 'admin/link/index', NULL, '友情链接', 1, ''),
(76, 'Admin', 'admin_url', 'admin/link/listorders', NULL, '友情链接排序', 1, ''),
(77, 'Admin', 'admin_url', 'admin/link/toggle', NULL, '友链显示切换', 1, ''),
(78, 'Admin', 'admin_url', 'admin/link/delete', NULL, '删除友情链接', 1, ''),
(79, 'Admin', 'admin_url', 'admin/link/edit', NULL, '编辑友情链接', 1, ''),
(80, 'Admin', 'admin_url', 'admin/link/edit_post', NULL, '提交编辑', 1, ''),
(81, 'Admin', 'admin_url', 'admin/link/add', NULL, '添加友情链接', 1, ''),
(82, 'Admin', 'admin_url', 'admin/link/add_post', NULL, '提交添加', 1, ''),
(83, 'Api', 'admin_url', 'api/oauthadmin/setting', NULL, '第三方登陆', 1, ''),
(84, 'Api', 'admin_url', 'api/oauthadmin/setting_post', NULL, '提交设置', 1, ''),
(85, 'Admin', 'admin_url', 'admin/menu/default', NULL, '菜单管理', 1, ''),
(86, 'Admin', 'admin_url', 'admin/navcat/default1', NULL, '前台菜单', 1, ''),
(87, 'Admin', 'admin_url', 'admin/nav/index', NULL, '菜单管理', 1, ''),
(88, 'Admin', 'admin_url', 'admin/nav/listorders', NULL, '前台导航排序', 1, ''),
(89, 'Admin', 'admin_url', 'admin/nav/delete', NULL, '删除菜单', 1, ''),
(90, 'Admin', 'admin_url', 'admin/nav/edit', NULL, '编辑菜单', 1, ''),
(91, 'Admin', 'admin_url', 'admin/nav/edit_post', NULL, '提交编辑', 1, ''),
(92, 'Admin', 'admin_url', 'admin/nav/add', NULL, '添加菜单', 1, ''),
(93, 'Admin', 'admin_url', 'admin/nav/add_post', NULL, '提交添加', 1, ''),
(94, 'Admin', 'admin_url', 'admin/navcat/index', NULL, '菜单分类', 1, ''),
(95, 'Admin', 'admin_url', 'admin/navcat/delete', NULL, '删除分类', 1, ''),
(96, 'Admin', 'admin_url', 'admin/navcat/edit', NULL, '编辑分类', 1, ''),
(97, 'Admin', 'admin_url', 'admin/navcat/edit_post', NULL, '提交编辑', 1, ''),
(98, 'Admin', 'admin_url', 'admin/navcat/add', NULL, '添加分类', 1, ''),
(99, 'Admin', 'admin_url', 'admin/navcat/add_post', NULL, '提交添加', 1, ''),
(100, 'Admin', 'admin_url', 'admin/menu/index', NULL, '后台菜单', 1, ''),
(101, 'Admin', 'admin_url', 'admin/menu/add', NULL, '添加菜单', 1, ''),
(102, 'Admin', 'admin_url', 'admin/menu/add_post', NULL, '提交添加', 1, ''),
(103, 'Admin', 'admin_url', 'admin/menu/listorders', NULL, '后台菜单排序', 1, ''),
(104, 'Admin', 'admin_url', 'admin/menu/export_menu', NULL, '菜单备份', 1, ''),
(105, 'Admin', 'admin_url', 'admin/menu/edit', NULL, '编辑菜单', 1, ''),
(106, 'Admin', 'admin_url', 'admin/menu/edit_post', NULL, '提交编辑', 1, ''),
(107, 'Admin', 'admin_url', 'admin/menu/delete', NULL, '删除菜单', 1, ''),
(108, 'Admin', 'admin_url', 'admin/menu/lists', NULL, '所有菜单', 1, ''),
(109, 'Admin', 'admin_url', 'admin/setting/default', NULL, '设置', 1, ''),
(110, 'Admin', 'admin_url', 'admin/setting/userdefault', NULL, '个人信息', 1, ''),
(111, 'Admin', 'admin_url', 'admin/user/userinfo', NULL, '修改信息', 1, ''),
(112, 'Admin', 'admin_url', 'admin/user/userinfo_post', NULL, '修改信息提交', 1, ''),
(113, 'Admin', 'admin_url', 'admin/setting/password', NULL, '修改密码', 1, ''),
(114, 'Admin', 'admin_url', 'admin/setting/password_post', NULL, '提交修改', 1, ''),
(115, 'Admin', 'admin_url', 'admin/setting/site', NULL, '网站信息', 1, ''),
(116, 'Admin', 'admin_url', 'admin/setting/site_post', NULL, '提交修改', 1, ''),
(117, 'Admin', 'admin_url', 'admin/route/index', NULL, '路由列表', 1, ''),
(118, 'Admin', 'admin_url', 'admin/route/add', NULL, '路由添加', 1, ''),
(119, 'Admin', 'admin_url', 'admin/route/add_post', NULL, '路由添加提交', 1, ''),
(120, 'Admin', 'admin_url', 'admin/route/edit', NULL, '路由编辑', 1, ''),
(121, 'Admin', 'admin_url', 'admin/route/edit_post', NULL, '路由编辑提交', 1, ''),
(122, 'Admin', 'admin_url', 'admin/route/delete', NULL, '路由删除', 1, ''),
(123, 'Admin', 'admin_url', 'admin/route/ban', NULL, '路由禁止', 1, ''),
(124, 'Admin', 'admin_url', 'admin/route/open', NULL, '路由启用', 1, ''),
(125, 'Admin', 'admin_url', 'admin/route/listorders', NULL, '路由排序', 1, ''),
(126, 'Admin', 'admin_url', 'admin/mailer/default', NULL, '邮箱配置', 1, ''),
(127, 'Admin', 'admin_url', 'admin/mailer/index', NULL, 'SMTP配置', 1, ''),
(128, 'Admin', 'admin_url', 'admin/mailer/index_post', NULL, '提交配置', 1, ''),
(129, 'Admin', 'admin_url', 'admin/mailer/active', NULL, '注册邮件模板', 1, ''),
(130, 'Admin', 'admin_url', 'admin/mailer/active_post', NULL, '提交模板', 1, ''),
(131, 'Admin', 'admin_url', 'admin/setting/clearcache', NULL, '清除缓存', 1, ''),
(132, 'User', 'admin_url', 'user/indexadmin/default', NULL, '用户管理', 1, ''),
(133, 'User', 'admin_url', 'user/indexadmin/default1', NULL, '用户组', 1, ''),
(134, 'User', 'admin_url', 'user/indexadmin/index', NULL, '本站用户', 1, ''),
(135, 'User', 'admin_url', 'user/indexadmin/ban', NULL, '拉黑会员', 1, ''),
(136, 'User', 'admin_url', 'user/indexadmin/cancelban', NULL, '启用会员', 1, ''),
(137, 'User', 'admin_url', 'user/oauthadmin/index', NULL, '第三方用户', 1, ''),
(138, 'User', 'admin_url', 'user/oauthadmin/delete', NULL, '第三方用户解绑', 1, ''),
(139, 'User', 'admin_url', 'user/indexadmin/default3', NULL, '管理组', 1, ''),
(140, 'Admin', 'admin_url', 'admin/rbac/index', NULL, '角色管理', 1, ''),
(141, 'Admin', 'admin_url', 'admin/rbac/member', NULL, '成员管理', 1, ''),
(142, 'Admin', 'admin_url', 'admin/rbac/authorize', NULL, '权限设置', 1, ''),
(143, 'Admin', 'admin_url', 'admin/rbac/authorize_post', NULL, '提交设置', 1, ''),
(144, 'Admin', 'admin_url', 'admin/rbac/roleedit', NULL, '编辑角色', 1, ''),
(145, 'Admin', 'admin_url', 'admin/rbac/roleedit_post', NULL, '提交编辑', 1, ''),
(146, 'Admin', 'admin_url', 'admin/rbac/roledelete', NULL, '删除角色', 1, ''),
(147, 'Admin', 'admin_url', 'admin/rbac/roleadd', NULL, '添加角色', 1, ''),
(148, 'Admin', 'admin_url', 'admin/rbac/roleadd_post', NULL, '提交添加', 1, ''),
(149, 'Admin', 'admin_url', 'admin/user/index', NULL, '管理员', 1, ''),
(150, 'Admin', 'admin_url', 'admin/user/delete', NULL, '删除管理员', 1, ''),
(151, 'Admin', 'admin_url', 'admin/user/edit', NULL, '管理员编辑', 1, ''),
(152, 'Admin', 'admin_url', 'admin/user/edit_post', NULL, '编辑提交', 1, ''),
(153, 'Admin', 'admin_url', 'admin/user/add', NULL, '管理员添加', 1, ''),
(154, 'Admin', 'admin_url', 'admin/user/add_post', NULL, '添加提交', 1, ''),
(155, 'Admin', 'admin_url', 'admin/plugin/update', NULL, '插件更新', 1, ''),
(156, 'Admin', 'admin_url', 'admin/storage/index', NULL, '文件存储', 1, ''),
(157, 'Admin', 'admin_url', 'admin/storage/setting_post', NULL, '文件存储设置提交', 1, ''),
(158, 'Admin', 'admin_url', 'admin/slide/ban', NULL, '禁用幻灯片', 1, ''),
(159, 'Admin', 'admin_url', 'admin/slide/cancelban', NULL, '启用幻灯片', 1, ''),
(160, 'Admin', 'admin_url', 'admin/user/ban', NULL, '禁用管理员', 1, ''),
(161, 'Admin', 'admin_url', 'admin/user/cancelban', NULL, '启用管理员', 1, ''),
(162, 'Demo', 'admin_url', 'demo/adminindex/index', NULL, '', 1, ''),
(163, 'Demo', 'admin_url', 'demo/adminindex/last', NULL, '', 1, ''),
(166, 'Admin', 'admin_url', 'admin/mailer/test', NULL, '测试邮件', 1, ''),
(167, 'Admin', 'admin_url', 'admin/setting/upload', NULL, '上传设置', 1, ''),
(168, 'Admin', 'admin_url', 'admin/setting/upload_post', NULL, '上传设置提交', 1, ''),
(169, 'Portal', 'admin_url', 'portal/adminpost/copy', NULL, '文章批量复制', 1, ''),
(170, 'Admin', 'admin_url', 'admin/menu/backup_menu', NULL, '备份菜单', 1, ''),
(171, 'Admin', 'admin_url', 'admin/menu/export_menu_lang', NULL, '导出后台菜单多语言包', 1, ''),
(172, 'Admin', 'admin_url', 'admin/menu/restore_menu', NULL, '还原菜单', 1, ''),
(173, 'Admin', 'admin_url', 'admin/menu/getactions', NULL, '导入新菜单', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `winter_comments`
--

CREATE TABLE IF NOT EXISTS `winter_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `winter_common_action_log`
--

CREATE TABLE IF NOT EXISTS `winter_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `winter_guestbook`
--

CREATE TABLE IF NOT EXISTS `winter_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `winter_links`
--

CREATE TABLE IF NOT EXISTS `winter_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='友情链接表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `winter_links`
--

INSERT INTO `winter_links` (`link_id`, `link_url`, `link_name`, `link_image`, `link_target`, `link_description`, `link_status`, `link_rating`, `link_rel`, `listorder`) VALUES
(1, 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '', 1, 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `winter_menu`
--

CREATE TABLE IF NOT EXISTS `winter_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` varchar(30) NOT NULL DEFAULT '' COMMENT '应用名称app',
  `model` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称',
  `data` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='后台菜单表' AUTO_INCREMENT=187 ;

--
-- 转存表中的数据 `winter_menu`
--

INSERT INTO `winter_menu` (`id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder`) VALUES
(1, 0, 'Admin', 'Content', 'default', '', 0, 1, '内容管理', 'th', '', 30),
(2, 1, 'Api', 'Guestbookadmin', 'index', '', 1, 1, '所有留言', '', '', 0),
(3, 2, 'Api', 'Guestbookadmin', 'delete', '', 1, 0, '删除网站留言', '', '', 0),
(4, 1, 'Comment', 'Commentadmin', 'index', '', 1, 1, '评论管理', '', '', 0),
(5, 4, 'Comment', 'Commentadmin', 'delete', '', 1, 0, '删除评论', '', '', 0),
(6, 4, 'Comment', 'Commentadmin', 'check', '', 1, 0, '评论审核', '', '', 0),
(7, 1, 'Portal', 'AdminPost', 'index', '', 1, 1, '文章管理', '', '', 1),
(8, 7, 'Portal', 'AdminPost', 'listorders', '', 1, 0, '文章排序', '', '', 0),
(9, 7, 'Portal', 'AdminPost', 'top', '', 1, 0, '文章置顶', '', '', 0),
(10, 7, 'Portal', 'AdminPost', 'recommend', '', 1, 0, '文章推荐', '', '', 0),
(11, 7, 'Portal', 'AdminPost', 'move', '', 1, 0, '批量移动', '', '', 1000),
(12, 7, 'Portal', 'AdminPost', 'check', '', 1, 0, '文章审核', '', '', 1000),
(13, 7, 'Portal', 'AdminPost', 'delete', '', 1, 0, '删除文章', '', '', 1000),
(14, 7, 'Portal', 'AdminPost', 'edit', '', 1, 0, '编辑文章', '', '', 1000),
(15, 14, 'Portal', 'AdminPost', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(16, 7, 'Portal', 'AdminPost', 'add', '', 1, 0, '添加文章', '', '', 1000),
(17, 16, 'Portal', 'AdminPost', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(18, 1, 'Portal', 'AdminTerm', 'index', '', 0, 1, '分类管理', '', '', 2),
(19, 18, 'Portal', 'AdminTerm', 'listorders', '', 1, 0, '文章分类排序', '', '', 0),
(20, 18, 'Portal', 'AdminTerm', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(21, 18, 'Portal', 'AdminTerm', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(22, 21, 'Portal', 'AdminTerm', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(23, 18, 'Portal', 'AdminTerm', 'add', '', 1, 0, '添加分类', '', '', 1000),
(24, 23, 'Portal', 'AdminTerm', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(25, 1, 'Portal', 'AdminPage', 'index', '', 1, 1, '页面管理', '', '', 3),
(26, 25, 'Portal', 'AdminPage', 'listorders', '', 1, 0, '页面排序', '', '', 0),
(27, 25, 'Portal', 'AdminPage', 'delete', '', 1, 0, '删除页面', '', '', 1000),
(28, 25, 'Portal', 'AdminPage', 'edit', '', 1, 0, '编辑页面', '', '', 1000),
(29, 28, 'Portal', 'AdminPage', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(30, 25, 'Portal', 'AdminPage', 'add', '', 1, 0, '添加页面', '', '', 1000),
(31, 30, 'Portal', 'AdminPage', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(32, 1, 'Admin', 'Recycle', 'default', '', 1, 1, '回收站', '', '', 4),
(33, 32, 'Portal', 'AdminPost', 'recyclebin', '', 1, 1, '文章回收', '', '', 0),
(34, 33, 'Portal', 'AdminPost', 'restore', '', 1, 0, '文章还原', '', '', 1000),
(35, 33, 'Portal', 'AdminPost', 'clean', '', 1, 0, '彻底删除', '', '', 1000),
(36, 32, 'Portal', 'AdminPage', 'recyclebin', '', 1, 1, '页面回收', '', '', 1),
(37, 36, 'Portal', 'AdminPage', 'clean', '', 1, 0, '彻底删除', '', '', 1000),
(38, 36, 'Portal', 'AdminPage', 'restore', '', 1, 0, '页面还原', '', '', 1000),
(39, 0, 'Admin', 'Extension', 'default', '', 0, 1, '扩展工具', 'cloud', '', 40),
(40, 39, 'Admin', 'Backup', 'default', '', 1, 0, '备份管理', '', '', 0),
(41, 40, 'Admin', 'Backup', 'restore', '', 1, 1, '数据还原', '', '', 0),
(42, 40, 'Admin', 'Backup', 'index', '', 1, 1, '数据备份', '', '', 0),
(43, 42, 'Admin', 'Backup', 'index_post', '', 1, 0, '提交数据备份', '', '', 0),
(44, 40, 'Admin', 'Backup', 'download', '', 1, 0, '下载备份', '', '', 1000),
(45, 40, 'Admin', 'Backup', 'del_backup', '', 1, 0, '删除备份', '', '', 1000),
(46, 40, 'Admin', 'Backup', 'import', '', 1, 0, '数据备份导入', '', '', 1000),
(47, 39, 'Admin', 'Plugin', 'index', '', 1, 1, '插件管理', '', '', 0),
(48, 47, 'Admin', 'Plugin', 'toggle', '', 1, 0, '插件启用切换', '', '', 0),
(49, 47, 'Admin', 'Plugin', 'setting', '', 1, 0, '插件设置', '', '', 0),
(50, 49, 'Admin', 'Plugin', 'setting_post', '', 1, 0, '插件设置提交', '', '', 0),
(51, 47, 'Admin', 'Plugin', 'install', '', 1, 0, '插件安装', '', '', 0),
(52, 47, 'Admin', 'Plugin', 'uninstall', '', 1, 0, '插件卸载', '', '', 0),
(53, 39, 'Admin', 'Slide', 'default', '', 1, 1, '幻灯片', '', '', 1),
(54, 53, 'Admin', 'Slide', 'index', '', 1, 1, '幻灯片管理', '', '', 0),
(55, 54, 'Admin', 'Slide', 'listorders', '', 1, 0, '幻灯片排序', '', '', 0),
(56, 54, 'Admin', 'Slide', 'toggle', '', 1, 0, '幻灯片显示切换', '', '', 0),
(57, 54, 'Admin', 'Slide', 'delete', '', 1, 0, '删除幻灯片', '', '', 1000),
(58, 54, 'Admin', 'Slide', 'edit', '', 1, 0, '编辑幻灯片', '', '', 1000),
(59, 58, 'Admin', 'Slide', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(60, 54, 'Admin', 'Slide', 'add', '', 1, 0, '添加幻灯片', '', '', 1000),
(61, 60, 'Admin', 'Slide', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(62, 53, 'Admin', 'Slidecat', 'index', '', 1, 1, '幻灯片分类', '', '', 0),
(63, 62, 'Admin', 'Slidecat', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(64, 62, 'Admin', 'Slidecat', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(65, 64, 'Admin', 'Slidecat', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(66, 62, 'Admin', 'Slidecat', 'add', '', 1, 0, '添加分类', '', '', 1000),
(67, 66, 'Admin', 'Slidecat', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(68, 39, 'Admin', 'Ad', 'index', '', 1, 1, '网站广告', '', '', 2),
(69, 68, 'Admin', 'Ad', 'toggle', '', 1, 0, '广告显示切换', '', '', 0),
(70, 68, 'Admin', 'Ad', 'delete', '', 1, 0, '删除广告', '', '', 1000),
(71, 68, 'Admin', 'Ad', 'edit', '', 1, 0, '编辑广告', '', '', 1000),
(72, 71, 'Admin', 'Ad', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(73, 68, 'Admin', 'Ad', 'add', '', 1, 0, '添加广告', '', '', 1000),
(74, 73, 'Admin', 'Ad', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(75, 39, 'Admin', 'Link', 'index', '', 0, 1, '友情链接', '', '', 3),
(76, 75, 'Admin', 'Link', 'listorders', '', 1, 0, '友情链接排序', '', '', 0),
(77, 75, 'Admin', 'Link', 'toggle', '', 1, 0, '友链显示切换', '', '', 0),
(78, 75, 'Admin', 'Link', 'delete', '', 1, 0, '删除友情链接', '', '', 1000),
(79, 75, 'Admin', 'Link', 'edit', '', 1, 0, '编辑友情链接', '', '', 1000),
(80, 79, 'Admin', 'Link', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(81, 75, 'Admin', 'Link', 'add', '', 1, 0, '添加友情链接', '', '', 1000),
(82, 81, 'Admin', 'Link', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(83, 39, 'Api', 'Oauthadmin', 'setting', '', 1, 1, '第三方登陆', 'leaf', '', 4),
(84, 83, 'Api', 'Oauthadmin', 'setting_post', '', 1, 0, '提交设置', '', '', 0),
(85, 0, 'Admin', 'Menu', 'default', '', 1, 1, '菜单管理', 'list', '', 20),
(86, 85, 'Admin', 'Navcat', 'default1', '', 1, 1, '前台菜单', '', '', 0),
(87, 86, 'Admin', 'Nav', 'index', '', 1, 1, '菜单管理', '', '', 0),
(88, 87, 'Admin', 'Nav', 'listorders', '', 1, 0, '前台导航排序', '', '', 0),
(89, 87, 'Admin', 'Nav', 'delete', '', 1, 0, '删除菜单', '', '', 1000),
(90, 87, 'Admin', 'Nav', 'edit', '', 1, 0, '编辑菜单', '', '', 1000),
(91, 90, 'Admin', 'Nav', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(92, 87, 'Admin', 'Nav', 'add', '', 1, 0, '添加菜单', '', '', 1000),
(93, 92, 'Admin', 'Nav', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(94, 86, 'Admin', 'Navcat', 'index', '', 1, 1, '菜单分类', '', '', 0),
(95, 94, 'Admin', 'Navcat', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(96, 94, 'Admin', 'Navcat', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(97, 96, 'Admin', 'Navcat', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(98, 94, 'Admin', 'Navcat', 'add', '', 1, 0, '添加分类', '', '', 1000),
(99, 98, 'Admin', 'Navcat', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(100, 85, 'Admin', 'Menu', 'index', '', 1, 1, '后台菜单', '', '', 0),
(101, 100, 'Admin', 'Menu', 'add', '', 1, 0, '添加菜单', '', '', 0),
(102, 101, 'Admin', 'Menu', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(103, 100, 'Admin', 'Menu', 'listorders', '', 1, 0, '后台菜单排序', '', '', 0),
(104, 100, 'Admin', 'Menu', 'export_menu', '', 1, 0, '菜单备份', '', '', 1000),
(105, 100, 'Admin', 'Menu', 'edit', '', 1, 0, '编辑菜单', '', '', 1000),
(106, 105, 'Admin', 'Menu', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(107, 100, 'Admin', 'Menu', 'delete', '', 1, 0, '删除菜单', '', '', 1000),
(108, 100, 'Admin', 'Menu', 'lists', '', 1, 0, '所有菜单', '', '', 1000),
(109, 0, 'Admin', 'Setting', 'default', '', 0, 1, '设置', 'cogs', '', 0),
(110, 109, 'Admin', 'Setting', 'userdefault', '', 0, 1, '个人信息', '', '', 0),
(111, 110, 'Admin', 'User', 'userinfo', '', 1, 1, '修改信息', '', '', 0),
(112, 111, 'Admin', 'User', 'userinfo_post', '', 1, 0, '修改信息提交', '', '', 0),
(113, 110, 'Admin', 'Setting', 'password', '', 1, 1, '修改密码', '', '', 0),
(114, 113, 'Admin', 'Setting', 'password_post', '', 1, 0, '提交修改', '', '', 0),
(115, 109, 'Admin', 'Setting', 'site', '', 1, 1, '网站信息', '', '', 0),
(116, 115, 'Admin', 'Setting', 'site_post', '', 1, 0, '提交修改', '', '', 0),
(117, 115, 'Admin', 'Route', 'index', '', 1, 0, '路由列表', '', '', 0),
(118, 115, 'Admin', 'Route', 'add', '', 1, 0, '路由添加', '', '', 0),
(119, 118, 'Admin', 'Route', 'add_post', '', 1, 0, '路由添加提交', '', '', 0),
(120, 115, 'Admin', 'Route', 'edit', '', 1, 0, '路由编辑', '', '', 0),
(121, 120, 'Admin', 'Route', 'edit_post', '', 1, 0, '路由编辑提交', '', '', 0),
(122, 115, 'Admin', 'Route', 'delete', '', 1, 0, '路由删除', '', '', 0),
(123, 115, 'Admin', 'Route', 'ban', '', 1, 0, '路由禁止', '', '', 0),
(124, 115, 'Admin', 'Route', 'open', '', 1, 0, '路由启用', '', '', 0),
(125, 115, 'Admin', 'Route', 'listorders', '', 1, 0, '路由排序', '', '', 0),
(126, 109, 'Admin', 'Mailer', 'default', '', 1, 1, '邮箱配置', '', '', 0),
(127, 126, 'Admin', 'Mailer', 'index', '', 1, 1, 'SMTP配置', '', '', 0),
(128, 127, 'Admin', 'Mailer', 'index_post', '', 1, 0, '提交配置', '', '', 0),
(129, 126, 'Admin', 'Mailer', 'active', '', 1, 1, '注册邮件模板', '', '', 0),
(130, 129, 'Admin', 'Mailer', 'active_post', '', 1, 0, '提交模板', '', '', 0),
(131, 109, 'Admin', 'Setting', 'clearcache', '', 1, 1, '清除缓存', '', '', 1),
(132, 0, 'User', 'Indexadmin', 'default', '', 1, 1, '用户管理', 'group', '', 10),
(133, 132, 'User', 'Indexadmin', 'default1', '', 1, 1, '用户组', '', '', 0),
(134, 133, 'User', 'Indexadmin', 'index', '', 1, 1, '本站用户', 'leaf', '', 0),
(135, 134, 'User', 'Indexadmin', 'ban', '', 1, 0, '拉黑会员', '', '', 0),
(136, 134, 'User', 'Indexadmin', 'cancelban', '', 1, 0, '启用会员', '', '', 0),
(137, 133, 'User', 'Oauthadmin', 'index', '', 1, 1, '第三方用户', 'leaf', '', 0),
(138, 137, 'User', 'Oauthadmin', 'delete', '', 1, 0, '第三方用户解绑', '', '', 0),
(139, 132, 'User', 'Indexadmin', 'default3', '', 1, 1, '管理组', '', '', 0),
(140, 139, 'Admin', 'Rbac', 'index', '', 1, 1, '角色管理', '', '', 0),
(141, 140, 'Admin', 'Rbac', 'member', '', 1, 0, '成员管理', '', '', 1000),
(142, 140, 'Admin', 'Rbac', 'authorize', '', 1, 0, '权限设置', '', '', 1000),
(143, 142, 'Admin', 'Rbac', 'authorize_post', '', 1, 0, '提交设置', '', '', 0),
(144, 140, 'Admin', 'Rbac', 'roleedit', '', 1, 0, '编辑角色', '', '', 1000),
(145, 144, 'Admin', 'Rbac', 'roleedit_post', '', 1, 0, '提交编辑', '', '', 0),
(146, 140, 'Admin', 'Rbac', 'roledelete', '', 1, 1, '删除角色', '', '', 1000),
(147, 140, 'Admin', 'Rbac', 'roleadd', '', 1, 1, '添加角色', '', '', 1000),
(148, 147, 'Admin', 'Rbac', 'roleadd_post', '', 1, 0, '提交添加', '', '', 0),
(149, 139, 'Admin', 'User', 'index', '', 1, 1, '管理员', '', '', 0),
(150, 149, 'Admin', 'User', 'delete', '', 1, 0, '删除管理员', '', '', 1000),
(151, 149, 'Admin', 'User', 'edit', '', 1, 0, '管理员编辑', '', '', 1000),
(152, 151, 'Admin', 'User', 'edit_post', '', 1, 0, '编辑提交', '', '', 0),
(153, 149, 'Admin', 'User', 'add', '', 1, 0, '管理员添加', '', '', 1000),
(154, 153, 'Admin', 'User', 'add_post', '', 1, 0, '添加提交', '', '', 0),
(155, 47, 'Admin', 'Plugin', 'update', '', 1, 0, '插件更新', '', '', 0),
(156, 109, 'Admin', 'Storage', 'index', '', 1, 1, '文件存储', '', '', 0),
(157, 156, 'Admin', 'Storage', 'setting_post', '', 1, 0, '文件存储设置提交', '', '', 0),
(158, 54, 'Admin', 'Slide', 'ban', '', 1, 0, '禁用幻灯片', '', '', 0),
(159, 54, 'Admin', 'Slide', 'cancelban', '', 1, 0, '启用幻灯片', '', '', 0),
(160, 149, 'Admin', 'User', 'ban', '', 1, 0, '禁用管理员', '', '', 0),
(161, 149, 'Admin', 'User', 'cancelban', '', 1, 0, '启用管理员', '', '', 0),
(166, 127, 'Admin', 'Mailer', 'test', '', 1, 0, '测试邮件', '', '', 0),
(167, 109, 'Admin', 'Setting', 'upload', '', 1, 1, '上传设置', '', '', 0),
(168, 167, 'Admin', 'Setting', 'upload_post', '', 1, 0, '上传设置提交', '', '', 0),
(169, 7, 'Portal', 'AdminPost', 'copy', '', 1, 0, '文章批量复制', '', '', 0),
(174, 100, 'Admin', 'Menu', 'backup_menu', '', 1, 0, '备份菜单', '', '', 0),
(175, 100, 'Admin', 'Menu', 'export_menu_lang', '', 1, 0, '导出后台菜单多语言包', '', '', 0),
(176, 100, 'Admin', 'Menu', 'restore_menu', '', 1, 0, '还原菜单', '', '', 0),
(177, 100, 'Admin', 'Menu', 'getactions', '', 1, 0, '导入新菜单', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `winter_nav`
--

CREATE TABLE IF NOT EXISTS `winter_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='前台导航表' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `winter_nav`
--

INSERT INTO `winter_nav` (`id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path`) VALUES
(1, 1, 0, '首页', '', 'home', 'group', 1, 0, '0-1'),
(2, 1, 0, '关于', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"1";}}', 'group', 1, 0, '0-2'),
(3, 1, 0, '服务', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"6";}}', '', 1, 0, '0-3'),
(6, 1, 0, '画廊', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"14";}}', '', 1, 0, '0-6'),
(5, 1, 0, '滚动页', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"3";}}', '', 0, 0, '0-5'),
(7, 1, 0, '联系', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"2";}}', '', 1, 0, '0-7');

-- --------------------------------------------------------

--
-- 表的结构 `winter_nav_cat`
--

CREATE TABLE IF NOT EXISTS `winter_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='前台导航分类表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `winter_nav_cat`
--

INSERT INTO `winter_nav_cat` (`navcid`, `name`, `active`, `remark`) VALUES
(1, '主导航', 1, '主导航');

-- --------------------------------------------------------

--
-- 表的结构 `winter_oauth_user`
--

CREATE TABLE IF NOT EXISTS `winter_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `winter_options`
--

CREATE TABLE IF NOT EXISTS `winter_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='全站配置表' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `winter_options`
--

INSERT INTO `winter_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'member_email_active', '{"title":"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.","template":"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\"http:\\/\\/www.thinkcmf.com\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\"white-space: normal;\\">---<\\/strong><\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\"white-space: normal;\\">---<\\/strong><\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\"\\" href=\\"http:\\/\\/#link#\\" target=\\"_self\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>"}', 1),
(6, 'site_options', '{"site_name":"ThinkCMF\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6","site_admin_url_password":"","site_tpl":"Interior Plus","site_adminstyle":"flat","site_icp":" 2016  Interior Plus . All rights reserved | Design by W3layouts","site_admin_email":"1093630285@qq.com","site_tongji":"","site_copyright":"","site_seo_title":"ThinkCMF\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6","site_seo_keywords":"ThinkCMF,php,\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6,cmf,cms,\\u7b80\\u7ea6\\u98ce, simplewind,framework","site_seo_description":"ThinkCMF\\u662f\\u7b80\\u7ea6\\u98ce\\u7f51\\u7edc\\u79d1\\u6280\\u53d1\\u5e03\\u7684\\u4e00\\u6b3e\\u7528\\u4e8e\\u5feb\\u901f\\u5f00\\u53d1\\u7684\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6","urlmode":"0","html_suffix":"","comment_time_interval":"60"}', 1),
(7, 'cmf_settings', '{"banned_usernames":""}', 1),
(8, 'cdn_settings', '{"cdn_static_root":""}', 1);

-- --------------------------------------------------------

--
-- 表的结构 `winter_plugins`
--

CREATE TABLE IF NOT EXISTS `winter_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `winter_posts`
--

CREATE TABLE IF NOT EXISTS `winter_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post发布日期',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核,3删除',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT '1' COMMENT 'post类型，1文章,2页面',
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Portal文章表' AUTO_INCREMENT=71 ;

--
-- 转存表中的数据 `winter_posts`
--

INSERT INTO `winter_posts` (`id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`) VALUES
(1, 1, '', '', '2016-12-12 19:52:37', '<p>事实上</p>', '试试', '事实上', 3, 1, '2016-12-12 19:53:09', NULL, 0, 1, '', 0, '{"thumb":"","template":""}', 1, 0, 0, 0),
(2, 1, '', '', '2016-12-16 14:15:04', '<p>Betasase ferode vetuyasas deulidas vacsques mtreasades vias asey yoleacene aris masease. Bsaeats laoieu lacsqueses nullader yoleac enanrit ma deuytas.</p>', 'Residential Design', '', 3, 1, '2017-01-11 15:57:34', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20161216\\/5853871a1a0bb.jpg","template":""}', 0, 0, 0, 0),
(3, 1, '', '', '2016-12-16 14:21:42', '<p>Betasase ferode vetuyasas deulidas vacsques mtreasades vias asey yoleacene aris masease. Bsaeats laoieu lacsqueses nullader yoleac enanrit ma deuytas.</p>', 'Office Design', 'Office Design', 3, 1, '2017-01-11 15:57:25', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20161216\\/585388523049f.jpg","template":""}', 0, 0, 0, 0),
(4, 1, '', '', '2016-12-16 14:23:20', '<p>Betasase ferode vetuyasas deulidas vacsques mtreasades vias asey yoleacene aris masease. Bsaeats laoieu lacsqueses nullader yoleac enanrit ma deuytas.</p>', 'Residential Design', 'Residential Design', 3, 1, '2017-01-11 15:57:14', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20161216\\/58538885c4b15.jpg","template":""}', 0, 0, 0, 0),
(5, 1, '', '', '2017-01-11 16:36:37', '<p>Betasase ferode vetuyasas deulidas vacsques mtreasades vias asey yoleacene aris masease. Bsaeats laoieu lacsqueses nullader yoleac enanrit ma deuytas.</p>', 'Residential Design', 'Residential Design', 3, 1, '2017-01-11 16:36:37', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20161216\\/58538885c4b15.jpg","template":""}', 0, 0, 0, 0),
(6, 1, '', '', '2017-01-11 16:36:37', '<p>Betasase ferode vetuyasas deulidas vacsques mtreasades vias asey yoleacene aris masease. Bsaeats laoieu lacsqueses nullader yoleac enanrit ma deuytas.</p>', 'Office Design', 'Office Design', 3, 1, '2017-01-11 16:36:37', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20161216\\/585388523049f.jpg","template":""}', 0, 0, 0, 0),
(7, 1, '', '', '2017-01-11 16:36:37', '<p>Betasase ferode vetuyasas deulidas vacsques mtreasades vias asey yoleacene aris masease. Bsaeats laoieu lacsqueses nullader yoleac enanrit ma deuytas.</p>', 'Residential Design', '', 3, 1, '2017-01-11 16:36:37', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20161216\\/5853871a1a0bb.jpg","template":""}', 0, 0, 0, 0),
(8, 1, '', '', '2017-01-11 16:51:18', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit Mauris ex nulla aliquam ornare facilisis nec</p>', '1', 'Congue scelerisque sit', 1, 1, '2017-01-12 09:45:18', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/5876dfabcbc26.jpg","template":""}', 1, 0, 0, 0),
(9, 1, '', '', '2017-01-11 16:53:30', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit Mauris ex nulla aliquam ornare facilisis nec</p>', '2', 'Scelerisque sitc ongue', 1, 1, '2017-01-12 09:32:15', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170111\\/5875f2c06a2b9.jpg","template":""}', 0, 0, 0, 0),
(10, 1, '', '', '2017-01-11 16:54:30', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit Mauris ex nulla aliquam ornare facilisis nec&nbsp;<br/></p>', '3', 'Guecon scelerisque sit', 1, 1, '2017-01-12 09:32:26', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170111\\/5875f2f10f0a7.jpg","template":""}', 0, 0, 0, 0),
(11, 1, '', '', '2017-01-11 16:55:34', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit Mauris ex nulla aliquam ornare facilisis nec&nbsp;</p>', '4', 'Risquescele congue sit ', 1, 1, '2017-01-12 09:32:39', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170111\\/5875f326679a2.jpg","template":""}', 0, 0, 0, 0),
(12, 1, '', '', '2017-01-11 16:56:18', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit Mauris ex nulla aliquam ornare facilisis nec</p>', '5', 'Blanditiis iure minima', 1, 1, '2017-01-12 09:32:50', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170111\\/5875f35242d3a.jpg","template":""}', 0, 0, 0, 0),
(13, 1, '', '', '2017-01-11 16:56:55', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit Mauris ex nulla aliquam ornare facilisis nec</p>', '6', 'Nulla aliquam ornare', 1, 1, '2017-01-12 09:33:00', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170111\\/5875f37adc925.jpg","template":""}', 0, 0, 0, 0),
(14, 1, '', '', '2017-01-11 17:05:23', '<p>Betasase ferode vetuyasas deulidas vacsques mtreasades vias asey yoleacene aris masease. Bsaeats laoieu lacsqueses nullader yoleac enanrit ma deuytas.</p>', 'Residential Design', 'Residential Design', 1, 1, '2017-01-11 17:05:23', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20161216\\/58538885c4b15.jpg","template":""}', 0, 0, 0, 0),
(15, 1, '', '', '2017-01-11 17:05:23', '<p>Betasase ferode vetuyasas deulidas vacsques mtreasades vias asey yoleacene aris masease. Bsaeats laoieu lacsqueses nullader yoleac enanrit ma deuytas.</p>', 'Office Design', 'Office Design', 1, 1, '2017-01-11 17:05:23', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20161216\\/585388523049f.jpg","template":""}', 0, 0, 0, 0),
(16, 1, '', '', '2017-01-11 17:05:23', '<p>Betasase ferode vetuyasas deulidas vacsques mtreasades vias asey yoleacene aris masease. Bsaeats laoieu lacsqueses nullader yoleac enanrit ma deuytas.</p>', 'Residential Design', '', 1, 1, '2017-01-11 17:05:23', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20161216\\/5853871a1a0bb.jpg","template":""}', 0, 0, 0, 0),
(17, 1, '', '', '2017-01-12 09:53:07', '<p>&nbsp; Quisque varius, nibh ac feugiat interdum, libero massa laoreet tellus, nec congue lorem arcu a nunc. Praesent quis felis eget</p>', '威廉·帕特里克', '&quot;', 1, 1, '2017-01-12 10:04:40', NULL, 0, 1, '', 0, '{"thumb":"","template":""}', 0, 0, 0, 0),
(18, 1, '', '', '2017-01-12 09:55:03', '<p>&nbsp; Vestibulum et consequat justo. Maecenas ultrices malesuada leo porta venenatis. Sed sit amet diam facilisis, interdum tellus nec</p>', '弗雷德里克·维多利亚', '&quot;', 1, 1, '2017-01-12 10:04:12', NULL, 0, 1, '', 0, '{"thumb":"","template":""}', 0, 0, 0, 0),
(19, 1, '', '', '2017-01-12 09:55:37', '<p>&nbsp; Cras elementum sed mi sit amet ullamcorper. Cras sed felis a enim rutrum lobortis a eu nisi. Curabitur justo libero, hendrerit at</p>', '金伯利·汤普森', '&quot;', 1, 1, '2017-01-12 10:04:27', NULL, 0, 1, '', 0, '{"thumb":"","template":""}', 0, 0, 0, 0),
(20, 1, '', '', '2017-01-12 10:08:30', '<p>&nbsp; Quisque varius, nibh ac feugiat interdum, libero massa laoreet tellus, nec congue lorem arcu a nunc. Praesent quis felis eget.</p>', '卧室', '卧室', 3, 1, '2017-01-12 10:10:52', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/5876e5a1380ea.jpg","template":""}', 0, 0, 0, 0),
(21, 1, '', '', '2017-01-12 10:10:55', '<p>&nbsp; Quisque varius, nibh ac feugiat interdum, libero massa laoreet tellus, nec congue lorem arcu a nunc. Praesent quis felis eget.</p>', '客厅', '客厅', 3, 1, '2017-01-12 10:11:42', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/5876e5da3cba2.jpg","template":""}', 0, 0, 0, 0),
(22, 1, '', '', '2017-01-12 10:11:44', '<p><span style="color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(238, 238, 238);">Quisque varius, nibh ac feugiat interdum, libero massa laoreet tellus, nec congue lorem arcu a nunc. Praesent quis felis eget.</span></p>', '客厅2', '客厅2', 3, 1, '2017-01-12 10:12:22', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/5876e60183df2.jpg","template":""}', 0, 0, 0, 0),
(23, 1, '', '', '2017-01-12 10:20:04', '<p>s&#39;s</p>', 's', '', 3, 1, '2017-01-12 10:20:13', NULL, 0, 1, '', 0, '{"thumb":"","template":""}', 0, 0, 0, 0),
(24, 1, '', '', '2017-01-12 15:30:09', '<p><span style="color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(238, 238, 238);">Quisque varius, nibh ac feugiat interdum, libero massa laoreet tellus, nec congue lorem arcu a nunc. Praesent quis felis eget.</span></p>', '客厅2', '客厅2', 1, 1, '2017-01-12 15:30:09', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/5876e60183df2.jpg","template":""}', 0, 0, 0, 0),
(25, 1, '', '', '2017-01-12 15:30:09', '<p>&nbsp; Quisque varius, nibh ac feugiat interdum, libero massa laoreet tellus, nec congue lorem arcu a nunc. Praesent quis felis eget.</p>', '客厅', '客厅', 1, 1, '2017-01-12 15:30:09', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/5876e5da3cba2.jpg","template":""}', 0, 0, 0, 0),
(26, 1, '', '', '2017-01-12 15:30:09', '<p>&nbsp; Quisque varius, nibh ac feugiat interdum, libero massa laoreet tellus, nec congue lorem arcu a nunc. Praesent quis felis eget.</p>', '卧室', '卧室', 1, 1, '2017-01-12 15:30:09', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/5876e5a1380ea.jpg","template":""}', 0, 0, 0, 0),
(27, 1, '', '', '2017-01-12 15:32:37', '', '左侧图片', '右侧图片', 1, 1, '2017-01-12 16:49:13', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/587731c097a48.jpg","template":""}', 0, 0, 0, 1),
(28, 1, '', '', '2017-01-12 15:35:35', '<p><span style="color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</span></p>', 'Adipiscing Elit', 'Adipiscing Elit', 1, 1, '2017-01-12 15:36:15', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/587731e95d418.jpg","template":""}', 0, 0, 0, 0),
(29, 1, '', '', '2017-01-12 15:36:18', '<p><span style="color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</span></p>', 'Donec Magna', 'Donec Magna', 1, 1, '2017-01-12 15:36:47', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/58773205c2aa7.jpg","template":""}', 0, 0, 0, 0),
(30, 1, '', '', '2017-01-12 15:36:49', '<p><span style="color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</span></p>', 'Adipiscing Elit', 'Adipiscing Elit', 1, 1, '2017-01-12 15:37:16', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/5877321f9bf38.jpg","template":""}', 0, 0, 0, 0),
(31, 1, '', '', '2017-01-12 15:37:25', '<p><span style="color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</span></p>', 'Donec Magna', 'Donec Magna', 1, 1, '2017-01-12 15:37:50', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/5877323ccd006.jpg","template":""}', 0, 0, 0, 0),
(32, 1, '', '', '2017-01-12 15:57:48', '', '右侧图片', '右侧图片', 1, 1, '2017-01-12 15:58:28', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/587737202ba4d.jpg","template":""}', 0, 0, 1, 0),
(33, 1, '', '', '2017-01-12 15:58:30', '<p><span style="color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</span></p>', 'Adipiscing Elit', 'Adipiscing Elit', 1, 1, '2017-01-12 15:59:13', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/5877374e8deb4.jpg","template":""}', 0, 0, 0, 0),
(34, 1, '', '', '2017-01-12 15:59:15', '<p><span style="color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</span></p>', 'Donec Magna', 'Donec Magna', 1, 1, '2017-01-12 15:59:41', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/587737633cad1.jpg","template":""}', 0, 0, 0, 0),
(35, 1, '', '', '2017-01-12 15:59:43', '<p><span style="color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</span></p>', 'Adipiscing Elit', 'Adipiscing Elit', 1, 1, '2017-01-12 16:00:14', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/587737804a94a.jpg","template":""}', 0, 0, 0, 0),
(36, 1, '', '', '2017-01-12 16:00:17', '<p><span style="color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</span></p>', 'Donec Magna', 'Donec Magna', 1, 1, '2017-01-12 16:00:44', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/587737a7c908a.jpg","template":""}', 0, 0, 0, 0),
(37, 1, '', '', '2017-01-13 16:11:53', '<p>测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试</p>', 'Accusantium', 'Accusantium', 1, 1, '2017-01-13 16:12:29', NULL, 0, 1, '', 0, '{"thumb":"","template":""}', 0, 0, 0, 0),
(38, 1, '', '', '2017-01-13 16:12:31', '<p>测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2测试2</p>', 'Lorem ipsum', 'Lorem ipsum', 1, 1, '2017-01-13 16:12:50', NULL, 0, 1, '', 0, '{"thumb":"","template":""}', 0, 0, 0, 0),
(39, 1, '', '', '2017-01-13 16:12:52', '<p>测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3测试3</p>', 'adipiscing elit', 'adipiscing elit', 1, 1, '2017-01-13 16:13:13', NULL, 0, 1, '', 0, '{"thumb":"","template":""}', 0, 0, 0, 0),
(40, 1, '', '', '2017-01-13 16:13:16', '<p>测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4</p>', 'Accusantium', 'Accusantium', 1, 1, '2017-01-13 16:13:34', NULL, 0, 1, '', 0, '{"thumb":"","template":""}', 0, 0, 0, 0),
(41, 1, '', '', '2017-01-14 09:00:55', '<p>测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试</p>', 'Nam libero tempore, cum soluta nobis est eligendi', 'Nam libero tempore, cum soluta nobis est eligendi', 1, 1, '2017-01-14 09:07:34', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170114\\/587979c4a74bc.jpg","template":"","photo":[{"url":"portal\\/20170114\\/587979d105e52.jpg","alt":"a2.jpg"}]}', 0, 0, 0, 0),
(42, 1, '', '', '2017-01-14 09:55:07', '<p>测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试</p>', '维多利亚', '说明在这里', 1, 1, '2017-01-14 09:57:11', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170114\\/587985739cc26.jpg","template":""}', 0, 0, 0, 0),
(43, 1, '', '', '2017-01-14 09:57:13', '<p>测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试</p>', 'Tincidun', '说明在这里', 1, 1, '2017-01-14 09:58:05', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170114\\/587985aab6919.jpg","template":""}', 0, 0, 0, 0),
(44, 1, '', '', '2017-01-14 09:58:08', '<p>测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试</p>', 'Posuere', '说明在这里', 1, 1, '2017-01-14 09:58:47', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170114\\/587985d4db8c1.jpg","template":""}', 0, 0, 0, 0),
(45, 1, '', '', '2017-01-14 14:00:59', '<p>测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试</p>', 'Placerat ligula tincidunt', 'Placerat ligula tincidunt', 1, 1, '2017-01-14 14:01:13', NULL, 0, 1, '', 0, '{"thumb":"","template":""}', 0, 0, 0, 0),
(46, 1, '', '', '2017-01-14 14:01:15', '<p>测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4测试4</p>', 'Sed ut perspiciatis unde', 'Sed ut perspiciatis unde', 1, 1, '2017-01-14 14:01:38', NULL, 0, 1, '', 0, '{"thumb":"","template":""}', 0, 0, 0, 0),
(47, 1, '', '', '2017-01-14 14:01:41', '<p>测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试</p>', 'Eaque ipsa quae ab illo', 'Eaque ipsa quae ab illo', 1, 1, '2017-01-14 14:02:03', NULL, 0, 1, '', 0, '{"thumb":"","template":""}', 0, 0, 0, 0),
(48, 1, '', '', '2017-01-14 14:02:04', '<p>测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试</p>', 'Eaque ipsa quae ab illo', 'Eaque ipsa quae ab illo', 1, 1, '2017-01-14 14:02:26', NULL, 0, 1, '', 0, '{"thumb":"","template":""}', 0, 0, 0, 0),
(49, 1, '', '', '2017-01-14 15:28:54', '', '家具设计', '家具设计', 1, 1, '2017-01-14 15:35:02', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170114\\/5879d4a3c6942.jpg","template":""}', 0, 0, 0, 0),
(50, 1, '', '', '2017-01-14 16:21:18', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</p>', 'Donec Magna', 'Donec Magna', 1, 1, '2017-01-16 09:34:09', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/587737a7c908a.jpg","template":""}', 0, 0, 0, 0),
(51, 1, '', '', '2017-01-14 16:21:18', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</p>', 'Adipiscing Elit', 'Adipiscing Elit', 1, 1, '2017-01-16 09:34:56', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/5877374e8deb4.jpg","template":""}', 0, 0, 0, 0),
(52, 1, '', '', '2017-01-14 16:21:18', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</p>', 'Adipiscing Elit', 'Adipiscing Elit', 1, 1, '2017-01-16 09:35:04', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/587731e95d418.jpg","template":""}', 0, 0, 0, 0),
(53, 1, '', '', '2017-01-14 16:24:17', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</p>', 'Adipiscing Elit', 'Adipiscing Elit', 1, 1, '2017-01-16 09:36:15', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/587737804a94a.jpg","template":""}', 0, 0, 0, 0),
(54, 1, '', '', '2017-01-14 16:24:17', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</p>', 'Donec Magna', 'Donec Magna', 1, 1, '2017-01-16 09:36:22', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/587737633cad1.jpg","template":""}', 0, 0, 0, 0),
(55, 1, '', '', '2017-01-14 16:24:17', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</p>', 'Donec Magna', 'Donec Magna', 1, 1, '2017-01-16 09:36:28', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/5877323ccd006.jpg","template":""}', 0, 0, 0, 0),
(56, 1, '', '', '2017-01-14 16:24:17', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</p>', 'Donec Magna', 'Donec Magna', 1, 1, '2017-01-16 09:36:36', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/58773205c2aa7.jpg","template":""}', 0, 0, 0, 0),
(57, 1, '', '', '2017-01-14 16:24:17', '', '左侧图片', '右侧图片', 3, 1, '2017-01-14 16:24:17', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/587731c097a48.jpg","template":""}', 0, 0, 0, 0),
(58, 1, '', '', '2017-01-14 16:24:46', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</p>', 'Adipiscing Elit', 'Adipiscing Elit', 1, 1, '2017-01-16 09:36:08', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/587731e95d418.jpg","template":""}', 0, 0, 0, 0),
(59, 1, '', '', '2017-01-14 16:26:13', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</p>', 'Adipiscing Elit', 'Adipiscing Elit', 1, 1, '2017-01-16 09:35:35', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/5877321f9bf38.jpg","template":""}', 0, 0, 0, 0),
(60, 1, '', '', '2017-01-14 16:26:13', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</p>', 'Adipiscing Elit', 'Adipiscing Elit', 1, 1, '2017-01-16 09:35:24', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/587731e95d418.jpg","template":""}', 0, 0, 0, 0),
(61, 1, '', '', '2017-01-16 09:07:45', '<p><span style="color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</span></p>', 'Donec Magna', 'Donec Magna', 3, 1, '2017-01-16 09:07:45', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/587737a7c908a.jpg","template":""}', 0, 0, 0, 0),
(62, 1, '', '', '2017-01-16 09:07:45', '<p><span style="color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</span></p>', 'Adipiscing Elit', 'Adipiscing Elit', 3, 1, '2017-01-16 09:07:45', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/5877374e8deb4.jpg","template":""}', 0, 0, 0, 0),
(63, 1, '', '', '2017-01-16 09:07:45', '<p><span style="color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</span></p>', 'Adipiscing Elit', 'Adipiscing Elit', 3, 1, '2017-01-16 09:07:45', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/587731e95d418.jpg","template":""}', 0, 0, 0, 0),
(64, 1, '', '', '2017-01-16 09:08:01', '<p><span style="color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</span></p>', 'Adipiscing Elit', 'Adipiscing Elit', 3, 1, '2017-01-16 09:08:01', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/587731e95d418.jpg","template":""}', 0, 0, 0, 0),
(65, 1, '', '', '2017-01-16 09:08:01', '<p><span style="color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</span></p>', 'Adipiscing Elit', 'Adipiscing Elit', 3, 1, '2017-01-16 09:08:01', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/587737804a94a.jpg","template":""}', 0, 0, 0, 0),
(66, 1, '', '', '2017-01-16 09:08:01', '<p><span style="color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</span></p>', 'Donec Magna', 'Donec Magna', 3, 1, '2017-01-16 09:08:01', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/587737633cad1.jpg","template":""}', 0, 0, 0, 0),
(67, 1, '', '', '2017-01-16 09:08:01', '<p><span style="color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</span></p>', 'Donec Magna', 'Donec Magna', 3, 1, '2017-01-16 09:08:01', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/5877323ccd006.jpg","template":""}', 0, 0, 0, 0),
(68, 1, '', '', '2017-01-16 09:08:01', '<p><span style="color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</span></p>', 'Donec Magna', 'Donec Magna', 3, 1, '2017-01-16 09:08:01', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/58773205c2aa7.jpg","template":""}', 0, 0, 0, 0),
(69, 1, '', '', '2017-01-16 09:08:15', '<p><span style="color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</span></p>', 'Adipiscing Elit', 'Adipiscing Elit', 3, 1, '2017-01-16 09:08:15', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/5877321f9bf38.jpg","template":""}', 0, 0, 0, 0),
(70, 1, '', '', '2017-01-16 09:08:15', '<p><span style="color: rgb(119, 119, 119); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare odio et massa dignissim, at accumsan metus viverra.</span></p>', 'Adipiscing Elit', 'Adipiscing Elit', 3, 1, '2017-01-16 09:08:15', NULL, 0, 1, '', 0, '{"thumb":"portal\\/20170112\\/587731e95d418.jpg","template":""}', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `winter_role`
--

CREATE TABLE IF NOT EXISTS `winter_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='角色表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `winter_role`
--

INSERT INTO `winter_role` (`id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder`) VALUES
(1, '超级管理员', 0, 1, '拥有网站最高管理员权限！', 1329633709, 1329633709, 0);

-- --------------------------------------------------------

--
-- 表的结构 `winter_role_user`
--

CREATE TABLE IF NOT EXISTS `winter_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- --------------------------------------------------------

--
-- 表的结构 `winter_route`
--

CREATE TABLE IF NOT EXISTS `winter_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `winter_slide`
--

CREATE TABLE IF NOT EXISTS `winter_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='幻灯片表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `winter_slide`
--

INSERT INTO `winter_slide` (`slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder`) VALUES
(1, 1, 'Interior Plus', 'admin/20170112/58771af59f90f.jpg', '{:U(''index/index'')}', 'We are a Creative Interior Design Studio', 'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit consectetur adipiscing elit Mauris', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `winter_slide_cat`
--

CREATE TABLE IF NOT EXISTS `winter_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `winter_slide_cat`
--

INSERT INTO `winter_slide_cat` (`cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status`) VALUES
(1, 'index', 'portal_index', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `winter_terms`
--

CREATE TABLE IF NOT EXISTS `winter_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表' AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `winter_terms`
--

INSERT INTO `winter_terms` (`term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`) VALUES
(1, 'About Us', '', 'article', '', 0, 0, '0-1', '', '', '', 'about', 'article', 0, 1),
(2, 'Contact', '', 'article', '联系我们\n\n', 0, 0, '0-2', '', '', '', 'contact', 'article', 0, 1),
(3, '滚动页', '', 'article', '', 0, 0, '0-3', '', '', '', 'list-index', 'article', 0, 1),
(4, '设计', '', 'article', '', 0, 0, '0-4', '', '', '', 'list', 'article', 0, 1),
(5, 'Welcome', '', 'article', 'Our company offers you the best design solutions to make your home interior unique and stylish', 0, 0, '0-5', '', '', '', 'list', 'article', 0, 1),
(6, 'Services', '', 'article', 'Latest Works', 0, 0, '0-6', '', '', '', 'services', 'article', 0, 1),
(7, '我们提供的服务', '', 'article', '', 6, 0, '0-6-7', '', '', '', 'list', 'article', 0, 1),
(8, '见证', '', 'article', '', 0, 0, '0-8', '', '', '', 'list', 'article', 0, 1),
(9, 'Latest Works', '', 'article', '', 0, 0, '0-9', '', '', '', 'list', 'article', 0, 1),
(11, 'Our Team Members', '', 'article', '我们的团队成员', 1, 0, '0-1-11', '', '', '', 'list', 'article', 11, 1),
(10, 'Why Choose Us', '', 'article', '', 7, 0, '0-6-7-10', '', '', '', 'list', 'article', 0, 1),
(12, 'Who We Are', '', 'article', '我们是谁', 1, 0, '0-1-12', '', '', '', 'list', 'article', 12, 1),
(13, 'Furniture Design', '', 'article', '家具设计', 1, 0, '0-1-13', '', '', '', 'list', 'article', 13, 1),
(14, 'Gallery', '', 'article', 'ALL\n', 0, 0, '0-14', '', '', '', 'gallery', 'article', 0, 1),
(15, '厨房和浴室', '', 'article', 'Kitchen &amp; Bath', 14, 0, '0-14-15', '', '', '', 'list', 'article', 0, 1),
(16, '客厅', '', 'article', 'Living Rooms', 14, 0, '0-14-16', '', '', '', 'list', 'article', 0, 1),
(17, '卧室', '', 'article', 'Bedrooms', 14, 0, '0-14-17', '', '', '', 'list', 'article', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `winter_term_relationships`
--

CREATE TABLE IF NOT EXISTS `winter_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表' AUTO_INCREMENT=71 ;

--
-- 转存表中的数据 `winter_term_relationships`
--

INSERT INTO `winter_term_relationships` (`tid`, `object_id`, `term_id`, `listorder`, `status`) VALUES
(1, 1, 2, 0, 1),
(2, 2, 4, 0, 1),
(3, 3, 4, 0, 1),
(4, 4, 4, 0, 1),
(5, 5, 5, 0, 1),
(6, 6, 5, 0, 1),
(7, 7, 5, 0, 1),
(8, 8, 7, 0, 1),
(9, 9, 7, 0, 1),
(10, 10, 7, 0, 1),
(11, 11, 7, 0, 1),
(12, 12, 7, 0, 1),
(13, 13, 7, 0, 1),
(14, 14, 5, 0, 1),
(15, 15, 5, 0, 1),
(16, 16, 5, 0, 1),
(17, 17, 8, 0, 1),
(18, 18, 8, 0, 1),
(19, 19, 8, 0, 1),
(20, 20, 6, 0, 1),
(21, 21, 6, 0, 1),
(22, 22, 6, 0, 1),
(23, 23, 7, 0, 1),
(24, 24, 9, 0, 1),
(25, 25, 9, 0, 1),
(26, 26, 9, 0, 1),
(27, 27, 6, 0, 1),
(28, 28, 6, 0, 1),
(29, 29, 6, 0, 1),
(30, 30, 6, 0, 1),
(31, 31, 6, 0, 1),
(32, 32, 6, 0, 1),
(33, 33, 6, 0, 1),
(34, 34, 6, 0, 1),
(35, 35, 6, 0, 1),
(36, 36, 6, 0, 1),
(37, 37, 10, 0, 1),
(38, 38, 10, 0, 1),
(39, 39, 10, 0, 1),
(40, 40, 10, 0, 1),
(41, 41, 1, 0, 1),
(42, 42, 11, 0, 1),
(43, 43, 11, 0, 1),
(44, 44, 11, 0, 1),
(45, 45, 12, 0, 1),
(46, 46, 12, 0, 1),
(47, 47, 12, 0, 1),
(48, 48, 12, 0, 1),
(49, 49, 13, 0, 1),
(50, 50, 15, 0, 1),
(51, 51, 15, 0, 1),
(52, 52, 15, 0, 1),
(53, 53, 16, 0, 1),
(54, 54, 16, 0, 1),
(55, 55, 16, 0, 1),
(56, 56, 16, 0, 1),
(57, 57, 16, 0, 1),
(58, 58, 16, 0, 1),
(59, 59, 17, 0, 1),
(60, 60, 17, 0, 1),
(61, 61, 14, 0, 1),
(62, 62, 14, 0, 1),
(63, 63, 14, 0, 1),
(64, 64, 14, 0, 1),
(65, 65, 14, 0, 1),
(66, 66, 14, 0, 1),
(67, 67, 14, 0, 1),
(68, 68, 14, 0, 1),
(69, 69, 14, 0, 1),
(70, 70, 14, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `winter_users`
--

CREATE TABLE IF NOT EXISTS `winter_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT '2000-01-01' COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `winter_users`
--

INSERT INTO `winter_users` (`id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile`) VALUES
(1, 'admin', '###3460e669dae349f90ff1b8e4df555da1', 'admin', '1093630285@qq.com', '', NULL, 0, '2000-01-01', NULL, '0.0.0.0', '2017-01-18 08:31:09', '2016-12-09 02:20:13', '', 1, 0, 1, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `winter_user_favorites`
--

CREATE TABLE IF NOT EXISTS `winter_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
