# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.19)
# Database: blog
# Generation Time: 2017-09-13 02:26:51 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table about
# ------------------------------------------------------------

DROP TABLE IF EXISTS `about`;

CREATE TABLE `about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `about_hobby` varchar(255) DEFAULT NULL,
  `about_motto` varchar(255) DEFAULT NULL,
  `about_name` varchar(255) DEFAULT NULL,
  `about_other` varchar(255) DEFAULT NULL,
  `about_sex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `about` WRITE;
/*!40000 ALTER TABLE `about` DISABLE KEYS */;

INSERT INTO `about` (`id`, `about_hobby`, `about_motto`, `about_name`, `about_other`, `about_sex`)
VALUES
	(1,'买买买','业精于勤，荒于嬉；行成于思，毁于随','刘浩然','','男');

/*!40000 ALTER TABLE `about` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(20) NOT NULL DEFAULT 'admin' COMMENT '管理员名称',
  `admin_email` varchar(100) NOT NULL DEFAULT '' COMMENT '管理员邮箱',
  `admin_password` varchar(128) NOT NULL DEFAULT 'admin' COMMENT '管理员密码',
  `admin_token` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员令牌',
  `admin_status` int(3) NOT NULL DEFAULT '0' COMMENT '0为启用，1为禁用，2为异常',
  `admin_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0' COMMENT '登录ip',
  `admin_address` varchar(100) NOT NULL DEFAULT '' COMMENT 'IP地址',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `admin_group` int(11) DEFAULT '0' COMMENT '所在权限组',
  PRIMARY KEY (`id`),
  UNIQUE KEY `onlyname` (`admin_name`),
  KEY `admin_email` (`admin_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;

INSERT INTO `admin` (`id`, `admin_name`, `admin_email`, `admin_password`, `admin_token`, `admin_status`, `admin_ip`, `admin_address`, `create_time`, `update_time`, `admin_group`)
VALUES
	(10000,'heibai','2388399752@qq.com','4QrcOUm6Wau+VuBX8g+IPg==','GP9tteIN9laTIx7NS0BgOw==',0,'0:0:0:0:0:0:0:1','未知','2017-07-26 23:45:17','2017-09-02 00:31:11',0),
	(10001,'lhr','12348324324@qq.com','4QrcOUm6Wau+VuBX8g+IPg==','',0,'175.188.159.139','河南省-郑州市','2017-08-23 16:37:05','2017-09-01 15:20:17',0),
	(10002,'zzlhr','1062536903@qq.com','4QrcOUm6Wau+VuBX8g+IPg==','',0,'0.0.0.0','','2017-08-23 16:40:31','2017-09-01 15:20:20',0),
	(10003,'test','test@qq.com','4QrcOUm6Wau+VuBX8g+IPg==','',0,'175.188.159.139','河南省-郑州市','2017-08-25 17:10:41','2017-09-01 15:20:21',0),
	(10004,'test_lhr','test_lhr@qq.com','wzNncBURtPYCDsYd7TUgWQ==','',0,'175.188.159.139','河南省-郑州市','2017-08-25 17:13:15','2017-09-01 15:20:21',0),
	(10005,'test_lhr1','test_lhr1@qq.com','4QrcOUm6Wau+VuBX8g+IPg==','',0,'175.188.159.139','河南省-郑州市','2017-08-25 17:14:25','2017-09-01 15:20:22',0),
	(10006,'test_lhr2','test_lhr2@qq.com','4QrcOUm6Wau+VuBX8g+IPg==','',0,'','未知','2017-08-25 17:51:59','2017-09-01 15:20:22',0),
	(10007,'test_lhr22','test_lhr22@qq.com','4QrcOUm6Wau+VuBX8g+IPg==','',0,'','未知','2017-08-25 17:53:01','2017-09-01 15:20:23',0),
	(10008,'test_lhr21','test_lhr21@qq.com','4QrcOUm6Wau+VuBX8g+IPg==','',0,'','未知','2017-08-25 18:01:35','2017-09-01 15:20:24',0),
	(10009,'test_lhr23','test_lhr23@qq.com','/OqSD3QStdp74M9CuMk3WQ==','',0,'192.168.0.66','-内网IP','2017-08-25 18:05:52','2017-09-01 15:20:25',0),
	(10010,'test_lhr24','test_lhr24@qq.com','/OqSD3QStdp74M9CuMk3WQ==','',0,'192.168.0.66','-内网IP','2017-08-25 18:05:52','2017-09-01 15:20:25',0),
	(10012,'test_lhr25','test_lhr25@qq.com','/OqSD3QStdp74M9CuMk3WQ==','',0,'192.168.0.66','-内网IP','2017-08-25 18:05:52','2017-09-01 15:20:26',0),
	(10013,'test_lhr26','test_lhr26@qq.com','/OqSD3QStdp74M9CuMk3WQ==','',0,'192.168.0.66','-内网IP','2017-08-25 18:05:52','2017-09-01 15:20:27',0),
	(10014,'admin','2388399752@qq.com','4QrcOUm6Wau+VuBX8g+IPg==','kBK89Aw0REgmPPUWcEm55Q==',0,'0:0:0:0:0:0:0:1','未知','2017-08-30 16:59:31','2017-09-12 18:04:49',1),
	(10016,'test_lhr27','test_lhr27@qq.com','/OqSD3QStdp74M9CuMk3WQ==','',0,'192.168.0.66','-内网IP','2017-08-25 18:05:52','2017-09-01 15:20:28',0),
	(10017,'test_lhr28','test_lhr28@qq.com','/OqSD3QStdp74M9CuMk3WQ==','',0,'192.168.0.66','-内网IP','2017-08-25 18:05:52','2017-09-01 15:20:28',0),
	(10018,'test_lhr29','test_lhr29@qq.com','/OqSD3QStdp74M9CuMk3WQ==','',0,'192.168.0.66','-内网IP','2017-08-25 18:05:52','2017-09-01 15:20:43',0);

/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_group`;

CREATE TABLE `admin_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(11) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '权限组',
  `group_status` int(1) DEFAULT NULL COMMENT '权限组状态,0为启用，1为禁用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

LOCK TABLES `admin_group` WRITE;
/*!40000 ALTER TABLE `admin_group` DISABLE KEYS */;

INSERT INTO `admin_group` (`id`, `group_name`, `group_status`, `create_time`, `update_time`)
VALUES
	(1,X'E8B685E7BAA7E7AEA1E79086E59198',0,'2017-09-01 23:22:51','2017-09-01 23:23:07'),
	(2,X'74657374',1,'2017-09-02 00:08:31','2017-09-02 00:08:31');

/*!40000 ALTER TABLE `admin_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_groupinfo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_groupinfo`;

CREATE TABLE `admin_groupinfo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '权限组id',
  `menu_id` int(11) NOT NULL DEFAULT '0' COMMENT '菜单id',
  `group_value` int(11) NOT NULL DEFAULT '0' COMMENT '权限值',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

LOCK TABLES `admin_groupinfo` WRITE;
/*!40000 ALTER TABLE `admin_groupinfo` DISABLE KEYS */;

INSERT INTO `admin_groupinfo` (`id`, `group_id`, `menu_id`, `group_value`, `create_time`, `update_time`)
VALUES
	(1,1,1,99999,'2017-09-01 23:21:15','2017-09-12 18:03:49');

/*!40000 ALTER TABLE `admin_groupinfo` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `article_title` varchar(200) NOT NULL DEFAULT '' COMMENT '文章标题',
  `article_text` text NOT NULL COMMENT '文章内容',
  `article_admin` varchar(20) DEFAULT '' COMMENT '添加人',
  `admin_group` int(11) DEFAULT '0' COMMENT '权限组',
  `article_picture` varchar(255) DEFAULT 'article.png' COMMENT '文章图片地址',
  `article_keyword` varchar(1000) DEFAULT '' COMMENT '文章关键字',
  `article_describe` varchar(255) DEFAULT '该作者很懒，未填写描述' COMMENT '文章描述',
  `article_click` int(11) unsigned DEFAULT '0' COMMENT '点击量',
  `article_praise` int(11) DEFAULT '0' COMMENT '点赞数',
  `article_class` varchar(20) DEFAULT '未分类' COMMENT '文章分类',
  `article_commend` int(2) DEFAULT NULL COMMENT '是否推荐：0.不推荐，1.推荐到首页，2为推荐到右侧列表',
  `article_status` int(3) NOT NULL DEFAULT '0' COMMENT '状态，0为显示，1为隐藏，3为删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`article_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;

INSERT INTO `article` (`id`, `article_title`, `article_text`, `article_admin`, `admin_group`, `article_picture`, `article_keyword`, `article_describe`, `article_click`, `article_praise`, `article_class`, `article_commend`, `article_status`, `create_time`, `update_time`)
VALUES
	(17,'关于博客','','admin',NULL,'http://localhost:3000/img/8221827218045679.png','博客,黑白,heibai,黑白的博客','                                                                                                                                                                                                        作为一个web程序员，注重自己的知识积累是很重要的，博客便是一个很好的途径。\n                ',2,0,'未分类',1,0,'2017-03-29 23:57:20','2017-09-12 18:24:21'),
	(18,'公告1','  提交  ','admin',NULL,'http://localhost:3000/img/8221827218045679.png','留言板,公告,黑白,heibai,黑白的博客','                    关于留言板使用公告\n                ',107,18,'未分类',1,0,'2017-03-29 23:57:20','2017-08-17 22:43:15'),
	(19,'更新记录','<p>本次更新针对文章系统进行了大规模的改动，添加评论功能和获取评论，以及文章的排序方式进行修改，改为倒叙，以前是正序，今天太晚了，明天要上班，就不继续写了，大家晚安。</p>','admin',NULL,'http://myheibai.cn/img/1740912231332401.png','更新,黑白,heibai,blog,博客,黑白的博客','更新概括\n1.更新文章评论功能\n2.更新文章倒序排列',37,0,'未分类',1,0,'2017-03-30 00:58:59','2017-08-17 22:43:15'),
	(20,'JAVA web应用设置404 500页面方法','<p>\n    废话不多说直接贴代码\n</p>\n</p>\n<pre style=\"background-color: rgb(255, 255, 255); font-family: Consolas; font-size: 13.5pt;\">&lt;error-page&gt;    &lt;error-code&gt;404&lt;/error-code&gt;    &lt;location&gt;/static/view/404.html&lt;/location&gt;&lt;/error-page&gt;&lt;error-page&gt;    &lt;error-code&gt;500&lt;/error-code&gt;    &lt;location&gt;/static/view/500.html&lt;/location&gt;&lt;/error-page&gt;</pre>\n<p>\n需要在webapp下创建static/view文件夹','admin',NULL,'http://myheibai.cn/img/17682673193894893.png','java,web,404,500','JAVA web应用设置404 500页面方法',39,0,'未分类',1,0,'2017-04-03 13:13:42','2017-08-17 22:43:15'),
	(21,'与 或 非 异或','<p>与或非异或运算都需要讲欲运算的值转换为二进制，</p><p>举例子就用 122，123这两个数。</p><p>转换为2进制分别是:</p><p class=\"p1\"><span class=\"s1\">122:1111010</span></p><p class=\"p1\"><span class=\"s1\">123:1111011</span></p><p class=\"p1\">我用的mac自带的<strong>python</strong>的<strong>bin()</strong>函数进行的转换代码如下</p><pre><p>&gt;&gt;&gt; bin(122);</p><p>&#39;0b1111010&#39;</p><p>&gt;&gt;&gt; bin(123)</p><p>&#39;0b1111011&#39;</p></pre><p>这里得到的结果需要去掉“0b”</p><p>到这里准备工作就做好了</p><p>下面开始进入主题</p><p><br/></p><p>我总结了一下简述一下这几个运算我的理解</p><p>与(&amp;)：转换为二进制后比较每一个位置的值，当前位置的值都为1该位为1 又一个不为1则为0；</p><p>或(|)：转换为二进制比较每一个位置的值，当前位置的值有一个为1则为1，也就是说除非某一位的值都为0，否则该位为1；</p><p>非(～)：转换为二进制，把所有的0变为1，1变为0.</p><p>异或(<span style=\"color: rgb(54, 46, 43); font-family: Arial; font-size: 14px; background-color: rgb(255, 255, 255);\">^</span>)：转换为二进制，比较每一位的值，相同为0，不同为1.</p><p><br/></p><p>这样总结应该大家都能看懂了把</p><p>下面看一下实际结果</p><p class=\"p1\"><span class=\"s1\">122&amp;123 ==&gt;&nbsp;</span>122</p><p class=\"p1\"><span class=\"s1\"></span>122|123 &nbsp;==&gt; &nbsp;123</p><p class=\"p1\">~122 ==&gt; -123</p><p class=\"p1\">~123 ==&gt; -124</p><p>122^123 ==&gt; 1</p><p>大家可以亲自试一下。</p><p><br/></p><p><img src=\"/img/ueditor/851305913288626176.png\" title=\"\" alt=\"9CC13968-D107-43AC-B903-E610276A6522.png\"/></p><p><br/></p>','admin',NULL,'http://myheibai.cn/img/6663555773025447.png','','逻辑运算与或非异或运算解析',70,0,'未分类',2,0,'2017-04-10 13:29:10','2017-09-12 18:25:30'),
	(22,'mybaits爬坑总结之编码','<p>最晚使用mybaits进行模糊查询时，明明有数据却不显示，后续查了一大丢资料都在说设置一个requltMap。结果设置很多个都不行，导致昨晚折腾到1点还没睡，今天晚上就刚刚跟了半天debug，最后想到了貌似编码没有设置，结果设置一下编码，哎呦还真的好了，哎，人生如戏啊。</p><p>总结一下：一定要设置编码啊</p><pre style=\"background-color: rgb(255, 255, 255); font-family: Consolas; font-size: 13.5pt;\"><span style=\"background-color:#efefef;\">&lt;</span><span style=\"color:#000080;background-color:#efefef;font-weight:bold;\">property </span><span style=\"color:#0000ff;background-color:#efefef;font-weight:bold;\">name</span><span style=\"color:#008000;background-color:#efefef;font-weight:bold;\">=&quot;url&quot; </span><span style=\"color:#0000ff;background-color:#efefef;font-weight:bold;\">value</span><span style=\"color:#008000;background-color:#efefef;font-weight:bold;\">=&quot;jdbc:mysql://114.215.42.76:3306/blog?useUnicode=true</span><span style=\"color:#0000ff;font-weight:bold;\">&amp;amp;</span><span style=\"color:#008000;background-color:#efefef;font-weight:bold;\">characterEncoding=UTF-8&quot; </span><span style=\"background-color:#efefef;\">/&gt;</span></pre><p><br/></p><p>这里注意一下就是&amp;需要用&amp;amp来表示。否则无法通过编译的。<br/></p><p><br/></p>','admin',NULL,'http://myheibai.cn/img/6349184637409739.jpg','','最近在整合springboot和mybatis，昨晚一个like查询，增么也查不到数据。后来才发现问题的所在。',13,0,'未分类',2,0,'2017-04-20 19:57:22','2017-08-17 22:43:15'),
	(28,'新版本博客系统正在开发中','<p><img src=\"/img/ueditor/863785951850270720.png\" style=\"\"/></p><p><img src=\"/img/ueditor/863785951879630848.png\" style=\"\"/></p><p><img src=\"/img/ueditor/863785951929962496.png\" style=\"\"/></p><p>大致就是这个布局,正在开发中,开源地址:https://git.oschina.net/txrj/blog &nbsp; &nbsp;</p>','admin',NULL,'http://myheibai.cn/img/8568359380380217.png','新系统,博客,java','新系统,博客,java',18,1,'未分类',2,0,'2017-05-15 00:18:08','2017-09-12 18:25:16');

/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table article_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_class`;

CREATE TABLE `article_class` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(20) DEFAULT '' COMMENT '分类名称',
  `class_grade` int(1) DEFAULT '0' COMMENT '等级',
  `class_fid` int(11) DEFAULT '0' COMMENT '父id',
  `class_status` int(1) DEFAULT '0' COMMENT '状态0为启用，1为禁用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `article_class` WRITE;
/*!40000 ALTER TABLE `article_class` DISABLE KEYS */;

INSERT INTO `article_class` (`id`, `class_name`, `class_grade`, `class_fid`, `class_status`, `create_time`, `update_time`)
VALUES
	(1,'未分类',0,0,0,NULL,'2017-08-17 22:09:17'),
	(1000,'Java',0,0,0,NULL,'2017-08-17 22:09:17'),
	(1001,'web前端',0,0,0,NULL,'2017-08-17 22:09:17'),
	(1002,'服务器/运维',0,0,0,NULL,'2017-08-17 22:09:17'),
	(1003,'数据库',0,0,0,NULL,'2017-08-17 22:09:17');

/*!40000 ALTER TABLE `article_class` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table article_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_comment`;

CREATE TABLE `article_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL COMMENT '文章id',
  `comment_email` varchar(255) DEFAULT '' COMMENT '评论者邮箱',
  `comment_name` varchar(50) DEFAULT '匿名' COMMENT '评论人',
  `comment_text` text COMMENT '评论消息',
  `comment_ip` varchar(15) DEFAULT '' COMMENT 'ip',
  `comment_status` int(2) DEFAULT '0' COMMENT '0为启用，1为删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `article_comment` WRITE;
/*!40000 ALTER TABLE `article_comment` DISABLE KEYS */;

INSERT INTO `article_comment` (`id`, `article_id`, `comment_email`, `comment_name`, `comment_text`, `comment_ip`, `comment_status`, `create_time`)
VALUES
	(3,18,'test','黑白','哈哈哈','127.0.0.1',0,'2017-04-23 15:27:45'),
	(6,18,'test','黑白','哈哈哈','127.0.0.1',0,'2017-04-23 15:27:45'),
	(7,18,'测试','黑白','哈哈哈','127.0.0.1',0,'2017-04-23 15:27:45'),
	(8,19,'millent@126.com','小华','哈哈哈','127.0.0.1',0,'2017-04-23 15:27:45'),
	(12,18,'110','岑','哈哈哈哈\n','122.157.42.140',0,'2017-05-16 17:55:15'),
	(13,18,'23','测试','<p>测试</p>','127.0.0.1',0,'2017-05-16 21:44:24'),
	(14,18,'2388399752@qq.com','黑白','<p><b style=\"background-color: rgb(255, 0, 255);\">测试发表评论</b></p><p><br></p>','127.0.0.1',0,'2017-05-16 21:46:01'),
	(15,18,'2388399752@qq.com','黑白','<p><span style=\"background-color: rgb(255, 0, 0);\">测试</span></p><p><br></p>','127.0.0.1',0,'2017-05-16 21:47:13'),
	(16,18,'2388399752@qq.com','黑白','<p><span style=\"background-color: rgb(128, 0, 128);\">测试啊</span></p><p><br></p>','127.0.0.1',0,'2017-05-16 21:47:52'),
	(17,18,'2388399752@qq.com','黑白','<p>测试发表评论</p>','127.0.0.1',0,'2017-05-16 21:50:10'),
	(18,18,'2388399752','测试','<p>测试</p>','127.0.0.1',0,'2017-05-16 21:55:19'),
	(19,18,'2388399752','测试','<p>123456</p>','127.0.0.1',0,'2017-05-16 22:02:44'),
	(20,18,'测试','测试','<p>测试</p>','127.0.0.1',0,'2017-05-16 22:03:30'),
	(21,18,'测试','测试','<p>测试</p>','127.0.0.1',0,'2017-05-16 22:03:59'),
	(22,18,'2388399752','测试','<p>测试</p>','127.0.0.1',0,'2017-05-16 22:06:46'),
	(23,18,'测试','测试','<p>测试</p>','127.0.0.1',0,'2017-05-16 22:07:11');

/*!40000 ALTER TABLE `article_comment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table carousel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `carousel`;

CREATE TABLE `carousel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `carousel_title` varchar(100) DEFAULT '轮播图' COMMENT '轮播图标题',
  `carousel_filename` varchar(500) DEFAULT 'carousel.png' COMMENT '轮播图文件名',
  `carousel_url` varchar(500) DEFAULT 'index.html' COMMENT '轮播图跳转地址',
  `carousel_describe` varchar(500) DEFAULT '轮播图描述' COMMENT '轮播图描述',
  `carousel_compositor` int(3) DEFAULT '1' COMMENT '轮播图排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table friend_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `friend_link`;

CREATE TABLE `friend_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `link_location` int(3) NOT NULL COMMENT '位置',
  `link_value` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '链接名称',
  `link_url` varchar(500) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '链接地址',
  `create_admin` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '添加管理员',
  `link_status` int(2) DEFAULT '0' COMMENT '状态，0为启用，1为禁用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(3) DEFAULT '1' COMMENT '1为异常，2为添加，3位修改，4位查询，5位删除，6为管理员登录',
  `value` varchar(255) DEFAULT '' COMMENT '操作内容',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `ip` varchar(20) DEFAULT '' COMMENT '操作ip',
  `address` varchar(100) DEFAULT '' COMMENT 'ip地址',
  `admin` varchar(20) DEFAULT '' COMMENT '操作管理员',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;

INSERT INTO `log` (`id`, `type`, `value`, `time`, `ip`, `address`, `admin`, `create_time`)
VALUES
	(1,0,'登录成功','2017-07-27 00:12:32','192.168.0.1',NULL,'admin','2017-08-17 22:12:34'),
	(2,0,'登录成功','2017-07-27 00:15:30','192.168.0.1',NULL,'admin','2017-08-17 22:12:34'),
	(3,0,'登录成功','2017-07-27 21:51:05','0:0:0:0:0:0:0:1',NULL,'admin','2017-08-17 22:12:34'),
	(4,0,'登录成功','2017-07-27 21:52:14','0:0:0:0:0:0:0:1',NULL,'admin','2017-08-17 22:12:34'),
	(5,0,'登录成功','2017-07-27 21:56:22','0:0:0:0:0:0:0:1',NULL,'admin','2017-08-17 22:12:34'),
	(6,0,'登录成功','2017-07-27 21:57:14','0:0:0:0:0:0:0:1',NULL,'admin','2017-08-17 22:12:34'),
	(7,1,'登录失败','2017-07-27 21:58:24','0:0:0:0:0:0:0:1',NULL,'11','2017-08-17 22:12:34'),
	(8,1,'登录失败','2017-07-27 21:58:30','0:0:0:0:0:0:0:1',NULL,'1112','2017-08-17 22:12:34'),
	(9,0,'登录成功','2017-07-27 21:58:39','0:0:0:0:0:0:0:1',NULL,'admin','2017-08-17 22:12:34'),
	(10,0,'登录成功','2017-07-27 22:11:16','0:0:0:0:0:0:0:1',NULL,'admin','2017-08-17 22:12:34'),
	(11,0,'登录成功','2017-07-27 22:25:43','0:0:0:0:0:0:0:1',NULL,'admin','2017-08-17 22:12:34'),
	(12,0,'登录成功','2017-07-27 22:30:56','0:0:0:0:0:0:0:1',NULL,'heibai','2017-08-17 22:12:34'),
	(13,0,'登录成功','2017-07-27 23:44:01','0:0:0:0:0:0:0:1',NULL,'heibai','2017-08-17 22:12:34'),
	(14,0,'登录成功','2017-07-28 00:00:21','0:0:0:0:0:0:0:1',NULL,'heibai','2017-08-17 22:12:34'),
	(15,0,'登录成功','2017-07-28 12:37:28','0:0:0:0:0:0:0:1',NULL,'heibai','2017-08-17 22:12:34'),
	(16,0,'登录成功','2017-07-28 12:38:01','0:0:0:0:0:0:0:1',NULL,'heibai','2017-08-17 22:12:34'),
	(17,0,'登录成功','2017-07-28 23:08:44','0:0:0:0:0:0:0:1',NULL,'heibai','2017-08-17 22:12:34'),
	(18,0,'登录成功','2017-07-29 09:57:21','0:0:0:0:0:0:0:1',NULL,'heibai','2017-08-17 22:12:34'),
	(19,0,'登录成功','2017-07-29 10:44:00','0:0:0:0:0:0:0:1',NULL,'heibai','2017-08-17 22:12:34'),
	(20,0,'登录成功','2017-07-29 14:28:39','0:0:0:0:0:0:0:1',NULL,'heibai','2017-08-17 22:12:34'),
	(21,0,'登录成功','2017-07-30 12:28:19','0:0:0:0:0:0:0:1',NULL,'heibai','2017-08-17 22:12:34'),
	(22,0,'登录成功','2017-07-30 15:00:21','0:0:0:0:0:0:0:1',NULL,'heibai','2017-08-17 22:12:34'),
	(23,0,'登录成功','2017-07-30 20:28:58','0:0:0:0:0:0:0:1',NULL,'heibai','2017-08-17 22:12:34'),
	(24,0,'登录成功','2017-07-30 22:22:54','0:0:0:0:0:0:0:1',NULL,'heibai','2017-08-17 22:12:34'),
	(25,0,'登录成功','2017-07-31 21:25:15','0:0:0:0:0:0:0:1',NULL,'heibai','2017-08-17 22:12:34'),
	(26,0,'登录成功','2017-08-01 19:58:21','0:0:0:0:0:0:0:1',NULL,'heibai','2017-08-17 22:12:34'),
	(27,1,'登录失败','2017-08-04 09:43:06','0:0:0:0:0:0:0:1',NULL,'2388399752@qq.com','2017-08-17 22:12:34'),
	(28,0,'登录成功','2017-08-04 09:43:25','0:0:0:0:0:0:0:1',NULL,'heibai','2017-08-17 22:12:34'),
	(29,0,'登录成功','2017-08-04 10:19:45','0:0:0:0:0:0:0:1',NULL,'heibai','2017-08-17 22:12:34'),
	(30,0,'登录成功','2017-08-04 12:04:17','0:0:0:0:0:0:0:1',NULL,'heibai','2017-08-17 22:12:34'),
	(31,0,'登录成功','2017-08-04 13:31:38','0:0:0:0:0:0:0:1',NULL,'heibai','2017-08-17 22:12:34');

/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menu_do
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu_do`;

CREATE TABLE `menu_do` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(25) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '菜单名称',
  `menu_group` int(11) NOT NULL DEFAULT '0' COMMENT '菜单等级，0为1级，2为2级。。。',
  `menu_fid` int(11) NOT NULL DEFAULT '0' COMMENT '菜单父级',
  `menu_uri` varchar(500) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '菜单地址',
  `do_uri` varchar(500) COLLATE utf8_bin DEFAULT '' COMMENT '操作接口',
  `do_serial` int(3) DEFAULT '0' COMMENT '排序',
  `menu_status` int(1) NOT NULL DEFAULT '0' COMMENT '0启用，1禁用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

LOCK TABLES `menu_do` WRITE;
/*!40000 ALTER TABLE `menu_do` DISABLE KEYS */;

INSERT INTO `menu_do` (`id`, `menu_name`, `menu_group`, `menu_fid`, `menu_uri`, `do_uri`, `do_serial`, `menu_status`, `create_time`, `update_time`)
VALUES
	(1,X'E7AEA1E79086E59198E6938DE4BD9C',0,0,X'2F61646D696E2F',X'2F61646D696E2F',0,0,'2017-09-02 00:03:27','2017-09-02 00:03:46'),
	(2,X'E799BBE5BD95',1,1,X'2F61646D696E2F6C6F67696E2E68746D6C',X'2F61646D696E2F6C6F67696E2E646F',0,0,'2017-09-02 00:03:27','2017-09-02 00:03:46'),
	(3,X'E588A0E999A4E794A8E688B7',1,1,X'2F61646D696E2F61646D696E2D64656C6563742E68746D6C',X'2F61646D696E2F61646D696E2D64656C6574652E646F',2,0,'2017-09-02 00:03:27','2017-09-02 00:03:46'),
	(4,X'E6B7BBE58AA0E7AEA1E79086E59198',1,1,X'2F61646D696E2F61646D696E2D6C6973742E68746D6C',X'2F61646D696E2F61646D696E2D6164642E646F',1,0,'2017-09-02 00:03:27','2017-09-02 00:03:46'),
	(5,X'E4BFAEE694B9E7AEA1E79086E59198',1,1,X'2F61646D696E2F61646D696E2D7570646174652E68746D6C',X'2F61646D696E2F61646D696E2D7570646174652E646F',3,0,'2017-09-02 00:03:27','2017-09-02 00:03:46');

/*!40000 ALTER TABLE `menu_do` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `message_name` varchar(50) DEFAULT '匿名' COMMENT '留言人',
  `message_value` text COMMENT '留言内容',
  `message_fid` int(11) DEFAULT '0' COMMENT '回复留言id',
  `message_replaynum` int(11) DEFAULT '0' COMMENT '回复量',
  `message_ip` varchar(15) DEFAULT '' COMMENT 'ip',
  `message_address` varchar(100) DEFAULT '' COMMENT 'ip地址',
  `message_link` varchar(200) DEFAULT '' COMMENT '联系方式',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '留言时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;

INSERT INTO `message` (`id`, `message_name`, `message_value`, `message_fid`, `message_replaynum`, `message_ip`, `message_address`, `message_link`, `create_time`, `update_time`)
VALUES
	(1,'黑白','测试',0,0,'0.0.0.0',NULL,NULL,'2017-03-28 22:38:40','2017-08-17 22:10:47'),
	(2,'黑白','哈哈哈',0,0,'0.0.0.0',NULL,NULL,'2017-03-28 22:39:17','2017-08-17 22:10:47'),
	(5,'ssss','sss',0,0,'::1',NULL,NULL,'2017-03-29 21:46:19','2017-08-17 22:10:47'),
	(6,'aaas','aSas',0,0,'192.168.0.4',NULL,NULL,'2017-03-29 21:51:34','2017-08-17 22:10:47'),
	(7,'aaas','aSas',0,0,'192.168.0.4',NULL,NULL,'2017-03-29 21:53:07','2017-08-17 22:10:47'),
	(8,'aaas','aSas',0,0,'192.168.0.4',NULL,NULL,'2017-03-29 21:53:28','2017-08-17 22:10:47'),
	(9,'aaas','aSas',0,0,'192.168.0.4',NULL,NULL,'2017-03-29 21:53:59','2017-08-17 22:10:47'),
	(10,'aaas','aSas',0,0,'192.168.0.4',NULL,NULL,'2017-03-29 21:54:53','2017-08-17 22:10:47'),
	(11,'aaas','aSas',0,0,'192.168.0.4',NULL,NULL,'2017-03-29 21:55:29','2017-08-17 22:10:47'),
	(12,'aaas','aSas',0,0,'192.168.0.4',NULL,NULL,'2017-03-29 21:57:23','2017-08-17 22:10:47'),
	(13,'ssda','dadasd',0,0,'192.168.0.4',NULL,NULL,'2017-03-29 21:59:02','2017-08-17 22:10:47'),
	(14,'ssda','dadasd',0,0,'192.168.0.4',NULL,NULL,'2017-03-29 22:00:04','2017-08-17 22:10:47'),
	(15,'ssda','dadasd',0,0,'192.168.0.4',NULL,NULL,'2017-03-29 22:00:41','2017-08-17 22:10:47'),
	(16,'ssda','dadasd',0,0,'192.168.0.4',NULL,NULL,'2017-03-29 22:01:10','2017-08-17 22:10:47'),
	(17,'ssda','dadasd',0,0,'192.168.0.4',NULL,NULL,'2017-03-29 22:01:23','2017-08-17 22:10:47'),
	(18,'ssda','dadasd',0,0,'192.168.0.4',NULL,NULL,'2017-03-29 22:02:06','2017-08-17 22:10:47'),
	(19,'ssda','dadasd',0,0,'192.168.0.4',NULL,NULL,'2017-03-29 22:03:01','2017-08-17 22:10:47'),
	(20,'ces','cs',0,0,'192.168.0.4',NULL,NULL,'2017-03-29 22:03:11','2017-08-17 22:10:47'),
	(25,'是啥','是啥大事',0,0,'192.168.0.4',NULL,NULL,'2017-03-29 22:53:25','2017-08-17 22:10:47'),
	(26,'测试哈哈哈','留言板已全面竣工',0,0,'175.188.97.29',NULL,NULL,'2017-03-29 23:04:37','2017-08-17 22:10:47'),
	(27,'黑白','欢迎大家踊跃留言。有好的建议和意见都可以通过留言和我联系。',0,0,'175.188.97.29',NULL,NULL,'2017-03-29 23:05:39','2017-08-17 22:10:47'),
	(28,'痴情人','膜拜黑白大佬。',0,0,'118.114.204.251',NULL,NULL,'2017-03-29 23:09:30','2017-08-17 22:10:47'),
	(29,' ','来看看大佬',0,0,'171.108.44.135',NULL,NULL,'2017-03-29 23:15:48','2017-08-17 22:10:47'),
	(30,'<title>来看看大佬</title>','<title>来看看大佬</title>',0,0,'171.108.44.135',NULL,NULL,'2017-03-29 23:17:27','2017-08-17 22:10:47'),
	(31,'萧凌','你好',0,0,'111.76.184.47',NULL,NULL,'2017-03-29 23:19:31','2017-08-17 22:10:47'),
	(32,'萧凌','测试',0,0,'111.76.184.47',NULL,NULL,'2017-03-29 23:23:33','2017-08-17 22:10:47'),
	(35,'黑白','ssssss',32,0,NULL,NULL,NULL,'2017-05-11 23:05:59','2017-08-17 22:10:47'),
	(36,'匿名','ssssss',32,0,NULL,NULL,NULL,'2017-05-11 23:35:01','2017-08-17 22:10:47'),
	(37,'heibai','text',0,0,'',NULL,NULL,'2017-05-12 17:13:00','2017-09-13 09:59:17'),
	(38,'heibai','text',0,0,'',NULL,NULL,'2017-05-12 17:14:01','2017-09-13 09:59:18'),
	(39,'heibai','<p>测试</p>',0,0,'127.0.0.1',NULL,'2388399752','2017-05-14 20:57:12','2017-08-17 22:10:47'),
	(40,'heibai','<p>测试发送</p>',0,0,'127.0.0.1',NULL,'2388399752','2017-05-14 20:59:52','2017-08-17 22:10:47'),
	(41,'heibai','<p>测试发送</p>',0,0,'127.0.0.1',NULL,'2388399752','2017-05-14 21:00:02','2017-08-17 22:10:47'),
	(42,'heibai','<p>测试</p>',0,0,'127.0.0.1',NULL,'2388399752','2017-05-14 21:01:03','2017-08-17 22:10:47'),
	(43,'heibai','<p>哈哈哈</p>',0,0,'127.0.0.1',NULL,'2388399752','2017-05-14 21:02:55','2017-08-17 22:10:47'),
	(44,'是是是s','<p><img style=\"max-width:100%;\" src=\"http://api.map.baidu.com/staticimage?center=113.631349,34.753488&zoom=11&amp;width=478&amp;height=258\"><br></p><p><br></p>',0,0,'127.0.0.1',NULL,'尺寸','2017-05-14 21:03:26','2017-08-17 22:10:47'),
	(45,'测试 ','<p>测试杀杀杀</p>',0,0,'127.0.0.1',NULL,'测试','2017-05-14 22:35:39','2017-08-17 22:10:47'),
	(46,'测试 ','<p>测试杀杀杀</p>',0,0,'127.0.0.1',NULL,'测试','2017-05-14 22:35:44','2017-08-17 22:10:47'),
	(47,'测试 ','<p>测试杀杀杀</p>',0,0,'127.0.0.1',NULL,'测试','2017-05-14 22:35:44','2017-08-17 22:10:47'),
	(48,'测试 ','<p>测试杀杀杀</p>',0,0,'127.0.0.1',NULL,'测试','2017-05-14 22:35:45','2017-08-17 22:10:47'),
	(49,'测试 ','<p>测试杀杀杀</p>',0,0,'127.0.0.1',NULL,'测试','2017-05-14 22:35:46','2017-08-17 22:10:47'),
	(50,'杀杀杀','<p>杀杀杀杀杀杀</p>',46,0,'127.0.0.1',NULL,'杀杀杀','2017-05-14 22:36:16','2017-08-17 22:10:47'),
	(51,'测试留言回复','<p><br></p>',0,0,'127.0.0.1',NULL,'2388399752','2017-05-14 22:37:00','2017-08-17 22:10:47'),
	(52,'lhr','<pre style=\"max-width: 100%;\"><code class=\"javascript hljs\" codemark=\"1\"> $(<span class=\"hljs-string\">\".blog-sendpl\"</span>).on(<span class=\"hljs-string\">\"click\"</span>,<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> (<span class=\"hljs-params\"></span>) </span>{\n        $(<span class=\"hljs-string\">\"#sendamessage\"</span>).attr(<span class=\"hljs-string\">\"name\"</span>,<span class=\"hljs-keyword\">this</span>.id);\n    })\n\n    $(<span class=\"hljs-string\">\".blog-sendmessage\"</span>).on(<span class=\"hljs-string\">\"click\"</span>,<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> (<span class=\"hljs-params\"></span>) </span>{\n        $(<span class=\"hljs-string\">\"#sendamessage\"</span>).attr(<span class=\"hljs-string\">\"name\"</span>,<span class=\"hljs-number\">0</span>);\n    })</code></pre><p><br></p>',51,0,'127.0.0.1',NULL,'2388399752','2017-05-14 22:37:31','2017-08-17 22:10:47'),
	(53,'','<p><br></p>',0,0,'127.0.0.1',NULL,'','2017-05-14 22:37:47','2017-08-17 22:10:47'),
	(54,'测试留言提示消息框','<p><b><i><font color=\"#ff00ff\">测试留言提示消息框</font></i></b></p><p><br></p>',0,0,'127.0.0.1',NULL,'测试留言提示消息狂','2017-05-14 22:44:04','2017-08-17 22:10:47'),
	(55,'测试发送完毕执行内容','<p style=\"text-align: right; \"><font color=\"#880000\">测试发送完毕执行内容</font></p><p style=\"text-align: right;\"><br></p>',0,0,'127.0.0.1',NULL,'2388399752','2017-05-14 22:49:31','2017-08-17 22:10:47'),
	(56,'测试回复效果','<p><font color=\"#ffcc00\">测试回复效果</font></p><p><br></p>',55,0,'127.0.0.1',NULL,'2388399752','2017-05-14 22:51:32','2017-08-17 22:10:47'),
	(57,'再次测试回复效果','<p>再次测试回复效果</p><p><br></p>',55,0,'127.0.0.1',NULL,'2388399752','2017-05-14 22:52:32','2017-08-17 22:10:47'),
	(58,'','<p><embed src=\"http://player.yinyuetai.com/video/player/2689571/v_0.swf\" quality=\"high\" width=\"640\" height=\"498\" align=\"middle\" allowscriptaccess=\"sameDomain\" allowfullscreen=\"true\" type=\"application/x-shockwave-flash\"></p><p><br></p>',0,0,'127.0.0.1',NULL,'','2017-05-14 22:58:30','2017-08-17 22:10:47'),
	(59,'','<p><br></p>',0,0,'127.0.0.1',NULL,'','2017-05-14 23:04:56','2017-08-17 22:10:47'),
	(60,'','<p><br></p>',0,0,'127.0.0.1',NULL,'','2017-05-14 23:05:07','2017-08-17 22:10:47'),
	(61,'','<p><br></p>',0,0,'127.0.0.1',NULL,'','2017-05-14 23:05:49','2017-08-17 22:10:47'),
	(62,'测试','<p>测试测试测试测试测试测试测试测试测试测试测试测试</p><p><br></p>',0,0,'127.0.0.1',NULL,'测试','2017-05-14 23:17:11','2017-08-17 22:10:47'),
	(63,'哈哈','<p>哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈</p><p><br></p>',62,0,'127.0.0.1',NULL,'哈哈','2017-05-14 23:19:29','2017-08-17 22:10:47'),
	(64,'黑白','<p><img style=\"max-width:100%;\" src=\"http://api.map.baidu.com/staticimage?center=113.631349,34.753488&zoom=11&amp;width=478&amp;height=258\"><span style=\"background-color: rgb(248, 248, 248); font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: inherit; white-space: pre-wrap;\">spring.session.store-type=none</span><br></p><pre style=\"max-width: 100%;\"><code class=\"java hljs\" codemark=\"1\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/0b/tootha_thumb.gif\" style=\"font-size: 0.8em;\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c9/geili_thumb.gif\" style=\"font-size: 0.8em;\"><span style=\"font-size: inherit;\">#thymeleaf start</span></code><code class=\"java hljs\" codemark=\"1\">#spring.thymeleaf.mode=HTML5\nspring.thymeleaf.mode=HTML5\nspring.thymeleaf.encoding=UTF-<span class=\"hljs-number\">8</span>\nspring.thymeleaf.content-type=text/html\n#开发时关闭缓存,不然没法看到实时页面\nspring.thymeleaf.cache=<span class=\"hljs-keyword\">false</span>\n#thymeleaf end\n\n#servlet\n#绑定端口\nserver.port=<span class=\"hljs-number\">8080</span>\n#绑定域名\nserver.address=localhost\n#启用HTTP响应压缩\nserver.compression.enabled=<span class=\"hljs-keyword\">true</span></code></pre><p><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6e/panda_thumb.gif\"><br></p><p><br></p>',0,0,'127.0.0.1',NULL,'2388399752','2017-05-14 23:55:39','2017-08-17 22:10:47'),
	(65,'lhr','<p><img style=\"max-width:100%;\" src=\"http://api.map.baidu.com/staticimage?center=113.631349,34.753488&zoom=11&amp;width=478&amp;height=258\"><br></p><pre style=\"max-width: 100%;\"><code class=\"java hljs\" codemark=\"1\"><span class=\"hljs-meta\">@RestController</span>\n<span class=\"hljs-meta\">@SpringBootApplication</span>\n<span class=\"hljs-meta\">@EnableAutoConfiguration</span>(exclude={DataSourceAutoConfiguration.class})\n<span class=\"hljs-keyword\">public</span> <span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">BlogApplication</span> </span>{\n	<span class=\"hljs-function\"><span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">static</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">main</span><span class=\"hljs-params\">(String[] args)</span> </span>{\n		<span class=\"hljs-comment\">//禁用自动重启</span>\n		<span class=\"hljs-comment\">//System.setProperty(\"spring.devtools.restart.enabled\", \"false\");</span>\n		SpringApplication.run(BlogApplication.class, args);\n	}\n}\n</code></pre><p><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6e/panda_thumb.gif\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/70/vw_thumb.gif\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/15/j_thumb.gif\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ac/smilea_thumb.gif\"><br></p><p><br></p>',0,0,'127.0.0.1',NULL,'2388399752','2017-05-14 23:56:48','2017-08-17 22:10:47'),
	(66,'白黑','黑白我爱你，Mua~',0,0,'111.76.131.214',NULL,NULL,'2017-05-15 21:31:20','2017-08-17 22:10:47'),
	(67,'hello','<span style=\"color: red;\">hello world.</span>',0,0,'160.16.211.247',NULL,NULL,'2017-05-16 19:06:31','2017-08-17 22:10:47'),
	(68,'hello','<script>\nconsole.log(123);\n</script>',0,0,'160.16.211.247',NULL,NULL,'2017-05-16 19:07:13','2017-08-17 22:10:47');

/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cs` int(11) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table website
# ------------------------------------------------------------

DROP TABLE IF EXISTS `website`;

CREATE TABLE `website` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_title` varchar(255) DEFAULT '黑白博客系统' COMMENT '网站标题',
  `website_logo` varchar(255) DEFAULT 'logo.png' COMMENT '网站logo',
  `website_realmname` varchar(255) DEFAULT 'myheibai.cn' COMMENT '网站域名',
  `website_keyword` varchar(1000) DEFAULT '博客,我的博客,小站,管理系统,java,html,css,js' COMMENT '网站关键字',
  `website_describe` varchar(500) DEFAULT '开源博客系统，随手记录生活，热爱生活，热爱编程。----黑白 qq：2388399752' COMMENT '网站描述',
  `website_tel` varchar(20) DEFAULT '' COMMENT '网站联系人',
  `website_qq` varchar(11) DEFAULT '' COMMENT '网站联系人qq',
  `website_email` varchar(200) DEFAULT '' COMMENT '网站联系人邮箱',
  `website_address` varchar(500) DEFAULT '郑州' COMMENT '地址',
  `website_bottom` text COMMENT '网站底部信息',
  `website_status` int(3) DEFAULT '0' COMMENT '状态：0为未启用，1为启用',
  `website_aboutme` text COMMENT '关于我',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `website` WRITE;
/*!40000 ALTER TABLE `website` DISABLE KEYS */;

INSERT INTO `website` (`id`, `website_title`, `website_logo`, `website_realmname`, `website_keyword`, `website_describe`, `website_tel`, `website_qq`, `website_email`, `website_address`, `website_bottom`, `website_status`, `website_aboutme`, `create_time`, `update_time`)
VALUES
	(1,'黑白博客系统','logo.png','myheibai.cn','博客,我的博客,小站,管理系统,java,html,css,js','开源博客系统，随手记录生活，热爱生活，热爱编程。----黑白 qq：2388399752','18239787730','2388399752','2388399752@qq.com','郑州','<p>heibai的小站&nbsp豫ICP备17005770号</p>',0,'&nbsp;&nbsp;&nbsp;一个喜欢捣鼓新知识，热爱钻研的码农，希望能和大家多多交流。','2017-08-17 22:13:11','2017-08-17 22:13:36');

/*!40000 ALTER TABLE `website` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
