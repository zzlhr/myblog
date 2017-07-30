# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.18)
# Database: blog
# Generation Time: 2017-07-30 09:10:02 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(20) NOT NULL DEFAULT 'admin' COMMENT '管理员名称',
  `admin_password` varchar(128) NOT NULL DEFAULT 'admin' COMMENT '管理员密码',
  `admin_token` varchar(32) DEFAULT '' COMMENT '管理员令牌',
  `admin_status` int(3) DEFAULT '0' COMMENT '0为启用，1为禁用，2为异常',
  `admin_ip` varchar(15) DEFAULT '0.0.0.0' COMMENT '登录ip',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `onlyname` (`admin_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;

INSERT INTO `admin` (`id`, `admin_name`, `admin_password`, `admin_token`, `admin_status`, `admin_ip`, `create_time`, `update_time`)
VALUES
	(10000,'heibai','4QrcOUm6Wau+VuBX8g+IPg==','8CXXzmFqBxa4YuS2ab7NJQ==',0,'0:0:0:0:0:0:0:1','2017-07-26 23:45:17','2017-07-30 15:00:21');

/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `article_title` varchar(200) DEFAULT '' COMMENT '文章标题',
  `article_text` text COMMENT '文章内容',
  `article_picture` varchar(255) DEFAULT 'article.png' COMMENT '文章图片地址',
  `article_status` int(3) DEFAULT '0' COMMENT '状态，0为显示，1为隐藏，3为删除',
  `article_keyword` varchar(1000) DEFAULT '' COMMENT '文章关键字',
  `article_describe` varchar(255) DEFAULT '该作者很懒，未填写描述' COMMENT '文章描述',
  `article_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `admin_id` int(11) unsigned NOT NULL COMMENT '发布管理员id',
  `article_click` int(11) DEFAULT '0' COMMENT '点击量',
  `article_praise` int(11) DEFAULT '0' COMMENT '点赞数',
  `article_class` int(11) unsigned DEFAULT '1' COMMENT '文章分类',
  `article_commend` int(2) DEFAULT NULL COMMENT '是否推荐：0.不推荐，1.推荐到首页，2为推荐到右侧列表',
  `status_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKldpdodoqcb18ubdtm87uf380r` (`admin_id`),
  KEY `FKk941lvp35a3bobg6j45u63fnh` (`status_id`),
  KEY `FK7f6gaxyfuxkjca1fko48fdou4` (`article_class`),
  CONSTRAINT `FK7f6gaxyfuxkjca1fko48fdou4` FOREIGN KEY (`article_class`) REFERENCES `article_class` (`id`),
  CONSTRAINT `FKa9rako5l7u0is09idwns5o7nt` FOREIGN KEY (`article_class`) REFERENCES `status` (`id`),
  CONSTRAINT `FKk941lvp35a3bobg6j45u63fnh` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `FKldpdodoqcb18ubdtm87uf380r` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`article_class`) REFERENCES `status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;

INSERT INTO `article` (`id`, `article_title`, `article_text`, `article_picture`, `article_status`, `article_keyword`, `article_describe`, `article_time`, `admin_id`, `article_click`, `article_praise`, `article_class`, `article_commend`, `status_id`)
VALUES
	(17,'关于博客','<p>&nbsp;&nbsp;&nbsp;&nbsp;首先啊，我得说说前端这个问题，本人一个java程序员，喜爱倒腾，但是审美这玩意我一直认为我没有。。。。。所以前端比较丑，这不是重点，这套博客的亮点在于我完全用nodejs的express框架实现的，研究nodejs一段时间了，自从过完年就比较忙了，空余时间学点东西完善一下自己，nodejs就是我今年计划中的一部分，等我把这套博客系统完善完成后，打算学一下python，然后再写一套，前端部分我也会不断更新。<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;开源问题，我打算把这套博客在mlg8.cc论坛开源，这个论坛是我朋友亚子大佬的，很不错，这些后续有时间会处理一下。<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;更新问题，现在这套博客只能算是开发中，如果不出意外可能会在五月份左右完善，当然前提是工作不是很忙的情况下，如果对nodejs 和 express框架感兴趣的小伙伴可以加我qq2388399752和我沟通交流互相学习。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;最后，感谢国家，感谢党，感谢支持！<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;趁年轻努力，趁热血拼搏，未来加油。<br/></p>','http://myheibai.cn/img/16992559681168218.png',0,'博客,黑白,heibai,黑白的博客','作为一个web程序员，注重自己的知识积累是很重要的，博客便是一个很好的途径。','2017-03-29 23:50:01',10000,41,0,1,1,1004),
	(18,'公告','<p>&nbsp;&nbsp;&nbsp;&nbsp;留言板给大家提供交流沟通平台，请大家善待它<img src=\"http://img.baidu.com/hi/jx2/j_0017.gif\"/>，后续我会出一套完整的机制，来约束留言板内容，给大家营造良好的交流学习环境。<img src=\"http://img.baidu.com/hi/jx2/j_0061.gif\"/></p>','http://localhost:3000/img/8221827218045679.png',0,'留言板,公告,黑白,heibai,黑白的博客','关于留言板使用公告','2017-03-29 23:57:20',10000,107,18,1,1,1004),
	(19,'更新记录','<p>本次更新针对文章系统进行了大规模的改动，添加评论功能和获取评论，以及文章的排序方式进行修改，改为倒叙，以前是正序，今天太晚了，明天要上班，就不继续写了，大家晚安。</p>','http://myheibai.cn/img/1740912231332401.png',0,'更新,黑白,heibai,blog,博客,黑白的博客','更新概括\n1.更新文章评论功能\n2.更新文章倒序排列','2017-03-30 00:58:59',10000,37,0,1,1,1004),
	(20,'JAVA web应用设置404 500页面方法','<p>\n    废话不多说直接贴代码\n</p>\n</p>\n<pre style=\"background-color: rgb(255, 255, 255); font-family: Consolas; font-size: 13.5pt;\">&lt;error-page&gt;    &lt;error-code&gt;404&lt;/error-code&gt;    &lt;location&gt;/static/view/404.html&lt;/location&gt;&lt;/error-page&gt;&lt;error-page&gt;    &lt;error-code&gt;500&lt;/error-code&gt;    &lt;location&gt;/static/view/500.html&lt;/location&gt;&lt;/error-page&gt;</pre>\n<p>\n需要在webapp下创建static/view文件夹','http://myheibai.cn/img/17682673193894893.png',0,'java,web,404,500','JAVA web应用设置404 500页面方法','2017-04-03 13:13:42',10000,39,0,1000,1,1004),
	(21,'与 或 非 异或','<p>与或非异或运算都需要讲欲运算的值转换为二进制，</p><p>举例子就用 122，123这两个数。</p><p>转换为2进制分别是:</p><p class=\"p1\"><span class=\"s1\">122:1111010</span></p><p class=\"p1\"><span class=\"s1\">123:1111011</span></p><p class=\"p1\">我用的mac自带的<strong>python</strong>的<strong>bin()</strong>函数进行的转换代码如下</p><pre><p>&gt;&gt;&gt; bin(122);</p><p>&#39;0b1111010&#39;</p><p>&gt;&gt;&gt; bin(123)</p><p>&#39;0b1111011&#39;</p></pre><p>这里得到的结果需要去掉“0b”</p><p>到这里准备工作就做好了</p><p>下面开始进入主题</p><p><br/></p><p>我总结了一下简述一下这几个运算我的理解</p><p>与(&amp;)：转换为二进制后比较每一个位置的值，当前位置的值都为1该位为1 又一个不为1则为0；</p><p>或(|)：转换为二进制比较每一个位置的值，当前位置的值有一个为1则为1，也就是说除非某一位的值都为0，否则该位为1；</p><p>非(～)：转换为二进制，把所有的0变为1，1变为0.</p><p>异或(<span style=\"color: rgb(54, 46, 43); font-family: Arial; font-size: 14px; background-color: rgb(255, 255, 255);\">^</span>)：转换为二进制，比较每一位的值，相同为0，不同为1.</p><p><br/></p><p>这样总结应该大家都能看懂了把</p><p>下面看一下实际结果</p><p class=\"p1\"><span class=\"s1\">122&amp;123 ==&gt;&nbsp;</span>122</p><p class=\"p1\"><span class=\"s1\"></span>122|123 &nbsp;==&gt; &nbsp;123</p><p class=\"p1\">~122 ==&gt; -123</p><p class=\"p1\">~123 ==&gt; -124</p><p>122^123 ==&gt; 1</p><p>大家可以亲自试一下。</p><p><br/></p><p><img src=\"/img/ueditor/851305913288626176.png\" title=\"\" alt=\"9CC13968-D107-43AC-B903-E610276A6522.png\"/></p><p><br/></p>','http://myheibai.cn/img/6663555773025447.png',0,'','逻辑运算与或非异或运算解析','2017-04-10 13:29:10',10000,69,0,1000,2,1004),
	(22,'mybaits爬坑总结之编码','<p>最晚使用mybaits进行模糊查询时，明明有数据却不显示，后续查了一大丢资料都在说设置一个requltMap。结果设置很多个都不行，导致昨晚折腾到1点还没睡，今天晚上就刚刚跟了半天debug，最后想到了貌似编码没有设置，结果设置一下编码，哎呦还真的好了，哎，人生如戏啊。</p><p>总结一下：一定要设置编码啊</p><pre style=\"background-color: rgb(255, 255, 255); font-family: Consolas; font-size: 13.5pt;\"><span style=\"background-color:#efefef;\">&lt;</span><span style=\"color:#000080;background-color:#efefef;font-weight:bold;\">property </span><span style=\"color:#0000ff;background-color:#efefef;font-weight:bold;\">name</span><span style=\"color:#008000;background-color:#efefef;font-weight:bold;\">=&quot;url&quot; </span><span style=\"color:#0000ff;background-color:#efefef;font-weight:bold;\">value</span><span style=\"color:#008000;background-color:#efefef;font-weight:bold;\">=&quot;jdbc:mysql://114.215.42.76:3306/blog?useUnicode=true</span><span style=\"color:#0000ff;font-weight:bold;\">&amp;amp;</span><span style=\"color:#008000;background-color:#efefef;font-weight:bold;\">characterEncoding=UTF-8&quot; </span><span style=\"background-color:#efefef;\">/&gt;</span></pre><p><br/></p><p>这里注意一下就是&amp;需要用&amp;amp来表示。否则无法通过编译的。<br/></p><p><br/></p>','http://myheibai.cn/img/6349184637409739.jpg',0,'','最近在整合springboot和mybatis，昨晚一个like查询，增么也查不到数据。后来才发现问题的所在。','2017-04-20 19:57:22',10000,13,0,1000,2,1004),
	(28,'新版本博客系统正在开发中','<p><img src=\"/img/ueditor/863785951850270720.png\" style=\"\"/></p><p><img src=\"/img/ueditor/863785951879630848.png\" style=\"\"/></p><p><img src=\"/img/ueditor/863785951929962496.png\" style=\"\"/></p><p>大致就是这个布局,正在开发中,开源地址:https://git.oschina.net/txrj/blog &nbsp; &nbsp;</p>','http://myheibai.cn/img/8568359380380217.png',0,'新系统,博客,java','新系统,博客,java','2017-05-15 00:18:08',10000,17,1,1,2,1004);

/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table article_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article_class`;

CREATE TABLE `article_class` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(20) DEFAULT '' COMMENT '分类名称',
  `class_status` int(1) DEFAULT '0' COMMENT '状态0为启用，1为禁用',
  `class_grade` int(1) DEFAULT '0' COMMENT '等级',
  `class_fid` int(11) DEFAULT '0' COMMENT '父id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `article_class` WRITE;
/*!40000 ALTER TABLE `article_class` DISABLE KEYS */;

INSERT INTO `article_class` (`id`, `class_name`, `class_status`, `class_grade`, `class_fid`)
VALUES
	(1,'未分类',0,0,0),
	(1000,'Java',0,0,0),
	(1001,'web前端',0,0,0),
	(1002,'服务器/运维',0,0,0),
	(1003,'数据库',0,0,0);

/*!40000 ALTER TABLE `article_class` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table articleComment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `articleComment`;

CREATE TABLE `articleComment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL COMMENT '文章id',
  `email` varchar(255) DEFAULT '' COMMENT '评论者邮箱',
  `name` varchar(50) DEFAULT '匿名' COMMENT '评论人',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布评论时间',
  `text` text COMMENT '评论消息',
  `ip` varchar(15) DEFAULT NULL COMMENT 'ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `articleComment` WRITE;
/*!40000 ALTER TABLE `articleComment` DISABLE KEYS */;

INSERT INTO `articleComment` (`id`, `article_id`, `email`, `name`, `time`, `text`, `ip`)
VALUES
	(3,18,'test','黑白','2017-04-23 15:27:45','哈哈哈','127.0.0.1'),
	(6,18,'test','黑白','2017-04-23 15:27:45','哈哈哈','127.0.0.1'),
	(7,18,'测试','黑白','2017-04-23 15:27:45','哈哈哈','127.0.0.1'),
	(8,19,'millent@126.com','小华','2017-04-23 15:27:45','哈哈哈','127.0.0.1'),
	(12,18,'110','岑','2017-05-16 17:55:15','哈哈哈哈\n','122.157.42.140'),
	(13,18,'23','测试','2017-05-16 21:44:24','<p>测试</p>','127.0.0.1'),
	(14,18,'2388399752@qq.com','黑白','2017-05-16 21:46:01','<p><b style=\"background-color: rgb(255, 0, 255);\">测试发表评论</b></p><p><br></p>','127.0.0.1'),
	(15,18,'2388399752@qq.com','黑白','2017-05-16 21:47:13','<p><span style=\"background-color: rgb(255, 0, 0);\">测试</span></p><p><br></p>','127.0.0.1'),
	(16,18,'2388399752@qq.com','黑白','2017-05-16 21:47:52','<p><span style=\"background-color: rgb(128, 0, 128);\">测试啊</span></p><p><br></p>','127.0.0.1'),
	(17,18,'2388399752@qq.com','黑白','2017-05-16 21:50:10','<p>测试发表评论</p>','127.0.0.1'),
	(18,18,'2388399752','测试','2017-05-16 21:55:19','<p>测试</p>','127.0.0.1'),
	(19,18,'2388399752','测试','2017-05-16 22:02:44','<p>123456</p>','127.0.0.1'),
	(20,18,'测试','测试','2017-05-16 22:03:30','<p>测试</p>','127.0.0.1'),
	(21,18,'测试','测试','2017-05-16 22:03:59','<p>测试</p>','127.0.0.1'),
	(22,18,'2388399752','测试','2017-05-16 22:06:46','<p>测试</p>','127.0.0.1'),
	(23,18,'测试','测试','2017-05-16 22:07:11','<p>测试</p>','127.0.0.1');

/*!40000 ALTER TABLE `articleComment` ENABLE KEYS */;
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



# Dump of table hibernate_sequences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hibernate_sequences`;

CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `sequence_next_hi_value` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sequence_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(3) DEFAULT '1' COMMENT '1为异常，2为添加，3位修改，4位查询，5位删除，6为管理员登录',
  `value` varchar(255) DEFAULT NULL COMMENT '操作内容',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `ip` varchar(20) DEFAULT NULL COMMENT '操作ip',
  `admin` varchar(20) DEFAULT NULL COMMENT '操作管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;

INSERT INTO `log` (`id`, `type`, `value`, `time`, `ip`, `admin`)
VALUES
	(1,0,'登录成功','2017-07-27 00:12:32','192.168.0.1','admin'),
	(2,0,'登录成功','2017-07-27 00:15:30','192.168.0.1','admin'),
	(3,0,'登录成功','2017-07-27 21:51:05','0:0:0:0:0:0:0:1','admin'),
	(4,0,'登录成功','2017-07-27 21:52:14','0:0:0:0:0:0:0:1','admin'),
	(5,0,'登录成功','2017-07-27 21:56:22','0:0:0:0:0:0:0:1','admin'),
	(6,0,'登录成功','2017-07-27 21:57:14','0:0:0:0:0:0:0:1','admin'),
	(7,1,'登录失败','2017-07-27 21:58:24','0:0:0:0:0:0:0:1','11'),
	(8,1,'登录失败','2017-07-27 21:58:30','0:0:0:0:0:0:0:1','1112'),
	(9,0,'登录成功','2017-07-27 21:58:39','0:0:0:0:0:0:0:1','admin'),
	(10,0,'登录成功','2017-07-27 22:11:16','0:0:0:0:0:0:0:1','admin'),
	(11,0,'登录成功','2017-07-27 22:25:43','0:0:0:0:0:0:0:1','admin'),
	(12,0,'登录成功','2017-07-27 22:30:56','0:0:0:0:0:0:0:1','heibai'),
	(13,0,'登录成功','2017-07-27 23:44:01','0:0:0:0:0:0:0:1','heibai'),
	(14,0,'登录成功','2017-07-28 00:00:21','0:0:0:0:0:0:0:1','heibai'),
	(15,0,'登录成功','2017-07-28 12:37:28','0:0:0:0:0:0:0:1','heibai'),
	(16,0,'登录成功','2017-07-28 12:38:01','0:0:0:0:0:0:0:1','heibai'),
	(17,0,'登录成功','2017-07-28 23:08:44','0:0:0:0:0:0:0:1','heibai'),
	(18,0,'登录成功','2017-07-29 09:57:21','0:0:0:0:0:0:0:1','heibai'),
	(19,0,'登录成功','2017-07-29 10:44:00','0:0:0:0:0:0:0:1','heibai'),
	(20,0,'登录成功','2017-07-29 14:28:39','0:0:0:0:0:0:0:1','heibai'),
	(21,0,'登录成功','2017-07-30 12:28:19','0:0:0:0:0:0:0:1','heibai'),
	(22,0,'登录成功','2017-07-30 15:00:21','0:0:0:0:0:0:0:1','heibai');

/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `message_name` varchar(50) DEFAULT '匿名' COMMENT '留言人',
  `message_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '留言时间',
  `message_value` text COMMENT '留言内容',
  `message_fid` int(11) DEFAULT '0' COMMENT '回复留言id',
  `message_replaynum` int(11) DEFAULT '0' COMMENT '回复量',
  `message_ip` varchar(15) DEFAULT NULL COMMENT 'ip',
  `message_link` varchar(200) DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;

INSERT INTO `message` (`id`, `message_name`, `message_time`, `message_value`, `message_fid`, `message_replaynum`, `message_ip`, `message_link`)
VALUES
	(1,'黑白','2017-03-28 22:38:40','测试',0,0,'0.0.0.0',NULL),
	(2,'黑白','2017-03-28 22:39:17','哈哈哈',0,0,'0.0.0.0',NULL),
	(5,'ssss','2017-03-29 21:46:19','sss',0,0,'::1',NULL),
	(6,'aaas','2017-03-29 21:51:34','aSas',0,0,'192.168.0.4',NULL),
	(7,'aaas','2017-03-29 21:53:07','aSas',0,0,'192.168.0.4',NULL),
	(8,'aaas','2017-03-29 21:53:28','aSas',0,0,'192.168.0.4',NULL),
	(9,'aaas','2017-03-29 21:53:59','aSas',0,0,'192.168.0.4',NULL),
	(10,'aaas','2017-03-29 21:54:53','aSas',0,0,'192.168.0.4',NULL),
	(11,'aaas','2017-03-29 21:55:29','aSas',0,0,'192.168.0.4',NULL),
	(12,'aaas','2017-03-29 21:57:23','aSas',0,0,'192.168.0.4',NULL),
	(13,'ssda','2017-03-29 21:59:02','dadasd',0,0,'192.168.0.4',NULL),
	(14,'ssda','2017-03-29 22:00:04','dadasd',0,0,'192.168.0.4',NULL),
	(15,'ssda','2017-03-29 22:00:41','dadasd',0,0,'192.168.0.4',NULL),
	(16,'ssda','2017-03-29 22:01:10','dadasd',0,0,'192.168.0.4',NULL),
	(17,'ssda','2017-03-29 22:01:23','dadasd',0,0,'192.168.0.4',NULL),
	(18,'ssda','2017-03-29 22:02:06','dadasd',0,0,'192.168.0.4',NULL),
	(19,'ssda','2017-03-29 22:03:01','dadasd',0,0,'192.168.0.4',NULL),
	(20,'ces','2017-03-29 22:03:11','cs',0,0,'192.168.0.4',NULL),
	(25,'是啥','2017-03-29 22:53:25','是啥大事',0,0,'192.168.0.4',NULL),
	(26,'测试哈哈哈','2017-03-29 23:04:37','留言板已全面竣工',0,0,'175.188.97.29',NULL),
	(27,'黑白','2017-03-29 23:05:39','欢迎大家踊跃留言。有好的建议和意见都可以通过留言和我联系。',0,0,'175.188.97.29',NULL),
	(28,'痴情人','2017-03-29 23:09:30','膜拜黑白大佬。',0,0,'118.114.204.251',NULL),
	(29,' ','2017-03-29 23:15:48','来看看大佬',0,0,'171.108.44.135',NULL),
	(30,'<title>来看看大佬</title>','2017-03-29 23:17:27','<title>来看看大佬</title>',0,0,'171.108.44.135',NULL),
	(31,'萧凌','2017-03-29 23:19:31','你好',0,0,'111.76.184.47',NULL),
	(32,'萧凌','2017-03-29 23:23:33','测试',0,0,'111.76.184.47',NULL),
	(35,'黑白','2017-05-11 23:05:59','ssssss',32,0,NULL,NULL),
	(36,'匿名','2017-05-11 23:35:01','ssssss',32,0,NULL,NULL),
	(37,'heibai','2017-05-12 17:13:00','text',0,NULL,'',NULL),
	(38,'heibai','2017-05-12 17:14:01','text',0,NULL,'',NULL),
	(39,'heibai','2017-05-14 20:57:12','<p>测试</p>',0,0,'127.0.0.1','2388399752'),
	(40,'heibai','2017-05-14 20:59:52','<p>测试发送</p>',0,0,'127.0.0.1','2388399752'),
	(41,'heibai','2017-05-14 21:00:02','<p>测试发送</p>',0,0,'127.0.0.1','2388399752'),
	(42,'heibai','2017-05-14 21:01:03','<p>测试</p>',0,0,'127.0.0.1','2388399752'),
	(43,'heibai','2017-05-14 21:02:55','<p>哈哈哈</p>',0,0,'127.0.0.1','2388399752'),
	(44,'是是是s','2017-05-14 21:03:26','<p><img style=\"max-width:100%;\" src=\"http://api.map.baidu.com/staticimage?center=113.631349,34.753488&zoom=11&amp;width=478&amp;height=258\"><br></p><p><br></p>',0,0,'127.0.0.1','尺寸'),
	(45,'测试 ','2017-05-14 22:35:39','<p>测试杀杀杀</p>',0,0,'127.0.0.1','测试'),
	(46,'测试 ','2017-05-14 22:35:44','<p>测试杀杀杀</p>',0,0,'127.0.0.1','测试'),
	(47,'测试 ','2017-05-14 22:35:44','<p>测试杀杀杀</p>',0,0,'127.0.0.1','测试'),
	(48,'测试 ','2017-05-14 22:35:45','<p>测试杀杀杀</p>',0,0,'127.0.0.1','测试'),
	(49,'测试 ','2017-05-14 22:35:46','<p>测试杀杀杀</p>',0,0,'127.0.0.1','测试'),
	(50,'杀杀杀','2017-05-14 22:36:16','<p>杀杀杀杀杀杀</p>',46,0,'127.0.0.1','杀杀杀'),
	(51,'测试留言回复','2017-05-14 22:37:00','<p><br></p>',0,0,'127.0.0.1','2388399752'),
	(52,'lhr','2017-05-14 22:37:31','<pre style=\"max-width: 100%;\"><code class=\"javascript hljs\" codemark=\"1\"> $(<span class=\"hljs-string\">\".blog-sendpl\"</span>).on(<span class=\"hljs-string\">\"click\"</span>,<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> (<span class=\"hljs-params\"></span>) </span>{\n        $(<span class=\"hljs-string\">\"#sendamessage\"</span>).attr(<span class=\"hljs-string\">\"name\"</span>,<span class=\"hljs-keyword\">this</span>.id);\n    })\n\n    $(<span class=\"hljs-string\">\".blog-sendmessage\"</span>).on(<span class=\"hljs-string\">\"click\"</span>,<span class=\"hljs-function\"><span class=\"hljs-keyword\">function</span> (<span class=\"hljs-params\"></span>) </span>{\n        $(<span class=\"hljs-string\">\"#sendamessage\"</span>).attr(<span class=\"hljs-string\">\"name\"</span>,<span class=\"hljs-number\">0</span>);\n    })</code></pre><p><br></p>',51,0,'127.0.0.1','2388399752'),
	(53,'','2017-05-14 22:37:47','<p><br></p>',0,0,'127.0.0.1',''),
	(54,'测试留言提示消息框','2017-05-14 22:44:04','<p><b><i><font color=\"#ff00ff\">测试留言提示消息框</font></i></b></p><p><br></p>',0,0,'127.0.0.1','测试留言提示消息狂'),
	(55,'测试发送完毕执行内容','2017-05-14 22:49:31','<p style=\"text-align: right; \"><font color=\"#880000\">测试发送完毕执行内容</font></p><p style=\"text-align: right;\"><br></p>',0,0,'127.0.0.1','2388399752'),
	(56,'测试回复效果','2017-05-14 22:51:32','<p><font color=\"#ffcc00\">测试回复效果</font></p><p><br></p>',55,0,'127.0.0.1','2388399752'),
	(57,'再次测试回复效果','2017-05-14 22:52:32','<p>再次测试回复效果</p><p><br></p>',55,0,'127.0.0.1','2388399752'),
	(58,'','2017-05-14 22:58:30','<p><embed src=\"http://player.yinyuetai.com/video/player/2689571/v_0.swf\" quality=\"high\" width=\"640\" height=\"498\" align=\"middle\" allowscriptaccess=\"sameDomain\" allowfullscreen=\"true\" type=\"application/x-shockwave-flash\"></p><p><br></p>',0,0,'127.0.0.1',''),
	(59,'','2017-05-14 23:04:56','<p><br></p>',0,0,'127.0.0.1',''),
	(60,'','2017-05-14 23:05:07','<p><br></p>',0,0,'127.0.0.1',''),
	(61,'','2017-05-14 23:05:49','<p><br></p>',0,0,'127.0.0.1',''),
	(62,'测试','2017-05-14 23:17:11','<p>测试测试测试测试测试测试测试测试测试测试测试测试</p><p><br></p>',0,0,'127.0.0.1','测试'),
	(63,'哈哈','2017-05-14 23:19:29','<p>哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈</p><p><br></p>',62,0,'127.0.0.1','哈哈'),
	(64,'黑白','2017-05-14 23:55:39','<p><img style=\"max-width:100%;\" src=\"http://api.map.baidu.com/staticimage?center=113.631349,34.753488&zoom=11&amp;width=478&amp;height=258\"><span style=\"background-color: rgb(248, 248, 248); font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: inherit; white-space: pre-wrap;\">spring.session.store-type=none</span><br></p><pre style=\"max-width: 100%;\"><code class=\"java hljs\" codemark=\"1\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/0b/tootha_thumb.gif\" style=\"font-size: 0.8em;\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c9/geili_thumb.gif\" style=\"font-size: 0.8em;\"><span style=\"font-size: inherit;\">#thymeleaf start</span></code><code class=\"java hljs\" codemark=\"1\">#spring.thymeleaf.mode=HTML5\nspring.thymeleaf.mode=HTML5\nspring.thymeleaf.encoding=UTF-<span class=\"hljs-number\">8</span>\nspring.thymeleaf.content-type=text/html\n#开发时关闭缓存,不然没法看到实时页面\nspring.thymeleaf.cache=<span class=\"hljs-keyword\">false</span>\n#thymeleaf end\n\n#servlet\n#绑定端口\nserver.port=<span class=\"hljs-number\">8080</span>\n#绑定域名\nserver.address=localhost\n#启用HTTP响应压缩\nserver.compression.enabled=<span class=\"hljs-keyword\">true</span></code></pre><p><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6e/panda_thumb.gif\"><br></p><p><br></p>',0,0,'127.0.0.1','2388399752'),
	(65,'lhr','2017-05-14 23:56:48','<p><img style=\"max-width:100%;\" src=\"http://api.map.baidu.com/staticimage?center=113.631349,34.753488&zoom=11&amp;width=478&amp;height=258\"><br></p><pre style=\"max-width: 100%;\"><code class=\"java hljs\" codemark=\"1\"><span class=\"hljs-meta\">@RestController</span>\n<span class=\"hljs-meta\">@SpringBootApplication</span>\n<span class=\"hljs-meta\">@EnableAutoConfiguration</span>(exclude={DataSourceAutoConfiguration.class})\n<span class=\"hljs-keyword\">public</span> <span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">BlogApplication</span> </span>{\n	<span class=\"hljs-function\"><span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">static</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">main</span><span class=\"hljs-params\">(String[] args)</span> </span>{\n		<span class=\"hljs-comment\">//禁用自动重启</span>\n		<span class=\"hljs-comment\">//System.setProperty(\"spring.devtools.restart.enabled\", \"false\");</span>\n		SpringApplication.run(BlogApplication.class, args);\n	}\n}\n</code></pre><p><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6e/panda_thumb.gif\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/70/vw_thumb.gif\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/15/j_thumb.gif\"><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ac/smilea_thumb.gif\"><br></p><p><br></p>',0,0,'127.0.0.1','2388399752'),
	(66,'白黑','2017-05-15 21:31:20','黑白我爱你，Mua~',0,0,'111.76.131.214',NULL),
	(67,'hello','2017-05-16 19:06:31','<span style=\"color: red;\">hello world.</span>',0,0,'160.16.211.247',NULL),
	(68,'hello','2017-05-16 19:07:13','<script>\nconsole.log(123);\n</script>',0,0,'160.16.211.247',NULL);

/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(20) DEFAULT NULL,
  `cs` int(11) DEFAULT NULL,
  `classname` varchar(20) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `fid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;

INSERT INTO `status` (`id`, `value`, `cs`, `classname`, `number`, `fid`)
VALUES
	(1,'文章分类',1,'文章分类',0,0),
	(2,'文章状态',2,'文章状态',0,0),
	(1000,'未分类',1,'文章分类',1,1),
	(1001,'JavaScript',1,'文章分类',2,1),
	(1002,'Linux',1,'文章分类',3,1),
	(1003,'Java',1,'文章分类',4,1),
	(1004,'开放',2,'文章状态',1,2),
	(1005,'隐藏',2,'文章状态',2,2),
	(1006,'删除',2,'文章状态',3,2);

/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;


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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `website` WRITE;
/*!40000 ALTER TABLE `website` DISABLE KEYS */;

INSERT INTO `website` (`id`, `website_title`, `website_logo`, `website_realmname`, `website_keyword`, `website_describe`, `website_tel`, `website_qq`, `website_email`, `website_address`, `website_bottom`, `website_status`, `website_aboutme`)
VALUES
	(1,'黑白博客系统','logo.png','myheibai.cn','博客,我的博客,小站,管理系统,java,html,css,js','开源博客系统，随手记录生活，热爱生活，热爱编程。----黑白 qq：2388399752','18239787730','2388399752','2388399752@qq.com','郑州','<p>heibai的小站&nbsp豫ICP备17005770号</p>',0,'&nbsp;&nbsp;&nbsp;一个喜欢捣鼓新知识，热爱钻研的码农，希望能和大家多多交流。');

/*!40000 ALTER TABLE `website` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping routines (PROCEDURE) for database 'blog'
--
DELIMITER ;;

# Dump of PROCEDURE demo
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `demo` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `demo`(in article_id int)
    READS SQL DATA
BEGIN
	select * from `article` where id=article_id;
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
