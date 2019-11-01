/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : crmeb

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 01/11/2019 17:46:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for eb_article
-- ----------------------------
DROP TABLE IF EXISTS `eb_article`;
CREATE TABLE `eb_article`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章管理ID',
  `cid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '分类id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章标题',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章作者',
  `image_input` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章图片',
  `synopsis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章简介',
  `share_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章分享标题',
  `share_synopsis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章分享简介',
  `visit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览次数',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原文链接',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '状态',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员id',
  `mer_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '商户id',
  `is_hot` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否热门(小程序)',
  `is_banner` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否轮播图(小程序)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_article
-- ----------------------------
INSERT INTO `eb_article` VALUES (1, '1', '测试', '测试', 'http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc294a9a0a.jpg', '大撒旦', NULL, NULL, '143', 0, '', 1, '1548138209', 0, 1, 0, 1, 1);
INSERT INTO `eb_article` VALUES (2, '1', '阿斯达斯', 'admin', 'http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc294a9a0a.jpg', '阿斯达', NULL, NULL, '62', 0, NULL, 1, '1552965683', 0, 0, 0, 1, 0);

-- ----------------------------
-- Table structure for eb_article_category
-- ----------------------------
DROP TABLE IF EXISTS `eb_article_category`;
CREATE TABLE `eb_article_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章分类id',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '父级ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章分类标题',
  `intr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章分类简介',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章分类图片',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '状态',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1删除0未删除',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `hidden` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_article_category
-- ----------------------------
INSERT INTO `eb_article_category` VALUES (1, 0, '测试', '123', 'http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc294a9a0a.jpg', 1, 0, 1, '1548138187', 0);
INSERT INTO `eb_article_category` VALUES (2, 0, '开发者专区', '微信小程序开发者专区', 'http://datong.crmeb.net/public/uploads/editor/20190111/5c387daf3ef63.jpg', 1, 1, 0, '1554889503', 0);
INSERT INTO `eb_article_category` VALUES (3, 0, '官方动态', 'CRMEB官方动态', 'http://datong.crmeb.net/public/uploads/editor/20190111/5c387d18c37fa.jpg', 1, 2, 0, '1554889781', 0);

-- ----------------------------
-- Table structure for eb_article_content
-- ----------------------------
DROP TABLE IF EXISTS `eb_article_content`;
CREATE TABLE `eb_article_content`  (
  `nid` int(10) UNSIGNED NOT NULL COMMENT '文章id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章内容',
  UNIQUE INDEX `nid`(`nid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_article_content
-- ----------------------------
INSERT INTO `eb_article_content` VALUES (1, '<p>阿达阿萨德撒打</p>');
INSERT INTO `eb_article_content` VALUES (2, '<p>阿斯打扫打扫的阿斯达傻吊</p>');

-- ----------------------------
-- Table structure for eb_cache
-- ----------------------------
DROP TABLE IF EXISTS `eb_cache`;
CREATE TABLE `eb_cache`  (
  `key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '缓存数据',
  `add_time` int(10) NULL DEFAULT NULL COMMENT '缓存时间',
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信缓存表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_cache
-- ----------------------------
INSERT INTO `eb_cache` VALUES ('wechat_menus', '[{\"type\":\"view\",\"name\":\"\\u516c\\u4f17\\u53f7\\u5546\\u57ce\",\"sub_button\":[],\"url\":\"http:\\/\\/datong.crmeb.net\\/wap\"},{\"type\":\"miniprogram\",\"name\":\"\\u5c0f\\u7a0b\\u5e8f\\u5546\\u57ce\",\"sub_button\":[],\"url\":\"pages\\/index\\/index\",\"appid\":\"1111\",\"pagepath\":\"pages\\/index\\/index\"}]', 1552353930);

-- ----------------------------
-- Table structure for eb_express
-- ----------------------------
DROP TABLE IF EXISTS `eb_express`;
CREATE TABLE `eb_express`  (
  `id` mediumint(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '快递公司id',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递公司简称',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递公司全称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `is_show` tinyint(1) NOT NULL COMMENT '是否显示',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE,
  INDEX `is_show`(`is_show`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 426 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '快递公司表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_express
-- ----------------------------
INSERT INTO `eb_express` VALUES (1, 'LIMINWL', '利民物流', 1, 0);
INSERT INTO `eb_express` VALUES (2, 'XINTIAN', '鑫天顺物流', 1, 0);
INSERT INTO `eb_express` VALUES (3, 'henglu', '恒路物流', 1, 0);
INSERT INTO `eb_express` VALUES (4, 'klwl', '康力物流', 1, 0);
INSERT INTO `eb_express` VALUES (5, 'meiguo', '美国快递', 1, 0);
INSERT INTO `eb_express` VALUES (6, 'a2u', 'A2U速递', 1, 0);
INSERT INTO `eb_express` VALUES (7, 'benteng', '奔腾物流', 1, 0);
INSERT INTO `eb_express` VALUES (8, 'ahdf', '德方物流', 1, 0);
INSERT INTO `eb_express` VALUES (9, 'timedg', '万家通', 1, 0);
INSERT INTO `eb_express` VALUES (10, 'ztong', '智通物流', 1, 0);
INSERT INTO `eb_express` VALUES (11, 'xindan', '新蛋物流', 1, 0);
INSERT INTO `eb_express` VALUES (12, 'bgpyghx', '挂号信', 1, 0);
INSERT INTO `eb_express` VALUES (13, 'XFHONG', '鑫飞鸿物流快递', 1, 0);
INSERT INTO `eb_express` VALUES (14, 'ALP', '阿里物流', 1, 0);
INSERT INTO `eb_express` VALUES (15, 'BFWL', '滨发物流', 1, 0);
INSERT INTO `eb_express` VALUES (16, 'SJWL', '宋军物流', 1, 0);
INSERT INTO `eb_express` VALUES (17, 'SHUNFAWL', '顺发物流', 1, 0);
INSERT INTO `eb_express` VALUES (18, 'TIANHEWL', '天河物流', 1, 0);
INSERT INTO `eb_express` VALUES (19, 'YBWL', '邮联物流', 1, 0);
INSERT INTO `eb_express` VALUES (20, 'SWHY', '盛旺货运', 1, 0);
INSERT INTO `eb_express` VALUES (21, 'TSWL', '汤氏物流', 1, 0);
INSERT INTO `eb_express` VALUES (22, 'YUANYUANWL', '圆圆物流', 1, 0);
INSERT INTO `eb_express` VALUES (23, 'BALIANGWL', '八梁物流', 1, 0);
INSERT INTO `eb_express` VALUES (24, 'ZGWL', '振刚物流', 1, 0);
INSERT INTO `eb_express` VALUES (25, 'JIAYU', '佳宇物流', 1, 0);
INSERT INTO `eb_express` VALUES (26, 'SHHX', '昊昕物流', 1, 0);
INSERT INTO `eb_express` VALUES (27, 'ande', '安得物流', 1, 0);
INSERT INTO `eb_express` VALUES (28, 'ppbyb', '贝邮宝', 1, 0);
INSERT INTO `eb_express` VALUES (29, 'dida', '递达快递', 1, 0);
INSERT INTO `eb_express` VALUES (30, 'jppost', '日本邮政', 1, 0);
INSERT INTO `eb_express` VALUES (31, 'intmail', '中国邮政', 96, 0);
INSERT INTO `eb_express` VALUES (32, 'HENGCHENGWL', '恒诚物流', 1, 0);
INSERT INTO `eb_express` VALUES (33, 'HENGFENGWL', '恒丰物流', 1, 0);
INSERT INTO `eb_express` VALUES (34, 'gdems', '广东ems快递', 1, 0);
INSERT INTO `eb_express` VALUES (35, 'xlyt', '祥龙运通', 1, 0);
INSERT INTO `eb_express` VALUES (36, 'gjbg', '国际包裹', 1, 0);
INSERT INTO `eb_express` VALUES (37, 'uex', 'UEX', 1, 0);
INSERT INTO `eb_express` VALUES (38, 'singpost', '新加坡邮政', 1, 0);
INSERT INTO `eb_express` VALUES (39, 'guangdongyouzhengwuliu', '广东邮政', 1, 0);
INSERT INTO `eb_express` VALUES (40, 'bht', 'BHT', 1, 0);
INSERT INTO `eb_express` VALUES (41, 'cces', 'CCES快递', 1, 0);
INSERT INTO `eb_express` VALUES (42, 'cloudexpress', 'CE易欧通国际速递', 1, 0);
INSERT INTO `eb_express` VALUES (43, 'dasu', '达速物流', 1, 0);
INSERT INTO `eb_express` VALUES (44, 'pfcexpress', '皇家物流', 1, 0);
INSERT INTO `eb_express` VALUES (45, 'hjs', '猴急送', 1, 0);
INSERT INTO `eb_express` VALUES (46, 'huilian', '辉联物流', 1, 0);
INSERT INTO `eb_express` VALUES (47, 'huanqiu', '环球速运', 1, 0);
INSERT INTO `eb_express` VALUES (48, 'huada', '华达快运', 1, 0);
INSERT INTO `eb_express` VALUES (49, 'htwd', '华通务达物流', 1, 0);
INSERT INTO `eb_express` VALUES (50, 'hipito', '海派通', 1, 0);
INSERT INTO `eb_express` VALUES (51, 'hqtd', '环球通达', 1, 0);
INSERT INTO `eb_express` VALUES (52, 'airgtc', '航空快递', 1, 0);
INSERT INTO `eb_express` VALUES (53, 'haoyoukuai', '好又快物流', 1, 0);
INSERT INTO `eb_express` VALUES (54, 'hanrun', '韩润物流', 1, 0);
INSERT INTO `eb_express` VALUES (55, 'ccd', '河南次晨达', 1, 0);
INSERT INTO `eb_express` VALUES (56, 'hfwuxi', '和丰同城', 1, 0);
INSERT INTO `eb_express` VALUES (57, 'Sky', '荷兰', 1, 0);
INSERT INTO `eb_express` VALUES (58, 'hongxun', '鸿讯物流', 1, 0);
INSERT INTO `eb_express` VALUES (59, 'hongjie', '宏捷国际物流', 1, 0);
INSERT INTO `eb_express` VALUES (60, 'httx56', '汇通天下物流', 1, 0);
INSERT INTO `eb_express` VALUES (61, 'lqht', '恒通快递', 1, 0);
INSERT INTO `eb_express` VALUES (62, 'jinguangsudikuaijian', '京广速递快件', 1, 0);
INSERT INTO `eb_express` VALUES (63, 'junfengguoji', '骏丰国际速递', 1, 0);
INSERT INTO `eb_express` VALUES (64, 'jiajiatong56', '佳家通', 1, 0);
INSERT INTO `eb_express` VALUES (65, 'jrypex', '吉日优派', 1, 0);
INSERT INTO `eb_express` VALUES (66, 'jinchengwuliu', '锦程国际物流', 1, 0);
INSERT INTO `eb_express` VALUES (67, 'jgwl', '景光物流', 1, 0);
INSERT INTO `eb_express` VALUES (68, 'pzhjst', '急顺通', 1, 0);
INSERT INTO `eb_express` VALUES (69, 'ruexp', '捷网俄全通', 1, 0);
INSERT INTO `eb_express` VALUES (70, 'jmjss', '金马甲', 1, 0);
INSERT INTO `eb_express` VALUES (71, 'lanhu', '蓝弧快递', 1, 0);
INSERT INTO `eb_express` VALUES (72, 'ltexp', '乐天速递', 1, 0);
INSERT INTO `eb_express` VALUES (73, 'lutong', '鲁通快运', 1, 0);
INSERT INTO `eb_express` VALUES (74, 'ledii', '乐递供应链', 1, 0);
INSERT INTO `eb_express` VALUES (75, 'lundao', '论道国际物流', 1, 0);
INSERT INTO `eb_express` VALUES (76, 'mailikuaidi', '麦力快递', 1, 0);
INSERT INTO `eb_express` VALUES (77, 'mchy', '木春货运', 1, 0);
INSERT INTO `eb_express` VALUES (78, 'meiquick', '美快国际物流', 1, 0);
INSERT INTO `eb_express` VALUES (79, 'valueway', '美通快递', 1, 0);
INSERT INTO `eb_express` VALUES (80, 'nuoyaao', '偌亚奥国际', 1, 0);
INSERT INTO `eb_express` VALUES (81, 'euasia', '欧亚专线', 1, 0);
INSERT INTO `eb_express` VALUES (82, 'pca', '澳大利亚PCA快递', 1, 0);
INSERT INTO `eb_express` VALUES (83, 'pingandatengfei', '平安达腾飞', 1, 0);
INSERT INTO `eb_express` VALUES (84, 'pjbest', '品骏快递', 1, 0);
INSERT INTO `eb_express` VALUES (85, 'qbexpress', '秦邦快运', 1, 0);
INSERT INTO `eb_express` VALUES (86, 'quanxintong', '全信通快递', 1, 0);
INSERT INTO `eb_express` VALUES (87, 'quansutong', '全速通国际快递', 1, 0);
INSERT INTO `eb_express` VALUES (88, 'qinyuan', '秦远物流', 1, 0);
INSERT INTO `eb_express` VALUES (89, 'qichen', '启辰国际物流', 1, 0);
INSERT INTO `eb_express` VALUES (90, 'quansu', '全速快运', 1, 0);
INSERT INTO `eb_express` VALUES (91, 'qzx56', '全之鑫物流', 1, 0);
INSERT INTO `eb_express` VALUES (92, 'qskdyxgs', '千顺快递', 1, 0);
INSERT INTO `eb_express` VALUES (93, 'runhengfeng', '全时速运', 1, 0);
INSERT INTO `eb_express` VALUES (94, 'rytsd', '日益通速递', 1, 0);
INSERT INTO `eb_express` VALUES (95, 'ruidaex', '瑞达国际速递', 1, 0);
INSERT INTO `eb_express` VALUES (96, 'shiyun', '世运快递', 1, 0);
INSERT INTO `eb_express` VALUES (97, 'sfift', '十方通物流', 1, 0);
INSERT INTO `eb_express` VALUES (98, 'stkd', '顺通快递', 1, 0);
INSERT INTO `eb_express` VALUES (99, 'bgn', '布谷鸟快递', 1, 0);
INSERT INTO `eb_express` VALUES (100, 'jiahuier', '佳惠尔快递', 1, 0);
INSERT INTO `eb_express` VALUES (101, 'pingyou', '小包', 1, 0);
INSERT INTO `eb_express` VALUES (102, 'yumeijie', '誉美捷快递', 1, 0);
INSERT INTO `eb_express` VALUES (103, 'meilong', '美龙快递', 1, 0);
INSERT INTO `eb_express` VALUES (104, 'guangtong', '广通速递', 1, 0);
INSERT INTO `eb_express` VALUES (105, 'STARS', '星晨急便', 1, 0);
INSERT INTO `eb_express` VALUES (106, 'NANHANG', '中国南方航空股份有限公司', 1, 0);
INSERT INTO `eb_express` VALUES (107, 'lanbiao', '蓝镖快递', 1, 0);
INSERT INTO `eb_express` VALUES (109, 'baotongda', '宝通达物流', 1, 0);
INSERT INTO `eb_express` VALUES (110, 'dashun', '大顺物流', 1, 0);
INSERT INTO `eb_express` VALUES (111, 'dada', '大达物流', 1, 0);
INSERT INTO `eb_express` VALUES (112, 'fangfangda', '方方达物流', 1, 0);
INSERT INTO `eb_express` VALUES (113, 'hebeijianhua', '河北建华物流', 1, 0);
INSERT INTO `eb_express` VALUES (114, 'haolaiyun', '好来运快递', 1, 0);
INSERT INTO `eb_express` VALUES (115, 'jinyue', '晋越快递', 1, 0);
INSERT INTO `eb_express` VALUES (116, 'kuaitao', '快淘快递', 1, 0);
INSERT INTO `eb_express` VALUES (117, 'peixing', '陪行物流', 1, 0);
INSERT INTO `eb_express` VALUES (118, 'hkpost', '香港邮政', 1, 0);
INSERT INTO `eb_express` VALUES (119, 'ytfh', '一统飞鸿快递', 1, 0);
INSERT INTO `eb_express` VALUES (120, 'zhongxinda', '中信达快递', 1, 0);
INSERT INTO `eb_express` VALUES (121, 'zhongtian', '中天快运', 1, 0);
INSERT INTO `eb_express` VALUES (122, 'zuochuan', '佐川急便', 1, 0);
INSERT INTO `eb_express` VALUES (123, 'chengguang', '程光快递', 1, 0);
INSERT INTO `eb_express` VALUES (124, 'cszx', '城市之星', 1, 0);
INSERT INTO `eb_express` VALUES (125, 'chuanzhi', '传志快递', 1, 0);
INSERT INTO `eb_express` VALUES (126, 'feibao', '飞豹快递', 1, 0);
INSERT INTO `eb_express` VALUES (127, 'huiqiang', '汇强快递', 1, 0);
INSERT INTO `eb_express` VALUES (128, 'lejiedi', '乐捷递', 1, 0);
INSERT INTO `eb_express` VALUES (129, 'lijisong', '成都立即送快递', 1, 0);
INSERT INTO `eb_express` VALUES (130, 'minbang', '民邦速递', 1, 0);
INSERT INTO `eb_express` VALUES (131, 'ocs', 'OCS国际快递', 1, 0);
INSERT INTO `eb_express` VALUES (132, 'santai', '三态速递', 1, 0);
INSERT INTO `eb_express` VALUES (133, 'saiaodi', '赛澳递', 1, 0);
INSERT INTO `eb_express` VALUES (134, 'jingdong', '京东快递', 1, 0);
INSERT INTO `eb_express` VALUES (135, 'zengyi', '增益快递', 1, 0);
INSERT INTO `eb_express` VALUES (136, 'fanyu', '凡宇速递', 1, 0);
INSERT INTO `eb_express` VALUES (137, 'fengda', '丰达快递', 1, 0);
INSERT INTO `eb_express` VALUES (138, 'coe', '东方快递', 1, 0);
INSERT INTO `eb_express` VALUES (139, 'ees', '百福东方快递', 1, 0);
INSERT INTO `eb_express` VALUES (140, 'disifang', '递四方速递', 1, 0);
INSERT INTO `eb_express` VALUES (141, 'rufeng', '如风达快递', 1, 0);
INSERT INTO `eb_express` VALUES (142, 'changtong', '长通物流', 1, 0);
INSERT INTO `eb_express` VALUES (143, 'chengshi100', '城市100快递', 1, 0);
INSERT INTO `eb_express` VALUES (144, 'feibang', '飞邦物流', 1, 0);
INSERT INTO `eb_express` VALUES (145, 'haosheng', '昊盛物流', 1, 0);
INSERT INTO `eb_express` VALUES (146, 'yinsu', '音速速运', 1, 0);
INSERT INTO `eb_express` VALUES (147, 'kuanrong', '宽容物流', 1, 0);
INSERT INTO `eb_express` VALUES (148, 'tongcheng', '通成物流', 1, 0);
INSERT INTO `eb_express` VALUES (149, 'tonghe', '通和天下物流', 1, 0);
INSERT INTO `eb_express` VALUES (150, 'zhima', '芝麻开门', 1, 0);
INSERT INTO `eb_express` VALUES (151, 'ririshun', '日日顺物流', 1, 0);
INSERT INTO `eb_express` VALUES (152, 'anxun', '安迅物流', 1, 0);
INSERT INTO `eb_express` VALUES (153, 'baiqian', '百千诚国际物流', 1, 0);
INSERT INTO `eb_express` VALUES (154, 'chukouyi', '出口易', 1, 0);
INSERT INTO `eb_express` VALUES (155, 'diantong', '店通快递', 1, 0);
INSERT INTO `eb_express` VALUES (156, 'dajin', '大金物流', 1, 0);
INSERT INTO `eb_express` VALUES (157, 'feite', '飞特物流', 1, 0);
INSERT INTO `eb_express` VALUES (159, 'gnxb', '国内小包', 1, 0);
INSERT INTO `eb_express` VALUES (160, 'huacheng', '华诚物流', 1, 0);
INSERT INTO `eb_express` VALUES (161, 'huahan', '华翰物流', 1, 0);
INSERT INTO `eb_express` VALUES (162, 'hengyu', '恒宇运通', 1, 0);
INSERT INTO `eb_express` VALUES (163, 'huahang', '华航快递', 1, 0);
INSERT INTO `eb_express` VALUES (164, 'jiuyi', '久易快递', 1, 0);
INSERT INTO `eb_express` VALUES (165, 'jiete', '捷特快递', 1, 0);
INSERT INTO `eb_express` VALUES (166, 'jingshi', '京世物流', 1, 0);
INSERT INTO `eb_express` VALUES (167, 'kuayue', '跨越快递', 1, 0);
INSERT INTO `eb_express` VALUES (168, 'mengsu', '蒙速快递', 1, 0);
INSERT INTO `eb_express` VALUES (169, 'nanbei', '南北快递', 1, 0);
INSERT INTO `eb_express` VALUES (171, 'pinganda', '平安达快递', 1, 0);
INSERT INTO `eb_express` VALUES (172, 'ruifeng', '瑞丰速递', 1, 0);
INSERT INTO `eb_express` VALUES (173, 'rongqing', '荣庆物流', 1, 0);
INSERT INTO `eb_express` VALUES (174, 'suijia', '穗佳物流', 1, 0);
INSERT INTO `eb_express` VALUES (175, 'simai', '思迈快递', 1, 0);
INSERT INTO `eb_express` VALUES (176, 'suteng', '速腾快递', 1, 0);
INSERT INTO `eb_express` VALUES (177, 'shengbang', '晟邦物流', 1, 0);
INSERT INTO `eb_express` VALUES (178, 'suchengzhaipei', '速呈宅配', 1, 0);
INSERT INTO `eb_express` VALUES (179, 'wuhuan', '五环速递', 1, 0);
INSERT INTO `eb_express` VALUES (180, 'xingchengzhaipei', '星程宅配', 1, 0);
INSERT INTO `eb_express` VALUES (181, 'yinjie', '顺捷丰达', 1, 0);
INSERT INTO `eb_express` VALUES (183, 'yanwen', '燕文物流', 1, 0);
INSERT INTO `eb_express` VALUES (184, 'zongxing', '纵行物流', 1, 0);
INSERT INTO `eb_express` VALUES (185, 'aae', 'AAE快递', 1, 0);
INSERT INTO `eb_express` VALUES (186, 'dhl', 'DHL快递', 1, 0);
INSERT INTO `eb_express` VALUES (187, 'feihu', '飞狐快递', 1, 0);
INSERT INTO `eb_express` VALUES (188, 'shunfeng', '顺丰速运', 92, 1);
INSERT INTO `eb_express` VALUES (189, 'spring', '春风物流', 1, 0);
INSERT INTO `eb_express` VALUES (190, 'yidatong', '易达通快递', 1, 0);
INSERT INTO `eb_express` VALUES (191, 'PEWKEE', '彪记快递', 1, 0);
INSERT INTO `eb_express` VALUES (192, 'PHOENIXEXP', '凤凰快递', 1, 0);
INSERT INTO `eb_express` VALUES (193, 'CNGLS', 'GLS快递', 1, 0);
INSERT INTO `eb_express` VALUES (194, 'BHTEXP', '华慧快递', 1, 0);
INSERT INTO `eb_express` VALUES (195, 'B2B', '卡行天下', 1, 0);
INSERT INTO `eb_express` VALUES (196, 'PEISI', '配思货运', 1, 0);
INSERT INTO `eb_express` VALUES (197, 'SUNDAPOST', '上大物流', 1, 0);
INSERT INTO `eb_express` VALUES (198, 'SUYUE', '苏粤货运', 1, 0);
INSERT INTO `eb_express` VALUES (199, 'F5XM', '伍圆速递', 1, 0);
INSERT INTO `eb_express` VALUES (200, 'GZWENJIE', '文捷航空速递', 1, 0);
INSERT INTO `eb_express` VALUES (201, 'yuancheng', '远成物流', 1, 0);
INSERT INTO `eb_express` VALUES (202, 'dpex', 'DPEX快递', 1, 0);
INSERT INTO `eb_express` VALUES (203, 'anjie', '安捷快递', 1, 0);
INSERT INTO `eb_express` VALUES (204, 'jldt', '嘉里大通', 1, 0);
INSERT INTO `eb_express` VALUES (205, 'yousu', '优速快递', 1, 0);
INSERT INTO `eb_express` VALUES (206, 'wanbo', '万博快递', 1, 0);
INSERT INTO `eb_express` VALUES (207, 'sure', '速尔物流', 1, 0);
INSERT INTO `eb_express` VALUES (208, 'sutong', '速通物流', 1, 0);
INSERT INTO `eb_express` VALUES (209, 'JUNCHUANWL', '骏川物流', 1, 0);
INSERT INTO `eb_express` VALUES (210, 'guada', '冠达快递', 1, 0);
INSERT INTO `eb_express` VALUES (211, 'dsu', 'D速快递', 1, 0);
INSERT INTO `eb_express` VALUES (212, 'LONGSHENWL', '龙胜物流', 1, 0);
INSERT INTO `eb_express` VALUES (213, 'abc', '爱彼西快递', 1, 0);
INSERT INTO `eb_express` VALUES (214, 'eyoubao', 'E邮宝', 1, 0);
INSERT INTO `eb_express` VALUES (215, 'aol', 'AOL快递', 1, 0);
INSERT INTO `eb_express` VALUES (216, 'jixianda', '急先达物流', 1, 0);
INSERT INTO `eb_express` VALUES (217, 'haihong', '山东海红快递', 1, 0);
INSERT INTO `eb_express` VALUES (218, 'feiyang', '飞洋快递', 1, 0);
INSERT INTO `eb_express` VALUES (219, 'rpx', 'RPX保时达', 1, 0);
INSERT INTO `eb_express` VALUES (220, 'zhaijisong', '宅急送', 1, 0);
INSERT INTO `eb_express` VALUES (221, 'tiantian', '天天快递', 99, 0);
INSERT INTO `eb_express` VALUES (222, 'yunwuliu', '云物流', 1, 0);
INSERT INTO `eb_express` VALUES (223, 'jiuye', '九曳供应链', 1, 0);
INSERT INTO `eb_express` VALUES (224, 'bsky', '百世快运', 1, 0);
INSERT INTO `eb_express` VALUES (225, 'higo', '黑狗物流', 1, 0);
INSERT INTO `eb_express` VALUES (226, 'arke', '方舟速递', 1, 0);
INSERT INTO `eb_express` VALUES (227, 'zwsy', '中外速运', 1, 0);
INSERT INTO `eb_express` VALUES (228, 'jxy', '吉祥邮', 1, 0);
INSERT INTO `eb_express` VALUES (229, 'aramex', 'Aramex', 1, 0);
INSERT INTO `eb_express` VALUES (230, 'guotong', '国通快递', 1, 0);
INSERT INTO `eb_express` VALUES (231, 'jiayi', '佳怡物流', 1, 0);
INSERT INTO `eb_express` VALUES (232, 'longbang', '龙邦快运', 1, 0);
INSERT INTO `eb_express` VALUES (233, 'minhang', '民航快递', 1, 0);
INSERT INTO `eb_express` VALUES (234, 'quanyi', '全一快递', 1, 0);
INSERT INTO `eb_express` VALUES (235, 'quanchen', '全晨快递', 1, 0);
INSERT INTO `eb_express` VALUES (236, 'usps', 'USPS快递', 1, 0);
INSERT INTO `eb_express` VALUES (237, 'xinbang', '新邦物流', 1, 0);
INSERT INTO `eb_express` VALUES (238, 'yuanzhi', '元智捷诚快递', 1, 0);
INSERT INTO `eb_express` VALUES (239, 'zhongyou', '中邮物流', 1, 0);
INSERT INTO `eb_express` VALUES (240, 'yuxin', '宇鑫物流', 1, 0);
INSERT INTO `eb_express` VALUES (241, 'cnpex', '中环快递', 1, 0);
INSERT INTO `eb_express` VALUES (242, 'shengfeng', '盛丰物流', 1, 0);
INSERT INTO `eb_express` VALUES (243, 'yuantong', '圆通速递', 97, 1);
INSERT INTO `eb_express` VALUES (244, 'jiayunmei', '加运美物流', 1, 0);
INSERT INTO `eb_express` VALUES (245, 'ywfex', '源伟丰快递', 1, 0);
INSERT INTO `eb_express` VALUES (246, 'xinfeng', '信丰物流', 1, 0);
INSERT INTO `eb_express` VALUES (247, 'wanxiang', '万象物流', 1, 0);
INSERT INTO `eb_express` VALUES (248, 'menduimen', '门对门', 1, 0);
INSERT INTO `eb_express` VALUES (249, 'mingliang', '明亮物流', 1, 0);
INSERT INTO `eb_express` VALUES (250, 'fengxingtianxia', '风行天下', 1, 0);
INSERT INTO `eb_express` VALUES (251, 'gongsuda', '共速达物流', 1, 0);
INSERT INTO `eb_express` VALUES (252, 'zhongtong', '中通快递', 100, 1);
INSERT INTO `eb_express` VALUES (253, 'quanritong', '全日通快递', 1, 0);
INSERT INTO `eb_express` VALUES (254, 'ems', 'EMS', 1, 1);
INSERT INTO `eb_express` VALUES (255, 'wanjia', '万家物流', 1, 0);
INSERT INTO `eb_express` VALUES (256, 'yuntong', '运通快递', 1, 0);
INSERT INTO `eb_express` VALUES (257, 'feikuaida', '飞快达物流', 1, 0);
INSERT INTO `eb_express` VALUES (258, 'haimeng', '海盟速递', 1, 0);
INSERT INTO `eb_express` VALUES (259, 'zhongsukuaidi', '中速快件', 1, 0);
INSERT INTO `eb_express` VALUES (260, 'yuefeng', '越丰快递', 1, 0);
INSERT INTO `eb_express` VALUES (261, 'shenghui', '盛辉物流', 1, 0);
INSERT INTO `eb_express` VALUES (262, 'datian', '大田物流', 1, 0);
INSERT INTO `eb_express` VALUES (263, 'quanjitong', '全际通快递', 1, 0);
INSERT INTO `eb_express` VALUES (264, 'longlangkuaidi', '隆浪快递', 1, 0);
INSERT INTO `eb_express` VALUES (265, 'neweggozzo', '新蛋奥硕物流', 1, 0);
INSERT INTO `eb_express` VALUES (266, 'shentong', '申通快递', 95, 1);
INSERT INTO `eb_express` VALUES (267, 'haiwaihuanqiu', '海外环球', 1, 0);
INSERT INTO `eb_express` VALUES (268, 'yad', '源安达快递', 1, 0);
INSERT INTO `eb_express` VALUES (269, 'jindawuliu', '金大物流', 1, 0);
INSERT INTO `eb_express` VALUES (270, 'sevendays', '七天连锁', 1, 0);
INSERT INTO `eb_express` VALUES (271, 'tnt', 'TNT快递', 1, 0);
INSERT INTO `eb_express` VALUES (272, 'huayu', '天地华宇物流', 1, 0);
INSERT INTO `eb_express` VALUES (273, 'lianhaotong', '联昊通快递', 1, 0);
INSERT INTO `eb_express` VALUES (274, 'nengda', '港中能达快递', 1, 0);
INSERT INTO `eb_express` VALUES (275, 'LBWL', '联邦物流', 1, 0);
INSERT INTO `eb_express` VALUES (276, 'ontrac', 'onTrac', 1, 0);
INSERT INTO `eb_express` VALUES (277, 'feihang', '原飞航快递', 1, 0);
INSERT INTO `eb_express` VALUES (278, 'bangsongwuliu', '邦送物流', 1, 0);
INSERT INTO `eb_express` VALUES (279, 'huaxialong', '华夏龙物流', 1, 0);
INSERT INTO `eb_express` VALUES (280, 'ztwy', '中天万运快递', 1, 0);
INSERT INTO `eb_express` VALUES (281, 'fkd', '飞康达物流', 1, 0);
INSERT INTO `eb_express` VALUES (282, 'anxinda', '安信达快递', 1, 0);
INSERT INTO `eb_express` VALUES (283, 'quanfeng', '全峰快递', 1, 0);
INSERT INTO `eb_express` VALUES (284, 'shengan', '圣安物流', 1, 0);
INSERT INTO `eb_express` VALUES (285, 'jiaji', '佳吉物流', 1, 0);
INSERT INTO `eb_express` VALUES (286, 'yunda', '韵达快运', 94, 0);
INSERT INTO `eb_express` VALUES (287, 'ups', 'UPS快递', 1, 0);
INSERT INTO `eb_express` VALUES (288, 'debang', '德邦物流', 1, 0);
INSERT INTO `eb_express` VALUES (289, 'yafeng', '亚风速递', 1, 0);
INSERT INTO `eb_express` VALUES (290, 'kuaijie', '快捷速递', 98, 0);
INSERT INTO `eb_express` VALUES (291, 'huitong', '百世快递', 93, 0);
INSERT INTO `eb_express` VALUES (293, 'aolau', 'AOL澳通速递', 1, 0);
INSERT INTO `eb_express` VALUES (294, 'anneng', '安能物流', 1, 0);
INSERT INTO `eb_express` VALUES (295, 'auexpress', '澳邮中国快运', 1, 0);
INSERT INTO `eb_express` VALUES (296, 'exfresh', '安鲜达', 1, 0);
INSERT INTO `eb_express` VALUES (297, 'bcwelt', 'BCWELT', 1, 0);
INSERT INTO `eb_express` VALUES (298, 'youzhengguonei', '挂号信', 1, 0);
INSERT INTO `eb_express` VALUES (299, 'xiaohongmao', '北青小红帽', 1, 0);
INSERT INTO `eb_express` VALUES (300, 'lbbk', '宝凯物流', 1, 0);
INSERT INTO `eb_express` VALUES (301, 'byht', '博源恒通', 1, 0);
INSERT INTO `eb_express` VALUES (302, 'idada', '百成大达物流', 1, 0);
INSERT INTO `eb_express` VALUES (303, 'baitengwuliu', '百腾物流', 1, 0);
INSERT INTO `eb_express` VALUES (304, 'birdex', '笨鸟海淘', 1, 0);
INSERT INTO `eb_express` VALUES (305, 'bsht', '百事亨通', 1, 0);
INSERT INTO `eb_express` VALUES (306, 'dayang', '大洋物流快递', 1, 0);
INSERT INTO `eb_express` VALUES (307, 'dechuangwuliu', '德创物流', 1, 0);
INSERT INTO `eb_express` VALUES (308, 'donghanwl', '东瀚物流', 1, 0);
INSERT INTO `eb_express` VALUES (309, 'dfpost', '达方物流', 1, 0);
INSERT INTO `eb_express` VALUES (310, 'dongjun', '东骏快捷物流', 1, 0);
INSERT INTO `eb_express` VALUES (311, 'dindon', '叮咚澳洲转运', 1, 0);
INSERT INTO `eb_express` VALUES (312, 'dazhong', '大众佐川急便', 1, 0);
INSERT INTO `eb_express` VALUES (313, 'decnlh', '德中快递', 1, 0);
INSERT INTO `eb_express` VALUES (314, 'dekuncn', '德坤供应链', 1, 0);
INSERT INTO `eb_express` VALUES (315, 'eshunda', '俄顺达', 1, 0);
INSERT INTO `eb_express` VALUES (316, 'ewe', 'EWE全球快递', 1, 0);
INSERT INTO `eb_express` VALUES (317, 'fedexuk', 'FedEx英国', 1, 0);
INSERT INTO `eb_express` VALUES (318, 'fox', 'FOX国际速递', 1, 0);
INSERT INTO `eb_express` VALUES (319, 'rufengda', '凡客如风达', 1, 0);
INSERT INTO `eb_express` VALUES (320, 'fandaguoji', '颿达国际快递', 1, 0);
INSERT INTO `eb_express` VALUES (321, 'hnfy', '飞鹰物流', 1, 0);
INSERT INTO `eb_express` VALUES (322, 'flysman', '飞力士物流', 1, 0);
INSERT INTO `eb_express` VALUES (323, 'sccod', '丰程物流', 1, 0);
INSERT INTO `eb_express` VALUES (324, 'farlogistis', '泛远国际物流', 1, 0);
INSERT INTO `eb_express` VALUES (325, 'gsm', 'GSM', 1, 0);
INSERT INTO `eb_express` VALUES (326, 'gaticn', 'GATI快递', 1, 0);
INSERT INTO `eb_express` VALUES (327, 'gts', 'GTS快递', 1, 0);
INSERT INTO `eb_express` VALUES (328, 'gangkuai', '港快速递', 1, 0);
INSERT INTO `eb_express` VALUES (329, 'gtsd', '高铁速递', 1, 0);
INSERT INTO `eb_express` VALUES (330, 'tiandihuayu', '华宇物流', 1, 0);
INSERT INTO `eb_express` VALUES (331, 'huangmajia', '黄马甲快递', 1, 0);
INSERT INTO `eb_express` VALUES (332, 'ucs', '合众速递', 1, 0);
INSERT INTO `eb_express` VALUES (333, 'huoban', '伙伴物流', 1, 0);
INSERT INTO `eb_express` VALUES (334, 'nedahm', '红马速递', 1, 0);
INSERT INTO `eb_express` VALUES (335, 'huiwen', '汇文配送', 1, 0);
INSERT INTO `eb_express` VALUES (336, 'nmhuahe', '华赫物流', 1, 0);
INSERT INTO `eb_express` VALUES (337, 'hangyu', '航宇快递', 1, 0);
INSERT INTO `eb_express` VALUES (338, 'minsheng', '闽盛物流', 1, 0);
INSERT INTO `eb_express` VALUES (339, 'riyu', '日昱物流', 1, 0);
INSERT INTO `eb_express` VALUES (340, 'sxhongmajia', '山西红马甲', 1, 0);
INSERT INTO `eb_express` VALUES (341, 'syjiahuier', '沈阳佳惠尔', 1, 0);
INSERT INTO `eb_express` VALUES (342, 'shlindao', '上海林道货运', 1, 0);
INSERT INTO `eb_express` VALUES (343, 'shunjiefengda', '顺捷丰达', 1, 0);
INSERT INTO `eb_express` VALUES (344, 'subida', '速必达物流', 1, 0);
INSERT INTO `eb_express` VALUES (345, 'bphchina', '速方国际物流', 1, 0);
INSERT INTO `eb_express` VALUES (346, 'sendtochina', '速递中国', 1, 0);
INSERT INTO `eb_express` VALUES (347, 'suning', '苏宁快递', 1, 0);
INSERT INTO `eb_express` VALUES (348, 'sihaiet', '四海快递', 1, 0);
INSERT INTO `eb_express` VALUES (349, 'tianzong', '天纵物流', 1, 0);
INSERT INTO `eb_express` VALUES (350, 'chinatzx', '同舟行物流', 1, 0);
INSERT INTO `eb_express` VALUES (351, 'nntengda', '腾达速递', 1, 0);
INSERT INTO `eb_express` VALUES (352, 'sd138', '泰国138', 1, 0);
INSERT INTO `eb_express` VALUES (353, 'tongdaxing', '通达兴物流', 1, 0);
INSERT INTO `eb_express` VALUES (354, 'tlky', '天联快运', 1, 0);
INSERT INTO `eb_express` VALUES (355, 'youshuwuliu', 'UC优速快递', 1, 0);
INSERT INTO `eb_express` VALUES (356, 'ueq', 'UEQ快递', 1, 0);
INSERT INTO `eb_express` VALUES (357, 'weitepai', '微特派快递', 1, 0);
INSERT INTO `eb_express` VALUES (358, 'wtdchina', '威时沛运', 1, 0);
INSERT INTO `eb_express` VALUES (359, 'wzhaunyun', '微转运', 1, 0);
INSERT INTO `eb_express` VALUES (360, 'gswtkd', '万通快递', 1, 0);
INSERT INTO `eb_express` VALUES (361, 'wotu', '渥途国际速运', 1, 0);
INSERT INTO `eb_express` VALUES (362, 'xiyoute', '希优特快递', 1, 0);
INSERT INTO `eb_express` VALUES (363, 'xilaikd', '喜来快递', 1, 0);
INSERT INTO `eb_express` VALUES (364, 'xsrd', '鑫世锐达', 1, 0);
INSERT INTO `eb_express` VALUES (365, 'xtb', '鑫通宝物流', 1, 0);
INSERT INTO `eb_express` VALUES (366, 'xintianjie', '信天捷快递', 1, 0);
INSERT INTO `eb_express` VALUES (367, 'xaetc', '西安胜峰', 1, 0);
INSERT INTO `eb_express` VALUES (368, 'xianfeng', '先锋快递', 1, 0);
INSERT INTO `eb_express` VALUES (369, 'sunspeedy', '新速航', 1, 0);
INSERT INTO `eb_express` VALUES (370, 'xipost', '西邮寄', 1, 0);
INSERT INTO `eb_express` VALUES (371, 'sinatone', '信联通', 1, 0);
INSERT INTO `eb_express` VALUES (372, 'sunjex', '新杰物流', 1, 0);
INSERT INTO `eb_express` VALUES (373, 'yundaexus', '韵达美国件', 1, 0);
INSERT INTO `eb_express` VALUES (374, 'yxwl', '宇鑫物流', 1, 0);
INSERT INTO `eb_express` VALUES (375, 'yitongda', '易通达', 1, 0);
INSERT INTO `eb_express` VALUES (376, 'yiqiguojiwuliu', '一柒物流', 1, 0);
INSERT INTO `eb_express` VALUES (377, 'yilingsuyun', '亿领速运', 1, 0);
INSERT INTO `eb_express` VALUES (378, 'yujiawuliu', '煜嘉物流', 1, 0);
INSERT INTO `eb_express` VALUES (379, 'gml', '英脉物流', 1, 0);
INSERT INTO `eb_express` VALUES (380, 'leopard', '云豹国际货运', 1, 0);
INSERT INTO `eb_express` VALUES (381, 'czwlyn', '云南中诚', 1, 0);
INSERT INTO `eb_express` VALUES (382, 'sdyoupei', '优配速运', 1, 0);
INSERT INTO `eb_express` VALUES (383, 'yongchang', '永昌物流', 1, 0);
INSERT INTO `eb_express` VALUES (384, 'yufeng', '御风速运', 1, 0);
INSERT INTO `eb_express` VALUES (385, 'yamaxunwuliu', '亚马逊物流', 1, 0);
INSERT INTO `eb_express` VALUES (386, 'yousutongda', '优速通达', 1, 0);
INSERT INTO `eb_express` VALUES (387, 'yishunhang', '亿顺航', 1, 0);
INSERT INTO `eb_express` VALUES (388, 'yongwangda', '永旺达快递', 1, 0);
INSERT INTO `eb_express` VALUES (389, 'ecmscn', '易满客', 1, 0);
INSERT INTO `eb_express` VALUES (390, 'yingchao', '英超物流', 1, 0);
INSERT INTO `eb_express` VALUES (391, 'edlogistics', '益递物流', 1, 0);
INSERT INTO `eb_express` VALUES (392, 'yyexpress', '远洋国际', 1, 0);
INSERT INTO `eb_express` VALUES (393, 'onehcang', '一号仓', 1, 0);
INSERT INTO `eb_express` VALUES (394, 'ycgky', '远成快运', 1, 0);
INSERT INTO `eb_express` VALUES (395, 'lineone', '一号线', 1, 0);
INSERT INTO `eb_express` VALUES (396, 'ypsd', '壹品速递', 1, 0);
INSERT INTO `eb_express` VALUES (397, 'vipexpress', '鹰运国际速递', 1, 0);
INSERT INTO `eb_express` VALUES (398, 'el56', '易联通达物流', 1, 0);
INSERT INTO `eb_express` VALUES (399, 'yyqc56', '一运全成物流', 1, 0);
INSERT INTO `eb_express` VALUES (400, 'zhongtie', '中铁快运', 1, 0);
INSERT INTO `eb_express` VALUES (401, 'ZTKY', '中铁物流', 1, 0);
INSERT INTO `eb_express` VALUES (402, 'zzjh', '郑州建华快递', 1, 0);
INSERT INTO `eb_express` VALUES (403, 'zhongruisudi', '中睿速递', 1, 0);
INSERT INTO `eb_express` VALUES (404, 'zhongwaiyun', '中外运速递', 1, 0);
INSERT INTO `eb_express` VALUES (405, 'zengyisudi', '增益速递', 1, 0);
INSERT INTO `eb_express` VALUES (406, 'sujievip', '郑州速捷', 1, 0);
INSERT INTO `eb_express` VALUES (407, 'zhichengtongda', '至诚通达快递', 1, 0);
INSERT INTO `eb_express` VALUES (408, 'zhdwl', '众辉达物流', 1, 0);
INSERT INTO `eb_express` VALUES (409, 'kuachangwuliu', '直邮易', 1, 0);
INSERT INTO `eb_express` VALUES (410, 'topspeedex', '中运全速', 1, 0);
INSERT INTO `eb_express` VALUES (411, 'otobv', '中欧快运', 1, 0);
INSERT INTO `eb_express` VALUES (412, 'zsky123', '准实快运', 1, 0);
INSERT INTO `eb_express` VALUES (413, 'donghong', '东红物流', 1, 0);
INSERT INTO `eb_express` VALUES (414, 'kuaiyouda', '快优达速递', 1, 0);
INSERT INTO `eb_express` VALUES (415, 'balunzhi', '巴伦支快递', 1, 0);
INSERT INTO `eb_express` VALUES (416, 'hutongwuliu', '户通物流', 1, 0);
INSERT INTO `eb_express` VALUES (417, 'xianchenglian', '西安城联速递', 1, 0);
INSERT INTO `eb_express` VALUES (418, 'youbijia', '邮必佳', 1, 0);
INSERT INTO `eb_express` VALUES (419, 'feiyuan', '飞远物流', 1, 0);
INSERT INTO `eb_express` VALUES (420, 'chengji', '城际速递', 1, 0);
INSERT INTO `eb_express` VALUES (421, 'huaqi', '华企快运', 1, 0);
INSERT INTO `eb_express` VALUES (422, 'yibang', '一邦快递', 1, 0);
INSERT INTO `eb_express` VALUES (423, 'citylink', 'CityLink快递', 1, 0);
INSERT INTO `eb_express` VALUES (424, 'meixi', '美西快递', 1, 0);
INSERT INTO `eb_express` VALUES (425, 'acs', 'ACS', 1, 0);

-- ----------------------------
-- Table structure for eb_routine_access_token
-- ----------------------------
DROP TABLE IF EXISTS `eb_routine_access_token`;
CREATE TABLE `eb_routine_access_token`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '小程序access_token表ID',
  `access_token` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'openid',
  `stop_time` int(11) UNSIGNED NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小程序access_token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_routine_access_token
-- ----------------------------
INSERT INTO `eb_routine_access_token` VALUES (1, '20_z3MAutcbznCSyQPqMVOQVRUktcvLYUXAAICpCMXkpu5rLoVnBB0u88rnJr1sWDJlwj-S6aVhmswmLdW86e9Bg2ugd3BOayE6ntY6FfckSXWgvW2y5N0bLkBxHpCjJH2bQpuvnmMIZr08G32hWSQfACAZVT', 1554809658);

-- ----------------------------
-- Table structure for eb_routine_form_id
-- ----------------------------
DROP TABLE IF EXISTS `eb_routine_form_id`;
CREATE TABLE `eb_routine_form_id`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '表单ID表ID',
  `uid` int(11) NULL DEFAULT 0 COMMENT '用户uid',
  `form_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单ID',
  `stop_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '表单ID失效时间',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '状态1 未使用 2不能使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单id表记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_routine_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `eb_routine_qrcode`;
CREATE TABLE `eb_routine_qrcode`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信二维码ID',
  `third_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '二维码类型 spread(用户推广) product_spread(产品推广)',
  `third_id` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态 0不可用 1可用',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  `page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小程序页面路径带参数',
  `qrcode_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小程序二维码路径',
  `url_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '二维码添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小程序二维码管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_routine_template
-- ----------------------------
DROP TABLE IF EXISTS `eb_routine_template`;
CREATE TABLE `eb_routine_template`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `tempkey` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板编号',
  `name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复内容',
  `tempid` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板ID',
  `add_time` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tempkey`(`tempkey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_routine_template
-- ----------------------------
INSERT INTO `eb_routine_template` VALUES (13, 'AT0007', '订单发货提醒', '订单号{{keyword1.DATA}}\n快递公司{{keyword2.DATA}}\n快递单号{{keyword3.DATA}}\n发货时间{{keyword4.DATA}}\n备注{{keyword5.DATA}}', 'CyPxnxg-9eRgXoYUKhXY4IqXI4hecaUzgEQGX76OXng', '1534469928', 1);
INSERT INTO `eb_routine_template` VALUES (14, 'AT0787', '退款成功通知', '订单号{{keyword1.DATA}}\n退款时间{{keyword2.DATA}}\n退款金额{{keyword3.DATA}}\n退款方式{{keyword4.DATA}}\n备注{{keyword5.DATA}}', 'iLHSBbVVtg_ijs-hVABl5p-yaBV8JxpInqXIZy2c5To', '1534469993', 1);
INSERT INTO `eb_routine_template` VALUES (15, 'AT0009', '订单支付成功通知', '单号{{keyword1.DATA}}\n下单时间{{keyword2.DATA}}\n订单状态{{keyword3.DATA}}\n支付金额{{keyword4.DATA}}\n支付方式{{keyword5.DATA}}', 'bfXGbrwl70jdlvCnO_vZ7AeXVDsziYQW7oGT2KXiDz4', '1534470043', 1);
INSERT INTO `eb_routine_template` VALUES (16, 'AT1173', '砍价成功通知', '商品名称{{keyword1.DATA}}\n砍价金额{{keyword2.DATA}}\n底价{{keyword3.DATA}}\n砍掉价格{{keyword4.DATA}}\n支付金额{{keyword5.DATA}}\n备注{{keyword6.DATA}}', 'l3JCopf5cgNLXtmziLTxkVTHtImHPmDyHp5wBRZd3SI', '1534470085', 1);
INSERT INTO `eb_routine_template` VALUES (17, 'AT0036', '退款通知', '订单编号{{keyword1.DATA}}\n退款原因{{keyword2.DATA}}\n退款时间{{keyword3.DATA}}\n退款金额{{keyword4.DATA}}\n退款方式{{keyword5.DATA}}', '14pyhB_6xYAXfEk_iVBbtLWkph0rAqompGPbuDP3CWo', '1534470134', 1);
INSERT INTO `eb_routine_template` VALUES (19, 'AT2430', '拼团取消通知', '活动名称{{keyword1.DATA}}\n订单编号{{keyword2.DATA}}\n订单金额{{keyword3.DATA}}', 'KynVVBJcoYgaTbcnAKuy5N0YpAa82xZG1KCQIlb-Ws8', '1553910500', 1);
INSERT INTO `eb_routine_template` VALUES (20, 'AT0310', '拼团失败通知', '商品名称{{keyword1.DATA}}\n失败原因{{keyword2.DATA}}\n订单号{{keyword3.DATA}}\n开团时间{{keyword4.DATA}}\n退款金额{{keyword5.DATA}}', 'uOXsl0qRtuMWhExHGk57Hf_GLkYT6q9m16U0bg95uIQ', '1553910844', 1);
INSERT INTO `eb_routine_template` VALUES (21, 'AT0051', '拼团成功通知', '活动名称{{keyword1.DATA}}\n团长{{keyword2.DATA}}\n成团时间{{keyword3.DATA}}\n拼团价{{keyword4.DATA}}', '4uXFnRF1jnpG1R0F71JOj-NCnYbGwcI20xgihfx8Xzs', '1553911022', 1);
INSERT INTO `eb_routine_template` VALUES (22, 'AT0541', '开团成功提醒', '开团时间{{keyword1.DATA}}\n截至时间{{keyword2.DATA}}\n产品名称{{keyword3.DATA}}\n单号{{keyword4.DATA}}\n支付金额{{keyword5.DATA}}', '6rU48pJrJS7Y1MixVyGMfQmrXRtOIZZjJtc7q9kwo24', '1555133496', 1);
INSERT INTO `eb_routine_template` VALUES (23, 'AT0241', '确认收货通知', '订单编号{{keyword1.DATA}}\n商品详情{{keyword2.DATA}}\n支付金额{{keyword3.DATA}}\n确认收货时间{{keyword4.DATA}}', 'PHBc48jjSoYiN402djcMjIXLIBolhVyQlBZ51MenyG0', '1557384781', 1);
INSERT INTO `eb_routine_template` VALUES (24, 'AT0329', '退款失败通知', '订单号{{keyword1.DATA}}\n商品名称{{keyword2.DATA}}\n退款金额{{keyword3.DATA}}\n失败原因{{keyword4.DATA}}', '_h2tCwZSfi7eai16x4gF8OR5NXG9OXkRsA4nLXrM4FY', '1557384804', 1);

-- ----------------------------
-- Table structure for eb_store_bargain
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_bargain`;
CREATE TABLE `eb_store_bargain`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '砍价产品ID',
  `product_id` int(11) UNSIGNED NOT NULL COMMENT '关联产品ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '砍价活动名称',
  `image` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '砍价活动图片',
  `unit_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '单位名',
  `stock` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '库存',
  `sales` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '销量',
  `images` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '砍价产品轮播图',
  `start_time` int(11) UNSIGNED NOT NULL COMMENT '砍价开启时间',
  `stop_time` int(11) UNSIGNED NOT NULL COMMENT '砍价结束时间',
  `store_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '砍价产品名称',
  `price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '砍价金额',
  `min_price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '砍价商品最低价',
  `num` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '每次购买的砍价产品数量',
  `bargain_max_price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '用户每次砍价的最大金额',
  `bargain_min_price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '用户每次砍价的最小金额',
  `bargain_num` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户每次砍价的次数',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '砍价状态 0(到砍价时间不自动开启)  1(到砍价时间自动开启时间)',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '砍价详情',
  `give_integral` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '反多少积分',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '砍价活动简介',
  `cost` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '成本价',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_hot` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐0不推荐1推荐',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除 0未删除 1删除',
  `add_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '添加时间',
  `is_postage` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否包邮 0不包邮 1包邮',
  `postage` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '邮费',
  `rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '砍价规则',
  `look` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '砍价产品浏览量',
  `share` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '砍价产品分享量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '砍价表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_bargain
-- ----------------------------
INSERT INTO `eb_store_bargain` VALUES (1, 1, '拼团购 无线吸尘器F8 玫瑰金礼盒版', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '件', 988, 12, '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\"]', 1546272000, 1551283200, '无线吸尘器F8 玫瑰金礼盒版', 999.00, 10.00, 1, 50.00, 1.00, 1, 0, '', 1699.00, '无线吸尘器F8', 100.00, 1, 1, 1, 0, 1, 1.00, '', 73, 0);
INSERT INTO `eb_store_bargain` VALUES (2, 3, '加湿器 智能 白色', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '件', 999, 1, '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\"]', 1546272000, 1551283200, '智米加湿器 白色 4L', 249.00, 1.00, 1, 10.00, 0.01, 1, 0, '', 249.00, '加湿器 智能 白色', 10.00, 0, 1, 1, 0, 1, 0.00, '', 15, 0);
INSERT INTO `eb_store_bargain` VALUES (3, 1, '测试', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '件', 576, 41, '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\"]', 1553011200, 1556553600, '无线吸尘器F8 玫瑰金礼盒版', 2.00, 0.00, 1, 2.00, 1.00, 1, 1, NULL, 1699.00, '测试', 100.00, 1, 1, 0, NULL, 1, 1.00, NULL, 388, 24);
INSERT INTO `eb_store_bargain` VALUES (4, 2, '测试2', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '件', 992, 15, '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\"]', 1553011200, 1556553600, '智能马桶盖 AI版', 3.00, 0.00, 1, 2.00, 1.00, 1, 1, '只能马桶限时砍价活动<p></p>', 1999.00, '测试2', 1500.00, 0, 1, 0, NULL, 1, 0.00, '<p>没人限购一件哦</p><p>活动截止时间：2019-05-01</p><p></p>', 137, 13);
INSERT INTO `eb_store_bargain` VALUES (5, 3, '砍价活动测试产品', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '件', 999, 41, '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\"]', 1554912000, 1555689600, '智米加湿器 白色', 11.00, 0.00, 1, 3.00, 2.00, 1, 1, NULL, 249.00, '砍价活动测试产品', 10.00, 0, 1, 0, NULL, 1, 0.00, NULL, 5, 2);
INSERT INTO `eb_store_bargain` VALUES (6, 4, '10人砍价', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc23646fff.jpg', '件', 418, 82, '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc23646fff.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\"]', 1554825600, 1556553600, '互联网电热水器1A', 100.00, 0.00, 1, 11.00, 9.00, 1, 1, NULL, 999.00, '10人砍价', 888.00, 0, 1, 0, NULL, 1, 0.00, NULL, 46, 5);

-- ----------------------------
-- Table structure for eb_store_bargain_user
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_bargain_user`;
CREATE TABLE `eb_store_bargain_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户参与砍价表ID',
  `uid` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `bargain_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '砍价产品id',
  `bargain_price_min` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '砍价的最低价',
  `bargain_price` decimal(8, 2) NULL DEFAULT NULL COMMENT '砍价金额',
  `price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '砍掉的价格',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1参与中 2 活动结束参与失败 3活动结束参与成功',
  `add_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '参与时间',
  `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否取消',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户参与砍价表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_bargain_user_help
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_bargain_user_help`;
CREATE TABLE `eb_store_bargain_user_help`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '砍价用户帮助表ID',
  `uid` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '帮助的用户id',
  `bargain_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '砍价产品ID',
  `bargain_user_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '用户参与砍价表id',
  `price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '帮助砍价多少金额',
  `add_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '砍价用户帮助表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_cart
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_cart`;
CREATE TABLE `eb_store_cart`  (
  `id` bigint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '购物车表ID',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `product_attr_unique` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品属性',
  `cart_num` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品数量',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '添加时间',
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = 未购买 1 = 已购买',
  `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `is_new` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为立即购买',
  `combination_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '拼团id',
  `seckill_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '秒杀产品ID',
  `bargain_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '砍价id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`uid`) USING BTREE,
  INDEX `goods_id`(`product_id`) USING BTREE,
  INDEX `uid`(`uid`, `is_pay`) USING BTREE,
  INDEX `uid_2`(`uid`, `is_del`) USING BTREE,
  INDEX `uid_3`(`uid`, `is_new`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_cart
-- ----------------------------
INSERT INTO `eb_store_cart` VALUES (1, 1, 'product', 4, '0', 2, 1568773230, 1, 0, 1, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (2, 1, 'product', 11, '0', 1, 1569132987, 0, 1, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (3, 1, 'product', 15, '0', 2, 1569133004, 0, 1, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (4, 1, 'product', 18, '0', 1, 1569134348, 0, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (5, 18, 'product', 16, '', 1, 1570328734, 0, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (6, 18, 'product', 25, '', 1, 1571047104, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (7, 18, 'product', 26, '', 2, 1570527975, 0, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (8, 18, 'product', 28, '', 3, 1570530496, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (9, 18, 'product', 19, '', 1, 1570415477, 0, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (10, 18, 'product', 22, '', 2, 1570418109, 0, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (11, 18, 'product', 23, '', 5, 1570414322, 0, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (12, 18, 'product', 27, '', 2, 1570530364, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (13, 18, 'product', 20, '', 2, 1570530317, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (14, 18, 'product', 24, '', 10, 1570522359, 0, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (15, 18, 'product', 21, '', 1, 1571044727, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (16, 18, 'product', 30, '', 2, 1570530375, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (17, 18, 'product', 29, '', 2, 1570530058, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (18, 18, 'product', 27, '', 5, 1570540469, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (19, 18, 'product', 31, '', 10, 1570607243, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (20, 18, 'product', 32, '', 10, 1570607404, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (21, 18, 'product', 33, '', 5, 1570950662, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (22, 18, 'product', 32, '', 10, 1570979510, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (23, 18, 'product', 31, '', 10, 1570979663, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (24, 18, 'product', 31, '', 10, 1570979681, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (25, 18, 'product', 32, '', 1, 1571033437, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (26, 18, 'product', 33, '', 1, 1571024515, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (27, 18, 'product', 17, '', 1, 1571044754, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (28, 18, 'product', 31, '', 10, 1571044871, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (29, 18, 'product', 30, '', 1, 1571045975, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (30, 18, 'product', 31, '', 1, 1571046693, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (31, 18, 'product', 31, '', 1, 1571047995, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (32, 18, 'product', 25, '', 1, 1572402485, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (33, 18, 'product', 17, '', 1, 1572402871, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (34, 18, 'product', 17, '', 1, 1572407259, 1, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_cart` VALUES (35, 18, 'product', 27, '', 8, 1572424173, 1, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for eb_store_category
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_category`;
CREATE TABLE `eb_store_category`  (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类表ID',
  `pid` mediumint(11) NOT NULL COMMENT '父id',
  `cate_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `sort` mediumint(11) NOT NULL COMMENT '排序',
  `pic` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否推荐',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `is_base`(`is_show`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_category
-- ----------------------------
INSERT INTO `eb_store_category` VALUES (1, 0, '现代言情', 2, 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\s_5d818530e7fab.jpg', 1, 1547205038);
INSERT INTO `eb_store_category` VALUES (2, 1, '娱乐明星', 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', 1, 1547205055);
INSERT INTO `eb_store_category` VALUES (3, 1, '婚礼婚外', 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', 1, 1547550363);
INSERT INTO `eb_store_category` VALUES (4, 1, '都市纯爱', 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc6a38fab.jpg', 1, 1553783295);
INSERT INTO `eb_store_category` VALUES (6, 0, '古代言情', 1, 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\s_5d818530e7fab.jpg', 1, 1553783609);
INSERT INTO `eb_store_category` VALUES (7, 6, '古色古香', 1, 'http://datong.crmeb.net/public/uploads/attach/2019/03/29/5c9de8b7c5cc5.png', 1, 1553784473);
INSERT INTO `eb_store_category` VALUES (8, 6, '宫廷宫斗', 0, 'http://datong.crmeb.net/public/uploads/attach/2019/03/29/5c9def00c2882.png', 1, 1553784490);
INSERT INTO `eb_store_category` VALUES (21, 6, '历史传奇', 0, 'http://datong.crmeb.net/public/uploads/attach/2019/03/29/5c9df170010cb.png', 1, 1553854835);
INSERT INTO `eb_store_category` VALUES (23, 0, '幻想仙侠', 1, 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\s_5d818530e7fab.jpg', 1, 1570550496);
INSERT INTO `eb_store_category` VALUES (24, 0, '成功励志', 1, 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\s_5d818530e7fab.jpg', 1, 1570550533);
INSERT INTO `eb_store_category` VALUES (25, 24, '成功学', 0, 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\10\\07\\\\0e5d897f56384df3cb8b94d4aee94bfc.jpg', 1, 1570550744);
INSERT INTO `eb_store_category` VALUES (26, 24, '青少年励志', 0, 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\10\\07\\\\d6dacfbabf8695a2c7d2f821f2e3e87a.jpg', 1, 1570550789);
INSERT INTO `eb_store_category` VALUES (27, 24, '人际处事', 0, 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\10\\07\\\\5409c8f62e74b3a809bc61772eb62881.jpg', 1, 1570550837);
INSERT INTO `eb_store_category` VALUES (28, 23, '仙侠幻情', 0, 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\10\\05\\\\82cafe59ba68959e94362ffce6c8f263.jpg', 1, 1570550890);
INSERT INTO `eb_store_category` VALUES (29, 23, '奇幻异能', 0, 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\10\\04\\\\d4513d907066d0a02d9d7899d2f89f4b.jpg', 1, 1570550921);

-- ----------------------------
-- Table structure for eb_store_combination
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_combination`;
CREATE TABLE `eb_store_combination`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品id',
  `mer_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '商户id',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推荐图',
  `images` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动标题',
  `attr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动属性',
  `people` int(2) UNSIGNED NOT NULL COMMENT '参团人数',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '价格',
  `sort` int(10) UNSIGNED NOT NULL COMMENT '排序',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `stock` int(10) UNSIGNED NOT NULL COMMENT '库存',
  `add_time` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `is_host` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '推荐',
  `is_show` tinyint(1) UNSIGNED NOT NULL COMMENT '产品状态',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `combination` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `mer_use` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '商户是否可用1可用0不可用',
  `is_postage` tinyint(1) UNSIGNED NOT NULL COMMENT '是否包邮1是0否',
  `postage` decimal(10, 2) UNSIGNED NOT NULL COMMENT '邮费',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '拼团内容',
  `start_time` int(11) UNSIGNED NOT NULL COMMENT '拼团开始时间',
  `stop_time` int(11) UNSIGNED NOT NULL COMMENT '拼团结束时间',
  `cost` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拼图产品成本',
  `browse` int(11) NULL DEFAULT 0 COMMENT '浏览量',
  `unit_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '单位名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '拼团产品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_combination
-- ----------------------------
INSERT INTO `eb_store_combination` VALUES (1, 1, 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\"]', '3人团 无线吸尘器F8 玫瑰金礼盒版', '', 3, '年货节活动价1699元，领取吸尘器优惠券再减50元，到手价仅1649元', 1.00, 0, 20, 980, '1547554180', 1, 1, 1, 1, 0, 1, 1.00, '', 1546272000, 1551283200, 0, 4, '');
INSERT INTO `eb_store_combination` VALUES (2, 3, 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\"]', '智米加湿器 白色', '', 6, '智米加湿器 白色', 199.00, 0, 0, 999, '1547554327', 1, 1, 1, 1, 0, 1, 0.00, '', 1546272000, 1551283200, 0, 3, '');
INSERT INTO `eb_store_combination` VALUES (3, 2, 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\"]', '智能马桶盖 AI版', '', 10, '智能马桶盖 AI版', 499.00, 0, 8, 992, '1547554596', 1, 1, 1, 1, 0, 1, 0.00, '', 1546272000, 1551283200, 0, 3, '');
INSERT INTO `eb_store_combination` VALUES (4, 3, 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\"]', '测试', NULL, 2, '测试', 0.01, 0, 537, 463, '1554909810', 1, 1, 0, 1, NULL, 1, 0.00, '', 1554825600, 1559232000, 0, 0, '');
INSERT INTO `eb_store_combination` VALUES (5, 1, 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\"]', '5人团：无线吸尘器F8 玫瑰金礼盒版', NULL, 5, '【年货节活动价1699元，领取吸尘器优惠券再减50元，到手价仅1649元】', 0.01, 0, 231, 5858, '1555125024', 1, 1, 0, 1, NULL, 1, 1.00, '', 1554998400, 1556553600, 0, 0, '');
INSERT INTO `eb_store_combination` VALUES (6, 2, 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\"]', '10人团：智能马桶盖 AI版', NULL, 10, '智能马桶盖 AI版', 0.01, 0, 53, 9934, '1555125049', 1, 1, 0, 1, NULL, 1, 0.00, '', 1554998400, 1556553600, 0, 0, '');

-- ----------------------------
-- Table structure for eb_store_combination_attr
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_combination_attr`;
CREATE TABLE `eb_store_combination_attr`  (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `attr_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名',
  `attr_values` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  INDEX `store_id`(`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_combination_attr_result
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_combination_attr_result`;
CREATE TABLE `eb_store_combination_attr_result`  (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性参数',
  `change_time` int(10) UNSIGNED NOT NULL COMMENT '上次修改时间',
  UNIQUE INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_combination_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_combination_attr_value`;
CREATE TABLE `eb_store_combination_attr_value`  (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `suk` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) UNSIGNED NOT NULL COMMENT '属性对应的库存',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `price` decimal(8, 2) UNSIGNED NOT NULL COMMENT '属性金额',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `unique` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8, 2) UNSIGNED NOT NULL COMMENT '成本价',
  UNIQUE INDEX `unique`(`unique`, `suk`) USING BTREE,
  INDEX `store_id`(`product_id`, `suk`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_coupon
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_coupon`;
CREATE TABLE `eb_store_coupon`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '优惠券表ID',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券名称',
  `integral` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '兑换消耗积分值',
  `coupon_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '兑换的优惠券面值',
  `use_min_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低消费多少金额可用优惠券',
  `coupon_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '优惠券有效期限（单位：天）',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态（0：关闭，1：开启）',
  `add_time` int(11) UNSIGNED NOT NULL COMMENT '兑换项目添加时间',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `state`(`status`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `coupon_time`(`coupon_time`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_coupon_issue
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_coupon_issue`;
CREATE TABLE `eb_store_coupon_issue`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(10) NULL DEFAULT NULL COMMENT '优惠券ID',
  `start_time` int(10) NULL DEFAULT NULL COMMENT '优惠券领取开启时间',
  `end_time` int(10) NULL DEFAULT NULL COMMENT '优惠券领取结束时间',
  `total_count` int(10) NULL DEFAULT NULL COMMENT '优惠券领取数量',
  `remain_count` int(10) NULL DEFAULT NULL COMMENT '优惠券剩余领取数量',
  `is_permanent` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否无限张数',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 正常 0 未开启 -1 已无效',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `add_time` int(10) NULL DEFAULT NULL COMMENT '优惠券添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `start_time`(`start_time`, `end_time`) USING BTREE,
  INDEX `remain_count`(`remain_count`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券前台领取表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_coupon_issue_user
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_coupon_issue_user`;
CREATE TABLE `eb_store_coupon_issue_user`  (
  `uid` int(10) NULL DEFAULT NULL COMMENT '领取优惠券用户ID',
  `issue_coupon_id` int(10) NULL DEFAULT NULL COMMENT '优惠券前台领取ID',
  `add_time` int(10) NULL DEFAULT NULL COMMENT '领取时间',
  UNIQUE INDEX `uid`(`uid`, `issue_coupon_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券前台用户领取记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_coupon_user
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_coupon_user`;
CREATE TABLE `eb_store_coupon_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券发放记录id',
  `cid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '兑换的项目id',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '优惠券所属用户',
  `coupon_title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券名称',
  `coupon_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '优惠券的面值',
  `use_min_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低消费多少金额可用优惠券',
  `add_time` int(11) UNSIGNED NOT NULL COMMENT '优惠券创建时间',
  `end_time` int(11) UNSIGNED NOT NULL COMMENT '优惠券结束时间',
  `use_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用时间',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'send' COMMENT '获取方式',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态（0：未使用，1：已使用, 2:已过期）',
  `is_fail` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `end_time`(`end_time`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_fail`(`is_fail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券发放记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_order
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_order`;
CREATE TABLE `eb_store_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `uid` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `real_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `user_phone` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户电话',
  `user_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `cart_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '[]' COMMENT '购物车id',
  `total_num` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单商品总数',
  `total_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '订单总价',
  `total_postage` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '邮费',
  `pay_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '实际支付金额',
  `pay_postage` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '支付邮费',
  `deduction_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '抵扣金额',
  `coupon_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '优惠券id',
  `coupon_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '优惠券金额',
  `paid` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付状态',
  `pay_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '支付时间',
  `pay_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式',
  `add_time` int(11) UNSIGNED NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '订单状态（-1 : 申请退款 -2 : 退货成功 0：待发货；1：待收货；2：已收货；3：待评价；-1：已退款）',
  `refund_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 未退款 1 申请中 2 已退款',
  `refund_reason_wap_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款图片',
  `refund_reason_wap_explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退款用户说明',
  `refund_reason_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '退款时间',
  `refund_reason_wap` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前台退款原因',
  `refund_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不退款的理由',
  `refund_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '退款金额',
  `delivery_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递名称/送货人姓名',
  `delivery_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货类型',
  `delivery_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递单号/手机号',
  `gain_integral` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '消费赚取积分',
  `use_integral` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '使用积分',
  `back_integral` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '给用户退了多少积分',
  `mark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  `unique` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一id(md5加密)类似id',
  `remark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员备注',
  `mer_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户ID',
  `is_mer_check` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `combination_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '拼团产品id0一般产品',
  `pink_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拼团id 0没有拼团',
  `cost` decimal(8, 2) UNSIGNED NOT NULL COMMENT '成本价',
  `seckill_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '秒杀产品ID',
  `bargain_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '砍价id',
  `is_channel` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '支付渠道(0微信公众号1微信小程序)',
  `is_remind` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '新订单消息提醒',
  `is_system_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '后台管理员删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id_2`(`order_id`, `uid`) USING BTREE,
  UNIQUE INDEX `unique`(`unique`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `pay_price`(`pay_price`) USING BTREE,
  INDEX `paid`(`paid`) USING BTREE,
  INDEX `pay_time`(`pay_time`) USING BTREE,
  INDEX `pay_type`(`pay_type`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE,
  INDEX `coupon_id`(`coupon_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_order
-- ----------------------------
INSERT INTO `eb_store_order` VALUES (1, 'wx2019091810211210001', 1, 'liwnwnn', '13075976327', '重庆 铜梁县 水口镇 wwww', '[1]', 2, 1998.00, 0.00, 1998.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixin', 1568773272, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 999.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, 'fa2a2dc5d6ebbc68ad33fb1f75df5ee5', NULL, 0, 0, 0, 0, 1776.00, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_order` VALUES (2, '2222', 22, '22', '2222', '2222', '[1]', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, NULL, '', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 888.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, 'dsdsdad', NULL, 0, 0, 0, 0, 0.00, 0, 0, 0, 0, 0);
INSERT INTO `eb_store_order` VALUES (3, 'wx2019100818214210001', 18, '林文捷', '15884427595', '福建省 福州市 仓山区 阳光学院', '[17]', 2, 110.00, 0.00, 110.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1570530102, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 1110.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, '8dea0e5c97544d452a6f678eb8e5ce73', NULL, 0, 0, 0, 0, 104.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (4, 'wx2019100818252510002', 18, '林文捷', '15884427595', '福建省 福州市 仓山区 阳光学院', '[13]', 2, 11800.00, 0.00, 11800.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1570530325, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 0.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, '12aad86ee5f0b4515df966cd7004e8aa', NULL, 0, 0, 0, 0, 9800.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (5, 'wx2019100818260610003', 18, '林文捷', '15884427595', '福建省 福州市 仓山区 阳光学院', '[12]', 2, 998.00, 0.00, 998.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1570530366, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 888.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, '061f1090282f4c5215f77af815395256', NULL, 0, 0, 0, 0, 998.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (6, 'wx2019100818262110004', 18, '林文捷', '15884427595', '福建省 福州市 仓山区 阳光学院', '[16]', 2, 1088.00, 0.00, 1088.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1570530381, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 10600.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, 'ff67f2013c810cbd251d3b2bb9689173', NULL, 0, 0, 0, 0, 1022.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (7, 'wx2019100818281910005', 18, '林文捷', '15884427595', '福建省 福州市 仓山区 阳光学院', '[8]', 3, 165.00, 0.00, 165.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1570530499, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 72.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, '97d29712ecb42a4973f7cebffbe2a17c', NULL, 0, 0, 0, 0, 663.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (8, 'wx2019100821144010006', 18, '林文捷', '15884427595', '福建省 福州市 仓山区 阳光学院', '[18]', 5, 2495.00, 0.00, 2495.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1570540480, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 2220.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, '9a5b143b715c1a5a74e60d603cb0aff8', NULL, 0, 0, 0, 0, 2495.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (9, 'wx2019100915485510001', 18, '林文捷', '15884427595', '福建省 福州市 仓山区 阳光学院', '[19]', 10, 550.00, 0.00, 550.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1570607335, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 1120.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, '3c97311d37a29dd1b257687b5360a767', NULL, 0, 0, 0, 0, 520.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (10, 'wx2019100915501110002', 18, '林文捷', '15884427595', '福建省 福州市 仓山区 阳光学院', '[20]', 10, 300.00, 0.00, 300.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1570607411, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 2500.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, 'c071a9c3dd2ebcd82db46c91a2fded32', NULL, 0, 0, 0, 0, 200.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (11, 'wx2019101315110410001', 18, '林文捷', '15884427595', '福建省 福州市 仓山区 阳光学院', '[21]', 5, 125.00, 0.00, 125.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1570950664, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 1000.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, '99f0cd11c3eb119758e9a8e4bdc6ab85', NULL, 0, 0, 0, 0, 75.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (12, 'wx2019101323115310002', 18, '林文捷', '15884427595', '福建省 福州市 仓山区 阳光学院', '[22]', 10, 300.00, 0.00, 300.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1570979513, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 2500.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, '1d2f6cbeaf0528b1bbf5d7e6aee64921', NULL, 0, 0, 0, 0, 200.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (13, 'wx2019101323142610003', 18, '林文捷', '15884427595', '福建省 福州市 仓山区 阳光学院', '[23]', 10, 550.00, 0.00, 550.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1570979666, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 1120.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, 'e976e42782293e98eb6fbcc9d8c5a140', NULL, 0, 0, 0, 0, 520.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (14, 'wx2019101323144310004', 18, '林文捷', '15884427595', '福建省 福州市 仓山区 阳光学院', '[24]', 10, 550.00, 0.00, 550.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1570979683, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 1120.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, '502205c3639f3e768d6cdd0d89a59d63', NULL, 0, 0, 0, 0, 520.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (15, 'wx2019101411430010001', 18, '林文捷', '15884427595', '福建省 福州市 仓山区 阳光学院', '[26]', 1, 25.00, 0.00, 25.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1571024580, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 200.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, 'f023e8caedeab2a26b48a362a0f027f4', NULL, 0, 0, 0, 0, 15.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (16, 'wx2019101414103910002', 18, '林文捷', '15884427595', '福建省 福州市 仓山区 阳光学院', '[25]', 1, 30.00, 0.00, 30.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1571033439, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 250.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, '09976e5ee21127af8574173556c0943f', NULL, 0, 0, 0, 0, 20.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (17, 'wx2019101417184810003', 18, '林文捷', '15884427595', '福建省 福州市 仓山区 阳光学院', '[15]', 1, 20.00, 0.00, 20.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1571044728, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 222.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, 'f5181e528e449547e1e0cc8008192c5e', NULL, 0, 0, 0, 0, 222.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (18, 'wx2019101417195810004', 18, '林文捷', '15884427595', '福建省 福州市 仓山区 阳光学院', '[27]', 1, 552.00, 0.00, 552.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1571044798, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 55.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, 'fcd3a4b76b180d5da3fb203295842bdd', NULL, 0, 0, 0, 0, 55.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (19, 'wx2019101417211310005', 18, '林文捷', '15884427595', '福建省 福州市 仓山区 阳光学院', '[28]', 10, 550.00, 0.00, 550.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1571044873, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 1120.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, '061976347c3278e63498a5315825de67', NULL, 0, 0, 0, 0, 520.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (20, 'wx2019101417394510006', 18, '林文捷', '15884427595', '福建省 福州市 仓山区 阳光学院', '[29]', 1, 544.00, 0.00, 544.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1571045985, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 5300.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, '7bf6d35078ff5b09378b5be82ecb3898', NULL, 0, 0, 0, 0, 511.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (21, 'wx2019101417513510007', 18, '林文捷', '15884427595', '福建省 福州市 仓山区 阳光学院', '[30]', 1, 55.00, 0.00, 55.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1571046695, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 112.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, '3c64d3869f8a78d455188676a47267dd', NULL, 0, 0, 0, 0, 52.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (22, 'wx2019101417582510008', 18, '林文捷', '15884427595', '福建省 福州市 仓山区 阳光学院', '[6]', 1, 50.00, 0.00, 50.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1571047105, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 50.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, 'a8659ee6accc5b3bf4e81c8ce0a0c69a', NULL, 0, 0, 0, 0, 11.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (23, 'wx2019101418133010009', 18, '林文捷', '15884427595', '福建省 福州市 仓山区 阳光学院', '[31]', 1, 55.00, 0.00, 55.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1571048010, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 112.00, 0.00, NULL, '订单未支付已超过系统预设时间', 1, '1d9eacde9d7a38b0ab2eba69e0972366', NULL, 0, 0, 0, 0, 52.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (24, 'wx2019103010280810001', 18, '林文捷', '18344997512', '福建省 福清市 丧失 阳光学院', '[32]', 1, 50.00, 0.00, 50.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1572402488, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 50.00, 0.00, NULL, '', 0, '49cf80124114c594baae23e86b829f28', NULL, 0, 0, 0, 0, 11.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (25, 'wx2019103010343310002', 18, '林文捷', '18344997512', '福建省 福清市 丧失 阳光学院', '[33]', 1, 552.00, 0.00, 552.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1572402873, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 55.00, 0.00, NULL, '', 0, 'cc2a24a29e31dd8dd0167040220ce121', NULL, 0, 0, 0, 0, 55.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (26, 'wx2019103011474210003', 18, '林文捷', '18344997512', '福建省 福清市 丧失 阳光学院', '[34]', 1, 552.00, 0.00, 552.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1572407262, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 55.00, 0.00, NULL, '', 0, 'd9a02f41bc8bcc1c3b180830b82f10f6', NULL, 0, 0, 0, 0, 55.00, 0, 0, 1, 0, 0);
INSERT INTO `eb_store_order` VALUES (27, 'wx2019103016293510004', 18, '林文捷', '18344997512', '福建省 福清市 丧失 阳光学院', '[35]', 8, 3992.00, 0.00, 3992.00, 0.00, 0.00, 0, 0.00, 0, NULL, 'weixinapp', 1572424175, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, 3552.00, 0.00, NULL, '', 0, 'dd753101628da55ad4118fc1557e7c39', NULL, 0, 0, 0, 0, 3992.00, 0, 0, 1, 0, 0);

-- ----------------------------
-- Table structure for eb_store_order_cart_info
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_order_cart_info`;
CREATE TABLE `eb_store_order_cart_info`  (
  `oid` int(11) UNSIGNED NOT NULL COMMENT '订单id',
  `cart_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '购物车id',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `cart_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买东西的详细信息',
  `unique` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一id',
  UNIQUE INDEX `oid`(`oid`, `unique`) USING BTREE,
  INDEX `cart_id`(`cart_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单购物详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_order_cart_info
-- ----------------------------
INSERT INTO `eb_store_order_cart_info` VALUES (1, 1, 4, '{\"id\":1,\"uid\":1,\"type\":\"product\",\"product_id\":4,\"product_attr_unique\":\"0\",\"cart_num\":2,\"add_time\":1568773230,\"is_pay\":0,\"is_del\":0,\"is_new\":1,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":4,\"image\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc23646fff.jpg\",\"slider_image\":[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc23646fff.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\"],\"price\":\"999.00\",\"cost\":\"888.00\",\"ot_price\":\"1599.00\",\"vip_price\":\"0.00\",\"postage\":\"0.00\",\"mer_id\":0,\"give_integral\":\"999.00\",\"cate_id\":\"3\",\"sales\":82,\"stock\":418,\"store_name\":\"\\u4e92\\u8054\\u7f51\\u7535\\u70ed\\u6c34\\u56681A\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":1},\"truePrice\":999,\"costPrice\":888,\"trueStock\":418}', '6512bd43d9caa6e02c990b0a82652dca');
INSERT INTO `eb_store_order_cart_info` VALUES (3, 17, 29, '{\"id\":17,\"uid\":18,\"type\":\"product\",\"product_id\":29,\"product_attr_unique\":\"\",\"cart_num\":2,\"add_time\":1570530058,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":29,\"image\":\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/5409c8f62e74b3a809bc61772eb62881.jpg\",\"slider_image\":[\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/5409c8f62e74b3a809bc61772eb62881.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/1404ffd13367de0b01d8d112cef2a3f3.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/3b1a64c644aaad228ac39d9d0ed444f7.jpg\"],\"price\":\"55.00\",\"ot_price\":\"55.00\",\"vip_price\":\"0.00\",\"postage\":\"55.00\",\"mer_id\":0,\"give_integral\":\"555.00\",\"cate_id\":\"4\",\"sales\":0,\"stock\":555,\"store_name\":\"\\u6446\\u6e21\\u4eba2\\u91cd\\u8fd4\\u8352\\u539f\\u6b63\\u7248\\u5305\\u90ae\\u4e66\\u7c4d\\u4e0e\\u8ffd\\u98ce\\u7b5d\\u7684\\u4eba\\u5077\\u5f71\\u5b50\\u7684\\u4eba6\\u518c\\u540c\\u7c7b\\u9752\\u6625\\u5916\\u56fd\\u6587\\u5b66\\u5c0f\\u8bf4\\u4e66\\u7c4d\\u4e66\\u6392\\u884c\\u699c\\u65b0\\u534e\\u4e66\\u5e97\\u6587\\u8f69\\u5b98\\u7f51\\u65d7\\u8230\\u5e97\",\"store_info\":\"\\u6446\\u6e21\\u4eba2\\u91cd\\u8fd4\\u8352\\u539f\\u6b63\\u7248\\u5305\\u90ae\\u4e66\\u7c4d\\u4e0e\\u8ffd\\u98ce\\u7b5d\\u7684\\u4eba\\u5077\\u5f71\\u5b50\\u7684\\u4eba6\\u518c\\u540c\\u7c7b\\u9752\\u6625\\u5916\\u56fd\\u6587\\u5b66\\u5c0f\\u8bf4\\u4e66\\u7c4d\\u4e66\\u6392\\u884c\\u699c\\u65b0\\u534e\\u4e66\\u5e97\\u6587\\u8f69\\u5b98\\u7f51\\u65d7\\u8230\\u5e97\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"52.00\"},\"truePrice\":55,\"vip_truePrice\":0,\"trueStock\":555,\"costPrice\":\"52.00\"}', 'f7e6c85504ce6e82442c770f7c8606f0');
INSERT INTO `eb_store_order_cart_info` VALUES (4, 13, 20, '{\"id\":13,\"uid\":18,\"type\":\"product\",\"product_id\":20,\"product_attr_unique\":\"\",\"cart_num\":2,\"add_time\":1570530317,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":20,\"image\":\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/27\\/\\/f9c97c89a1019083c4a81f168a1f4d34.jpg\",\"slider_image\":[\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/27\\/\\/f9c97c89a1019083c4a81f168a1f4d34.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/27\\/\\/fb03e941eb06e3960c046b45ba6df08c.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/27\\/\\/b7aeeec2ab41789ec92609b74d795c2e.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/27\\/\\/bafbae3b007ca2a242210516abd867b5.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/27\\/\\/59bd99a64639700434a027779bffbde0.jpg\"],\"price\":\"5900.00\",\"ot_price\":\"5999.00\",\"vip_price\":\"0.00\",\"postage\":\"0.00\",\"mer_id\":0,\"give_integral\":\"0.00\",\"cate_id\":\"4\",\"sales\":0,\"stock\":1000,\"store_name\":\"Lenovo\\/\\u8054\\u60f3\\u62ef\\u6551\\u8005Y7000\\u6e38\\u620f\\u7b14\\u8bb0\\u672c\\u56db\\u6838\\u624b\\u6b3e\\u9177\\u777fi5\\u5403\\u9e21\\u6e38\\u620f\\u672cP\",\"store_info\":\"Lenovo\\/\\u8054\\u60f3\\u62ef\\u6551\\u8005Y7000\\u6e38\\u620f\\u7b14\\u8bb0\\u672c\\u56db\\u6838\\u624b\\u63d0\\u7535\\u811115.6\\u82f1\\u5bf8\\u9177\\u777f\\u4e5d\\u4ee3\\u8f7b\\u8584\\u72ec\\u663e2019\\u65b0\\u6b3e\\u9177\\u777fi5\\u5403\\u9e21\\u6e38\\u620f\\u672cP\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"4900.00\"},\"truePrice\":5900,\"vip_truePrice\":0,\"trueStock\":1000,\"costPrice\":\"4900.00\"}', '02522a2b2726fb0a03bb19f2d8d9524d');
INSERT INTO `eb_store_order_cart_info` VALUES (5, 12, 27, '{\"id\":12,\"uid\":18,\"type\":\"product\",\"product_id\":27,\"product_attr_unique\":\"\",\"cart_num\":2,\"add_time\":1570530364,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":27,\"image\":\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/cfad1a2cdb82d602bcd3e79c550a2534.jpg\",\"slider_image\":[\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/cfad1a2cdb82d602bcd3e79c550a2534.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/84b08301e589cbe83411ece88757aeaa.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/d3e44711d453286259aec2bacaecf107.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/a9fb1196cbcdc68fc6d80cb171d9ec6c.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/d2febcef9fbd999589aec8ecf6481860.jpg\"],\"price\":\"499.00\",\"ot_price\":\"4444.00\",\"vip_price\":\"0.00\",\"postage\":\"0.00\",\"mer_id\":0,\"give_integral\":\"444.00\",\"cate_id\":\"4\",\"sales\":0,\"stock\":444,\"store_name\":\"2019\\u65b0\\u7248\\u7c73\\u5c0f\\u5708\\u4e0a\\u5b66\\u8bb0\\u4e00\\u5e74\\u7ea7\\u5168\\u59574\\u518c\\u6ce8\\u97f3\\u7248\\u5fc5\\u8bfb\\u8bfe\\u5916\\u4e6612\\u5e26\\u62fc\\u97f3\\u7684\\u751f\\u8bfe\\u5916\\u9605\\u8bfb\",\"store_info\":\"2019\\u65b0\\u7248\\u7c73\\u5c0f\\u5708\\u4e0a\\u5b66\\u8bb0\\u4e00\\u5e74\\u7ea7\\u5168\\u59574\\u518c\\u6ce8\\u97f3\\u7248\\u5fc5\\u8bfb\\u8bfe\\u5916\\u4e6612\\u5e26\\u62fc\\u97f3\\u7684\\u6f2b\\u753b\\u4e66\\u4e8c\\u5e74\\u7ea7\\u4e09\\u6545\\u4e8b\\u4e66\\u7c73\\u4f60\\u5c0f\\u5708\\u4e0b\\u518c\\u5c0f\\u5b66\\u751f\\u8bfe\\u5916\\u9605\\u8bfb\\u4e66\\u7c4d\\u7206\\u7b11\\u6f2b\\u753b\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"499.00\"},\"truePrice\":499,\"vip_truePrice\":0,\"trueStock\":444,\"costPrice\":\"499.00\"}', '3def184ad8f4755ff269862ea77393dd');
INSERT INTO `eb_store_order_cart_info` VALUES (6, 16, 30, '{\"id\":16,\"uid\":18,\"type\":\"product\",\"product_id\":30,\"product_attr_unique\":\"\",\"cart_num\":2,\"add_time\":1570530375,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":30,\"image\":\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/cb6dc012404524aaa47a47766c59f2e0.jpg\",\"slider_image\":[\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/cb6dc012404524aaa47a47766c59f2e0.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/0e5d897f56384df3cb8b94d4aee94bfc.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/fe4bfe9f98c015001c1bbf74ee26c41a.jpg\"],\"price\":\"544.00\",\"ot_price\":\"554.00\",\"vip_price\":\"0.00\",\"postage\":\"5.00\",\"mer_id\":0,\"give_integral\":\"5300.00\",\"cate_id\":\"4\",\"sales\":0,\"stock\":55222,\"store_name\":\"\\u3010\\u65b0\\u534e\\u4e66\\u5e97\\u3011\\u6446\\u6e21\\u4eba\\u514b\\u83b1\\u513f\\u9ea6\\u514b\\u798f\\u5c14\\u8457\\u4e66\\u6b63\\u7248\\u5305\\u90ae\\u4e66\\u7c4d\\u4e0e\\u8ffd\\u98ce\\u7b5d\\u7684\\u4eba\\u5077\\u5f71\\u5b50\\u7684\\u4eba6\\u518c3\\u518c2\\u540c\\u4e3a\\u5916\\u56fd\\u6587\\u5b66\\u5fc3\\u7075\\u6cbb\\u6108\\u7cfb\\u5c0f\\u8bf4\\u8bfb\\u7269\\u52b1\\u5fd7\\u4e1b\\u4e66\",\"store_info\":\"\\u3010\\u65b0\\u534e\\u4e66\\u5e97\\u3011\\u6446\\u6e21\\u4eba\\u514b\\u83b1\\u513f\\u9ea6\\u514b\\u798f\\u5c14\\u8457\\u4e66\\u6b63\\u7248\\u5305\\u90ae\\u4e66\\u7c4d\\u4e0e\\u8ffd\\u98ce\\u7b5d\\u7684\\u4eba\\u5077\\u5f71\\u5b50\\u7684\\u4eba6\\u518c3\\u518c2\\u540c\\u4e3a\\u5916\\u56fd\\u6587\\u5b66\\u5fc3\\u7075\\u6cbb\\u6108\\u7cfb\\u5c0f\\u8bf4\\u8bfb\\u7269\\u52b1\\u5fd7\\u4e1b\\u4e66\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"511.00\"},\"truePrice\":544,\"vip_truePrice\":0,\"trueStock\":55222,\"costPrice\":\"511.00\"}', '7e7757b1e12abcb736ab9a754ffb617a');
INSERT INTO `eb_store_order_cart_info` VALUES (7, 8, 28, '{\"id\":8,\"uid\":18,\"type\":\"product\",\"product_id\":28,\"product_attr_unique\":\"\",\"cart_num\":3,\"add_time\":1570530496,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":28,\"image\":\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/876d45301b38ba03a0ecb973cdeb9c8e.jpg\",\"slider_image\":[\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/876d45301b38ba03a0ecb973cdeb9c8e.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/81610def900553bb33836ad2fef63563.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/c8102fb59812fb157a67d720ea7dc52c.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/d10a37a5dcbb05ec1c18c3b37ba7a3c9.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/7e4c1401da61e90905e9987e57014274.jpg\"],\"price\":\"55.00\",\"ot_price\":\"42.00\",\"vip_price\":\"0.00\",\"postage\":\"0.00\",\"mer_id\":0,\"give_integral\":\"24.00\",\"cate_id\":\"4\",\"sales\":0,\"stock\":25,\"store_name\":\"\\u6b63\\u7248\\u4e0d\\u4e00\\u6837\\u7684\\u5361\\u6885\\u62c9\\u5168\\u5957\\u6ce8\\u97f3\\u7248\\u5927\\u672c\\u7b2c\\u4e00\\u5b631\\u56db\\u5b63\",\"store_info\":\"\\u6b63\\u7248\\u4e0d\\u4e00\\u6837\\u7684\\u5361\\u6885\\u62c9\\u5168\\u5957\\u6ce8\\u97f3\\u7248\\u5927\\u672c\\u7b2c\\u4e00\\u5b6315\\u518c\\u4e00\\u5e74\\u7ea7\\u4e8c\\u5e74\\u7ea7\\u6307\\u5b9a\\u4e66\\u7c4d\\u513f\\u7ae5\\u7ed8\\u672c\\u7761\\u524d\\u6545\\u4e8b\\u8bfe\\u5916\\u4e66368\\u5c81\\u6211\\u60f3\\u53bb\\u770b\\u6d77\\u62fc\\u97f3\\u7248\\u7b2c\\u4e8c\\u4e09\\u56db\\u5b63\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"221.00\"},\"truePrice\":55,\"vip_truePrice\":0,\"trueStock\":25,\"costPrice\":\"221.00\"}', 'c7e1249ffc03eb9ded908c236bd1996d');
INSERT INTO `eb_store_order_cart_info` VALUES (8, 18, 27, '{\"id\":18,\"uid\":18,\"type\":\"product\",\"product_id\":27,\"product_attr_unique\":\"\",\"cart_num\":5,\"add_time\":1570540469,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":27,\"image\":\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/cfad1a2cdb82d602bcd3e79c550a2534.jpg\",\"slider_image\":[\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/cfad1a2cdb82d602bcd3e79c550a2534.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/84b08301e589cbe83411ece88757aeaa.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/d3e44711d453286259aec2bacaecf107.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/a9fb1196cbcdc68fc6d80cb171d9ec6c.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/d2febcef9fbd999589aec8ecf6481860.jpg\"],\"price\":\"499.00\",\"ot_price\":\"4444.00\",\"vip_price\":\"0.00\",\"postage\":\"0.00\",\"mer_id\":0,\"give_integral\":\"444.00\",\"cate_id\":\"4\",\"sales\":2,\"stock\":442,\"store_name\":\"2019\\u65b0\\u7248\\u7c73\\u5c0f\\u5708\\u4e0a\\u5b66\\u8bb0\\u4e00\\u5e74\\u7ea7\\u5168\\u59574\\u518c\\u6ce8\\u97f3\\u7248\\u5fc5\\u8bfb\\u8bfe\\u5916\\u4e6612\\u5e26\\u62fc\\u97f3\\u7684\\u751f\\u8bfe\\u5916\\u9605\\u8bfb\",\"store_info\":\"2019\\u65b0\\u7248\\u7c73\\u5c0f\\u5708\\u4e0a\\u5b66\\u8bb0\\u4e00\\u5e74\\u7ea7\\u5168\\u59574\\u518c\\u6ce8\\u97f3\\u7248\\u5fc5\\u8bfb\\u8bfe\\u5916\\u4e6612\\u5e26\\u62fc\\u97f3\\u7684\\u6f2b\\u753b\\u4e66\\u4e8c\\u5e74\\u7ea7\\u4e09\\u6545\\u4e8b\\u4e66\\u7c73\\u4f60\\u5c0f\\u5708\\u4e0b\\u518c\\u5c0f\\u5b66\\u751f\\u8bfe\\u5916\\u9605\\u8bfb\\u4e66\\u7c4d\\u7206\\u7b11\\u6f2b\\u753b\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"499.00\"},\"truePrice\":499,\"vip_truePrice\":0,\"trueStock\":442,\"costPrice\":\"499.00\"}', '9dcb88e0137649590b755372b040afad');
INSERT INTO `eb_store_order_cart_info` VALUES (9, 19, 31, '{\"id\":19,\"uid\":18,\"type\":\"product\",\"product_id\":31,\"product_attr_unique\":\"\",\"cart_num\":10,\"add_time\":1570607243,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":31,\"image\":\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/d6dacfbabf8695a2c7d2f821f2e3e87a.jpg\",\"slider_image\":[\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/d6dacfbabf8695a2c7d2f821f2e3e87a.jpg\"],\"price\":\"55.00\",\"ot_price\":\"50.00\",\"vip_price\":\"0.00\",\"postage\":\"0.00\",\"mer_id\":0,\"give_integral\":\"112.00\",\"cate_id\":\"4\",\"sales\":0,\"stock\":5555,\"store_name\":\"\\u6b63\\u724850\\u4e2a\\u6559\\u80b2\\u6cd5\\u6211\\u628a\\u4e09\\u4e2a\\u513f\\u5b50\\u9001\\u5165\\u4e86\\u65af\\u5766\\u798f\\u9648\\u7f8e\\u9f84\\u80b2\\u513f\\u968f\\u7b14\\u6559\\u80b2\\u7406\\u5ff5\\u4e00\\u4f4d\\u5988\\u5988\\u5982\\u4f55\\u6210\\u529f\\u4f7f3\\u540d\\u513f\\u5b50\\u5347\\u8bfb\\u65af\\u5766\\u798f\\u65b0\\u534e\\u6587\\u8f69\\u6b63\\u7248\",\"store_info\":\"\\u6b63\\u724850\\u4e2a\\u6559\\u80b2\\u6cd5\\u6211\\u628a\\u4e09\\u4e2a\\u513f\\u5b50\\u9001\\u5165\\u4e86\\u65af\\u5766\\u798f\\u9648\\u7f8e\\u9f84\\u80b2\\u513f\\u968f\\u7b14\\u6559\\u80b2\\u7406\\u5ff5\\u4e00\\u4f4d\\u5988\\u5988\\u5982\\u4f55\\u6210\\u529f\\u4f7f3\\u540d\\u513f\\u5b50\\u5347\\u8bfb\\u65af\\u5766\\u798f\\u65b0\\u534e\\u6587\\u8f69\\u6b63\\u7248\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"52.00\"},\"truePrice\":55,\"vip_truePrice\":0,\"trueStock\":5555,\"costPrice\":\"52.00\"}', '84d9ee44e457ddef7f2c4f25dc8fa865');
INSERT INTO `eb_store_order_cart_info` VALUES (10, 20, 32, '{\"id\":20,\"uid\":18,\"type\":\"product\",\"product_id\":32,\"product_attr_unique\":\"\",\"cart_num\":10,\"add_time\":1570607404,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":32,\"image\":\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/08\\/\\/03a681fe37eb94240a63f1424dc74ae2.jpg\",\"slider_image\":[\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/08\\/\\/03a681fe37eb94240a63f1424dc74ae2.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/08\\/\\/8f8892b30fd0321ce68479c9657ffe3b.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/08\\/\\/81640c14a036f7d13b3595ce4f039ead.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/08\\/\\/5e9b34c96015573589729ab978342fb6.jpg\"],\"price\":\"30.00\",\"ot_price\":\"35.00\",\"vip_price\":\"0.00\",\"postage\":\"0.00\",\"mer_id\":0,\"give_integral\":\"250.00\",\"cate_id\":\"4\",\"sales\":0,\"stock\":16777215,\"store_name\":\"\\u6bcf100\\u51cf50\\u3010\\u5f53\\u5f53\\u7f51\\u6b63\\u7248\\u4e66\\u7c4d\\u3011\\u4f60\\u7684\\u5584\\u826f\\u5fc5\\u987b\\u6709\\u70b9\\u950b\\u8292\\u751f\\u6d3b\\u4e0d\\u662f\\u7528\\u6765\\u59a5\\u534f\\u7684\\u660e\\u767d\\u8bf7\\u8d81\\u65e9\\u9752\\u6625\\u52b1\\u5fd7\\u6563\\u6587\\u5168\\u96c6\",\"store_info\":\"\\u3010\\u5f53\\u5f53\\u7f51\\u6b63\\u7248\\u4e66\\u7c4d\\u3011\\u4f60\\u7684\\u5584\\u826f\\u5fc5\\u987b\\u6709\\u70b9\\u950b\\u8292\\u751f\\u6d3b\\u4e0d\\u662f\\u7528\\u6765\\u59a5\\u534f\\u7684\\u660e\\u767d\\u8bf7\\u8d81\\u65e9\\u9752\\u6625\\u52b1\\u5fd7\\u6563\\u6587\\u5168\\u96c6\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"20.00\"},\"truePrice\":30,\"vip_truePrice\":0,\"trueStock\":16777215,\"costPrice\":\"20.00\"}', 'd7a84628c025d30f7b2c52c958767e76');
INSERT INTO `eb_store_order_cart_info` VALUES (11, 21, 33, '{\"id\":21,\"uid\":18,\"type\":\"product\",\"product_id\":33,\"product_attr_unique\":\"\",\"cart_num\":5,\"add_time\":1570950662,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":33,\"image\":\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/09\\/\\/948c07374bed8b23ba394a4fa94c23bc.jpg\",\"slider_image\":[\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/09\\/\\/948c07374bed8b23ba394a4fa94c23bc.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/09\\/\\/74bc0ccf930357503d42d9b25a78cc4b.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/09\\/\\/7fdb6c114b141579ae3e34468b31287a.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/09\\/\\/292cc7a4b831a9ca96fe6bcb1eb0febf.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/09\\/\\/c8beaef631e3407501915c8892ecde08.jpg\"],\"price\":\"25.00\",\"ot_price\":\"52.00\",\"vip_price\":\"0.00\",\"postage\":\"0.00\",\"mer_id\":0,\"give_integral\":\"200.00\",\"cate_id\":\"1\",\"sales\":0,\"stock\":2545424,\"store_name\":\"\\u6b63\\u7248\\u5168\\u59573\\u518c\\u4e0d\\u7231\\u6211,\\u522b\\u4f24\\u62113+2+1\\u5957\\u88c5\\u9738\\u9053\\u603b\\u88c1\\u7231\\u60c5\\u5c0f\\u8bf4\\u7545\\u9500\\u4e66\\u7c4d\\u8a00\\u60c5\\u5c0f\\u4e66\\u73b0\\u4ee3\\u90fd\\u5e02\\u60c5\\u611f\\u5c0f\\u8bf4\\u8650\\u5fc3\\u9752\\u6625\\u6587\\u5b66\\u5c0f\\u8bf4\\u8c6a\\u95e8\\u7545\\u9500\",\"store_info\":\"\\u6b63\\u7248\\u5168\\u59573\\u518c\\u4e0d\\u7231\\u6211,\\u522b\\u4f24\\u62113+2+1\\u5957\\u88c5\\u9738\\u9053\\u603b\\u88c1\\u7231\\u60c5\\u5c0f\\u8bf4\\u7545\\u9500\\u4e66\\u7c4d\\u8a00\\u60c5\\u5c0f\\u4e66\\u73b0\\u4ee3\\u90fd\\u5e02\\u60c5\\u611f\\u5c0f\\u8bf4\\u8650\\u5fc3\\u9752\\u6625\\u6587\\u5b66\\u5c0f\\u8bf4\\u8c6a\\u95e8\\u7545\\u9500\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"15.00\"},\"truePrice\":25,\"vip_truePrice\":0,\"trueStock\":2545424,\"costPrice\":\"15.00\"}', '1a0a283bfe7c549dee6c638a05200e32');
INSERT INTO `eb_store_order_cart_info` VALUES (12, 22, 32, '{\"id\":22,\"uid\":18,\"type\":\"product\",\"product_id\":32,\"product_attr_unique\":\"\",\"cart_num\":10,\"add_time\":1570979510,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":32,\"image\":\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/08\\/\\/03a681fe37eb94240a63f1424dc74ae2.jpg\",\"slider_image\":[\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/08\\/\\/03a681fe37eb94240a63f1424dc74ae2.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/08\\/\\/8f8892b30fd0321ce68479c9657ffe3b.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/08\\/\\/81640c14a036f7d13b3595ce4f039ead.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/08\\/\\/5e9b34c96015573589729ab978342fb6.jpg\"],\"price\":\"30.00\",\"ot_price\":\"35.00\",\"vip_price\":\"0.00\",\"postage\":\"0.00\",\"mer_id\":0,\"give_integral\":\"250.00\",\"cate_id\":\"4\",\"sales\":0,\"stock\":16777215,\"store_name\":\"\\u6bcf100\\u51cf50\\u3010\\u5f53\\u5f53\\u7f51\\u6b63\\u7248\\u4e66\\u7c4d\\u3011\\u4f60\\u7684\\u5584\\u826f\\u5fc5\\u987b\\u6709\\u70b9\\u950b\\u8292\\u751f\\u6d3b\\u4e0d\\u662f\\u7528\\u6765\\u59a5\\u534f\\u7684\\u660e\\u767d\\u8bf7\\u8d81\\u65e9\\u9752\\u6625\\u52b1\\u5fd7\\u6563\\u6587\\u5168\\u96c6\",\"store_info\":\"\\u3010\\u5f53\\u5f53\\u7f51\\u6b63\\u7248\\u4e66\\u7c4d\\u3011\\u4f60\\u7684\\u5584\\u826f\\u5fc5\\u987b\\u6709\\u70b9\\u950b\\u8292\\u751f\\u6d3b\\u4e0d\\u662f\\u7528\\u6765\\u59a5\\u534f\\u7684\\u660e\\u767d\\u8bf7\\u8d81\\u65e9\\u9752\\u6625\\u52b1\\u5fd7\\u6563\\u6587\\u5168\\u96c6\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"20.00\"},\"truePrice\":30,\"vip_truePrice\":0,\"trueStock\":16777215,\"costPrice\":\"20.00\"}', '05a70454516ecd9194c293b0e415777f');
INSERT INTO `eb_store_order_cart_info` VALUES (13, 23, 31, '{\"id\":23,\"uid\":18,\"type\":\"product\",\"product_id\":31,\"product_attr_unique\":\"\",\"cart_num\":10,\"add_time\":1570979663,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":31,\"image\":\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/d6dacfbabf8695a2c7d2f821f2e3e87a.jpg\",\"slider_image\":[\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/d6dacfbabf8695a2c7d2f821f2e3e87a.jpg\"],\"price\":\"55.00\",\"ot_price\":\"50.00\",\"vip_price\":\"0.00\",\"postage\":\"0.00\",\"mer_id\":0,\"give_integral\":\"112.00\",\"cate_id\":\"4\",\"sales\":0,\"stock\":5555,\"store_name\":\"\\u6b63\\u724850\\u4e2a\\u6559\\u80b2\\u6cd5\\u6211\\u628a\\u4e09\\u4e2a\\u513f\\u5b50\\u9001\\u5165\\u4e86\\u65af\\u5766\\u798f\\u9648\\u7f8e\\u9f84\\u80b2\\u513f\\u968f\\u7b14\\u6559\\u80b2\\u7406\\u5ff5\\u4e00\\u4f4d\\u5988\\u5988\\u5982\\u4f55\\u6210\\u529f\\u4f7f3\\u540d\\u513f\\u5b50\\u5347\\u8bfb\\u65af\\u5766\\u798f\\u65b0\\u534e\\u6587\\u8f69\\u6b63\\u7248\",\"store_info\":\"\\u6b63\\u724850\\u4e2a\\u6559\\u80b2\\u6cd5\\u6211\\u628a\\u4e09\\u4e2a\\u513f\\u5b50\\u9001\\u5165\\u4e86\\u65af\\u5766\\u798f\\u9648\\u7f8e\\u9f84\\u80b2\\u513f\\u968f\\u7b14\\u6559\\u80b2\\u7406\\u5ff5\\u4e00\\u4f4d\\u5988\\u5988\\u5982\\u4f55\\u6210\\u529f\\u4f7f3\\u540d\\u513f\\u5b50\\u5347\\u8bfb\\u65af\\u5766\\u798f\\u65b0\\u534e\\u6587\\u8f69\\u6b63\\u7248\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"52.00\"},\"truePrice\":55,\"vip_truePrice\":0,\"trueStock\":5555,\"costPrice\":\"52.00\"}', 'f3ac63c91272f19ce97c7397825cc15f');
INSERT INTO `eb_store_order_cart_info` VALUES (14, 24, 31, '{\"id\":24,\"uid\":18,\"type\":\"product\",\"product_id\":31,\"product_attr_unique\":\"\",\"cart_num\":10,\"add_time\":1570979681,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":31,\"image\":\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/d6dacfbabf8695a2c7d2f821f2e3e87a.jpg\",\"slider_image\":[\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/d6dacfbabf8695a2c7d2f821f2e3e87a.jpg\"],\"price\":\"55.00\",\"ot_price\":\"50.00\",\"vip_price\":\"0.00\",\"postage\":\"0.00\",\"mer_id\":0,\"give_integral\":\"112.00\",\"cate_id\":\"4\",\"sales\":10,\"stock\":5545,\"store_name\":\"\\u6b63\\u724850\\u4e2a\\u6559\\u80b2\\u6cd5\\u6211\\u628a\\u4e09\\u4e2a\\u513f\\u5b50\\u9001\\u5165\\u4e86\\u65af\\u5766\\u798f\\u9648\\u7f8e\\u9f84\\u80b2\\u513f\\u968f\\u7b14\\u6559\\u80b2\\u7406\\u5ff5\\u4e00\\u4f4d\\u5988\\u5988\\u5982\\u4f55\\u6210\\u529f\\u4f7f3\\u540d\\u513f\\u5b50\\u5347\\u8bfb\\u65af\\u5766\\u798f\\u65b0\\u534e\\u6587\\u8f69\\u6b63\\u7248\",\"store_info\":\"\\u6b63\\u724850\\u4e2a\\u6559\\u80b2\\u6cd5\\u6211\\u628a\\u4e09\\u4e2a\\u513f\\u5b50\\u9001\\u5165\\u4e86\\u65af\\u5766\\u798f\\u9648\\u7f8e\\u9f84\\u80b2\\u513f\\u968f\\u7b14\\u6559\\u80b2\\u7406\\u5ff5\\u4e00\\u4f4d\\u5988\\u5988\\u5982\\u4f55\\u6210\\u529f\\u4f7f3\\u540d\\u513f\\u5b50\\u5347\\u8bfb\\u65af\\u5766\\u798f\\u65b0\\u534e\\u6587\\u8f69\\u6b63\\u7248\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"52.00\"},\"truePrice\":55,\"vip_truePrice\":0,\"trueStock\":5545,\"costPrice\":\"52.00\"}', 'cb2c2041d9763d84d7d655e81178f444');
INSERT INTO `eb_store_order_cart_info` VALUES (15, 26, 33, '{\"id\":26,\"uid\":18,\"type\":\"product\",\"product_id\":33,\"product_attr_unique\":\"\",\"cart_num\":1,\"add_time\":1571024515,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":33,\"image\":\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/09\\/\\/948c07374bed8b23ba394a4fa94c23bc.jpg\",\"slider_image\":[\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/09\\/\\/948c07374bed8b23ba394a4fa94c23bc.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/09\\/\\/74bc0ccf930357503d42d9b25a78cc4b.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/09\\/\\/7fdb6c114b141579ae3e34468b31287a.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/09\\/\\/292cc7a4b831a9ca96fe6bcb1eb0febf.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/09\\/\\/c8beaef631e3407501915c8892ecde08.jpg\"],\"price\":\"25.00\",\"ot_price\":\"52.00\",\"vip_price\":\"0.00\",\"postage\":\"0.00\",\"mer_id\":0,\"give_integral\":\"200.00\",\"cate_id\":\"1\",\"sales\":5,\"stock\":2545419,\"store_name\":\"\\u6b63\\u7248\\u5168\\u59573\\u518c\\u4e0d\\u7231\\u6211,\\u522b\\u4f24\\u62113+2+1\\u5957\\u88c5\\u9738\\u9053\\u603b\\u88c1\\u7231\\u60c5\\u5c0f\\u8bf4\\u7545\\u9500\\u4e66\\u7c4d\\u8a00\\u60c5\\u5c0f\\u4e66\\u73b0\\u4ee3\\u90fd\\u5e02\\u60c5\\u611f\\u5c0f\\u8bf4\\u8650\\u5fc3\\u9752\\u6625\\u6587\\u5b66\\u5c0f\\u8bf4\\u8c6a\\u95e8\\u7545\\u9500\",\"store_info\":\"\\u6b63\\u7248\\u5168\\u59573\\u518c\\u4e0d\\u7231\\u6211,\\u522b\\u4f24\\u62113+2+1\\u5957\\u88c5\\u9738\\u9053\\u603b\\u88c1\\u7231\\u60c5\\u5c0f\\u8bf4\\u7545\\u9500\\u4e66\\u7c4d\\u8a00\\u60c5\\u5c0f\\u4e66\\u73b0\\u4ee3\\u90fd\\u5e02\\u60c5\\u611f\\u5c0f\\u8bf4\\u8650\\u5fc3\\u9752\\u6625\\u6587\\u5b66\\u5c0f\\u8bf4\\u8c6a\\u95e8\\u7545\\u9500\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"15.00\"},\"truePrice\":25,\"vip_truePrice\":0,\"trueStock\":2545419,\"costPrice\":\"15.00\"}', 'c4f796afbc6267501964b46427b3f6ba');
INSERT INTO `eb_store_order_cart_info` VALUES (16, 25, 32, '{\"id\":25,\"uid\":18,\"type\":\"product\",\"product_id\":32,\"product_attr_unique\":\"\",\"cart_num\":1,\"add_time\":1571033437,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":32,\"image\":\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/08\\/\\/03a681fe37eb94240a63f1424dc74ae2.jpg\",\"slider_image\":[\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/08\\/\\/03a681fe37eb94240a63f1424dc74ae2.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/08\\/\\/8f8892b30fd0321ce68479c9657ffe3b.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/08\\/\\/81640c14a036f7d13b3595ce4f039ead.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/08\\/\\/5e9b34c96015573589729ab978342fb6.jpg\"],\"price\":\"30.00\",\"ot_price\":\"35.00\",\"vip_price\":\"0.00\",\"postage\":\"0.00\",\"mer_id\":0,\"give_integral\":\"250.00\",\"cate_id\":\"4\",\"sales\":10,\"stock\":16777205,\"store_name\":\"\\u6bcf100\\u51cf50\\u3010\\u5f53\\u5f53\\u7f51\\u6b63\\u7248\\u4e66\\u7c4d\\u3011\\u4f60\\u7684\\u5584\\u826f\\u5fc5\\u987b\\u6709\\u70b9\\u950b\\u8292\\u751f\\u6d3b\\u4e0d\\u662f\\u7528\\u6765\\u59a5\\u534f\\u7684\\u660e\\u767d\\u8bf7\\u8d81\\u65e9\\u9752\\u6625\\u52b1\\u5fd7\\u6563\\u6587\\u5168\\u96c6\",\"store_info\":\"\\u3010\\u5f53\\u5f53\\u7f51\\u6b63\\u7248\\u4e66\\u7c4d\\u3011\\u4f60\\u7684\\u5584\\u826f\\u5fc5\\u987b\\u6709\\u70b9\\u950b\\u8292\\u751f\\u6d3b\\u4e0d\\u662f\\u7528\\u6765\\u59a5\\u534f\\u7684\\u660e\\u767d\\u8bf7\\u8d81\\u65e9\\u9752\\u6625\\u52b1\\u5fd7\\u6563\\u6587\\u5168\\u96c6\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"20.00\"},\"truePrice\":30,\"vip_truePrice\":0,\"trueStock\":16777205,\"costPrice\":\"20.00\"}', '8d09e4b85c783cbc30c9b8ae175f2d33');
INSERT INTO `eb_store_order_cart_info` VALUES (17, 15, 21, '{\"id\":15,\"uid\":18,\"type\":\"product\",\"product_id\":21,\"product_attr_unique\":\"\",\"cart_num\":1,\"add_time\":1571044727,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":21,\"image\":\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/04\\/\\/86dd69a53226b09212e20d52ff81711a.jpg\",\"slider_image\":[\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/04\\/\\/86dd69a53226b09212e20d52ff81711a.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/04\\/\\/0de58398548d64a3f43f333d271a2d92.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/04\\/\\/a36b9208ce67f74a8ad4d767fd8ec4f7.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/04\\/\\/d516de444e9a20fb7728aa9c4adb4df8.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/04\\/\\/7520a58ff5272bd33637379da3e3bb27.jpg\"],\"price\":\"20.00\",\"ot_price\":\"22.00\",\"vip_price\":\"0.00\",\"postage\":\"220.00\",\"mer_id\":0,\"give_integral\":\"222.00\",\"cate_id\":\"29\",\"sales\":0,\"stock\":2222,\"store_name\":\"\\u56fd\\u9645\\u5927\\u5956\\u5c0f\\u8bf4\\u6ce8\\u97f3\\u724810\\u518c\\u5c0f\\u5b66\\u751f\\u4e00\\u4e8c\\u4e09\\u5e74\\u7ea7\\u8bfe\\u5916\\u4e66\\u9605\\u8bfb\\u4e8b\\u56fe\\u4e66\\u7c4d\",\"store_info\":\"\\u56fd\\u9645\\u5927\\u5956\\u5c0f\\u8bf4\\u6ce8\\u97f3\\u724810\\u518c\\u5c0f\\u5b66\\u751f\\u4e00\\u4e8c\\u4e09\\u5e74\\u7ea7\\u8bfe\\u5916\\u4e66\\u9605\\u8bfb\\u5fc5\\u8bfb\\u5e26\\u62fc\\u97f3\\u513f\\u7ae5\\u6545\\u4e8b\\u4e66\\u7c4d671012\\u5468\\u5c81\\u5c0f\\u5b66\\u751f\\u8bfe\\u5916\\u513f\\u7ae5\\u6587\\u5b66\\u8bfb\\u7269\\u7ae5\\u8bdd\\u6545\\u4e8b\\u56fe\\u4e66\\u7c4d\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"222.00\"},\"truePrice\":20,\"vip_truePrice\":0,\"trueStock\":2222,\"costPrice\":\"222.00\"}', '81c8727c62e800be708dbf37c4695dff');
INSERT INTO `eb_store_order_cart_info` VALUES (18, 27, 17, '{\"id\":27,\"uid\":18,\"type\":\"product\",\"product_id\":17,\"product_attr_unique\":\"\",\"cart_num\":1,\"add_time\":1571044754,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":17,\"image\":\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/22\\/\\/e43b98f2d37effee55ba4307560f3c7f.jpg\",\"slider_image\":[\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/22\\/\\/e43b98f2d37effee55ba4307560f3c7f.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/22\\/\\/b1798ed2d6b5b9c75bf7fa11703a3201.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/22\\/\\/52bfe48235afd1b0a881c35714542aa1.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/22\\/\\/6fc0efdc9a7582d3552279f375a9428d.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/22\\/\\/0fc890ce7262d25f5ab51c30c48abb16.jpg\"],\"price\":\"552.00\",\"ot_price\":\"55.00\",\"vip_price\":\"0.00\",\"postage\":\"55.00\",\"mer_id\":0,\"give_integral\":\"55.00\",\"cate_id\":\"25\",\"sales\":0,\"stock\":5555,\"store_name\":\"\\u5e73\\u51e1\\u7684\\u4e16\\u754c+\\u4eba\\u95f4\\u5931\\u683c \\u5168\\u4e09\\u518c\\u7cbe\\u88c5 \\u8def\\u9065\\u539f\\u8457\\u5168\\u5957\\u5168\\u96c6\\u4e2d\\u56fd\\u5f53\\u4ee3\\u6539\",\"store_info\":\"\\u5e73\\u51e1\\u7684\\u4e16\\u754c+\\u4eba\\u95f4\\u5931\\u683c \\u5168\\u4e09\\u518c\\u7cbe\\u88c5 \\u8def\\u9065\\u539f\\u8457\\u5168\\u5957\\u5168\\u96c6\\u4e2d\\u56fd\\u5f53\\u4ee3\\u5c0f\\u8bf4\\u8bfb\\u7269 \\u8305\\u76fe\\u6587\\u5b66\\u5956\\u7ecf\\u5178\\u6587\\u5b66\\u5c0f\\u8bf4\\u4e66\\u7c4d\\u7545\\u9500\\u5c0f\\u8bf4\\u516b\\u5e74\\u7ea7\\u63a8\\u8350\\u8bfb\\u7269\\u6b63\\u7248\\u5305\\u90ae\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"55.00\"},\"truePrice\":552,\"vip_truePrice\":0,\"trueStock\":5555,\"costPrice\":\"55.00\"}', 'ad47a008a2f806aa6eb1b53852cd8b37');
INSERT INTO `eb_store_order_cart_info` VALUES (19, 28, 31, '{\"id\":28,\"uid\":18,\"type\":\"product\",\"product_id\":31,\"product_attr_unique\":\"\",\"cart_num\":10,\"add_time\":1571044871,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":31,\"image\":\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/d6dacfbabf8695a2c7d2f821f2e3e87a.jpg\",\"slider_image\":[\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/d6dacfbabf8695a2c7d2f821f2e3e87a.jpg\"],\"price\":\"55.00\",\"ot_price\":\"50.00\",\"vip_price\":\"0.00\",\"postage\":\"0.00\",\"mer_id\":0,\"give_integral\":\"112.00\",\"cate_id\":\"4\",\"sales\":20,\"stock\":5535,\"store_name\":\"\\u6b63\\u724850\\u4e2a\\u6559\\u80b2\\u6cd5\\u6211\\u628a\\u4e09\\u4e2a\\u513f\\u5b50\\u9001\\u5165\\u4e86\\u65af\\u5766\\u798f\\u9648\\u7f8e\\u9f84\\u80b2\\u513f\\u968f\\u7b14\\u6559\\u80b2\\u7406\\u5ff5\\u4e00\\u4f4d\\u5988\\u5988\\u5982\\u4f55\\u6210\\u529f\\u4f7f3\\u540d\\u513f\\u5b50\\u5347\\u8bfb\\u65af\\u5766\\u798f\\u65b0\\u534e\\u6587\\u8f69\\u6b63\\u7248\",\"store_info\":\"\\u6b63\\u724850\\u4e2a\\u6559\\u80b2\\u6cd5\\u6211\\u628a\\u4e09\\u4e2a\\u513f\\u5b50\\u9001\\u5165\\u4e86\\u65af\\u5766\\u798f\\u9648\\u7f8e\\u9f84\\u80b2\\u513f\\u968f\\u7b14\\u6559\\u80b2\\u7406\\u5ff5\\u4e00\\u4f4d\\u5988\\u5988\\u5982\\u4f55\\u6210\\u529f\\u4f7f3\\u540d\\u513f\\u5b50\\u5347\\u8bfb\\u65af\\u5766\\u798f\\u65b0\\u534e\\u6587\\u8f69\\u6b63\\u7248\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"52.00\"},\"truePrice\":55,\"vip_truePrice\":0,\"trueStock\":5535,\"costPrice\":\"52.00\"}', '28acfe2da49d2b9a7f177458256f2540');
INSERT INTO `eb_store_order_cart_info` VALUES (20, 29, 30, '{\"id\":29,\"uid\":18,\"type\":\"product\",\"product_id\":30,\"product_attr_unique\":\"\",\"cart_num\":1,\"add_time\":1571045975,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":30,\"image\":\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/cb6dc012404524aaa47a47766c59f2e0.jpg\",\"slider_image\":[\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/cb6dc012404524aaa47a47766c59f2e0.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/0e5d897f56384df3cb8b94d4aee94bfc.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/fe4bfe9f98c015001c1bbf74ee26c41a.jpg\"],\"price\":\"544.00\",\"ot_price\":\"554.00\",\"vip_price\":\"0.00\",\"postage\":\"5.00\",\"mer_id\":0,\"give_integral\":\"5300.00\",\"cate_id\":\"4\",\"sales\":0,\"stock\":55222,\"store_name\":\"\\u3010\\u65b0\\u534e\\u4e66\\u5e97\\u3011\\u6446\\u6e21\\u4eba\\u514b\\u83b1\\u513f\\u9ea6\\u514b\\u798f\\u5c14\\u8457\\u4e66\\u6b63\\u7248\\u5305\\u90ae\\u4e66\\u7c4d\\u4e0e\\u8ffd\\u98ce\\u7b5d\\u7684\\u4eba\\u5077\\u5f71\\u5b50\\u7684\\u4eba6\\u518c3\\u518c2\\u540c\\u4e3a\\u5916\\u56fd\\u6587\\u5b66\\u5fc3\\u7075\\u6cbb\\u6108\\u7cfb\\u5c0f\\u8bf4\\u8bfb\\u7269\\u52b1\\u5fd7\\u4e1b\\u4e66\",\"store_info\":\"\\u3010\\u65b0\\u534e\\u4e66\\u5e97\\u3011\\u6446\\u6e21\\u4eba\\u514b\\u83b1\\u513f\\u9ea6\\u514b\\u798f\\u5c14\\u8457\\u4e66\\u6b63\\u7248\\u5305\\u90ae\\u4e66\\u7c4d\\u4e0e\\u8ffd\\u98ce\\u7b5d\\u7684\\u4eba\\u5077\\u5f71\\u5b50\\u7684\\u4eba6\\u518c3\\u518c2\\u540c\\u4e3a\\u5916\\u56fd\\u6587\\u5b66\\u5fc3\\u7075\\u6cbb\\u6108\\u7cfb\\u5c0f\\u8bf4\\u8bfb\\u7269\\u52b1\\u5fd7\\u4e1b\\u4e66\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"511.00\"},\"truePrice\":544,\"vip_truePrice\":0,\"trueStock\":55222,\"costPrice\":\"511.00\"}', '465636eb4a7ff4b267f3b765d07a02da');
INSERT INTO `eb_store_order_cart_info` VALUES (21, 30, 31, '{\"id\":30,\"uid\":18,\"type\":\"product\",\"product_id\":31,\"product_attr_unique\":\"\",\"cart_num\":1,\"add_time\":1571046693,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":31,\"image\":\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/d6dacfbabf8695a2c7d2f821f2e3e87a.jpg\",\"slider_image\":[\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/d6dacfbabf8695a2c7d2f821f2e3e87a.jpg\"],\"price\":\"55.00\",\"ot_price\":\"50.00\",\"vip_price\":\"0.00\",\"postage\":\"0.00\",\"mer_id\":0,\"give_integral\":\"112.00\",\"cate_id\":\"4\",\"sales\":30,\"stock\":5525,\"store_name\":\"\\u6b63\\u724850\\u4e2a\\u6559\\u80b2\\u6cd5\\u6211\\u628a\\u4e09\\u4e2a\\u513f\\u5b50\\u9001\\u5165\\u4e86\\u65af\\u5766\\u798f\\u9648\\u7f8e\\u9f84\\u80b2\\u513f\\u968f\\u7b14\\u6559\\u80b2\\u7406\\u5ff5\\u4e00\\u4f4d\\u5988\\u5988\\u5982\\u4f55\\u6210\\u529f\\u4f7f3\\u540d\\u513f\\u5b50\\u5347\\u8bfb\\u65af\\u5766\\u798f\\u65b0\\u534e\\u6587\\u8f69\\u6b63\\u7248\",\"store_info\":\"\\u6b63\\u724850\\u4e2a\\u6559\\u80b2\\u6cd5\\u6211\\u628a\\u4e09\\u4e2a\\u513f\\u5b50\\u9001\\u5165\\u4e86\\u65af\\u5766\\u798f\\u9648\\u7f8e\\u9f84\\u80b2\\u513f\\u968f\\u7b14\\u6559\\u80b2\\u7406\\u5ff5\\u4e00\\u4f4d\\u5988\\u5988\\u5982\\u4f55\\u6210\\u529f\\u4f7f3\\u540d\\u513f\\u5b50\\u5347\\u8bfb\\u65af\\u5766\\u798f\\u65b0\\u534e\\u6587\\u8f69\\u6b63\\u7248\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"52.00\"},\"truePrice\":55,\"vip_truePrice\":0,\"trueStock\":5525,\"costPrice\":\"52.00\"}', '9cb9ed4f35cf7c2f295cc2bc6f732a84');
INSERT INTO `eb_store_order_cart_info` VALUES (22, 6, 25, '{\"id\":6,\"uid\":18,\"type\":\"product\",\"product_id\":25,\"product_attr_unique\":\"\",\"cart_num\":1,\"add_time\":1571047104,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":25,\"image\":\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/a2ae37e4daef07befbe8df919f3c217c.jpg\",\"slider_image\":[\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/a2ae37e4daef07befbe8df919f3c217c.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/a5d5bf6c990ebef421b172ab230f73bd.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/82cafe59ba68959e94362ffce6c8f263.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/38eff756f31c42d711ddc90f44183ea3.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/67d853a4f756b8d21e5b2fd4edff98e5.jpg\"],\"price\":\"50.00\",\"ot_price\":\"50.00\",\"vip_price\":\"0.00\",\"postage\":\"5.00\",\"mer_id\":0,\"give_integral\":\"50.00\",\"cate_id\":\"4\",\"sales\":0,\"stock\":5000,\"store_name\":\"\\u7a97\\u8fb9\\u7684\\u5c0f\\u8c46\\u8c46\\u6b63\\u7248\\u4e66\\u9ed1\\u67f3\\u5f7b\\u5b50\\u4e2d\\u5c0f\\u5b66\\u751f\\u4e00\\u4e8c\\u4e09\\u56db\\u4e94\\u516d\\u5e74\\u7ea7\\u5c81\\u975e\\u6ce8\\u97f3\\u7248\\u513f\\u7ae5\\u6587\\u5b66\\u6545\\u4e8b\\u8bfb\\u7269\\u7545\\u9500\",\"store_info\":\"\\u7a97\\u8fb9\\u7684\\u5c0f\\u8c46\\u8c46\\u6b63\\u7248\\u4e66\\u9ed1\\u67f3\\u5f7b\\u5b50\\u4e2d\\u5c0f\\u5b66\\u751f\\u4e00\\u4e8c\\u4e09\\u56db\\u4e94\\u516d\\u5e74\\u7ea7\\u8bfe\\u5916\\u9605\\u8bfb\\u4e66\\u7c4d\\u5c11\\u513f67891012\\u5c81\\u975e\\u6ce8\\u97f3\\u7248\\u513f\\u7ae5\\u6587\\u5b66\\u6545\\u4e8b\\u8bfb\\u7269\\u7545\\u9500\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"11.00\"},\"truePrice\":50,\"vip_truePrice\":0,\"trueStock\":5000,\"costPrice\":\"11.00\"}', '3871bd64012152bfb53fdf04b401193f');
INSERT INTO `eb_store_order_cart_info` VALUES (23, 31, 31, '{\"id\":31,\"uid\":18,\"type\":\"product\",\"product_id\":31,\"product_attr_unique\":\"\",\"cart_num\":1,\"add_time\":1571047995,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":31,\"image\":\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/d6dacfbabf8695a2c7d2f821f2e3e87a.jpg\",\"slider_image\":[\"http:\\/\\/www.tp5crm.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/07\\/\\/d6dacfbabf8695a2c7d2f821f2e3e87a.jpg\"],\"price\":\"55.00\",\"ot_price\":\"50.00\",\"vip_price\":\"0.00\",\"postage\":\"0.00\",\"mer_id\":0,\"give_integral\":\"112.00\",\"cate_id\":\"4\",\"sales\":31,\"stock\":5524,\"store_name\":\"\\u6b63\\u724850\\u4e2a\\u6559\\u80b2\\u6cd5\\u6211\\u628a\\u4e09\\u4e2a\\u513f\\u5b50\\u9001\\u5165\\u4e86\\u65af\\u5766\\u798f\\u9648\\u7f8e\\u9f84\\u80b2\\u513f\\u968f\\u7b14\\u6559\\u80b2\\u7406\\u5ff5\\u4e00\\u4f4d\\u5988\\u5988\\u5982\\u4f55\\u6210\\u529f\\u4f7f3\\u540d\\u513f\\u5b50\\u5347\\u8bfb\\u65af\\u5766\\u798f\\u65b0\\u534e\\u6587\\u8f69\\u6b63\\u7248\",\"store_info\":\"\\u6b63\\u724850\\u4e2a\\u6559\\u80b2\\u6cd5\\u6211\\u628a\\u4e09\\u4e2a\\u513f\\u5b50\\u9001\\u5165\\u4e86\\u65af\\u5766\\u798f\\u9648\\u7f8e\\u9f84\\u80b2\\u513f\\u968f\\u7b14\\u6559\\u80b2\\u7406\\u5ff5\\u4e00\\u4f4d\\u5988\\u5988\\u5982\\u4f55\\u6210\\u529f\\u4f7f3\\u540d\\u513f\\u5b50\\u5347\\u8bfb\\u65af\\u5766\\u798f\\u65b0\\u534e\\u6587\\u8f69\\u6b63\\u7248\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"52.00\"},\"truePrice\":55,\"vip_truePrice\":0,\"trueStock\":5524,\"costPrice\":\"52.00\"}', '2e0aca891f2a8aedf265edf533a6d9a8');
INSERT INTO `eb_store_order_cart_info` VALUES (24, 32, 25, '{\"id\":32,\"uid\":18,\"type\":\"product\",\"product_id\":25,\"product_attr_unique\":\"\",\"cart_num\":1,\"add_time\":1572402485,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":25,\"image\":\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/a2ae37e4daef07befbe8df919f3c217c.jpg\",\"slider_image\":[\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/a2ae37e4daef07befbe8df919f3c217c.jpg\",\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/a5d5bf6c990ebef421b172ab230f73bd.jpg\",\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/82cafe59ba68959e94362ffce6c8f263.jpg\",\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/38eff756f31c42d711ddc90f44183ea3.jpg\",\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/67d853a4f756b8d21e5b2fd4edff98e5.jpg\"],\"price\":\"50.00\",\"ot_price\":\"50.00\",\"vip_price\":\"0.00\",\"postage\":\"5.00\",\"mer_id\":0,\"give_integral\":\"50.00\",\"cate_id\":\"4\",\"sales\":0,\"stock\":5000,\"store_name\":\"\\u7a97\\u8fb9\\u7684\\u5c0f\\u8c46\\u8c46\\u6b63\\u7248\\u4e66\\u9ed1\\u67f3\\u5f7b\\u5b50\\u4e2d\\u5c0f\\u5b66\\u751f\\u4e00\\u4e8c\\u4e09\\u56db\\u4e94\\u516d\\u5e74\\u7ea7\\u5c81\\u975e\\u6ce8\\u97f3\\u7248\\u513f\\u7ae5\\u6587\\u5b66\\u6545\\u4e8b\\u8bfb\\u7269\\u7545\\u9500\",\"store_info\":\"\\u7a97\\u8fb9\\u7684\\u5c0f\\u8c46\\u8c46\\u6b63\\u7248\\u4e66\\u9ed1\\u67f3\\u5f7b\\u5b50\\u4e2d\\u5c0f\\u5b66\\u751f\\u4e00\\u4e8c\\u4e09\\u56db\\u4e94\\u516d\\u5e74\\u7ea7\\u8bfe\\u5916\\u9605\\u8bfb\\u4e66\\u7c4d\\u5c11\\u513f67891012\\u5c81\\u975e\\u6ce8\\u97f3\\u7248\\u513f\\u7ae5\\u6587\\u5b66\\u6545\\u4e8b\\u8bfb\\u7269\\u7545\\u9500\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"11.00\"},\"truePrice\":50,\"vip_truePrice\":0,\"trueStock\":5000,\"costPrice\":\"11.00\"}', '0d352b4d3a317e3eae221199fdb49651');
INSERT INTO `eb_store_order_cart_info` VALUES (25, 33, 17, '{\"id\":33,\"uid\":18,\"type\":\"product\",\"product_id\":17,\"product_attr_unique\":\"\",\"cart_num\":1,\"add_time\":1572402871,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":17,\"image\":\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/22\\/\\/e43b98f2d37effee55ba4307560f3c7f.jpg\",\"slider_image\":[\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/22\\/\\/e43b98f2d37effee55ba4307560f3c7f.jpg\",\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/22\\/\\/b1798ed2d6b5b9c75bf7fa11703a3201.jpg\",\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/22\\/\\/52bfe48235afd1b0a881c35714542aa1.jpg\",\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/22\\/\\/6fc0efdc9a7582d3552279f375a9428d.jpg\",\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/22\\/\\/0fc890ce7262d25f5ab51c30c48abb16.jpg\"],\"price\":\"552.00\",\"ot_price\":\"680.00\",\"vip_price\":\"0.00\",\"postage\":\"55.00\",\"mer_id\":0,\"give_integral\":\"55.00\",\"cate_id\":\"25\",\"sales\":0,\"stock\":5555,\"store_name\":\"\\u5e73\\u51e1\\u7684\\u4e16\\u754c+\\u4eba\\u95f4\\u5931\\u683c \\u5168\\u4e09\\u518c\\u7cbe\\u88c5 \\u8def\\u9065\\u539f\\u8457\\u5168\\u5957\\u5168\\u96c6\\u4e2d\\u56fd\\u5f53\\u4ee3\\u6539\",\"store_info\":\"\\u5e73\\u51e1\\u7684\\u4e16\\u754c+\\u4eba\\u95f4\\u5931\\u683c \\u5168\\u4e09\\u518c\\u7cbe\\u88c5 \\u8def\\u9065\\u539f\\u8457\\u5168\\u5957\\u5168\\u96c6\\u4e2d\\u56fd\\u5f53\\u4ee3\\u5c0f\\u8bf4\\u8bfb\\u7269 \\u8305\\u76fe\\u6587\\u5b66\\u5956\\u7ecf\\u5178\\u6587\\u5b66\\u5c0f\\u8bf4\\u4e66\\u7c4d\\u7545\\u9500\\u5c0f\\u8bf4\\u516b\\u5e74\\u7ea7\\u63a8\\u8350\\u8bfb\\u7269\\u6b63\\u7248\\u5305\\u90ae\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"55.00\"},\"truePrice\":552,\"vip_truePrice\":0,\"trueStock\":5555,\"costPrice\":\"55.00\"}', '936824c0191953647ec609b4f49bc964');
INSERT INTO `eb_store_order_cart_info` VALUES (26, 34, 17, '{\"id\":34,\"uid\":18,\"type\":\"product\",\"product_id\":17,\"product_attr_unique\":\"\",\"cart_num\":1,\"add_time\":1572407259,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":17,\"image\":\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/22\\/\\/e43b98f2d37effee55ba4307560f3c7f.jpg\",\"slider_image\":[\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/22\\/\\/e43b98f2d37effee55ba4307560f3c7f.jpg\",\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/22\\/\\/b1798ed2d6b5b9c75bf7fa11703a3201.jpg\",\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/22\\/\\/52bfe48235afd1b0a881c35714542aa1.jpg\",\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/22\\/\\/6fc0efdc9a7582d3552279f375a9428d.jpg\",\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/09\\/22\\/\\/0fc890ce7262d25f5ab51c30c48abb16.jpg\"],\"price\":\"552.00\",\"ot_price\":\"680.00\",\"vip_price\":\"0.00\",\"postage\":\"55.00\",\"mer_id\":0,\"give_integral\":\"55.00\",\"cate_id\":\"25\",\"sales\":1,\"stock\":5554,\"store_name\":\"\\u5e73\\u51e1\\u7684\\u4e16\\u754c+\\u4eba\\u95f4\\u5931\\u683c \\u5168\\u4e09\\u518c\\u7cbe\\u88c5 \\u8def\\u9065\\u539f\\u8457\\u5168\\u5957\\u5168\\u96c6\\u4e2d\\u56fd\\u5f53\\u4ee3\\u6539\",\"store_info\":\"\\u5e73\\u51e1\\u7684\\u4e16\\u754c+\\u4eba\\u95f4\\u5931\\u683c \\u5168\\u4e09\\u518c\\u7cbe\\u88c5 \\u8def\\u9065\\u539f\\u8457\\u5168\\u5957\\u5168\\u96c6\\u4e2d\\u56fd\\u5f53\\u4ee3\\u5c0f\\u8bf4\\u8bfb\\u7269 \\u8305\\u76fe\\u6587\\u5b66\\u5956\\u7ecf\\u5178\\u6587\\u5b66\\u5c0f\\u8bf4\\u4e66\\u7c4d\\u7545\\u9500\\u5c0f\\u8bf4\\u516b\\u5e74\\u7ea7\\u63a8\\u8350\\u8bfb\\u7269\\u6b63\\u7248\\u5305\\u90ae\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"55.00\"},\"truePrice\":552,\"vip_truePrice\":0,\"trueStock\":5554,\"costPrice\":\"55.00\"}', '5d2c2cee8ab0b9a36bd1ed7196bd6c4a');
INSERT INTO `eb_store_order_cart_info` VALUES (27, 35, 27, '{\"id\":35,\"uid\":18,\"type\":\"product\",\"product_id\":27,\"product_attr_unique\":\"\",\"cart_num\":8,\"add_time\":1572424173,\"is_pay\":0,\"is_del\":0,\"is_new\":0,\"combination_id\":0,\"seckill_id\":0,\"bargain_id\":0,\"productInfo\":{\"id\":27,\"image\":\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/cfad1a2cdb82d602bcd3e79c550a2534.jpg\",\"slider_image\":[\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/cfad1a2cdb82d602bcd3e79c550a2534.jpg\",\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/84b08301e589cbe83411ece88757aeaa.jpg\",\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/d3e44711d453286259aec2bacaecf107.jpg\",\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/a9fb1196cbcdc68fc6d80cb171d9ec6c.jpg\",\"http:\\/\\/www.bs.com\\/\\/public\\/uploads\\/attach\\/2019\\/10\\/05\\/\\/d2febcef9fbd999589aec8ecf6481860.jpg\"],\"price\":\"499.00\",\"ot_price\":\"4444.00\",\"vip_price\":\"0.00\",\"postage\":\"0.00\",\"mer_id\":0,\"give_integral\":\"444.00\",\"cate_id\":\"4\",\"sales\":0,\"stock\":444,\"store_name\":\"2019\\u65b0\\u7248\\u7c73\\u5c0f\\u5708\\u4e0a\\u5b66\\u8bb0\\u4e00\\u5e74\\u7ea7\\u5168\\u59574\\u518c\\u6ce8\\u97f3\\u7248\\u5fc5\\u8bfb\\u8bfe\\u5916\\u4e6612\\u5e26\\u62fc\\u97f3\\u7684\\u751f\\u8bfe\\u5916\\u9605\\u8bfb\",\"store_info\":\"2019\\u65b0\\u7248\\u7c73\\u5c0f\\u5708\\u4e0a\\u5b66\\u8bb0\\u4e00\\u5e74\\u7ea7\\u5168\\u59574\\u518c\\u6ce8\\u97f3\\u7248\\u5fc5\\u8bfb\\u8bfe\\u5916\\u4e6612\\u5e26\\u62fc\\u97f3\\u7684\\u6f2b\\u753b\\u4e66\\u4e8c\\u5e74\\u7ea7\\u4e09\\u6545\\u4e8b\\u4e66\\u7c73\\u4f60\\u5c0f\\u5708\\u4e0b\\u518c\\u5c0f\\u5b66\\u751f\\u8bfe\\u5916\\u9605\\u8bfb\\u4e66\\u7c4d\\u7206\\u7b11\\u6f2b\\u753b\",\"unit_name\":\"\\u4ef6\",\"is_show\":1,\"is_del\":0,\"is_postage\":0,\"cost\":\"499.00\"},\"truePrice\":499,\"vip_truePrice\":0,\"trueStock\":444,\"costPrice\":\"499.00\"}', 'b87470782489389f344c4fa4ceb5260c');

-- ----------------------------
-- Table structure for eb_store_order_status
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_order_status`;
CREATE TABLE `eb_store_order_status`  (
  `oid` int(10) UNSIGNED NOT NULL COMMENT '订单id',
  `change_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型',
  `change_message` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作备注',
  `change_time` int(10) UNSIGNED NOT NULL COMMENT '操作时间',
  INDEX `oid`(`oid`) USING BTREE,
  INDEX `change_type`(`change_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单操作记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_order_status
-- ----------------------------
INSERT INTO `eb_store_order_status` VALUES (1, 'cache_key_create_order', '订单生成', 1568773273);
INSERT INTO `eb_store_order_status` VALUES (1, 'remove_order', '删除订单', 1568773298);
INSERT INTO `eb_store_order_status` VALUES (3, 'cache_key_create_order', '订单生成', 1570530102);
INSERT INTO `eb_store_order_status` VALUES (4, 'cache_key_create_order', '订单生成', 1570530325);
INSERT INTO `eb_store_order_status` VALUES (5, 'cache_key_create_order', '订单生成', 1570530366);
INSERT INTO `eb_store_order_status` VALUES (6, 'cache_key_create_order', '订单生成', 1570530381);
INSERT INTO `eb_store_order_status` VALUES (7, 'cache_key_create_order', '订单生成', 1570530499);
INSERT INTO `eb_store_order_status` VALUES (8, 'cache_key_create_order', '订单生成', 1570540480);
INSERT INTO `eb_store_order_status` VALUES (9, 'cache_key_create_order', '订单生成', 1570607335);
INSERT INTO `eb_store_order_status` VALUES (10, 'cache_key_create_order', '订单生成', 1570607411);
INSERT INTO `eb_store_order_status` VALUES (11, 'cache_key_create_order', '订单生成', 1570950665);
INSERT INTO `eb_store_order_status` VALUES (12, 'cache_key_create_order', '订单生成', 1570979513);
INSERT INTO `eb_store_order_status` VALUES (13, 'cache_key_create_order', '订单生成', 1570979666);
INSERT INTO `eb_store_order_status` VALUES (14, 'cache_key_create_order', '订单生成', 1570979683);
INSERT INTO `eb_store_order_status` VALUES (15, 'cache_key_create_order', '订单生成', 1571024580);
INSERT INTO `eb_store_order_status` VALUES (16, 'cache_key_create_order', '订单生成', 1571033439);
INSERT INTO `eb_store_order_status` VALUES (17, 'cache_key_create_order', '订单生成', 1571044729);
INSERT INTO `eb_store_order_status` VALUES (18, 'cache_key_create_order', '订单生成', 1571044799);
INSERT INTO `eb_store_order_status` VALUES (19, 'cache_key_create_order', '订单生成', 1571044873);
INSERT INTO `eb_store_order_status` VALUES (20, 'cache_key_create_order', '订单生成', 1571045985);
INSERT INTO `eb_store_order_status` VALUES (21, 'cache_key_create_order', '订单生成', 1571046695);
INSERT INTO `eb_store_order_status` VALUES (22, 'cache_key_create_order', '订单生成', 1571047105);
INSERT INTO `eb_store_order_status` VALUES (23, 'cache_key_create_order', '订单生成', 1571048010);
INSERT INTO `eb_store_order_status` VALUES (24, 'cache_key_create_order', '订单生成', 1572402488);
INSERT INTO `eb_store_order_status` VALUES (25, 'cache_key_create_order', '订单生成', 1572402874);
INSERT INTO `eb_store_order_status` VALUES (26, 'cache_key_create_order', '订单生成', 1572407262);
INSERT INTO `eb_store_order_status` VALUES (27, 'cache_key_create_order', '订单生成', 1572424175);

-- ----------------------------
-- Table structure for eb_store_pink
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_pink`;
CREATE TABLE `eb_store_pink`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单id 生成',
  `order_id_key` int(10) UNSIGNED NOT NULL COMMENT '订单id  数据库',
  `total_num` int(10) UNSIGNED NOT NULL COMMENT '购买商品个数',
  `total_price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '购买总金额',
  `cid` int(10) UNSIGNED NOT NULL COMMENT '拼团产品id',
  `pid` int(10) UNSIGNED NOT NULL COMMENT '产品id',
  `people` int(10) UNSIGNED NOT NULL COMMENT '拼图总人数',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '拼团产品单价',
  `add_time` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开始时间',
  `stop_time` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `k_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '团长id 0为团长',
  `is_tpl` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否发送模板消息0未发送1已发送',
  `is_refund` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否退款 0未退款 1已退款',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态1进行中2已完成3未完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '拼团表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_product
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product`;
CREATE TABLE `eb_store_product`  (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `mer_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户Id(0为总后台管理员创建,不为0的时候是商户后台创建)',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  `slider_image` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图',
  `store_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `store_info` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品简介',
  `keyword` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `cate_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类id',
  `price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '商品价格',
  `vip_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '会员价格',
  `ot_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '市场价',
  `postage` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '邮费',
  `unit_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '单位名',
  `sort` smallint(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `sales` mediumint(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `stock` mediumint(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '库存',
  `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态（0：未上架，1：上架）',
  `is_hot` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否热卖',
  `is_benefit` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否优惠',
  `is_best` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否精品',
  `is_new` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否新品',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品描述',
  `add_time` int(11) UNSIGNED NOT NULL COMMENT '添加时间',
  `is_postage` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否包邮',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  `mer_use` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户是否代理 0不可代理1可代理',
  `give_integral` decimal(8, 2) UNSIGNED NOT NULL COMMENT '获得积分',
  `cost` decimal(8, 2) UNSIGNED NOT NULL COMMENT '成本价',
  `is_seckill` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '秒杀状态 0 未开启 1已开启',
  `is_bargain` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '砍价状态 0未开启 1开启',
  `ficti` mediumint(11) NULL DEFAULT 100 COMMENT '虚拟销量',
  `browse` int(11) NULL DEFAULT 0 COMMENT '浏览量',
  `code_path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品二维码地址(用户小程序海报)',
  `store_code` varchar(38) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品编码',
  `soure_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '淘宝、天猫、1688商品保存标识，避免商品重复入库',
  `brand` int(11) NOT NULL DEFAULT 0 COMMENT '品牌id',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `press` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版社',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cate_id`(`cate_id`) USING BTREE,
  INDEX `is_hot`(`is_hot`) USING BTREE,
  INDEX `is_benefit`(`is_benefit`) USING BTREE,
  INDEX `is_best`(`is_best`) USING BTREE,
  INDEX `is_new`(`is_new`) USING BTREE,
  INDEX `toggle_on_sale, is_del`(`is_del`) USING BTREE,
  INDEX `price`(`price`) USING BTREE,
  INDEX `is_show`(`is_show`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `sales`(`sales`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `is_postage`(`is_postage`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of eb_store_product
-- ----------------------------
INSERT INTO `eb_store_product` VALUES (1, 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\"]', '无线吸尘器F8 玫瑰金礼盒版', '【年货节活动价1699元，领取吸尘器优惠券再减50元，到手价仅1649元】', '无线吸尘器', '2', 0.01, 0.00, 1699.00, 1.00, '件', 1, 240, 586, 1, 1, 0, 1, 1, '<p><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dbb137d656.jpeg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dbb229e820.jpeg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dbb3b37f84.jpeg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dbb513b06f.jpeg\"/></p>', 1547205504, 1, 1, 0, 1699.00, 100.00, 0, 0, 81, 0, '', '', '', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (2, 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\"]', '智能马桶盖 AI版', '智能马桶盖 AI版', '智能马桶', '3', 0.01, 0.00, 1999.00, 0.00, '件', 0, 47, 994, 0, 1, 1, 1, 1, '<p><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dbce620415.jpeg\"/></p>', 1547516202, 1, 0, 0, 1999.00, 1500.00, 0, 0, 12, 0, '', '', '', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (3, 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\"]', '智米加湿器 白色', '智米加湿器 白色', '加湿器', '3', 249.00, 0.00, 299.00, 0.00, '件', 0, 43, 3953, 0, 1, 1, 1, 1, '<p><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc1730a0c0.jpg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc182bccac.jpg\"/></p>', 1547551009, 1, 0, 0, 249.00, 10.00, 0, 0, 8, 0, '', '', '', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (4, 0, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc23646fff.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc23646fff.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\"]', '互联网电热水器1A', '3000w双管速热，动态360L热水用量，双重漏电保护，智能APP操控', '电热水器', '3', 999.00, 0.00, 1599.00, 0.00, '件', 0, 80, 420, 1, 1, 1, 1, 1, '<p><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc286862fd.jpg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc294a9a0a.jpg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc2ba18a77.jpg\"/></p>', 1547551346, 1, 1, 0, 999.00, 888.00, 0, 0, 10, 0, '', '', '', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (5, 0, 'http://datong.crmeb.net/public/uploads/editor/20190115/5c3dbb513b06f.jpeg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/editor\\/20190115\\/5c3dc294a9a0a.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/editor\\/20190115\\/5c3dbb513b06f.jpeg\"]', '测试', '阿萨德啊', '去', '4,7,2,3,19', 1.00, 0.00, 1.00, 0.00, '件', 0, 0, 111, 0, 0, 0, 0, 0, '', 1554863537, 0, 0, 0, 1.00, 1.00, 0, NULL, 1, 0, '', '', '', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (11, 0, 'http://activity.crmeb.net/public/uploads/attach/2019/03/29/5c9e015bdc6f5.jpg', '[\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/editor\\/20190115\\/5c3dc286862fd.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/editor\\/20190115\\/5c3dc182bccac.jpg\"]', '小米', '', '', '4', 1111.00, 0.00, 11.00, 11.00, '件', 11, 0, 11, 0, 0, 0, 0, 0, '', 1568769416, 0, 0, 0, 111.00, 1111.00, 0, NULL, 1, 0, '', '', '', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (12, 0, 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\49c0c48ffe8339b6e327ddbd094e9c26.jpg', '[\"http:\\/\\/activity.crmeb.net\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\18\\\\\\\\49c0c48ffe8339b6e327ddbd094e9c26.jpg\",\"http:\\/\\/activity.crmeb.net\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\18\\\\\\\\9c052507bbc576b9700ffaecdaa2cfa8.jpg\",\"http:\\/\\/activity.crmeb.net\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\18\\\\\\\\2c1c210f168957db1df110b1e40d2cdf.jpg\",\"http:\\/\\/activity.crmeb.net\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\18\\\\\\\\7aad45840c3a0868c3fdf5d90df7cea2.jpg\",\"http:\\/\\/activity.crmeb.net\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\18\\\\\\\\93ac290b81a09f62c6ca7bb6ceb547cc.jpg\",\"http:\\/\\/activity.crmeb.net\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\18\\\\\\\\bd3019176d781ba4e3cd3d14dd80d720.jpg\"]', '子晴中长款高领套头针织衫秋冬新款宽松保暖加厚长袖女毛衣外套', '子晴中长款高领套头针织衫秋冬新款宽松保暖加厚长袖女毛衣外套', '', '4', 11.00, 0.00, 11.00, 11.00, '件', 0, 0, 11, 1, 0, 0, 0, 0, '<div><a name=\"hlg_list_1_26847169_start\"></a></div>\\\\\\ \\  \\   \\  \\ \\<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin: 0.0px auto;\"><tbody><tr><td>\\   <div class=\"hlg_list_26847169\"><img border=\"0\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\44941725d0b60c1d6d0621aa22c20d77.jpg\" usemap=\"#sfd\"><map name=\"sfd\"><area coords=\"11,390,187,670\" href=\"https://item.taobao.com/item.htm?ft=t&amp;id=601864856880\" shape=\"rect\"> <area coords=\"193,391,373,672\" href=\"https://item.taobao.com/item.htm?ft=t&amp;id=602309814709\" shape=\"rect\"> <area coords=\"376,392,558,672\" href=\"https://item.taobao.com/item.htm?ft=t&amp;id=602169569220\" shape=\"rect\"> <area coords=\"558,391,737,673\" href=\"https://item.taobao.com/item.htm?ft=t&amp;id=602169069408\" shape=\"rect\"> <area coords=\"10,683,185,969\" href=\"https://item.taobao.com/item.htm?ft=t&amp;id=601583543035\" shape=\"rect\"> <area coords=\"193,683,370,967\" href=\"https://item.taobao.com/item.htm?ft=t&amp;id=600251589525\" shape=\"rect\"> <area coords=\"376,684,553,966\" href=\"https://item.taobao.com/item.htm?ft=t&amp;id=602281385996\" shape=\"rect\"> <area coords=\"560,682,739,965\" href=\"https://item.taobao.com/item.htm?ft=t&amp;id=602683091232\" shape=\"rect\"> <area coords=\"19,1002,734,1266\" href=\"https://h5.m.taobao.com/taolive/video.html?userId=1710310361&amp;id=236140369050\" shape=\"rect\"> <area coords=\"1,18,751,269\" href=\"https://meidian.play.m.jaeapp.com/?iid=1189821&amp;cpp=0\" shape=\"rect\"></map></div>\\   </td></tr></tbody></table>\\\\<div><a name=\"hlg_list_1_26847169_end\"></a></div>\\\\<div><a name=\"hlg_list_2_26023082_start\"></a></div>\\\\\\ \\  \\   \\  \\ \\<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin: 0.0px auto;\"><tbody><tr><td>\\   <div class=\"hlg_list_26023082\">\\   <div><img alt=\"自定义 20190418\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\c289b939f5fae0873f30a71efce44cab.jpg\" style=\"\" usemap=\"#hlgCustomMap_lhxy5wesu1gn95jowp14i_1564986952847\"><map name=\"hlgCustomMap_lhxy5wesu1gn95jowp14i_1564986952847\"></map></div>\\   </div>\\   </td></tr></tbody></table>\\\\<div><a name=\"hlg_list_2_26023082_end\"></a></div>\\\\<p><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\c93892d129e9b921ebb04ddbbc815dfc.jpg\" style=\"line-height: 1.5;max-width: 750.0px;\"></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">这是一款 <strong>神奇的毛衣</strong>...</span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">说TA是高领吧</span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">TA的高领并不普通</span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">有点儿堆堆领</span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">很像围脖哈哈哈</span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">说TA 是冬天的毛衣吧</span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">TA肩膀处的一圈装饰</span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">又很像是用一字领拼接而成的</span></span></p>\\\\<p><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\e7588b33e19862bae55e85fbb66dd137.jpg\" style=\"max-width: 750.0px;\"></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">就连TA的面料和颜色</span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">都是很神奇的</span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">这款我用的是 <strong>独特的羊仔毛</strong></span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">比市面上普通的羊毛更细更软</span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">非常亲肤非常柔软</span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">冬天穿是相当舒服的</span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">可能抱着自己就想入睡了哈哈哈</span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">颜色是很好看的 <strong>松子灰</strong></span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">在阳光的照耀下显得很温柔~</span></span></p>\\\\<p><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\e286b7b1cfe1c000fba1724cc7486acf.jpg\" style=\"max-width: 750.0px;\"></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">袖口是比较宽大的翻卷袖</span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">跟围脖领部分都是 <strong>条纹图案</strong></span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">这点细微的小特色</span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">就让TA跟其它的毛衣有很大的不同</span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">搭配紧身牛仔裤或者阔腿裤的时候</span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">显得非常时髦非常大pai</span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">也可以搭配短裤和长靴</span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">今年冬天的“下衣失踪”性感</span></span></p>\\\\<p style=\"text-align: center;\"><span style=\"font-family: microsoft yahei;\"><span style=\"font-size: 18.0px;\">由TA替你完成~</span></span></p>\\\\<p><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\2b000631140cd7f982d73f082a748f58.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\651d606e05c90f3e9298bc3afe6a1d94.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\dfe135d300982ee596b7e5cf8efae36d.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\613df870037ce04e2faf722520c2c332.jpg\" style=\"max-width: 750.0px;\"></p>\\\\<div class=\"dm_module\" data-id=\"9521529\" data-title=\"搭配推荐\" id=\"ids-module-9521529\">\\<div>\\<div style=\"height: 0;\">&nbsp;</div>\\\\<div><img alt=\"\" border=\"0\" height=\"445\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\633839215696482cd187cfdb81fa7fca.jpg\" usemap=\"#Map10092155\" width=\"750\"><map name=\"Map10092155\"><area coords=\"55,108,265,389\" href=\"https://item.taobao.com/item.htm?spm=a1z10.1-c-s.w15210519-17136286704.14.7b296ed9gfsF0&amp;id=559537388239\" shape=\"rect\"> <area coords=\"274,109,476,387\" href=\"https://item.taobao.com/item.htm?spm=a1z10.1-c-s.w15210519-17125933118.16.7b296ed9gfsF0&amp;id=557772741175\" shape=\"rect\"> <area coords=\"486,108,686,389\" href=\"https://item.taobao.com/item.htm?spm=a1z10.1-c-s.w15210519-17125933118.10.7b296ed9gfsF0&amp;id=559008330273\" shape=\"rect\"></map></div>\\</div>\\</div>\\\\<p><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\796a591bd45bceee064525604e798d7f.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\65c3d35d99cf6c1c3081ca0e2473fab7.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\e43c3cd510fbf9a490531f73cecba4f0.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\5f351e730f4c9f434688c18aa5c2aa7e.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\5f4e654c3b2d3837445157ad89544a64.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\10ce17504b53b200ff03ab7058899eeb.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\bdb0517ee24ba305580983a124cd8a7f.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\55698ef58995fb8062eaac10290def33.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\b54820ecb661e0dc00f2623f9a674674.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\ba0de731a0715fda43f724c9dd68e31b.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\f10cc0014742540bdc07337675a74909.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\395b01d75a5420a321fc0d8acee27df1.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\952fd511999db4ea5cd1efbc7f3a3f7f.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\c654d3b52ba5bbaaeffebab8457bb44d.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\2e738000c05ba3f0daed52962a1957f3.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\3a26d43832bd5dc749d442f6942866f2.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\0dfe62604a17540815f5078d6d51f963.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\ae71f971af62f6f288d2d23ee0bf67f3.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\5eb1e68c639952d68f424eb794cdb191.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\46570c7efa27dfdcc9da732b106d0dd3.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\3d1ec44b20762aa4c6737e6ae74164cc.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\50c2251fbafac8c9c744be910db6c5dd.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\66e2379f59fe7c54ae44d5542c71b20c.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\931a1a3098fb934a01118cd4be4bae53.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\c9431c372d9e47e6f29f6bf6d993d0d9.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\25fca983bee39c3e59d840fc0e785df7.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\b2a63e3cb5bd812c27ecab83c2af9811.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\fb72505f7a2f928fb28cbee4e0f8e85f.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\90391cf40b6d67c04d86a7513a7868f0.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\1bfee6ee7dc5c9f56817d41c2f63a98c.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\ce2c09b98fe982dcd4e714bbcc1690b5.jpg\" style=\"max-width: 750.0px;\"></p>\\\\<p>&nbsp;</p>\\\\<p><span style=\"color: white;line-height: 0.0px;font-size: 0.0px;\">- -_- -</span></p>\\\\<div class=\"hlg_rand_1612344817\" style=\"opacity: 0;height: 0;width: 0;\">746043887</div>', 1568774848, 0, 1, 0, 11.00, 11.00, 0, NULL, 11, 0, '', '', 'https://item.taobao.com/item.htm?spm=a310p.7395781.1998038982.1&id=558849985298', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (13, 0, 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\a4a5aebc6755493594d1e835ca58f62c.png', '[\"http:\\/\\/activity.crmeb.net\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\18\\\\\\\\a4a5aebc6755493594d1e835ca58f62c.png\",\"http:\\/\\/activity.crmeb.net\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\18\\\\\\\\5a77c7c5d376e4c4b48321af88303dbd.jpg\",\"http:\\/\\/activity.crmeb.net\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\18\\\\\\\\69a8c72ae16725a95df4792109b48e04.jpg\",\"http:\\/\\/activity.crmeb.net\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\18\\\\\\\\7a109b2dae42fea5c80a5e82374ef41d.jpg\",\"http:\\/\\/activity.crmeb.net\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\18\\\\\\\\a240e5312b1aec619c27f87d16d62e21.jpg\",\"http:\\/\\/activity.crmeb.net\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\18\\\\\\\\72d128c2bfe806f62285af9699c8b271.png\"]', '子晴貉子毛领羽绒服女白色2019冬季新款90白鸭绒中长款小个子外套', '子晴貉子毛领羽绒服女白色2019冬季新款90白鸭绒中长款小个子外套', '11', '4', 11.00, 0.00, 11.00, 0.00, '件', 0, 0, 11, 1, 0, 0, 0, 0, '(function(win,key){win[key]=window[key]||{};win[key].cdnPath=\'https://g.alicdn.com/sd/baxia/1.0.5/\';win[key].punishPath={[\'https://dscnew.taobao.com/i6/580/761/581769995059/TB1lYV.gbj1gK0jSZFu8qwrHpla.desc%7Cvar%5Edesc%3Bsign%5Ec2da9de310a9d0cb857873954c48c7d9%3Blang%5Egbk%3Bt%5E1568697083\']:\'https://login.taobao.com/member/login.jhtml?style=mini&amp;from=sm&amp;full_redirect=false&amp;redirectURL=http%3a%2f%2fdscnew.taobao.com/i6/580/761/581769995059/TB1lYV.gbj1gK0jSZFu8qwrHpla.desc%7Cvar%5Edesc%3Bsign%5Ec2da9de310a9d0cb857873954c48c7d9%3Blang%5Egbk%3Bt%5E1568697083/_____tmd_____/punish%3fx5secdata=5e0c8e1365474455070961b803bd560607b52cabf5960afff39b64ce58073f7828fec592a01b892e1b4d0c7354ac35e07dc8af3703187d6d64561402b1c87a3cae05d6a084e26e17fce6f28abaf9fc951746941a5f9f2cad199100251a84b0be151b80741e83f64c4b6c6a150f3eaeaea5c3801581ad63fa3957915161e86a7ad3443e552c13427babfe18746d355fc6527d858d68341840566ba735a898f85d283160a4b6916800cbeb80abf145f4d10ddce1c82e11cb9c9ed44f310d966128bd2915cdc82a3b3ca099d73df82c7f7c3828bc2c059b1fbc876d4589972fc43cafb3f59c461c51b8d9da168f0e68f989f689bd9bf8c694f31c3823b70f048e4cdcc405e8e5d65553d6f92f919aa5ab2246fabac8e27bc6ec8d92390e192c8fd9cabd2e64668bb098612cd0cb855eb709e20db59433350681070d3d8259b6702420bc2079d80bb9f79e6f69c7c441da1c38fc9f3c1a16be5005d113cfad7d6d635f019e05f53904981b00da218a40f5cb56e54035ac6e4efe49e5c1c276b6ade9212e6b884b5b3e986a1e2af541393ecb1ca237e6567d47a29c3394e7975028b6212d64a40a5480d2809466c10cfdd6a59641031981103b51151f0aadbd0af7b350ee80eb883b37a1fb5973c1fa349fd822480f5445cdad96dbd82d338fe8658d0c72d2abd04b75870139503fe2cc6dc9ecebe56146d22ed3b7392c5a2a1b8dc13123cecd72a2c0fbe78d44e02dc747d4bfec2900ad20df5c2feda956ce3fbf303f5d3e954fef7885e7db2302939d18f15d9a678964b11679bf2531504047e854%26x5step=100\'};})(window,\"__baxia__\");!function(){\"use strict\";var e=window,n=function(n,t){return(e.__baxia__||{})[n]||t},t=function(n,t){e.__baxia__=e.__baxia__||{},e.__baxia__[n]=t},r=location,a=document,o=function(e){var n=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:1,t=arguments.length&gt;2&amp;&amp;void 0!==arguments[2]?arguments[2]:1;if(!(t&gt;0&amp;&amp;Math.random()&gt;=t)){var o={code:n,msg:(e+\"\").substr(0,1e3)+\";v:1.0.3-beta1\",pid:\"baxia\",page:r.href.split(/[#?]/)[0],query:r.search.substr(1),hash:r.hash,referrer:a.referrer,title:a.title,ua:navigator.userAgent};console&amp;&amp;console.error(e),function(e,n){var t=[];for(var r in e)t.push(r+\"=\"+encodeURIComponent(e[r]));(new Image).src=n+t.join(\"&amp;\")}(o,\"//gm.mmstat.com/fsp.1.1?\")}};var i=document,s=document;({init:function(){this.punishPath=n(\"punishPath\",{}),t(\"punishPath\",\"\"),this.listenOnLoad()},getCurrentScript:function(){if(s.currentScript)return s.currentScript;for(var e=s.getElementsByTagName(\"script\"),n=\"\",t=e.length-1;t&gt;=0;t--)if(this.punishPath[e[t].src])return n=e[t];return n},updatejQueryEvent:function(e,n,t){window.jQuery&amp;&amp;(window.jQuery.event.triggered=n,t&amp;&amp;window.jQuery(e).trigger(t))},getHandlerPath:function(e,t){return t.jsPath?t.jsPath:\"\"+n(\"cdnPath\",\"https://g.alicdn.com/sd/baxia/1.0.3/\")+e+\".js\"},listenOnLoad:function(){var e=this.getCurrentScript();this.updatejQueryEvent(\"\",\"load\");var n=e.onreadystatechange||e.onload,t=this;e.onload=function(){var e=this;this.onload=this.onreadystatechange=null,t.handler(\"Jsonp\",{result:{rgv587_flag:\"sm\",url:t.punishPath[this.src]},config:{url:this.src,done:function(){console.log(\"request.done();\"),e.readyState=\"loaded\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"load\")},fail:function(){console.log(\"request.fail();\"),e.readyState=\"error\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"error\")}}})}},handler:function(){var e=arguments.length&gt;0&amp;&amp;void 0!==arguments[0]?arguments[0]:\"Xhr\",r=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:{},a=n(\"pluginInstance\",null),s=n(\"handlerQueue\",[]);try{if(a)return a.handler(r);s.push({pluginName:e,props:r});var u=s[0],l=u.pluginName,c=u.props,d=\"baxia\"+l+\"Handler\",h=this.getHandlerPath(d,c);t(\"handlerQueue\",s),function(e,n,t){var r=i.getElementsByTagName(\"script\")[0],a=i.createElement(\"script\");if(a.async=1,a.src=e,a.onerror=function(n){o(\"function:loadJS. msg:\"+e+\"load error。props：\"+JSON.stringify(t)),a.onerror=null},n){var s=!1;a.onload=a.onreadystatechange=function(){s||a.readyState&amp;&amp;!/loaded|complete/.test(a.readyState)||(a.onload=a.onreadystatechange=null,s=!0,n())}}r.parentNode.insertBefore(a,r)}(h,function(){s=n(\"handlerQueue\",[]),a=new window[d];for(var e=0;e', 1568774952, 0, 1, 0, 111.00, 11.00, 0, NULL, 11, 0, '', '', 'https://item.taobao.com/item.htm?spm=2013.1.20141001.2.751a3eddz3YPs8&id=581769995059&scm=1007.12144.95220.42296_0_0&pvid=6f5e21f9-c2a3-4a33-8e4e-f10ea501323d&utparam=%7B%22x_hestia_source%22%3A%2242296%22%2C%22x_object_type%22%3A%22item%22%2C%22x_mt%22%3', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (14, 0, 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\00143da73713f2a5634a2030f8bcb0df.jpg', '[\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\18\\\\\\\\00143da73713f2a5634a2030f8bcb0df.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\18\\\\\\\\671992b0501d15f8827fd36b9217c3c1.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\18\\\\\\\\ec41b4eea040275b217ff452855620b2.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\18\\\\\\\\4685a06369af63c157de02b2f2c3ac92.jpg\"]', '匹克态极1.0男女跑步鞋2019夏季太极taichi透气减震科技运动鞋男x', '匹克态极1.0男女跑步鞋2019夏季太极taichi透气减震科技运动鞋男x', '', '7', 10.00, 0.00, 10.00, 10.00, '件', 0, 0, 10, 0, 0, 0, 0, 0, '<p><img src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\5bfbdb1d6d501ccc57bbcd15a0731099.jpg\" align=\"absmiddle\"><img src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\2bbbd83f3510d3738790473fc465d5b0.jpg\" align=\"absmiddle\"><img src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\5623e9219ed46401ba6638bfa6918d1c.jpg\" align=\"absmiddle\"><img src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\cb02d0ba6242e9975297b376391962eb.jpg\" align=\"absmiddle\"><img src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\b369641521dbd8956b001490ddb43440.jpg\" align=\"absmiddle\"><img src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\aef616195c2c74cfaa36ba1575a32fac.jpg\" align=\"absmiddle\"><img src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\c59ae28d019ddb557b5beb24b27bbb61.jpg\" align=\"absmiddle\"><img src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\b43c12ee2672a06058389bd66f1ff06c.jpg\" align=\"absmiddle\"><img src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\f0ab9806351280dfda4afd18cec49619.jpg\" align=\"absmiddle\"><img src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\efec4b8d56e581d45d53779475d49712.jpg\" align=\"absmiddle\"><img src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\fd93450fe6362b88e1e15e72e42fea00.jpg\" align=\"absmiddle\"><img src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\d01f29cd3287d9c1a19f4fb24f59dbb5.jpg\" align=\"absmiddle\"><img src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\b9357c6bfb71feda02a5ca9dc6624f45.jpg\" align=\"absmiddle\"><img src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\1e256e03d255cc70e01e23bb0355e316.jpg\" align=\"absmiddle\"><img src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\fba81b6703799f02d05689e22b2a9333.jpg\" align=\"absmiddle\"><img src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\67fb151fc42f12db2878cd6ae4ec9462.jpg\" align=\"absmiddle\"><img src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\c15d868e66799b7954234d859af06347.jpg\" align=\"absmiddle\"><img src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\f29cb93036e63d2d9a11f702f568753d.jpg\" align=\"absmiddle\"> </p>', 1568796963, 0, 0, 0, 10.00, 10.00, 0, NULL, 10, 0, '', '', 'https://detail.tmall.com/item.htm?spm=a211oj.13301896.5774449050.2.59006527OiVdk9&id=597186940359&scm=1007.12144.113779.8507679_0_0&pvid=64ee610b-cd73-4feb-b1f3-420957cb0b87', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (15, 0, 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\3afbd4fa7a2793e3f509c26fae9eeff7.jpg', '[\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\20\\\\\\\\3afbd4fa7a2793e3f509c26fae9eeff7.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\20\\\\\\\\a01c93d07a93d735ffbbe029c220c44d.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\20\\\\\\\\9cbb38ceb2842e35ef8e175a8622f961.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\20\\\\\\\\735a9b0f23c1c89ed3c52ed8a2d261cf.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\20\\\\\\\\43aec952a4c8b8aef9161ca14a522fd5.jpg\"]', '【爱尚】DVF2019夏季新款收腰透气雪纺裙休闲系带裹身连衣裙', '【爱尚】DVF2019夏季新款收腰透气雪纺裙休闲系带裹身连衣裙', '', '3', 22.00, 0.00, 11.00, 22.00, '件', 0, 0, 22, 0, 0, 0, 0, 0, '<p><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\cfb3de53079442db34cb5d32bcff5204.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\8e1f0381831d2404efdb4bacd1b2c7e2.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\7636c06a2c9e9b78283825f40d22d179.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\dcb478d581bd38fd84ad0a25f7cebcd6.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\a765656842e01390a642fcf610a5ac17.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\dfc5336309f4f04540408e9894846a6f.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\510c9b51ff38b27949afd53453c2a99d.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\051075ea62444dfc35604180dd663f2e.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\8a5a28fd249ee1f1f7494e02651ea2fd.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\9fd2f8e470047ed260c587c58d4a279c.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\71f691bb2fa7e6316bbdce29a477c7df.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\d6106acdd34634b0f42749fc4480877b.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\f509a05206faf93c4688dcea1dae3b81.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\1e031825e200e660694cbccfd24958c3.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\0009bacac912153081c18b5c04008a96.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\36852649272381a78c54e9bb3ef1b87c.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\5eee4fdbc505d603f2405138d04580d0.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\c696b20802c58b7766caebbad2816338.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\7876de2bd5e87adb756767b4e62c6017.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\83648021b6db62fc230c01edcaed2f9e.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\6aaa8d9adefabcf7e23ff07aa668b9a6.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\0381208ef800b6b675c701cefb3d8dcd.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\caa0d39cfcc52c44f8c65e5f0c9cbd36.jpg\" style=\"max-width: 750.0px;\"></p>', 1568945462, 0, 0, 0, 22.00, 22.00, 0, NULL, 22, 0, '', '', 'https://item.taobao.com/item.htm?spm=a219r.lm874.14.18.2c6550d6EwOIvd&id=593832631931&ns=1&abbucket=16', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (16, 0, 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\28e03d3ced4f7613a339c6136bea39ad.jpg', '[\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\22\\\\\\\\28e03d3ced4f7613a339c6136bea39ad.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\22\\\\\\\\dd4101072215de9c5f95cf7f6b215ae0.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\22\\\\\\\\b20d2576e602ef13c4b5dff9ce967bde.jpg\"]', '陈磊二混子签章版畅销历史图', '半小时漫画中国史全套中国史1+中国史2+中国史3+世界史套装共4册陈磊二混子签章版畅销历史图', '', '21', 688.00, 0.00, 56.00, 55.00, '件', 0, 0, 1111, 1, 0, 0, 0, 0, '<img class=\"desc_anchor\" id=\"desc-module-1\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\dcce240f4721cd52bf206fe4e321d9cd.gif\"><p>&nbsp;</p> <p>&nbsp;</p> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">  <tbody><tr align=\"center\"> <td colspan=\"4\"> <img alt=\"\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\535afb10bab8f91ef9cecd5da98d9f0d.jpg\" width=\"100%\"> </td> </tr> <tr align=\"center\"> <td> <a href=\"http://detail.tmall.com/item.htm?id=17667055232\" target=\"_blank\"><img alt=\"明朝那些事儿\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\e38419f3791914c2243da858b791c427.jpg\" width=\"100%\"></a> </td> <td> <a href=\"http://detail.tmall.com/item.htm?id=574046855971\" target=\"_blank\"><img alt=\"半小时漫画套装\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\7e0a98fc3279162624bab205ca6d3a54.jpg\" width=\"100%\"></a> </td> <td> <a href=\"http://detail.tmall.com/item.htm?id=570115049563\" target=\"_blank\"><img alt=\"观山海\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\7d289e3f874dfbbec0b7de5f1b0d4413.jpg\" width=\"100%\"></a> </td> <td> <a href=\"http://detail.tmall.com/item.htm?id=524804800825\" target=\"_blank\"><img alt=\"天才在左 疯子在右\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\457e528ac931b014f953621c155c08f0.jpg\" width=\"100%\"></a> </td> </tr> <tr align=\"center\"> <td> <a href=\"http://detail.tmall.com/item.htm?id=17724587030\" target=\"_blank\"><img alt=\"心理学与生活\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\65aaec8665cb65b17bb22e119c5e193f.jpg\" width=\"100%\"></a> </td> <td> <a href=\"http://detail.tmall.com/item.htm?id=576052195038\" target=\"_blank\"><img alt=\"郭论\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\4198b6d1a2e878437df5c350689c462c.jpg\" width=\"100%\"></a> </td> <td> <a href=\"http://detail.tmall.com/item.htm?id=17560355736\" target=\"_blank\"><img alt=\"史记\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\3ac7b5f3d8587399c302d683941df227.jpg\" width=\"100%\"></a> </td> <td> <a href=\"http://detail.tmall.com/item.htm?id=525294593377\" target=\"_blank\"><img alt=\"诗经\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\59f3ec12665295807bfb8fc18d41a1bd.jpg\" width=\"100%\"></a> </td> </tr> <tr align=\"center\"> <td> <a href=\"http://detail.tmall.com/item.htm?id=575636483079\" target=\"_blank\"><img alt=\"全球通史\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\ed2e5a12ea08d78f70b9d9813b4f3393.jpg\" width=\"100%\"></a> </td> <td> <a href=\"http://detail.tmall.com/item.htm?id=537883697610\" target=\"_blank\"><img alt=\"古文观止\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\db5bbadb569ed4866bf4f6e7c9f43120.jpg\" width=\"100%\"></a> </td> <td> <a href=\"http://detail.tmall.com/item.htm?id=22220387969\" target=\"_blank\"><img alt=\"这个历史挺靠谱\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\2f6fc591d88609abe4b39d48427ed4d8.jpg\" width=\"100%\"></a> </td> <td> <a href=\"http://detail.tmall.com/item.htm?id=572511510692\" target=\"_blank\"><img alt=\"陈果套装\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\40dc91499c6602995e30fbfd8e68d846.jpg\" width=\"100%\"></a> </td> </tr>  </tbody></table><img class=\"desc_anchor\" id=\"desc-module-2\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\dcce240f4721cd52bf206fe4e321d9cd.gif\"><p><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\da56549f28222129a122335fdbd2a98d.jpg\"></p><p><b>编辑推荐：</b></p><p><b></b>&nbsp;</p><p><span>◆《半小时漫画中国史》系列是</span><span>300</span><span>万粉丝大号“混子曰</span><span>”</span><span>创始人陈磊（笔名：二混子）推出的全新作品！</span></p><p><span>◆看半小时漫画，通三千年历史，用漫画解读历史，开启读史新潮流！</span></p><p><span>◆《半小时漫画中国史》其实是一本严谨的极简中国史！东周列国是个班级，大秦过把瘾就死，楚汉之争八卦多……</span></p><p><span>◆《半小时漫画中国史</span><span>2</span><span>》其实是一本严谨的极简中国史！高潮迭起的大汉王朝，群雄逐鹿的三国时代，恣意奔放的魏晋风度……</span></p><p><span>◆《半小时漫画中国史</span><span>3</span><span>》其实是一本严谨的极简中国史！盛产奇葩皇帝的南北朝，草根英雄辈出的隋朝，剧情惊险的大唐盛世……</span></p><p><span>◆《半小时漫画世界史》其实是一本严谨的极简世界史！简到崩溃的极简欧洲史、美国往事三部曲、一口气就能读完的日本史……</span></p><p><span>◆作者曾获前央视主持人、热播网综《奇葩说》导师张泉灵鼎力推荐！</span></p><p><span>◆《半小时漫画中国史》系列内容摘选自公众号旗下的</span><span>Stone</span><span>历史剧栏目，该栏目累计阅读量高达</span><span>3</span><span>亿，平均阅读量为</span><span>60</span><span>万</span></p><p><span>◆</span><span>每一页都有历史段子，每三秒让你笑翻一次，而你在笑出腹肌的同时，不知不觉已经通晓历史。</span></p><p>&nbsp;</p><p><b><span>媒体评论：</span></b></p><p><b></b><span style=\"color: #000000;\"><span style=\"\">☆&nbsp;</span><span style=\"\">《半小时漫画世界史》是以幽默诙谐、略带调侃的方式写成的，十分有趣，但细读下来，其中的内容却是真实、严谨的，并非戏说；这是一本极简版的世界史……特别适合年轻人阅读。</span></span><span></span></p><p align=\"right\" style=\"list-style-type: none;border: 0.0px;color: #656565;\"><span style=\"color: #000000;\"><b>——复旦大学历史学系教授</b><b>&nbsp;</b><b>向荣</b><b>&nbsp;</b></span></p><p style=\"list-style-type: none;border: 0.0px;color: #656565;\"><span style=\"color: #000000;\">☆&nbsp;有一个微信公众号叫“混子曰”，创作者叫二混子，他写历史类的分析，画画，有稳定的内容生产，是一个流量极高的平台。</span></p><p align=\"right\" style=\"list-style-type: none;border: 0.0px;color: #656565;\"><span style=\"color: #000000;\"><b>——</b><b>前央视主持人、热播网综《奇葩说》导师张泉灵</b><b>&nbsp;</b></span></p><p style=\"list-style-type: none;border: 0.0px;color: #656565;\"><span style=\"color: #000000;\"><span style=\"\">☆&nbsp;</span>重要的是画风。他的画看着很舒服，图文配的也很好笑。像暴走漫画这种就只是好笑。听说这个号拿了张泉灵的投资，我颇为遗憾自己动作太慢。</span></p><p align=\"right\" style=\"list-style-type: none;border: 0.0px;color: #656565;\"><span style=\"color: #000000;\">——<b>著名投资人魏武挥</b><b>&nbsp;</b></span></p><p align=\"left\" style=\"list-style-type: none;border: 0.0px;color: #656565;\"><span style=\"color: #000000;\"><span style=\"\">☆&nbsp;</span>“混子曰”的漫画没有拗口难认的词汇，没有刻意卖弄的文采，关注的点恰好是大众想知道的，就像真有人拿着漫画给你讲故事。</span></p><p align=\"right\" style=\"list-style-type: none;border: 0.0px;color: #656565;\"><span style=\"color: #000000;\"><b>——</b><b>《南方人物周刊》</b></span></p><p align=\"left\" style=\"list-style-type: none;border: 0.0px;color: #656565;\"><span style=\"color: #000000;\"><span style=\"\">☆&nbsp;</span>如果你关注混子哥的公众号（公众号名：混子曰），那些深入浅出、遍地铺梗的漫画一定让你过目不忘。漫画本身能吸引人已是难得，还能用这样的漫画来讲清楚一个知识，实在让人有些惊喜。</span></p><p align=\"right\" style=\"list-style-type: none;border: 0.0px;color: #656565;\"><span style=\"color: #000000;\"><b>——</b><b>樊登读书会</b></span></p><p align=\"left\" style=\"list-style-type: none;border: 0.0px;color: #656565;\"><span style=\"color: #000000;\"><span style=\"\">☆&nbsp;</span>这一系列漫画吸引人的地方在于，一方面讲的是高冷的知识，另一方面，它们又无一例外都穿上了一层“搞笑幽默”的外衣。原本枯燥、生涩的知识由此变得生动，也更彰显了传播的力量。陈磊将它们串起来，以此讲解枯燥的历史、深奥的科学、备受关注的时政新闻，让一个个高冷知识变成好玩的故事、好笑的段子。</span></p><p align=\"right\" style=\"list-style-type: none;border: 0.0px;color: #656565;\"><span style=\"color: #000000;\"><b>——</b><b>环球人物网</b></span></p><p align=\"left\" style=\"list-style-type: none;border: 0.0px;color: #656565;\"><span style=\"color: #000000;\"><span style=\"\">☆&nbsp;</span>“混子曰”的内容要么涉及历史，要么是对时事新闻的解读，可以简单地总结为，都是“学渣”不愿意看的那些话题。但被陈磊（笔名：二混子）转变为漫画后，硬知识软了很多，加上他的插科打诨，硬知识不再面目可憎，甚至变得老少咸宜、高低通吃。</span></p><p align=\"right\" style=\"list-style-type: none;border: 0.0px;color: #656565;\"><span style=\"color: #000000;\"><b>——</b><b>《新民周刊》</b></span></p><p></p><img class=\"desc_anchor\" id=\"desc-module-3\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\dcce240f4721cd52bf206fe4e321d9cd.gif\"><p><b>目录：</b></p><p><span>《半小时漫画中国史》</span></p><p><span>作者自序<span>/</span>Ⅰ</span></p><p><span>第一章：如果东周列国是一个班级，这事儿就好理解了（一）</span></p><p><span>第二章：如果东周列国是一个班级，这事儿就好理解了（二）</span></p><p><span>第三章：如果东周列国是一个班级，这事儿就好理解了（假期篇）</span></p><p><span>第四章：如果东周列国是一个班级，这事儿就好理解了（三）</span></p><p><span>第五章：如果东周列国是一个班级，这事儿就好理解了（四）</span></p><p><span>第六章：端午节你到底关心过人家屈大夫没</span></p><p><span>第七章：大秦帝国：过把瘾就死</span></p><p><span>第八章：楚汉之争（上）——败家子坑爹不求人，包工头怒掀造反潮</span></p><p><span>第九章：楚汉之争（下）——大哥刘三丢节操，楚霸王三犯傲娇</span></p><p><span>第十章：楚汉之争（八卦篇上）：张良、萧何、韩信——一个好汉三个帮</span></p><p><span>第十一章：楚汉之争（八卦篇下）——邦女郎之</span></p><p>&nbsp;</p><p><span>《半小时漫画中国史<span>2</span>》</span></p><p><span>一、大汉王朝之西汉流水账</span></p><p><span>二、大汉王朝之王莽篡汉</span></p><p><span>三、大汉王朝之东汉故事</span></p><p><span>四、大汉王朝之西域篇</span></p><p><span>五、三国之前戏要做足</span></p><p><span>六、三国之三大战役（上）</span></p><p><span>七、三国之三大战役（下）</span></p><p><span>八、三国之哪儿来的东风</span></p><p><span>九、两晋之西晋有点乱</span></p><p><span>十、两晋之五胡入华</span></p><p><span>十一、两晋之东晋真纠结</span></p><p><span>十二、两晋之魏晋奇葩说</span></p><p>&nbsp;</p><p><span>《半小时漫画中国史<span>3</span>》</span></p><p><span>一、南北朝里多败家</span></p><p><span>二、隋朝二人传</span></p><p><span>三、隋唐英雄传</span></p><p><span>四、隋唐英雄外传之“学好数理化，不怕李元霸”</span></p><p><span>五、贞观开门红</span></p><p><span>六、武则天升职记</span></p><p><span>七、唐玄宗的抛物线</span></p><p><span>八、大唐就这么挂了</span></p><p><span>九、大唐盛世番外篇——大唐长安城，怎么这么大！</span></p><p><span>十、大唐盛世番外篇——李白传</span></p><p>&nbsp;</p><p><span>《半小时漫画世界史》</span></p><p><span>1.&nbsp;</span><span>简到崩溃的欧洲史（一）：希腊<span>&amp;</span>罗马</span></p><p><span>2.&nbsp;</span><span>简到崩溃的欧洲史（二）：黑暗的中世纪</span></p><p><span>3.&nbsp;</span><span>简到崩溃的欧洲史（三）：下海的欧洲</span></p><p><span>4.&nbsp;</span><span>屏幕中的历史——《斯巴达<span>300</span>勇士》（上）</span></p><p><span>5.&nbsp;</span><span>屏幕中的历史——《斯巴达<span>300</span>勇士》（下）</span></p><p><span>6.&nbsp;</span><span>十字军东征之三大骑士团</span></p><p><span>7.&nbsp;</span><span>真正的加勒比海盗</span></p><p><span>8.&nbsp;</span><span>美国往事（一）：独立战争</span></p><p><span>9.&nbsp;</span><span>美国往事（二）：南北战争</span></p><p><span>10.</span><span>美国往事（三）：上帝保佑美国</span></p><p><span>11.</span><span>一口气读完日本史</span></p><img class=\"desc_anchor\" id=\"desc-module-4\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\dcce240f4721cd52bf206fe4e321d9cd.gif\"><p><b>在线试读：</b></p><p><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\b10b452b02017cbfd43693b332bb50e7.jpg\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\7b2e0d5f4d4b3081f52982348c987282.jpg\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\be7d9f5ffb076fff31da96963e12e107.jpg\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\4494761c089005d3d6d5877cdbb3fa83.jpg\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\61ca4d17a425e841fc2099fb2780bbd6.jpg\"><img align=\"absmiddle\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\c527c7a597186e46a1f179e3a447a7b9.jpg\"></p><img class=\"desc_anchor\" id=\"desc-module-5\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\dcce240f4721cd52bf206fe4e321d9cd.gif\"><p><b>内容简介：</b></p><p>&nbsp;</p><p><span>看半小时漫画，通<span>五千</span>年历史，用漫画解读历史，开启读史新潮流（《半小时漫画中国史</span><span>3</span><span>》是《半小时漫画中国史》系列书的第</span><span>3</span><span>部）。</span></p><p><span>仅仅通过手绘和段子，陈磊（二混子）就捋出清晰的历史大脉络：春秋战国像个班级；大秦过把瘾就死；三国就三大战役；魏晋乱世多奇葩；南北朝里多败家；大唐盛世开门红……掀开纷繁复杂的历史表象，略去无关紧要的细枝末节，每一页都有历史段子，每三秒让你笑翻一次，而手绘的帝王将相则是又贱又蠢萌：秦皇、汉武、唐宗、宋祖、曹操、孙权，全都和你我一样，有优点和缺陷，有朋友和敌人，他们在历史关键节点迸发出的惊人能量铸就了<span>五千</span>年的精彩中国史。</span></p><p><span>而你在笑出腹肌的同时，不知不觉已经通晓了历史。</span></p><img class=\"desc_anchor\" id=\"desc-module-6\" src=\"http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\dcce240f4721cd52bf206fe4e321d9cd.gif\"><p><b>作者简介：</b></p><p><b></b></p><p><b><span>陈磊（笔名：二混子）</span></b></p><p><span>80</span><span>后，</span><span>300</span><span>万粉丝大号“混子曰”创始人，原为上汽集团旗下设计师，</span><span>2017</span><span>年度新锐作家、年度挚爱阅读大使，“混子曰”公众号下的“</span><span>Stone</span><span>历史剧”栏目，目前所发的所有文章平均阅读量为</span><span>60</span><span>万，累计点击量高达</span><span>3</span><span>亿次。其爆笑又富有创意的手绘形象和历史段子，深受</span><span>90</span><span>后、</span><span>00</span><span>后等年轻群体的喜爱。前央视主持人、热播网综《奇葩说》导师张泉灵鼎力推荐，是开创了另一种写史方式的历史作者。</span></p><p>&nbsp;</p><p>&nbsp;</p>', 1569133490, 0, 0, 0, 56.00, 55.00, 0, NULL, 58, 0, '', '', 'https://detail.tmall.com/item.htm?spm=a230r.1.14.30.60bb670apU589r&id=574046855971&ns=1&abbucket=5', 0, '哈哈哈', '中国建设');
INSERT INTO `eb_store_product` VALUES (17, 0, 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\e43b98f2d37effee55ba4307560f3c7f.jpg', '[\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\22\\\\\\\\e43b98f2d37effee55ba4307560f3c7f.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\22\\\\\\\\b1798ed2d6b5b9c75bf7fa11703a3201.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\22\\\\\\\\52bfe48235afd1b0a881c35714542aa1.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\22\\\\\\\\6fc0efdc9a7582d3552279f375a9428d.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\22\\\\\\\\0fc890ce7262d25f5ab51c30c48abb16.jpg\"]', '平凡的世界+人间失格 全三册精装 路遥原著全套全集中国当代改', '平凡的世界+人间失格 全三册精装 路遥原著全套全集中国当代小说读物 茅盾文学奖经典文学小说书籍畅销小说八年级推荐读物正版包邮', '', '25', 552.00, 0.00, 680.00, 55.00, '件', 0, 2, 5553, 1, 0, 0, 0, 0, '(function(win,key){win[key]=window[key]||{};win[key].cdnPath=\'https://g.alicdn.com/sd/baxia/1.0.5/\';win[key].punishPath={[\'https://dscnew.taobao.com/i8/580/480/580480324313/TB1poYNckL0gK0jSZFt8qtQCXla.desc%7Cvar%5Edesc%3Bsign%5E857d0cecdcfa41f8cf4a50627e12791f%3Blang%5Egbk%3Bt%5E1568164077\']:\'https://login.taobao.com/member/login.jhtml?style=mini&amp;from=sm&amp;full_redirect=false&amp;redirectURL=http%3a%2f%2fdscnew.taobao.com/i8/580/480/580480324313/TB1poYNckL0gK0jSZFt8qtQCXla.desc%7Cvar%5Edesc%3Bsign%5E857d0cecdcfa41f8cf4a50627e12791f%3Blang%5Egbk%3Bt%5E1568164077/_____tmd_____/punish%3fx5secdata=5e0c8e1365474455070961b803bd560607b52cabf5960afff39b64ce58073f7828fec592a01b892e1b4d0c7354ac35e07dc8af3703187d6d64561402b1c87a3cae05d6a084e26e17fce6f28abaf9fc951746941a5f9f2cad199100251a84b0be151b80741e83f64c4b6c6a150f3eaeae9e635d8dcb83ccf9f83b243de01fd3f0a6f2df022864aa79b62ef935e55d40374b9bbf3baad51d87d38b8d88a35ce8d2283160a4b6916800cbeb80abf145f4d10ddce1c82e11cb9c9ed44f310d966128bd2915cdc82a3b3ca099d73df82c7f7c3828bc2c059b1fbc876d4589972fc43cafb3f59c461c51b8d9da168f0e68f989f689bd9bf8c694f31c3823b70f048e4cdcc405e8e5d65553d6f92f919aa5ab2246fabac8e27bc6ec8d92390e192c8fd9cabd2e64668bb098612cd0cb855eb709e20db59433350681070d3d8259b6702420bc2079d80bb9f79e6f69c7c441da1c38fc9f3c1a16be5005d113cfad7d6d63d4a031bbdf9603fd1114d3d34f44660b62bb2cf4b13e49931ace09c5fbf43ef644702f69ebc7155120dfabd689ce8ecfd4e366c3a721e150a0025783b8943592212d64a40a5480d2809466c10cfdd6a5005fd2cb27bed19d5ea9bede4c7939b80409aa397216d0018cb02af6d7122cd841a7e468e263adfcd41e672a8b8fe44f0c72d2abd04b75870139503fe2cc6dc911910cd70f36e7bc21297e57dfd64bb13123cecd72a2c0fbe78d44e02dc747d4bfec2900ad20df5c2feda956ce3fbf30299647ac7188c53f574d18e066ac3dcc5d9a678964b11679bf2531504047e854%26x5step=100\'};})(window,\"__baxia__\");!function(){\"use strict\";var e=window,n=function(n,t){return(e.__baxia__||{})[n]||t},t=function(n,t){e.__baxia__=e.__baxia__||{},e.__baxia__[n]=t},r=location,a=document,o=function(e){var n=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:1,t=arguments.length&gt;2&amp;&amp;void 0!==arguments[2]?arguments[2]:1;if(!(t&gt;0&amp;&amp;Math.random()&gt;=t)){var o={code:n,msg:(e+\"\").substr(0,1e3)+\";v:1.0.3-beta1\",pid:\"baxia\",page:r.href.split(/[#?]/)[0],query:r.search.substr(1),hash:r.hash,referrer:a.referrer,title:a.title,ua:navigator.userAgent};console&amp;&amp;console.error(e),function(e,n){var t=[];for(var r in e)t.push(r+\"=\"+encodeURIComponent(e[r]));(new Image).src=n+t.join(\"&amp;\")}(o,\"//gm.mmstat.com/fsp.1.1?\")}};var i=document,s=document;({init:function(){this.punishPath=n(\"punishPath\",{}),t(\"punishPath\",\"\"),this.listenOnLoad()},getCurrentScript:function(){if(s.currentScript)return s.currentScript;for(var e=s.getElementsByTagName(\"script\"),n=\"\",t=e.length-1;t&gt;=0;t--)if(this.punishPath[e[t].src])return n=e[t];return n},updatejQueryEvent:function(e,n,t){window.jQuery&amp;&amp;(window.jQuery.event.triggered=n,t&amp;&amp;window.jQuery(e).trigger(t))},getHandlerPath:function(e,t){return t.jsPath?t.jsPath:\"\"+n(\"cdnPath\",\"https://g.alicdn.com/sd/baxia/1.0.3/\")+e+\".js\"},listenOnLoad:function(){var e=this.getCurrentScript();this.updatejQueryEvent(\"\",\"load\");var n=e.onreadystatechange||e.onload,t=this;e.onload=function(){var e=this;this.onload=this.onreadystatechange=null,t.handler(\"Jsonp\",{result:{rgv587_flag:\"sm\",url:t.punishPath[this.src]},config:{url:this.src,done:function(){console.log(\"request.done();\"),e.readyState=\"loaded\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"load\")},fail:function(){console.log(\"request.fail();\"),e.readyState=\"error\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"error\")}}})}},handler:function(){var e=arguments.length&gt;0&amp;&amp;void 0!==arguments[0]?arguments[0]:\"Xhr\",r=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:{},a=n(\"pluginInstance\",null),s=n(\"handlerQueue\",[]);try{if(a)return a.handler(r);s.push({pluginName:e,props:r});var u=s[0],l=u.pluginName,c=u.props,d=\"baxia\"+l+\"Handler\",h=this.getHandlerPath(d,c);t(\"handlerQueue\",s),function(e,n,t){var r=i.getElementsByTagName(\"script\")[0],a=i.createElement(\"script\");if(a.async=1,a.src=e,a.onerror=function(n){o(\"function:loadJS. msg:\"+e+\"load error。props：\"+JSON.stringify(t)),a.onerror=null},n){var s=!1;a.onload=a.onreadystatechange=function(){s||a.readyState&amp;&amp;!/loaded|complete/.test(a.readyState)||(a.onload=a.onreadystatechange=null,s=!0,n())}}r.parentNode.insertBefore(a,r)}(h,function(){s=n(\"handlerQueue\",[]),a=new window[d];for(var e=0;e', 1569133646, 0, 0, 0, 55.00, 55.00, 0, NULL, 555, 0, '', '', 'https://detail.tmall.com/item.htm?spm=a230r.1.14.12.60bb670apU589r&id=580480324313&cm_id=140105335569ed55e27b&abbucket=5', 0, '三毛', '嘿嘿嘿工厂');
INSERT INTO `eb_store_product` VALUES (18, 0, 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\f961bf5d14ba43467cc8db4367f2e906.jpg', '[\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\22\\\\\\\\f961bf5d14ba43467cc8db4367f2e906.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\22\\\\\\\\b42bd261e9d60ff1ea918284d8525f82.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\22\\\\\\\\edf62b663a54aec64270855c25889c9b.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\22\\\\\\\\0b4ad201dc0aabf726060065c6e63b0b.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\22\\\\\\\\5d54a012e42eb0f6dc0482e7ae4f1f1c.jpg\"]', '书籍人性的弱点+鬼谷子+墨菲定律+狼道+羊皮卷受益一生的五本书卡耐基全集优点励志成功图书', '书籍人性的弱点+鬼谷子+墨菲定律+狼道+羊皮卷受益一生的五本书卡耐基全集优点励志成功图书', '', '26', 141.00, 0.00, 1247.00, 414.00, '件', 0, 0, 4111, 1, 0, 0, 0, 0, '(function(win,key){win[key]=window[key]||{};win[key].cdnPath=\'https://g.alicdn.com/sd/baxia/1.0.5/\';win[key].punishPath={[\'https://dscnew.taobao.com/i3/590/421/590428245179/TB1_Dydfp67gK0jSZPf8quhhFla.desc%7Cvar%5Edesc%3Bsign%5Ee2801dbfe82aeb85f2ec1e73c53edece%3Blang%5Egbk%3Bt%5E1567999233\']:\'https://login.taobao.com/member/login.jhtml?style=mini&amp;from=sm&amp;full_redirect=false&amp;redirectURL=http%3a%2f%2fdscnew.taobao.com/i3/590/421/590428245179/TB1_Dydfp67gK0jSZPf8quhhFla.desc%7Cvar%5Edesc%3Bsign%5Ee2801dbfe82aeb85f2ec1e73c53edece%3Blang%5Egbk%3Bt%5E1567999233/_____tmd_____/punish%3fx5secdata=5e0c8e1365474455070961b803bd560607b52cabf5960afff39b64ce58073f7828fec592a01b892e1b4d0c7354ac35e07dc8af3703187d6d64561402b1c87a3cae05d6a084e26e17fce6f28abaf9fc951746941a5f9f2cad199100251a84b0be151b80741e83f64c4b6c6a150f3eaeae36f2aa54e9d3afceb71632e0747404155f31998903b61934f7ddcae080f1f7ab57fb0835517b4880a0a006a27fedc597283160a4b6916800cbeb80abf145f4d10ddce1c82e11cb9c9ed44f310d966128bd2915cdc82a3b3ca099d73df82c7f7c3828bc2c059b1fbc876d4589972fc43cafb3f59c461c51b8d9da168f0e68f989f689bd9bf8c694f31c3823b70f048e4cdcc405e8e5d65553d6f92f919aa5ab2246fabac8e27bc6ec8d92390e192c8fd9cabd2e64668bb098612cd0cb855eb709e20db59433350681070d3d8259b6702420bc2079d80bb9f79e6f69c7c441da1c38fc9f3c1a16be5005d113cfad7d6d633a5e55dfbcda3919e036f775a717a4574507534bf6b0b72c251aa22d3350b019d30518b980c4fa2fbbdfe9317c922718d3384c9b5242d29c9f76e0a534546098212d64a40a5480d2809466c10cfdd6a5794e8259ddf5be1dd74a501db639ea0cc8dd80155c6a39bd6707a3829be1eaf29cf1783b7087862e5666a4d78c3d103cde51bd5958feb0fb80fb3e6ead920048b26812055268990e4825036b46fdad193123cecd72a2c0fbe78d44e02dc747d4bfec2900ad20df5c2feda956ce3fbf30dec357f85e028d0b1c8c96b9c4b2a5085d9a678964b11679bf2531504047e854%26x5step=100\'};})(window,\"__baxia__\");!function(){\"use strict\";var e=window,n=function(n,t){return(e.__baxia__||{})[n]||t},t=function(n,t){e.__baxia__=e.__baxia__||{},e.__baxia__[n]=t},r=location,a=document,o=function(e){var n=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:1,t=arguments.length&gt;2&amp;&amp;void 0!==arguments[2]?arguments[2]:1;if(!(t&gt;0&amp;&amp;Math.random()&gt;=t)){var o={code:n,msg:(e+\"\").substr(0,1e3)+\";v:1.0.3-beta1\",pid:\"baxia\",page:r.href.split(/[#?]/)[0],query:r.search.substr(1),hash:r.hash,referrer:a.referrer,title:a.title,ua:navigator.userAgent};console&amp;&amp;console.error(e),function(e,n){var t=[];for(var r in e)t.push(r+\"=\"+encodeURIComponent(e[r]));(new Image).src=n+t.join(\"&amp;\")}(o,\"//gm.mmstat.com/fsp.1.1?\")}};var i=document,s=document;({init:function(){this.punishPath=n(\"punishPath\",{}),t(\"punishPath\",\"\"),this.listenOnLoad()},getCurrentScript:function(){if(s.currentScript)return s.currentScript;for(var e=s.getElementsByTagName(\"script\"),n=\"\",t=e.length-1;t&gt;=0;t--)if(this.punishPath[e[t].src])return n=e[t];return n},updatejQueryEvent:function(e,n,t){window.jQuery&amp;&amp;(window.jQuery.event.triggered=n,t&amp;&amp;window.jQuery(e).trigger(t))},getHandlerPath:function(e,t){return t.jsPath?t.jsPath:\"\"+n(\"cdnPath\",\"https://g.alicdn.com/sd/baxia/1.0.3/\")+e+\".js\"},listenOnLoad:function(){var e=this.getCurrentScript();this.updatejQueryEvent(\"\",\"load\");var n=e.onreadystatechange||e.onload,t=this;e.onload=function(){var e=this;this.onload=this.onreadystatechange=null,t.handler(\"Jsonp\",{result:{rgv587_flag:\"sm\",url:t.punishPath[this.src]},config:{url:this.src,done:function(){console.log(\"request.done();\"),e.readyState=\"loaded\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"load\")},fail:function(){console.log(\"request.fail();\"),e.readyState=\"error\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"error\")}}})}},handler:function(){var e=arguments.length&gt;0&amp;&amp;void 0!==arguments[0]?arguments[0]:\"Xhr\",r=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:{},a=n(\"pluginInstance\",null),s=n(\"handlerQueue\",[]);try{if(a)return a.handler(r);s.push({pluginName:e,props:r});var u=s[0],l=u.pluginName,c=u.props,d=\"baxia\"+l+\"Handler\",h=this.getHandlerPath(d,c);t(\"handlerQueue\",s),function(e,n,t){var r=i.getElementsByTagName(\"script\")[0],a=i.createElement(\"script\");if(a.async=1,a.src=e,a.onerror=function(n){o(\"function:loadJS. msg:\"+e+\"load error。props：\"+JSON.stringify(t)),a.onerror=null},n){var s=!1;a.onload=a.onreadystatechange=function(){s||a.readyState&amp;&amp;!/loaded|complete/.test(a.readyState)||(a.onload=a.onreadystatechange=null,s=!0,n())}}r.parentNode.insertBefore(a,r)}(h,function(){s=n(\"handlerQueue\",[]),a=new window[d];for(var e=0;e', 1569133700, 0, 0, 0, 41.00, 414.00, 0, NULL, 55, 0, '', '', 'https://detail.tmall.com/item.htm?spm=a230r.1.14.6.60bb670apU589r&id=590428245179&cm_id=140105335569ed55e27b&abbucket=5', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (19, 0, 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\26\\\\c017e27391b3618bb1c68b644e6b6e7e.jpg', '[\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\26\\\\\\\\c017e27391b3618bb1c68b644e6b6e7e.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\26\\\\\\\\5d5dd2d173500f6ce87a50de12bc071b.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\26\\\\\\\\fabf74b7a333946a914f0a57606b6578.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\26\\\\\\\\1c30a6100190a31e6189fbf93134b314.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\26\\\\\\\\b43b3913aaff174c917733a4d36da3e1.jpg\"]', '抖音热门10册 所谓情商高就是会说话别输在不会表达上说话心理学跟任何人都聊得来人际交往提高情商聊天术的全', '抖音热门10册 所谓情商高就是会说话别输在不会表达上说话心理学跟任何人都聊得来人际交往提高情商聊天术的全', '', '25,2', 22.00, 0.00, 56.00, 10.00, '件', 0, 0, 888888, 1, 0, 0, 0, 0, '(function(win,key){win[key]=window[key]||{};win[key].cdnPath=\'https://g.alicdn.com/sd/baxia/1.0.5/\';win[key].punishPath={[\'https://dscnew.taobao.com/i8/560/260/563265651268/TB1sZq2aF67gK0jSZPf8quhhFla.desc%7Cvar%5Edesc%3Bsign%5E231a5431827499fd305cbba97db18fe6%3Blang%5Egbk%3Bt%5E1568189285\']:\'https://login.taobao.com/member/login.jhtml?style=mini&amp;from=sm&amp;full_redirect=false&amp;redirectURL=http%3a%2f%2fdscnew.taobao.com/i8/560/260/563265651268/TB1sZq2aF67gK0jSZPf8quhhFla.desc%7Cvar%5Edesc%3Bsign%5E231a5431827499fd305cbba97db18fe6%3Blang%5Egbk%3Bt%5E1568189285/_____tmd_____/punish%3fx5secdata=5e0c8e1365474455070961b803bd560607b52cabf5960afff39b64ce58073f7828fec592a01b892e1b4d0c7354ac35e07dc8af3703187d6d64561402b1c87a3cae05d6a084e26e17fce6f28abaf9fc951746941a5f9f2cad199100251a84b0be151b80741e83f64c4b6c6a150f3eaeae5923458ca4a857bdbc2d40c139234bbd996d05c3ba3e7f3879a1d81856ebd4adbda446fed80a9ea72af470e6a15959edb49040bd56b2d6dd6f4610f66449f67eeb3ff7a3d06dd696fd84a55b25f3fdedf997c321f6d2cf4cdb81279f6c6cf98371b487a14d557b403c7b03ca136d27308b06cf3207fb4622cadb23ac5d92e12dbfcc508cd27518b3557b9baec779a869de74a91c129ec8c599b75aaa730c23a74c064a42424fa07de3912d37fe56189e1ef6064a3134649e8032b2082dd627fcbc7cd120e099f264b89ef507d142d0cf5909e63ca4664d5b19b12f235089b95a9793d1351dd4abfd5bba08dd4bf0b3b94c87f478ee854b8d4fd132ce2071f620bac468436d14f3366b43122ebc34f466469ba681383f88e5a4bbf4a12db075375b67f78608576d48cd2b02bedb1cb05dca307446a0600f8111505209e5465cda77e28d2c2bce7e7030698f9d285be7d1d82bd128d91f8e9bc06c757ab15c1d077430ccdb52915e2d650db3a7d49a56351d8e651d3be00ccd56d3454596d9e69f2e13d19ab182a47cbed3cd01db38aa9104f19d0cb94899c0782326c370451ed4%26x5step=100\'};})(window,\"__baxia__\");!function(){\"use strict\";var e=window,n=function(n,t){return(e.__baxia__||{})[n]||t},t=function(n,t){e.__baxia__=e.__baxia__||{},e.__baxia__[n]=t},r=location,a=document,o=function(e){var n=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:1,t=arguments.length&gt;2&amp;&amp;void 0!==arguments[2]?arguments[2]:1;if(!(t&gt;0&amp;&amp;Math.random()&gt;=t)){var o={code:n,msg:(e+\"\").substr(0,1e3)+\";v:1.0.3-beta1\",pid:\"baxia\",page:r.href.split(/[#?]/)[0],query:r.search.substr(1),hash:r.hash,referrer:a.referrer,title:a.title,ua:navigator.userAgent};console&amp;&amp;console.error(e),function(e,n){var t=[];for(var r in e)t.push(r+\"=\"+encodeURIComponent(e[r]));(new Image).src=n+t.join(\"&amp;\")}(o,\"//gm.mmstat.com/fsp.1.1?\")}};var i=document,s=document;({init:function(){this.punishPath=n(\"punishPath\",{}),t(\"punishPath\",\"\"),this.listenOnLoad()},getCurrentScript:function(){if(s.currentScript)return s.currentScript;for(var e=s.getElementsByTagName(\"script\"),n=\"\",t=e.length-1;t&gt;=0;t--)if(this.punishPath[e[t].src])return n=e[t];return n},updatejQueryEvent:function(e,n,t){window.jQuery&amp;&amp;(window.jQuery.event.triggered=n,t&amp;&amp;window.jQuery(e).trigger(t))},getHandlerPath:function(e,t){return t.jsPath?t.jsPath:\"\"+n(\"cdnPath\",\"https://g.alicdn.com/sd/baxia/1.0.3/\")+e+\".js\"},listenOnLoad:function(){var e=this.getCurrentScript();this.updatejQueryEvent(\"\",\"load\");var n=e.onreadystatechange||e.onload,t=this;e.onload=function(){var e=this;this.onload=this.onreadystatechange=null,t.handler(\"Jsonp\",{result:{rgv587_flag:\"sm\",url:t.punishPath[this.src]},config:{url:this.src,done:function(){console.log(\"request.done();\"),e.readyState=\"loaded\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"load\")},fail:function(){console.log(\"request.fail();\"),e.readyState=\"error\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"error\")}}})}},handler:function(){var e=arguments.length&gt;0&amp;&amp;void 0!==arguments[0]?arguments[0]:\"Xhr\",r=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:{},a=n(\"pluginInstance\",null),s=n(\"handlerQueue\",[]);try{if(a)return a.handler(r);s.push({pluginName:e,props:r});var u=s[0],l=u.pluginName,c=u.props,d=\"baxia\"+l+\"Handler\",h=this.getHandlerPath(d,c);t(\"handlerQueue\",s),function(e,n,t){var r=i.getElementsByTagName(\"script\")[0],a=i.createElement(\"script\");if(a.async=1,a.src=e,a.onerror=function(n){o(\"function:loadJS. msg:\"+e+\"load error。props：\"+JSON.stringify(t)),a.onerror=null},n){var s=!1;a.onload=a.onreadystatechange=function(){s||a.readyState&amp;&amp;!/loaded|complete/.test(a.readyState)||(a.onload=a.onreadystatechange=null,s=!0,n())}}r.parentNode.insertBefore(a,r)}(h,function(){s=n(\"handlerQueue\",[]),a=new window[d];for(var e=0;e', 1569474863, 0, 0, 0, 666.00, 100.00, 0, NULL, 68, 0, '', '', 'https://detail.tmall.com/item.htm?id=563265651268&ali_trackid=2:mm_26632674_401600231_107330400096:1569474764_213_480966831&spm=a231o.7712113/g.1004.423&pvid=200_11.27.128.48_4666_1569474749193', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (20, 0, 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\27\\\\f9c97c89a1019083c4a81f168a1f4d34.jpg', '[\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\27\\\\\\\\f9c97c89a1019083c4a81f168a1f4d34.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\27\\\\\\\\fb03e941eb06e3960c046b45ba6df08c.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\27\\\\\\\\b7aeeec2ab41789ec92609b74d795c2e.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\27\\\\\\\\bafbae3b007ca2a242210516abd867b5.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\27\\\\\\\\59bd99a64639700434a027779bffbde0.jpg\"]', 'Lenovo/联想拯救者Y7000游戏笔记本四核手款酷睿i5吃鸡游戏本P', 'Lenovo/联想拯救者Y7000游戏笔记本四核手提电脑15.6英寸酷睿九代轻薄独显2019新款酷睿i5吃鸡游戏本P', '', '4', 5900.00, 0.00, 5999.00, 0.00, '件', 0, 0, 1000, 1, 0, 0, 0, 0, '(function(win,key){win[key]=window[key]||{};win[key].cdnPath=\'https://g.alicdn.com/sd/baxia/1.0.5/\';win[key].punishPath={[\'https://dscnew.taobao.com/i2/540/880/544885123221/TB1PcVVguL2gK0jSZPh8quhvXla.desc%7Cvar%5Edesc%3Bsign%5Eb6a114ff130efc55ee6e026a173b5428%3Blang%5Egbk%3Bt%5E1569394435\']:\'https://login.taobao.com/member/login.jhtml?style=mini&amp;from=sm&amp;full_redirect=false&amp;redirectURL=http%3a%2f%2fdscnew.taobao.com/i2/540/880/544885123221/TB1PcVVguL2gK0jSZPh8quhvXla.desc%7Cvar%5Edesc%3Bsign%5Eb6a114ff130efc55ee6e026a173b5428%3Blang%5Egbk%3Bt%5E1569394435/_____tmd_____/punish%3fx5secdata=5e0c8e1365474455070961b803bd560607b52cabf5960afff39b64ce58073f7828fec592a01b892e1b4d0c7354ac35e07dc8af3703187d6d64561402b1c87a3cae05d6a084e26e17fce6f28abaf9fc951746941a5f9f2cad199100251a84b0be151b80741e83f64c4b6c6a150f3eaeae4fc1fb2d33cc0fd5284e20b8eb0ddf7e3437e726742b57fab02b0221efbe409d03284be60c3b11dcef5cdb46402ae5a7b49040bd56b2d6dd6f4610f66449f67eeb3ff7a3d06dd696fd84a55b25f3fdedf997c321f6d2cf4cdb81279f6c6cf98371b487a14d557b403c7b03ca136d27308b06cf3207fb4622cadb23ac5d92e12dbfcc508cd27518b3557b9baec779a869de74a91c129ec8c599b75aaa730c23a74c064a42424fa07de3912d37fe56189e1ef6064a3134649e8032b2082dd627fcbc7cd120e099f264b89ef507d142d0cff94e7f2cc41289cd2dc5fed96d1d596e4abd395b228a18fbb6b792f5246b28d8b33a1a5ae269b183dab2fe02e3bfbe95a19e3fe57f684862aa3fd81452029c60469ba681383f88e5a4bbf4a12db07537ad77455db67952b4f9c3460393ec99b933e4c229d5f5abe2d1cddf6f24308df48fb060829558bb1ae763896da985ad39782a10eb7ad90cae3fa01ed1f3b2e7fd62027108a7572b49bd87252036b8ee3b1d8e651d3be00ccd56d3454596d9e69f2e13d19ab182a47cbed3cd01db38aa9165bc28242434586f3c582f6897706ecf%26x5step=100\'};})(window,\"__baxia__\");!function(){\"use strict\";var e=window,n=function(n,t){return(e.__baxia__||{})[n]||t},t=function(n,t){e.__baxia__=e.__baxia__||{},e.__baxia__[n]=t},r=location,a=document,o=function(e){var n=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:1,t=arguments.length&gt;2&amp;&amp;void 0!==arguments[2]?arguments[2]:1;if(!(t&gt;0&amp;&amp;Math.random()&gt;=t)){var o={code:n,msg:(e+\"\").substr(0,1e3)+\";v:1.0.3-beta1\",pid:\"baxia\",page:r.href.split(/[#?]/)[0],query:r.search.substr(1),hash:r.hash,referrer:a.referrer,title:a.title,ua:navigator.userAgent};console&amp;&amp;console.error(e),function(e,n){var t=[];for(var r in e)t.push(r+\"=\"+encodeURIComponent(e[r]));(new Image).src=n+t.join(\"&amp;\")}(o,\"//gm.mmstat.com/fsp.1.1?\")}};var i=document,s=document;({init:function(){this.punishPath=n(\"punishPath\",{}),t(\"punishPath\",\"\"),this.listenOnLoad()},getCurrentScript:function(){if(s.currentScript)return s.currentScript;for(var e=s.getElementsByTagName(\"script\"),n=\"\",t=e.length-1;t&gt;=0;t--)if(this.punishPath[e[t].src])return n=e[t];return n},updatejQueryEvent:function(e,n,t){window.jQuery&amp;&amp;(window.jQuery.event.triggered=n,t&amp;&amp;window.jQuery(e).trigger(t))},getHandlerPath:function(e,t){return t.jsPath?t.jsPath:\"\"+n(\"cdnPath\",\"https://g.alicdn.com/sd/baxia/1.0.3/\")+e+\".js\"},listenOnLoad:function(){var e=this.getCurrentScript();this.updatejQueryEvent(\"\",\"load\");var n=e.onreadystatechange||e.onload,t=this;e.onload=function(){var e=this;this.onload=this.onreadystatechange=null,t.handler(\"Jsonp\",{result:{rgv587_flag:\"sm\",url:t.punishPath[this.src]},config:{url:this.src,done:function(){console.log(\"request.done();\"),e.readyState=\"loaded\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"load\")},fail:function(){console.log(\"request.fail();\"),e.readyState=\"error\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"error\")}}})}},handler:function(){var e=arguments.length&gt;0&amp;&amp;void 0!==arguments[0]?arguments[0]:\"Xhr\",r=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:{},a=n(\"pluginInstance\",null),s=n(\"handlerQueue\",[]);try{if(a)return a.handler(r);s.push({pluginName:e,props:r});var u=s[0],l=u.pluginName,c=u.props,d=\"baxia\"+l+\"Handler\",h=this.getHandlerPath(d,c);t(\"handlerQueue\",s),function(e,n,t){var r=i.getElementsByTagName(\"script\")[0],a=i.createElement(\"script\");if(a.async=1,a.src=e,a.onerror=function(n){o(\"function:loadJS. msg:\"+e+\"load error。props：\"+JSON.stringify(t)),a.onerror=null},n){var s=!1;a.onload=a.onreadystatechange=function(){s||a.readyState&amp;&amp;!/loaded|complete/.test(a.readyState)||(a.onload=a.onreadystatechange=null,s=!0,n())}}r.parentNode.insertBefore(a,r)}(h,function(){s=n(\"handlerQueue\",[]),a=new window[d];for(var e=0;e', 1569550252, 0, 0, 0, 0.00, 4900.00, 0, NULL, 6999, 0, '', '', 'https://detail.tmall.com/item.htm?spm=a230r.1.14.13.b16d798539kM7U&id=544885123221&cm_id=140105335569ed55e27b&abbucket=5', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (21, 0, 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\86dd69a53226b09212e20d52ff81711a.jpg', '[\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\04\\\\\\\\86dd69a53226b09212e20d52ff81711a.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\04\\\\\\\\0de58398548d64a3f43f333d271a2d92.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\04\\\\\\\\a36b9208ce67f74a8ad4d767fd8ec4f7.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\04\\\\\\\\d516de444e9a20fb7728aa9c4adb4df8.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\04\\\\\\\\7520a58ff5272bd33637379da3e3bb27.jpg\"]', '国际大奖小说注音版10册小学生一二三年级课外书阅读事图书籍', '国际大奖小说注音版10册小学生一二三年级课外书阅读必读带拼音儿童故事书籍671012周岁小学生课外儿童文学读物童话故事图书籍', '222', '29', 20.00, 0.00, 22.00, 220.00, '件', 0, 0, 2222, 1, 0, 0, 0, 0, '(function(win,key){win[key]=window[key]||{};win[key].cdnPath=\'https://g.alicdn.com/sd/baxia/1.0.5/\';win[key].punishPath={[\'https://dscnew.taobao.com/i7/580/500/581506207457/TB1txcyfrH1gK0jSZFw8qw7aXla.desc%7Cvar%5Edesc%3Bsign%5E3b40bd72fe1ad80d1fe795eac236882a%3Blang%5Egbk%3Bt%5E1570159991\']:\'https://login.taobao.com/member/login.jhtml?style=mini&amp;from=sm&amp;full_redirect=false&amp;redirectURL=http%3a%2f%2fdscnew.taobao.com/i7/580/500/581506207457/TB1txcyfrH1gK0jSZFw8qw7aXla.desc%7Cvar%5Edesc%3Bsign%5E3b40bd72fe1ad80d1fe795eac236882a%3Blang%5Egbk%3Bt%5E1570159991/_____tmd_____/punish%3fx5secdata=5e0c8e1365474455070961b803bd560607b52cabf5960afff39b64ce58073f7828fec592a01b892e1b4d0c7354ac35e07dc8af3703187d6d64561402b1c87a3cae05d6a084e26e17fce6f28abaf9fc951746941a5f9f2cad199100251a84b0be151b80741e83f64c4b6c6a150f3eaeaeabbf151bdae9057ade8b55aab8d2f89f97d0725a22ba92e616a96d45d6028c70659f85da919a6b38a2244f1565410497b49040bd56b2d6dd6f4610f66449f67eeb3ff7a3d06dd696fd84a55b25f3fdedf997c321f6d2cf4cdb81279f6c6cf98371b487a14d557b403c7b03ca136d27308b06cf3207fb4622cadb23ac5d92e12dbfcc508cd27518b3557b9baec779a869de74a91c129ec8c599b75aaa730c23a74c064a42424fa07de3912d37fe56189e1ef6064a3134649e8032b2082dd627fcbc7cd120e099f264b89ef507d142d0cf2aec9f88c4bec08687ba161acbd1cee0cf9fe8425c8e3c0434e7116deead2b46deaebeded4c728995576e900af33debb560948a168f273a778a98fe2984ecb31469ba681383f88e5a4bbf4a12db07537d870bdb16f1c7026ca54f80d45633b7c6b2d964740b980d129282233c95badd88393665f0a2867a92995529a81b9ea54ac64cef56cb105e9ac7ae61d60019bded3c8c2a96c2724699493e0c1ddae92db1d8e651d3be00ccd56d3454596d9e69f2e13d19ab182a47cbed3cd01db38aa91c9b915ad00bd7bcd50e4649ba096809e%26x5step=100\'};})(window,\"__baxia__\");!function(){\"use strict\";var e=window,n=function(n,t){return(e.__baxia__||{})[n]||t},t=function(n,t){e.__baxia__=e.__baxia__||{},e.__baxia__[n]=t},r=location,a=document,o=function(e){var n=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:1,t=arguments.length&gt;2&amp;&amp;void 0!==arguments[2]?arguments[2]:1;if(!(t&gt;0&amp;&amp;Math.random()&gt;=t)){var o={code:n,msg:(e+\"\").substr(0,1e3)+\";v:1.0.3-beta1\",pid:\"baxia\",page:r.href.split(/[#?]/)[0],query:r.search.substr(1),hash:r.hash,referrer:a.referrer,title:a.title,ua:navigator.userAgent};console&amp;&amp;console.error(e),function(e,n){var t=[];for(var r in e)t.push(r+\"=\"+encodeURIComponent(e[r]));(new Image).src=n+t.join(\"&amp;\")}(o,\"//gm.mmstat.com/fsp.1.1?\")}};var i=document,s=document;({init:function(){this.punishPath=n(\"punishPath\",{}),t(\"punishPath\",\"\"),this.listenOnLoad()},getCurrentScript:function(){if(s.currentScript)return s.currentScript;for(var e=s.getElementsByTagName(\"script\"),n=\"\",t=e.length-1;t&gt;=0;t--)if(this.punishPath[e[t].src])return n=e[t];return n},updatejQueryEvent:function(e,n,t){window.jQuery&amp;&amp;(window.jQuery.event.triggered=n,t&amp;&amp;window.jQuery(e).trigger(t))},getHandlerPath:function(e,t){return t.jsPath?t.jsPath:\"\"+n(\"cdnPath\",\"https://g.alicdn.com/sd/baxia/1.0.3/\")+e+\".js\"},listenOnLoad:function(){var e=this.getCurrentScript();this.updatejQueryEvent(\"\",\"load\");var n=e.onreadystatechange||e.onload,t=this;e.onload=function(){var e=this;this.onload=this.onreadystatechange=null,t.handler(\"Jsonp\",{result:{rgv587_flag:\"sm\",url:t.punishPath[this.src]},config:{url:this.src,done:function(){console.log(\"request.done();\"),e.readyState=\"loaded\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"load\")},fail:function(){console.log(\"request.fail();\"),e.readyState=\"error\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"error\")}}})}},handler:function(){var e=arguments.length&gt;0&amp;&amp;void 0!==arguments[0]?arguments[0]:\"Xhr\",r=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:{},a=n(\"pluginInstance\",null),s=n(\"handlerQueue\",[]);try{if(a)return a.handler(r);s.push({pluginName:e,props:r});var u=s[0],l=u.pluginName,c=u.props,d=\"baxia\"+l+\"Handler\",h=this.getHandlerPath(d,c);t(\"handlerQueue\",s),function(e,n,t){var r=i.getElementsByTagName(\"script\")[0],a=i.createElement(\"script\");if(a.async=1,a.src=e,a.onerror=function(n){o(\"function:loadJS. msg:\"+e+\"load error。props：\"+JSON.stringify(t)),a.onerror=null},n){var s=!1;a.onload=a.onreadystatechange=function(){s||a.readyState&amp;&amp;!/loaded|complete/.test(a.readyState)||(a.onload=a.onreadystatechange=null,s=!0,n())}}r.parentNode.insertBefore(a,r)}(h,function(){s=n(\"handlerQueue\",[]),a=new window[d];for(var e=0;e', 1570192870, 0, 0, 0, 222.00, 222.00, 0, NULL, 222, 0, '', '', 'https://detail.tmall.com/item.htm?spm=a230r.1.14.48.66d44978iAh3C0&id=581506207457&ns=1&abbucket=12', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (22, 0, 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\0cf49fd935a4311371888470dfbee41f.jpg', '[\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\04\\\\\\\\0cf49fd935a4311371888470dfbee41f.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\04\\\\\\\\24ec6359dd1553db000d669e23c3219e.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\04\\\\\\\\031f3e44ecd5de5091e10c653a48d3ff.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\04\\\\\\\\46c0e576432eedf2b912e49e00408683.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\04\\\\\\\\648e77223059d1c9dbc239ea14fb9936.jpg\"]', '【包邮】平凡的世界全三册+人间失格路遥太宰治正版书原著精完整装版高中阅读文学畅', '【包邮】平凡的世界全三册+人间失格路遥太宰治正版书原著精完整装版高中阅读文学畅销书排行榜经典小说散文随笔人民文学出版社', '50', '25', 50.00, 0.00, 555.00, 50.00, '件', 0, 0, 5000, 1, 0, 0, 0, 0, '(function(win,key){win[key]=window[key]||{};win[key].cdnPath=\'https://g.alicdn.com/sd/baxia/1.0.5/\';win[key].punishPath={[\'https://dscnew.taobao.com/i7/151/391/15839960304/TB1PCykfNv1gK0jSZFF8qv0sXla.desc%7Cvar%5Edesc%3Bsign%5Ee69fef02cc53cdb1fff113bc05940fdb%3Blang%5Egbk%3Bt%5E1569566619\']:\'https://login.taobao.com/member/login.jhtml?style=mini&amp;from=sm&amp;full_redirect=false&amp;redirectURL=http%3a%2f%2fdscnew.taobao.com/i7/151/391/15839960304/TB1PCykfNv1gK0jSZFF8qv0sXla.desc%7Cvar%5Edesc%3Bsign%5Ee69fef02cc53cdb1fff113bc05940fdb%3Blang%5Egbk%3Bt%5E1569566619/_____tmd_____/punish%3fx5secdata=5e0c8e1365474455070961b803bd560607b52cabf5960afff39b64ce58073f7828fec592a01b892e1b4d0c7354ac35e07dc8af3703187d6d64561402b1c87a3cae05d6a084e26e17fce6f28abaf9fc951746941a5f9f2cad199100251a84b0be151b80741e83f64c4b6c6a150f3eaeaee53dbed843f5015dfe185274bdb77d8fe67a0f5721db866c4b84caeed101a2fc659f85da919a6b38a2244f1565410497b49040bd56b2d6dd6f4610f66449f67eeb3ff7a3d06dd696fd84a55b25f3fdedf997c321f6d2cf4cdb81279f6c6cf98371b487a14d557b403c7b03ca136d27308b06cf3207fb4622cadb23ac5d92e12dbfcc508cd27518b3557b9baec779a869de74a91c129ec8c599b75aaa730c23a74c064a42424fa07de3912d37fe56189e1ef6064a3134649e8032b2082dd627fcbc7cd120e099f264b89ef507d142d0cf688f9cd865e9fd068bb6d4f4d755b0efd26b2114d7130f25c0d2f44e8e031ad17dbbfaf53885f8cc7b46b4a2e2c1499e269732977e1c8c63ebc8cb3fa8bda08c5450b1b584804745562066ed239f5cef29f40ea2fc5a81c2405a463f6b2e1f53cbbbbc932a9c9ff5216d5b6a2088962db522cf47f58cae4bb3fa29ebfec8288b648aa30939ea0b93ef0f0c011ca998349baa063a78b19b2dc45255bcb5c97457a31f729f4ded266cd4cb3f3137e44645982a591aff3eea7558da34351930bc6bd915dea9bb1252068504d45ed1f4e4a0%26x5step=100\'};})(window,\"__baxia__\");!function(){\"use strict\";var e=window,n=function(n,t){return(e.__baxia__||{})[n]||t},t=function(n,t){e.__baxia__=e.__baxia__||{},e.__baxia__[n]=t},r=location,a=document,o=function(e){var n=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:1,t=arguments.length&gt;2&amp;&amp;void 0!==arguments[2]?arguments[2]:1;if(!(t&gt;0&amp;&amp;Math.random()&gt;=t)){var o={code:n,msg:(e+\"\").substr(0,1e3)+\";v:1.0.3-beta1\",pid:\"baxia\",page:r.href.split(/[#?]/)[0],query:r.search.substr(1),hash:r.hash,referrer:a.referrer,title:a.title,ua:navigator.userAgent};console&amp;&amp;console.error(e),function(e,n){var t=[];for(var r in e)t.push(r+\"=\"+encodeURIComponent(e[r]));(new Image).src=n+t.join(\"&amp;\")}(o,\"//gm.mmstat.com/fsp.1.1?\")}};var i=document,s=document;({init:function(){this.punishPath=n(\"punishPath\",{}),t(\"punishPath\",\"\"),this.listenOnLoad()},getCurrentScript:function(){if(s.currentScript)return s.currentScript;for(var e=s.getElementsByTagName(\"script\"),n=\"\",t=e.length-1;t&gt;=0;t--)if(this.punishPath[e[t].src])return n=e[t];return n},updatejQueryEvent:function(e,n,t){window.jQuery&amp;&amp;(window.jQuery.event.triggered=n,t&amp;&amp;window.jQuery(e).trigger(t))},getHandlerPath:function(e,t){return t.jsPath?t.jsPath:\"\"+n(\"cdnPath\",\"https://g.alicdn.com/sd/baxia/1.0.3/\")+e+\".js\"},listenOnLoad:function(){var e=this.getCurrentScript();this.updatejQueryEvent(\"\",\"load\");var n=e.onreadystatechange||e.onload,t=this;e.onload=function(){var e=this;this.onload=this.onreadystatechange=null,t.handler(\"Jsonp\",{result:{rgv587_flag:\"sm\",url:t.punishPath[this.src]},config:{url:this.src,done:function(){console.log(\"request.done();\"),e.readyState=\"loaded\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"load\")},fail:function(){console.log(\"request.fail();\"),e.readyState=\"error\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"error\")}}})}},handler:function(){var e=arguments.length&gt;0&amp;&amp;void 0!==arguments[0]?arguments[0]:\"Xhr\",r=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:{},a=n(\"pluginInstance\",null),s=n(\"handlerQueue\",[]);try{if(a)return a.handler(r);s.push({pluginName:e,props:r});var u=s[0],l=u.pluginName,c=u.props,d=\"baxia\"+l+\"Handler\",h=this.getHandlerPath(d,c);t(\"handlerQueue\",s),function(e,n,t){var r=i.getElementsByTagName(\"script\")[0],a=i.createElement(\"script\");if(a.async=1,a.src=e,a.onerror=function(n){o(\"function:loadJS. msg:\"+e+\"load error。props：\"+JSON.stringify(t)),a.onerror=null},n){var s=!1;a.onload=a.onreadystatechange=function(){s||a.readyState&amp;&amp;!/loaded|complete/.test(a.readyState)||(a.onload=a.onreadystatechange=null,s=!0,n())}}r.parentNode.insertBefore(a,r)}(h,function(){s=n(\"handlerQueue\",[]),a=new window[d];for(var e=0;e', 1570192942, 0, 0, 0, 500.00, 549.00, 0, NULL, 55, 0, '', '', 'https://detail.tmall.com/item.htm?spm=a230r.1.14.90.66d44978iAh3C0&id=15839960304&ns=1&abbucket=12', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (23, 0, 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\d4513d907066d0a02d9d7899d2f89f4b.jpg', '[\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\04\\\\\\\\d4513d907066d0a02d9d7899d2f89f4b.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\04\\\\\\\\6fa41cf194388a4f8138cc285efa86ae.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\04\\\\\\\\1e01ecbb24554b2105c273c0fe9ecd76.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\04\\\\\\\\c0a2d6bf96f4353661290d0a6842d2a3.jpg\"]', '当当网正版哈利波特全集纪念版全套7册新版系列魔法石火焰杯密室四年级课外阅读书籍五六年级必读', '当当网正版哈利波特全集纪念版全套7册新版系列魔法石火焰杯密室中文版儿童书籍三年级小学生四年级课外阅读书籍五六年级必读', '20', '25,29', 66.00, 0.00, 66.00, 666.00, '件', 0, 0, 666, 1, 0, 0, 0, 0, '(function(win,key){win[key]=window[key]||{};win[key].cdnPath=\'https://g.alicdn.com/sd/baxia/1.0.5/\';win[key].punishPath={[\'https://dscnew.taobao.com/i8/580/650/587652411606/TB177B9b.D1gK0jSZFG8qvd3Fla.desc%7Cvar%5Edesc%3Bsign%5E380056b4ec8c3177e32e1e9645189d88%3Blang%5Egbk%3Bt%5E1566799262\']:\'https://login.taobao.com/member/login.jhtml?style=mini&amp;from=sm&amp;full_redirect=false&amp;redirectURL=http%3a%2f%2fdscnew.taobao.com/i8/580/650/587652411606/TB177B9b.D1gK0jSZFG8qvd3Fla.desc%7Cvar%5Edesc%3Bsign%5E380056b4ec8c3177e32e1e9645189d88%3Blang%5Egbk%3Bt%5E1566799262/_____tmd_____/punish%3fx5secdata=5e0c8e1365474455070961b803bd560607b52cabf5960afff39b64ce58073f7828fec592a01b892e1b4d0c7354ac35e07dc8af3703187d6d64561402b1c87a3cae05d6a084e26e17fce6f28abaf9fc951746941a5f9f2cad199100251a84b0be151b80741e83f64c4b6c6a150f3eaeaee9857a4484f63e0157d9995de39f7dc16f14a98ecc59ebc369445f8cccbadbc8659f85da919a6b38a2244f1565410497b49040bd56b2d6dd6f4610f66449f67eeb3ff7a3d06dd696fd84a55b25f3fdedf997c321f6d2cf4cdb81279f6c6cf98371b487a14d557b403c7b03ca136d27308b06cf3207fb4622cadb23ac5d92e12dbfcc508cd27518b3557b9baec779a869de74a91c129ec8c599b75aaa730c23a74c064a42424fa07de3912d37fe56189e1ef6064a3134649e8032b2082dd627fcbc7cd120e099f264b89ef507d142d0cf821ccd6b34c972e981e8bf077cdd0af7dccf133012779ee71ae18c5ef9f2d705643d6a0f712d9df83354b47f46cf16aee2ba45d78d5eff7b05ba713b0f8d8cae469ba681383f88e5a4bbf4a12db07537903e50b3919c041c9190585fac9c06cab7fcc86aa46af4913c530a955641c85ebd49486ec5cf996e65108a93350afb5205f0452aa4de9e69ddfbea22b144418a7031490012efc175fdef082c6bbc86331d8e651d3be00ccd56d3454596d9e69f2e13d19ab182a47cbed3cd01db38aa91a9dc75a93c260fe7693a6c515d202d64%26x5step=100\'};})(window,\"__baxia__\");!function(){\"use strict\";var e=window,n=function(n,t){return(e.__baxia__||{})[n]||t},t=function(n,t){e.__baxia__=e.__baxia__||{},e.__baxia__[n]=t},r=location,a=document,o=function(e){var n=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:1,t=arguments.length&gt;2&amp;&amp;void 0!==arguments[2]?arguments[2]:1;if(!(t&gt;0&amp;&amp;Math.random()&gt;=t)){var o={code:n,msg:(e+\"\").substr(0,1e3)+\";v:1.0.3-beta1\",pid:\"baxia\",page:r.href.split(/[#?]/)[0],query:r.search.substr(1),hash:r.hash,referrer:a.referrer,title:a.title,ua:navigator.userAgent};console&amp;&amp;console.error(e),function(e,n){var t=[];for(var r in e)t.push(r+\"=\"+encodeURIComponent(e[r]));(new Image).src=n+t.join(\"&amp;\")}(o,\"//gm.mmstat.com/fsp.1.1?\")}};var i=document,s=document;({init:function(){this.punishPath=n(\"punishPath\",{}),t(\"punishPath\",\"\"),this.listenOnLoad()},getCurrentScript:function(){if(s.currentScript)return s.currentScript;for(var e=s.getElementsByTagName(\"script\"),n=\"\",t=e.length-1;t&gt;=0;t--)if(this.punishPath[e[t].src])return n=e[t];return n},updatejQueryEvent:function(e,n,t){window.jQuery&amp;&amp;(window.jQuery.event.triggered=n,t&amp;&amp;window.jQuery(e).trigger(t))},getHandlerPath:function(e,t){return t.jsPath?t.jsPath:\"\"+n(\"cdnPath\",\"https://g.alicdn.com/sd/baxia/1.0.3/\")+e+\".js\"},listenOnLoad:function(){var e=this.getCurrentScript();this.updatejQueryEvent(\"\",\"load\");var n=e.onreadystatechange||e.onload,t=this;e.onload=function(){var e=this;this.onload=this.onreadystatechange=null,t.handler(\"Jsonp\",{result:{rgv587_flag:\"sm\",url:t.punishPath[this.src]},config:{url:this.src,done:function(){console.log(\"request.done();\"),e.readyState=\"loaded\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"load\")},fail:function(){console.log(\"request.fail();\"),e.readyState=\"error\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"error\")}}})}},handler:function(){var e=arguments.length&gt;0&amp;&amp;void 0!==arguments[0]?arguments[0]:\"Xhr\",r=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:{},a=n(\"pluginInstance\",null),s=n(\"handlerQueue\",[]);try{if(a)return a.handler(r);s.push({pluginName:e,props:r});var u=s[0],l=u.pluginName,c=u.props,d=\"baxia\"+l+\"Handler\",h=this.getHandlerPath(d,c);t(\"handlerQueue\",s),function(e,n,t){var r=i.getElementsByTagName(\"script\")[0],a=i.createElement(\"script\");if(a.async=1,a.src=e,a.onerror=function(n){o(\"function:loadJS. msg:\"+e+\"load error。props：\"+JSON.stringify(t)),a.onerror=null},n){var s=!1;a.onload=a.onreadystatechange=function(){s||a.readyState&amp;&amp;!/loaded|complete/.test(a.readyState)||(a.onload=a.onreadystatechange=null,s=!0,n())}}r.parentNode.insertBefore(a,r)}(h,function(){s=n(\"handlerQueue\",[]),a=new window[d];for(var e=0;e', 1570192991, 0, 0, 0, 66.00, 666.00, 0, NULL, 66, 0, '', '', 'https://detail.tmall.com/item.htm?spm=a230r.1.14.135.66d44978iAh3C0&id=587652411606&ns=1&abbucket=12', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (24, 0, 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\1b717df891df6bea000328aa27c41644.jpg', '[\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\05\\\\\\\\1b717df891df6bea000328aa27c41644.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\05\\\\\\\\ba60eee57ad6114d734689d7982991db.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\05\\\\\\\\4ae7dc1c31d4e8514602fd8736789462.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\05\\\\\\\\a40ed6f6bdb492cf34b898b626e89188.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\05\\\\\\\\b22ecbbd644c7f5774dc1cb7a6412c55.jpg\"]', '快乐读书吧三年级上册叶圣陶安徒生童话+格林童话+稻草人书三年级年级课外书必读人民教育出版社', '快乐读书吧三年级上册叶圣陶安徒生童话+格林童话+稻草人书三年级小学生课外读物曹文轩陈先云三年级课外书必读人民教育出版社', '', '4', 50.00, 0.00, 500.00, 50.00, '件', 0, 0, 44, 1, 0, 0, 0, 0, '(function(win,key){win[key]=window[key]||{};win[key].cdnPath=\'https://g.alicdn.com/sd/baxia/1.0.5/\';win[key].punishPath={[\'https://dscnew.taobao.com/i2/570/481/576488432549/TB1QLmtVIfpK1RjSZFO8qu6nFla.desc%7Cvar%5Edesc%3Bsign%5E65315cef6abadf252f7f4c031cf6d908%3Blang%5Egbk%3Bt%5E1570149233\']:\'https://login.taobao.com/member/login.jhtml?style=mini&amp;from=sm&amp;full_redirect=false&amp;redirectURL=http%3a%2f%2fdscnew.taobao.com/i2/570/481/576488432549/TB1QLmtVIfpK1RjSZFO8qu6nFla.desc%7Cvar%5Edesc%3Bsign%5E65315cef6abadf252f7f4c031cf6d908%3Blang%5Egbk%3Bt%5E1570149233/_____tmd_____/punish%3fx5secdata=5e0c8e1365474455070961b803bd560607b52cabf5960afff39b64ce58073f7828fec592a01b892e1b4d0c7354ac35e07dc8af3703187d6d64561402b1c87a3cae05d6a084e26e17fce6f28abaf9fc951746941a5f9f2cad199100251a84b0be151b80741e83f64c4b6c6a150f3eaeae6fb545e21b56d14a62532f8daf0edf56a35c5c5194a92a238a361cd8f8dbbefabda446fed80a9ea72af470e6a15959edb49040bd56b2d6dd6f4610f66449f67eeb3ff7a3d06dd696fd84a55b25f3fdedf997c321f6d2cf4cdb81279f6c6cf98371b487a14d557b403c7b03ca136d27308b06cf3207fb4622cadb23ac5d92e12dbfcc508cd27518b3557b9baec779a869de74a91c129ec8c599b75aaa730c23a74c064a42424fa07de3912d37fe56189e1ef6064a3134649e8032b2082dd627fcbc7cd120e099f264b89ef507d142d0cfbae1419faf2535f41a66e52ff441cc0af1ee341e3b86f11ceafbdb35dfc1a55f155931588dee5d0ad34c2ccd2603c16619e57be0f2d1b84b75fa31505317aca1469ba681383f88e5a4bbf4a12db0753768fb2c4ce42d651edd6abd462fb27cfda933944eff360746d8bed33d11eb470468c531716035685e413da4ad551c0febd9477c1b39cbe648a54d1c0a16ee311bbc1b54fcc4411f13f3ff62491ab26ed11d8e651d3be00ccd56d3454596d9e69f2e13d19ab182a47cbed3cd01db38aa9151f016f1585542a187dbc44a8b21ca5c%26x5step=100\'};})(window,\"__baxia__\");!function(){\"use strict\";var e=window,n=function(n,t){return(e.__baxia__||{})[n]||t},t=function(n,t){e.__baxia__=e.__baxia__||{},e.__baxia__[n]=t},r=location,a=document,o=function(e){var n=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:1,t=arguments.length&gt;2&amp;&amp;void 0!==arguments[2]?arguments[2]:1;if(!(t&gt;0&amp;&amp;Math.random()&gt;=t)){var o={code:n,msg:(e+\"\").substr(0,1e3)+\";v:1.0.3-beta1\",pid:\"baxia\",page:r.href.split(/[#?]/)[0],query:r.search.substr(1),hash:r.hash,referrer:a.referrer,title:a.title,ua:navigator.userAgent};console&amp;&amp;console.error(e),function(e,n){var t=[];for(var r in e)t.push(r+\"=\"+encodeURIComponent(e[r]));(new Image).src=n+t.join(\"&amp;\")}(o,\"//gm.mmstat.com/fsp.1.1?\")}};var i=document,s=document;({init:function(){this.punishPath=n(\"punishPath\",{}),t(\"punishPath\",\"\"),this.listenOnLoad()},getCurrentScript:function(){if(s.currentScript)return s.currentScript;for(var e=s.getElementsByTagName(\"script\"),n=\"\",t=e.length-1;t&gt;=0;t--)if(this.punishPath[e[t].src])return n=e[t];return n},updatejQueryEvent:function(e,n,t){window.jQuery&amp;&amp;(window.jQuery.event.triggered=n,t&amp;&amp;window.jQuery(e).trigger(t))},getHandlerPath:function(e,t){return t.jsPath?t.jsPath:\"\"+n(\"cdnPath\",\"https://g.alicdn.com/sd/baxia/1.0.3/\")+e+\".js\"},listenOnLoad:function(){var e=this.getCurrentScript();this.updatejQueryEvent(\"\",\"load\");var n=e.onreadystatechange||e.onload,t=this;e.onload=function(){var e=this;this.onload=this.onreadystatechange=null,t.handler(\"Jsonp\",{result:{rgv587_flag:\"sm\",url:t.punishPath[this.src]},config:{url:this.src,done:function(){console.log(\"request.done();\"),e.readyState=\"loaded\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"load\")},fail:function(){console.log(\"request.fail();\"),e.readyState=\"error\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"error\")}}})}},handler:function(){var e=arguments.length&gt;0&amp;&amp;void 0!==arguments[0]?arguments[0]:\"Xhr\",r=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:{},a=n(\"pluginInstance\",null),s=n(\"handlerQueue\",[]);try{if(a)return a.handler(r);s.push({pluginName:e,props:r});var u=s[0],l=u.pluginName,c=u.props,d=\"baxia\"+l+\"Handler\",h=this.getHandlerPath(d,c);t(\"handlerQueue\",s),function(e,n,t){var r=i.getElementsByTagName(\"script\")[0],a=i.createElement(\"script\");if(a.async=1,a.src=e,a.onerror=function(n){o(\"function:loadJS. msg:\"+e+\"load error。props：\"+JSON.stringify(t)),a.onerror=null},n){var s=!1;a.onload=a.onreadystatechange=function(){s||a.readyState&amp;&amp;!/loaded|complete/.test(a.readyState)||(a.onload=a.onreadystatechange=null,s=!0,n())}}r.parentNode.insertBefore(a,r)}(h,function(){s=n(\"handlerQueue\",[]),a=new window[d];for(var e=0;e', 1570239611, 0, 0, 0, 5000.00, 50.00, 0, NULL, 500, 0, '', '', 'https://detail.tmall.com/item.htm?spm=a230r.1.14.55.607d21e1v8DvX7&id=576488432549&ns=1&abbucket=2', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (25, 0, 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\a2ae37e4daef07befbe8df919f3c217c.jpg', '[\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\05\\\\\\\\a2ae37e4daef07befbe8df919f3c217c.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\05\\\\\\\\a5d5bf6c990ebef421b172ab230f73bd.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\05\\\\\\\\82cafe59ba68959e94362ffce6c8f263.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\05\\\\\\\\38eff756f31c42d711ddc90f44183ea3.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\05\\\\\\\\67d853a4f756b8d21e5b2fd4edff98e5.jpg\"]', '窗边的小豆豆正版书黑柳彻子中小学生一二三四五六年级岁非注音版儿童文学故事读物畅销', '窗边的小豆豆正版书黑柳彻子中小学生一二三四五六年级课外阅读书籍少儿67891012岁非注音版儿童文学故事读物畅销', '50', '4', 50.00, 0.00, 50.00, 5.00, '件', 0, 1, 4999, 1, 0, 0, 0, 0, '(function(win,key){win[key]=window[key]||{};win[key].cdnPath=\'https://g.alicdn.com/sd/baxia/1.0.5/\';win[key].punishPath={[\'https://dscnew.taobao.com/i4/160/260/16726196775/TB1tySWhG67gK0jSZFH8qu9jVla.desc%7Cvar%5Edesc%3Bsign%5Ef91293fbb8d8f0037dfa5fe8fd66c363%3Blang%5Egbk%3Bt%5E1569836941\']:\'https://login.taobao.com/member/login.jhtml?style=mini&amp;from=sm&amp;full_redirect=false&amp;redirectURL=http%3a%2f%2fdscnew.taobao.com/i4/160/260/16726196775/TB1tySWhG67gK0jSZFH8qu9jVla.desc%7Cvar%5Edesc%3Bsign%5Ef91293fbb8d8f0037dfa5fe8fd66c363%3Blang%5Egbk%3Bt%5E1569836941/_____tmd_____/punish%3fx5secdata=5e0c8e1365474455070961b803bd560607b52cabf5960afff39b64ce58073f7828fec592a01b892e1b4d0c7354ac35e07dc8af3703187d6d64561402b1c87a3cae05d6a084e26e17fce6f28abaf9fc951746941a5f9f2cad199100251a84b0be151b80741e83f64c4b6c6a150f3eaeae020ff1d2c3b2613e8dd1f95f7b381bf40140646931a1bfa02760908d9f400b35498602800fb9001b7e6a5d88c86cd08eb49040bd56b2d6dd6f4610f66449f67eeb3ff7a3d06dd696fd84a55b25f3fdedf997c321f6d2cf4cdb81279f6c6cf98371b487a14d557b403c7b03ca136d27308b06cf3207fb4622cadb23ac5d92e12dbfcc508cd27518b3557b9baec779a869de74a91c129ec8c599b75aaa730c23a74c064a42424fa07de3912d37fe56189e1ef6064a3134649e8032b2082dd627fcbc7cd120e099f264b89ef507d142d0cf39c2b13c2ed62a3cc7bd63d8493b8d9ad1a07ff93bc3a6cbd225c49bf0e8dd22dd1bfb1f9b2534bbaae046f6a69330640d7cbecf16cb56b88002bd9a5331f6e55450b1b584804745562066ed239f5cef5064d6b93b2cdb0b054bed72ca5f3f668fe7cb0b958d4bbdd40f1b640a51e5e1200df3ae09743d991c2110ab70629b9dfb3d9bf4f5d5130c96a65bd238621720ae1df57b49d2d5af7abd176239f56a70a31f729f4ded266cd4cb3f3137e44645982a591aff3eea7558da34351930bc6bcddbd819941e792300a5cb669e765c60%26x5step=100\'};})(window,\"__baxia__\");!function(){\"use strict\";var e=window,n=function(n,t){return(e.__baxia__||{})[n]||t},t=function(n,t){e.__baxia__=e.__baxia__||{},e.__baxia__[n]=t},r=location,a=document,o=function(e){var n=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:1,t=arguments.length&gt;2&amp;&amp;void 0!==arguments[2]?arguments[2]:1;if(!(t&gt;0&amp;&amp;Math.random()&gt;=t)){var o={code:n,msg:(e+\"\").substr(0,1e3)+\";v:1.0.3-beta1\",pid:\"baxia\",page:r.href.split(/[#?]/)[0],query:r.search.substr(1),hash:r.hash,referrer:a.referrer,title:a.title,ua:navigator.userAgent};console&amp;&amp;console.error(e),function(e,n){var t=[];for(var r in e)t.push(r+\"=\"+encodeURIComponent(e[r]));(new Image).src=n+t.join(\"&amp;\")}(o,\"//gm.mmstat.com/fsp.1.1?\")}};var i=document,s=document;({init:function(){this.punishPath=n(\"punishPath\",{}),t(\"punishPath\",\"\"),this.listenOnLoad()},getCurrentScript:function(){if(s.currentScript)return s.currentScript;for(var e=s.getElementsByTagName(\"script\"),n=\"\",t=e.length-1;t&gt;=0;t--)if(this.punishPath[e[t].src])return n=e[t];return n},updatejQueryEvent:function(e,n,t){window.jQuery&amp;&amp;(window.jQuery.event.triggered=n,t&amp;&amp;window.jQuery(e).trigger(t))},getHandlerPath:function(e,t){return t.jsPath?t.jsPath:\"\"+n(\"cdnPath\",\"https://g.alicdn.com/sd/baxia/1.0.3/\")+e+\".js\"},listenOnLoad:function(){var e=this.getCurrentScript();this.updatejQueryEvent(\"\",\"load\");var n=e.onreadystatechange||e.onload,t=this;e.onload=function(){var e=this;this.onload=this.onreadystatechange=null,t.handler(\"Jsonp\",{result:{rgv587_flag:\"sm\",url:t.punishPath[this.src]},config:{url:this.src,done:function(){console.log(\"request.done();\"),e.readyState=\"loaded\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"load\")},fail:function(){console.log(\"request.fail();\"),e.readyState=\"error\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"error\")}}})}},handler:function(){var e=arguments.length&gt;0&amp;&amp;void 0!==arguments[0]?arguments[0]:\"Xhr\",r=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:{},a=n(\"pluginInstance\",null),s=n(\"handlerQueue\",[]);try{if(a)return a.handler(r);s.push({pluginName:e,props:r});var u=s[0],l=u.pluginName,c=u.props,d=\"baxia\"+l+\"Handler\",h=this.getHandlerPath(d,c);t(\"handlerQueue\",s),function(e,n,t){var r=i.getElementsByTagName(\"script\")[0],a=i.createElement(\"script\");if(a.async=1,a.src=e,a.onerror=function(n){o(\"function:loadJS. msg:\"+e+\"load error。props：\"+JSON.stringify(t)),a.onerror=null},n){var s=!1;a.onload=a.onreadystatechange=function(){s||a.readyState&amp;&amp;!/loaded|complete/.test(a.readyState)||(a.onload=a.onreadystatechange=null,s=!0,n())}}r.parentNode.insertBefore(a,r)}(h,function(){s=n(\"handlerQueue\",[]),a=new window[d];for(var e=0;e', 1570239658, 0, 0, 0, 50.00, 11.00, 0, NULL, 50, 0, '', '', 'https://detail.tmall.com/item.htm?spm=a230r.1.14.62.607d21e1v8DvX7&id=16726196775&ns=1&abbucket=2', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (26, 0, 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\2c2b9d9703b5496b19a62a6dacff79c1.jpg', '[\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\05\\\\\\\\2c2b9d9703b5496b19a62a6dacff79c1.jpg\"]', '哈利波特全集英文原版琳哈利波特与魔法石与被诅咒的孩子纪念版原著名著', '哈利波特全集英文原版书籍18harrypotter英语全套英国小说正版jk罗琳哈利波特与魔法石与被诅咒的孩子纪念版原著名著', '', '29', 86.00, 0.00, 86.00, 86.00, '件', 0, 0, 86, 1, 0, 0, 0, 0, '(function(win,key){win[key]=window[key]||{};win[key].cdnPath=\'https://g.alicdn.com/sd/baxia/1.0.5/\';win[key].punishPath={[\'https://dscnew.taobao.com/i6/520/320/527323736498/TB1Du_ZaEGF3KVjSZFv8qv_nXla.desc%7Cvar%5Edesc%3Bsign%5E0cc93982f2008ef545ff85470095ad91%3Blang%5Egbk%3Bt%5E1568131290\']:\'https://login.taobao.com/member/login.jhtml?style=mini&amp;from=sm&amp;full_redirect=false&amp;redirectURL=http%3a%2f%2fdscnew.taobao.com/i6/520/320/527323736498/TB1Du_ZaEGF3KVjSZFv8qv_nXla.desc%7Cvar%5Edesc%3Bsign%5E0cc93982f2008ef545ff85470095ad91%3Blang%5Egbk%3Bt%5E1568131290/_____tmd_____/punish%3fx5secdata=5e0c8e1365474455070961b803bd560607b52cabf5960afff39b64ce58073f7828fec592a01b892e1b4d0c7354ac35e07dc8af3703187d6d64561402b1c87a3cae05d6a084e26e17fce6f28abaf9fc951746941a5f9f2cad199100251a84b0be151b80741e83f64c4b6c6a150f3eaeae51be591005dc3f7121f1a47b0edeaf5ab08120ebb0838353700e1c40a6ad7ba103284be60c3b11dcef5cdb46402ae5a7b49040bd56b2d6dd6f4610f66449f67eeb3ff7a3d06dd696fd84a55b25f3fdedf997c321f6d2cf4cdb81279f6c6cf98371b487a14d557b403c7b03ca136d27308b06cf3207fb4622cadb23ac5d92e12dbfcc508cd27518b3557b9baec779a869de74a91c129ec8c599b75aaa730c23a74c064a42424fa07de3912d37fe56189e1ef6064a3134649e8032b2082dd627fcbc7cd120e099f264b89ef507d142d0cfab35fad8e650214eaa7ca87a5a8134407dfe83cb73c6bd3b4284890fa99fe3dd86664277beb215631704c39e81b47330d3b6041da81d585ce826636d3e51a0ce469ba681383f88e5a4bbf4a12db075379f76f1f5fb92fa71a693512f4f4574ed21eecbe6e1169971a057231557a498320513fb25281c42747a34b741f1e95e31f0b1e50883ca222722bec99eb0e74d43081f0e7fa01072b24181d10f262199e81d8e651d3be00ccd56d3454596d9e69f2e13d19ab182a47cbed3cd01db38aa91df070f4c87d4a1d626ede2b0aaff50e4%26x5step=100\'};})(window,\"__baxia__\");!function(){\"use strict\";var e=window,n=function(n,t){return(e.__baxia__||{})[n]||t},t=function(n,t){e.__baxia__=e.__baxia__||{},e.__baxia__[n]=t},r=location,a=document,o=function(e){var n=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:1,t=arguments.length&gt;2&amp;&amp;void 0!==arguments[2]?arguments[2]:1;if(!(t&gt;0&amp;&amp;Math.random()&gt;=t)){var o={code:n,msg:(e+\"\").substr(0,1e3)+\";v:1.0.3-beta1\",pid:\"baxia\",page:r.href.split(/[#?]/)[0],query:r.search.substr(1),hash:r.hash,referrer:a.referrer,title:a.title,ua:navigator.userAgent};console&amp;&amp;console.error(e),function(e,n){var t=[];for(var r in e)t.push(r+\"=\"+encodeURIComponent(e[r]));(new Image).src=n+t.join(\"&amp;\")}(o,\"//gm.mmstat.com/fsp.1.1?\")}};var i=document,s=document;({init:function(){this.punishPath=n(\"punishPath\",{}),t(\"punishPath\",\"\"),this.listenOnLoad()},getCurrentScript:function(){if(s.currentScript)return s.currentScript;for(var e=s.getElementsByTagName(\"script\"),n=\"\",t=e.length-1;t&gt;=0;t--)if(this.punishPath[e[t].src])return n=e[t];return n},updatejQueryEvent:function(e,n,t){window.jQuery&amp;&amp;(window.jQuery.event.triggered=n,t&amp;&amp;window.jQuery(e).trigger(t))},getHandlerPath:function(e,t){return t.jsPath?t.jsPath:\"\"+n(\"cdnPath\",\"https://g.alicdn.com/sd/baxia/1.0.3/\")+e+\".js\"},listenOnLoad:function(){var e=this.getCurrentScript();this.updatejQueryEvent(\"\",\"load\");var n=e.onreadystatechange||e.onload,t=this;e.onload=function(){var e=this;this.onload=this.onreadystatechange=null,t.handler(\"Jsonp\",{result:{rgv587_flag:\"sm\",url:t.punishPath[this.src]},config:{url:this.src,done:function(){console.log(\"request.done();\"),e.readyState=\"loaded\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"load\")},fail:function(){console.log(\"request.fail();\"),e.readyState=\"error\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"error\")}}})}},handler:function(){var e=arguments.length&gt;0&amp;&amp;void 0!==arguments[0]?arguments[0]:\"Xhr\",r=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:{},a=n(\"pluginInstance\",null),s=n(\"handlerQueue\",[]);try{if(a)return a.handler(r);s.push({pluginName:e,props:r});var u=s[0],l=u.pluginName,c=u.props,d=\"baxia\"+l+\"Handler\",h=this.getHandlerPath(d,c);t(\"handlerQueue\",s),function(e,n,t){var r=i.getElementsByTagName(\"script\")[0],a=i.createElement(\"script\");if(a.async=1,a.src=e,a.onerror=function(n){o(\"function:loadJS. msg:\"+e+\"load error。props：\"+JSON.stringify(t)),a.onerror=null},n){var s=!1;a.onload=a.onreadystatechange=function(){s||a.readyState&amp;&amp;!/loaded|complete/.test(a.readyState)||(a.onload=a.onreadystatechange=null,s=!0,n())}}r.parentNode.insertBefore(a,r)}(h,function(){s=n(\"handlerQueue\",[]),a=new window[d];for(var e=0;e', 1570240784, 0, 0, 0, 86.00, 86.00, 0, NULL, 86, 0, '', '', 'https://detail.tmall.com/item.htm?spm=a230r.1.14.104.607d21e1v8DvX7&id=527323736498&ns=1&abbucket=2', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (27, 0, 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\cfad1a2cdb82d602bcd3e79c550a2534.jpg', '[\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\05\\\\\\\\cfad1a2cdb82d602bcd3e79c550a2534.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\05\\\\\\\\84b08301e589cbe83411ece88757aeaa.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\05\\\\\\\\d3e44711d453286259aec2bacaecf107.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\05\\\\\\\\a9fb1196cbcdc68fc6d80cb171d9ec6c.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\05\\\\\\\\d2febcef9fbd999589aec8ecf6481860.jpg\"]', '2019新版米小圈上学记一年级全套4册注音版必读课外书12带拼音的生课外阅读', '2019新版米小圈上学记一年级全套4册注音版必读课外书12带拼音的漫画书二年级三故事书米你小圈下册小学生课外阅读书籍爆笑漫画', '', '4', 499.00, 0.00, 4444.00, 0.00, '件', 0, 8, 436, 1, 0, 0, 0, 0, '(function(win,key){win[key]=window[key]||{};win[key].cdnPath=\'https://g.alicdn.com/sd/baxia/1.0.5/\';win[key].punishPath={[\'https://dscnew.taobao.com/i5/570/050/576050444694/TB1r5HskmzqK1RjSZFH8qv3Cpla.desc%7Cvar%5Edesc%3Bsign%5E643969396d534c59405846357968ca8f%3Blang%5Egbk%3Bt%5E1569742033\']:\'https://login.taobao.com/member/login.jhtml?style=mini&amp;from=sm&amp;full_redirect=false&amp;redirectURL=http%3a%2f%2fdscnew.taobao.com/i5/570/050/576050444694/TB1r5HskmzqK1RjSZFH8qv3Cpla.desc%7Cvar%5Edesc%3Bsign%5E643969396d534c59405846357968ca8f%3Blang%5Egbk%3Bt%5E1569742033/_____tmd_____/punish%3fx5secdata=5e0c8e1365474455070961b803bd560607b52cabf5960afff39b64ce58073f7828fec592a01b892e1b4d0c7354ac35e07dc8af3703187d6d64561402b1c87a3cae05d6a084e26e17fce6f28abaf9fc951746941a5f9f2cad199100251a84b0be151b80741e83f64c4b6c6a150f3eaeae261fca266e35f90873490f1dab2a1fab74de96eb5c7d59ac4e15fe735c079b588a512817aabf8ecc23aad74f269ca5e0b49040bd56b2d6dd6f4610f66449f67eeb3ff7a3d06dd696fd84a55b25f3fdedf997c321f6d2cf4cdb81279f6c6cf98371b487a14d557b403c7b03ca136d27308b06cf3207fb4622cadb23ac5d92e12dbfcc508cd27518b3557b9baec779a869de74a91c129ec8c599b75aaa730c23a74c064a42424fa07de3912d37fe56189e1ef6064a3134649e8032b2082dd627fcbc7cd120e099f264b89ef507d142d0cf92e62e0174147c88e545c082d40ea9125b3339e7e707b6c1d4a026a4a5e25ae2592d8dbaed141ef0c4196cda19e6fb37b333978a90f9249279cd3ec1ff732f01469ba681383f88e5a4bbf4a12db075372a8c75df89bde2aa7b3dd33baaea77f5833391249804c04da1ee252a5937d917e821f1f83d2737bd86426879d8df4e6ef7c19270fa9ae76f04d52310fa4d92f904ffb6fdfbb10238272316fad9dfa0971d8e651d3be00ccd56d3454596d9e69f2e13d19ab182a47cbed3cd01db38aa917b1bfcaa1d81cdc13b283f3fecfd8bce%26x5step=100\'};})(window,\"__baxia__\");!function(){\"use strict\";var e=window,n=function(n,t){return(e.__baxia__||{})[n]||t},t=function(n,t){e.__baxia__=e.__baxia__||{},e.__baxia__[n]=t},r=location,a=document,o=function(e){var n=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:1,t=arguments.length&gt;2&amp;&amp;void 0!==arguments[2]?arguments[2]:1;if(!(t&gt;0&amp;&amp;Math.random()&gt;=t)){var o={code:n,msg:(e+\"\").substr(0,1e3)+\";v:1.0.3-beta1\",pid:\"baxia\",page:r.href.split(/[#?]/)[0],query:r.search.substr(1),hash:r.hash,referrer:a.referrer,title:a.title,ua:navigator.userAgent};console&amp;&amp;console.error(e),function(e,n){var t=[];for(var r in e)t.push(r+\"=\"+encodeURIComponent(e[r]));(new Image).src=n+t.join(\"&amp;\")}(o,\"//gm.mmstat.com/fsp.1.1?\")}};var i=document,s=document;({init:function(){this.punishPath=n(\"punishPath\",{}),t(\"punishPath\",\"\"),this.listenOnLoad()},getCurrentScript:function(){if(s.currentScript)return s.currentScript;for(var e=s.getElementsByTagName(\"script\"),n=\"\",t=e.length-1;t&gt;=0;t--)if(this.punishPath[e[t].src])return n=e[t];return n},updatejQueryEvent:function(e,n,t){window.jQuery&amp;&amp;(window.jQuery.event.triggered=n,t&amp;&amp;window.jQuery(e).trigger(t))},getHandlerPath:function(e,t){return t.jsPath?t.jsPath:\"\"+n(\"cdnPath\",\"https://g.alicdn.com/sd/baxia/1.0.3/\")+e+\".js\"},listenOnLoad:function(){var e=this.getCurrentScript();this.updatejQueryEvent(\"\",\"load\");var n=e.onreadystatechange||e.onload,t=this;e.onload=function(){var e=this;this.onload=this.onreadystatechange=null,t.handler(\"Jsonp\",{result:{rgv587_flag:\"sm\",url:t.punishPath[this.src]},config:{url:this.src,done:function(){console.log(\"request.done();\"),e.readyState=\"loaded\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"load\")},fail:function(){console.log(\"request.fail();\"),e.readyState=\"error\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"error\")}}})}},handler:function(){var e=arguments.length&gt;0&amp;&amp;void 0!==arguments[0]?arguments[0]:\"Xhr\",r=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:{},a=n(\"pluginInstance\",null),s=n(\"handlerQueue\",[]);try{if(a)return a.handler(r);s.push({pluginName:e,props:r});var u=s[0],l=u.pluginName,c=u.props,d=\"baxia\"+l+\"Handler\",h=this.getHandlerPath(d,c);t(\"handlerQueue\",s),function(e,n,t){var r=i.getElementsByTagName(\"script\")[0],a=i.createElement(\"script\");if(a.async=1,a.src=e,a.onerror=function(n){o(\"function:loadJS. msg:\"+e+\"load error。props：\"+JSON.stringify(t)),a.onerror=null},n){var s=!1;a.onload=a.onreadystatechange=function(){s||a.readyState&amp;&amp;!/loaded|complete/.test(a.readyState)||(a.onload=a.onreadystatechange=null,s=!0,n())}}r.parentNode.insertBefore(a,r)}(h,function(){s=n(\"handlerQueue\",[]),a=new window[d];for(var e=0;e', 1570240855, 0, 0, 0, 444.00, 499.00, 0, NULL, 444, 0, '', '', 'https://detail.tmall.com/item.htm?spm=a230r.1.14.111.607d21e1v8DvX7&id=576050444694&ns=1&abbucket=2', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (28, 0, 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\876d45301b38ba03a0ecb973cdeb9c8e.jpg', '[\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\05\\\\\\\\876d45301b38ba03a0ecb973cdeb9c8e.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\05\\\\\\\\81610def900553bb33836ad2fef63563.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\05\\\\\\\\c8102fb59812fb157a67d720ea7dc52c.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\05\\\\\\\\d10a37a5dcbb05ec1c18c3b37ba7a3c9.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\05\\\\\\\\7e4c1401da61e90905e9987e57014274.jpg\"]', '正版不一样的卡梅拉全套注音版大本第一季1四季', '正版不一样的卡梅拉全套注音版大本第一季15册一年级二年级指定书籍儿童绘本睡前故事课外书368岁我想去看海拼音版第二三四季', '', '4', 55.00, 0.00, 42.00, 0.00, '件', 0, 0, 25, 1, 0, 0, 0, 0, '(function(win,key){win[key]=window[key]||{};win[key].cdnPath=\'https://g.alicdn.com/sd/baxia/1.0.5/\';win[key].punishPath={[\'https://dscnew.taobao.com/i2/560/400/561404144013/TB1ZGXHsAvoK1RjSZPf8qtPKFla.desc%7Cvar%5Edesc%3Bsign%5E0f4809c2780d458ac93fe2b2f4e61b0f%3Blang%5Egbk%3Bt%5E1568784145\']:\'https://login.taobao.com/member/login.jhtml?style=mini&amp;from=sm&amp;full_redirect=false&amp;redirectURL=http%3a%2f%2fdscnew.taobao.com/i2/560/400/561404144013/TB1ZGXHsAvoK1RjSZPf8qtPKFla.desc%7Cvar%5Edesc%3Bsign%5E0f4809c2780d458ac93fe2b2f4e61b0f%3Blang%5Egbk%3Bt%5E1568784145/_____tmd_____/punish%3fx5secdata=5e0c8e1365474455070961b803bd560607b52cabf5960afff39b64ce58073f7828fec592a01b892e1b4d0c7354ac35e07dc8af3703187d6d64561402b1c87a3cae05d6a084e26e17fce6f28abaf9fc951746941a5f9f2cad199100251a84b0be151b80741e83f64c4b6c6a150f3eaeaef494cfd66c400e4dbc743096c9a31017f5c6f5201d7bce54728543490429fc2a1435bdf5cf73854b3714a2ac42aef9e9b49040bd56b2d6dd6f4610f66449f67eeb3ff7a3d06dd696fd84a55b25f3fdedf997c321f6d2cf4cdb81279f6c6cf98371b487a14d557b403c7b03ca136d27308b06cf3207fb4622cadb23ac5d92e12dbfcc508cd27518b3557b9baec779a869de74a91c129ec8c599b75aaa730c23a74c064a42424fa07de3912d37fe56189e1ef6064a3134649e8032b2082dd627fcbc7cd120e099f264b89ef507d142d0cf04b2673a44c0cb14368f70fa231134fedfe8205dfe1239a744196b742e164a00540a4b177b8d0df955413ec17254a23546e845bcf71bed6a8752b9a2a4124e3a469ba681383f88e5a4bbf4a12db075377482b6929da6a69aa16121648f116ed7791d11f85731371f02ff6e0d0d245e6cc1ec1fd88c29fd4287ac5e1fc1c34975be284aab771b6470e22c5ca92ce79513f8452f99a703ebcc3e11f30091b6c7e21d8e651d3be00ccd56d3454596d9e69f2e13d19ab182a47cbed3cd01db38aa9153202852d7c3ca2f8a48d00ee3b5532c%26x5step=100\'};})(window,\"__baxia__\");!function(){\"use strict\";var e=window,n=function(n,t){return(e.__baxia__||{})[n]||t},t=function(n,t){e.__baxia__=e.__baxia__||{},e.__baxia__[n]=t},r=location,a=document,o=function(e){var n=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:1,t=arguments.length&gt;2&amp;&amp;void 0!==arguments[2]?arguments[2]:1;if(!(t&gt;0&amp;&amp;Math.random()&gt;=t)){var o={code:n,msg:(e+\"\").substr(0,1e3)+\";v:1.0.3-beta1\",pid:\"baxia\",page:r.href.split(/[#?]/)[0],query:r.search.substr(1),hash:r.hash,referrer:a.referrer,title:a.title,ua:navigator.userAgent};console&amp;&amp;console.error(e),function(e,n){var t=[];for(var r in e)t.push(r+\"=\"+encodeURIComponent(e[r]));(new Image).src=n+t.join(\"&amp;\")}(o,\"//gm.mmstat.com/fsp.1.1?\")}};var i=document,s=document;({init:function(){this.punishPath=n(\"punishPath\",{}),t(\"punishPath\",\"\"),this.listenOnLoad()},getCurrentScript:function(){if(s.currentScript)return s.currentScript;for(var e=s.getElementsByTagName(\"script\"),n=\"\",t=e.length-1;t&gt;=0;t--)if(this.punishPath[e[t].src])return n=e[t];return n},updatejQueryEvent:function(e,n,t){window.jQuery&amp;&amp;(window.jQuery.event.triggered=n,t&amp;&amp;window.jQuery(e).trigger(t))},getHandlerPath:function(e,t){return t.jsPath?t.jsPath:\"\"+n(\"cdnPath\",\"https://g.alicdn.com/sd/baxia/1.0.3/\")+e+\".js\"},listenOnLoad:function(){var e=this.getCurrentScript();this.updatejQueryEvent(\"\",\"load\");var n=e.onreadystatechange||e.onload,t=this;e.onload=function(){var e=this;this.onload=this.onreadystatechange=null,t.handler(\"Jsonp\",{result:{rgv587_flag:\"sm\",url:t.punishPath[this.src]},config:{url:this.src,done:function(){console.log(\"request.done();\"),e.readyState=\"loaded\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"load\")},fail:function(){console.log(\"request.fail();\"),e.readyState=\"error\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"error\")}}})}},handler:function(){var e=arguments.length&gt;0&amp;&amp;void 0!==arguments[0]?arguments[0]:\"Xhr\",r=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:{},a=n(\"pluginInstance\",null),s=n(\"handlerQueue\",[]);try{if(a)return a.handler(r);s.push({pluginName:e,props:r});var u=s[0],l=u.pluginName,c=u.props,d=\"baxia\"+l+\"Handler\",h=this.getHandlerPath(d,c);t(\"handlerQueue\",s),function(e,n,t){var r=i.getElementsByTagName(\"script\")[0],a=i.createElement(\"script\");if(a.async=1,a.src=e,a.onerror=function(n){o(\"function:loadJS. msg:\"+e+\"load error。props：\"+JSON.stringify(t)),a.onerror=null},n){var s=!1;a.onload=a.onreadystatechange=function(){s||a.readyState&amp;&amp;!/loaded|complete/.test(a.readyState)||(a.onload=a.onreadystatechange=null,s=!0,n())}}r.parentNode.insertBefore(a,r)}(h,function(){s=n(\"handlerQueue\",[]),a=new window[d];for(var e=0;e', 1570240882, 0, 0, 0, 24.00, 221.00, 0, NULL, 42, 0, '', '', 'https://detail.tmall.com/item.htm?spm=a230r.1.14.167.607d21e1v8DvX7&id=561404144013&ns=1&abbucket=2', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (29, 0, 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\5409c8f62e74b3a809bc61772eb62881.jpg', '[\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\07\\\\\\\\5409c8f62e74b3a809bc61772eb62881.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\07\\\\\\\\1404ffd13367de0b01d8d112cef2a3f3.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\07\\\\\\\\3b1a64c644aaad228ac39d9d0ed444f7.jpg\"]', '摆渡人2重返荒原正版包邮书籍与追风筝的人偷影子的人6册同类青春外国文学小说书籍书排行榜新华书店文轩官网旗舰店', '摆渡人2重返荒原正版包邮书籍与追风筝的人偷影子的人6册同类青春外国文学小说书籍书排行榜新华书店文轩官网旗舰店', '', '4', 55.00, 0.00, 55.00, 55.00, '件', 0, 0, 555, 1, 0, 0, 0, 0, '(function(win,key){win[key]=window[key]||{};win[key].cdnPath=\'https://g.alicdn.com/sd/baxia/1.0.5/\';win[key].punishPath={[\'https://dscnew.taobao.com/i6/551/630/558634023607/TB1uQzAgFP7gK0jSZFj8qw5aXla.desc%7Cvar%5Edesc%3Bsign%5Eb5d497587a0464b57b2e58a315f0b652%3Blang%5Egbk%3Bt%5E1569215402\']:\'https://login.taobao.com/member/login.jhtml?style=mini&amp;from=sm&amp;full_redirect=false&amp;redirectURL=http%3a%2f%2fdscnew.taobao.com/i6/551/630/558634023607/TB1uQzAgFP7gK0jSZFj8qw5aXla.desc%7Cvar%5Edesc%3Bsign%5Eb5d497587a0464b57b2e58a315f0b652%3Blang%5Egbk%3Bt%5E1569215402/_____tmd_____/punish%3fx5secdata=5e0c8e1365474455070961b803bd560607b52cabf5960afff39b64ce58073f7828fec592a01b892e1b4d0c7354ac35e07dc8af3703187d6d64561402b1c87a3cae05d6a084e26e17fce6f28abaf9fc951746941a5f9f2cad199100251a84b0be151b80741e83f64c4b6c6a150f3eaeae71fd5862c7026be33ea0f56fccab7ceacb5a6411e35f3f80f686e9d80e479c97498602800fb9001b7e6a5d88c86cd08eb49040bd56b2d6dd6f4610f66449f67eeb3ff7a3d06dd696fd84a55b25f3fdedf997c321f6d2cf4cdb81279f6c6cf98371b487a14d557b403c7b03ca136d27308b06cf3207fb4622cadb23ac5d92e12dbfcc508cd27518b3557b9baec779a869de74a91c129ec8c599b75aaa730c23a74c064a42424fa07de3912d37fe56189e1ef6064a3134649e8032b2082dd627fcbc7cd120e099f264b89ef507d142d0cf9879b748ea613650d9362fd03e689026a2dddfca029599e9cbbf8a6ad316ff6bb4a09a48cbe5e48cf4aa1e805a5eb56296e2672a43b82fac48b4b6ab4a1727f4469ba681383f88e5a4bbf4a12db0753726603c9a18804ce8a2c478ee233d4e5a9357670c099cec98cae1343c0878387618c95c9ce5a7d57ee4bfb757478e9b67d63948627c85811f6731c8b73272ee71df83e3034944a16f45b8d0a3b1dfac3b1d8e651d3be00ccd56d3454596d9e69f2e13d19ab182a47cbed3cd01db38aa91917b00cfb2b04641e3f6f0b25c862484%26x5step=100\'};})(window,\"__baxia__\");!function(){\"use strict\";var e=window,n=function(n,t){return(e.__baxia__||{})[n]||t},t=function(n,t){e.__baxia__=e.__baxia__||{},e.__baxia__[n]=t},r=location,a=document,o=function(e){var n=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:1,t=arguments.length&gt;2&amp;&amp;void 0!==arguments[2]?arguments[2]:1;if(!(t&gt;0&amp;&amp;Math.random()&gt;=t)){var o={code:n,msg:(e+\"\").substr(0,1e3)+\";v:1.0.3-beta1\",pid:\"baxia\",page:r.href.split(/[#?]/)[0],query:r.search.substr(1),hash:r.hash,referrer:a.referrer,title:a.title,ua:navigator.userAgent};console&amp;&amp;console.error(e),function(e,n){var t=[];for(var r in e)t.push(r+\"=\"+encodeURIComponent(e[r]));(new Image).src=n+t.join(\"&amp;\")}(o,\"//gm.mmstat.com/fsp.1.1?\")}};var i=document,s=document;({init:function(){this.punishPath=n(\"punishPath\",{}),t(\"punishPath\",\"\"),this.listenOnLoad()},getCurrentScript:function(){if(s.currentScript)return s.currentScript;for(var e=s.getElementsByTagName(\"script\"),n=\"\",t=e.length-1;t&gt;=0;t--)if(this.punishPath[e[t].src])return n=e[t];return n},updatejQueryEvent:function(e,n,t){window.jQuery&amp;&amp;(window.jQuery.event.triggered=n,t&amp;&amp;window.jQuery(e).trigger(t))},getHandlerPath:function(e,t){return t.jsPath?t.jsPath:\"\"+n(\"cdnPath\",\"https://g.alicdn.com/sd/baxia/1.0.3/\")+e+\".js\"},listenOnLoad:function(){var e=this.getCurrentScript();this.updatejQueryEvent(\"\",\"load\");var n=e.onreadystatechange||e.onload,t=this;e.onload=function(){var e=this;this.onload=this.onreadystatechange=null,t.handler(\"Jsonp\",{result:{rgv587_flag:\"sm\",url:t.punishPath[this.src]},config:{url:this.src,done:function(){console.log(\"request.done();\"),e.readyState=\"loaded\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"load\")},fail:function(){console.log(\"request.fail();\"),e.readyState=\"error\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"error\")}}})}},handler:function(){var e=arguments.length&gt;0&amp;&amp;void 0!==arguments[0]?arguments[0]:\"Xhr\",r=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:{},a=n(\"pluginInstance\",null),s=n(\"handlerQueue\",[]);try{if(a)return a.handler(r);s.push({pluginName:e,props:r});var u=s[0],l=u.pluginName,c=u.props,d=\"baxia\"+l+\"Handler\",h=this.getHandlerPath(d,c);t(\"handlerQueue\",s),function(e,n,t){var r=i.getElementsByTagName(\"script\")[0],a=i.createElement(\"script\");if(a.async=1,a.src=e,a.onerror=function(n){o(\"function:loadJS. msg:\"+e+\"load error。props：\"+JSON.stringify(t)),a.onerror=null},n){var s=!1;a.onload=a.onreadystatechange=function(){s||a.readyState&amp;&amp;!/loaded|complete/.test(a.readyState)||(a.onload=a.onreadystatechange=null,s=!0,n())}}r.parentNode.insertBefore(a,r)}(h,function(){s=n(\"handlerQueue\",[]),a=new window[d];for(var e=0;e', 1570456761, 0, 0, 0, 555.00, 52.00, 0, NULL, 55, 0, '', '', 'https://detail.tmall.com/item.htm?spm=a220o.1000855.w20625719-15011179695.104.514c5fb0vvQkAh&id=558634023607', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (30, 0, 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\cb6dc012404524aaa47a47766c59f2e0.jpg', '[\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\07\\\\\\\\cb6dc012404524aaa47a47766c59f2e0.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\07\\\\\\\\0e5d897f56384df3cb8b94d4aee94bfc.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\07\\\\\\\\fe4bfe9f98c015001c1bbf74ee26c41a.jpg\"]', '【新华书店】摆渡人克莱儿麦克福尔著书正版包邮书籍与追风筝的人偷影子的人6册3册2同为外国文学心灵治愈系小说读物励志丛书', '【新华书店】摆渡人克莱儿麦克福尔著书正版包邮书籍与追风筝的人偷影子的人6册3册2同为外国文学心灵治愈系小说读物励志丛书', '', '4', 544.00, 0.00, 554.00, 5.00, '件', 0, 0, 55222, 1, 0, 0, 0, 0, '(function(win,key){win[key]=window[key]||{};win[key].cdnPath=\'https://g.alicdn.com/sd/baxia/1.0.5/\';win[key].punishPath={[\'https://dscnew.taobao.com/i5/450/210/45421460473/TB1EaShgUD1gK0jSZFG8qvd3Fla.desc%7Cvar%5Edesc%3Bsign%5Efd572c5e507de46eeca7251e3fb384d8%3Blang%5Egbk%3Bt%5E1569566592\']:\'https://login.taobao.com/member/login.jhtml?style=mini&amp;from=sm&amp;full_redirect=false&amp;redirectURL=http%3a%2f%2fdscnew.taobao.com/i5/450/210/45421460473/TB1EaShgUD1gK0jSZFG8qvd3Fla.desc%7Cvar%5Edesc%3Bsign%5Efd572c5e507de46eeca7251e3fb384d8%3Blang%5Egbk%3Bt%5E1569566592/_____tmd_____/punish%3fx5secdata=5e0c8e1365474455070961b803bd560607b52cabf5960afff39b64ce58073f7828fec592a01b892e1b4d0c7354ac35e07dc8af3703187d6d64561402b1c87a3cae05d6a084e26e17fce6f28abaf9fc951746941a5f9f2cad199100251a84b0be151b80741e83f64c4b6c6a150f3eaeae00e37f8db06c2d728b4b9a9224e7aad3d54b223cc9947beda1f00348a8ebcf2f527d858d68341840566ba735a898f85db49040bd56b2d6dd6f4610f66449f67eeb3ff7a3d06dd696fd84a55b25f3fdedf997c321f6d2cf4cdb81279f6c6cf98371b487a14d557b403c7b03ca136d27308b06cf3207fb4622cadb23ac5d92e12dbfcc508cd27518b3557b9baec779a869de74a91c129ec8c599b75aaa730c23a74c064a42424fa07de3912d37fe56189e1ef6064a3134649e8032b2082dd627fcbc7cd120e099f264b89ef507d142d0cf1af4eb3396f681a5d921c1bccf15f696c6d7f43f6b39e667d9757556c41047c5383996bd2d2eb3eeaddf79c7843b3aa2d0e785f704ae2958a6b308ebcaabfe5a5450b1b584804745562066ed239f5cef466a461a471830ee795a3dcfa50049f6198b7f4e8946b111fc32126d9c85d6f57b485c084fce992329d1052a387e04a6bd46d2e90cf69c0bfa026e0a0e411e5d1ca1979ab3feafce987a6d3a779322f1a31f729f4ded266cd4cb3f3137e44645982a591aff3eea7558da34351930bc6b071ee513099ac2c23e3f8d75a8c052ff%26x5step=100\'};})(window,\"__baxia__\");!function(){\"use strict\";var e=window,n=function(n,t){return(e.__baxia__||{})[n]||t},t=function(n,t){e.__baxia__=e.__baxia__||{},e.__baxia__[n]=t},r=location,a=document,o=function(e){var n=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:1,t=arguments.length&gt;2&amp;&amp;void 0!==arguments[2]?arguments[2]:1;if(!(t&gt;0&amp;&amp;Math.random()&gt;=t)){var o={code:n,msg:(e+\"\").substr(0,1e3)+\";v:1.0.3-beta1\",pid:\"baxia\",page:r.href.split(/[#?]/)[0],query:r.search.substr(1),hash:r.hash,referrer:a.referrer,title:a.title,ua:navigator.userAgent};console&amp;&amp;console.error(e),function(e,n){var t=[];for(var r in e)t.push(r+\"=\"+encodeURIComponent(e[r]));(new Image).src=n+t.join(\"&amp;\")}(o,\"//gm.mmstat.com/fsp.1.1?\")}};var i=document,s=document;({init:function(){this.punishPath=n(\"punishPath\",{}),t(\"punishPath\",\"\"),this.listenOnLoad()},getCurrentScript:function(){if(s.currentScript)return s.currentScript;for(var e=s.getElementsByTagName(\"script\"),n=\"\",t=e.length-1;t&gt;=0;t--)if(this.punishPath[e[t].src])return n=e[t];return n},updatejQueryEvent:function(e,n,t){window.jQuery&amp;&amp;(window.jQuery.event.triggered=n,t&amp;&amp;window.jQuery(e).trigger(t))},getHandlerPath:function(e,t){return t.jsPath?t.jsPath:\"\"+n(\"cdnPath\",\"https://g.alicdn.com/sd/baxia/1.0.3/\")+e+\".js\"},listenOnLoad:function(){var e=this.getCurrentScript();this.updatejQueryEvent(\"\",\"load\");var n=e.onreadystatechange||e.onload,t=this;e.onload=function(){var e=this;this.onload=this.onreadystatechange=null,t.handler(\"Jsonp\",{result:{rgv587_flag:\"sm\",url:t.punishPath[this.src]},config:{url:this.src,done:function(){console.log(\"request.done();\"),e.readyState=\"loaded\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"load\")},fail:function(){console.log(\"request.fail();\"),e.readyState=\"error\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"error\")}}})}},handler:function(){var e=arguments.length&gt;0&amp;&amp;void 0!==arguments[0]?arguments[0]:\"Xhr\",r=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:{},a=n(\"pluginInstance\",null),s=n(\"handlerQueue\",[]);try{if(a)return a.handler(r);s.push({pluginName:e,props:r});var u=s[0],l=u.pluginName,c=u.props,d=\"baxia\"+l+\"Handler\",h=this.getHandlerPath(d,c);t(\"handlerQueue\",s),function(e,n,t){var r=i.getElementsByTagName(\"script\")[0],a=i.createElement(\"script\");if(a.async=1,a.src=e,a.onerror=function(n){o(\"function:loadJS. msg:\"+e+\"load error。props：\"+JSON.stringify(t)),a.onerror=null},n){var s=!1;a.onload=a.onreadystatechange=function(){s||a.readyState&amp;&amp;!/loaded|complete/.test(a.readyState)||(a.onload=a.onreadystatechange=null,s=!0,n())}}r.parentNode.insertBefore(a,r)}(h,function(){s=n(\"handlerQueue\",[]),a=new window[d];for(var e=0;e', 1570456805, 0, 0, 0, 5300.00, 511.00, 0, NULL, 54, 0, '', '', 'https://detail.tmall.com/item.htm?spm=a220o.1000855.1998025129.8.e849209djhCuwv&pvid=cd5f47df-6111-4b56-94ea-f201e8cb2e0b&pos=4&acm=03054.1003.1.2768562&id=45421460473&scm=1007.16862.95220.23864_0_0&utparam=%7B%22x_hestia_source%22:%2223864%22,%22x_object', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (31, 0, 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\d6dacfbabf8695a2c7d2f821f2e3e87a.jpg', '[\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\07\\\\\\\\d6dacfbabf8695a2c7d2f821f2e3e87a.jpg\"]', '正版50个教育法我把三个儿子送入了斯坦福陈美龄育儿随笔教育理念一位妈妈如何成功使3名儿子升读斯坦福新华文轩正版', '正版50个教育法我把三个儿子送入了斯坦福陈美龄育儿随笔教育理念一位妈妈如何成功使3名儿子升读斯坦福新华文轩正版', '', '4', 55.00, 0.00, 50.00, 0.00, '件', 0, 0, 5555, 1, 0, 0, 0, 0, '(function(win,key){win[key]=window[key]||{};win[key].cdnPath=\'https://g.alicdn.com/sd/baxia/1.0.5/\';win[key].punishPath={[\'https://dscnew.taobao.com/i3/540/600/540600468667/TB1crK7blr0gK0jSZFn8qvRRXla.desc%7Cvar%5Edesc%3Bsign%5E508b2f65e0a124751aef9d90e58bad92%3Blang%5Egbk%3Bt%5E1568722559\']:\'https://login.taobao.com/member/login.jhtml?style=mini&amp;from=sm&amp;full_redirect=false&amp;redirectURL=http%3a%2f%2fdscnew.taobao.com/i3/540/600/540600468667/TB1crK7blr0gK0jSZFn8qvRRXla.desc%7Cvar%5Edesc%3Bsign%5E508b2f65e0a124751aef9d90e58bad92%3Blang%5Egbk%3Bt%5E1568722559/_____tmd_____/punish%3fx5secdata=5e0c8e1365474455070961b803bd560607b52cabf5960afff39b64ce58073f7828fec592a01b892e1b4d0c7354ac35e07dc8af3703187d6d64561402b1c87a3cae05d6a084e26e17fce6f28abaf9fc951746941a5f9f2cad199100251a84b0be151b80741e83f64c4b6c6a150f3eaeaeeb959e05a3cd745940afda567c68ae24026d3ea4c2831ac6e177b2d5f16e5b3b659f85da919a6b38a2244f1565410497b49040bd56b2d6dd6f4610f66449f67eeb3ff7a3d06dd696fd84a55b25f3fdedf997c321f6d2cf4cdb81279f6c6cf98371b487a14d557b403c7b03ca136d27308b06cf3207fb4622cadb23ac5d92e12dbfcc508cd27518b3557b9baec779a869de74a91c129ec8c599b75aaa730c23a74c064a42424fa07de3912d37fe56189e1ef6064a3134649e8032b2082dd627fcbc7cd120e099f264b89ef507d142d0cf544b83fdf8a1a60b971ef7c5ffeaea2fdff187cbdfe40e1f4d5d1b1132b57f5e9dd1f3d5d784818002f6e4cf1f17c0461075f5480bf3e7c6de9035d5f5b24c33469ba681383f88e5a4bbf4a12db075377799203a5b2392d32d2c884128fe8275f4f55b4969603db057026cfb242d244772139e17b32a873c9ead08dfaae2a6c65ca7722992248b1562a326f68e28f0dff0be1f92b5b9090ad3b062ca2a73de9d1d8e651d3be00ccd56d3454596d9e69f2e13d19ab182a47cbed3cd01db38aa91ab42cf4e17a73909227ed7876fdd1993%26x5step=100\'};})(window,\"__baxia__\");!function(){\"use strict\";var e=window,n=function(n,t){return(e.__baxia__||{})[n]||t},t=function(n,t){e.__baxia__=e.__baxia__||{},e.__baxia__[n]=t},r=location,a=document,o=function(e){var n=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:1,t=arguments.length&gt;2&amp;&amp;void 0!==arguments[2]?arguments[2]:1;if(!(t&gt;0&amp;&amp;Math.random()&gt;=t)){var o={code:n,msg:(e+\"\").substr(0,1e3)+\";v:1.0.3-beta1\",pid:\"baxia\",page:r.href.split(/[#?]/)[0],query:r.search.substr(1),hash:r.hash,referrer:a.referrer,title:a.title,ua:navigator.userAgent};console&amp;&amp;console.error(e),function(e,n){var t=[];for(var r in e)t.push(r+\"=\"+encodeURIComponent(e[r]));(new Image).src=n+t.join(\"&amp;\")}(o,\"//gm.mmstat.com/fsp.1.1?\")}};var i=document,s=document;({init:function(){this.punishPath=n(\"punishPath\",{}),t(\"punishPath\",\"\"),this.listenOnLoad()},getCurrentScript:function(){if(s.currentScript)return s.currentScript;for(var e=s.getElementsByTagName(\"script\"),n=\"\",t=e.length-1;t&gt;=0;t--)if(this.punishPath[e[t].src])return n=e[t];return n},updatejQueryEvent:function(e,n,t){window.jQuery&amp;&amp;(window.jQuery.event.triggered=n,t&amp;&amp;window.jQuery(e).trigger(t))},getHandlerPath:function(e,t){return t.jsPath?t.jsPath:\"\"+n(\"cdnPath\",\"https://g.alicdn.com/sd/baxia/1.0.3/\")+e+\".js\"},listenOnLoad:function(){var e=this.getCurrentScript();this.updatejQueryEvent(\"\",\"load\");var n=e.onreadystatechange||e.onload,t=this;e.onload=function(){var e=this;this.onload=this.onreadystatechange=null,t.handler(\"Jsonp\",{result:{rgv587_flag:\"sm\",url:t.punishPath[this.src]},config:{url:this.src,done:function(){console.log(\"request.done();\"),e.readyState=\"loaded\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"load\")},fail:function(){console.log(\"request.fail();\"),e.readyState=\"error\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"error\")}}})}},handler:function(){var e=arguments.length&gt;0&amp;&amp;void 0!==arguments[0]?arguments[0]:\"Xhr\",r=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:{},a=n(\"pluginInstance\",null),s=n(\"handlerQueue\",[]);try{if(a)return a.handler(r);s.push({pluginName:e,props:r});var u=s[0],l=u.pluginName,c=u.props,d=\"baxia\"+l+\"Handler\",h=this.getHandlerPath(d,c);t(\"handlerQueue\",s),function(e,n,t){var r=i.getElementsByTagName(\"script\")[0],a=i.createElement(\"script\");if(a.async=1,a.src=e,a.onerror=function(n){o(\"function:loadJS. msg:\"+e+\"load error。props：\"+JSON.stringify(t)),a.onerror=null},n){var s=!1;a.onload=a.onreadystatechange=function(){s||a.readyState&amp;&amp;!/loaded|complete/.test(a.readyState)||(a.onload=a.onreadystatechange=null,s=!0,n())}}r.parentNode.insertBefore(a,r)}(h,function(){s=n(\"handlerQueue\",[]),a=new window[d];for(var e=0;e', 1570456882, 0, 0, 0, 112.00, 52.00, 0, NULL, 44, 0, '', '', 'https://detail.tmall.com/item.htm?spm=a220o.1000855.1998025129.10.e849209djhCuwv&pvid=cd5f47df-6111-4b56-94ea-f201e8cb2e0b&pos=5&acm=03054.1003.1.2768562&id=540600468667&scm=1007.16862.95220.23864_0_0&utparam=%7B\"x_hestia_source\":\"23864\",\"x_object_type\":\"', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (32, 0, 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\08\\\\03a681fe37eb94240a63f1424dc74ae2.jpg', '[\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\08\\\\\\\\03a681fe37eb94240a63f1424dc74ae2.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\08\\\\\\\\8f8892b30fd0321ce68479c9657ffe3b.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\08\\\\\\\\81640c14a036f7d13b3595ce4f039ead.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\08\\\\\\\\5e9b34c96015573589729ab978342fb6.jpg\"]', '每100减50【当当网正版书籍】你的善良必须有点锋芒生活不是用来妥协的明白请趁早青春励志散文全集', '【当当网正版书籍】你的善良必须有点锋芒生活不是用来妥协的明白请趁早青春励志散文全集', '青春励志散文全集', '4', 30.00, 0.00, 35.00, 0.00, '件', 0, 0, 16777215, 1, 0, 0, 0, 0, '(function(win,key){win[key]=window[key]||{};win[key].cdnPath=\'https://g.alicdn.com/sd/baxia/1.0.5/\';win[key].punishPath={[\'https://dscnew.taobao.com/i2/530/690/537697992974/TB1nVy.g7L0gK0jSZFA8qwA9pla.desc%7Cvar%5Edesc%3Bsign%5Eec21ed5206c63b8ae831858f596447d0%3Blang%5Egbk%3Bt%5E1570502625\']:\'https://login.taobao.com/member/login.jhtml?style=mini&amp;from=sm&amp;full_redirect=false&amp;redirectURL=http%3a%2f%2fdscnew.taobao.com/i2/530/690/537697992974/TB1nVy.g7L0gK0jSZFA8qwA9pla.desc%7Cvar%5Edesc%3Bsign%5Eec21ed5206c63b8ae831858f596447d0%3Blang%5Egbk%3Bt%5E1570502625/_____tmd_____/punish%3fx5secdata=5e0c8e1365474455070961b803bd560607b52cabf5960afff39b64ce58073f7828fec592a01b892e1b4d0c7354ac35e07dc8af3703187d6d64561402b1c87a3cae05d6a084e26e17fce6f28abaf9fc951746941a5f9f2cad199100251a84b0be151b80741e83f64c4b6c6a150f3eaeae7ab261cf75c286e7ca9d1b3cc0cbef238a9171b746b2089c421f207f9657ec8903284be60c3b11dcef5cdb46402ae5a7b49040bd56b2d6dd6f4610f66449f67eeb3ff7a3d06dd696fd84a55b25f3fdedf997c321f6d2cf4cdb81279f6c6cf98371b487a14d557b403c7b03ca136d27308b06cf3207fb4622cadb23ac5d92e12dbfcc508cd27518b3557b9baec779a869de74a91c129ec8c599b75aaa730c23a74c064a42424fa07de3912d37fe56189e1ef6064a3134649e8032b2082dd627fcbc7cd120e099f264b89ef507d142d0cf23e36d43e585dfa1fd8f800caf8002a01061302490e8310e8b6ffebb2d7b8d92478c60190d0165e25dd79fe9db223961f47992e01d123ea77da94df637d79296469ba681383f88e5a4bbf4a12db07537022276b598df4f3bd241b6be374ba97f65be3700582cb566fdbdd21b5e1654ebe82ce7ac1aca6b6a21e31f39f86fbaa22e71bf7d5217fac6bf8db528a372f190ab6f05d1e6ada4073620b94da6a7ec191d8e651d3be00ccd56d3454596d9e69f2e13d19ab182a47cbed3cd01db38aa91e36a74b07684414e3765df99ab867c79%26x5step=100\'};})(window,\"__baxia__\");!function(){\"use strict\";var e=window,n=function(n,t){return(e.__baxia__||{})[n]||t},t=function(n,t){e.__baxia__=e.__baxia__||{},e.__baxia__[n]=t},r=location,a=document,o=function(e){var n=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:1,t=arguments.length&gt;2&amp;&amp;void 0!==arguments[2]?arguments[2]:1;if(!(t&gt;0&amp;&amp;Math.random()&gt;=t)){var o={code:n,msg:(e+\"\").substr(0,1e3)+\";v:1.0.3-beta1\",pid:\"baxia\",page:r.href.split(/[#?]/)[0],query:r.search.substr(1),hash:r.hash,referrer:a.referrer,title:a.title,ua:navigator.userAgent};console&amp;&amp;console.error(e),function(e,n){var t=[];for(var r in e)t.push(r+\"=\"+encodeURIComponent(e[r]));(new Image).src=n+t.join(\"&amp;\")}(o,\"//gm.mmstat.com/fsp.1.1?\")}};var i=document,s=document;({init:function(){this.punishPath=n(\"punishPath\",{}),t(\"punishPath\",\"\"),this.listenOnLoad()},getCurrentScript:function(){if(s.currentScript)return s.currentScript;for(var e=s.getElementsByTagName(\"script\"),n=\"\",t=e.length-1;t&gt;=0;t--)if(this.punishPath[e[t].src])return n=e[t];return n},updatejQueryEvent:function(e,n,t){window.jQuery&amp;&amp;(window.jQuery.event.triggered=n,t&amp;&amp;window.jQuery(e).trigger(t))},getHandlerPath:function(e,t){return t.jsPath?t.jsPath:\"\"+n(\"cdnPath\",\"https://g.alicdn.com/sd/baxia/1.0.3/\")+e+\".js\"},listenOnLoad:function(){var e=this.getCurrentScript();this.updatejQueryEvent(\"\",\"load\");var n=e.onreadystatechange||e.onload,t=this;e.onload=function(){var e=this;this.onload=this.onreadystatechange=null,t.handler(\"Jsonp\",{result:{rgv587_flag:\"sm\",url:t.punishPath[this.src]},config:{url:this.src,done:function(){console.log(\"request.done();\"),e.readyState=\"loaded\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"load\")},fail:function(){console.log(\"request.fail();\"),e.readyState=\"error\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"error\")}}})}},handler:function(){var e=arguments.length&gt;0&amp;&amp;void 0!==arguments[0]?arguments[0]:\"Xhr\",r=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:{},a=n(\"pluginInstance\",null),s=n(\"handlerQueue\",[]);try{if(a)return a.handler(r);s.push({pluginName:e,props:r});var u=s[0],l=u.pluginName,c=u.props,d=\"baxia\"+l+\"Handler\",h=this.getHandlerPath(d,c);t(\"handlerQueue\",s),function(e,n,t){var r=i.getElementsByTagName(\"script\")[0],a=i.createElement(\"script\");if(a.async=1,a.src=e,a.onerror=function(n){o(\"function:loadJS. msg:\"+e+\"load error。props：\"+JSON.stringify(t)),a.onerror=null},n){var s=!1;a.onload=a.onreadystatechange=function(){s||a.readyState&amp;&amp;!/loaded|complete/.test(a.readyState)||(a.onload=a.onreadystatechange=null,s=!0,n())}}r.parentNode.insertBefore(a,r)}(h,function(){s=n(\"handlerQueue\",[]),a=new window[d];for(var e=0;e', 1570544397, 0, 0, 0, 250.00, 20.00, 0, NULL, 56940, 0, '', '', 'https://detail.tmall.com/item.htm?spm=a230r.1.14.13.60a74978daVNYC&id=537697992974&cm_id=140105335569ed55e27b&abbucket=2', 0, '三毛', '上锁的房间');
INSERT INTO `eb_store_product` VALUES (33, 0, 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\09\\\\948c07374bed8b23ba394a4fa94c23bc.jpg', '[\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\09\\\\\\\\948c07374bed8b23ba394a4fa94c23bc.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\09\\\\\\\\74bc0ccf930357503d42d9b25a78cc4b.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\09\\\\\\\\7fdb6c114b141579ae3e34468b31287a.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\09\\\\\\\\292cc7a4b831a9ca96fe6bcb1eb0febf.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\09\\\\\\\\c8beaef631e3407501915c8892ecde08.jpg\"]', '正版全套3册不爱我,别伤我3+2+1套装霸道总裁爱情小说畅销书籍言情小书现代都市情感小说虐心青春文学小说豪门畅销', '正版全套3册不爱我,别伤我3+2+1套装霸道总裁爱情小说畅销书籍言情小书现代都市情感小说虐心青春文学小说豪门畅销', '', '1', 25.00, 0.00, 52.00, 0.00, '件', 0, 0, 2545424, 1, 0, 0, 0, 0, '(function(win,key){win[key]=window[key]||{};win[key].cdnPath=\'https://g.alicdn.com/sd/baxia/1.0.5/\';win[key].punishPath={[\'https://dscnew.taobao.com/i1/570/140/577143295047/TB1pq9qIgHqK1RjSZFk8qt.WFla.desc%7Cvar%5Edesc%3Bsign%5Efa82753b0d82ef08634c36e1312024f8%3Blang%5Egbk%3Bt%5E1568754169\']:\'https://login.taobao.com/member/login.jhtml?style=mini&amp;from=sm&amp;full_redirect=false&amp;redirectURL=http%3a%2f%2fdscnew.taobao.com/i1/570/140/577143295047/TB1pq9qIgHqK1RjSZFk8qt.WFla.desc%7Cvar%5Edesc%3Bsign%5Efa82753b0d82ef08634c36e1312024f8%3Blang%5Egbk%3Bt%5E1568754169/_____tmd_____/punish%3fx5secdata=5e0c8e1365474455070961b803bd560607b52cabf5960afff39b64ce58073f7828fec592a01b892e1b4d0c7354ac35e07dc8af3703187d6d64561402b1c87a3cae05d6a084e26e17fce6f28abaf9fc951746941a5f9f2cad199100251a84b0be151b80741e83f64c4b6c6a150f3eaeae641a76b322da380c4833602ecbc3ab2a95d4838465d315117c6f836509e63030bda446fed80a9ea72af470e6a15959edb49040bd56b2d6dd6f4610f66449f67eeb3ff7a3d06dd696fd84a55b25f3fdedf997c321f6d2cf4cdb81279f6c6cf98371b487a14d557b403c7b03ca136d27308b06cf3207fb4622cadb23ac5d92e12dbfcc508cd27518b3557b9baec779a869de74a91c129ec8c599b75aaa730c23a74c064a42424fa07de3912d37fe56189e1ef6064a3134649e8032b2082dd627fcbc7cd120e099f264b89ef507d142d0cf97b0e004be765746a7bc3d20ec07172a7bd290260d8d8580323779c100bb3650ae9c5f953ef081bd80520e9ac1eac32b6752f9720b7f2eb8bd1a6727c11e7f38469ba681383f88e5a4bbf4a12db0753771a7677b1bd7b995389a2653357c55587e5af1a4b6284dede7ddc76457f396283ee9773034c52a43a930470b6c9c28115d398021574293441d2261ee16e1fdb93982d3a4ab3a547c99de901766b02dc51d8e651d3be00ccd56d3454596d9e69f2e13d19ab182a47cbed3cd01db38aa9162e22c60d8e55d0d095eba1c45986799%26x5step=100\'};})(window,\"__baxia__\");!function(){\"use strict\";var e=window,n=function(n,t){return(e.__baxia__||{})[n]||t},t=function(n,t){e.__baxia__=e.__baxia__||{},e.__baxia__[n]=t},r=location,a=document,o=function(e){var n=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:1,t=arguments.length&gt;2&amp;&amp;void 0!==arguments[2]?arguments[2]:1;if(!(t&gt;0&amp;&amp;Math.random()&gt;=t)){var o={code:n,msg:(e+\"\").substr(0,1e3)+\";v:1.0.3-beta1\",pid:\"baxia\",page:r.href.split(/[#?]/)[0],query:r.search.substr(1),hash:r.hash,referrer:a.referrer,title:a.title,ua:navigator.userAgent};console&amp;&amp;console.error(e),function(e,n){var t=[];for(var r in e)t.push(r+\"=\"+encodeURIComponent(e[r]));(new Image).src=n+t.join(\"&amp;\")}(o,\"//gm.mmstat.com/fsp.1.1?\")}};var i=document,s=document;({init:function(){this.punishPath=n(\"punishPath\",{}),t(\"punishPath\",\"\"),this.listenOnLoad()},getCurrentScript:function(){if(s.currentScript)return s.currentScript;for(var e=s.getElementsByTagName(\"script\"),n=\"\",t=e.length-1;t&gt;=0;t--)if(this.punishPath[e[t].src])return n=e[t];return n},updatejQueryEvent:function(e,n,t){window.jQuery&amp;&amp;(window.jQuery.event.triggered=n,t&amp;&amp;window.jQuery(e).trigger(t))},getHandlerPath:function(e,t){return t.jsPath?t.jsPath:\"\"+n(\"cdnPath\",\"https://g.alicdn.com/sd/baxia/1.0.3/\")+e+\".js\"},listenOnLoad:function(){var e=this.getCurrentScript();this.updatejQueryEvent(\"\",\"load\");var n=e.onreadystatechange||e.onload,t=this;e.onload=function(){var e=this;this.onload=this.onreadystatechange=null,t.handler(\"Jsonp\",{result:{rgv587_flag:\"sm\",url:t.punishPath[this.src]},config:{url:this.src,done:function(){console.log(\"request.done();\"),e.readyState=\"loaded\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"load\")},fail:function(){console.log(\"request.fail();\"),e.readyState=\"error\",n&amp;&amp;n.apply(e,[\"\",!1]),t.updatejQueryEvent(e,\"\",\"error\")}}})}},handler:function(){var e=arguments.length&gt;0&amp;&amp;void 0!==arguments[0]?arguments[0]:\"Xhr\",r=arguments.length&gt;1&amp;&amp;void 0!==arguments[1]?arguments[1]:{},a=n(\"pluginInstance\",null),s=n(\"handlerQueue\",[]);try{if(a)return a.handler(r);s.push({pluginName:e,props:r});var u=s[0],l=u.pluginName,c=u.props,d=\"baxia\"+l+\"Handler\",h=this.getHandlerPath(d,c);t(\"handlerQueue\",s),function(e,n,t){var r=i.getElementsByTagName(\"script\")[0],a=i.createElement(\"script\");if(a.async=1,a.src=e,a.onerror=function(n){o(\"function:loadJS. msg:\"+e+\"load error。props：\"+JSON.stringify(t)),a.onerror=null},n){var s=!1;a.onload=a.onreadystatechange=function(){s||a.readyState&amp;&amp;!/loaded|complete/.test(a.readyState)||(a.onload=a.onreadystatechange=null,s=!0,n())}}r.parentNode.insertBefore(a,r)}(h,function(){s=n(\"handlerQueue\",[]),a=new window[d];for(var e=0;e', 1570591214, 0, 0, 0, 200.00, 15.00, 0, NULL, 555, 0, '', '', 'https://detail.tmall.com/item.htm?spm=a230r.1.14.20.ca197824ziVMGS&id=577143295047&ns=1&abbucket=2', 0, NULL, NULL);
INSERT INTO `eb_store_product` VALUES (34, 0, 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\09\\\\7fdb6c114b141579ae3e34468b31287a.jpg', '[\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\08\\\\\\\\5e9b34c96015573589729ab978342fb6.jpg\",\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\08\\\\\\\\03a681fe37eb94240a63f1424dc74ae2.jpg\"]', 'sss', 'sss', 'sss', '3', 11.00, 0.00, 111.00, 11.00, '件', 11, 0, 11, 0, 0, 0, 0, 0, '', 1572405445, 0, 0, 0, 11.00, 11.00, 0, NULL, 11, 0, '', '', '', 0, '三毛', '中国');

-- ----------------------------
-- Table structure for eb_store_product_attr
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_attr`;
CREATE TABLE `eb_store_product_attr`  (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `attr_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名',
  `attr_values` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  INDEX `store_id`(`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_product_attr
-- ----------------------------
INSERT INTO `eb_store_product_attr` VALUES (1, '颜色', '黑色,白色,蓝色');
INSERT INTO `eb_store_product_attr` VALUES (2, '孔距', '30cm,40cm');
INSERT INTO `eb_store_product_attr` VALUES (3, '容量', '3L,4L');
INSERT INTO `eb_store_product_attr` VALUES (3, '颜色', '白色,黑色');

-- ----------------------------
-- Table structure for eb_store_product_attr_result
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_attr_result`;
CREATE TABLE `eb_store_product_attr_result`  (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性参数',
  `change_time` int(10) UNSIGNED NOT NULL COMMENT '上次修改时间',
  UNIQUE INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_product_attr_result
-- ----------------------------
INSERT INTO `eb_store_product_attr_result` VALUES (1, '{\"attr\":[{\"value\":\"\\u989c\\u8272\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"\\u9ed1\\u8272\",\"\\u767d\\u8272\",\"\\u84dd\\u8272\"]}],\"value\":[{\"detail\":{\"\\u989c\\u8272\":\"\\u9ed1\\u8272\"},\"cost\":\"100.00\",\"price\":\"0.01\",\"sales\":199,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u767d\\u8272\"},\"cost\":\"100.00\",\"price\":0.02,\"sales\":199,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u84dd\\u8272\"},\"cost\":\"100.00\",\"price\":0.03,\"sales\":199,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"check\":false}]}', 1547713512);
INSERT INTO `eb_store_product_attr_result` VALUES (2, '{\"attr\":[{\"value\":\"\\u5b54\\u8ddd\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"30cm\",\"40cm\"]}],\"value\":[{\"detail\":{\"\\u5b54\\u8ddd\":\"30cm\"},\"cost\":\"1500.00\",\"price\":\"0.01\",\"sales\":994,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"check\":false},{\"detail\":{\"\\u5b54\\u8ddd\":\"40cm\"},\"cost\":\"1500.00\",\"price\":888,\"sales\":994,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\",\"check\":false}]}', 1547553770);
INSERT INTO `eb_store_product_attr_result` VALUES (3, '{\"attr\":[{\"value\":\"\\u5bb9\\u91cf\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"3L\",\"4L\"]},{\"value\":\"\\u989c\\u8272\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"\\u767d\\u8272\",\"\\u9ed1\\u8272\"]}],\"value\":[{\"detail\":{\"\\u5bb9\\u91cf\":\"3L\",\"\\u989c\\u8272\":\"\\u767d\\u8272\"},\"cost\":\"10.00\",\"price\":248,\"sales\":999,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"check\":false},{\"detail\":{\"\\u5bb9\\u91cf\":\"3L\",\"\\u989c\\u8272\":\"\\u9ed1\\u8272\"},\"cost\":\"10.00\",\"price\":249,\"sales\":999,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\",\"check\":false},{\"detail\":{\"\\u5bb9\\u91cf\":\"4L\",\"\\u989c\\u8272\":\"\\u767d\\u8272\"},\"cost\":\"10.00\",\"price\":289,\"sales\":999,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"check\":false},{\"detail\":{\"\\u5bb9\\u91cf\":\"4L\",\"\\u989c\\u8272\":\"\\u9ed1\\u8272\"},\"cost\":\"10.00\",\"price\":299,\"sales\":999,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\",\"check\":false}]}', 1547553857);

-- ----------------------------
-- Table structure for eb_store_product_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_attr_value`;
CREATE TABLE `eb_store_product_attr_value`  (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `suk` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) UNSIGNED NOT NULL COMMENT '属性对应的库存',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `price` decimal(8, 2) UNSIGNED NOT NULL COMMENT '属性金额',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `unique` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8, 2) UNSIGNED NOT NULL COMMENT '成本价',
  UNIQUE INDEX `unique`(`unique`, `suk`) USING BTREE,
  INDEX `store_id`(`product_id`, `suk`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_product_attr_value
-- ----------------------------
INSERT INTO `eb_store_product_attr_value` VALUES (2, '40cm', 990, 4, 888.00, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc6a38fab.jpg', '19f1d772', 1500.00);
INSERT INTO `eb_store_product_attr_value` VALUES (1, '黑色', 71, 128, 0.01, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '6af2068e', 100.00);
INSERT INTO `eb_store_product_attr_value` VALUES (3, '4L,白色', 990, 9, 289.00, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '824485b3', 10.00);
INSERT INTO `eb_store_product_attr_value` VALUES (1, '白色', 169, 30, 0.02, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3db9de2b73a.jpg', 'a84fff47', 100.00);
INSERT INTO `eb_store_product_attr_value` VALUES (3, '3L,白色', 987, 12, 248.00, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', 'ab6067b3', 10.00);
INSERT INTO `eb_store_product_attr_value` VALUES (3, '3L,黑色', 993, 6, 249.00, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc15ba1972.jpg', 'afb4949f', 10.00);
INSERT INTO `eb_store_product_attr_value` VALUES (2, '30cm', 957, 37, 0.01, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', 'bae75a3a', 1500.00);
INSERT INTO `eb_store_product_attr_value` VALUES (3, '4L,黑色', 983, 16, 299.00, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc15ba1972.jpg', 'c4b7ce93', 10.00);
INSERT INTO `eb_store_product_attr_value` VALUES (1, '蓝色', 137, 62, 0.03, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba4187461.jpg', 'f39d47dc', 100.00);

-- ----------------------------
-- Table structure for eb_store_product_cate
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_cate`;
CREATE TABLE `eb_store_product_cate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT 0 COMMENT '产品id',
  `cate_id` int(11) NOT NULL DEFAULT 0 COMMENT '分类id',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品分类辅助表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_product_cate
-- ----------------------------
INSERT INTO `eb_store_product_cate` VALUES (1, 11, 4, 1568769416);
INSERT INTO `eb_store_product_cate` VALUES (2, 12, 4, 1568774848);
INSERT INTO `eb_store_product_cate` VALUES (3, 13, 4, 1568774952);
INSERT INTO `eb_store_product_cate` VALUES (4, 14, 7, 1568796963);
INSERT INTO `eb_store_product_cate` VALUES (5, 15, 3, 1568945462);
INSERT INTO `eb_store_product_cate` VALUES (10, 20, 4, 1569550253);
INSERT INTO `eb_store_product_cate` VALUES (14, 24, 4, 1570239611);
INSERT INTO `eb_store_product_cate` VALUES (15, 25, 4, 1570239658);
INSERT INTO `eb_store_product_cate` VALUES (17, 27, 4, 1570240855);
INSERT INTO `eb_store_product_cate` VALUES (18, 28, 4, 1570240882);
INSERT INTO `eb_store_product_cate` VALUES (19, 29, 4, 1570456762);
INSERT INTO `eb_store_product_cate` VALUES (20, 30, 4, 1570456805);
INSERT INTO `eb_store_product_cate` VALUES (21, 31, 4, 1570456882);
INSERT INTO `eb_store_product_cate` VALUES (24, 33, 3, 1570591214);
INSERT INTO `eb_store_product_cate` VALUES (27, 18, 26, 1570591629);
INSERT INTO `eb_store_product_cate` VALUES (28, 22, 25, 1570591662);
INSERT INTO `eb_store_product_cate` VALUES (29, 19, 25, 1570594127);
INSERT INTO `eb_store_product_cate` VALUES (30, 19, 2, 1570594127);
INSERT INTO `eb_store_product_cate` VALUES (31, 21, 29, 1570594145);
INSERT INTO `eb_store_product_cate` VALUES (32, 23, 25, 1570594159);
INSERT INTO `eb_store_product_cate` VALUES (33, 23, 29, 1570594159);
INSERT INTO `eb_store_product_cate` VALUES (34, 26, 29, 1570594176);
INSERT INTO `eb_store_product_cate` VALUES (36, 34, 3, 1572405445);
INSERT INTO `eb_store_product_cate` VALUES (37, 16, 21, 1572406358);
INSERT INTO `eb_store_product_cate` VALUES (38, 17, 25, 1572407191);
INSERT INTO `eb_store_product_cate` VALUES (39, 32, 4, 1572416123);

-- ----------------------------
-- Table structure for eb_store_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_relation`;
CREATE TABLE `eb_store_product_relation`  (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型(收藏(collect）、点赞(like))',
  `category` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '某种类型的商品(普通商品、秒杀商品)',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '添加时间',
  UNIQUE INDEX `uid`(`uid`, `product_id`, `type`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `category`(`category`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品点赞和收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_product_relation
-- ----------------------------
INSERT INTO `eb_store_product_relation` VALUES (1, 2, 'collect', 'product', 1569078320);
INSERT INTO `eb_store_product_relation` VALUES (18, 23, 'collect', 'product', 1572420794);
INSERT INTO `eb_store_product_relation` VALUES (18, 33, 'collect', 'product', 1572422256);

-- ----------------------------
-- Table structure for eb_store_product_reply
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_reply`;
CREATE TABLE `eb_store_product_reply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `oid` int(11) NOT NULL COMMENT '订单ID',
  `unique` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一id',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `reply_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'product' COMMENT '某种商品类型(普通商品、秒杀商品）',
  `product_score` tinyint(1) NOT NULL COMMENT '商品分数',
  `service_score` tinyint(1) NOT NULL COMMENT '服务分数',
  `comment` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `pics` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论图片',
  `add_time` int(11) NOT NULL COMMENT '评论时间',
  `merchant_reply_content` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员回复内容',
  `merchant_reply_time` int(11) NULL DEFAULT NULL COMMENT '管理员回复时间',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0未删除1已删除',
  `is_reply` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未回复1已回复',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id_2`(`oid`, `unique`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `parent_id`(`reply_type`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE,
  INDEX `product_score`(`product_score`) USING BTREE,
  INDEX `service_score`(`service_score`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_seckill
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_seckill`;
CREATE TABLE `eb_store_seckill`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品秒杀产品表id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品id',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推荐图',
  `images` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动标题',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '价格',
  `cost` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '成本',
  `ot_price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '原价',
  `give_integral` decimal(10, 2) UNSIGNED NOT NULL COMMENT '返多少积分',
  `sort` int(10) UNSIGNED NOT NULL COMMENT '排序',
  `stock` int(10) UNSIGNED NOT NULL COMMENT '库存',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `unit_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '单位名',
  `postage` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '邮费',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `start_time` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开始时间',
  `stop_time` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '结束时间',
  `add_time` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '产品状态',
  `is_postage` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否包邮',
  `is_hot` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '热门推荐',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除 0未删除1已删除',
  `num` int(11) UNSIGNED NOT NULL COMMENT '最多秒杀几个',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '显示',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `start_time`(`start_time`, `stop_time`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE,
  INDEX `is_hot`(`is_hot`) USING BTREE,
  INDEX `is_show`(`status`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `is_postage`(`is_postage`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品秒杀产品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_seckill
-- ----------------------------
INSERT INTO `eb_store_seckill` VALUES (1, 1, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\"]', '手慢无 无线吸尘器F8 玫瑰金礼盒版', '【年货节活动价1699元，领取吸尘器优惠券再减50元，到手价仅1649元】', 0.01, 100.00, 599.00, 1699.00, 1, 953, 47, '件', 0.00, '', '1553702400', '1556553600', '1553847138', 1, 1, 1, 1, 1, 1);
INSERT INTO `eb_store_seckill` VALUES (2, 3, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\"]', '智米加湿器 白色', '智米加湿器 白色', 99.00, 10.00, 249.00, 249.00, 0, 993, 7, '件', 0.00, '', '1551369600', '1556553600', '1553847124', 1, 1, 1, 1, 1, 1);
INSERT INTO `eb_store_seckill` VALUES (3, 2, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\"]', '智能马桶盖 AI版 限时秒杀中', '智能马桶盖 AI版', 0.01, 1500.00, 1599.00, 1999.00, 0, 990, 10, '件', 0.00, '', '1553702400', '1556553600', '1553847112', 1, 1, 1, 1, 1, 1);
INSERT INTO `eb_store_seckill` VALUES (4, 4, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc23646fff.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc23646fff.jpg\"]', '互联网电热水器1A', '3000w双管速热，动态360L热水用量，双重漏电保护，智能APP操控', 10.00, 888.00, 999.00, 999.00, 0, 441, 59, '件', 0.00, NULL, '1554861600', '1554868799', '1554860320', 1, 1, 1, 1, 1, 1);
INSERT INTO `eb_store_seckill` VALUES (5, 1, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\"]', '7-10点 无线吸尘器F8 玫瑰金礼盒版', '【年货节活动价1699元，领取吸尘器优惠券再减50元，到手价仅1649元】', 0.01, 100.00, 1.00, 1699.00, 1, 586, 159, '件', 1.00, NULL, '1554850800', '1554861600', '1554860478', 1, 1, 1, 1, 1, 1);
INSERT INTO `eb_store_seckill` VALUES (6, 2, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\"]', '10-12点智能马桶盖 AI版', '智能马桶盖 AI版', 0.01, 1500.00, 100.00, 1999.00, 0, 994, 31, '件', 0.00, NULL, '1554876000', '1554883200', '1554876551', 1, 1, 1, 1, 1, 1);
INSERT INTO `eb_store_seckill` VALUES (7, 3, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\"]', '12-14智米加湿器 白色', '智米加湿器 白色', 0.01, 10.00, 249.00, 249.00, 0, 999, 17, '件', 0.00, NULL, '1554876000', '1554883200', '1554877858', 1, 1, 1, 1, 1, 1);
INSERT INTO `eb_store_seckill` VALUES (8, 1, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\"]', '12-14无线吸尘器F8 玫瑰金礼盒版', '【年货节活动价1699元，领取吸尘器优惠券再减50元，到手价仅1649元】', 0.01, 100.00, 10.00, 1699.00, 1, 586, 173, '件', 1.00, NULL, '1554998400', '1556553600', '1555148238', 1, 1, 1, 0, 1, 1);
INSERT INTO `eb_store_seckill` VALUES (9, 2, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\"]', '14-16智能马桶盖 AI版', '智能马桶盖 AI版', 0.01, 1500.00, 0.01, 1999.00, 0, 994, 33, '件', 0.00, NULL, '1554876000', '1554883199', '1554887359', 1, 1, 1, 0, 1, 1);
INSERT INTO `eb_store_seckill` VALUES (10, 3, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\"]', '智米加湿器 白色', '智米加湿器 白色', 0.01, 10.00, 249.00, 249.00, 0, 998, 40, '件', 0.00, NULL, '1554998400', '1556553600', '1555148264', 1, 1, 1, 0, 1, 1);
INSERT INTO `eb_store_seckill` VALUES (11, 2, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\"]', '智能马桶盖 AI版', '智能马桶盖 AI版', 0.01, 1500.00, 0.01, 1999.00, 0, 993, 45, '件', 0.00, NULL, '1554998400', '1556553600', '1555148291', 1, 1, 1, 0, 1, 1);
INSERT INTO `eb_store_seckill` VALUES (12, 4, 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc23646fff.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc23646fff.jpg\"]', '互联网电热水器1A', '3000w双管速热，动态360L热水用量，双重漏电保护，智能APP操控', 1.00, 888.00, 999.00, 999.00, 0, 420, 80, '件', 0.00, NULL, '1554998400', '1556553600', '1555148278', 1, 1, 1, 0, 1, 1);
INSERT INTO `eb_store_seckill` VALUES (13, 19, 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\26\\\\c017e27391b3618bb1c68b644e6b6e7e.jpg', '[\"http:\\/\\/www.tp5crm.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\26\\\\\\\\c017e27391b3618bb1c68b644e6b6e7e.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\26\\\\\\\\5d5dd2d173500f6ce87a50de12bc071b.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\26\\\\\\\\fabf74b7a333946a914f0a57606b6578.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\26\\\\\\\\1c30a6100190a31e6189fbf93134b314.jpg\",\"http:\\/\\/www.tp5crm.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\09\\\\26\\\\\\\\b43b3913aaff174c917733a4d36da3e1.jpg\"]', '抖音热门10册 所谓情商高就是会说话别输在不会表达上说话心理学跟任何人都聊得来人际交往提高情商聊天术的全', '抖音热门10册 所谓情商高就是会说话别输在不会表达上说话心理学跟任何人都聊得来人际交往提高情商聊天术的全', 10.00, 100.00, 22.00, 666.00, 0, 888888, 0, '件', 10.00, NULL, '', '', '1570158811', 1, 0, 1, 0, 1, 1);

-- ----------------------------
-- Table structure for eb_store_seckill_attr
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_seckill_attr`;
CREATE TABLE `eb_store_seckill_attr`  (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `attr_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名',
  `attr_values` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  INDEX `store_id`(`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '秒杀商品属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_seckill_attr_result
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_seckill_attr_result`;
CREATE TABLE `eb_store_seckill_attr_result`  (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性参数',
  `change_time` int(10) UNSIGNED NOT NULL COMMENT '上次修改时间',
  UNIQUE INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '秒杀商品属性详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_seckill_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_seckill_attr_value`;
CREATE TABLE `eb_store_seckill_attr_value`  (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT '商品ID',
  `suk` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) UNSIGNED NOT NULL COMMENT '属性对应的库存',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `price` decimal(8, 2) UNSIGNED NOT NULL COMMENT '属性金额',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `unique` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8, 2) UNSIGNED NOT NULL COMMENT '成本价',
  UNIQUE INDEX `unique`(`unique`, `suk`) USING BTREE,
  INDEX `store_id`(`product_id`, `suk`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '秒杀商品属性值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_service
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_service`;
CREATE TABLE `eb_store_service`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客服id',
  `mer_id` int(11) NOT NULL DEFAULT 0 COMMENT '商户id',
  `uid` int(11) NOT NULL COMMENT '客服uid',
  `avatar` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客服头像',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代理名称',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '0隐藏1显示',
  `notify` int(2) NULL DEFAULT 0 COMMENT '订单通知1开启0关闭',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客服表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_service_log
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_service_log`;
CREATE TABLE `eb_store_service_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客服用户对话记录表ID',
  `mer_id` int(11) NOT NULL DEFAULT 0 COMMENT '商户id',
  `msn` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
  `uid` int(11) NOT NULL COMMENT '发送人uid',
  `to_uid` int(11) NOT NULL COMMENT '接收人uid',
  `add_time` int(11) NOT NULL COMMENT '发送时间',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已读（0：否；1：是；）',
  `remind` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否提醒过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客服用户对话记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_store_visit
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_visit`;
CREATE TABLE `eb_store_visit`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NULL DEFAULT NULL COMMENT '产品ID',
  `product_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品类型',
  `cate_id` int(11) NULL DEFAULT NULL COMMENT '产品分类ID',
  `type` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品类型',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `count` int(11) NULL DEFAULT NULL COMMENT '访问次数',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注描述',
  `add_time` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品浏览分析表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_store_visit
-- ----------------------------
INSERT INTO `eb_store_visit` VALUES (1, 0, 'product', 0, 'search', 1, 1, '0', 1568773088);
INSERT INTO `eb_store_visit` VALUES (2, 4, 'product', 3, 'viwe', 1, 1, '', 1568773225);
INSERT INTO `eb_store_visit` VALUES (3, 2, 'product', 3, 'viwe', 1, 1, '', 1569078285);
INSERT INTO `eb_store_visit` VALUES (4, 0, 'product', 0, 'search', 1, 1, '0', 1569127019);
INSERT INTO `eb_store_visit` VALUES (5, 0, 'product', 0, 'search', 1, 1, '0', 1569127205);
INSERT INTO `eb_store_visit` VALUES (6, 0, 'product', 0, 'search', 1, 1, '0', 1569127321);
INSERT INTO `eb_store_visit` VALUES (7, 0, 'product', 0, 'search', 1, 1, '0', 1569132981);
INSERT INTO `eb_store_visit` VALUES (8, 0, 'product', 0, 'search', 1, 1, '0', 1569132982);
INSERT INTO `eb_store_visit` VALUES (9, 0, 'product', 0, 'search', 1, 1, '0', 1569132998);
INSERT INTO `eb_store_visit` VALUES (10, 15, 'product', 3, 'viwe', 1, 1, '', 1569132999);
INSERT INTO `eb_store_visit` VALUES (11, 0, 'product', 0, 'search', 1, 1, '0', 1569134343);
INSERT INTO `eb_store_visit` VALUES (12, 0, 'product', 0, 'search', 1, 1, '0', 1569134360);
INSERT INTO `eb_store_visit` VALUES (13, 28, NULL, 4, 'viwe', 0, 16, '', 1570607520);
INSERT INTO `eb_store_visit` VALUES (14, 21, NULL, 4, 'viwe', 0, 6, '', 1571044725);
INSERT INTO `eb_store_visit` VALUES (15, 22, NULL, 4, 'viwe', 0, 7, '', 1570418103);
INSERT INTO `eb_store_visit` VALUES (16, 20, NULL, 4, 'viwe', 0, 10, '', 1570606782);
INSERT INTO `eb_store_visit` VALUES (17, 23, NULL, 4, 'viwe', 0, 21, '', 1572420832);
INSERT INTO `eb_store_visit` VALUES (18, 19, NULL, 4, 'viwe', 0, 17, '', 1572420776);
INSERT INTO `eb_store_visit` VALUES (19, 16, NULL, 4, 'viwe', 0, 5, '', 1570545665);
INSERT INTO `eb_store_visit` VALUES (20, 26, NULL, 4, 'viwe', 0, 13, '', 1570544798);
INSERT INTO `eb_store_visit` VALUES (21, 24, NULL, 4, 'viwe', 0, 14, '', 1572403529);
INSERT INTO `eb_store_visit` VALUES (22, 27, NULL, 4, 'viwe', 0, 19, '', 1570540465);
INSERT INTO `eb_store_visit` VALUES (23, 17, NULL, 4, 'viwe', 0, 6, '', 1572407202);
INSERT INTO `eb_store_visit` VALUES (24, 25, NULL, 4, 'viwe', 0, 14, '', 1572404751);
INSERT INTO `eb_store_visit` VALUES (25, 18, NULL, 4, 'viwe', 0, 1, '', 1570413567);
INSERT INTO `eb_store_visit` VALUES (26, 31, NULL, 4, 'viwe', 0, 22, '', 1572421521);
INSERT INTO `eb_store_visit` VALUES (27, 30, NULL, 4, 'viwe', 0, 5, '', 1572406928);
INSERT INTO `eb_store_visit` VALUES (28, 29, NULL, 4, 'viwe', 0, 4, '', 1572401678);
INSERT INTO `eb_store_visit` VALUES (29, 32, NULL, 4, 'viwe', 0, 40, '', 1572421141);
INSERT INTO `eb_store_visit` VALUES (30, 33, NULL, 1, 'viwe', 0, 9, '', 1572422103);
INSERT INTO `eb_store_visit` VALUES (31, 33, NULL, 1, 'viwe', 18, 4, '', 1572424116);
INSERT INTO `eb_store_visit` VALUES (32, 32, NULL, 4, 'viwe', 18, 5, '', 1572424191);
INSERT INTO `eb_store_visit` VALUES (33, 27, NULL, 4, 'viwe', 18, 3, '', 1572429225);
INSERT INTO `eb_store_visit` VALUES (34, 17, NULL, 25, 'viwe', 18, 3, '', 1572429822);
INSERT INTO `eb_store_visit` VALUES (35, 25, NULL, 4, 'viwe', 18, 2, '', 1572429449);
INSERT INTO `eb_store_visit` VALUES (36, 18, NULL, 26, 'viwe', 18, 1, '', 1572427351);
INSERT INTO `eb_store_visit` VALUES (37, 20, NULL, 4, 'viwe', 18, 1, '', 1572428197);

-- ----------------------------
-- Table structure for eb_system_admin
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_admin`;
CREATE TABLE `eb_system_admin`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '后台管理员表ID',
  `account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '后台管理员账号',
  `pwd` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '后台管理员密码',
  `real_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '后台管理员姓名',
  `roles` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '后台管理员权限(menus_id)',
  `last_ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '后台管理员最后一次登录ip',
  `last_time` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '后台管理员最后一次登录时间',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '后台管理员添加时间',
  `login_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录次数',
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '后台管理员级别',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '后台管理员状态 1有效0无效',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account`(`account`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_admin
-- ----------------------------
INSERT INTO `eb_system_admin` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', '1', '127.0.0.1', 1572438972, 1568735520, 0, 0, 1, 0);

-- ----------------------------
-- Table structure for eb_system_attachment
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_attachment`;
CREATE TABLE `eb_system_attachment`  (
  `att_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件名称',
  `att_dir` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件路径',
  `satt_dir` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '压缩图片路径',
  `att_size` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件大小',
  `att_type` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件类型',
  `pid` int(10) NOT NULL DEFAULT 0 COMMENT '分类ID0编辑器,1产品图片,2拼团图片,3砍价图片,4秒杀图片,5文章图片,6组合数据图',
  `time` int(11) NOT NULL DEFAULT 0 COMMENT '上传时间',
  `image_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '图片上传类型 1本地 2七牛云 3OSS 4COS ',
  `module_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '图片上传模块类型 1 后台上传 2 用户生成',
  PRIMARY KEY (`att_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 408 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_attachment
-- ----------------------------
INSERT INTO `eb_system_attachment` VALUES (2, '5c387d18c37fa.jpg', '/public/uploads/editor/20190111/5c387d18c37fa.jpg', '/public/uploads/editor/20190111/s_5c387d18c37fa.jpg', '9274', 'image/jpeg', 0, 1547205912, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (3, '5c387daf3ef63.jpg', '/public/uploads/editor/20190111/5c387daf3ef63.jpg', '/public/uploads/editor/20190111/s_5c387daf3ef63.jpg', '9274', 'image/jpeg', 0, 1547206063, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (7, '5c3db14908923.jpg', '/public/uploads/attach/2019/01/15/5c3db14908923.jpg', '/public/uploads/attach/2019/01/15/s_5c3db14908923.jpg', '102671', 'image/jpeg', 3, 1547546953, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (9, '5c3db5d483c7e.jpg', '/public/uploads/attach/2019/01/15/5c3db5d483c7e.jpg', '/public/uploads/attach/2019/01/15/s_5c3db5d483c7e.jpg', '41833', 'image/jpeg', 3, 1547548116, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (11, '5c3db8b933d92.jpg', '/public/uploads/attach/2019/01/15/5c3db8b933d92.jpg', '/public/uploads/attach/2019/01/15/s_5c3db8b933d92.jpg', '31746', 'image/jpeg', 2, 1547548857, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (12, '5c3db9de2b73a.jpg', '/public/uploads/attach/2019/01/15/5c3db9de2b73a.jpg', '/public/uploads/attach/2019/01/15/s_5c3db9de2b73a.jpg', '61866', 'image/jpeg', 1, 1547549150, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (13, '5c3dba1366885.jpg', '/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '/public/uploads/attach/2019/01/15/s_5c3dba1366885.jpg', '41951', 'image/jpeg', 1, 1547549203, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (14, '5c3dba4187461.jpg', '/public/uploads/attach/2019/01/15/5c3dba4187461.jpg', '/public/uploads/attach/2019/01/15/s_5c3dba4187461.jpg', '76932', 'image/jpeg', 1, 1547549249, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (15, '5c3dbb137d656.jpeg', '/public/uploads/editor/20190115/5c3dbb137d656.jpeg', '/public/uploads/editor/20190115/s_5c3dbb137d656.jpeg', '114386', 'image/jpeg', 0, 1547549459, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (16, '5c3dbb229e820.jpeg', '/public/uploads/editor/20190115/5c3dbb229e820.jpeg', '/public/uploads/editor/20190115/s_5c3dbb229e820.jpeg', '143065', 'image/jpeg', 0, 1547549474, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (17, '5c3dbb3b37f84.jpeg', '/public/uploads/editor/20190115/5c3dbb3b37f84.jpeg', '/public/uploads/editor/20190115/s_5c3dbb3b37f84.jpeg', '139850', 'image/jpeg', 0, 1547549499, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (18, '5c3dbb513b06f.jpeg', '/public/uploads/editor/20190115/5c3dbb513b06f.jpeg', '/public/uploads/editor/20190115/s_5c3dbb513b06f.jpeg', '150123', 'image/jpeg', 0, 1547549521, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (19, '5c3dbc27c69c7.jpg', '/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '/public/uploads/attach/2019/01/15/s_5c3dbc27c69c7.jpg', '33563', 'image/jpeg', 1, 1547549735, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (20, '5c3dbc6a38fab.jpg', '/public/uploads/attach/2019/01/15/5c3dbc6a38fab.jpg', '/public/uploads/attach/2019/01/15/s_5c3dbc6a38fab.jpg', '48892', 'image/jpeg', 1, 1547549802, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (21, '5c3dbce620415.jpeg', '/public/uploads/editor/20190115/5c3dbce620415.jpeg', '/public/uploads/editor/20190115/s_5c3dbce620415.jpeg', '132779', 'image/jpeg', 0, 1547549926, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (22, '5c3dc0ef27068.jpg', '/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '/public/uploads/attach/2019/01/15/s_5c3dc0ef27068.jpg', '40991', 'image/jpeg', 1, 1547550959, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (23, '5c3dc15ba1972.jpg', '/public/uploads/attach/2019/01/15/5c3dc15ba1972.jpg', '/public/uploads/attach/2019/01/15/s_5c3dc15ba1972.jpg', '37389', 'image/jpeg', 1, 1547551067, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (24, '5c3dc1730a0c0.jpg', '/public/uploads/editor/20190115/5c3dc1730a0c0.jpg', '/public/uploads/editor/20190115/s_5c3dc1730a0c0.jpg', '113870', 'image/jpeg', 0, 1547551091, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (25, '5c3dc182bccac.jpg', '/public/uploads/editor/20190115/5c3dc182bccac.jpg', '/public/uploads/editor/20190115/s_5c3dc182bccac.jpg', '145391', 'image/jpeg', 0, 1547551106, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (26, '5c3dc23646fff.jpg', '/public/uploads/attach/2019/01/15/5c3dc23646fff.jpg', '/public/uploads/attach/2019/01/15/s_5c3dc23646fff.jpg', '39941', 'image/jpeg', 1, 1547551286, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (27, '5c3dc286862fd.jpg', '/public/uploads/editor/20190115/5c3dc286862fd.jpg', '/public/uploads/editor/20190115/s_5c3dc286862fd.jpg', '81291', 'image/jpeg', 0, 1547551366, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (28, '5c3dc294a9a0a.jpg', '/public/uploads/editor/20190115/5c3dc294a9a0a.jpg', '/public/uploads/editor/20190115/s_5c3dc294a9a0a.jpg', '104012', 'image/jpeg', 0, 1547551380, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (29, '5c3dc2ba18a77.jpg', '/public/uploads/editor/20190115/5c3dc2ba18a77.jpg', '/public/uploads/editor/20190115/s_5c3dc2ba18a77.jpg', '127719', 'image/jpeg', 0, 1547551418, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (31, '5c3dc7146add5.png', '/public/uploads/attach/2019/01/15/5c3dc7146add5.png', '/public/uploads/attach/2019/01/15/s_5c3dc7146add5.png', '3209', 'image/png', 2, 1547552532, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (32, '5c3dc72335ee5.png', '/public/uploads/attach/2019/01/15/5c3dc72335ee5.png', '/public/uploads/attach/2019/01/15/s_5c3dc72335ee5.png', '3607', 'image/png', 2, 1547552547, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (33, '5c3dc730dead2.png', '/public/uploads/attach/2019/01/15/5c3dc730dead2.png', '/public/uploads/attach/2019/01/15/s_5c3dc730dead2.png', '3729', 'image/png', 2, 1547552560, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (34, '5c3dc73feecaf.png', '/public/uploads/attach/2019/01/15/5c3dc73feecaf.png', '/public/uploads/attach/2019/01/15/s_5c3dc73feecaf.png', '3351', 'image/png', 2, 1547552575, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (35, '5c3dc74c1bd3f.png', '/public/uploads/attach/2019/01/15/5c3dc74c1bd3f.png', '/public/uploads/attach/2019/01/15/s_5c3dc74c1bd3f.png', '2847', 'image/png', 2, 1547552588, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (36, '5c3dc7ee98a2e.png', '/public/uploads/attach/2019/01/15/5c3dc7ee98a2e.png', '/public/uploads/attach/2019/01/15/s_5c3dc7ee98a2e.png', '778', 'image/png', 2, 1547552750, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (37, '5c3dc802814e5.png', '/public/uploads/attach/2019/01/15/5c3dc802814e5.png', '/public/uploads/attach/2019/01/15/s_5c3dc802814e5.png', '574', 'image/png', 2, 1547552770, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (38, '5c3dc8232ac13.png', '/public/uploads/attach/2019/01/15/5c3dc8232ac13.png', '/public/uploads/attach/2019/01/15/s_5c3dc8232ac13.png', '1197', 'image/png', 2, 1547552803, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (39, '5c3dc84ef1070.png', '/public/uploads/attach/2019/01/15/5c3dc84ef1070.png', '/public/uploads/attach/2019/01/15/s_5c3dc84ef1070.png', '1556', 'image/png', 2, 1547552846, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (40, '5c3dc865bb257.png', '/public/uploads/attach/2019/01/15/5c3dc865bb257.png', '/public/uploads/attach/2019/01/15/s_5c3dc865bb257.png', '749', 'image/png', 2, 1547552869, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (41, '5c3dc8a7205f0.png', '/public/uploads/attach/2019/01/15/5c3dc8a7205f0.png', '/public/uploads/attach/2019/01/15/s_5c3dc8a7205f0.png', '814', 'image/png', 2, 1547552935, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (42, '5c3dc91cee6ed.png', '/public/uploads/attach/2019/01/15/5c3dc91cee6ed.png', '/public/uploads/attach/2019/01/15/s_5c3dc91cee6ed.png', '1100', 'image/png', 2, 1547553052, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (43, '5c3dc93937a48.png', '/public/uploads/attach/2019/01/15/5c3dc93937a48.png', '/public/uploads/attach/2019/01/15/s_5c3dc93937a48.png', '917', 'image/png', 2, 1547553081, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (44, '5c3dc95a1d134.png', '/public/uploads/attach/2019/01/15/5c3dc95a1d134.png', '/public/uploads/attach/2019/01/15/s_5c3dc95a1d134.png', '1200', 'image/png', 2, 1547553114, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (45, '5c3dc97a19134.png', '/public/uploads/attach/2019/01/15/5c3dc97a19134.png', '/public/uploads/attach/2019/01/15/s_5c3dc97a19134.png', '1227', 'image/png', 2, 1547553146, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (46, '5c9ccc99101a8.png', '/public/uploads/attach/2019/03/28/5c9ccc99101a8.png', '/public/uploads/attach/2019/03/28/s_5c9ccc99101a8.png', '2120', 'image/png', 4, 1553779865, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (47, '5c9ccc9918091.png', '/public/uploads/attach/2019/03/28/5c9ccc9918091.png', '/public/uploads/attach/2019/03/28/s_5c9ccc9918091.png', '1269', 'image/png', 4, 1553779865, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (48, '5c9ccc991f394.png', '/public/uploads/attach/2019/03/28/5c9ccc991f394.png', '/public/uploads/attach/2019/03/28/s_5c9ccc991f394.png', '1575', 'image/png', 4, 1553779865, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (49, '5c9ccc99269d1.png', '/public/uploads/attach/2019/03/28/5c9ccc99269d1.png', '/public/uploads/attach/2019/03/28/s_5c9ccc99269d1.png', '2007', 'image/png', 4, 1553779865, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (50, '5c9ccc992db31.png', '/public/uploads/attach/2019/03/28/5c9ccc992db31.png', '/public/uploads/attach/2019/03/28/s_5c9ccc992db31.png', '2762', 'image/png', 4, 1553779865, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (51, '5c9ccc9934a7c.png', '/public/uploads/attach/2019/03/28/5c9ccc9934a7c.png', '/public/uploads/attach/2019/03/28/s_5c9ccc9934a7c.png', '1731', 'image/png', 4, 1553779865, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (52, '5c9ccc993c14f.png', '/public/uploads/attach/2019/03/28/5c9ccc993c14f.png', '/public/uploads/attach/2019/03/28/s_5c9ccc993c14f.png', '1520', 'image/png', 4, 1553779865, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (53, '5c9ccc9943575.png', '/public/uploads/attach/2019/03/28/5c9ccc9943575.png', '/public/uploads/attach/2019/03/28/s_5c9ccc9943575.png', '1861', 'image/png', 4, 1553779865, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (54, '5c9ccca12638a.gif', '/public/uploads/attach/2019/03/28/5c9ccca12638a.gif', '/public/uploads/attach/2019/03/28/s_5c9ccca12638a.gif', '122854', 'image/gif', 5, 1553779873, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (55, '5c9ccca151e99.gif', '/public/uploads/attach/2019/03/28/5c9ccca151e99.gif', '/public/uploads/attach/2019/03/28/s_5c9ccca151e99.gif', '105770', 'image/gif', 5, 1553779873, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (56, '5c9ccca178a67.gif', '/public/uploads/attach/2019/03/28/5c9ccca178a67.gif', '/public/uploads/attach/2019/03/28/s_5c9ccca178a67.gif', '108109', 'image/gif', 5, 1553779873, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (57, '5c9ccca1a01b6.gif', '/public/uploads/attach/2019/03/28/5c9ccca1a01b6.gif', '/public/uploads/attach/2019/03/28/s_5c9ccca1a01b6.gif', '109454', 'image/gif', 5, 1553779873, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (58, '5c9ccca1c78cd.gif', '/public/uploads/attach/2019/03/28/5c9ccca1c78cd.gif', '/public/uploads/attach/2019/03/28/s_5c9ccca1c78cd.gif', '110373', 'image/gif', 5, 1553779873, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (59, '5c9ccca8a27f0.png', '/public/uploads/attach/2019/03/28/5c9ccca8a27f0.png', '/public/uploads/attach/2019/03/28/s_5c9ccca8a27f0.png', '3138', 'image/png', 6, 1553779880, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (60, '5c9ccca8aa5b9.png', '/public/uploads/attach/2019/03/28/5c9ccca8aa5b9.png', '/public/uploads/attach/2019/03/28/s_5c9ccca8aa5b9.png', '4066', 'image/png', 6, 1553779880, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (61, '5c9ccca8b27f1.jpg', '/public/uploads/attach/2019/03/28/5c9ccca8b27f1.jpg', '/public/uploads/attach/2019/03/28/s_5c9ccca8b27f1.jpg', '25834', 'image/jpeg', 6, 1553779880, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (62, '5c9ccca8bc1e0.png', '/public/uploads/attach/2019/03/28/5c9ccca8bc1e0.png', '/public/uploads/attach/2019/03/28/s_5c9ccca8bc1e0.png', '3907', 'image/png', 6, 1553779880, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (63, '5c9ccca8c3bff.jpg', '/public/uploads/attach/2019/03/28/5c9ccca8c3bff.jpg', '/public/uploads/attach/2019/03/28/s_5c9ccca8c3bff.jpg', '22916', 'image/jpeg', 6, 1553779880, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (64, '5c9ccca8cd632.jpg', '/public/uploads/attach/2019/03/28/5c9ccca8cd632.jpg', '/public/uploads/attach/2019/03/28/s_5c9ccca8cd632.jpg', '24602', 'image/jpeg', 6, 1553779880, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (65, '5c9ccca8d6ae1.jpg', '/public/uploads/attach/2019/03/28/5c9ccca8d6ae1.jpg', '/public/uploads/attach/2019/03/28/s_5c9ccca8d6ae1.jpg', '21491', 'image/jpeg', 6, 1553779880, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (66, '5c9ccca8dfe16.jpg', '/public/uploads/attach/2019/03/28/5c9ccca8dfe16.jpg', '/public/uploads/attach/2019/03/28/s_5c9ccca8dfe16.jpg', '27120', 'image/jpeg', 6, 1553779880, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (67, '5c9ccca8e9365.png', '/public/uploads/attach/2019/03/28/5c9ccca8e9365.png', '/public/uploads/attach/2019/03/28/s_5c9ccca8e9365.png', '3648', 'image/png', 6, 1553779880, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (68, '5c9ccca8f0a30.png', '/public/uploads/attach/2019/03/28/5c9ccca8f0a30.png', '/public/uploads/attach/2019/03/28/s_5c9ccca8f0a30.png', '3066', 'image/png', 6, 1553779880, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (69, '5c9ccca904016.jpg', '/public/uploads/attach/2019/03/28/5c9ccca904016.jpg', '/public/uploads/attach/2019/03/28/s_5c9ccca904016.jpg', '24567', 'image/jpeg', 6, 1553779881, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (70, '5c9ccca90d2d3.png', '/public/uploads/attach/2019/03/28/5c9ccca90d2d3.png', '/public/uploads/attach/2019/03/28/s_5c9ccca90d2d3.png', '4409', 'image/png', 6, 1553779881, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (71, '5c9ccf7e97660.jpg', '/public/uploads/attach/2019/03/28/5c9ccf7e97660.jpg', '/public/uploads/attach/2019/03/28/s_5c9ccf7e97660.jpg', '18640', 'image/jpeg', 2, 1553780606, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (72, '5c9ccf7e9f4d0.jpg', '/public/uploads/attach/2019/03/28/5c9ccf7e9f4d0.jpg', '/public/uploads/attach/2019/03/28/s_5c9ccf7e9f4d0.jpg', '29549', 'image/jpeg', 2, 1553780606, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (73, '5c9ccfc86a6c1.jpg', '/public/uploads/attach/2019/03/28/5c9ccfc86a6c1.jpg', '/public/uploads/attach/2019/03/28/s_5c9ccfc86a6c1.jpg', '22379', 'image/jpeg', 2, 1553780680, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (74, '5c9cd03224d59.jpg', '/public/uploads/attach/2019/03/28/5c9cd03224d59.jpg', '/public/uploads/attach/2019/03/28/s_5c9cd03224d59.jpg', '178435', 'image/jpeg', 2, 1553780786, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (75, '5c9ddc9f34bfd.png', '/public/uploads/attach/2019/03/29/5c9ddc9f34bfd.png', '/public/uploads/attach/2019/03/29/s_5c9ddc9f34bfd.png', '4453', 'image/png', 2, 1553849503, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (76, '5c9ddccecb7f3.png', '/public/uploads/attach/2019/03/29/5c9ddccecb7f3.png', '/public/uploads/attach/2019/03/29/s_5c9ddccecb7f3.png', '4522', 'image/png', 2, 1553849550, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (77, '5c9ddcec57a80.png', '/public/uploads/attach/2019/03/29/5c9ddcec57a80.png', '/public/uploads/attach/2019/03/29/s_5c9ddcec57a80.png', '2703', 'image/png', 2, 1553849580, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (78, '5c9ddd570b8b3.png', '/public/uploads/attach/2019/03/29/5c9ddd570b8b3.png', '/public/uploads/attach/2019/03/29/s_5c9ddd570b8b3.png', '2825', 'image/png', 2, 1553849687, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (79, '5c9dddce0eac9.png', '/public/uploads/attach/2019/03/29/5c9dddce0eac9.png', '/public/uploads/attach/2019/03/29/s_5c9dddce0eac9.png', '4784', 'image/png', 2, 1553849806, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (80, '5c9dde013f63c.png', '/public/uploads/attach/2019/03/29/5c9dde013f63c.png', '/public/uploads/attach/2019/03/29/s_5c9dde013f63c.png', '3672', 'image/png', 2, 1553849857, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (81, '5c9dde246ad96.png', '/public/uploads/attach/2019/03/29/5c9dde246ad96.png', '/public/uploads/attach/2019/03/29/s_5c9dde246ad96.png', '4982', 'image/png', 2, 1553849892, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (82, '5c9ddedbed782.png', '/public/uploads/attach/2019/03/29/5c9ddedbed782.png', '/public/uploads/attach/2019/03/29/s_5c9ddedbed782.png', '6454', 'image/png', 2, 1553850075, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (83, '5c9de8b7c5cc5.png', '/public/uploads/attach/2019/03/29/5c9de8b7c5cc5.png', '/public/uploads/attach/2019/03/29/s_5c9de8b7c5cc5.png', '124578', 'image/png', 7, 1553852599, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (84, '5c9def00c2882.png', '/public/uploads/attach/2019/03/29/5c9def00c2882.png', '/public/uploads/attach/2019/03/29/s_5c9def00c2882.png', '90279', 'image/png', 7, 1553854208, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (85, '5c9def5fa968c.png', '/public/uploads/attach/2019/03/29/5c9def5fa968c.png', '/public/uploads/attach/2019/03/29/s_5c9def5fa968c.png', '139059', 'image/png', 7, 1553854303, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (86, '5c9df11e13742.png', '/public/uploads/attach/2019/03/29/5c9df11e13742.png', '/public/uploads/attach/2019/03/29/s_5c9df11e13742.png', '137246', 'image/png', 7, 1553854750, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (87, '5c9df170010cb.png', '/public/uploads/attach/2019/03/29/5c9df170010cb.png', '/public/uploads/attach/2019/03/29/s_5c9df170010cb.png', '212939', 'image/png', 7, 1553854832, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (88, '5c9df1b8f0a7a.png', '/public/uploads/attach/2019/03/29/5c9df1b8f0a7a.png', '/public/uploads/attach/2019/03/29/s_5c9df1b8f0a7a.png', '198726', 'image/png', 7, 1553854905, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (89, '5c9e015bdc6f5.jpg', '/public/uploads/attach/2019/03/29/5c9e015bdc6f5.jpg', '/public/uploads/attach/2019/03/29/s_5c9e015bdc6f5.jpg', '161959', 'image/jpeg', 3, 1553858907, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (90, '5c9e1ef640019.jpg', '/public/uploads/attach/2019/03/29/5c9e1ef640019.jpg', '/public/uploads/attach/2019/03/29/s_5c9e1ef640019.jpg', '154063', 'image/jpeg', 8, 1553866486, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (92, '5cb039675597c.jpg', '/public/uploads/attach/2019/04/12/5cb039675597c.jpg', '/public/uploads/attach/2019/04/12/s_5cb039675597c.jpg', '24890', 'image/jpeg', 8, 1555052903, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (93, '5cb071e576b3d.jpg', '/public/uploads/attach/2019/04/12/5cb071e576b3d.jpg', '/public/uploads/attach/2019/04/12/s_5cb071e576b3d.jpg', '165730', 'image/jpeg', 8, 1555067365, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (94, '5cb071e5860fa.jpg', '/public/uploads/attach/2019/04/12/5cb071e5860fa.jpg', '/public/uploads/attach/2019/04/12/s_5cb071e5860fa.jpg', '97039', 'image/jpeg', 8, 1555067365, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (173, '5d8184e07b701.jpg', 'http://activity.crmeb.net/public/uploads/attach/2019/09/18/5d8184e07b701.jpg', '\\public/uploads\\attach\\2019\\09\\18\\s_5d8184e07b701.jpg', '104423', 'image/jpeg', 3, 1568769248, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (174, '5d818530e7fab.jpg', 'http://activity.crmeb.net/public/uploads/attach/2019/09/18/5d818530e7fab.jpg', '\\public/uploads\\attach\\2019\\09\\18\\s_5d818530e7fab.jpg', '67749', 'image/jpeg', 3, 1568769328, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (175, '49c0c48ffe8339b6e327ddbd094e9c26.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\49c0c48ffe8339b6e327ddbd094e9c26.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\49c0c48ffe8339b6e327ddbd094e9c26.jpg', '479', 'text/html', 9, 1568774836, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (176, '49c0c48ffe8339b6e327ddbd094e9c26.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\49c0c48ffe8339b6e327ddbd094e9c26.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\49c0c48ffe8339b6e327ddbd094e9c26.jpg', '479', 'text/html', 9, 1568774836, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (177, '9c052507bbc576b9700ffaecdaa2cfa8.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\9c052507bbc576b9700ffaecdaa2cfa8.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\9c052507bbc576b9700ffaecdaa2cfa8.jpg', '479', 'text/html', 9, 1568774836, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (178, '2c1c210f168957db1df110b1e40d2cdf.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\2c1c210f168957db1df110b1e40d2cdf.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\2c1c210f168957db1df110b1e40d2cdf.jpg', '479', 'text/html', 9, 1568774837, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (179, '7aad45840c3a0868c3fdf5d90df7cea2.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\7aad45840c3a0868c3fdf5d90df7cea2.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\7aad45840c3a0868c3fdf5d90df7cea2.jpg', '479', 'text/html', 9, 1568774837, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (180, '93ac290b81a09f62c6ca7bb6ceb547cc.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\93ac290b81a09f62c6ca7bb6ceb547cc.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\93ac290b81a09f62c6ca7bb6ceb547cc.jpg', '479', 'text/html', 9, 1568774837, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (181, 'bd3019176d781ba4e3cd3d14dd80d720.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\bd3019176d781ba4e3cd3d14dd80d720.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\bd3019176d781ba4e3cd3d14dd80d720.jpg', '479', 'text/html', 9, 1568774837, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (182, '44941725d0b60c1d6d0621aa22c20d77.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\44941725d0b60c1d6d0621aa22c20d77.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\44941725d0b60c1d6d0621aa22c20d77.jpg', '479', 'text/html', 9, 1568774839, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (183, 'c289b939f5fae0873f30a71efce44cab.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\c289b939f5fae0873f30a71efce44cab.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\c289b939f5fae0873f30a71efce44cab.jpg', '479', 'text/html', 9, 1568774839, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (184, 'c93892d129e9b921ebb04ddbbc815dfc.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\c93892d129e9b921ebb04ddbbc815dfc.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\c93892d129e9b921ebb04ddbbc815dfc.jpg', '479', 'text/html', 9, 1568774840, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (185, 'e7588b33e19862bae55e85fbb66dd137.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\e7588b33e19862bae55e85fbb66dd137.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\e7588b33e19862bae55e85fbb66dd137.jpg', '479', 'text/html', 9, 1568774840, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (186, 'e286b7b1cfe1c000fba1724cc7486acf.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\e286b7b1cfe1c000fba1724cc7486acf.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\e286b7b1cfe1c000fba1724cc7486acf.jpg', '479', 'text/html', 9, 1568774841, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (187, '2b000631140cd7f982d73f082a748f58.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\2b000631140cd7f982d73f082a748f58.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\2b000631140cd7f982d73f082a748f58.jpg', '479', 'text/html', 9, 1568774841, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (188, '651d606e05c90f3e9298bc3afe6a1d94.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\651d606e05c90f3e9298bc3afe6a1d94.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\651d606e05c90f3e9298bc3afe6a1d94.jpg', '479', 'text/html', 9, 1568774841, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (189, 'dfe135d300982ee596b7e5cf8efae36d.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\dfe135d300982ee596b7e5cf8efae36d.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\dfe135d300982ee596b7e5cf8efae36d.jpg', '479', 'text/html', 9, 1568774841, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (190, '613df870037ce04e2faf722520c2c332.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\613df870037ce04e2faf722520c2c332.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\613df870037ce04e2faf722520c2c332.jpg', '479', 'text/html', 9, 1568774841, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (191, '633839215696482cd187cfdb81fa7fca.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\633839215696482cd187cfdb81fa7fca.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\633839215696482cd187cfdb81fa7fca.jpg', '479', 'text/html', 9, 1568774842, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (192, '796a591bd45bceee064525604e798d7f.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\796a591bd45bceee064525604e798d7f.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\796a591bd45bceee064525604e798d7f.jpg', '479', 'text/html', 9, 1568774842, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (193, '65c3d35d99cf6c1c3081ca0e2473fab7.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\65c3d35d99cf6c1c3081ca0e2473fab7.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\65c3d35d99cf6c1c3081ca0e2473fab7.jpg', '479', 'text/html', 9, 1568774842, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (194, 'e43c3cd510fbf9a490531f73cecba4f0.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\e43c3cd510fbf9a490531f73cecba4f0.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\e43c3cd510fbf9a490531f73cecba4f0.jpg', '479', 'text/html', 9, 1568774842, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (195, '5f351e730f4c9f434688c18aa5c2aa7e.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\5f351e730f4c9f434688c18aa5c2aa7e.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\5f351e730f4c9f434688c18aa5c2aa7e.jpg', '479', 'text/html', 9, 1568774842, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (196, '5f4e654c3b2d3837445157ad89544a64.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\5f4e654c3b2d3837445157ad89544a64.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\5f4e654c3b2d3837445157ad89544a64.jpg', '479', 'text/html', 9, 1568774843, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (197, '10ce17504b53b200ff03ab7058899eeb.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\10ce17504b53b200ff03ab7058899eeb.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\10ce17504b53b200ff03ab7058899eeb.jpg', '479', 'text/html', 9, 1568774843, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (198, 'bdb0517ee24ba305580983a124cd8a7f.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\bdb0517ee24ba305580983a124cd8a7f.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\bdb0517ee24ba305580983a124cd8a7f.jpg', '479', 'text/html', 9, 1568774843, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (199, '55698ef58995fb8062eaac10290def33.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\55698ef58995fb8062eaac10290def33.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\55698ef58995fb8062eaac10290def33.jpg', '479', 'text/html', 9, 1568774843, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (200, 'b54820ecb661e0dc00f2623f9a674674.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\b54820ecb661e0dc00f2623f9a674674.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\b54820ecb661e0dc00f2623f9a674674.jpg', '479', 'text/html', 9, 1568774844, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (201, 'ba0de731a0715fda43f724c9dd68e31b.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\ba0de731a0715fda43f724c9dd68e31b.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\ba0de731a0715fda43f724c9dd68e31b.jpg', '479', 'text/html', 9, 1568774844, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (202, 'f10cc0014742540bdc07337675a74909.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\f10cc0014742540bdc07337675a74909.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\f10cc0014742540bdc07337675a74909.jpg', '479', 'text/html', 9, 1568774844, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (203, '395b01d75a5420a321fc0d8acee27df1.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\395b01d75a5420a321fc0d8acee27df1.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\395b01d75a5420a321fc0d8acee27df1.jpg', '479', 'text/html', 9, 1568774844, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (204, '952fd511999db4ea5cd1efbc7f3a3f7f.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\952fd511999db4ea5cd1efbc7f3a3f7f.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\952fd511999db4ea5cd1efbc7f3a3f7f.jpg', '479', 'text/html', 9, 1568774844, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (205, 'c654d3b52ba5bbaaeffebab8457bb44d.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\c654d3b52ba5bbaaeffebab8457bb44d.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\c654d3b52ba5bbaaeffebab8457bb44d.jpg', '479', 'text/html', 9, 1568774845, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (206, '2e738000c05ba3f0daed52962a1957f3.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\2e738000c05ba3f0daed52962a1957f3.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\2e738000c05ba3f0daed52962a1957f3.jpg', '479', 'text/html', 9, 1568774845, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (207, '3a26d43832bd5dc749d442f6942866f2.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\3a26d43832bd5dc749d442f6942866f2.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\3a26d43832bd5dc749d442f6942866f2.jpg', '479', 'text/html', 9, 1568774845, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (208, '0dfe62604a17540815f5078d6d51f963.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\0dfe62604a17540815f5078d6d51f963.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\0dfe62604a17540815f5078d6d51f963.jpg', '479', 'text/html', 9, 1568774845, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (209, 'ae71f971af62f6f288d2d23ee0bf67f3.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\ae71f971af62f6f288d2d23ee0bf67f3.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\ae71f971af62f6f288d2d23ee0bf67f3.jpg', '479', 'text/html', 9, 1568774846, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (210, '5eb1e68c639952d68f424eb794cdb191.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\5eb1e68c639952d68f424eb794cdb191.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\5eb1e68c639952d68f424eb794cdb191.jpg', '479', 'text/html', 9, 1568774846, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (211, '46570c7efa27dfdcc9da732b106d0dd3.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\46570c7efa27dfdcc9da732b106d0dd3.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\46570c7efa27dfdcc9da732b106d0dd3.jpg', '479', 'text/html', 9, 1568774846, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (212, '3d1ec44b20762aa4c6737e6ae74164cc.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\3d1ec44b20762aa4c6737e6ae74164cc.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\3d1ec44b20762aa4c6737e6ae74164cc.jpg', '479', 'text/html', 9, 1568774847, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (213, '50c2251fbafac8c9c744be910db6c5dd.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\50c2251fbafac8c9c744be910db6c5dd.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\50c2251fbafac8c9c744be910db6c5dd.jpg', '479', 'text/html', 9, 1568774847, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (214, '66e2379f59fe7c54ae44d5542c71b20c.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\66e2379f59fe7c54ae44d5542c71b20c.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\66e2379f59fe7c54ae44d5542c71b20c.jpg', '479', 'text/html', 9, 1568774847, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (215, '931a1a3098fb934a01118cd4be4bae53.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\931a1a3098fb934a01118cd4be4bae53.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\931a1a3098fb934a01118cd4be4bae53.jpg', '479', 'text/html', 9, 1568774847, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (216, 'c9431c372d9e47e6f29f6bf6d993d0d9.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\c9431c372d9e47e6f29f6bf6d993d0d9.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\c9431c372d9e47e6f29f6bf6d993d0d9.jpg', '479', 'text/html', 9, 1568774847, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (217, '25fca983bee39c3e59d840fc0e785df7.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\25fca983bee39c3e59d840fc0e785df7.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\25fca983bee39c3e59d840fc0e785df7.jpg', '479', 'text/html', 9, 1568774847, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (218, 'b2a63e3cb5bd812c27ecab83c2af9811.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\b2a63e3cb5bd812c27ecab83c2af9811.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\b2a63e3cb5bd812c27ecab83c2af9811.jpg', '479', 'text/html', 9, 1568774848, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (219, 'fb72505f7a2f928fb28cbee4e0f8e85f.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\fb72505f7a2f928fb28cbee4e0f8e85f.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\fb72505f7a2f928fb28cbee4e0f8e85f.jpg', '479', 'text/html', 9, 1568774848, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (220, '90391cf40b6d67c04d86a7513a7868f0.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\90391cf40b6d67c04d86a7513a7868f0.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\90391cf40b6d67c04d86a7513a7868f0.jpg', '479', 'text/html', 9, 1568774848, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (221, '1bfee6ee7dc5c9f56817d41c2f63a98c.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\1bfee6ee7dc5c9f56817d41c2f63a98c.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\1bfee6ee7dc5c9f56817d41c2f63a98c.jpg', '479', 'text/html', 9, 1568774848, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (222, 'ce2c09b98fe982dcd4e714bbcc1690b5.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\ce2c09b98fe982dcd4e714bbcc1690b5.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\ce2c09b98fe982dcd4e714bbcc1690b5.jpg', '479', 'text/html', 9, 1568774848, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (223, 'a4a5aebc6755493594d1e835ca58f62c.png', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\a4a5aebc6755493594d1e835ca58f62c.png', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\a4a5aebc6755493594d1e835ca58f62c.png', '479', 'text/html', 9, 1568774950, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (224, 'a4a5aebc6755493594d1e835ca58f62c.png', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\a4a5aebc6755493594d1e835ca58f62c.png', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\a4a5aebc6755493594d1e835ca58f62c.png', '479', 'text/html', 9, 1568774950, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (225, '5a77c7c5d376e4c4b48321af88303dbd.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\5a77c7c5d376e4c4b48321af88303dbd.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\5a77c7c5d376e4c4b48321af88303dbd.jpg', '479', 'text/html', 9, 1568774951, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (226, '69a8c72ae16725a95df4792109b48e04.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\69a8c72ae16725a95df4792109b48e04.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\69a8c72ae16725a95df4792109b48e04.jpg', '479', 'text/html', 9, 1568774951, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (227, '7a109b2dae42fea5c80a5e82374ef41d.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\7a109b2dae42fea5c80a5e82374ef41d.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\7a109b2dae42fea5c80a5e82374ef41d.jpg', '479', 'text/html', 9, 1568774951, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (228, 'a240e5312b1aec619c27f87d16d62e21.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\a240e5312b1aec619c27f87d16d62e21.jpg', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\a240e5312b1aec619c27f87d16d62e21.jpg', '479', 'text/html', 9, 1568774951, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (229, '72d128c2bfe806f62285af9699c8b271.png', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\72d128c2bfe806f62285af9699c8b271.png', 'http://activity.crmeb.net\\public/uploads\\attach\\2019\\09\\18\\\\72d128c2bfe806f62285af9699c8b271.png', '479', 'text/html', 9, 1568774952, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (230, '00143da73713f2a5634a2030f8bcb0df.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\00143da73713f2a5634a2030f8bcb0df.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\00143da73713f2a5634a2030f8bcb0df.jpg', '40594', 'image/jpeg', 9, 1568796960, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (231, '00143da73713f2a5634a2030f8bcb0df.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\00143da73713f2a5634a2030f8bcb0df.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\00143da73713f2a5634a2030f8bcb0df.jpg', '40594', 'image/jpeg', 9, 1568796960, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (232, '671992b0501d15f8827fd36b9217c3c1.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\671992b0501d15f8827fd36b9217c3c1.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\671992b0501d15f8827fd36b9217c3c1.jpg', '30984', 'image/jpeg', 9, 1568796960, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (233, 'ec41b4eea040275b217ff452855620b2.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\ec41b4eea040275b217ff452855620b2.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\ec41b4eea040275b217ff452855620b2.jpg', '57785', 'image/jpeg', 9, 1568796960, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (234, '4685a06369af63c157de02b2f2c3ac92.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\4685a06369af63c157de02b2f2c3ac92.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\4685a06369af63c157de02b2f2c3ac92.jpg', '48476', 'image/jpeg', 9, 1568796960, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (235, '5bfbdb1d6d501ccc57bbcd15a0731099.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\5bfbdb1d6d501ccc57bbcd15a0731099.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\5bfbdb1d6d501ccc57bbcd15a0731099.jpg', '249657', 'image/jpeg', 9, 1568796960, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (236, '2bbbd83f3510d3738790473fc465d5b0.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\2bbbd83f3510d3738790473fc465d5b0.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\2bbbd83f3510d3738790473fc465d5b0.jpg', '221490', 'image/jpeg', 9, 1568796960, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (237, '5623e9219ed46401ba6638bfa6918d1c.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\5623e9219ed46401ba6638bfa6918d1c.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\5623e9219ed46401ba6638bfa6918d1c.jpg', '196766', 'image/jpeg', 9, 1568796961, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (238, 'cb02d0ba6242e9975297b376391962eb.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\cb02d0ba6242e9975297b376391962eb.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\cb02d0ba6242e9975297b376391962eb.jpg', '244113', 'image/jpeg', 9, 1568796961, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (239, 'b369641521dbd8956b001490ddb43440.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\b369641521dbd8956b001490ddb43440.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\b369641521dbd8956b001490ddb43440.jpg', '167208', 'image/jpeg', 9, 1568796961, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (240, 'aef616195c2c74cfaa36ba1575a32fac.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\aef616195c2c74cfaa36ba1575a32fac.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\aef616195c2c74cfaa36ba1575a32fac.jpg', '272568', 'image/jpeg', 9, 1568796961, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (241, 'c59ae28d019ddb557b5beb24b27bbb61.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\c59ae28d019ddb557b5beb24b27bbb61.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\c59ae28d019ddb557b5beb24b27bbb61.jpg', '202055', 'image/jpeg', 9, 1568796961, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (242, 'b43c12ee2672a06058389bd66f1ff06c.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\b43c12ee2672a06058389bd66f1ff06c.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\b43c12ee2672a06058389bd66f1ff06c.jpg', '297637', 'image/jpeg', 9, 1568796961, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (243, 'f0ab9806351280dfda4afd18cec49619.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\f0ab9806351280dfda4afd18cec49619.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\f0ab9806351280dfda4afd18cec49619.jpg', '289082', 'image/jpeg', 9, 1568796961, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (244, 'efec4b8d56e581d45d53779475d49712.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\efec4b8d56e581d45d53779475d49712.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\efec4b8d56e581d45d53779475d49712.jpg', '401805', 'image/jpeg', 9, 1568796962, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (245, 'fd93450fe6362b88e1e15e72e42fea00.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\fd93450fe6362b88e1e15e72e42fea00.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\fd93450fe6362b88e1e15e72e42fea00.jpg', '339363', 'image/jpeg', 9, 1568796962, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (246, 'd01f29cd3287d9c1a19f4fb24f59dbb5.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\d01f29cd3287d9c1a19f4fb24f59dbb5.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\d01f29cd3287d9c1a19f4fb24f59dbb5.jpg', '399335', 'image/jpeg', 9, 1568796962, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (247, 'b9357c6bfb71feda02a5ca9dc6624f45.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\b9357c6bfb71feda02a5ca9dc6624f45.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\b9357c6bfb71feda02a5ca9dc6624f45.jpg', '397331', 'image/jpeg', 9, 1568796962, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (248, '1e256e03d255cc70e01e23bb0355e316.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\1e256e03d255cc70e01e23bb0355e316.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\1e256e03d255cc70e01e23bb0355e316.jpg', '464204', 'image/jpeg', 9, 1568796962, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (249, 'fba81b6703799f02d05689e22b2a9333.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\fba81b6703799f02d05689e22b2a9333.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\fba81b6703799f02d05689e22b2a9333.jpg', '595482', 'image/jpeg', 9, 1568796962, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (250, '67fb151fc42f12db2878cd6ae4ec9462.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\67fb151fc42f12db2878cd6ae4ec9462.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\67fb151fc42f12db2878cd6ae4ec9462.jpg', '668335', 'image/jpeg', 9, 1568796962, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (251, 'c15d868e66799b7954234d859af06347.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\c15d868e66799b7954234d859af06347.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\c15d868e66799b7954234d859af06347.jpg', '529482', 'image/jpeg', 9, 1568796963, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (252, 'f29cb93036e63d2d9a11f702f568753d.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\18\\\\f29cb93036e63d2d9a11f702f568753d.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\18\\\\f29cb93036e63d2d9a11f702f568753d.jpg', '591219', 'image/jpeg', 9, 1568796963, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (253, '3afbd4fa7a2793e3f509c26fae9eeff7.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\3afbd4fa7a2793e3f509c26fae9eeff7.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\3afbd4fa7a2793e3f509c26fae9eeff7.jpg', '312827', 'image/jpeg', 9, 1568945447, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (254, '3afbd4fa7a2793e3f509c26fae9eeff7.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\3afbd4fa7a2793e3f509c26fae9eeff7.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\3afbd4fa7a2793e3f509c26fae9eeff7.jpg', '312827', 'image/jpeg', 9, 1568945447, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (255, 'a01c93d07a93d735ffbbe029c220c44d.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\a01c93d07a93d735ffbbe029c220c44d.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\a01c93d07a93d735ffbbe029c220c44d.jpg', '379544', 'image/jpeg', 9, 1568945447, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (256, '9cbb38ceb2842e35ef8e175a8622f961.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\9cbb38ceb2842e35ef8e175a8622f961.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\9cbb38ceb2842e35ef8e175a8622f961.jpg', '385765', 'image/jpeg', 9, 1568945447, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (257, '735a9b0f23c1c89ed3c52ed8a2d261cf.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\735a9b0f23c1c89ed3c52ed8a2d261cf.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\735a9b0f23c1c89ed3c52ed8a2d261cf.jpg', '328137', 'image/jpeg', 9, 1568945448, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (258, '43aec952a4c8b8aef9161ca14a522fd5.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\43aec952a4c8b8aef9161ca14a522fd5.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\43aec952a4c8b8aef9161ca14a522fd5.jpg', '484340', 'image/jpeg', 9, 1568945448, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (259, 'cfb3de53079442db34cb5d32bcff5204.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\cfb3de53079442db34cb5d32bcff5204.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\cfb3de53079442db34cb5d32bcff5204.jpg', '405488', 'image/jpeg', 9, 1568945459, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (260, '8e1f0381831d2404efdb4bacd1b2c7e2.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\8e1f0381831d2404efdb4bacd1b2c7e2.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\8e1f0381831d2404efdb4bacd1b2c7e2.jpg', '51455', 'image/jpeg', 9, 1568945459, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (261, '7636c06a2c9e9b78283825f40d22d179.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\7636c06a2c9e9b78283825f40d22d179.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\7636c06a2c9e9b78283825f40d22d179.jpg', '328137', 'image/jpeg', 9, 1568945459, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (262, 'dcb478d581bd38fd84ad0a25f7cebcd6.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\dcb478d581bd38fd84ad0a25f7cebcd6.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\dcb478d581bd38fd84ad0a25f7cebcd6.jpg', '390528', 'image/jpeg', 9, 1568945460, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (263, 'a765656842e01390a642fcf610a5ac17.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\a765656842e01390a642fcf610a5ac17.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\a765656842e01390a642fcf610a5ac17.jpg', '484340', 'image/jpeg', 9, 1568945460, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (264, 'dfc5336309f4f04540408e9894846a6f.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\dfc5336309f4f04540408e9894846a6f.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\dfc5336309f4f04540408e9894846a6f.jpg', '235142', 'image/jpeg', 9, 1568945460, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (265, '510c9b51ff38b27949afd53453c2a99d.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\510c9b51ff38b27949afd53453c2a99d.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\510c9b51ff38b27949afd53453c2a99d.jpg', '333921', 'image/jpeg', 9, 1568945460, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (266, '051075ea62444dfc35604180dd663f2e.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\051075ea62444dfc35604180dd663f2e.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\051075ea62444dfc35604180dd663f2e.jpg', '399946', 'image/jpeg', 9, 1568945460, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (267, '8a5a28fd249ee1f1f7494e02651ea2fd.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\8a5a28fd249ee1f1f7494e02651ea2fd.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\8a5a28fd249ee1f1f7494e02651ea2fd.jpg', '349130', 'image/jpeg', 9, 1568945460, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (268, '9fd2f8e470047ed260c587c58d4a279c.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\9fd2f8e470047ed260c587c58d4a279c.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\9fd2f8e470047ed260c587c58d4a279c.jpg', '129911', 'image/jpeg', 9, 1568945460, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (269, '71f691bb2fa7e6316bbdce29a477c7df.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\71f691bb2fa7e6316bbdce29a477c7df.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\71f691bb2fa7e6316bbdce29a477c7df.jpg', '228669', 'image/jpeg', 9, 1568945460, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (270, 'd6106acdd34634b0f42749fc4480877b.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\d6106acdd34634b0f42749fc4480877b.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\d6106acdd34634b0f42749fc4480877b.jpg', '222320', 'image/jpeg', 9, 1568945460, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (271, 'f509a05206faf93c4688dcea1dae3b81.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\f509a05206faf93c4688dcea1dae3b81.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\f509a05206faf93c4688dcea1dae3b81.jpg', '216864', 'image/jpeg', 9, 1568945461, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (272, '1e031825e200e660694cbccfd24958c3.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\1e031825e200e660694cbccfd24958c3.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\1e031825e200e660694cbccfd24958c3.jpg', '218073', 'image/jpeg', 9, 1568945461, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (273, '0009bacac912153081c18b5c04008a96.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\0009bacac912153081c18b5c04008a96.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\0009bacac912153081c18b5c04008a96.jpg', '557399', 'image/jpeg', 9, 1568945461, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (274, '36852649272381a78c54e9bb3ef1b87c.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\36852649272381a78c54e9bb3ef1b87c.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\36852649272381a78c54e9bb3ef1b87c.jpg', '501549', 'image/jpeg', 9, 1568945461, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (275, '5eee4fdbc505d603f2405138d04580d0.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\5eee4fdbc505d603f2405138d04580d0.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\5eee4fdbc505d603f2405138d04580d0.jpg', '427190', 'image/jpeg', 9, 1568945461, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (276, 'c696b20802c58b7766caebbad2816338.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\c696b20802c58b7766caebbad2816338.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\c696b20802c58b7766caebbad2816338.jpg', '401642', 'image/jpeg', 9, 1568945461, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (277, '7876de2bd5e87adb756767b4e62c6017.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\7876de2bd5e87adb756767b4e62c6017.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\7876de2bd5e87adb756767b4e62c6017.jpg', '445416', 'image/jpeg', 9, 1568945461, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (278, '83648021b6db62fc230c01edcaed2f9e.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\83648021b6db62fc230c01edcaed2f9e.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\83648021b6db62fc230c01edcaed2f9e.jpg', '439797', 'image/jpeg', 9, 1568945461, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (279, '6aaa8d9adefabcf7e23ff07aa668b9a6.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\6aaa8d9adefabcf7e23ff07aa668b9a6.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\6aaa8d9adefabcf7e23ff07aa668b9a6.jpg', '409751', 'image/jpeg', 9, 1568945462, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (280, '0381208ef800b6b675c701cefb3d8dcd.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\0381208ef800b6b675c701cefb3d8dcd.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\0381208ef800b6b675c701cefb3d8dcd.jpg', '544967', 'image/jpeg', 9, 1568945462, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (281, 'caa0d39cfcc52c44f8c65e5f0c9cbd36.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\20\\\\caa0d39cfcc52c44f8c65e5f0c9cbd36.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\20\\\\caa0d39cfcc52c44f8c65e5f0c9cbd36.jpg', '470432', 'image/jpeg', 9, 1568945462, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (282, '28e03d3ced4f7613a339c6136bea39ad.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\28e03d3ced4f7613a339c6136bea39ad.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\28e03d3ced4f7613a339c6136bea39ad.jpg', '48121', 'image/jpeg', 9, 1569133482, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (283, '28e03d3ced4f7613a339c6136bea39ad.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\28e03d3ced4f7613a339c6136bea39ad.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\28e03d3ced4f7613a339c6136bea39ad.jpg', '48121', 'image/jpeg', 9, 1569133482, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (284, 'dd4101072215de9c5f95cf7f6b215ae0.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\dd4101072215de9c5f95cf7f6b215ae0.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\dd4101072215de9c5f95cf7f6b215ae0.jpg', '245362', 'image/jpeg', 9, 1569133482, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (285, 'b20d2576e602ef13c4b5dff9ce967bde.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\b20d2576e602ef13c4b5dff9ce967bde.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\b20d2576e602ef13c4b5dff9ce967bde.jpg', '245362', 'image/jpeg', 9, 1569133483, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (286, 'dcce240f4721cd52bf206fe4e321d9cd.gif', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\dcce240f4721cd52bf206fe4e321d9cd.gif', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\dcce240f4721cd52bf206fe4e321d9cd.gif', '43', 'image/gif', 9, 1569133483, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (287, '535afb10bab8f91ef9cecd5da98d9f0d.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\535afb10bab8f91ef9cecd5da98d9f0d.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\535afb10bab8f91ef9cecd5da98d9f0d.jpg', '22916', 'image/jpeg', 9, 1569133483, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (288, 'e38419f3791914c2243da858b791c427.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\e38419f3791914c2243da858b791c427.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\e38419f3791914c2243da858b791c427.jpg', '50784', 'image/jpeg', 9, 1569133484, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (289, '7e0a98fc3279162624bab205ca6d3a54.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\7e0a98fc3279162624bab205ca6d3a54.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\7e0a98fc3279162624bab205ca6d3a54.jpg', '62416', 'image/jpeg', 9, 1569133484, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (290, '7d289e3f874dfbbec0b7de5f1b0d4413.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\7d289e3f874dfbbec0b7de5f1b0d4413.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\7d289e3f874dfbbec0b7de5f1b0d4413.jpg', '25875', 'image/jpeg', 9, 1569133484, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (291, '457e528ac931b014f953621c155c08f0.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\457e528ac931b014f953621c155c08f0.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\457e528ac931b014f953621c155c08f0.jpg', '25997', 'image/jpeg', 9, 1569133485, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (292, '65aaec8665cb65b17bb22e119c5e193f.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\65aaec8665cb65b17bb22e119c5e193f.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\65aaec8665cb65b17bb22e119c5e193f.jpg', '29299', 'image/jpeg', 9, 1569133485, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (293, '4198b6d1a2e878437df5c350689c462c.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\4198b6d1a2e878437df5c350689c462c.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\4198b6d1a2e878437df5c350689c462c.jpg', '19119', 'image/jpeg', 9, 1569133485, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (294, '3ac7b5f3d8587399c302d683941df227.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\3ac7b5f3d8587399c302d683941df227.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\3ac7b5f3d8587399c302d683941df227.jpg', '20465', 'image/jpeg', 9, 1569133485, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (295, '59f3ec12665295807bfb8fc18d41a1bd.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\59f3ec12665295807bfb8fc18d41a1bd.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\59f3ec12665295807bfb8fc18d41a1bd.jpg', '20432', 'image/jpeg', 9, 1569133485, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (296, 'ed2e5a12ea08d78f70b9d9813b4f3393.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\ed2e5a12ea08d78f70b9d9813b4f3393.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\ed2e5a12ea08d78f70b9d9813b4f3393.jpg', '23871', 'image/jpeg', 9, 1569133486, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (297, 'db5bbadb569ed4866bf4f6e7c9f43120.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\db5bbadb569ed4866bf4f6e7c9f43120.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\db5bbadb569ed4866bf4f6e7c9f43120.jpg', '19326', 'image/jpeg', 9, 1569133486, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (298, '2f6fc591d88609abe4b39d48427ed4d8.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\2f6fc591d88609abe4b39d48427ed4d8.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\2f6fc591d88609abe4b39d48427ed4d8.jpg', '29155', 'image/jpeg', 9, 1569133486, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (299, '40dc91499c6602995e30fbfd8e68d846.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\40dc91499c6602995e30fbfd8e68d846.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\40dc91499c6602995e30fbfd8e68d846.jpg', '28833', 'image/jpeg', 9, 1569133486, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (300, 'dcce240f4721cd52bf206fe4e321d9cd.gif', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\dcce240f4721cd52bf206fe4e321d9cd.gif', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\dcce240f4721cd52bf206fe4e321d9cd.gif', '43', 'image/gif', 9, 1569133486, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (301, 'da56549f28222129a122335fdbd2a98d.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\da56549f28222129a122335fdbd2a98d.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\da56549f28222129a122335fdbd2a98d.jpg', '3095053', 'image/jpeg', 9, 1569133488, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (302, 'dcce240f4721cd52bf206fe4e321d9cd.gif', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\dcce240f4721cd52bf206fe4e321d9cd.gif', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\dcce240f4721cd52bf206fe4e321d9cd.gif', '43', 'image/gif', 9, 1569133488, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (303, 'dcce240f4721cd52bf206fe4e321d9cd.gif', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\dcce240f4721cd52bf206fe4e321d9cd.gif', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\dcce240f4721cd52bf206fe4e321d9cd.gif', '43', 'image/gif', 9, 1569133488, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (304, 'b10b452b02017cbfd43693b332bb50e7.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\b10b452b02017cbfd43693b332bb50e7.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\b10b452b02017cbfd43693b332bb50e7.jpg', '84685', 'image/jpeg', 9, 1569133488, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (305, '7b2e0d5f4d4b3081f52982348c987282.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\7b2e0d5f4d4b3081f52982348c987282.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\7b2e0d5f4d4b3081f52982348c987282.jpg', '149663', 'image/jpeg', 9, 1569133489, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (306, 'be7d9f5ffb076fff31da96963e12e107.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\be7d9f5ffb076fff31da96963e12e107.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\be7d9f5ffb076fff31da96963e12e107.jpg', '107749', 'image/jpeg', 9, 1569133489, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (307, '4494761c089005d3d6d5877cdbb3fa83.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\4494761c089005d3d6d5877cdbb3fa83.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\4494761c089005d3d6d5877cdbb3fa83.jpg', '132921', 'image/jpeg', 9, 1569133489, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (308, '61ca4d17a425e841fc2099fb2780bbd6.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\61ca4d17a425e841fc2099fb2780bbd6.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\61ca4d17a425e841fc2099fb2780bbd6.jpg', '222722', 'image/jpeg', 9, 1569133490, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (309, 'c527c7a597186e46a1f179e3a447a7b9.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\c527c7a597186e46a1f179e3a447a7b9.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\c527c7a597186e46a1f179e3a447a7b9.jpg', '126803', 'image/jpeg', 9, 1569133490, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (310, 'dcce240f4721cd52bf206fe4e321d9cd.gif', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\dcce240f4721cd52bf206fe4e321d9cd.gif', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\dcce240f4721cd52bf206fe4e321d9cd.gif', '43', 'image/gif', 9, 1569133490, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (311, 'dcce240f4721cd52bf206fe4e321d9cd.gif', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\dcce240f4721cd52bf206fe4e321d9cd.gif', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\dcce240f4721cd52bf206fe4e321d9cd.gif', '43', 'image/gif', 9, 1569133490, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (312, 'e43b98f2d37effee55ba4307560f3c7f.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\e43b98f2d37effee55ba4307560f3c7f.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\e43b98f2d37effee55ba4307560f3c7f.jpg', '74727', 'image/jpeg', 9, 1569133644, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (313, 'e43b98f2d37effee55ba4307560f3c7f.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\e43b98f2d37effee55ba4307560f3c7f.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\e43b98f2d37effee55ba4307560f3c7f.jpg', '74727', 'image/jpeg', 9, 1569133645, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (314, 'b1798ed2d6b5b9c75bf7fa11703a3201.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\b1798ed2d6b5b9c75bf7fa11703a3201.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\b1798ed2d6b5b9c75bf7fa11703a3201.jpg', '53475', 'image/jpeg', 9, 1569133645, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (315, '52bfe48235afd1b0a881c35714542aa1.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\52bfe48235afd1b0a881c35714542aa1.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\52bfe48235afd1b0a881c35714542aa1.jpg', '44737', 'image/jpeg', 9, 1569133645, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (316, '6fc0efdc9a7582d3552279f375a9428d.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\6fc0efdc9a7582d3552279f375a9428d.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\6fc0efdc9a7582d3552279f375a9428d.jpg', '27007', 'image/jpeg', 9, 1569133646, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (317, '0fc890ce7262d25f5ab51c30c48abb16.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\0fc890ce7262d25f5ab51c30c48abb16.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\0fc890ce7262d25f5ab51c30c48abb16.jpg', '59220', 'image/jpeg', 9, 1569133646, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (318, 'f961bf5d14ba43467cc8db4367f2e906.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\f961bf5d14ba43467cc8db4367f2e906.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\f961bf5d14ba43467cc8db4367f2e906.jpg', '71841', 'image/jpeg', 9, 1569133699, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (319, 'f961bf5d14ba43467cc8db4367f2e906.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\f961bf5d14ba43467cc8db4367f2e906.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\f961bf5d14ba43467cc8db4367f2e906.jpg', '71841', 'image/jpeg', 9, 1569133699, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (320, 'b42bd261e9d60ff1ea918284d8525f82.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\b42bd261e9d60ff1ea918284d8525f82.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\b42bd261e9d60ff1ea918284d8525f82.jpg', '39370', 'image/jpeg', 9, 1569133699, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (321, 'edf62b663a54aec64270855c25889c9b.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\edf62b663a54aec64270855c25889c9b.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\edf62b663a54aec64270855c25889c9b.jpg', '47205', 'image/jpeg', 9, 1569133699, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (322, '0b4ad201dc0aabf726060065c6e63b0b.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\0b4ad201dc0aabf726060065c6e63b0b.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\0b4ad201dc0aabf726060065c6e63b0b.jpg', '27998', 'image/jpeg', 9, 1569133700, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (323, '5d54a012e42eb0f6dc0482e7ae4f1f1c.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\22\\\\5d54a012e42eb0f6dc0482e7ae4f1f1c.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\22\\\\5d54a012e42eb0f6dc0482e7ae4f1f1c.jpg', '68418', 'image/jpeg', 9, 1569133700, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (324, 'c017e27391b3618bb1c68b644e6b6e7e.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\26\\\\c017e27391b3618bb1c68b644e6b6e7e.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\26\\\\c017e27391b3618bb1c68b644e6b6e7e.jpg', '85266', 'image/jpeg', 9, 1569474863, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (325, 'c017e27391b3618bb1c68b644e6b6e7e.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\26\\\\c017e27391b3618bb1c68b644e6b6e7e.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\26\\\\c017e27391b3618bb1c68b644e6b6e7e.jpg', '85266', 'image/jpeg', 9, 1569474863, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (326, '5d5dd2d173500f6ce87a50de12bc071b.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\26\\\\5d5dd2d173500f6ce87a50de12bc071b.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\26\\\\5d5dd2d173500f6ce87a50de12bc071b.jpg', '78732', 'image/jpeg', 9, 1569474863, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (327, 'fabf74b7a333946a914f0a57606b6578.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\26\\\\fabf74b7a333946a914f0a57606b6578.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\26\\\\fabf74b7a333946a914f0a57606b6578.jpg', '62272', 'image/jpeg', 9, 1569474863, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (328, '1c30a6100190a31e6189fbf93134b314.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\26\\\\1c30a6100190a31e6189fbf93134b314.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\26\\\\1c30a6100190a31e6189fbf93134b314.jpg', '75959', 'image/jpeg', 9, 1569474863, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (329, 'b43b3913aaff174c917733a4d36da3e1.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\26\\\\b43b3913aaff174c917733a4d36da3e1.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\26\\\\b43b3913aaff174c917733a4d36da3e1.jpg', '85266', 'image/jpeg', 9, 1569474863, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (330, 'f9c97c89a1019083c4a81f168a1f4d34.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\27\\\\f9c97c89a1019083c4a81f168a1f4d34.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\27\\\\f9c97c89a1019083c4a81f168a1f4d34.jpg', '71293', 'image/jpeg', 9, 1569550251, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (331, 'f9c97c89a1019083c4a81f168a1f4d34.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\27\\\\f9c97c89a1019083c4a81f168a1f4d34.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\27\\\\f9c97c89a1019083c4a81f168a1f4d34.jpg', '71293', 'image/jpeg', 9, 1569550252, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (332, 'fb03e941eb06e3960c046b45ba6df08c.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\27\\\\fb03e941eb06e3960c046b45ba6df08c.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\27\\\\fb03e941eb06e3960c046b45ba6df08c.jpg', '42305', 'image/jpeg', 9, 1569550252, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (333, 'b7aeeec2ab41789ec92609b74d795c2e.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\27\\\\b7aeeec2ab41789ec92609b74d795c2e.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\27\\\\b7aeeec2ab41789ec92609b74d795c2e.jpg', '52563', 'image/jpeg', 9, 1569550252, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (334, 'bafbae3b007ca2a242210516abd867b5.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\27\\\\bafbae3b007ca2a242210516abd867b5.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\27\\\\bafbae3b007ca2a242210516abd867b5.jpg', '65725', 'image/jpeg', 9, 1569550252, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (335, '59bd99a64639700434a027779bffbde0.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\09\\27\\\\59bd99a64639700434a027779bffbde0.jpg', 'http://www.tp5crm.com/\\public/uploads\\attach\\2019\\09\\27\\\\59bd99a64639700434a027779bffbde0.jpg', '32219', 'image/jpeg', 9, 1569550252, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (336, '5d9609b91ac26.png', 'http://www.bs.com//public/uploads/attach/2019/10/03/5d9609b91ac26.png', '\\public/uploads\\attach\\2019\\10\\03\\s_5d9609b91ac26.png', '6731', 'image/png', 3, 1570113977, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (337, '5d9609b976a02.png', 'http://www.bs.com//public/uploads/attach/2019/10/03/5d9609b976a02.png', '\\public/uploads\\attach\\2019\\10\\03\\s_5d9609b976a02.png', '37872', 'image/png', 3, 1570113977, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (338, '5d9609ba12ac8.png', 'http://www.bs.com//public/uploads/attach/2019/10/03/5d9609ba12ac8.png', '\\public/uploads\\attach\\2019\\10\\03\\s_5d9609ba12ac8.png', '32946', 'image/png', 3, 1570113978, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (339, '5d9609ba522e4.png', 'http://www.bs.com//public/uploads/attach/2019/10/03/5d9609ba522e4.png', '\\public/uploads\\attach\\2019\\10\\03\\s_5d9609ba522e4.png', '25627', 'image/png', 3, 1570113978, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (340, '86dd69a53226b09212e20d52ff81711a.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\86dd69a53226b09212e20d52ff81711a.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\86dd69a53226b09212e20d52ff81711a.jpg', '93481', 'image/jpeg', 9, 1570192870, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (341, '86dd69a53226b09212e20d52ff81711a.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\86dd69a53226b09212e20d52ff81711a.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\86dd69a53226b09212e20d52ff81711a.jpg', '93481', 'image/jpeg', 9, 1570192870, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (342, '0de58398548d64a3f43f333d271a2d92.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\0de58398548d64a3f43f333d271a2d92.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\0de58398548d64a3f43f333d271a2d92.jpg', '67100', 'image/jpeg', 9, 1570192870, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (343, 'a36b9208ce67f74a8ad4d767fd8ec4f7.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\a36b9208ce67f74a8ad4d767fd8ec4f7.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\a36b9208ce67f74a8ad4d767fd8ec4f7.jpg', '69901', 'image/jpeg', 9, 1570192870, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (344, 'd516de444e9a20fb7728aa9c4adb4df8.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\d516de444e9a20fb7728aa9c4adb4df8.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\d516de444e9a20fb7728aa9c4adb4df8.jpg', '52916', 'image/jpeg', 9, 1570192870, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (345, '7520a58ff5272bd33637379da3e3bb27.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\7520a58ff5272bd33637379da3e3bb27.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\7520a58ff5272bd33637379da3e3bb27.jpg', '74889', 'image/jpeg', 9, 1570192870, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (346, '0cf49fd935a4311371888470dfbee41f.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\0cf49fd935a4311371888470dfbee41f.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\0cf49fd935a4311371888470dfbee41f.jpg', '30680', 'image/jpeg', 9, 1570192941, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (347, '0cf49fd935a4311371888470dfbee41f.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\0cf49fd935a4311371888470dfbee41f.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\0cf49fd935a4311371888470dfbee41f.jpg', '30680', 'image/jpeg', 9, 1570192942, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (348, '24ec6359dd1553db000d669e23c3219e.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\24ec6359dd1553db000d669e23c3219e.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\24ec6359dd1553db000d669e23c3219e.jpg', '27661', 'image/jpeg', 9, 1570192942, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (349, '031f3e44ecd5de5091e10c653a48d3ff.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\031f3e44ecd5de5091e10c653a48d3ff.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\031f3e44ecd5de5091e10c653a48d3ff.jpg', '58087', 'image/jpeg', 9, 1570192942, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (350, '46c0e576432eedf2b912e49e00408683.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\46c0e576432eedf2b912e49e00408683.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\46c0e576432eedf2b912e49e00408683.jpg', '47210', 'image/jpeg', 9, 1570192942, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (351, '648e77223059d1c9dbc239ea14fb9936.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\648e77223059d1c9dbc239ea14fb9936.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\648e77223059d1c9dbc239ea14fb9936.jpg', '64481', 'image/jpeg', 9, 1570192942, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (352, 'd4513d907066d0a02d9d7899d2f89f4b.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\d4513d907066d0a02d9d7899d2f89f4b.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\d4513d907066d0a02d9d7899d2f89f4b.jpg', '110970', 'image/jpeg', 9, 1570192991, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (353, 'd4513d907066d0a02d9d7899d2f89f4b.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\d4513d907066d0a02d9d7899d2f89f4b.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\d4513d907066d0a02d9d7899d2f89f4b.jpg', '110970', 'image/jpeg', 9, 1570192991, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (354, '6fa41cf194388a4f8138cc285efa86ae.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\6fa41cf194388a4f8138cc285efa86ae.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\6fa41cf194388a4f8138cc285efa86ae.jpg', '96227', 'image/jpeg', 9, 1570192991, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (355, '1e01ecbb24554b2105c273c0fe9ecd76.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\1e01ecbb24554b2105c273c0fe9ecd76.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\1e01ecbb24554b2105c273c0fe9ecd76.jpg', '63709', 'image/jpeg', 9, 1570192991, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (356, 'c0a2d6bf96f4353661290d0a6842d2a3.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\c0a2d6bf96f4353661290d0a6842d2a3.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\04\\\\c0a2d6bf96f4353661290d0a6842d2a3.jpg', '54786', 'image/jpeg', 9, 1570192991, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (357, '1b717df891df6bea000328aa27c41644.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\1b717df891df6bea000328aa27c41644.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\1b717df891df6bea000328aa27c41644.jpg', '73843', 'image/jpeg', 9, 1570239610, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (358, '1b717df891df6bea000328aa27c41644.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\1b717df891df6bea000328aa27c41644.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\1b717df891df6bea000328aa27c41644.jpg', '73843', 'image/jpeg', 9, 1570239610, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (359, 'ba60eee57ad6114d734689d7982991db.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\ba60eee57ad6114d734689d7982991db.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\ba60eee57ad6114d734689d7982991db.jpg', '43847', 'image/jpeg', 9, 1570239611, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (360, '4ae7dc1c31d4e8514602fd8736789462.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\4ae7dc1c31d4e8514602fd8736789462.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\4ae7dc1c31d4e8514602fd8736789462.jpg', '64879', 'image/jpeg', 9, 1570239611, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (361, 'a40ed6f6bdb492cf34b898b626e89188.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\a40ed6f6bdb492cf34b898b626e89188.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\a40ed6f6bdb492cf34b898b626e89188.jpg', '58788', 'image/jpeg', 9, 1570239611, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (362, 'b22ecbbd644c7f5774dc1cb7a6412c55.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\b22ecbbd644c7f5774dc1cb7a6412c55.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\b22ecbbd644c7f5774dc1cb7a6412c55.jpg', '31728', 'image/jpeg', 9, 1570239611, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (363, 'a2ae37e4daef07befbe8df919f3c217c.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\a2ae37e4daef07befbe8df919f3c217c.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\a2ae37e4daef07befbe8df919f3c217c.jpg', '69032', 'image/jpeg', 9, 1570239657, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (364, 'a2ae37e4daef07befbe8df919f3c217c.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\a2ae37e4daef07befbe8df919f3c217c.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\a2ae37e4daef07befbe8df919f3c217c.jpg', '69032', 'image/jpeg', 9, 1570239658, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (365, 'a5d5bf6c990ebef421b172ab230f73bd.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\a5d5bf6c990ebef421b172ab230f73bd.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\a5d5bf6c990ebef421b172ab230f73bd.jpg', '30387', 'image/jpeg', 9, 1570239658, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (366, '82cafe59ba68959e94362ffce6c8f263.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\82cafe59ba68959e94362ffce6c8f263.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\82cafe59ba68959e94362ffce6c8f263.jpg', '49112', 'image/jpeg', 9, 1570239658, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (367, '38eff756f31c42d711ddc90f44183ea3.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\38eff756f31c42d711ddc90f44183ea3.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\38eff756f31c42d711ddc90f44183ea3.jpg', '33030', 'image/jpeg', 9, 1570239658, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (368, '67d853a4f756b8d21e5b2fd4edff98e5.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\67d853a4f756b8d21e5b2fd4edff98e5.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\67d853a4f756b8d21e5b2fd4edff98e5.jpg', '52788', 'image/jpeg', 9, 1570239658, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (369, '2c2b9d9703b5496b19a62a6dacff79c1.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\2c2b9d9703b5496b19a62a6dacff79c1.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\2c2b9d9703b5496b19a62a6dacff79c1.jpg', '71170', 'image/jpeg', 9, 1570240784, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (370, '2c2b9d9703b5496b19a62a6dacff79c1.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\2c2b9d9703b5496b19a62a6dacff79c1.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\2c2b9d9703b5496b19a62a6dacff79c1.jpg', '71170', 'image/jpeg', 9, 1570240784, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (371, 'cfad1a2cdb82d602bcd3e79c550a2534.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\cfad1a2cdb82d602bcd3e79c550a2534.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\cfad1a2cdb82d602bcd3e79c550a2534.jpg', '93877', 'image/jpeg', 9, 1570240854, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (372, 'cfad1a2cdb82d602bcd3e79c550a2534.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\cfad1a2cdb82d602bcd3e79c550a2534.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\cfad1a2cdb82d602bcd3e79c550a2534.jpg', '93877', 'image/jpeg', 9, 1570240855, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (373, '84b08301e589cbe83411ece88757aeaa.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\84b08301e589cbe83411ece88757aeaa.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\84b08301e589cbe83411ece88757aeaa.jpg', '108590', 'image/jpeg', 9, 1570240855, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (374, 'd3e44711d453286259aec2bacaecf107.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\d3e44711d453286259aec2bacaecf107.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\d3e44711d453286259aec2bacaecf107.jpg', '67577', 'image/jpeg', 9, 1570240855, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (375, 'a9fb1196cbcdc68fc6d80cb171d9ec6c.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\a9fb1196cbcdc68fc6d80cb171d9ec6c.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\a9fb1196cbcdc68fc6d80cb171d9ec6c.jpg', '83474', 'image/jpeg', 9, 1570240855, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (376, 'd2febcef9fbd999589aec8ecf6481860.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\d2febcef9fbd999589aec8ecf6481860.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\d2febcef9fbd999589aec8ecf6481860.jpg', '87060', 'image/jpeg', 9, 1570240855, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (377, '876d45301b38ba03a0ecb973cdeb9c8e.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\876d45301b38ba03a0ecb973cdeb9c8e.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\876d45301b38ba03a0ecb973cdeb9c8e.jpg', '69337', 'image/jpeg', 9, 1570240881, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (378, '876d45301b38ba03a0ecb973cdeb9c8e.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\876d45301b38ba03a0ecb973cdeb9c8e.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\876d45301b38ba03a0ecb973cdeb9c8e.jpg', '69337', 'image/jpeg', 9, 1570240881, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (379, '81610def900553bb33836ad2fef63563.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\81610def900553bb33836ad2fef63563.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\81610def900553bb33836ad2fef63563.jpg', '56178', 'image/jpeg', 9, 1570240881, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (380, 'c8102fb59812fb157a67d720ea7dc52c.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\c8102fb59812fb157a67d720ea7dc52c.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\c8102fb59812fb157a67d720ea7dc52c.jpg', '77017', 'image/jpeg', 9, 1570240881, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (381, 'd10a37a5dcbb05ec1c18c3b37ba7a3c9.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\d10a37a5dcbb05ec1c18c3b37ba7a3c9.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\d10a37a5dcbb05ec1c18c3b37ba7a3c9.jpg', '63378', 'image/jpeg', 9, 1570240882, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (382, '7e4c1401da61e90905e9987e57014274.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\7e4c1401da61e90905e9987e57014274.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\05\\\\7e4c1401da61e90905e9987e57014274.jpg', '71708', 'image/jpeg', 9, 1570240882, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (383, '5409c8f62e74b3a809bc61772eb62881.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\5409c8f62e74b3a809bc61772eb62881.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\5409c8f62e74b3a809bc61772eb62881.jpg', '59415', 'image/jpeg', 9, 1570456761, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (384, '5409c8f62e74b3a809bc61772eb62881.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\5409c8f62e74b3a809bc61772eb62881.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\5409c8f62e74b3a809bc61772eb62881.jpg', '59415', 'image/jpeg', 9, 1570456761, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (385, '1404ffd13367de0b01d8d112cef2a3f3.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\1404ffd13367de0b01d8d112cef2a3f3.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\1404ffd13367de0b01d8d112cef2a3f3.jpg', '40298', 'image/jpeg', 9, 1570456761, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (386, '3b1a64c644aaad228ac39d9d0ed444f7.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\3b1a64c644aaad228ac39d9d0ed444f7.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\3b1a64c644aaad228ac39d9d0ed444f7.jpg', '30932', 'image/jpeg', 9, 1570456761, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (387, 'cb6dc012404524aaa47a47766c59f2e0.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\cb6dc012404524aaa47a47766c59f2e0.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\cb6dc012404524aaa47a47766c59f2e0.jpg', '66055', 'image/jpeg', 9, 1570456805, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (388, 'cb6dc012404524aaa47a47766c59f2e0.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\cb6dc012404524aaa47a47766c59f2e0.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\cb6dc012404524aaa47a47766c59f2e0.jpg', '66055', 'image/jpeg', 9, 1570456805, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (389, '0e5d897f56384df3cb8b94d4aee94bfc.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\0e5d897f56384df3cb8b94d4aee94bfc.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\0e5d897f56384df3cb8b94d4aee94bfc.jpg', '17691', 'image/jpeg', 9, 1570456805, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (390, 'fe4bfe9f98c015001c1bbf74ee26c41a.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\fe4bfe9f98c015001c1bbf74ee26c41a.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\fe4bfe9f98c015001c1bbf74ee26c41a.jpg', '17203', 'image/jpeg', 9, 1570456805, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (391, 'd6dacfbabf8695a2c7d2f821f2e3e87a.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\d6dacfbabf8695a2c7d2f821f2e3e87a.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\d6dacfbabf8695a2c7d2f821f2e3e87a.jpg', '26880', 'image/jpeg', 9, 1570456881, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (392, 'd6dacfbabf8695a2c7d2f821f2e3e87a.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\d6dacfbabf8695a2c7d2f821f2e3e87a.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\07\\\\d6dacfbabf8695a2c7d2f821f2e3e87a.jpg', '26880', 'image/jpeg', 9, 1570456882, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (393, '03a681fe37eb94240a63f1424dc74ae2.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\08\\\\03a681fe37eb94240a63f1424dc74ae2.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\08\\\\03a681fe37eb94240a63f1424dc74ae2.jpg', '27608', 'image/jpeg', 9, 1570544396, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (394, '03a681fe37eb94240a63f1424dc74ae2.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\08\\\\03a681fe37eb94240a63f1424dc74ae2.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\08\\\\03a681fe37eb94240a63f1424dc74ae2.jpg', '27608', 'image/jpeg', 9, 1570544396, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (395, '8f8892b30fd0321ce68479c9657ffe3b.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\08\\\\8f8892b30fd0321ce68479c9657ffe3b.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\08\\\\8f8892b30fd0321ce68479c9657ffe3b.jpg', '18946', 'image/jpeg', 9, 1570544396, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (396, '81640c14a036f7d13b3595ce4f039ead.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\08\\\\81640c14a036f7d13b3595ce4f039ead.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\08\\\\81640c14a036f7d13b3595ce4f039ead.jpg', '50106', 'image/jpeg', 9, 1570544396, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (397, '5e9b34c96015573589729ab978342fb6.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\08\\\\5e9b34c96015573589729ab978342fb6.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\08\\\\5e9b34c96015573589729ab978342fb6.jpg', '29179', 'image/jpeg', 9, 1570544397, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (398, '948c07374bed8b23ba394a4fa94c23bc.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\09\\\\948c07374bed8b23ba394a4fa94c23bc.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\09\\\\948c07374bed8b23ba394a4fa94c23bc.jpg', '63570', 'image/jpeg', 9, 1570591213, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (399, '948c07374bed8b23ba394a4fa94c23bc.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\09\\\\948c07374bed8b23ba394a4fa94c23bc.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\09\\\\948c07374bed8b23ba394a4fa94c23bc.jpg', '63570', 'image/jpeg', 9, 1570591213, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (400, '74bc0ccf930357503d42d9b25a78cc4b.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\09\\\\74bc0ccf930357503d42d9b25a78cc4b.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\09\\\\74bc0ccf930357503d42d9b25a78cc4b.jpg', '39179', 'image/jpeg', 9, 1570591214, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (401, '7fdb6c114b141579ae3e34468b31287a.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\09\\\\7fdb6c114b141579ae3e34468b31287a.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\09\\\\7fdb6c114b141579ae3e34468b31287a.jpg', '36022', 'image/jpeg', 9, 1570591214, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (402, '292cc7a4b831a9ca96fe6bcb1eb0febf.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\09\\\\292cc7a4b831a9ca96fe6bcb1eb0febf.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\09\\\\292cc7a4b831a9ca96fe6bcb1eb0febf.jpg', '37056', 'image/jpeg', 9, 1570591214, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (403, 'c8beaef631e3407501915c8892ecde08.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\09\\\\c8beaef631e3407501915c8892ecde08.jpg', 'http://www.bs.com/\\public/uploads\\attach\\2019\\10\\09\\\\c8beaef631e3407501915c8892ecde08.jpg', '299659', 'image/jpeg', 9, 1570591214, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (404, '5db8f133abcf1.png', 'http://www.bs.com//public/uploads/attach/2019/10/30/5db8f133abcf1.png', '\\public/uploads\\attach\\2019\\10\\30\\s_5db8f133abcf1.png', '6731', 'image/png', 9, 1572401459, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (405, '5db8f133e5731.png', 'http://www.bs.com//public/uploads/attach/2019/10/30/5db8f133e5731.png', '\\public/uploads\\attach\\2019\\10\\30\\s_5db8f133e5731.png', '32946', 'image/png', 9, 1572401459, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (406, '5db8f1342800d.png', 'http://www.bs.com//public/uploads/attach/2019/10/30/5db8f1342800d.png', '\\public/uploads\\attach\\2019\\10\\30\\s_5db8f1342800d.png', '37872', 'image/png', 9, 1572401460, 1, 1);
INSERT INTO `eb_system_attachment` VALUES (407, '5db8f134775d9.png', 'http://www.bs.com//public/uploads/attach/2019/10/30/5db8f134775d9.png', '\\public/uploads\\attach\\2019\\10\\30\\s_5db8f134775d9.png', '25627', 'image/png', 9, 1572401460, 1, 1);

-- ----------------------------
-- Table structure for eb_system_attachment_category
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_attachment_category`;
CREATE TABLE `eb_system_attachment_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT 0 COMMENT '父级ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `enname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类目录',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_attachment_category
-- ----------------------------
INSERT INTO `eb_system_attachment_category` VALUES (1, 0, '产品图', '');
INSERT INTO `eb_system_attachment_category` VALUES (2, 0, '分类图片', '');
INSERT INTO `eb_system_attachment_category` VALUES (3, 0, '广告图', '');
INSERT INTO `eb_system_attachment_category` VALUES (4, 0, '个人中心', '');
INSERT INTO `eb_system_attachment_category` VALUES (5, 0, '订单详情', '');
INSERT INTO `eb_system_attachment_category` VALUES (6, 0, '会员等级', '');
INSERT INTO `eb_system_attachment_category` VALUES (7, 0, '系统分类', '');
INSERT INTO `eb_system_attachment_category` VALUES (8, 0, '分享海报', '');
INSERT INTO `eb_system_attachment_category` VALUES (9, 0, '远程下载', '');

-- ----------------------------
-- Table structure for eb_system_config
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_config`;
CREATE TABLE `eb_system_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名称',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型(文本框,单选按钮...)',
  `config_tab_id` int(10) UNSIGNED NOT NULL COMMENT '配置分类id',
  `parameter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则 单选框和多选框',
  `upload_type` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '上传文件格式1单图2多图3文件',
  `required` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则',
  `width` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '多行文本框的宽度',
  `high` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '多行文框的高度',
  `value` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认值',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置名称',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置简介',
  `sort` int(10) UNSIGNED NOT NULL COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_config
-- ----------------------------
INSERT INTO `eb_system_config` VALUES (1, 'site_name', 'text', 1, '', 0, 'required:true', 100, 0, '\"CRMEB\\u5ba2\\u6e90\"', '网站名称', '网站名称', 0, 1);
INSERT INTO `eb_system_config` VALUES (2, 'site_url', 'text', 1, '', 0, 'required:true,url:true', 100, 0, '\"http:\\/\\/www.bs.com\\/\"', '网站地址', '网站地址', 0, 1);
INSERT INTO `eb_system_config` VALUES (3, 'site_logo', 'upload', 1, '', 1, '', 0, 0, '\"\"', '后台LOGO', '左上角logo,建议尺寸[170*50]', 0, 1);
INSERT INTO `eb_system_config` VALUES (4, 'site_phone', 'text', 1, '', 0, '', 100, 0, '\"\"', '联系电话', '联系电话', 0, 1);
INSERT INTO `eb_system_config` VALUES (5, 'seo_title', 'text', 1, '', 0, 'required:true', 100, 0, '\"crmeb\\u7535\\u5546\\u7cfb\\u7edf\"', 'SEO标题', 'SEO标题', 0, 1);
INSERT INTO `eb_system_config` VALUES (6, 'site_email', 'text', 1, '', 0, 'email:true', 100, 0, '\"admin@xazbkj.com\"', '联系邮箱', '联系邮箱', 0, 1);
INSERT INTO `eb_system_config` VALUES (7, 'site_qq', 'text', 1, '', 0, 'qq:true', 100, 0, '\"98718401\"', '联系QQ', '联系QQ', 0, 1);
INSERT INTO `eb_system_config` VALUES (8, 'site_close', 'radio', 1, '0=>开启\n1=>PC端关闭\n2=>WAP端关闭(含微信)\n3=>全部关闭', 0, '', 0, 0, '\"0\"', '网站关闭', '网站后台、商家中心不受影响。关闭网站也可访问', 0, 1);
INSERT INTO `eb_system_config` VALUES (9, 'close_system', 'radio', 1, '0=>开启\n1=>关闭', 0, '', 0, 0, '\"0\"', '关闭后台', '关闭后台', 0, 2);
INSERT INTO `eb_system_config` VALUES (10, 'wechat_name', 'text', 2, '', 0, 'required:true', 100, 0, '\"CRMEB\"', '公众号名称', '公众号的名称', 0, 1);
INSERT INTO `eb_system_config` VALUES (11, 'wechat_id', 'text', 2, '', 0, 'required:true', 100, 0, '\"CRMEB\"', '微信号', '微信号', 0, 1);
INSERT INTO `eb_system_config` VALUES (12, 'wechat_sourceid', 'text', 2, '', 0, 'required:true', 100, 0, '\"CRMEB\"', '公众号原始id', '公众号原始id', 0, 1);
INSERT INTO `eb_system_config` VALUES (13, 'wechat_appid', 'text', 2, '', 0, 'required:true', 100, 0, '\"CRMEB\"', 'AppID', 'AppID', 0, 1);
INSERT INTO `eb_system_config` VALUES (14, 'wechat_appsecret', 'text', 2, '', 0, 'required:true', 100, 0, '\"CRMEB\"', 'AppSecret', 'AppSecret', 0, 1);
INSERT INTO `eb_system_config` VALUES (15, 'wechat_token', 'text', 2, '', 0, 'required:true', 100, 0, '\"CRMEB\"', '微信验证TOKEN', '微信验证TOKEN', 0, 1);
INSERT INTO `eb_system_config` VALUES (16, 'wechat_encode', 'radio', 2, '0=>明文模式\n1=>兼容模式\n2=>安全模式', 0, '', 0, 0, '\"0\"', '消息加解密方式', '如需使用安全模式请在管理中心修改，仅限服务号和认证订阅号', 0, 1);
INSERT INTO `eb_system_config` VALUES (17, 'wechat_encodingaeskey', 'text', 2, '', 0, 'required:true', 100, 0, '\"CRMEB\"', 'EncodingAESKey', '公众号消息加解密Key,在使用安全模式情况下要填写该值，请先在管理中心修改，然后填写该值，仅限服务号和认证订阅号', 0, 1);
INSERT INTO `eb_system_config` VALUES (18, 'wechat_share_img', 'upload', 3, '', 1, '', 0, 0, '\"\"', '微信分享图片', '若填写此图片地址，则分享网页出去时会分享此图片。可有效防止分享图片变形', 0, 1);
INSERT INTO `eb_system_config` VALUES (19, 'wechat_qrcode', 'upload', 2, '', 1, '', 0, 0, '\"\"', '公众号二维码', '您的公众号二维码', 0, 1);
INSERT INTO `eb_system_config` VALUES (20, 'wechat_type', 'radio', 2, '0=>服务号\n1=>订阅号', 0, '', 0, 0, '\"0\"', '公众号类型', '公众号的类型', 0, 1);
INSERT INTO `eb_system_config` VALUES (21, 'wechat_share_title', 'text', 3, '', 0, 'required:true', 100, 0, '\"CRMEB\"', '微信分享标题', '微信分享标题', 0, 1);
INSERT INTO `eb_system_config` VALUES (22, 'wechat_share_synopsis', 'textarea', 3, '', 0, '', 100, 5, '\"CRMEB\"', '微信分享简介', '微信分享简介', 0, 1);
INSERT INTO `eb_system_config` VALUES (23, 'pay_weixin_appid', 'text', 4, '', 0, '', 100, 0, '\"CRMEB\"', 'Appid', '微信公众号身份的唯一标识。审核通过后，在微信发送的邮件中查看。', 0, 1);
INSERT INTO `eb_system_config` VALUES (24, 'pay_weixin_appsecret', 'text', 4, '', 0, '', 100, 0, '\"CRMEB\"', 'Appsecret', 'JSAPI接口中获取openid，审核后在公众平台开启开发模式后可查看。', 0, 1);
INSERT INTO `eb_system_config` VALUES (25, 'pay_weixin_mchid', 'text', 4, '', 0, '', 100, 0, '\"CRMEB\"', 'Mchid', '受理商ID，身份标识', 0, 1);
INSERT INTO `eb_system_config` VALUES (26, 'pay_weixin_client_cert', 'upload', 4, '', 3, '', 0, 0, '\"\"', '微信支付证书', '微信支付证书，在微信商家平台中可以下载！文件名一般为apiclient_cert.pem', 0, 1);
INSERT INTO `eb_system_config` VALUES (27, 'pay_weixin_client_key', 'upload', 4, '', 3, '', 0, 0, '\"\"', '微信支付证书密钥', '微信支付证书密钥，在微信商家平台中可以下载！文件名一般为apiclient_key.pem', 0, 1);
INSERT INTO `eb_system_config` VALUES (28, 'pay_weixin_key', 'text', 4, '', 0, '', 100, 0, '\"CRMEB\"', 'Key', '商户支付密钥Key。审核通过后，在微信发送的邮件中查看。', 0, 1);
INSERT INTO `eb_system_config` VALUES (29, 'pay_weixin_open', 'radio', 4, '1=>开启\n0=>关闭', 0, '', 0, 0, '\"1\"', '开启', '是否启用微信支付', 0, 1);
INSERT INTO `eb_system_config` VALUES (31, 'store_postage', 'text', 10, '', 0, 'number:true,min:0', 100, 0, '\"0\"', '邮费基础价', '商品邮费基础价格,最终金额为(基础价 + 商品1邮费 + 商品2邮费)', 0, 1);
INSERT INTO `eb_system_config` VALUES (32, 'store_free_postage', 'text', 5, '', 0, 'number:true,min:-1', 100, 0, '\"20\"', '满额包邮', '商城商品满多少金额即可包邮', 0, 1);
INSERT INTO `eb_system_config` VALUES (33, 'offline_postage', 'radio', 10, '0=>不包邮\n1=>包邮', 0, '', 0, 0, '\"1\"', '线下支付是否包邮', '用户选择线下支付时是否包邮', 0, 1);
INSERT INTO `eb_system_config` VALUES (34, 'integral_ratio', 'text', 11, '', 0, 'number:true', 100, 0, '\"0.01\"', '积分抵用比例', '积分抵用比例(1积分抵多少金额)', 0, 1);
INSERT INTO `eb_system_config` VALUES (35, 'site_service_phone', 'text', 1, '', 0, '', 100, 0, '\"\"', '客服电话', '客服联系电话', 0, 1);
INSERT INTO `eb_system_config` VALUES (44, 'store_user_min_recharge', 'text', 5, '', 0, 'required:true,number:true,min:0', 100, 0, '\"0.01\"', '用户最低充值金额', '用户单次最低充值金额', 0, 0);
INSERT INTO `eb_system_config` VALUES (45, 'site_store_admin_uids', 'text', 5, '', 0, '', 100, 0, '\"4\"', '管理员用户ID', '管理员用户ID,用于接收商城订单提醒，到微信用户中查找编号，多个英文‘,’隔开', 0, 1);
INSERT INTO `eb_system_config` VALUES (46, 'system_express_app_code', 'text', 10, '', 0, '', 100, 0, '\"e435be4a9bea44fa8a4862f8d0204da6\"', '快递查询密钥', '阿里云快递查询接口密钥购买地址：https://market.aliyun.com/products/56928004/cmapi021863.html', 0, 1);
INSERT INTO `eb_system_config` VALUES (47, 'main_business', 'text', 2, '', 0, 'required:true', 100, 0, '\" IT\\u79d1\\u6280 \\u4e92\\u8054\\u7f51|\\u7535\\u5b50\\u5546\\u52a1\"', '微信模板消息_主营行业', '微信公众号模板消息中选择开通的主营行业', 0, 0);
INSERT INTO `eb_system_config` VALUES (48, 'vice_business', 'text', 2, '', 0, 'required:true', 100, 0, '\"IT\\u79d1\\u6280 IT\\u8f6f\\u4ef6\\u4e0e\\u670d\\u52a1 \"', '微信模板消息_副营行业', '微信公众号模板消息中选择开通的副营行业', 0, 0);
INSERT INTO `eb_system_config` VALUES (49, 'store_brokerage_ratio', 'text', 9, '', 0, 'required:true,min:0,max:100,number:true', 100, 0, '\"80\"', '一级返佣比例', '订单交易成功后给上级返佣的比例0 - 100,例:5 = 反订单金额的5%', 5, 1);
INSERT INTO `eb_system_config` VALUES (50, 'wechat_first_sub_give_coupon', 'text', 12, '', 0, 'requred:true,digits:true,min:0', 100, 0, '\"\"', '首次关注赠送优惠券ID', '首次关注赠送优惠券ID,0为不赠送', 0, 1);
INSERT INTO `eb_system_config` VALUES (51, 'store_give_con_min_price', 'text', 12, '', 0, 'requred:true,digits:true,min:0', 100, 0, '\"0.01\"', '消费满多少赠送优惠券', '消费满多少赠送优惠券,0为不赠送', 0, 1);
INSERT INTO `eb_system_config` VALUES (52, 'store_order_give_coupon', 'text', 12, '', 0, 'requred:true,digits:true,min:0', 100, 0, '\"\"', '消费赠送优惠劵ID', '消费赠送优惠劵ID,0为不赠送', 0, 1);
INSERT INTO `eb_system_config` VALUES (53, 'user_extract_min_price', 'text', 9, '', 0, 'required:true,number:true,min:0', 100, 0, '\"1\"', '提现最低金额', '用户提现最低金额', 0, 1);
INSERT INTO `eb_system_config` VALUES (54, 'sx_sign_min_int', 'text', 11, '', 0, 'required:true,number:true,min:0', 100, 0, '\"1\"', '签到奖励最低积分', '签到奖励最低积分', 0, 1);
INSERT INTO `eb_system_config` VALUES (55, 'sx_sign_max_int', 'text', 11, '', 0, 'required:true,number:true,min:0', 100, 0, '\"5\"', '签到奖励最高积分', '签到奖励最高积分', 0, 1);
INSERT INTO `eb_system_config` VALUES (56, 'store_home_pink', 'upload', 5, '', 1, '', 0, 0, '\"\\/public\\/uploads\\/config\\/image\\/5c3dd2ffb2616.jpeg\"', '首页拼团广告图', '首页拼团广告图', 0, 1);
INSERT INTO `eb_system_config` VALUES (57, 'about_us', 'upload', 1, '', 1, '', 0, 0, '\"\\/public\\/uploads\\/config\\/image\\/5c3d964265e9f.png\"', '关于我们', '系统的标识', 0, 1);
INSERT INTO `eb_system_config` VALUES (58, 'replenishment_num', 'text', 5, '', 0, 'required:true,number:true,min:0', 100, 0, '\"20\"', '待补货数量', '产品待补货数量低于多少时，提示补货', 0, 1);
INSERT INTO `eb_system_config` VALUES (59, 'routine_appId', 'text', 7, '', 0, '', 100, 0, '\"\"', 'appId', '小程序appID', 0, 1);
INSERT INTO `eb_system_config` VALUES (60, 'routine_appsecret', 'text', 7, '', 0, '', 100, 0, '\"\"', 'AppSecret', '小程序AppSecret', 0, 1);
INSERT INTO `eb_system_config` VALUES (61, 'api', 'text', 2, '', 0, '', 100, 0, '\"\\/wap\\/Wechat\\/serve\"', '接口地址', '微信接口例如：http://www.abc.com/wap/wechat/serve', 0, 1);
INSERT INTO `eb_system_config` VALUES (62, 'paydir', 'textarea', 4, '', 0, '', 100, 5, '\"\\/wap\\/my\\/\\r\\n\\/wap\\/my\\/order\\/uni\\/\\r\\n\\/wap\\/store\\/confirm_order\\/cartId\\/\\r\\n\\/wap\\/store\\/combination_order\\/\"', '配置目录', '支付目录配置系统不调用提示作用', 0, 1);
INSERT INTO `eb_system_config` VALUES (73, 'routine_logo', 'upload', 7, '', 1, '', 0, 0, '\"\\/public\\/uploads\\/config\\/image\\/5c9cd841a76fe.png\"', '小程序logo', '小程序logo', 0, 1);
INSERT INTO `eb_system_config` VALUES (74, 'routine_name', 'text', 7, '', 0, '', 100, 0, '\"CRMEB\"', '小程序名称', '小程序名称', 0, 1);
INSERT INTO `eb_system_config` VALUES (76, 'routine_style', 'text', 7, '', 0, '', 100, 0, '\"\"', '小程序风格', '小程序颜色', 0, 1);
INSERT INTO `eb_system_config` VALUES (77, 'store_stock', 'text', 5, '', 0, '', 100, 0, '\"2\"', '警戒库存', '警戒库存提醒值', 0, 1);
INSERT INTO `eb_system_config` VALUES (85, 'stor_reason', 'textarea', 5, '', 0, '', 100, 8, '\"\\u6536\\u8d27\\u5730\\u5740\\u586b\\u9519\\u4e86\\r\\n\\u4e0e\\u63cf\\u8ff0\\u4e0d\\u7b26\\r\\n\\u4fe1\\u606f\\u586b\\u9519\\u4e86\\uff0c\\u91cd\\u65b0\\u62cd\\r\\n\\u6536\\u5230\\u5546\\u54c1\\u635f\\u574f\\u4e86\\r\\n\\u672a\\u6309\\u9884\\u5b9a\\u65f6\\u95f4\\u53d1\\u8d27\\r\\n\\u5176\\u5b83\\u539f\\u56e0\"', '退货理由', '配置退货理由，一行一个理由', 0, 1);
INSERT INTO `eb_system_config` VALUES (87, 'store_brokerage_two', 'text', 9, '', 0, 'required:true,min:0,max:100,number:true', 100, 0, '\"60\"', '二级返佣比例', '订单交易成功后给上级返佣的比例0 - 100,例:5 = 反订单金额的5%', 4, 1);
INSERT INTO `eb_system_config` VALUES (88, 'store_brokerage_statu', 'radio', 9, '1=>指定分销\n2=>人人分销', 0, '', 0, 0, '\"2\"', '分销模式', '人人分销默认每个人都可以分销，制定人分销后台制定人开启分销', 10, 1);
INSERT INTO `eb_system_config` VALUES (89, 'pay_routine_appid', 'text', 14, '', 0, 'required:true', 100, 0, '\"0\"', 'Appid', '小程序Appid', 0, 1);
INSERT INTO `eb_system_config` VALUES (90, 'pay_routine_appsecret', 'text', 14, '', 0, 'required:true', 100, 0, '\"0\"', 'Appsecret', '小程序Appsecret', 0, 1);
INSERT INTO `eb_system_config` VALUES (91, 'pay_routine_mchid', 'text', 14, '', 0, 'required:true', 100, 0, '\"0\"', 'Mchid', '商户号', 0, 1);
INSERT INTO `eb_system_config` VALUES (92, 'pay_routine_key', 'text', 14, '', 0, 'required:true', 100, 0, '\"0\"', 'Key', '商户key', 0, 1);
INSERT INTO `eb_system_config` VALUES (93, 'pay_routine_client_cert', 'upload', 14, '', 3, '', 0, 0, '\"\"', '小程序支付证书', '小程序支付证书', 0, 1);
INSERT INTO `eb_system_config` VALUES (94, 'pay_routine_client_key', 'upload', 14, '', 3, '', 0, 0, '\"\"', '小程序支付证书密钥', '小程序支付证书密钥', 0, 1);
INSERT INTO `eb_system_config` VALUES (98, 'wechat_avatar', 'upload', 2, '', 1, '', 0, 0, '\"\"', '公众号logo', '公众号logo', 0, 1);
INSERT INTO `eb_system_config` VALUES (99, 'user_extract_bank', 'textarea', 9, '', 0, '', 100, 5, '\"\\u4e2d\\u56fd\\u519c\\u884c\\r\\n\\u4e2d\\u56fd\\u5efa\\u8bbe\\u94f6\\u884c\\r\\n\\u5de5\\u5546\\u94f6\\u884c\"', '提现银行卡', '提现银行卡，每个银行换行', 0, 1);
INSERT INTO `eb_system_config` VALUES (100, 'fast_info', 'text', 16, NULL, NULL, '', 100, NULL, '\"\\u4e0a\\u767e\\u79cd\\u5546\\u54c1\\u5206\\u7c7b\\u4efb\\u60a8\\u9009\\u62e9\"', '快速选择简介', '小程序首页配置快速选择简介', 0, 1);
INSERT INTO `eb_system_config` VALUES (101, 'bast_info', 'text', 16, NULL, NULL, '', 100, NULL, '\"\\u8001\\u674e\\u8bda\\u610f\\u63a8\\u8350\\u54c1\\u8d28\\u5546\\u54c1\"', '精品推荐简介', '小程序首页配置精品推荐简介', 0, 1);
INSERT INTO `eb_system_config` VALUES (102, 'first_info', 'text', 16, NULL, NULL, '', 100, NULL, '\"\\u591a\\u4e2a\\u4f18\\u8d28\\u5546\\u54c1\\u6700\\u65b0\\u4e0a\\u67b6\"', '首发新品简介', '小程序首页配置首发新品简介', 0, 1);
INSERT INTO `eb_system_config` VALUES (103, 'sales_info', 'text', 16, NULL, NULL, '', 100, NULL, '\"\\u5e93\\u5b58\\u5546\\u54c1\\u4f18\\u60e0\\u4fc3\\u9500\\u6d3b\\u52a8\"', '促销单品简介', '小程序首页配置促销单品简介', 0, 1);
INSERT INTO `eb_system_config` VALUES (104, 'fast_number', 'text', 16, NULL, NULL, 'required:true,digits:true,min:1', 100, NULL, '\"3\"', '快速选择分类个数', '小程序首页配置快速选择分类个数', 0, 1);
INSERT INTO `eb_system_config` VALUES (105, 'bast_number', 'text', 16, NULL, NULL, 'required:true,digits:true,min:1', 100, NULL, '\"9\"', '精品推荐个数', '小程序首页配置精品推荐个数', 0, 1);
INSERT INTO `eb_system_config` VALUES (106, 'first_number', 'text', 16, NULL, NULL, 'required:true,digits:true,min:1', 100, NULL, '\"9\"', '首发新品个数', '小程序首页配置首发新品个数', 0, 1);
INSERT INTO `eb_system_config` VALUES (107, 'routine_index_logo', 'upload', 7, NULL, 1, NULL, NULL, NULL, '\"\"', '小程序主页logo图标', '小程序主页logo图标', 0, 1);
INSERT INTO `eb_system_config` VALUES (108, 'upload_type', 'radio', 17, '1=>本地存储\n2=>七牛云存储\n3=>阿里云OSS\n4=>腾讯COS', NULL, NULL, NULL, NULL, '\"1\"', '上传类型', '文件上传的类型', 0, 1);
INSERT INTO `eb_system_config` VALUES (109, 'uploadUrl', 'text', 17, NULL, NULL, 'url:true', 100, NULL, '\"\"', '空间域名 Domain', '空间域名 Domain', 0, 1);
INSERT INTO `eb_system_config` VALUES (110, 'accessKey', 'text', 17, NULL, NULL, '', 100, NULL, '\"\"', 'accessKey', 'accessKey', 0, 1);
INSERT INTO `eb_system_config` VALUES (111, 'secretKey', 'text', 17, NULL, NULL, '', 100, NULL, '\"\"', 'secretKey', 'secretKey', 0, 1);
INSERT INTO `eb_system_config` VALUES (112, 'storage_name', 'text', 17, NULL, NULL, '', 100, NULL, '\"\"', '存储空间名称', '存储空间名称', 0, 1);
INSERT INTO `eb_system_config` VALUES (113, 'order_cancel_time', 'text', 5, NULL, NULL, '', 100, NULL, '\"24\"', '普通商品未支付取消订单时间', '普通商品未支付取消订单时间，单位（小时）', 0, 1);
INSERT INTO `eb_system_config` VALUES (114, 'order_activity_time', 'text', 5, NULL, NULL, '', 100, NULL, '\"2\"', '活动商品未支付取消订单时间', '活动商品未支付取消订单时间，单位（小时）', 0, 1);
INSERT INTO `eb_system_config` VALUES (115, 'order_bargain_time', 'text', 5, NULL, NULL, NULL, 100, NULL, '\"0\"', '砍价未支付取消订单时间', '砍价未支付默认取消订单时间，单位（小时），如果为0将使用默认活动取消时间，优先使用单独活动配置', 0, 1);
INSERT INTO `eb_system_config` VALUES (116, 'order_seckill_time', 'text', 5, NULL, NULL, NULL, 100, NULL, '\"0\"', '秒杀未支付订单取消时间', '秒杀未支付订单取消时间，单位（小时），如果为0将使用默认活动取消时间，优先使用单独活动配置', 0, 1);
INSERT INTO `eb_system_config` VALUES (117, 'order_pink_time', 'text', 5, NULL, NULL, NULL, 100, NULL, '\"0\"', '拼团未支付取消订单时间', '拼团未支付取消订单时间,单位（小时），如果为0将使用默认活动取消时间，优先使用单独活动配置', 0, 1);
INSERT INTO `eb_system_config` VALUES (118, 'storage_region', 'text', 17, NULL, NULL, '', 100, NULL, '\"\"', '所属地域', '所属地域(腾讯COS时填写)', 0, 1);
INSERT INTO `eb_system_config` VALUES (119, 'vip_open', 'radio', 5, '0=>关闭\n1=>开启', NULL, NULL, NULL, NULL, '\"0\"', '会员功能是否开启', '会员功能是否开启', 0, 1);
INSERT INTO `eb_system_config` VALUES (120, 'new_order_audio_link', 'upload', 5, NULL, 3, NULL, NULL, NULL, '', '新订单语音提示', '新订单语音提示', 0, 1);
INSERT INTO `eb_system_config` VALUES (121, 'seckill_header_banner', 'upload', 5, NULL, 1, NULL, NULL, NULL, '\"\\/public\\/uploads\\/config\\/image\\/5cf5d6e27c48e.jpg\"', '秒杀头部banner', '秒杀头部banner', 0, 1);
INSERT INTO `eb_system_config` VALUES (122, 'recharge_switch', 'radio', 5, '1=>开启\n0=>关闭', NULL, NULL, NULL, NULL, '\"1\"', '充值开关', '充值开关', 0, 1);

-- ----------------------------
-- Table structure for eb_system_config_tab
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_config_tab`;
CREATE TABLE `eb_system_config_tab`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置分类id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置分类名称',
  `eng_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置分类英文名称',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '配置分类状态',
  `info` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配置分类是否显示',
  `icon` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `type` int(2) NULL DEFAULT 0 COMMENT '配置类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_config_tab
-- ----------------------------
INSERT INTO `eb_system_config_tab` VALUES (1, '基础配置', 'basics', 1, 0, 'cog', 0);
INSERT INTO `eb_system_config_tab` VALUES (2, '公众号配置', 'wechat', 1, 0, 'weixin', 1);
INSERT INTO `eb_system_config_tab` VALUES (3, '公众号分享配置', 'wechat_share', 1, 0, 'whatsapp', 1);
INSERT INTO `eb_system_config_tab` VALUES (4, '公众号支付配置', 'pay', 1, 0, 'jpy', 1);
INSERT INTO `eb_system_config_tab` VALUES (5, '商城配置', 'store', 1, 0, 'shopping-cart', 0);
INSERT INTO `eb_system_config_tab` VALUES (7, '小程序配置', 'routine', 1, 0, 'weixin', 2);
INSERT INTO `eb_system_config_tab` VALUES (9, '分销配置', 'fenxiao', 1, 0, 'sitemap', 3);
INSERT INTO `eb_system_config_tab` VALUES (10, '物流配置', 'express', 1, 0, 'motorcycle', 0);
INSERT INTO `eb_system_config_tab` VALUES (11, '积分配置', 'point', 1, 0, 'powerpoint-o', 3);
INSERT INTO `eb_system_config_tab` VALUES (12, '优惠券配置', 'coupon', 1, 0, 'heartbeat', 3);
INSERT INTO `eb_system_config_tab` VALUES (14, '小程序支付配置', 'routine_pay', 1, 0, 'jpy', 2);
INSERT INTO `eb_system_config_tab` VALUES (16, '小程序首页配置', 'routine_index_page', 1, 0, 'home', 2);
INSERT INTO `eb_system_config_tab` VALUES (17, '文件上传配置', 'upload_set', 1, 0, '', 0);

-- ----------------------------
-- Table structure for eb_system_file
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_file`;
CREATE TABLE `eb_system_file`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文件对比ID',
  `cthash` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件内容',
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文价名称',
  `atime` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上次访问时间',
  `mtime` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上次修改时间',
  `ctime` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上次改变时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件对比表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_system_group
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_group`;
CREATE TABLE `eb_system_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合数据ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据组名称',
  `info` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据提示',
  `config_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据字段',
  `fields` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数据组字段以及类型（json数据）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `config_name`(`config_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组合数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_group
-- ----------------------------
INSERT INTO `eb_system_group` VALUES (32, '个人中心菜单', '【公众号】', 'my_index_menu', '[{\"name\":\"\\u540d\\u79f0\",\"title\":\"name\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u56fe\\u6807\",\"title\":\"icon\",\"type\":\"upload\",\"param\":\"\"},{\"name\":\"\\u94fe\\u63a5\",\"title\":\"url\",\"type\":\"select\",\"param\":\"\\/wap\\/my\\/integral.html=>\\u6211\\u7684\\u79ef\\u5206\\n\\/wap\\/my\\/coupon.html=>\\u4f18\\u60e0\\u5238\\n\\/wap\\/my\\/collect.html=>\\u6536\\u85cf\\u5217\\u8868\\n\\/wap\\/my\\/address.html=>\\u5730\\u5740\\u7ba1\\u7406\\n\\/wap\\/my\\/balance.html=>\\u6211\\u7684\\u4f59\\u989d\\n\\/wap\\/service\\/service_new.html=>\\u804a\\u5929\\u8bb0\\u5f55\\n\\/wap\\/index\\/about.html=>\\u8054\\u7cfb\\u6211\\u4eec\\n\\/wap\\/my\\/user_pro.html=>\\u63a8\\u5e7f\\u4f63\\u91d1\"},{\"name\":\"\\u6d4b\\u8bd5\",\"title\":\"test\",\"type\":\"uploads\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES (34, '商城首页banner', '【公众号】', 'store_home_banner', '[{\"name\":\"\\u6807\\u9898\",\"title\":\"title\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u94fe\\u63a5\",\"title\":\"url\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u56fe\\u7247\",\"title\":\"pic\",\"type\":\"upload\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES (35, '首页分类按钮图标', '【公众号】', 'store_home_menus', '[{\"name\":\"\\u540d\\u79f0\",\"title\":\"name\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u94fe\\u63a5\",\"title\":\"url\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u56fe\\u6807\",\"title\":\"icon\",\"type\":\"upload\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES (36, '首页滚动新闻', '【公众号】', 'store_home_roll_news', '[{\"name\":\"\\u6eda\\u52a8\\u6587\\u5b57\",\"title\":\"info\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u70b9\\u51fb\\u94fe\\u63a5\",\"title\":\"url\",\"type\":\"input\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES (37, '拼团、秒杀、砍价顶部banner图', '小程序', 'routine_lovely', '[{\"name\":\"\\u56fe\\u7247\",\"title\":\"img\",\"type\":\"upload\",\"param\":\"\"},{\"name\":\"\\u63cf\\u8ff0\",\"title\":\"comment\",\"type\":\"input\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES (38, '砍价列表页左上小图标', '小程序', 'bargain_banner', '[{\"name\":\"banner\",\"title\":\"banner\",\"type\":\"upload\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES (47, '首页分类图标', '小程序', 'routine_home_menus', '[{\"name\":\"\\u5206\\u7c7b\\u540d\\u79f0\",\"title\":\"name\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u5206\\u7c7b\\u56fe\\u6807\",\"title\":\"pic\",\"type\":\"upload\",\"param\":\"\"},{\"name\":\"\\u8df3\\u8f6c\\u8def\\u5f84\",\"title\":\"url\",\"type\":\"select\",\"param\":\"\\/pages\\/index\\/index=>\\u5546\\u57ce\\u9996\\u9875\\n\\/pages\\/user_spread_user\\/index=>\\u4e2a\\u4eba\\u63a8\\u5e7f\\n\\/pages\\/user_sgin\\/index=>\\u6211\\u8981\\u7b7e\\u5230\\n\\/pages\\/user_get_coupon\\/index=>\\u4f18\\u60e0\\u5238\\n\\/pages\\/user\\/user=>\\u4e2a\\u4eba\\u4e2d\\u5fc3\\n\\/pages\\/activity\\/goods_seckill\\/index=>\\u79d2\\u6740\\u5217\\u8868\\n\\/pages\\/activity\\/goods_combination\\/index=>\\u62fc\\u56e2\\u5217\\u8868\\u9875\\n\\/pages\\/activity\\/goods_bargain\\/index=>\\u780d\\u4ef7\\u5217\\u8868\\n\\/pages\\/goods_cate\\/goods_cate=>\\u5206\\u7c7b\\u9875\\u9762\\n\\/pages\\/user_address_list\\/index=>\\u5730\\u5740\\u5217\\u8868\\n\\/pages\\/user_cash\\/index=>\\u63d0\\u73b0\\u9875\\u9762\\n\\/pages\\/promoter-list\\/index=>\\u63a8\\u5e7f\\u7edf\\u8ba1\\n\\/pages\\/user_money\\/index=>\\u8d26\\u6237\\u91d1\\u989d\\n\\/pages\\/user_goods_collection\\/index=>\\u6211\\u7684\\u6536\\u85cf\\n\\/pages\\/promotion-card\\/promotion-card=>\\u63a8\\u5e7f\\u4e8c\\u7ef4\\u7801\\u9875\\u9762\\n\\/pages\\/order_addcart\\/order_addcart=>\\u8d2d\\u7269\\u8f66\\u9875\\u9762\\n\\/pages\\/order_list\\/index=>\\u8ba2\\u5355\\u5217\\u8868\\u9875\\u9762\\n\\/pages\\/news_list\\/index=>\\u6587\\u7ae0\\u5217\\u8868\\u9875\"},{\"name\":\"\\u5e95\\u90e8\\u83dc\\u5355\",\"title\":\"show\",\"type\":\"radio\",\"param\":\"1=>\\u662f\\n2=>\\u5426\"}]');
INSERT INTO `eb_system_group` VALUES (48, '首页banner滚动图', '小程序', 'routine_home_banner', '[{\"name\":\"\\u6807\\u9898\",\"title\":\"name\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u94fe\\u63a5\",\"title\":\"url\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u56fe\\u7247\",\"title\":\"pic\",\"type\":\"upload\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES (49, '秒杀时间段', '小程序', 'routine_seckill_time', '[{\"name\":\"\\u5f00\\u542f\\u65f6\\u95f4(\\u6574\\u6570\\u5c0f\\u65f6)\",\"title\":\"time\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u6301\\u7eed\\u65f6\\u95f4(\\u6574\\u6570\\u5c0f\\u65f6)\",\"title\":\"continued\",\"type\":\"input\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES (50, '首页滚动新闻', '小程序', 'routine_home_roll_news', '[{\"name\":\"\\u6eda\\u52a8\\u6587\\u5b57\",\"title\":\"info\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u8df3\\u8f6c\\u8def\\u5f84\",\"title\":\"url\",\"type\":\"select\",\"param\":\"\\/pages\\/index\\/index=>\\u5546\\u57ce\\u9996\\u9875\\n\\/pages\\/user_spread_user\\/index=>\\u4e2a\\u4eba\\u63a8\\u5e7f\\n\\/pages\\/user_sgin\\/index=>\\u6211\\u8981\\u7b7e\\u5230\\n\\/pages\\/user_get_coupon\\/index=>\\u4f18\\u60e0\\u5238\\n\\/pages\\/user\\/user=>\\u4e2a\\u4eba\\u4e2d\\u5fc3\\n\\/pages\\/activity\\/goods_seckill\\/index=>\\u79d2\\u6740\\u5217\\u8868\\n\\/pages\\/activity\\/goods_combination\\/index=>\\u62fc\\u56e2\\u5217\\u8868\\u9875\\n\\/pages\\/activity\\/goods_bargain\\/index=>\\u780d\\u4ef7\\u5217\\u8868\\n\\/pages\\/goods_cate\\/goods_cate=>\\u5206\\u7c7b\\u9875\\u9762\\n\\/pages\\/user_address_list\\/index=>\\u5730\\u5740\\u5217\\u8868\\n\\/pages\\/user_cash\\/index=>\\u63d0\\u73b0\\u9875\\u9762\\n\\/pages\\/promoter-list\\/index=>\\u63a8\\u5e7f\\u7edf\\u8ba1\\n\\/pages\\/user_money\\/index=>\\u8d26\\u6237\\u91d1\\u989d\\n\\/pages\\/user_goods_collection\\/index=>\\u6211\\u7684\\u6536\\u85cf\\n\\/pages\\/promotion-card\\/promotion-card=>\\u63a8\\u5e7f\\u4e8c\\u7ef4\\u7801\\u9875\\u9762\\n\\/pages\\/order_addcart\\/order_addcart=>\\u8d2d\\u7269\\u8f66\\u9875\\u9762\\n\\/pages\\/order_list\\/index=>\\u8ba2\\u5355\\u5217\\u8868\\u9875\\u9762\\n\\/pages\\/news_list\\/index=>\\u6587\\u7ae0\\u5217\\u8868\\u9875\"},{\"name\":\"\\u5e95\\u90e8\\u83dc\\u5355\",\"title\":\"show\",\"type\":\"radio\",\"param\":\"1=>\\u662f\\n2=>\\u5426\"}]');
INSERT INTO `eb_system_group` VALUES (51, '首页活动区域图片', '小程序', 'routine_home_activity', '[{\"name\":\"\\u56fe\\u7247\",\"title\":\"pic\",\"type\":\"upload\",\"param\":\"\"},{\"name\":\"\\u6807\\u9898\",\"title\":\"title\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u7b80\\u4ecb\",\"title\":\"info\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u94fe\\u63a5\",\"title\":\"link\",\"type\":\"select\",\"param\":\"\\/pages\\/activity\\/goods_seckill\\/index=>\\u79d2\\u6740\\u5217\\u8868\\n\\/pages\\/activity\\/goods_bargain\\/index=>\\u780d\\u4ef7\\u5217\\u8868\\n\\/pages\\/activity\\/goods_combination\\/index=>\\u62fc\\u56e2\\u5217\\u8868\"}]');
INSERT INTO `eb_system_group` VALUES (52, '首页精品推荐benner图', '小程序', 'routine_home_bast_banner', '[{\"name\":\"\\u56fe\\u7247\",\"title\":\"img\",\"type\":\"upload\",\"param\":\"\"},{\"name\":\"\\u63cf\\u8ff0\",\"title\":\"comment\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u94fe\\u63a5\",\"title\":\"link\",\"type\":\"input\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES (53, '订单详情状态图', '订单详情状态图', 'order_details_images', '[{\"name\":\"\\u8ba2\\u5355\\u72b6\\u6001\",\"title\":\"order_status\",\"type\":\"select\",\"param\":\"0=>\\u672a\\u652f\\u4ed8\\n1=>\\u5f85\\u53d1\\u8d27\\n2=>\\u5f85\\u6536\\u8d27\\n3=>\\u5f85\\u8bc4\\u4ef7\\n4=>\\u5df2\\u5b8c\\u6210\"},{\"name\":\"\\u56fe\\u6807\",\"title\":\"pic\",\"type\":\"upload\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES (54, '个人中心菜单', '个人中心菜单', 'routine_my_menus', '[{\"name\":\"\\u83dc\\u5355\\u540d\",\"title\":\"name\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u56fe\\u6807\",\"title\":\"pic\",\"type\":\"upload\",\"param\":\"\"},{\"name\":\"\\u8df3\\u8f6c\\u8def\\u5f84\",\"title\":\"url\",\"type\":\"select\",\"param\":\"\\/pages\\/user_address_list\\/index=>\\u5730\\u5740\\u7ba1\\u7406\\n\\/pages\\/user_vip\\/index=>\\u4f1a\\u5458\\u4e2d\\u5fc3\\n\\/pages\\/activity\\/user_goods_bargain_list\\/index=>\\u780d\\u4ef7\\u8bb0\\u5f55\\n\\/pages\\/user_spread_user\\/index=>\\u63a8\\u5e7f\\u4e2d\\u5fc3\\n\\/pages\\/user_money\\/index=>\\u6211\\u7684\\u4f59\\u989d\\n\\/pages\\/user_goods_collection\\/index=>\\u6211\\u7684\\u6536\\u85cf\\n\\/pages\\/user_coupon\\/index=>\\u4f18\\u60e0\\u5238\"}]');
INSERT INTO `eb_system_group` VALUES (55, '签到天数配置', '签到天数配置', 'sign_day_num', '[{\"name\":\"\\u7b2c\\u51e0\\u5929\",\"title\":\"day\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u83b7\\u53d6\\u79ef\\u5206\",\"title\":\"sign_num\",\"type\":\"input\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES (56, '热门搜索', '小程序', 'routine_hot_search', '[{\"name\":\"\\u6807\\u7b7e\",\"title\":\"title\",\"type\":\"input\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES (57, '热门榜单推荐图片', '小程序', 'routine_home_hot_banner', '[{\"name\":\"\\u56fe\\u7247\",\"title\":\"img\",\"type\":\"upload\",\"param\":\"\"},{\"name\":\"\\u63cf\\u8ff0\",\"title\":\"comment\",\"type\":\"input\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES (58, '首发新品推荐图片', '小程序', 'routine_home_new_banner', '[{\"name\":\"\\u56fe\\u7247\",\"title\":\"img\",\"type\":\"upload\",\"param\":\"\"},{\"name\":\"\\u63cf\\u8ff0\",\"title\":\"comment\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u94fe\\u63a5\",\"title\":\"link\",\"type\":\"input\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES (59, '促销单品推荐图片', '小程序', 'routine_home_benefit_banner', '[{\"name\":\"\\u56fe\\u7247\",\"title\":\"img\",\"type\":\"upload\",\"param\":\"\"},{\"name\":\"\\u63cf\\u8ff0\",\"title\":\"comment\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u94fe\\u63a5\",\"title\":\"link\",\"type\":\"input\",\"param\":\"\"}]');
INSERT INTO `eb_system_group` VALUES (60, '分享海报', '小程序', 'routine_spread_banner', '[{\"name\":\"\\u540d\\u79f0\",\"title\":\"title\",\"type\":\"input\",\"param\":\"\"},{\"name\":\"\\u80cc\\u666f\\u56fe\",\"title\":\"pic\",\"type\":\"upload\",\"param\":\"\"}]');

-- ----------------------------
-- Table structure for eb_system_group_data
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_group_data`;
CREATE TABLE `eb_system_group_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合数据详情ID',
  `gid` int(11) NOT NULL COMMENT '对应的数据组id',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据组对应的数据值（json数据）',
  `add_time` int(10) NOT NULL COMMENT '添加数据时间',
  `sort` int(11) NOT NULL COMMENT '数据排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态（1：开启；2：关闭；）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 172 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组合数据详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_group_data
-- ----------------------------
INSERT INTO `eb_system_group_data` VALUES (52, 32, '{\"name\":{\"type\":\"input\",\"value\":\"\\u6211\\u7684\\u79ef\\u5206\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc7ee98a2e.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/wap\\/my\\/integral.html\"}}', 1513846430, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (53, 32, '{\"name\":{\"type\":\"input\",\"value\":\"\\u4f18\\u60e0\\u5238\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc802814e5.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/wap\\/my\\/coupon.html\"}}', 1513846448, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (56, 32, '{\"name\":{\"type\":\"input\",\"value\":\"\\u5df2\\u6536\\u85cf\\u5546\\u54c1\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc91cee6ed.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/wap\\/my\\/collect.html\"}}', 1513846605, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (57, 32, '{\"name\":{\"type\":\"input\",\"value\":\"\\u5730\\u5740\\u7ba1\\u7406\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc93937a48.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/wap\\/my\\/address.html\"}}', 1513846618, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (67, 32, '{\"name\":{\"type\":\"input\",\"value\":\"\\u804a\\u5929\\u8bb0\\u5f55\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc8a7205f0.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/wap\\/service\\/service_new.html\"}}', 1515570261, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (72, 35, '{\"name\":{\"type\":\"input\",\"value\":\"\\u780d\\u4ef7\"},\"url\":{\"type\":\"input\",\"value\":\"\\/wap\\/store\\/cut_list.html\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc72335ee5.png\"}}', 1515985426, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (73, 35, '{\"name\":{\"type\":\"input\",\"value\":\"\\u9886\\u5238\"},\"url\":{\"type\":\"input\",\"value\":\"\\/wap\\/store\\/issue_coupon.html\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc7146add5.png\"}}', 1515985435, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (74, 35, '{\"name\":{\"type\":\"input\",\"value\":\"\\u62fc\\u56e2\"},\"url\":{\"type\":\"input\",\"value\":\"\\/wap\\/store\\/combination.html\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc73feecaf.png\"}}', 1515985441, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (80, 36, '{\"info\":{\"type\":\"input\",\"value\":\"CRMEB\\u7535\\u5546\\u7cfb\\u7edf V 2.6 \\u5373\\u5c06\\u4e0a\\u7ebf\\uff01\"},\"url\":{\"type\":\"input\",\"value\":\"#\"}}', 1515985907, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (81, 36, '{\"info\":{\"type\":\"input\",\"value\":\"CRMEB\\u5546\\u57ce V 2.6 \\u5c0f\\u7a0b\\u5e8f\\u516c\\u4f17\\u53f7\\u6570\\u636e\\u540c\\u6b65\\uff01\"},\"url\":{\"type\":\"input\",\"value\":\"#\"}}', 1515985918, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (84, 34, '{\"title\":{\"type\":\"input\",\"value\":\"banner1\"},\"url\":{\"type\":\"input\",\"value\":\"#\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db14908923.jpg\"}}', 1522135667, 2, 1);
INSERT INTO `eb_system_group_data` VALUES (86, 32, '{\"name\":{\"type\":\"input\",\"value\":\"\\u8054\\u7cfb\\u5ba2\\u670d\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc84ef1070.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/wap\\/index\\/about.html\"}}', 1522310836, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (87, 32, '{\"name\":{\"type\":\"input\",\"value\":\"\\u6211\\u7684\\u4f59\\u989d\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc865bb257.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/wap\\/my\\/balance.html\"}}', 1525330614, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (89, 38, '{\"banner\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc730dead2.png\"}}', 1527153599, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (91, 37, '{\"img\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/04\\/13\\/5cb18df0dfba7.jpg\"},\"comment\":{\"type\":\"input\",\"value\":\"\\u79d2\\u6740\\u5217\\u8868\\u9876\\u90e8baaner\"}}', 1528688012, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (92, 32, '{\"name\":{\"type\":\"input\",\"value\":\"\\u63a8\\u5e7f\\u4f63\\u91d1\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc95a1d134.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/wap\\/my\\/user_pro.html\"}}', 1530688244, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (99, 47, '{\"name\":{\"type\":\"input\",\"value\":\"\\u5546\\u54c1\\u5206\\u7c7b\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/29\\/5c9ddc9f34bfd.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/goods_cate\\/goods_cate\"},\"show\":{\"type\":\"radio\",\"value\":\"1\"}}', 1533721963, 8, 1);
INSERT INTO `eb_system_group_data` VALUES (100, 47, '{\"name\":{\"type\":\"input\",\"value\":\"\\u9886\\u4f18\\u60e0\\u5238\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/29\\/5c9ddccecb7f3.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/user_get_coupon\\/index\"},\"show\":{\"type\":\"radio\",\"value\":\"2\"}}', 1533722009, 7, 1);
INSERT INTO `eb_system_group_data` VALUES (101, 47, '{\"name\":{\"type\":\"input\",\"value\":\"\\u884c\\u4e1a\\u8d44\\u8baf\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/29\\/5c9ddcec57a80.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/news_list\\/index\"},\"show\":{\"type\":\"radio\",\"value\":\"2\"}}', 1533722037, 6, 1);
INSERT INTO `eb_system_group_data` VALUES (102, 47, '{\"name\":{\"type\":\"input\",\"value\":\"\\u6211\\u8981\\u7b7e\\u5230\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/29\\/5c9ddd570b8b3.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/user_sgin\\/index\"},\"show\":{\"type\":\"radio\",\"value\":\"2\"}}', 1533722063, 5, 1);
INSERT INTO `eb_system_group_data` VALUES (104, 48, '{\"name\":{\"type\":\"input\",\"value\":\"banenr2\\u8fd9\\u662f\\u9996\\u9875\\u8f6e\\u64ad\\u56fe\"},\"url\":{\"type\":\"input\",\"value\":\"\\/pages\\/pink-list\\/index?id=2\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\30\\\\s_5db8f134775d9.png\"}}', 1533722286, 10, 1);
INSERT INTO `eb_system_group_data` VALUES (105, 47, '{\"name\":{\"type\":\"input\",\"value\":\"\\u6211\\u7684\\u6536\\u85cf\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/29\\/5c9dddce0eac9.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/user_goods_collection\\/index\"},\"show\":{\"type\":\"radio\",\"value\":\"2\"}}', 1533797064, 5, 1);
INSERT INTO `eb_system_group_data` VALUES (106, 32, '{\"name\":{\"type\":\"input\",\"value\":\"\\u6211\\u7684\\u780d\\u4ef7\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc97a19134.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/wap\\/my\\/user_cut.html\"}}', 1533889033, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (108, 35, '{\"name\":{\"type\":\"input\",\"value\":\"\\u79d2\\u6740\"},\"url\":{\"type\":\"input\",\"value\":\"\\/wap\\/store\\/seckill_index.html\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc730dead2.png\"}}', 1541054595, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (109, 35, '{\"name\":{\"type\":\"input\",\"value\":\"\\u7b7e\\u5230\"},\"url\":{\"type\":\"input\",\"value\":\"\\/wap\\/my\\/sign_in.html\"},\"icon\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc74c1bd3f.png\"}}', 1541054641, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (113, 49, '{\"time\":{\"type\":\"input\",\"value\":\"5\"},\"continued\":{\"type\":\"input\",\"value\":\"2\"}}', 1552443280, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (114, 49, '{\"time\":{\"type\":\"input\",\"value\":\"7\"},\"continued\":{\"type\":\"input\",\"value\":\"3\"}}', 1552443293, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (115, 49, '{\"time\":{\"type\":\"input\",\"value\":\"10\"},\"continued\":{\"type\":\"input\",\"value\":\"2\"}}', 1552443304, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (116, 49, '{\"time\":{\"type\":\"input\",\"value\":\"12\"},\"continued\":{\"type\":\"input\",\"value\":\"2\"}}', 1552481140, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (117, 49, '{\"time\":{\"type\":\"input\",\"value\":\"14\"},\"continued\":{\"type\":\"input\",\"value\":\"2\"}}', 1552481146, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (118, 49, '{\"time\":{\"type\":\"input\",\"value\":\"16\"},\"continued\":{\"type\":\"input\",\"value\":\"2\"}}', 1552481151, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (119, 49, '{\"time\":{\"type\":\"input\",\"value\":\"18\"},\"continued\":{\"type\":\"input\",\"value\":\"2\"}}', 1552481157, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (120, 49, '{\"time\":{\"type\":\"input\",\"value\":\"20\"},\"continued\":{\"type\":\"input\",\"value\":\"9\"}}', 1552481163, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (121, 50, '{\"info\":{\"type\":\"input\",\"value\":\"CRMEB\\u7535\\u5546\\u7cfb\\u7edf V 2.6 \\u5373\\u5c06\\u4e0a\\u7ebf\\uff01\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/index\\/index\"},\"show\":{\"type\":\"radio\",\"value\":\"\\u662f\"}}', 1552611989, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (122, 50, '{\"info\":{\"type\":\"input\",\"value\":\"CRMEB\\u7535\\u5546\\u7cfb\\u7edf V 2.6 \\u5373\\u5c06\\u4e0a\\u7ebf\\uff01\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/miao-list\\/miao-list\"},\"show\":{\"type\":\"radio\",\"value\":\"\\u5426\"}}', 1552612003, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (123, 50, '{\"info\":{\"type\":\"input\",\"value\":\"CRMEB\\u7535\\u5546\\u7cfb\\u7edf V 2.6 \\u5373\\u5c06\\u4e0a\\u7ebf\\uff01\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/index\\/index\"},\"show\":{\"type\":\"radio\",\"value\":\"\\u662f\"}}', 1552613047, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (124, 51, '{\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/28\\/5c9ccf7e9f4d0.jpg\"},\"title\":{\"type\":\"input\",\"value\":\"\\u4e00\\u8d77\\u6765\\u62fc\\u56e2\"},\"info\":{\"type\":\"input\",\"value\":\"\\u4f18\\u60e0\\u591a\\u591a\"},\"link\":{\"type\":\"select\",\"value\":\"\\/pages\\/activity\\/goods_combination\\/index\"}}', 1552620002, 3, 1);
INSERT INTO `eb_system_group_data` VALUES (125, 51, '{\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/28\\/5c9ccf7e97660.jpg\"},\"title\":{\"type\":\"input\",\"value\":\"\\u79d2\\u6740\\u4e13\\u533a\"},\"info\":{\"type\":\"input\",\"value\":\"\\u65b0\\u80fd\\u6e90\\u6c7d\\u8f66\\u706b\\u70ed\\u9500\\u552e\"},\"link\":{\"type\":\"select\",\"value\":\"\\/pages\\/activity\\/goods_seckill\\/index\"}}', 1552620022, 2, 1);
INSERT INTO `eb_system_group_data` VALUES (126, 51, '{\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/28\\/5c9ccfc86a6c1.jpg\"},\"title\":{\"type\":\"input\",\"value\":\"\\u780d\\u4ef7\\u6d3b\\u52a8\"},\"info\":{\"type\":\"input\",\"value\":\"\\u547c\\u670b\\u5524\\u53cb\\u6765\\u780d\\u4ef7~~~\"},\"link\":{\"type\":\"select\",\"value\":\"\\/pages\\/activity\\/goods_bargain\\/index\"}}', 1552620041, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (127, 52, '{\"img\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/04\\/13\\/5cb18e247a1a9.jpg\"},\"comment\":{\"type\":\"input\",\"value\":\"\\u7cbe\\u54c1\\u63a8\\u8350750*282\"},\"link\":{\"type\":\"input\",\"value\":\"\\/pages\\/first-new-product\\/index\"}}', 1552633893, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (128, 52, '{\"img\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/29\\/5c9e015bdc6f5.jpg\"},\"comment\":{\"type\":\"input\",\"value\":\"\\u7cbe\\u54c1\\u63a8\\u8350750*282\"},\"link\":{\"type\":\"input\",\"value\":\"\\/pages\\/first-new-product\\/index\"}}', 1552633912, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (135, 54, '{\"name\":{\"type\":\"input\",\"value\":\"\\u4f1a\\u5458\\u4e2d\\u5fc3\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/28\\/5c9ccc9934a7c.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/user_vip\\/index\"}}', 1553779918, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (136, 54, '{\"name\":{\"type\":\"input\",\"value\":\"\\u780d\\u4ef7\\u8bb0\\u5f55\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/28\\/5c9ccc9918091.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/activity\\/user_goods_bargain_list\\/index\"}}', 1553779935, 1, 2);
INSERT INTO `eb_system_group_data` VALUES (137, 54, '{\"name\":{\"type\":\"input\",\"value\":\"\\u6211\\u7684\\u63a8\\u5e7f\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/28\\/5c9ccc9943575.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/user_spread_user\\/index\"}}', 1553779950, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (138, 54, '{\"name\":{\"type\":\"input\",\"value\":\"\\u6211\\u7684\\u4f59\\u989d\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/28\\/5c9ccc992db31.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/user_money\\/index\"}}', 1553779973, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (139, 54, '{\"name\":{\"type\":\"input\",\"value\":\"\\u5730\\u5740\\u4fe1\\u606f\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/28\\/5c9ccc99101a8.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/user_address_list\\/index\"}}', 1553779988, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (140, 54, '{\"name\":{\"type\":\"input\",\"value\":\"\\u6211\\u7684\\u6536\\u85cf\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/28\\/5c9ccc99269d1.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/user_goods_collection\\/index\"}}', 1553780003, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (141, 54, '{\"name\":{\"type\":\"input\",\"value\":\"\\u4f18\\u60e0\\u5238\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/28\\/5c9ccc991f394.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/user_coupon\\/index\"}}', 1553780017, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (142, 53, '{\"order_status\":{\"type\":\"select\",\"value\":\"0\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/28\\/5c9ccca151e99.gif\"}}', 1553780202, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (143, 53, '{\"order_status\":{\"type\":\"select\",\"value\":\"1\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/28\\/5c9ccca12638a.gif\"}}', 1553780210, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (144, 53, '{\"order_status\":{\"type\":\"select\",\"value\":\"2\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/28\\/5c9ccca1c78cd.gif\"}}', 1553780221, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (145, 53, '{\"order_status\":{\"type\":\"select\",\"value\":\"3\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/28\\/5c9ccca178a67.gif\"}}', 1553780230, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (146, 53, '{\"order_status\":{\"type\":\"select\",\"value\":\"4\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/28\\/5c9ccca1a01b6.gif\"}}', 1553780237, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (147, 55, '{\"day\":{\"type\":\"input\",\"value\":\"\\u7b2c\\u4e00\\u5929\"},\"sign_num\":{\"type\":\"input\",\"value\":\"10\"}}', 1553780276, 100, 1);
INSERT INTO `eb_system_group_data` VALUES (148, 55, '{\"day\":{\"type\":\"input\",\"value\":\"\\u7b2c\\u4e8c\\u5929\"},\"sign_num\":{\"type\":\"input\",\"value\":\"20\"}}', 1553780292, 99, 1);
INSERT INTO `eb_system_group_data` VALUES (149, 55, '{\"day\":{\"type\":\"input\",\"value\":\"\\u7b2c\\u4e09\\u5929\"},\"sign_num\":{\"type\":\"input\",\"value\":\"30\"}}', 1553780303, 90, 1);
INSERT INTO `eb_system_group_data` VALUES (150, 55, '{\"day\":{\"type\":\"input\",\"value\":\"\\u7b2c\\u56db\\u5929\"},\"sign_num\":{\"type\":\"input\",\"value\":\"40\"}}', 1553780334, 60, 1);
INSERT INTO `eb_system_group_data` VALUES (151, 55, '{\"day\":{\"type\":\"input\",\"value\":\"\\u7b2c\\u4e94\\u5929\"},\"sign_num\":{\"type\":\"input\",\"value\":\"50\"}}', 1553780351, 50, 1);
INSERT INTO `eb_system_group_data` VALUES (152, 55, '{\"day\":{\"type\":\"input\",\"value\":\"\\u7b2c\\u516d\\u5929\"},\"sign_num\":{\"type\":\"input\",\"value\":\"60\"}}', 1553780364, 40, 1);
INSERT INTO `eb_system_group_data` VALUES (153, 55, '{\"day\":{\"type\":\"input\",\"value\":\"\\u5956\\u52b1\"},\"sign_num\":{\"type\":\"input\",\"value\":\"110\"}}', 1553780389, 10, 1);
INSERT INTO `eb_system_group_data` VALUES (154, 57, '{\"img\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/28\\/5c9cd03224d59.jpg\"},\"comment\":{\"type\":\"input\",\"value\":\"1\"}}', 1553780856, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (155, 58, '{\"img\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/28\\/5c9cd03224d59.jpg\"},\"comment\":{\"type\":\"input\",\"value\":\"1\"},\"link\":{\"type\":\"input\",\"value\":\"#\"}}', 1553780869, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (156, 59, '{\"img\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/28\\/5c9cd03224d59.jpg\"},\"comment\":{\"type\":\"input\",\"value\":\"1\"},\"link\":{\"type\":\"input\",\"value\":\"#\"}}', 1553780883, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (157, 56, '{\"title\":{\"type\":\"input\",\"value\":\"\\u5438\\u5c18\\u5668\"}}', 1553782153, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (158, 47, '{\"name\":{\"type\":\"input\",\"value\":\"\\u62fc\\u56e2\\u6d3b\\u52a8\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/29\\/5c9dde013f63c.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/activity\\/goods_combination\\/index\"},\"show\":{\"type\":\"radio\",\"value\":\"2\"}}', 1553849878, 3, 1);
INSERT INTO `eb_system_group_data` VALUES (159, 47, '{\"name\":{\"type\":\"input\",\"value\":\"\\u79d2\\u6740\\u6d3b\\u52a8\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/29\\/5c9dde246ad96.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/activity\\/goods_seckill\\/index\"},\"show\":{\"type\":\"radio\",\"value\":\"2\"}}', 1553849905, 2, 1);
INSERT INTO `eb_system_group_data` VALUES (160, 47, '{\"name\":{\"type\":\"input\",\"value\":\"\\u780d\\u4ef7\\u6d3b\\u52a8\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/29\\/5c9ddedbed782.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/activity\\/goods_bargain\\/index\"},\"show\":{\"type\":\"radio\",\"value\":\"2\"}}', 1553850093, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (161, 60, '{\"title\":{\"type\":\"input\",\"value\":\"\\u5206\\u4eab\\u6d77\\u62a5\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/29\\/5c9e1ef640019.jpg\"}}', 1553866489, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (162, 54, '{\"name\":{\"type\":\"input\",\"value\":\"\\u780d\\u4ef7\\u8bb0\\u5f55\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/03\\/28\\/5c9ccc9918091.png\"},\"url\":{\"type\":\"select\",\"value\":\"\\/pages\\/activity\\/user_goods_bargain_list\\/index\"}}', 1553866805, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (163, 56, '{\"title\":{\"type\":\"input\",\"value\":\"\\u52a0\\u6e7f\\u5668\"}}', 1553869694, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (164, 56, '{\"title\":{\"type\":\"input\",\"value\":\"\\u9a6c\\u6876\"}}', 1553869701, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (165, 56, '{\"title\":{\"type\":\"input\",\"value\":\"\\u70ed\\u6c34\\u5668\"}}', 1553869710, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (167, 60, '{\"title\":{\"type\":\"input\",\"value\":\"1\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/04\\/12\\/5cb071e5860fa.jpg\"}}', 1555063900, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (168, 60, '{\"title\":{\"type\":\"input\",\"value\":\"2\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/04\\/12\\/5cb071e576b3d.jpg\"}}', 1555067377, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (169, 48, '{\"name\":{\"type\":\"input\",\"value\":\"banner1\"},\"url\":{\"type\":\"input\",\"value\":\"\\/pages\\/pink-list\\/index?id=1\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\30\\\\s_5db8f1342800d.png\"}}', 1570113788, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (170, 48, '{\"name\":{\"type\":\"input\",\"value\":\"banner3\"},\"url\":{\"type\":\"input\",\"value\":\"\\/pages\\/pink-list\\/index?id=3\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\30\\\\s_5db8f133e5731.png\"}}', 1570113866, 1, 1);
INSERT INTO `eb_system_group_data` VALUES (171, 48, '{\"name\":{\"type\":\"input\",\"value\":\"banner4\"},\"url\":{\"type\":\"input\",\"value\":\"\\/pages\\/pink-list\\/index?id=4\"},\"pic\":{\"type\":\"upload\",\"value\":\"http:\\/\\/www.bs.com\\/\\\\public\\/uploads\\\\attach\\\\2019\\\\10\\\\30\\\\s_5db8f133abcf1.png\"}}', 1570114050, 1, 1);

-- ----------------------------
-- Table structure for eb_system_log
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_log`;
CREATE TABLE `eb_system_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理员操作记录ID',
  `admin_id` int(10) UNSIGNED NOT NULL COMMENT '管理员id',
  `admin_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员姓名',
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接',
  `page` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '行为',
  `method` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '访问类型',
  `ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录IP',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '操作时间',
  `merchant_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1351 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员操作记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_log
-- ----------------------------
INSERT INTO `eb_system_log` VALUES (1, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568736083, 0);
INSERT INTO `eb_system_log` VALUES (2, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568736084, 0);
INSERT INTO `eb_system_log` VALUES (3, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1568736230, 0);
INSERT INTO `eb_system_log` VALUES (4, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1568736231, 0);
INSERT INTO `eb_system_log` VALUES (5, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1568736231, 0);
INSERT INTO `eb_system_log` VALUES (6, 1, 'admin', 'admin/store.storeproductreply/index/', '评论管理展示页', 'GET', '127.0.0.1', 'system', 1568736232, 0);
INSERT INTO `eb_system_log` VALUES (7, 1, 'admin', 'admin/store.storeproductreply/get_product_imaes_list/', '未知', 'GET', '127.0.0.1', 'system', 1568736233, 0);
INSERT INTO `eb_system_log` VALUES (8, 1, 'admin', 'admin/store.storeproductreply/get_product_reply_list/', '未知', 'GET', '127.0.0.1', 'system', 1568736233, 0);
INSERT INTO `eb_system_log` VALUES (9, 1, 'admin', 'admin/user.userlevel/index/', '未知', 'GET', '127.0.0.1', 'system', 1568736235, 0);
INSERT INTO `eb_system_log` VALUES (10, 1, 'admin', 'admin/user.userlevel/get_system_vip_list/', '未知', 'GET', '127.0.0.1', 'system', 1568736236, 0);
INSERT INTO `eb_system_log` VALUES (11, 1, 'admin', 'admin/user.usernotice/index/', '未知', 'GET', '127.0.0.1', 'system', 1568736236, 0);
INSERT INTO `eb_system_log` VALUES (12, 1, 'admin', 'admin/user.usernotice/index/', '未知', 'GET', '127.0.0.1', 'system', 1568736237, 0);
INSERT INTO `eb_system_log` VALUES (13, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568736252, 0);
INSERT INTO `eb_system_log` VALUES (14, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1568736252, 0);
INSERT INTO `eb_system_log` VALUES (15, 1, 'admin', 'admin/store.storeproduct/index/type/3', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568736253, 0);
INSERT INTO `eb_system_log` VALUES (16, 1, 'admin', 'admin/store.storeproduct/product_ist/type/3', '未知', 'GET', '127.0.0.1', 'system', 1568736254, 0);
INSERT INTO `eb_system_log` VALUES (17, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568769143, 0);
INSERT INTO `eb_system_log` VALUES (18, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568769143, 0);
INSERT INTO `eb_system_log` VALUES (19, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1568769148, 0);
INSERT INTO `eb_system_log` VALUES (20, 1, 'admin', 'admin/widget.images/index/fodder/image', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1568769181, 0);
INSERT INTO `eb_system_log` VALUES (21, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1568769181, 0);
INSERT INTO `eb_system_log` VALUES (22, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1568769181, 0);
INSERT INTO `eb_system_log` VALUES (23, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '127.0.0.1', 'system', 1568769197, 0);
INSERT INTO `eb_system_log` VALUES (24, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1568769197, 0);
INSERT INTO `eb_system_log` VALUES (25, 1, 'admin', 'admin/widget.images/addcate/id/0', '添加分类展示', 'GET', '127.0.0.1', 'system', 1568769200, 0);
INSERT INTO `eb_system_log` VALUES (26, 1, 'admin', 'admin/widget.images/savecate/', '添加分类', 'POST', '127.0.0.1', 'system', 1568769203, 0);
INSERT INTO `eb_system_log` VALUES (27, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '127.0.0.1', 'system', 1568769211, 0);
INSERT INTO `eb_system_log` VALUES (28, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1568769211, 0);
INSERT INTO `eb_system_log` VALUES (29, 1, 'admin', 'admin/widget.images/get_image_list/pid/2/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1568769216, 0);
INSERT INTO `eb_system_log` VALUES (30, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1568769218, 0);
INSERT INTO `eb_system_log` VALUES (31, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '127.0.0.1', 'system', 1568769226, 0);
INSERT INTO `eb_system_log` VALUES (32, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1568769226, 0);
INSERT INTO `eb_system_log` VALUES (33, 1, 'admin', 'admin/widget.images/delete/', '删除图片', 'POST', '127.0.0.1', 'system', 1568769234, 0);
INSERT INTO `eb_system_log` VALUES (34, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1568769234, 0);
INSERT INTO `eb_system_log` VALUES (35, 1, 'admin', 'admin/widget.images/delete/', '删除图片', 'POST', '127.0.0.1', 'system', 1568769237, 0);
INSERT INTO `eb_system_log` VALUES (36, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1568769237, 0);
INSERT INTO `eb_system_log` VALUES (37, 1, 'admin', 'admin/widget.images/delete/', '删除图片', 'POST', '127.0.0.1', 'system', 1568769239, 0);
INSERT INTO `eb_system_log` VALUES (38, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1568769239, 0);
INSERT INTO `eb_system_log` VALUES (39, 1, 'admin', 'admin/widget.images/addcate/id/0', '添加分类展示', 'GET', '127.0.0.1', 'system', 1568769240, 0);
INSERT INTO `eb_system_log` VALUES (40, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '127.0.0.1', 'system', 1568769248, 0);
INSERT INTO `eb_system_log` VALUES (41, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1568769248, 0);
INSERT INTO `eb_system_log` VALUES (42, 1, 'admin', 'admin/widget.images/index/fodder/image', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1568769254, 0);
INSERT INTO `eb_system_log` VALUES (43, 1, 'admin', 'admin/widget.images/index/fodder/image', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1568769254, 0);
INSERT INTO `eb_system_log` VALUES (44, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1568769254, 0);
INSERT INTO `eb_system_log` VALUES (45, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1568769254, 0);
INSERT INTO `eb_system_log` VALUES (46, 1, 'admin', 'admin/widget.images/get_image_list/pid/4/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1568769256, 0);
INSERT INTO `eb_system_log` VALUES (47, 1, 'admin', 'admin/widget.images/get_image_list/pid/2/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1568769258, 0);
INSERT INTO `eb_system_log` VALUES (48, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1568769259, 0);
INSERT INTO `eb_system_log` VALUES (49, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1568769318, 0);
INSERT INTO `eb_system_log` VALUES (50, 1, 'admin', 'admin/widget.images/index/fodder/image', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1568769320, 0);
INSERT INTO `eb_system_log` VALUES (51, 1, 'admin', 'admin/widget.images/index/fodder/image', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1568769320, 0);
INSERT INTO `eb_system_log` VALUES (52, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1568769321, 0);
INSERT INTO `eb_system_log` VALUES (53, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1568769321, 0);
INSERT INTO `eb_system_log` VALUES (54, 1, 'admin', 'admin/widget.images/get_image_list/pid/2/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1568769324, 0);
INSERT INTO `eb_system_log` VALUES (55, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1568769325, 0);
INSERT INTO `eb_system_log` VALUES (56, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '127.0.0.1', 'system', 1568769328, 0);
INSERT INTO `eb_system_log` VALUES (57, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1568769329, 0);
INSERT INTO `eb_system_log` VALUES (58, 1, 'admin', 'admin/widget.images/index/fodder/image', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1568769389, 0);
INSERT INTO `eb_system_log` VALUES (59, 1, 'admin', 'admin/widget.images/index/fodder/image', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1568769389, 0);
INSERT INTO `eb_system_log` VALUES (60, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1568769389, 0);
INSERT INTO `eb_system_log` VALUES (61, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1568769390, 0);
INSERT INTO `eb_system_log` VALUES (62, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1568769391, 0);
INSERT INTO `eb_system_log` VALUES (63, 1, 'admin', 'admin/widget.images/index/fodder/slider_image', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1568769398, 0);
INSERT INTO `eb_system_log` VALUES (64, 1, 'admin', 'admin/widget.images/index/fodder/slider_image', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1568769398, 0);
INSERT INTO `eb_system_log` VALUES (65, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1568769400, 0);
INSERT INTO `eb_system_log` VALUES (66, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1568769400, 0);
INSERT INTO `eb_system_log` VALUES (67, 1, 'admin', 'admin/store.storeproduct/save/', '未知', 'POST', '127.0.0.1', 'system', 1568769407, 0);
INSERT INTO `eb_system_log` VALUES (68, 1, 'admin', 'admin/store.storeproduct/save/', '未知', 'POST', '127.0.0.1', 'system', 1568769416, 0);
INSERT INTO `eb_system_log` VALUES (69, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568769417, 0);
INSERT INTO `eb_system_log` VALUES (70, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568769417, 0);
INSERT INTO `eb_system_log` VALUES (71, 1, 'admin', 'admin/user.user/index/', '会员列表页', 'GET', '127.0.0.1', 'system', 1568773783, 0);
INSERT INTO `eb_system_log` VALUES (72, 1, 'admin', 'admin/user.user/get_user_list/', '未知', 'GET', '127.0.0.1', 'system', 1568773784, 0);
INSERT INTO `eb_system_log` VALUES (73, 1, 'admin', 'admin/user.usernotice/index/', '未知', 'GET', '127.0.0.1', 'system', 1568773784, 0);
INSERT INTO `eb_system_log` VALUES (74, 1, 'admin', 'admin/user.usernotice/index/', '未知', 'GET', '127.0.0.1', 'system', 1568773784, 0);
INSERT INTO `eb_system_log` VALUES (75, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568773789, 0);
INSERT INTO `eb_system_log` VALUES (76, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568773790, 0);
INSERT INTO `eb_system_log` VALUES (77, 1, 'admin', 'admin/store.storeproduct/delete/', '未知', 'GET', '127.0.0.1', 'system', 1568773833, 0);
INSERT INTO `eb_system_log` VALUES (78, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1568773854, 0);
INSERT INTO `eb_system_log` VALUES (79, 1, 'admin', 'admin/system.clear/index/', '刷新缓存', 'GET', '127.0.0.1', 'system', 1568774125, 0);
INSERT INTO `eb_system_log` VALUES (80, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568774128, 0);
INSERT INTO `eb_system_log` VALUES (81, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568774129, 0);
INSERT INTO `eb_system_log` VALUES (82, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1568774193, 0);
INSERT INTO `eb_system_log` VALUES (83, 1, 'admin', 'admin/store.storeproductreply/index/', '评论管理展示页', 'GET', '127.0.0.1', 'system', 1568774216, 0);
INSERT INTO `eb_system_log` VALUES (84, 1, 'admin', 'admin/store.storeproductreply/get_product_imaes_list/', '未知', 'GET', '127.0.0.1', 'system', 1568774217, 0);
INSERT INTO `eb_system_log` VALUES (85, 1, 'admin', 'admin/store.storeproductreply/get_product_reply_list/', '未知', 'GET', '127.0.0.1', 'system', 1568774217, 0);
INSERT INTO `eb_system_log` VALUES (86, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1568774356, 0);
INSERT INTO `eb_system_log` VALUES (87, 1, 'admin', 'admin/setting.systemconfig/index/type/1/tab_id/2', '公众号接口配置', 'GET', '127.0.0.1', 'system', 1568774481, 0);
INSERT INTO `eb_system_log` VALUES (88, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1568774532, 0);
INSERT INTO `eb_system_log` VALUES (89, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1568774532, 0);
INSERT INTO `eb_system_log` VALUES (90, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1568774700, 0);
INSERT INTO `eb_system_log` VALUES (91, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1568774774, 0);
INSERT INTO `eb_system_log` VALUES (92, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1568774811, 0);
INSERT INTO `eb_system_log` VALUES (93, 1, 'admin', 'admin/store.copytaobao/save_product/', '未知', 'POST', '127.0.0.1', 'system', 1568774835, 0);
INSERT INTO `eb_system_log` VALUES (94, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568774866, 0);
INSERT INTO `eb_system_log` VALUES (95, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568774867, 0);
INSERT INTO `eb_system_log` VALUES (96, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568774879, 0);
INSERT INTO `eb_system_log` VALUES (97, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568774882, 0);
INSERT INTO `eb_system_log` VALUES (98, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568774886, 0);
INSERT INTO `eb_system_log` VALUES (99, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1568774893, 0);
INSERT INTO `eb_system_log` VALUES (100, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1568774909, 0);
INSERT INTO `eb_system_log` VALUES (101, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1568774921, 0);
INSERT INTO `eb_system_log` VALUES (102, 1, 'admin', 'admin/store.copytaobao/save_product/', '未知', 'POST', '127.0.0.1', 'system', 1568774949, 0);
INSERT INTO `eb_system_log` VALUES (103, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568774970, 0);
INSERT INTO `eb_system_log` VALUES (104, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568774971, 0);
INSERT INTO `eb_system_log` VALUES (105, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568774978, 0);
INSERT INTO `eb_system_log` VALUES (106, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568774985, 0);
INSERT INTO `eb_system_log` VALUES (107, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1568774985, 0);
INSERT INTO `eb_system_log` VALUES (108, 1, 'admin', 'admin/store.storeproduct/attr/', '未知', 'GET', '127.0.0.1', 'system', 1568774992, 0);
INSERT INTO `eb_system_log` VALUES (109, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1568774996, 0);
INSERT INTO `eb_system_log` VALUES (110, 1, 'admin', 'admin/store.storeproduct/index/type/3', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568775137, 0);
INSERT INTO `eb_system_log` VALUES (111, 1, 'admin', 'admin/store.storeproduct/product_ist/type/3', '未知', 'GET', '127.0.0.1', 'system', 1568775137, 0);
INSERT INTO `eb_system_log` VALUES (112, 1, 'admin', 'admin/store.storeproduct/index/type/4', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568775138, 0);
INSERT INTO `eb_system_log` VALUES (113, 1, 'admin', 'admin/store.storeproduct/product_ist/type/4', '未知', 'GET', '127.0.0.1', 'system', 1568775139, 0);
INSERT INTO `eb_system_log` VALUES (114, 1, 'admin', 'admin/store.storeproduct/index/type/5', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568775139, 0);
INSERT INTO `eb_system_log` VALUES (115, 1, 'admin', 'admin/store.storeproduct/product_ist/type/5', '未知', 'GET', '127.0.0.1', 'system', 1568775139, 0);
INSERT INTO `eb_system_log` VALUES (116, 1, 'admin', 'admin/store.storeproduct/index/type/6', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568775140, 0);
INSERT INTO `eb_system_log` VALUES (117, 1, 'admin', 'admin/store.storeproduct/product_ist/type/6', '未知', 'GET', '127.0.0.1', 'system', 1568775140, 0);
INSERT INTO `eb_system_log` VALUES (118, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568775142, 0);
INSERT INTO `eb_system_log` VALUES (119, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568775142, 0);
INSERT INTO `eb_system_log` VALUES (120, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1568775143, 0);
INSERT INTO `eb_system_log` VALUES (121, 1, 'admin', 'admin/setting.systemadmin/admininfo/', '个人资料展示页', 'GET', '127.0.0.1', 'system', 1568776510, 0);
INSERT INTO `eb_system_log` VALUES (122, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568777004, 0);
INSERT INTO `eb_system_log` VALUES (123, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568777004, 0);
INSERT INTO `eb_system_log` VALUES (124, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568777029, 0);
INSERT INTO `eb_system_log` VALUES (125, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1568777030, 0);
INSERT INTO `eb_system_log` VALUES (126, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568777040, 0);
INSERT INTO `eb_system_log` VALUES (127, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568777040, 0);
INSERT INTO `eb_system_log` VALUES (128, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568777042, 0);
INSERT INTO `eb_system_log` VALUES (129, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1568777042, 0);
INSERT INTO `eb_system_log` VALUES (130, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568777048, 0);
INSERT INTO `eb_system_log` VALUES (131, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568777048, 0);
INSERT INTO `eb_system_log` VALUES (132, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1568777052, 0);
INSERT INTO `eb_system_log` VALUES (133, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1568777172, 0);
INSERT INTO `eb_system_log` VALUES (134, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/0/id/1', '未知', 'GET', '127.0.0.1', 'system', 1568777211, 0);
INSERT INTO `eb_system_log` VALUES (135, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/1', '未知', 'GET', '127.0.0.1', 'system', 1568777218, 0);
INSERT INTO `eb_system_log` VALUES (136, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/0/id/1', '未知', 'GET', '127.0.0.1', 'system', 1568777229, 0);
INSERT INTO `eb_system_log` VALUES (137, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/1', '未知', 'GET', '127.0.0.1', 'system', 1568777231, 0);
INSERT INTO `eb_system_log` VALUES (138, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1568777236, 0);
INSERT INTO `eb_system_log` VALUES (139, 1, 'admin', 'admin/store.storeproduct/attr/', '未知', 'GET', '127.0.0.1', 'system', 1568777292, 0);
INSERT INTO `eb_system_log` VALUES (140, 1, 'admin', 'admin/store.storeproduct/attr/', '未知', 'GET', '127.0.0.1', 'system', 1568777416, 0);
INSERT INTO `eb_system_log` VALUES (141, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/0/id/1', '未知', 'GET', '127.0.0.1', 'system', 1568777487, 0);
INSERT INTO `eb_system_log` VALUES (142, 1, 'admin', 'admin/store.storeproduct/delete/', '未知', 'GET', '127.0.0.1', 'system', 1568777817, 0);
INSERT INTO `eb_system_log` VALUES (143, 1, 'admin', 'admin/store.storeproduct/delete/', '未知', 'GET', '127.0.0.1', 'system', 1568777849, 0);
INSERT INTO `eb_system_log` VALUES (144, 1, 'admin', 'admin/store.storeproduct/index/type/6', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568777881, 0);
INSERT INTO `eb_system_log` VALUES (145, 1, 'admin', 'admin/store.storeproduct/product_ist/type/6', '未知', 'GET', '127.0.0.1', 'system', 1568777882, 0);
INSERT INTO `eb_system_log` VALUES (146, 1, 'admin', 'admin/store.storeproduct/delete/', '未知', 'GET', '127.0.0.1', 'system', 1568777886, 0);
INSERT INTO `eb_system_log` VALUES (147, 1, 'admin', 'admin/store.storeproduct/delete/', '未知', 'GET', '127.0.0.1', 'system', 1568777891, 0);
INSERT INTO `eb_system_log` VALUES (148, 1, 'admin', 'admin/store.storeproduct/delete/', '未知', 'GET', '127.0.0.1', 'system', 1568777895, 0);
INSERT INTO `eb_system_log` VALUES (149, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1568778169, 0);
INSERT INTO `eb_system_log` VALUES (150, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1568778169, 0);
INSERT INTO `eb_system_log` VALUES (151, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568778172, 0);
INSERT INTO `eb_system_log` VALUES (152, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568778173, 0);
INSERT INTO `eb_system_log` VALUES (153, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1568778445, 0);
INSERT INTO `eb_system_log` VALUES (154, 1, 'admin', 'admin/store.storeproduct/edit_content/', '未知', 'GET', '127.0.0.1', 'system', 1568785994, 0);
INSERT INTO `eb_system_log` VALUES (155, 1, 'admin', 'admin/store.storeproduct/attr/', '未知', 'GET', '127.0.0.1', 'system', 1568786009, 0);
INSERT INTO `eb_system_log` VALUES (156, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568786036, 0);
INSERT INTO `eb_system_log` VALUES (157, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1568786037, 0);
INSERT INTO `eb_system_log` VALUES (158, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/12', '未知', 'GET', '127.0.0.1', 'system', 1568786041, 0);
INSERT INTO `eb_system_log` VALUES (159, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568786045, 0);
INSERT INTO `eb_system_log` VALUES (160, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568786045, 0);
INSERT INTO `eb_system_log` VALUES (161, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568791723, 0);
INSERT INTO `eb_system_log` VALUES (162, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568791723, 0);
INSERT INTO `eb_system_log` VALUES (163, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1568792022, 0);
INSERT INTO `eb_system_log` VALUES (164, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568792327, 0);
INSERT INTO `eb_system_log` VALUES (165, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1568792328, 0);
INSERT INTO `eb_system_log` VALUES (166, 1, 'admin', 'admin/store.storeproduct/index/type/3', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568792329, 0);
INSERT INTO `eb_system_log` VALUES (167, 1, 'admin', 'admin/store.storeproduct/product_ist/type/3', '未知', 'GET', '127.0.0.1', 'system', 1568792330, 0);
INSERT INTO `eb_system_log` VALUES (168, 1, 'admin', 'admin/store.storeproduct/index/type/4', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568792331, 0);
INSERT INTO `eb_system_log` VALUES (169, 1, 'admin', 'admin/store.storeproduct/product_ist/type/4', '未知', 'GET', '127.0.0.1', 'system', 1568792331, 0);
INSERT INTO `eb_system_log` VALUES (170, 1, 'admin', 'admin/store.storeproduct/index/type/5', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568792332, 0);
INSERT INTO `eb_system_log` VALUES (171, 1, 'admin', 'admin/store.storeproduct/product_ist/type/5', '未知', 'GET', '127.0.0.1', 'system', 1568792332, 0);
INSERT INTO `eb_system_log` VALUES (172, 1, 'admin', 'admin/store.storeproduct/index/type/6', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568792333, 0);
INSERT INTO `eb_system_log` VALUES (173, 1, 'admin', 'admin/store.storeproduct/product_ist/type/6', '未知', 'GET', '127.0.0.1', 'system', 1568792334, 0);
INSERT INTO `eb_system_log` VALUES (174, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568792335, 0);
INSERT INTO `eb_system_log` VALUES (175, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1568792335, 0);
INSERT INTO `eb_system_log` VALUES (176, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568792336, 0);
INSERT INTO `eb_system_log` VALUES (177, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568792337, 0);
INSERT INTO `eb_system_log` VALUES (178, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568792358, 0);
INSERT INTO `eb_system_log` VALUES (179, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1568792359, 0);
INSERT INTO `eb_system_log` VALUES (180, 1, 'admin', 'admin/store.storeproduct/product_show/', '未知', 'POST', '127.0.0.1', 'system', 1568792363, 0);
INSERT INTO `eb_system_log` VALUES (181, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1568792364, 0);
INSERT INTO `eb_system_log` VALUES (182, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568792375, 0);
INSERT INTO `eb_system_log` VALUES (183, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568792375, 0);
INSERT INTO `eb_system_log` VALUES (184, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1568792407, 0);
INSERT INTO `eb_system_log` VALUES (185, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568792476, 0);
INSERT INTO `eb_system_log` VALUES (186, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568792476, 0);
INSERT INTO `eb_system_log` VALUES (187, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1568792477, 0);
INSERT INTO `eb_system_log` VALUES (188, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1568792546, 0);
INSERT INTO `eb_system_log` VALUES (189, 1, 'admin', 'admin/store.storeproduct/product_ist/', '未知', 'GET', '127.0.0.1', 'system', 1568792715, 0);
INSERT INTO `eb_system_log` VALUES (190, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568792759, 0);
INSERT INTO `eb_system_log` VALUES (191, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568792760, 0);
INSERT INTO `eb_system_log` VALUES (192, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1568792771, 0);
INSERT INTO `eb_system_log` VALUES (193, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568793099, 0);
INSERT INTO `eb_system_log` VALUES (194, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568793127, 0);
INSERT INTO `eb_system_log` VALUES (195, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568793230, 0);
INSERT INTO `eb_system_log` VALUES (196, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568793231, 0);
INSERT INTO `eb_system_log` VALUES (197, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568793283, 0);
INSERT INTO `eb_system_log` VALUES (198, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568793284, 0);
INSERT INTO `eb_system_log` VALUES (199, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568794997, 0);
INSERT INTO `eb_system_log` VALUES (200, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568794998, 0);
INSERT INTO `eb_system_log` VALUES (201, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568795041, 0);
INSERT INTO `eb_system_log` VALUES (202, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568795158, 0);
INSERT INTO `eb_system_log` VALUES (203, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568795175, 0);
INSERT INTO `eb_system_log` VALUES (204, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568795176, 0);
INSERT INTO `eb_system_log` VALUES (205, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1568795181, 0);
INSERT INTO `eb_system_log` VALUES (206, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1568795966, 0);
INSERT INTO `eb_system_log` VALUES (207, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568796766, 0);
INSERT INTO `eb_system_log` VALUES (208, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568796767, 0);
INSERT INTO `eb_system_log` VALUES (209, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568796772, 0);
INSERT INTO `eb_system_log` VALUES (210, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1568796783, 0);
INSERT INTO `eb_system_log` VALUES (211, 1, 'admin', 'admin/setting.systemconfig/index/', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1568796820, 0);
INSERT INTO `eb_system_log` VALUES (212, 1, 'admin', 'admin/setting.systemconfig/save_basics/', '提交保存配置列表', 'POST', '127.0.0.1', 'system', 1568796833, 0);
INSERT INTO `eb_system_log` VALUES (213, 1, 'admin', 'admin/setting.systemconfig/index/', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1568796834, 0);
INSERT INTO `eb_system_log` VALUES (214, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568796842, 0);
INSERT INTO `eb_system_log` VALUES (215, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568796843, 0);
INSERT INTO `eb_system_log` VALUES (216, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1568796864, 0);
INSERT INTO `eb_system_log` VALUES (217, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1568796913, 0);
INSERT INTO `eb_system_log` VALUES (218, 1, 'admin', 'admin/store.copytaobao/save_product/', '未知', 'POST', '127.0.0.1', 'system', 1568796960, 0);
INSERT INTO `eb_system_log` VALUES (219, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568796968, 0);
INSERT INTO `eb_system_log` VALUES (220, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568796969, 0);
INSERT INTO `eb_system_log` VALUES (221, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568796974, 0);
INSERT INTO `eb_system_log` VALUES (222, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1568796975, 0);
INSERT INTO `eb_system_log` VALUES (223, 1, 'admin', 'admin/system.express/index/', '物流公司', 'GET', '127.0.0.1', 'system', 1568797128, 0);
INSERT INTO `eb_system_log` VALUES (224, 1, 'admin', 'admin/system.express/index/', '物流公司', 'GET', '127.0.0.1', 'system', 1568797136, 0);
INSERT INTO `eb_system_log` VALUES (225, 1, 'admin', 'admin/system.express/index/', '物流公司', 'GET', '127.0.0.1', 'system', 1568797151, 0);
INSERT INTO `eb_system_log` VALUES (226, 1, 'admin', 'admin/system.express/create/', '未知', 'GET', '127.0.0.1', 'system', 1568797158, 0);
INSERT INTO `eb_system_log` VALUES (227, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568797164, 0);
INSERT INTO `eb_system_log` VALUES (228, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568797164, 0);
INSERT INTO `eb_system_log` VALUES (229, 1, 'admin', 'admin/store.storeproduct/delete/', '未知', 'GET', '127.0.0.1', 'system', 1568797170, 0);
INSERT INTO `eb_system_log` VALUES (230, 1, 'admin', 'admin/store.storeproduct/delete/', '未知', 'GET', '127.0.0.1', 'system', 1568797175, 0);
INSERT INTO `eb_system_log` VALUES (231, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568797179, 0);
INSERT INTO `eb_system_log` VALUES (232, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1568797179, 0);
INSERT INTO `eb_system_log` VALUES (233, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/14', '未知', 'GET', '127.0.0.1', 'system', 1568797184, 0);
INSERT INTO `eb_system_log` VALUES (234, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568797188, 0);
INSERT INTO `eb_system_log` VALUES (235, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568797189, 0);
INSERT INTO `eb_system_log` VALUES (236, 1, 'admin', 'admin/store.storeproduct/index/type/6', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568797196, 0);
INSERT INTO `eb_system_log` VALUES (237, 1, 'admin', 'admin/store.storeproduct/product_ist/type/6', '未知', 'GET', '127.0.0.1', 'system', 1568797196, 0);
INSERT INTO `eb_system_log` VALUES (238, 1, 'admin', 'admin/store.storeproduct/index/type/5', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568797209, 0);
INSERT INTO `eb_system_log` VALUES (239, 1, 'admin', 'admin/store.storeproduct/product_ist/type/5', '未知', 'GET', '127.0.0.1', 'system', 1568797210, 0);
INSERT INTO `eb_system_log` VALUES (240, 1, 'admin', 'admin/store.storeproduct/index/type/4', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568797210, 0);
INSERT INTO `eb_system_log` VALUES (241, 1, 'admin', 'admin/store.storeproduct/product_ist/type/4', '未知', 'GET', '127.0.0.1', 'system', 1568797211, 0);
INSERT INTO `eb_system_log` VALUES (242, 1, 'admin', 'admin/store.storeproduct/index/type/3', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568797211, 0);
INSERT INTO `eb_system_log` VALUES (243, 1, 'admin', 'admin/store.storeproduct/product_ist/type/3', '未知', 'GET', '127.0.0.1', 'system', 1568797212, 0);
INSERT INTO `eb_system_log` VALUES (244, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1568797214, 0);
INSERT INTO `eb_system_log` VALUES (245, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1568797215, 0);
INSERT INTO `eb_system_log` VALUES (246, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1568797215, 0);
INSERT INTO `eb_system_log` VALUES (247, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1568797244, 0);
INSERT INTO `eb_system_log` VALUES (248, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1568797244, 0);
INSERT INTO `eb_system_log` VALUES (249, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1568797244, 0);
INSERT INTO `eb_system_log` VALUES (250, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1568797251, 0);
INSERT INTO `eb_system_log` VALUES (251, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1568797251, 0);
INSERT INTO `eb_system_log` VALUES (252, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1568797252, 0);
INSERT INTO `eb_system_log` VALUES (253, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1568797252, 0);
INSERT INTO `eb_system_log` VALUES (254, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1568797262, 0);
INSERT INTO `eb_system_log` VALUES (255, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1568797262, 0);
INSERT INTO `eb_system_log` VALUES (256, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1568797262, 0);
INSERT INTO `eb_system_log` VALUES (257, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1568797262, 0);
INSERT INTO `eb_system_log` VALUES (258, 1, 'admin', 'admin/setting.systemconfig/rmpublicresource/', '未知', 'GET', '127.0.0.1', 'system', 1568797272, 0);
INSERT INTO `eb_system_log` VALUES (259, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1568797676, 0);
INSERT INTO `eb_system_log` VALUES (260, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1568797676, 0);
INSERT INTO `eb_system_log` VALUES (261, 1, 'admin', 'admin/system.systemupgradeclient/index/', '在线更新', 'GET', '127.0.0.1', 'system', 1568797699, 0);
INSERT INTO `eb_system_log` VALUES (262, 1, 'admin', 'admin/system.clear/index/', '刷新缓存', 'GET', '127.0.0.1', 'system', 1568797710, 0);
INSERT INTO `eb_system_log` VALUES (263, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1568797711, 0);
INSERT INTO `eb_system_log` VALUES (264, 1, 'admin', 'admin/system.systemupgradeclient/get_new_version_conte/', '未知', 'POST', '127.0.0.1', 'system', 1568797711, 0);
INSERT INTO `eb_system_log` VALUES (265, 1, 'admin', 'admin/system.systemupgradeclient/get_list/', '未知', 'POST', '127.0.0.1', 'system', 1568797712, 0);
INSERT INTO `eb_system_log` VALUES (266, 1, 'admin', 'admin/article.article/index/', '文章管理', 'GET', '127.0.0.1', 'system', 1568797715, 0);
INSERT INTO `eb_system_log` VALUES (267, 1, 'admin', 'admin/article.articlecategory/index/', '文章分类管理展示页', 'GET', '127.0.0.1', 'system', 1568797717, 0);
INSERT INTO `eb_system_log` VALUES (268, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1568797807, 0);
INSERT INTO `eb_system_log` VALUES (269, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568797815, 0);
INSERT INTO `eb_system_log` VALUES (270, 1, 'admin', 'admin/setting.systemmenus/edit/id/23', '编辑菜单', 'GET', '127.0.0.1', 'system', 1568797823, 0);
INSERT INTO `eb_system_log` VALUES (271, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568797830, 0);
INSERT INTO `eb_system_log` VALUES (272, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568797852, 0);
INSERT INTO `eb_system_log` VALUES (273, 1, 'admin', 'admin/setting.systemmenus/create/', '添加菜单', 'GET', '127.0.0.1', 'system', 1568797853, 0);
INSERT INTO `eb_system_log` VALUES (274, 1, 'admin', 'admin/setting.systemmenus/create/', '添加菜单', 'GET', '127.0.0.1', 'system', 1568797879, 0);
INSERT INTO `eb_system_log` VALUES (275, 1, 'admin', 'admin/widget.widgets/icon/fodder/icon', '未知', 'GET', '127.0.0.1', 'system', 1568797930, 0);
INSERT INTO `eb_system_log` VALUES (276, 1, 'admin', 'admin/widget.widgets/icon/fodder/icon', '未知', 'GET', '127.0.0.1', 'system', 1568797930, 0);
INSERT INTO `eb_system_log` VALUES (277, 1, 'admin', 'admin/setting.systemmenus/save/', '添加提交菜单', 'POST', '127.0.0.1', 'system', 1568797942, 0);
INSERT INTO `eb_system_log` VALUES (278, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568797942, 0);
INSERT INTO `eb_system_log` VALUES (279, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568797969, 0);
INSERT INTO `eb_system_log` VALUES (280, 1, 'admin', 'admin/setting.systemmenus/create/cid/473', '添加菜单', 'GET', '127.0.0.1', 'system', 1568797987, 0);
INSERT INTO `eb_system_log` VALUES (281, 1, 'admin', 'admin/setting.systemmenus/save/', '添加提交菜单', 'POST', '127.0.0.1', 'system', 1568798001, 0);
INSERT INTO `eb_system_log` VALUES (282, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568798001, 0);
INSERT INTO `eb_system_log` VALUES (283, 1, 'admin', 'admin/other/idjj/', 'www', 'GET', '127.0.0.1', 'system', 1568798011, 0);
INSERT INTO `eb_system_log` VALUES (284, 1, 'admin', 'admin/other/idjj/', 'www', 'GET', '127.0.0.1', 'system', 1568798033, 0);
INSERT INTO `eb_system_log` VALUES (285, 1, 'admin', 'admin/system.clear/index/', '刷新缓存', 'GET', '127.0.0.1', 'system', 1568798038, 0);
INSERT INTO `eb_system_log` VALUES (286, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568798045, 0);
INSERT INTO `eb_system_log` VALUES (287, 1, 'admin', 'admin/setting.systemmenus/edit/id/473', '编辑菜单', 'GET', '127.0.0.1', 'system', 1568798049, 0);
INSERT INTO `eb_system_log` VALUES (288, 1, 'admin', 'admin/setting.systemmenus/edit/id/269', '编辑菜单', 'GET', '127.0.0.1', 'system', 1568798057, 0);
INSERT INTO `eb_system_log` VALUES (289, 1, 'admin', 'admin/other/idjj/', 'www', 'GET', '127.0.0.1', 'system', 1568798217, 0);
INSERT INTO `eb_system_log` VALUES (290, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568798245, 0);
INSERT INTO `eb_system_log` VALUES (291, 1, 'admin', 'admin/setting.systemmenus/create/', '添加菜单', 'GET', '127.0.0.1', 'system', 1568798250, 0);
INSERT INTO `eb_system_log` VALUES (292, 1, 'admin', 'admin/setting.systemmenus/delete/id/473', '删除菜单', 'GET', '127.0.0.1', 'system', 1568798262, 0);
INSERT INTO `eb_system_log` VALUES (293, 1, 'admin', 'admin/setting.systemmenus/edit/id/473', '编辑菜单', 'GET', '127.0.0.1', 'system', 1568798266, 0);
INSERT INTO `eb_system_log` VALUES (294, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1568798274, 0);
INSERT INTO `eb_system_log` VALUES (295, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1568798277, 0);
INSERT INTO `eb_system_log` VALUES (296, 1, 'admin', 'admin/setting.systemconfig/index/', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1568798281, 0);
INSERT INTO `eb_system_log` VALUES (297, 1, 'admin', 'admin/system.express/index/', '物流公司', 'GET', '127.0.0.1', 'system', 1568798296, 0);
INSERT INTO `eb_system_log` VALUES (298, 1, 'admin', 'admin/setting.systemmenus/index/pid/473', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568798305, 0);
INSERT INTO `eb_system_log` VALUES (299, 1, 'admin', 'admin/setting.systemmenus/delete/id/474', '删除菜单', 'GET', '127.0.0.1', 'system', 1568798310, 0);
INSERT INTO `eb_system_log` VALUES (300, 1, 'admin', 'admin/setting.systemmenus/create/cid/473', '添加菜单', 'GET', '127.0.0.1', 'system', 1568798313, 0);
INSERT INTO `eb_system_log` VALUES (301, 1, 'admin', 'admin/setting.systemmenus/save/', '添加提交菜单', 'POST', '127.0.0.1', 'system', 1568798366, 0);
INSERT INTO `eb_system_log` VALUES (302, 1, 'admin', 'admin/setting.systemmenus/index/pid/473', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568798367, 0);
INSERT INTO `eb_system_log` VALUES (303, 1, 'admin', 'admin/other/test/', '测试点', 'GET', '127.0.0.1', 'system', 1568798394, 0);
INSERT INTO `eb_system_log` VALUES (304, 1, 'admin', 'admin/setting.systemrole/index/', '身份管理展示页', 'GET', '127.0.0.1', 'system', 1568798404, 0);
INSERT INTO `eb_system_log` VALUES (305, 1, 'admin', 'admin/other/test/', '测试点', 'GET', '127.0.0.1', 'system', 1568798469, 0);
INSERT INTO `eb_system_log` VALUES (306, 1, 'admin', 'admin/setting.systemadmin/index/', '管理员列表展示页', 'GET', '127.0.0.1', 'system', 1568798487, 0);
INSERT INTO `eb_system_log` VALUES (307, 1, 'admin', 'admin/other/test/', '测试点', 'GET', '127.0.0.1', 'system', 1568798574, 0);
INSERT INTO `eb_system_log` VALUES (308, 1, 'admin', 'admin/other/test/', '测试点', 'GET', '127.0.0.1', 'system', 1568798602, 0);
INSERT INTO `eb_system_log` VALUES (309, 1, 'admin', 'admin/other/favicon.ico/', '未知', 'GET', '127.0.0.1', 'system', 1568798603, 0);
INSERT INTO `eb_system_log` VALUES (310, 1, 'admin', 'admin/other/test/', '测试点', 'GET', '127.0.0.1', 'system', 1568798609, 0);
INSERT INTO `eb_system_log` VALUES (311, 1, 'admin', 'admin/other/favicon.ico/', '未知', 'GET', '127.0.0.1', 'system', 1568798609, 0);
INSERT INTO `eb_system_log` VALUES (312, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568799070, 0);
INSERT INTO `eb_system_log` VALUES (313, 1, 'admin', 'admin/setting.systemmenus/index/pid/473', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568799072, 0);
INSERT INTO `eb_system_log` VALUES (314, 1, 'admin', 'admin/setting.systemmenus/edit/id/475', '编辑菜单', 'GET', '127.0.0.1', 'system', 1568799077, 0);
INSERT INTO `eb_system_log` VALUES (315, 1, 'admin', 'admin/setting.systemmenus/update/id/475', '编辑提交菜单', 'POST', '127.0.0.1', 'system', 1568799082, 0);
INSERT INTO `eb_system_log` VALUES (316, 1, 'admin', 'admin/setting.systemmenus/index/pid/473', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568799082, 0);
INSERT INTO `eb_system_log` VALUES (317, 1, 'admin', 'admin/other/index/', '测试点', 'GET', '127.0.0.1', 'system', 1568799089, 0);
INSERT INTO `eb_system_log` VALUES (318, 1, 'admin', 'admin/other/index/', '测试点', 'GET', '127.0.0.1', 'system', 1568799282, 0);
INSERT INTO `eb_system_log` VALUES (319, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568799474, 0);
INSERT INTO `eb_system_log` VALUES (320, 1, 'admin', 'admin/setting.systemmenus/index/pid/473', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568799477, 0);
INSERT INTO `eb_system_log` VALUES (321, 1, 'admin', 'admin/setting.systemmenus/delete/id/475', '删除菜单', 'GET', '127.0.0.1', 'system', 1568799480, 0);
INSERT INTO `eb_system_log` VALUES (322, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568799486, 0);
INSERT INTO `eb_system_log` VALUES (323, 1, 'admin', 'admin/setting.systemmenus/edit/id/473', '编辑菜单', 'GET', '127.0.0.1', 'system', 1568799490, 0);
INSERT INTO `eb_system_log` VALUES (324, 1, 'admin', 'admin/setting.systemmenus/delete/id/473', '删除菜单', 'GET', '127.0.0.1', 'system', 1568799501, 0);
INSERT INTO `eb_system_log` VALUES (325, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568799506, 0);
INSERT INTO `eb_system_log` VALUES (326, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568799507, 0);
INSERT INTO `eb_system_log` VALUES (327, 1, 'admin', 'admin/user.user/index/', '会员列表页', 'GET', '127.0.0.1', 'system', 1568799529, 0);
INSERT INTO `eb_system_log` VALUES (328, 1, 'admin', 'admin/user.user/get_user_list/', '未知', 'GET', '127.0.0.1', 'system', 1568799530, 0);
INSERT INTO `eb_system_log` VALUES (329, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1568799533, 0);
INSERT INTO `eb_system_log` VALUES (330, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1568799533, 0);
INSERT INTO `eb_system_log` VALUES (331, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1568799533, 0);
INSERT INTO `eb_system_log` VALUES (332, 1, 'admin', 'admin/setting.systemmenus/delete/id/289', '删除菜单', 'GET', '127.0.0.1', 'system', 1568799547, 0);
INSERT INTO `eb_system_log` VALUES (333, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568799714, 0);
INSERT INTO `eb_system_log` VALUES (334, 1, 'admin', 'admin/setting.systemmenus/create/', '添加菜单', 'GET', '127.0.0.1', 'system', 1568799717, 0);
INSERT INTO `eb_system_log` VALUES (335, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568799743, 0);
INSERT INTO `eb_system_log` VALUES (336, 1, 'admin', 'admin/setting.systemmenus/create/', '添加菜单', 'GET', '127.0.0.1', 'system', 1568799744, 0);
INSERT INTO `eb_system_log` VALUES (337, 1, 'admin', 'admin/setting.systemmenus/save/', '添加提交菜单', 'POST', '127.0.0.1', 'system', 1568799783, 0);
INSERT INTO `eb_system_log` VALUES (338, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568799783, 0);
INSERT INTO `eb_system_log` VALUES (339, 1, 'admin', 'admin/setting.systemmenus/edit/id/23', '编辑菜单', 'GET', '127.0.0.1', 'system', 1568799789, 0);
INSERT INTO `eb_system_log` VALUES (340, 1, 'admin', 'admin/setting.systemmenus/edit/id/286', '编辑菜单', 'GET', '127.0.0.1', 'system', 1568799793, 0);
INSERT INTO `eb_system_log` VALUES (341, 1, 'admin', 'admin/setting.systemmenus/index/pid/476', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568799799, 0);
INSERT INTO `eb_system_log` VALUES (342, 1, 'admin', 'admin/setting.systemmenus/create/cid/476', '添加菜单', 'GET', '127.0.0.1', 'system', 1568799801, 0);
INSERT INTO `eb_system_log` VALUES (343, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568799805, 0);
INSERT INTO `eb_system_log` VALUES (344, 1, 'admin', 'admin/setting.systemmenus/index/pid/151', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568799807, 0);
INSERT INTO `eb_system_log` VALUES (345, 1, 'admin', 'admin/setting.systemmenus/edit/id/176', '编辑菜单', 'GET', '127.0.0.1', 'system', 1568799809, 0);
INSERT INTO `eb_system_log` VALUES (346, 1, 'admin', 'admin/setting.systemmenus/edit/id/177', '编辑菜单', 'GET', '127.0.0.1', 'system', 1568799856, 0);
INSERT INTO `eb_system_log` VALUES (347, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568799996, 0);
INSERT INTO `eb_system_log` VALUES (348, 1, 'admin', 'admin/setting.systemmenus/index/pid/476', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568799998, 0);
INSERT INTO `eb_system_log` VALUES (349, 1, 'admin', 'admin/setting.systemmenus/create/cid/476', '添加菜单', 'GET', '127.0.0.1', 'system', 1568800001, 0);
INSERT INTO `eb_system_log` VALUES (350, 1, 'admin', 'admin/setting.systemmenus/save/', '添加提交菜单', 'POST', '127.0.0.1', 'system', 1568800054, 0);
INSERT INTO `eb_system_log` VALUES (351, 1, 'admin', 'admin/setting.systemmenus/index/pid/476', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568800054, 0);
INSERT INTO `eb_system_log` VALUES (352, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568800058, 0);
INSERT INTO `eb_system_log` VALUES (353, 1, 'admin', 'admin/setting.systemmenus/index/pid/286', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568800059, 0);
INSERT INTO `eb_system_log` VALUES (354, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568800062, 0);
INSERT INTO `eb_system_log` VALUES (355, 1, 'admin', 'admin/setting.systemmenus/index/pid/151', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568800065, 0);
INSERT INTO `eb_system_log` VALUES (356, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568800072, 0);
INSERT INTO `eb_system_log` VALUES (357, 1, 'admin', 'admin/setting.systemmenus/index/pid/476', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568800074, 0);
INSERT INTO `eb_system_log` VALUES (358, 1, 'admin', 'admin/setting.systemmenus/edit/id/477', '编辑菜单', 'GET', '127.0.0.1', 'system', 1568800077, 0);
INSERT INTO `eb_system_log` VALUES (359, 1, 'admin', 'admin/setting.systemmenus/update/id/477', '编辑提交菜单', 'POST', '127.0.0.1', 'system', 1568800083, 0);
INSERT INTO `eb_system_log` VALUES (360, 1, 'admin', 'admin/setting.systemmenus/index/pid/476', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568800083, 0);
INSERT INTO `eb_system_log` VALUES (361, 1, 'admin', 'admin/book.book/index/', '书籍大全', 'GET', '127.0.0.1', 'system', 1568800176, 0);
INSERT INTO `eb_system_log` VALUES (362, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568800202, 0);
INSERT INTO `eb_system_log` VALUES (363, 1, 'admin', 'admin/setting.systemmenus/index/pid/287', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568800204, 0);
INSERT INTO `eb_system_log` VALUES (364, 1, 'admin', 'admin/setting.systemmenus/edit/id/308', '编辑菜单', 'GET', '127.0.0.1', 'system', 1568800206, 0);
INSERT INTO `eb_system_log` VALUES (365, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568800213, 0);
INSERT INTO `eb_system_log` VALUES (366, 1, 'admin', 'admin/setting.systemmenus/index/pid/151', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1568800217, 0);
INSERT INTO `eb_system_log` VALUES (367, 1, 'admin', 'admin/setting.systemmenus/edit/id/177', '编辑菜单', 'GET', '127.0.0.1', 'system', 1568800220, 0);
INSERT INTO `eb_system_log` VALUES (368, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568800320, 0);
INSERT INTO `eb_system_log` VALUES (369, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568800321, 0);
INSERT INTO `eb_system_log` VALUES (370, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568941512, 0);
INSERT INTO `eb_system_log` VALUES (371, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568941516, 0);
INSERT INTO `eb_system_log` VALUES (372, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568941676, 0);
INSERT INTO `eb_system_log` VALUES (373, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568941683, 0);
INSERT INTO `eb_system_log` VALUES (374, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568941802, 0);
INSERT INTO `eb_system_log` VALUES (375, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568941807, 0);
INSERT INTO `eb_system_log` VALUES (376, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1568941904, 0);
INSERT INTO `eb_system_log` VALUES (377, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1568941906, 0);
INSERT INTO `eb_system_log` VALUES (378, 1, 'admin', 'admin/store.storeproductreply/index/', '评论管理展示页', 'GET', '127.0.0.1', 'system', 1568941909, 0);
INSERT INTO `eb_system_log` VALUES (379, 1, 'admin', 'admin/store.storeproductreply/get_product_imaes_list/', '未知', 'GET', '127.0.0.1', 'system', 1568941911, 0);
INSERT INTO `eb_system_log` VALUES (380, 1, 'admin', 'admin/store.storeproductreply/get_product_reply_list/', '未知', 'GET', '127.0.0.1', 'system', 1568941911, 0);
INSERT INTO `eb_system_log` VALUES (381, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1568942474, 0);
INSERT INTO `eb_system_log` VALUES (382, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1568942476, 0);
INSERT INTO `eb_system_log` VALUES (383, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1568942476, 0);
INSERT INTO `eb_system_log` VALUES (384, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568942480, 0);
INSERT INTO `eb_system_log` VALUES (385, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568942482, 0);
INSERT INTO `eb_system_log` VALUES (386, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568942508, 0);
INSERT INTO `eb_system_log` VALUES (387, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568942509, 0);
INSERT INTO `eb_system_log` VALUES (388, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1568942510, 0);
INSERT INTO `eb_system_log` VALUES (389, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1568942510, 0);
INSERT INTO `eb_system_log` VALUES (390, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1568942512, 0);
INSERT INTO `eb_system_log` VALUES (391, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1568942513, 0);
INSERT INTO `eb_system_log` VALUES (392, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1568942514, 0);
INSERT INTO `eb_system_log` VALUES (393, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568942555, 0);
INSERT INTO `eb_system_log` VALUES (394, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568942564, 0);
INSERT INTO `eb_system_log` VALUES (395, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568942794, 0);
INSERT INTO `eb_system_log` VALUES (396, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568942800, 0);
INSERT INTO `eb_system_log` VALUES (397, 1, 'admin', 'admin/store.storeproductreply/index/', '评论管理展示页', 'GET', '127.0.0.1', 'system', 1568942804, 0);
INSERT INTO `eb_system_log` VALUES (398, 1, 'admin', 'admin/store.storeproductreply/get_product_imaes_list/', '未知', 'GET', '127.0.0.1', 'system', 1568942810, 0);
INSERT INTO `eb_system_log` VALUES (399, 1, 'admin', 'admin/store.storeproductreply/get_product_reply_list/', '未知', 'GET', '127.0.0.1', 'system', 1568942810, 0);
INSERT INTO `eb_system_log` VALUES (400, 1, 'admin', 'admin/user.user/index/', '会员列表页', 'GET', '127.0.0.1', 'system', 1568942896, 0);
INSERT INTO `eb_system_log` VALUES (401, 1, 'admin', 'admin/user.user/get_user_list/', '未知', 'GET', '127.0.0.1', 'system', 1568942900, 0);
INSERT INTO `eb_system_log` VALUES (402, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568942985, 0);
INSERT INTO `eb_system_log` VALUES (403, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568942986, 0);
INSERT INTO `eb_system_log` VALUES (404, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1568942988, 0);
INSERT INTO `eb_system_log` VALUES (405, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1568942989, 0);
INSERT INTO `eb_system_log` VALUES (406, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568943006, 0);
INSERT INTO `eb_system_log` VALUES (407, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568943007, 0);
INSERT INTO `eb_system_log` VALUES (408, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568943118, 0);
INSERT INTO `eb_system_log` VALUES (409, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568943119, 0);
INSERT INTO `eb_system_log` VALUES (410, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1568943120, 0);
INSERT INTO `eb_system_log` VALUES (411, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1568943121, 0);
INSERT INTO `eb_system_log` VALUES (412, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1568943159, 0);
INSERT INTO `eb_system_log` VALUES (413, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1568943163, 0);
INSERT INTO `eb_system_log` VALUES (414, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1568943163, 0);
INSERT INTO `eb_system_log` VALUES (415, 1, 'admin', 'admin/user.user/index/', '会员列表页', 'GET', '127.0.0.1', 'system', 1568943206, 0);
INSERT INTO `eb_system_log` VALUES (416, 1, 'admin', 'admin/user.user/get_user_list/', '未知', 'GET', '127.0.0.1', 'system', 1568943208, 0);
INSERT INTO `eb_system_log` VALUES (417, 1, 'admin', 'admin/user.usernotice/index/', '未知', 'GET', '127.0.0.1', 'system', 1568944000, 0);
INSERT INTO `eb_system_log` VALUES (418, 1, 'admin', 'admin/user.usernotice/index/', '未知', 'GET', '127.0.0.1', 'system', 1568944002, 0);
INSERT INTO `eb_system_log` VALUES (419, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568944636, 0);
INSERT INTO `eb_system_log` VALUES (420, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568944638, 0);
INSERT INTO `eb_system_log` VALUES (421, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1568944655, 0);
INSERT INTO `eb_system_log` VALUES (422, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1568944657, 0);
INSERT INTO `eb_system_log` VALUES (423, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1568944657, 0);
INSERT INTO `eb_system_log` VALUES (424, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1568944672, 0);
INSERT INTO `eb_system_log` VALUES (425, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1568944673, 0);
INSERT INTO `eb_system_log` VALUES (426, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1568944673, 0);
INSERT INTO `eb_system_log` VALUES (427, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568944801, 0);
INSERT INTO `eb_system_log` VALUES (428, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568944804, 0);
INSERT INTO `eb_system_log` VALUES (429, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1568944944, 0);
INSERT INTO `eb_system_log` VALUES (430, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1568944948, 0);
INSERT INTO `eb_system_log` VALUES (431, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1568944948, 0);
INSERT INTO `eb_system_log` VALUES (432, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568944950, 0);
INSERT INTO `eb_system_log` VALUES (433, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568944952, 0);
INSERT INTO `eb_system_log` VALUES (434, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1568944955, 0);
INSERT INTO `eb_system_log` VALUES (435, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1568944960, 0);
INSERT INTO `eb_system_log` VALUES (436, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1568944963, 0);
INSERT INTO `eb_system_log` VALUES (437, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568944968, 0);
INSERT INTO `eb_system_log` VALUES (438, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1568944970, 0);
INSERT INTO `eb_system_log` VALUES (439, 1, 'admin', 'admin/store.storeproduct/index/type/3', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568944971, 0);
INSERT INTO `eb_system_log` VALUES (440, 1, 'admin', 'admin/store.storeproduct/product_ist/type/3', '未知', 'GET', '127.0.0.1', 'system', 1568944972, 0);
INSERT INTO `eb_system_log` VALUES (441, 1, 'admin', 'admin/store.storeproduct/index/type/4', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568944973, 0);
INSERT INTO `eb_system_log` VALUES (442, 1, 'admin', 'admin/store.storeproduct/product_ist/type/4', '未知', 'GET', '127.0.0.1', 'system', 1568944973, 0);
INSERT INTO `eb_system_log` VALUES (443, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1568945069, 0);
INSERT INTO `eb_system_log` VALUES (444, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1568945070, 0);
INSERT INTO `eb_system_log` VALUES (445, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1568945070, 0);
INSERT INTO `eb_system_log` VALUES (446, 1, 'admin', 'admin/store.storeproductreply/index/', '评论管理展示页', 'GET', '127.0.0.1', 'system', 1568945268, 0);
INSERT INTO `eb_system_log` VALUES (447, 1, 'admin', 'admin/store.storeproductreply/get_product_imaes_list/', '未知', 'GET', '127.0.0.1', 'system', 1568945270, 0);
INSERT INTO `eb_system_log` VALUES (448, 1, 'admin', 'admin/store.storeproductreply/get_product_reply_list/', '未知', 'GET', '127.0.0.1', 'system', 1568945271, 0);
INSERT INTO `eb_system_log` VALUES (449, 1, 'admin', 'admin/user.user/index/', '会员列表页', 'GET', '127.0.0.1', 'system', 1568945280, 0);
INSERT INTO `eb_system_log` VALUES (450, 1, 'admin', 'admin/user.user/get_user_list/', '未知', 'GET', '127.0.0.1', 'system', 1568945283, 0);
INSERT INTO `eb_system_log` VALUES (451, 1, 'admin', 'admin/ump.storecoupon/index/', '优惠券制作', 'GET', '127.0.0.1', 'system', 1568945311, 0);
INSERT INTO `eb_system_log` VALUES (452, 1, 'admin', 'admin/setting.systemconfig/index/type/3/tab_id/12', '优惠券配置', 'GET', '127.0.0.1', 'system', 1568945316, 0);
INSERT INTO `eb_system_log` VALUES (453, 1, 'admin', 'admin/user.usernotice/index/', '未知', 'GET', '127.0.0.1', 'system', 1568945320, 0);
INSERT INTO `eb_system_log` VALUES (454, 1, 'admin', 'admin/user.usernotice/index/', '未知', 'GET', '127.0.0.1', 'system', 1568945325, 0);
INSERT INTO `eb_system_log` VALUES (455, 1, 'admin', 'admin/user.usernotice/create/', '未知', 'GET', '127.0.0.1', 'system', 1568945347, 0);
INSERT INTO `eb_system_log` VALUES (456, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568945352, 0);
INSERT INTO `eb_system_log` VALUES (457, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568945354, 0);
INSERT INTO `eb_system_log` VALUES (458, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1568945355, 0);
INSERT INTO `eb_system_log` VALUES (459, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1568945425, 0);
INSERT INTO `eb_system_log` VALUES (460, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1568945429, 0);
INSERT INTO `eb_system_log` VALUES (461, 1, 'admin', 'admin/store.copytaobao/save_product/', '未知', 'POST', '127.0.0.1', 'system', 1568945447, 0);
INSERT INTO `eb_system_log` VALUES (462, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568945468, 0);
INSERT INTO `eb_system_log` VALUES (463, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1568945476, 0);
INSERT INTO `eb_system_log` VALUES (464, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/15', '未知', 'GET', '127.0.0.1', 'system', 1568945480, 0);
INSERT INTO `eb_system_log` VALUES (465, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568945484, 0);
INSERT INTO `eb_system_log` VALUES (466, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568945486, 0);
INSERT INTO `eb_system_log` VALUES (467, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1568945664, 0);
INSERT INTO `eb_system_log` VALUES (468, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1568945664, 0);
INSERT INTO `eb_system_log` VALUES (469, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1568945673, 0);
INSERT INTO `eb_system_log` VALUES (470, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1568945674, 0);
INSERT INTO `eb_system_log` VALUES (471, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1569054047, 0);
INSERT INTO `eb_system_log` VALUES (472, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1569054048, 0);
INSERT INTO `eb_system_log` VALUES (473, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1569054155, 0);
INSERT INTO `eb_system_log` VALUES (474, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1569054155, 0);
INSERT INTO `eb_system_log` VALUES (475, 1, 'admin', 'admin/store.storeproduct/delete/', '未知', 'GET', '127.0.0.1', 'system', 1569054181, 0);
INSERT INTO `eb_system_log` VALUES (476, 1, 'admin', 'admin/user.user/index/', '会员列表页', 'GET', '127.0.0.1', 'system', 1569054185, 0);
INSERT INTO `eb_system_log` VALUES (477, 1, 'admin', 'admin/user.user/get_user_list/', '未知', 'GET', '127.0.0.1', 'system', 1569054186, 0);
INSERT INTO `eb_system_log` VALUES (478, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1569078096, 0);
INSERT INTO `eb_system_log` VALUES (479, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1569078097, 0);
INSERT INTO `eb_system_log` VALUES (480, 1, 'admin', 'admin/store.storeproduct/index/type/6', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1569078105, 0);
INSERT INTO `eb_system_log` VALUES (481, 1, 'admin', 'admin/store.storeproduct/product_ist/type/6', '未知', 'GET', '127.0.0.1', 'system', 1569078106, 0);
INSERT INTO `eb_system_log` VALUES (482, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1569078160, 0);
INSERT INTO `eb_system_log` VALUES (483, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1569078160, 0);
INSERT INTO `eb_system_log` VALUES (484, 1, 'admin', 'admin/book.book/index/', '书籍大全', 'GET', '127.0.0.1', 'system', 1569078165, 0);
INSERT INTO `eb_system_log` VALUES (485, 1, 'admin', 'admin/user.usernotice/index/', '未知', 'GET', '127.0.0.1', 'system', 1569109759, 0);
INSERT INTO `eb_system_log` VALUES (486, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1569110620, 0);
INSERT INTO `eb_system_log` VALUES (487, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1569110621, 0);
INSERT INTO `eb_system_log` VALUES (488, 1, 'admin', 'admin/store.storeproduct/delete/', '未知', 'GET', '127.0.0.1', 'system', 1569110637, 0);
INSERT INTO `eb_system_log` VALUES (489, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1569110640, 0);
INSERT INTO `eb_system_log` VALUES (490, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1569110641, 0);
INSERT INTO `eb_system_log` VALUES (491, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1569110641, 0);
INSERT INTO `eb_system_log` VALUES (492, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1569118502, 0);
INSERT INTO `eb_system_log` VALUES (493, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1569118502, 0);
INSERT INTO `eb_system_log` VALUES (494, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1569120470, 0);
INSERT INTO `eb_system_log` VALUES (495, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1569120470, 0);
INSERT INTO `eb_system_log` VALUES (496, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1569125063, 0);
INSERT INTO `eb_system_log` VALUES (497, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1569125064, 0);
INSERT INTO `eb_system_log` VALUES (498, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1569133328, 0);
INSERT INTO `eb_system_log` VALUES (499, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1569133328, 0);
INSERT INTO `eb_system_log` VALUES (500, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/0/id/2', '未知', 'GET', '127.0.0.1', 'system', 1569133331, 0);
INSERT INTO `eb_system_log` VALUES (501, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/0/id/3', '未知', 'GET', '127.0.0.1', 'system', 1569133331, 0);
INSERT INTO `eb_system_log` VALUES (502, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/0/id/5', '未知', 'GET', '127.0.0.1', 'system', 1569133332, 0);
INSERT INTO `eb_system_log` VALUES (503, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/0/id/11', '未知', 'GET', '127.0.0.1', 'system', 1569133333, 0);
INSERT INTO `eb_system_log` VALUES (504, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/0/id/14', '未知', 'GET', '127.0.0.1', 'system', 1569133334, 0);
INSERT INTO `eb_system_log` VALUES (505, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/0/id/15', '未知', 'GET', '127.0.0.1', 'system', 1569133335, 0);
INSERT INTO `eb_system_log` VALUES (506, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1569133421, 0);
INSERT INTO `eb_system_log` VALUES (507, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1569133424, 0);
INSERT INTO `eb_system_log` VALUES (508, 1, 'admin', 'admin/store.copytaobao/save_product/', '未知', 'POST', '127.0.0.1', 'system', 1569133471, 0);
INSERT INTO `eb_system_log` VALUES (509, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1569133555, 0);
INSERT INTO `eb_system_log` VALUES (510, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1569133555, 0);
INSERT INTO `eb_system_log` VALUES (511, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/16', '未知', 'GET', '127.0.0.1', 'system', 1569133559, 0);
INSERT INTO `eb_system_log` VALUES (512, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1569133562, 0);
INSERT INTO `eb_system_log` VALUES (513, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1569133562, 0);
INSERT INTO `eb_system_log` VALUES (514, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1569133563, 0);
INSERT INTO `eb_system_log` VALUES (515, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1569133566, 0);
INSERT INTO `eb_system_log` VALUES (516, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1569133600, 0);
INSERT INTO `eb_system_log` VALUES (517, 1, 'admin', 'admin/store.copytaobao/save_product/', '未知', 'POST', '127.0.0.1', 'system', 1569133633, 0);
INSERT INTO `eb_system_log` VALUES (518, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1569133649, 0);
INSERT INTO `eb_system_log` VALUES (519, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1569133652, 0);
INSERT INTO `eb_system_log` VALUES (520, 1, 'admin', 'admin/store.copytaobao/save_product/', '未知', 'POST', '127.0.0.1', 'system', 1569133688, 0);
INSERT INTO `eb_system_log` VALUES (521, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1569133704, 0);
INSERT INTO `eb_system_log` VALUES (522, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1569133705, 0);
INSERT INTO `eb_system_log` VALUES (523, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/17', '未知', 'GET', '127.0.0.1', 'system', 1569133708, 0);
INSERT INTO `eb_system_log` VALUES (524, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/18', '未知', 'GET', '127.0.0.1', 'system', 1569133709, 0);
INSERT INTO `eb_system_log` VALUES (525, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1569134300, 0);
INSERT INTO `eb_system_log` VALUES (526, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1569134300, 0);
INSERT INTO `eb_system_log` VALUES (527, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1569134301, 0);
INSERT INTO `eb_system_log` VALUES (528, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1569134305, 0);
INSERT INTO `eb_system_log` VALUES (529, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1569138932, 0);
INSERT INTO `eb_system_log` VALUES (530, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1569138932, 0);
INSERT INTO `eb_system_log` VALUES (531, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1569138934, 0);
INSERT INTO `eb_system_log` VALUES (532, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1569138934, 0);
INSERT INTO `eb_system_log` VALUES (533, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1569138934, 0);
INSERT INTO `eb_system_log` VALUES (534, 1, 'admin', 'admin/user.user/index/', '会员列表页', 'GET', '127.0.0.1', 'system', 1569138936, 0);
INSERT INTO `eb_system_log` VALUES (535, 1, 'admin', 'admin/user.user/get_user_list/', '未知', 'GET', '127.0.0.1', 'system', 1569138937, 0);
INSERT INTO `eb_system_log` VALUES (536, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1569141056, 0);
INSERT INTO `eb_system_log` VALUES (537, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1569141057, 0);
INSERT INTO `eb_system_log` VALUES (538, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1569423405, 0);
INSERT INTO `eb_system_log` VALUES (539, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1569423405, 0);
INSERT INTO `eb_system_log` VALUES (540, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1569424344, 0);
INSERT INTO `eb_system_log` VALUES (541, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1569424345, 0);
INSERT INTO `eb_system_log` VALUES (542, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1569424345, 0);
INSERT INTO `eb_system_log` VALUES (543, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1569424354, 0);
INSERT INTO `eb_system_log` VALUES (544, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1569424355, 0);
INSERT INTO `eb_system_log` VALUES (545, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1569474712, 0);
INSERT INTO `eb_system_log` VALUES (546, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1569474713, 0);
INSERT INTO `eb_system_log` VALUES (547, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1569474716, 0);
INSERT INTO `eb_system_log` VALUES (548, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1569474720, 0);
INSERT INTO `eb_system_log` VALUES (549, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1569474773, 0);
INSERT INTO `eb_system_log` VALUES (550, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1569474775, 0);
INSERT INTO `eb_system_log` VALUES (551, 1, 'admin', 'admin/store.copytaobao/save_product/', '未知', 'POST', '127.0.0.1', 'system', 1569474863, 0);
INSERT INTO `eb_system_log` VALUES (552, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1569480249, 0);
INSERT INTO `eb_system_log` VALUES (553, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1569480250, 0);
INSERT INTO `eb_system_log` VALUES (554, 1, 'admin', 'admin/store.storeproduct/index/type/3', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1569480255, 0);
INSERT INTO `eb_system_log` VALUES (555, 1, 'admin', 'admin/store.storeproduct/product_ist/type/3', '未知', 'GET', '127.0.0.1', 'system', 1569480256, 0);
INSERT INTO `eb_system_log` VALUES (556, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1569550210, 0);
INSERT INTO `eb_system_log` VALUES (557, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1569550210, 0);
INSERT INTO `eb_system_log` VALUES (558, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1569550212, 0);
INSERT INTO `eb_system_log` VALUES (559, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1569550214, 0);
INSERT INTO `eb_system_log` VALUES (560, 1, 'admin', 'admin/store.copytaobao/save_product/', '未知', 'POST', '127.0.0.1', 'system', 1569550251, 0);
INSERT INTO `eb_system_log` VALUES (561, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1569550261, 0);
INSERT INTO `eb_system_log` VALUES (562, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1569550261, 0);
INSERT INTO `eb_system_log` VALUES (563, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1569550261, 0);
INSERT INTO `eb_system_log` VALUES (564, 1, 'admin', 'admin/store.storeproductreply/index/', '评论管理展示页', 'GET', '127.0.0.1', 'system', 1569550263, 0);
INSERT INTO `eb_system_log` VALUES (565, 1, 'admin', 'admin/store.storeproductreply/get_product_imaes_list/', '未知', 'GET', '127.0.0.1', 'system', 1569550264, 0);
INSERT INTO `eb_system_log` VALUES (566, 1, 'admin', 'admin/store.storeproductreply/get_product_reply_list/', '未知', 'GET', '127.0.0.1', 'system', 1569550264, 0);
INSERT INTO `eb_system_log` VALUES (567, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1569550269, 0);
INSERT INTO `eb_system_log` VALUES (568, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1569550270, 0);
INSERT INTO `eb_system_log` VALUES (569, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/19', '未知', 'GET', '127.0.0.1', 'system', 1569550274, 0);
INSERT INTO `eb_system_log` VALUES (570, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/20', '未知', 'GET', '127.0.0.1', 'system', 1569550275, 0);
INSERT INTO `eb_system_log` VALUES (571, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1569683249, 0);
INSERT INTO `eb_system_log` VALUES (572, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1569683249, 0);
INSERT INTO `eb_system_log` VALUES (573, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1569683331, 0);
INSERT INTO `eb_system_log` VALUES (574, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1569683331, 0);
INSERT INTO `eb_system_log` VALUES (575, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1569683331, 0);
INSERT INTO `eb_system_log` VALUES (576, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1569683334, 0);
INSERT INTO `eb_system_log` VALUES (577, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1569683334, 0);
INSERT INTO `eb_system_log` VALUES (578, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1569683339, 0);
INSERT INTO `eb_system_log` VALUES (579, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1569683339, 0);
INSERT INTO `eb_system_log` VALUES (580, 1, 'admin', 'admin/user.user/index/', '会员列表页', 'GET', '127.0.0.1', 'system', 1569683374, 0);
INSERT INTO `eb_system_log` VALUES (581, 1, 'admin', 'admin/user.user/get_user_list/', '未知', 'GET', '127.0.0.1', 'system', 1569683375, 0);
INSERT INTO `eb_system_log` VALUES (582, 1, 'admin', 'admin/setting.systemconfig/index/type/3/tab_id/9', '分销配置', 'GET', '127.0.0.1', 'system', 1569683428, 0);
INSERT INTO `eb_system_log` VALUES (583, 1, 'admin', 'admin/agent.agentmanage/index/', '分销管理列表页', 'GET', '127.0.0.1', 'system', 1569683432, 0);
INSERT INTO `eb_system_log` VALUES (584, 1, 'admin', 'admin/agent.agentmanage/get_spread_list/', '未知', 'GET', '127.0.0.1', 'system', 1569683432, 0);
INSERT INTO `eb_system_log` VALUES (585, 1, 'admin', 'admin/agent.agentmanage/get_badge/', '未知', 'POST', '127.0.0.1', 'system', 1569683432, 0);
INSERT INTO `eb_system_log` VALUES (586, 1, 'admin', 'admin/ump.storecoupon/index/', '优惠券制作', 'GET', '127.0.0.1', 'system', 1569683475, 0);
INSERT INTO `eb_system_log` VALUES (587, 1, 'admin', 'admin/finance.userextract/index/', '未知', 'GET', '127.0.0.1', 'system', 1569683512, 0);
INSERT INTO `eb_system_log` VALUES (588, 1, 'admin', 'admin/finance.userrecharge/index/', '充值记录', 'GET', '127.0.0.1', 'system', 1569683515, 0);
INSERT INTO `eb_system_log` VALUES (589, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570070660, 0);
INSERT INTO `eb_system_log` VALUES (590, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570070661, 0);
INSERT INTO `eb_system_log` VALUES (591, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570112601, 0);
INSERT INTO `eb_system_log` VALUES (592, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570112601, 0);
INSERT INTO `eb_system_log` VALUES (593, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570112607, 0);
INSERT INTO `eb_system_log` VALUES (594, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1570112607, 0);
INSERT INTO `eb_system_log` VALUES (595, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1570112616, 0);
INSERT INTO `eb_system_log` VALUES (596, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1570112616, 0);
INSERT INTO `eb_system_log` VALUES (597, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1570112616, 0);
INSERT INTO `eb_system_log` VALUES (598, 1, 'admin', 'admin/store.storeproductreply/index/', '评论管理展示页', 'GET', '127.0.0.1', 'system', 1570112618, 0);
INSERT INTO `eb_system_log` VALUES (599, 1, 'admin', 'admin/store.storeproductreply/get_product_imaes_list/', '未知', 'GET', '127.0.0.1', 'system', 1570112618, 0);
INSERT INTO `eb_system_log` VALUES (600, 1, 'admin', 'admin/store.storeproductreply/get_product_reply_list/', '未知', 'GET', '127.0.0.1', 'system', 1570112619, 0);
INSERT INTO `eb_system_log` VALUES (601, 1, 'admin', 'admin/ump.storecombination/index/', '拼团产品', 'GET', '127.0.0.1', 'system', 1570112627, 0);
INSERT INTO `eb_system_log` VALUES (602, 1, 'admin', 'admin/ump.storecombination/combina_list/', '拼团列表', 'GET', '127.0.0.1', 'system', 1570112629, 0);
INSERT INTO `eb_system_log` VALUES (603, 1, 'admin', 'admin/ump.storeseckill/index/', '限时秒杀', 'GET', '127.0.0.1', 'system', 1570112634, 0);
INSERT INTO `eb_system_log` VALUES (604, 1, 'admin', 'admin/ump.storeseckill/get_seckill_list/', '未知', 'GET', '127.0.0.1', 'system', 1570112635, 0);
INSERT INTO `eb_system_log` VALUES (605, 1, 'admin', 'admin/ump.storeseckill/{{d.image}}/', '未知', 'GET', '127.0.0.1', 'system', 1570112635, 0);
INSERT INTO `eb_system_log` VALUES (606, 1, 'admin', 'admin/ump.storeseckill/get_seckill_id/', '未知', 'GET', '127.0.0.1', 'system', 1570112637, 0);
INSERT INTO `eb_system_log` VALUES (607, 1, 'admin', 'admin/setting.systemconfig/index/type/3/tab_id/11', '积分配置', 'GET', '127.0.0.1', 'system', 1570112639, 0);
INSERT INTO `eb_system_log` VALUES (608, 1, 'admin', 'admin/ump.userpoint/index/', '积分日志', 'GET', '127.0.0.1', 'system', 1570112639, 0);
INSERT INTO `eb_system_log` VALUES (609, 1, 'admin', 'admin/ump.userpoint/getuserpointbadgelist/', '未知', 'GET', '127.0.0.1', 'system', 1570112640, 0);
INSERT INTO `eb_system_log` VALUES (610, 1, 'admin', 'admin/ump.userpoint/getponitlist/', '未知', 'GET', '127.0.0.1', 'system', 1570112640, 0);
INSERT INTO `eb_system_log` VALUES (611, 1, 'admin', 'admin/system.clear/index/', '刷新缓存', 'GET', '127.0.0.1', 'system', 1570112647, 0);
INSERT INTO `eb_system_log` VALUES (612, 1, 'admin', 'admin/system.systemupgradeclient/index/', '在线更新', 'GET', '127.0.0.1', 'system', 1570112648, 0);
INSERT INTO `eb_system_log` VALUES (613, 1, 'admin', 'admin/setting.systemconfigtab/index/', '配置分类展示页', 'GET', '127.0.0.1', 'system', 1570112660, 0);
INSERT INTO `eb_system_log` VALUES (614, 1, 'admin', 'admin/article.article/index/', '文章管理', 'GET', '127.0.0.1', 'system', 1570112661, 0);
INSERT INTO `eb_system_log` VALUES (615, 1, 'admin', 'admin/system.systemupgradeclient/get_list/', '未知', 'POST', '127.0.0.1', 'system', 1570112661, 0);
INSERT INTO `eb_system_log` VALUES (616, 1, 'admin', 'admin/system.systemupgradeclient/get_new_version_conte/', '未知', 'POST', '127.0.0.1', 'system', 1570112662, 0);
INSERT INTO `eb_system_log` VALUES (617, 1, 'admin', 'admin/article.articlecategory/index/', '文章分类管理展示页', 'GET', '127.0.0.1', 'system', 1570112663, 0);
INSERT INTO `eb_system_log` VALUES (618, 1, 'admin', 'admin/article.article/index/pid/2', '文章管理', 'GET', '127.0.0.1', 'system', 1570112669, 0);
INSERT INTO `eb_system_log` VALUES (619, 1, 'admin', 'admin/setting.systemconfig/index/type/1/tab_id/2', '公众号接口配置', 'GET', '127.0.0.1', 'system', 1570112673, 0);
INSERT INTO `eb_system_log` VALUES (620, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/32', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570112677, 0);
INSERT INTO `eb_system_log` VALUES (621, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/34', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570112678, 0);
INSERT INTO `eb_system_log` VALUES (622, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/35', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570112685, 0);
INSERT INTO `eb_system_log` VALUES (623, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/36', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570112687, 0);
INSERT INTO `eb_system_log` VALUES (624, 1, 'admin', 'admin/setting.systemgroupdata/edit/gid/34/id/84', '编辑数据', 'GET', '127.0.0.1', 'system', 1570112696, 0);
INSERT INTO `eb_system_log` VALUES (625, 1, 'admin', 'admin/wechat.wechatnewscategory/index/', '图文消息展示页', 'GET', '127.0.0.1', 'system', 1570112709, 0);
INSERT INTO `eb_system_log` VALUES (626, 1, 'admin', 'admin/wechat.wechatuser/index/', '微信用户展示页', 'GET', '127.0.0.1', 'system', 1570112714, 0);
INSERT INTO `eb_system_log` VALUES (627, 1, 'admin', 'admin/wechat.wechatuser/tag/', '用户标签', 'GET', '127.0.0.1', 'system', 1570112726, 0);
INSERT INTO `eb_system_log` VALUES (628, 1, 'admin', 'admin/wechat.storeservice/index/', '客服管理', 'GET', '127.0.0.1', 'system', 1570112727, 0);
INSERT INTO `eb_system_log` VALUES (629, 1, 'admin', 'admin/setting.systemgroupdata/create/gid/34', '添加数据', 'GET', '127.0.0.1', 'system', 1570112740, 0);
INSERT INTO `eb_system_log` VALUES (630, 1, 'admin', 'admin/setting.systemgroupdata/edit/gid/34/id/84', '编辑数据', 'GET', '127.0.0.1', 'system', 1570112749, 0);
INSERT INTO `eb_system_log` VALUES (631, 1, 'admin', 'admin/wechat.menus/index/', '微信菜单展示页', 'GET', '127.0.0.1', 'system', 1570112799, 0);
INSERT INTO `eb_system_log` VALUES (632, 1, 'admin', 'admin/wechat.wechattemplate/index/', '微信模版消息列表页', 'GET', '127.0.0.1', 'system', 1570112802, 0);
INSERT INTO `eb_system_log` VALUES (633, 1, 'admin', 'admin/setting.systemconfig/index/type/1/tab_id/4', '公众号支付配置', 'GET', '127.0.0.1', 'system', 1570112805, 0);
INSERT INTO `eb_system_log` VALUES (634, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570112945, 0);
INSERT INTO `eb_system_log` VALUES (635, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570112945, 0);
INSERT INTO `eb_system_log` VALUES (636, 1, 'admin', 'admin/setting.systemconfig/index/type/3/tab_id/9', '分销配置', 'GET', '127.0.0.1', 'system', 1570112954, 0);
INSERT INTO `eb_system_log` VALUES (637, 1, 'admin', 'admin/agent.agentmanage/index/', '分销管理列表页', 'GET', '127.0.0.1', 'system', 1570112956, 0);
INSERT INTO `eb_system_log` VALUES (638, 1, 'admin', 'admin/agent.agentmanage/get_spread_list/', '未知', 'GET', '127.0.0.1', 'system', 1570112957, 0);
INSERT INTO `eb_system_log` VALUES (639, 1, 'admin', 'admin/agent.agentmanage/get_badge/', '未知', 'POST', '127.0.0.1', 'system', 1570112957, 0);
INSERT INTO `eb_system_log` VALUES (640, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/48', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570112983, 0);
INSERT INTO `eb_system_log` VALUES (641, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/47', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570112991, 0);
INSERT INTO `eb_system_log` VALUES (642, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/55', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570112996, 0);
INSERT INTO `eb_system_log` VALUES (643, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/53', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570113002, 0);
INSERT INTO `eb_system_log` VALUES (644, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/50', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570113006, 0);
INSERT INTO `eb_system_log` VALUES (645, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/57', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570113008, 0);
INSERT INTO `eb_system_log` VALUES (646, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/58', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570113011, 0);
INSERT INTO `eb_system_log` VALUES (647, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/59', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570113012, 0);
INSERT INTO `eb_system_log` VALUES (648, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/60', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570113014, 0);
INSERT INTO `eb_system_log` VALUES (649, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/52', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570113016, 0);
INSERT INTO `eb_system_log` VALUES (650, 1, 'admin', 'admin/setting.systemgroupdata/edit/gid/48/id/104', '编辑数据', 'GET', '127.0.0.1', 'system', 1570113023, 0);
INSERT INTO `eb_system_log` VALUES (651, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570113041, 0);
INSERT INTO `eb_system_log` VALUES (652, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570113041, 0);
INSERT INTO `eb_system_log` VALUES (653, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1570113041, 0);
INSERT INTO `eb_system_log` VALUES (654, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113042, 0);
INSERT INTO `eb_system_log` VALUES (655, 1, 'admin', 'admin/widget.images/get_image_list/pid/1/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113044, 0);
INSERT INTO `eb_system_log` VALUES (656, 1, 'admin', 'admin/widget.images/get_image_list/pid/2/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113045, 0);
INSERT INTO `eb_system_log` VALUES (657, 1, 'admin', 'admin/setting.systemgroupdata/create/gid/48', '添加数据', 'GET', '127.0.0.1', 'system', 1570113057, 0);
INSERT INTO `eb_system_log` VALUES (658, 1, 'admin', 'admin/setting.systemgroupdata/create/gid/48', '添加数据', 'GET', '127.0.0.1', 'system', 1570113062, 0);
INSERT INTO `eb_system_log` VALUES (659, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570113071, 0);
INSERT INTO `eb_system_log` VALUES (660, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570113071, 0);
INSERT INTO `eb_system_log` VALUES (661, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1570113072, 0);
INSERT INTO `eb_system_log` VALUES (662, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113072, 0);
INSERT INTO `eb_system_log` VALUES (663, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113073, 0);
INSERT INTO `eb_system_log` VALUES (664, 1, 'admin', 'admin/widget.images/addcate/id/2', '添加分类展示', 'GET', '127.0.0.1', 'system', 1570113077, 0);
INSERT INTO `eb_system_log` VALUES (665, 1, 'admin', 'admin/widget.images/get_image_list/pid/6/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113080, 0);
INSERT INTO `eb_system_log` VALUES (666, 1, 'admin', 'admin/widget.images/get_image_list/pid/7/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113081, 0);
INSERT INTO `eb_system_log` VALUES (667, 1, 'admin', 'admin/widget.images/get_image_list/pid/8/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113082, 0);
INSERT INTO `eb_system_log` VALUES (668, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113082, 0);
INSERT INTO `eb_system_log` VALUES (669, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/2/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113090, 0);
INSERT INTO `eb_system_log` VALUES (670, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/3/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113096, 0);
INSERT INTO `eb_system_log` VALUES (671, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/4/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113102, 0);
INSERT INTO `eb_system_log` VALUES (672, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/5/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113104, 0);
INSERT INTO `eb_system_log` VALUES (673, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/7/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113106, 0);
INSERT INTO `eb_system_log` VALUES (674, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/9/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113108, 0);
INSERT INTO `eb_system_log` VALUES (675, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113109, 0);
INSERT INTO `eb_system_log` VALUES (676, 1, 'admin', 'admin/setting.systemgroupdata/edit/gid/48/id/104', '编辑数据', 'GET', '127.0.0.1', 'system', 1570113407, 0);
INSERT INTO `eb_system_log` VALUES (677, 1, 'admin', 'admin/setting.systemgroupdata/update/id/104', '提交修改数据', 'POST', '127.0.0.1', 'system', 1570113444, 0);
INSERT INTO `eb_system_log` VALUES (678, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/48', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570113444, 0);
INSERT INTO `eb_system_log` VALUES (679, 1, 'admin', 'admin/setting.systemgroupdata/edit/gid/48/id/104', '编辑数据', 'GET', '127.0.0.1', 'system', 1570113754, 0);
INSERT INTO `eb_system_log` VALUES (680, 1, 'admin', 'admin/setting.systemgroupdata/create/gid/48', '添加数据', 'GET', '127.0.0.1', 'system', 1570113761, 0);
INSERT INTO `eb_system_log` VALUES (681, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570113774, 0);
INSERT INTO `eb_system_log` VALUES (682, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570113774, 0);
INSERT INTO `eb_system_log` VALUES (683, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1570113775, 0);
INSERT INTO `eb_system_log` VALUES (684, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113775, 0);
INSERT INTO `eb_system_log` VALUES (685, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113779, 0);
INSERT INTO `eb_system_log` VALUES (686, 1, 'admin', 'admin/widget.images/get_image_list/pid/4/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113780, 0);
INSERT INTO `eb_system_log` VALUES (687, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113781, 0);
INSERT INTO `eb_system_log` VALUES (688, 1, 'admin', 'admin/setting.systemgroupdata/save/gid/48', '提交添加数据', 'POST', '127.0.0.1', 'system', 1570113787, 0);
INSERT INTO `eb_system_log` VALUES (689, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/48', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570113788, 0);
INSERT INTO `eb_system_log` VALUES (690, 1, 'admin', 'admin/setting.systemgroupdata/create/gid/48', '添加数据', 'GET', '127.0.0.1', 'system', 1570113822, 0);
INSERT INTO `eb_system_log` VALUES (691, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570113828, 0);
INSERT INTO `eb_system_log` VALUES (692, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570113828, 0);
INSERT INTO `eb_system_log` VALUES (693, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1570113829, 0);
INSERT INTO `eb_system_log` VALUES (694, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113829, 0);
INSERT INTO `eb_system_log` VALUES (695, 1, 'admin', 'admin/widget.images/get_image_list/pid/4/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113833, 0);
INSERT INTO `eb_system_log` VALUES (696, 1, 'admin', 'admin/widget.images/get_image_list/pid/1/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113836, 0);
INSERT INTO `eb_system_log` VALUES (697, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113838, 0);
INSERT INTO `eb_system_log` VALUES (698, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/3/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113844, 0);
INSERT INTO `eb_system_log` VALUES (699, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/4/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113845, 0);
INSERT INTO `eb_system_log` VALUES (700, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/5/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113847, 0);
INSERT INTO `eb_system_log` VALUES (701, 1, 'admin', 'admin/setting.systemgroupdata/save/gid/48', '提交添加数据', 'POST', '127.0.0.1', 'system', 1570113853, 0);
INSERT INTO `eb_system_log` VALUES (702, 1, 'admin', 'admin/setting.systemgroupdata/save/gid/48', '提交添加数据', 'POST', '127.0.0.1', 'system', 1570113866, 0);
INSERT INTO `eb_system_log` VALUES (703, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/48', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570113867, 0);
INSERT INTO `eb_system_log` VALUES (704, 1, 'admin', 'admin/setting.systemgroupdata/create/gid/48', '添加数据', 'GET', '127.0.0.1', 'system', 1570113909, 0);
INSERT INTO `eb_system_log` VALUES (705, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570113911, 0);
INSERT INTO `eb_system_log` VALUES (706, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1570113911, 0);
INSERT INTO `eb_system_log` VALUES (707, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113911, 0);
INSERT INTO `eb_system_log` VALUES (708, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '127.0.0.1', 'system', 1570113954, 0);
INSERT INTO `eb_system_log` VALUES (709, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '127.0.0.1', 'system', 1570113954, 0);
INSERT INTO `eb_system_log` VALUES (710, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '127.0.0.1', 'system', 1570113955, 0);
INSERT INTO `eb_system_log` VALUES (711, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '127.0.0.1', 'system', 1570113955, 0);
INSERT INTO `eb_system_log` VALUES (712, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113955, 0);
INSERT INTO `eb_system_log` VALUES (713, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113958, 0);
INSERT INTO `eb_system_log` VALUES (714, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113970, 0);
INSERT INTO `eb_system_log` VALUES (715, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '127.0.0.1', 'system', 1570113976, 0);
INSERT INTO `eb_system_log` VALUES (716, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '127.0.0.1', 'system', 1570113977, 0);
INSERT INTO `eb_system_log` VALUES (717, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '127.0.0.1', 'system', 1570113977, 0);
INSERT INTO `eb_system_log` VALUES (718, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '127.0.0.1', 'system', 1570113978, 0);
INSERT INTO `eb_system_log` VALUES (719, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113978, 0);
INSERT INTO `eb_system_log` VALUES (720, 1, 'admin', 'admin/setting.systemgroupdata/edit/gid/48/id/104', '编辑数据', 'GET', '127.0.0.1', 'system', 1570113986, 0);
INSERT INTO `eb_system_log` VALUES (721, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570113989, 0);
INSERT INTO `eb_system_log` VALUES (722, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570113989, 0);
INSERT INTO `eb_system_log` VALUES (723, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1570113989, 0);
INSERT INTO `eb_system_log` VALUES (724, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113989, 0);
INSERT INTO `eb_system_log` VALUES (725, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570113991, 0);
INSERT INTO `eb_system_log` VALUES (726, 1, 'admin', 'admin/setting.systemgroupdata/update/id/104', '提交修改数据', 'POST', '127.0.0.1', 'system', 1570113996, 0);
INSERT INTO `eb_system_log` VALUES (727, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/48', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570113996, 0);
INSERT INTO `eb_system_log` VALUES (728, 1, 'admin', 'admin/setting.systemgroupdata/edit/gid/48/id/169', '编辑数据', 'GET', '127.0.0.1', 'system', 1570114000, 0);
INSERT INTO `eb_system_log` VALUES (729, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570114002, 0);
INSERT INTO `eb_system_log` VALUES (730, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570114003, 0);
INSERT INTO `eb_system_log` VALUES (731, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1570114003, 0);
INSERT INTO `eb_system_log` VALUES (732, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570114003, 0);
INSERT INTO `eb_system_log` VALUES (733, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570114005, 0);
INSERT INTO `eb_system_log` VALUES (734, 1, 'admin', 'admin/setting.systemgroupdata/update/id/169', '提交修改数据', 'POST', '127.0.0.1', 'system', 1570114009, 0);
INSERT INTO `eb_system_log` VALUES (735, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/48', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570114009, 0);
INSERT INTO `eb_system_log` VALUES (736, 1, 'admin', 'admin/setting.systemgroupdata/edit/gid/48/id/170', '编辑数据', 'GET', '127.0.0.1', 'system', 1570114012, 0);
INSERT INTO `eb_system_log` VALUES (737, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570114015, 0);
INSERT INTO `eb_system_log` VALUES (738, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1570114015, 0);
INSERT INTO `eb_system_log` VALUES (739, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570114016, 0);
INSERT INTO `eb_system_log` VALUES (740, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570114017, 0);
INSERT INTO `eb_system_log` VALUES (741, 1, 'admin', 'admin/setting.systemgroupdata/update/id/170', '提交修改数据', 'POST', '127.0.0.1', 'system', 1570114022, 0);
INSERT INTO `eb_system_log` VALUES (742, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/48', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570114022, 0);
INSERT INTO `eb_system_log` VALUES (743, 1, 'admin', 'admin/setting.systemgroupdata/create/gid/48', '添加数据', 'GET', '127.0.0.1', 'system', 1570114027, 0);
INSERT INTO `eb_system_log` VALUES (744, 1, 'admin', 'admin/setting.systemgroupdata/edit/gid/48/id/170', '编辑数据', 'GET', '127.0.0.1', 'system', 1570114031, 0);
INSERT INTO `eb_system_log` VALUES (745, 1, 'admin', 'admin/setting.systemgroupdata/create/gid/48', '添加数据', 'GET', '127.0.0.1', 'system', 1570114036, 0);
INSERT INTO `eb_system_log` VALUES (746, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570114043, 0);
INSERT INTO `eb_system_log` VALUES (747, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1570114044, 0);
INSERT INTO `eb_system_log` VALUES (748, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570114044, 0);
INSERT INTO `eb_system_log` VALUES (749, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570114046, 0);
INSERT INTO `eb_system_log` VALUES (750, 1, 'admin', 'admin/setting.systemgroupdata/save/gid/48', '提交添加数据', 'POST', '127.0.0.1', 'system', 1570114050, 0);
INSERT INTO `eb_system_log` VALUES (751, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/48', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570114050, 0);
INSERT INTO `eb_system_log` VALUES (752, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570158646, 0);
INSERT INTO `eb_system_log` VALUES (753, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570158647, 0);
INSERT INTO `eb_system_log` VALUES (754, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1570158652, 0);
INSERT INTO `eb_system_log` VALUES (755, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570158695, 0);
INSERT INTO `eb_system_log` VALUES (756, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1570158695, 0);
INSERT INTO `eb_system_log` VALUES (757, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1570158710, 0);
INSERT INTO `eb_system_log` VALUES (758, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1570158759, 0);
INSERT INTO `eb_system_log` VALUES (759, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1570158764, 0);
INSERT INTO `eb_system_log` VALUES (760, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1570158767, 0);
INSERT INTO `eb_system_log` VALUES (761, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1570158771, 0);
INSERT INTO `eb_system_log` VALUES (762, 1, 'admin', 'admin/ump.storeseckill/seckill/', '未知', 'GET', '127.0.0.1', 'system', 1570158801, 0);
INSERT INTO `eb_system_log` VALUES (763, 1, 'admin', 'admin/ump.storeseckill/save/', '未知', 'POST', '127.0.0.1', 'system', 1570158805, 0);
INSERT INTO `eb_system_log` VALUES (764, 1, 'admin', 'admin/ump.storeseckill/save/', '未知', 'POST', '127.0.0.1', 'system', 1570158811, 0);
INSERT INTO `eb_system_log` VALUES (765, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570158811, 0);
INSERT INTO `eb_system_log` VALUES (766, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570158812, 0);
INSERT INTO `eb_system_log` VALUES (767, 1, 'admin', 'admin/store.storecategory/edit/', '编辑产品分类', 'GET', '127.0.0.1', 'system', 1570158833, 0);
INSERT INTO `eb_system_log` VALUES (768, 1, 'admin', 'admin/store.storecategory/delete/', '未知', 'GET', '127.0.0.1', 'system', 1570158847, 0);
INSERT INTO `eb_system_log` VALUES (769, 1, 'admin', 'admin/store.storecategory/delete/', '未知', 'GET', '127.0.0.1', 'system', 1570158851, 0);
INSERT INTO `eb_system_log` VALUES (770, 1, 'admin', 'admin/store.storecategory/delete/', '未知', 'GET', '127.0.0.1', 'system', 1570158854, 0);
INSERT INTO `eb_system_log` VALUES (771, 1, 'admin', 'admin/store.storecategory/delete/', '未知', 'GET', '127.0.0.1', 'system', 1570158857, 0);
INSERT INTO `eb_system_log` VALUES (772, 1, 'admin', 'admin/store.storecategory/delete/', '未知', 'GET', '127.0.0.1', 'system', 1570158860, 0);
INSERT INTO `eb_system_log` VALUES (773, 1, 'admin', 'admin/store.storecategory/delete/', '未知', 'GET', '127.0.0.1', 'system', 1570158863, 0);
INSERT INTO `eb_system_log` VALUES (774, 1, 'admin', 'admin/store.storecategory/delete/', '未知', 'GET', '127.0.0.1', 'system', 1570158866, 0);
INSERT INTO `eb_system_log` VALUES (775, 1, 'admin', 'admin/store.storecategory/delete/', '未知', 'GET', '127.0.0.1', 'system', 1570158869, 0);
INSERT INTO `eb_system_log` VALUES (776, 1, 'admin', 'admin/store.storecategory/delete/', '未知', 'GET', '127.0.0.1', 'system', 1570158872, 0);
INSERT INTO `eb_system_log` VALUES (777, 1, 'admin', 'admin/store.storecategory/delete/', '未知', 'GET', '127.0.0.1', 'system', 1570158876, 0);
INSERT INTO `eb_system_log` VALUES (778, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1570192759, 0);
INSERT INTO `eb_system_log` VALUES (779, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1570192848, 0);
INSERT INTO `eb_system_log` VALUES (780, 1, 'admin', 'admin/store.copytaobao/save_product/', '未知', 'POST', '127.0.0.1', 'system', 1570192869, 0);
INSERT INTO `eb_system_log` VALUES (781, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1570192906, 0);
INSERT INTO `eb_system_log` VALUES (782, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1570192909, 0);
INSERT INTO `eb_system_log` VALUES (783, 1, 'admin', 'admin/store.copytaobao/save_product/', '未知', 'POST', '127.0.0.1', 'system', 1570192941, 0);
INSERT INTO `eb_system_log` VALUES (784, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1570192957, 0);
INSERT INTO `eb_system_log` VALUES (785, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1570192960, 0);
INSERT INTO `eb_system_log` VALUES (786, 1, 'admin', 'admin/store.copytaobao/save_product/', '未知', 'POST', '127.0.0.1', 'system', 1570192979, 0);
INSERT INTO `eb_system_log` VALUES (787, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570192995, 0);
INSERT INTO `eb_system_log` VALUES (788, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1570192996, 0);
INSERT INTO `eb_system_log` VALUES (789, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/21', '未知', 'GET', '127.0.0.1', 'system', 1570193000, 0);
INSERT INTO `eb_system_log` VALUES (790, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/22', '未知', 'GET', '127.0.0.1', 'system', 1570193001, 0);
INSERT INTO `eb_system_log` VALUES (791, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/23', '未知', 'GET', '127.0.0.1', 'system', 1570193002, 0);
INSERT INTO `eb_system_log` VALUES (792, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570193011, 0);
INSERT INTO `eb_system_log` VALUES (793, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570193011, 0);
INSERT INTO `eb_system_log` VALUES (794, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570239155, 0);
INSERT INTO `eb_system_log` VALUES (795, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570239155, 0);
INSERT INTO `eb_system_log` VALUES (796, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1570239572, 0);
INSERT INTO `eb_system_log` VALUES (797, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1570239575, 0);
INSERT INTO `eb_system_log` VALUES (798, 1, 'admin', 'admin/store.copytaobao/save_product/', '未知', 'POST', '127.0.0.1', 'system', 1570239610, 0);
INSERT INTO `eb_system_log` VALUES (799, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1570239626, 0);
INSERT INTO `eb_system_log` VALUES (800, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1570239630, 0);
INSERT INTO `eb_system_log` VALUES (801, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1570239632, 0);
INSERT INTO `eb_system_log` VALUES (802, 1, 'admin', 'admin/store.copytaobao/save_product/', '未知', 'POST', '127.0.0.1', 'system', 1570239657, 0);
INSERT INTO `eb_system_log` VALUES (803, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570239662, 0);
INSERT INTO `eb_system_log` VALUES (804, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1570239662, 0);
INSERT INTO `eb_system_log` VALUES (805, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/24', '未知', 'GET', '127.0.0.1', 'system', 1570239666, 0);
INSERT INTO `eb_system_log` VALUES (806, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/25', '未知', 'GET', '127.0.0.1', 'system', 1570239666, 0);
INSERT INTO `eb_system_log` VALUES (807, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570240765, 0);
INSERT INTO `eb_system_log` VALUES (808, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570240766, 0);
INSERT INTO `eb_system_log` VALUES (809, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1570240766, 0);
INSERT INTO `eb_system_log` VALUES (810, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1570240769, 0);
INSERT INTO `eb_system_log` VALUES (811, 1, 'admin', 'admin/store.copytaobao/save_product/', '未知', 'POST', '127.0.0.1', 'system', 1570240784, 0);
INSERT INTO `eb_system_log` VALUES (812, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1570240796, 0);
INSERT INTO `eb_system_log` VALUES (813, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1570240809, 0);
INSERT INTO `eb_system_log` VALUES (814, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1570240812, 0);
INSERT INTO `eb_system_log` VALUES (815, 1, 'admin', 'admin/store.copytaobao/save_product/', '未知', 'POST', '127.0.0.1', 'system', 1570240843, 0);
INSERT INTO `eb_system_log` VALUES (816, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1570240864, 0);
INSERT INTO `eb_system_log` VALUES (817, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1570240866, 0);
INSERT INTO `eb_system_log` VALUES (818, 1, 'admin', 'admin/store.copytaobao/save_product/', '未知', 'POST', '127.0.0.1', 'system', 1570240881, 0);
INSERT INTO `eb_system_log` VALUES (819, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570240885, 0);
INSERT INTO `eb_system_log` VALUES (820, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1570240885, 0);
INSERT INTO `eb_system_log` VALUES (821, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/26', '未知', 'GET', '127.0.0.1', 'system', 1570240888, 0);
INSERT INTO `eb_system_log` VALUES (822, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/27', '未知', 'GET', '127.0.0.1', 'system', 1570240889, 0);
INSERT INTO `eb_system_log` VALUES (823, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/28', '未知', 'GET', '127.0.0.1', 'system', 1570240890, 0);
INSERT INTO `eb_system_log` VALUES (824, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570456724, 0);
INSERT INTO `eb_system_log` VALUES (825, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570456725, 0);
INSERT INTO `eb_system_log` VALUES (826, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1570456726, 0);
INSERT INTO `eb_system_log` VALUES (827, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1570456729, 0);
INSERT INTO `eb_system_log` VALUES (828, 1, 'admin', 'admin/store.copytaobao/save_product/', '未知', 'POST', '127.0.0.1', 'system', 1570456761, 0);
INSERT INTO `eb_system_log` VALUES (829, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1570456774, 0);
INSERT INTO `eb_system_log` VALUES (830, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1570456776, 0);
INSERT INTO `eb_system_log` VALUES (831, 1, 'admin', 'admin/store.copytaobao/save_product/', '未知', 'POST', '127.0.0.1', 'system', 1570456804, 0);
INSERT INTO `eb_system_log` VALUES (832, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570456809, 0);
INSERT INTO `eb_system_log` VALUES (833, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1570456809, 0);
INSERT INTO `eb_system_log` VALUES (834, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/29', '未知', 'GET', '127.0.0.1', 'system', 1570456813, 0);
INSERT INTO `eb_system_log` VALUES (835, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/30', '未知', 'GET', '127.0.0.1', 'system', 1570456814, 0);
INSERT INTO `eb_system_log` VALUES (836, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570456848, 0);
INSERT INTO `eb_system_log` VALUES (837, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570456848, 0);
INSERT INTO `eb_system_log` VALUES (838, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1570456849, 0);
INSERT INTO `eb_system_log` VALUES (839, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1570456852, 0);
INSERT INTO `eb_system_log` VALUES (840, 1, 'admin', 'admin/store.copytaobao/save_product/', '未知', 'POST', '127.0.0.1', 'system', 1570456881, 0);
INSERT INTO `eb_system_log` VALUES (841, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570456884, 0);
INSERT INTO `eb_system_log` VALUES (842, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1570456884, 0);
INSERT INTO `eb_system_log` VALUES (843, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/31', '未知', 'GET', '127.0.0.1', 'system', 1570456886, 0);
INSERT INTO `eb_system_log` VALUES (844, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570523080, 0);
INSERT INTO `eb_system_log` VALUES (845, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570523081, 0);
INSERT INTO `eb_system_log` VALUES (846, 1, 'admin', 'admin/record.record/chart_order/', '订单统计', 'GET', '127.0.0.1', 'system', 1570523099, 0);
INSERT INTO `eb_system_log` VALUES (847, 1, 'admin', 'admin/record.record/get_echarts_order/', '未知', 'GET', '127.0.0.1', 'system', 1570523099, 0);
INSERT INTO `eb_system_log` VALUES (848, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/48', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570523124, 0);
INSERT INTO `eb_system_log` VALUES (849, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570523181, 0);
INSERT INTO `eb_system_log` VALUES (850, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570523181, 0);
INSERT INTO `eb_system_log` VALUES (851, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/0/id/17', '未知', 'GET', '127.0.0.1', 'system', 1570523188, 0);
INSERT INTO `eb_system_log` VALUES (852, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/17', '未知', 'GET', '127.0.0.1', 'system', 1570523189, 0);
INSERT INTO `eb_system_log` VALUES (853, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1570523195, 0);
INSERT INTO `eb_system_log` VALUES (854, 1, 'admin', 'admin/store.storeproduct/update/id/17', '未知', 'POST', '127.0.0.1', 'system', 1570523204, 0);
INSERT INTO `eb_system_log` VALUES (855, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570523204, 0);
INSERT INTO `eb_system_log` VALUES (856, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570523205, 0);
INSERT INTO `eb_system_log` VALUES (857, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/48', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570523210, 0);
INSERT INTO `eb_system_log` VALUES (858, 1, 'admin', 'admin/setting.systemgroupdata/edit/gid/48/id/104', '编辑数据', 'GET', '127.0.0.1', 'system', 1570523214, 0);
INSERT INTO `eb_system_log` VALUES (859, 1, 'admin', 'admin/setting.systemgroupdata/update/id/104', '提交修改数据', 'POST', '127.0.0.1', 'system', 1570523225, 0);
INSERT INTO `eb_system_log` VALUES (860, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/48', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1570523226, 0);
INSERT INTO `eb_system_log` VALUES (861, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1570523233, 0);
INSERT INTO `eb_system_log` VALUES (862, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1570523234, 0);
INSERT INTO `eb_system_log` VALUES (863, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1570523234, 0);
INSERT INTO `eb_system_log` VALUES (864, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1570523238, 0);
INSERT INTO `eb_system_log` VALUES (865, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1570523238, 0);
INSERT INTO `eb_system_log` VALUES (866, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570523247, 0);
INSERT INTO `eb_system_log` VALUES (867, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1570523247, 0);
INSERT INTO `eb_system_log` VALUES (868, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570544091, 0);
INSERT INTO `eb_system_log` VALUES (869, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570544092, 0);
INSERT INTO `eb_system_log` VALUES (870, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1570544093, 0);
INSERT INTO `eb_system_log` VALUES (871, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1570544096, 0);
INSERT INTO `eb_system_log` VALUES (872, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570544343, 0);
INSERT INTO `eb_system_log` VALUES (873, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570544344, 0);
INSERT INTO `eb_system_log` VALUES (874, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1570544345, 0);
INSERT INTO `eb_system_log` VALUES (875, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1570544350, 0);
INSERT INTO `eb_system_log` VALUES (876, 1, 'admin', 'admin/store.copytaobao/save_product/', '未知', 'POST', '127.0.0.1', 'system', 1570544395, 0);
INSERT INTO `eb_system_log` VALUES (877, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570544404, 0);
INSERT INTO `eb_system_log` VALUES (878, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1570544405, 0);
INSERT INTO `eb_system_log` VALUES (879, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/32', '未知', 'GET', '127.0.0.1', 'system', 1570544408, 0);
INSERT INTO `eb_system_log` VALUES (880, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570544469, 0);
INSERT INTO `eb_system_log` VALUES (881, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570544469, 0);
INSERT INTO `eb_system_log` VALUES (882, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1570544475, 0);
INSERT INTO `eb_system_log` VALUES (883, 1, 'admin', 'admin/user.user/index/', '会员列表页', 'GET', '127.0.0.1', 'system', 1570549699, 0);
INSERT INTO `eb_system_log` VALUES (884, 1, 'admin', 'admin/user.user/get_user_list/', '未知', 'GET', '127.0.0.1', 'system', 1570549700, 0);
INSERT INTO `eb_system_log` VALUES (885, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570549710, 0);
INSERT INTO `eb_system_log` VALUES (886, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570549711, 0);
INSERT INTO `eb_system_log` VALUES (887, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570549712, 0);
INSERT INTO `eb_system_log` VALUES (888, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1570549712, 0);
INSERT INTO `eb_system_log` VALUES (889, 1, 'admin', 'admin/store.storecategory/edit/', '编辑产品分类', 'GET', '127.0.0.1', 'system', 1570549715, 0);
INSERT INTO `eb_system_log` VALUES (890, 1, 'admin', 'admin/store.storecategory/edit/', '编辑产品分类', 'GET', '127.0.0.1', 'system', 1570550238, 0);
INSERT INTO `eb_system_log` VALUES (891, 1, 'admin', 'admin/store.storecategory/edit/', '编辑产品分类', 'GET', '127.0.0.1', 'system', 1570550245, 0);
INSERT INTO `eb_system_log` VALUES (892, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570550353, 0);
INSERT INTO `eb_system_log` VALUES (893, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570550353, 0);
INSERT INTO `eb_system_log` VALUES (894, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1570550353, 0);
INSERT INTO `eb_system_log` VALUES (895, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550353, 0);
INSERT INTO `eb_system_log` VALUES (896, 1, 'admin', 'admin/widget.images/get_image_list/pid/7/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550357, 0);
INSERT INTO `eb_system_log` VALUES (897, 1, 'admin', 'admin/widget.images/get_image_list/pid/6/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550359, 0);
INSERT INTO `eb_system_log` VALUES (898, 1, 'admin', 'admin/widget.images/editcate/id/4', '编辑分类展示', 'GET', '127.0.0.1', 'system', 1570550360, 0);
INSERT INTO `eb_system_log` VALUES (899, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550363, 0);
INSERT INTO `eb_system_log` VALUES (900, 1, 'admin', 'admin/widget.images/get_image_list/pid/2/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550368, 0);
INSERT INTO `eb_system_log` VALUES (901, 1, 'admin', 'admin/widget.images/get_image_list/pid/4/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550370, 0);
INSERT INTO `eb_system_log` VALUES (902, 1, 'admin', 'admin/widget.images/get_image_list/pid/1/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550373, 0);
INSERT INTO `eb_system_log` VALUES (903, 1, 'admin', 'admin/widget.images/get_image_list/pid/6/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550375, 0);
INSERT INTO `eb_system_log` VALUES (904, 1, 'admin', 'admin/widget.images/get_image_list/pid/7/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550376, 0);
INSERT INTO `eb_system_log` VALUES (905, 1, 'admin', 'admin/widget.images/get_image_list/pid/8/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550377, 0);
INSERT INTO `eb_system_log` VALUES (906, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550378, 0);
INSERT INTO `eb_system_log` VALUES (907, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/13/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550384, 0);
INSERT INTO `eb_system_log` VALUES (908, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/12/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550386, 0);
INSERT INTO `eb_system_log` VALUES (909, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550390, 0);
INSERT INTO `eb_system_log` VALUES (910, 1, 'admin', 'admin/widget.images/get_image_list/pid/1/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550394, 0);
INSERT INTO `eb_system_log` VALUES (911, 1, 'admin', 'admin/widget.images/get_image_list/pid/2/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550395, 0);
INSERT INTO `eb_system_log` VALUES (912, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550396, 0);
INSERT INTO `eb_system_log` VALUES (913, 1, 'admin', 'admin/store.storecategory/update/id/1', '未知', 'POST', '127.0.0.1', 'system', 1570550403, 0);
INSERT INTO `eb_system_log` VALUES (914, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570550403, 0);
INSERT INTO `eb_system_log` VALUES (915, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1570550404, 0);
INSERT INTO `eb_system_log` VALUES (916, 1, 'admin', 'admin/store.storecategory/edit/', '编辑产品分类', 'GET', '127.0.0.1', 'system', 1570550415, 0);
INSERT INTO `eb_system_log` VALUES (917, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570550427, 0);
INSERT INTO `eb_system_log` VALUES (918, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570550427, 0);
INSERT INTO `eb_system_log` VALUES (919, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1570550427, 0);
INSERT INTO `eb_system_log` VALUES (920, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550427, 0);
INSERT INTO `eb_system_log` VALUES (921, 1, 'admin', 'admin/widget.images/get_image_list/pid/4/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550430, 0);
INSERT INTO `eb_system_log` VALUES (922, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550431, 0);
INSERT INTO `eb_system_log` VALUES (923, 1, 'admin', 'admin/store.storecategory/update/id/6', '未知', 'POST', '127.0.0.1', 'system', 1570550435, 0);
INSERT INTO `eb_system_log` VALUES (924, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570550435, 0);
INSERT INTO `eb_system_log` VALUES (925, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1570550435, 0);
INSERT INTO `eb_system_log` VALUES (926, 1, 'admin', 'admin/store.storecategory/create/', '添加产品分类', 'GET', '127.0.0.1', 'system', 1570550444, 0);
INSERT INTO `eb_system_log` VALUES (927, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570550483, 0);
INSERT INTO `eb_system_log` VALUES (928, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570550483, 0);
INSERT INTO `eb_system_log` VALUES (929, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1570550484, 0);
INSERT INTO `eb_system_log` VALUES (930, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550484, 0);
INSERT INTO `eb_system_log` VALUES (931, 1, 'admin', 'admin/widget.images/get_image_list/pid/4/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550487, 0);
INSERT INTO `eb_system_log` VALUES (932, 1, 'admin', 'admin/widget.images/get_image_list/pid/2/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550488, 0);
INSERT INTO `eb_system_log` VALUES (933, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550489, 0);
INSERT INTO `eb_system_log` VALUES (934, 1, 'admin', 'admin/store.storecategory/save/', '未知', 'POST', '127.0.0.1', 'system', 1570550496, 0);
INSERT INTO `eb_system_log` VALUES (935, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570550496, 0);
INSERT INTO `eb_system_log` VALUES (936, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1570550497, 0);
INSERT INTO `eb_system_log` VALUES (937, 1, 'admin', 'admin/store.storecategory/create/', '添加产品分类', 'GET', '127.0.0.1', 'system', 1570550511, 0);
INSERT INTO `eb_system_log` VALUES (938, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570550524, 0);
INSERT INTO `eb_system_log` VALUES (939, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1570550524, 0);
INSERT INTO `eb_system_log` VALUES (940, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550525, 0);
INSERT INTO `eb_system_log` VALUES (941, 1, 'admin', 'admin/widget.images/get_image_list/pid/5/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550527, 0);
INSERT INTO `eb_system_log` VALUES (942, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550528, 0);
INSERT INTO `eb_system_log` VALUES (943, 1, 'admin', 'admin/store.storecategory/save/', '未知', 'POST', '127.0.0.1', 'system', 1570550533, 0);
INSERT INTO `eb_system_log` VALUES (944, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570550534, 0);
INSERT INTO `eb_system_log` VALUES (945, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1570550534, 0);
INSERT INTO `eb_system_log` VALUES (946, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570550546, 0);
INSERT INTO `eb_system_log` VALUES (947, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1570550547, 0);
INSERT INTO `eb_system_log` VALUES (948, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570550557, 0);
INSERT INTO `eb_system_log` VALUES (949, 1, 'admin', 'admin/store.storecategory/category_list/pid/1', '未知', 'GET', '127.0.0.1', 'system', 1570550557, 0);
INSERT INTO `eb_system_log` VALUES (950, 1, 'admin', 'admin/store.storecategory/edit/', '编辑产品分类', 'GET', '127.0.0.1', 'system', 1570550574, 0);
INSERT INTO `eb_system_log` VALUES (951, 1, 'admin', 'admin/store.storecategory/update/id/4', '未知', 'POST', '127.0.0.1', 'system', 1570550592, 0);
INSERT INTO `eb_system_log` VALUES (952, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570550592, 0);
INSERT INTO `eb_system_log` VALUES (953, 1, 'admin', 'admin/store.storecategory/category_list/pid/1', '未知', 'GET', '127.0.0.1', 'system', 1570550592, 0);
INSERT INTO `eb_system_log` VALUES (954, 1, 'admin', 'admin/store.storecategory/edit/', '编辑产品分类', 'GET', '127.0.0.1', 'system', 1570550596, 0);
INSERT INTO `eb_system_log` VALUES (955, 1, 'admin', 'admin/store.storecategory/update/id/3', '未知', 'POST', '127.0.0.1', 'system', 1570550607, 0);
INSERT INTO `eb_system_log` VALUES (956, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570550607, 0);
INSERT INTO `eb_system_log` VALUES (957, 1, 'admin', 'admin/store.storecategory/category_list/pid/1', '未知', 'GET', '127.0.0.1', 'system', 1570550608, 0);
INSERT INTO `eb_system_log` VALUES (958, 1, 'admin', 'admin/store.storecategory/edit/', '编辑产品分类', 'GET', '127.0.0.1', 'system', 1570550611, 0);
INSERT INTO `eb_system_log` VALUES (959, 1, 'admin', 'admin/store.storecategory/update/id/2', '未知', 'POST', '127.0.0.1', 'system', 1570550626, 0);
INSERT INTO `eb_system_log` VALUES (960, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570550627, 0);
INSERT INTO `eb_system_log` VALUES (961, 1, 'admin', 'admin/store.storecategory/category_list/pid/1', '未知', 'GET', '127.0.0.1', 'system', 1570550627, 0);
INSERT INTO `eb_system_log` VALUES (962, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570550678, 0);
INSERT INTO `eb_system_log` VALUES (963, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1570550679, 0);
INSERT INTO `eb_system_log` VALUES (964, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570550681, 0);
INSERT INTO `eb_system_log` VALUES (965, 1, 'admin', 'admin/store.storecategory/category_list/pid/24', '未知', 'GET', '127.0.0.1', 'system', 1570550682, 0);
INSERT INTO `eb_system_log` VALUES (966, 1, 'admin', 'admin/store.storecategory/create/', '添加产品分类', 'GET', '127.0.0.1', 'system', 1570550689, 0);
INSERT INTO `eb_system_log` VALUES (967, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570550701, 0);
INSERT INTO `eb_system_log` VALUES (968, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1570550701, 0);
INSERT INTO `eb_system_log` VALUES (969, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570550706, 0);
INSERT INTO `eb_system_log` VALUES (970, 1, 'admin', 'admin/store.storecategory/category_list/pid/24', '未知', 'GET', '127.0.0.1', 'system', 1570550707, 0);
INSERT INTO `eb_system_log` VALUES (971, 1, 'admin', 'admin/store.storecategory/create/', '添加产品分类', 'GET', '127.0.0.1', 'system', 1570550710, 0);
INSERT INTO `eb_system_log` VALUES (972, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570550725, 0);
INSERT INTO `eb_system_log` VALUES (973, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570550725, 0);
INSERT INTO `eb_system_log` VALUES (974, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1570550725, 0);
INSERT INTO `eb_system_log` VALUES (975, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550726, 0);
INSERT INTO `eb_system_log` VALUES (976, 1, 'admin', 'admin/widget.images/get_image_list/pid/3/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550729, 0);
INSERT INTO `eb_system_log` VALUES (977, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570550735, 0);
INSERT INTO `eb_system_log` VALUES (978, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570550736, 0);
INSERT INTO `eb_system_log` VALUES (979, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1570550736, 0);
INSERT INTO `eb_system_log` VALUES (980, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550736, 0);
INSERT INTO `eb_system_log` VALUES (981, 1, 'admin', 'admin/widget.images/get_image_list/pid/8/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550738, 0);
INSERT INTO `eb_system_log` VALUES (982, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550739, 0);
INSERT INTO `eb_system_log` VALUES (983, 1, 'admin', 'admin/store.storecategory/save/', '未知', 'POST', '127.0.0.1', 'system', 1570550744, 0);
INSERT INTO `eb_system_log` VALUES (984, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570550744, 0);
INSERT INTO `eb_system_log` VALUES (985, 1, 'admin', 'admin/store.storecategory/category_list/pid/24', '未知', 'GET', '127.0.0.1', 'system', 1570550744, 0);
INSERT INTO `eb_system_log` VALUES (986, 1, 'admin', 'admin/store.storecategory/create/', '添加产品分类', 'GET', '127.0.0.1', 'system', 1570550751, 0);
INSERT INTO `eb_system_log` VALUES (987, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570550770, 0);
INSERT INTO `eb_system_log` VALUES (988, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570550770, 0);
INSERT INTO `eb_system_log` VALUES (989, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1570550770, 0);
INSERT INTO `eb_system_log` VALUES (990, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550771, 0);
INSERT INTO `eb_system_log` VALUES (991, 1, 'admin', 'admin/widget.images/get_image_list/pid/4/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550774, 0);
INSERT INTO `eb_system_log` VALUES (992, 1, 'admin', 'admin/widget.images/get_image_list/pid/8/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550776, 0);
INSERT INTO `eb_system_log` VALUES (993, 1, 'admin', 'admin/widget.images/get_image_list/pid/6/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550778, 0);
INSERT INTO `eb_system_log` VALUES (994, 1, 'admin', 'admin/widget.images/get_image_list/pid/5/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550779, 0);
INSERT INTO `eb_system_log` VALUES (995, 1, 'admin', 'admin/widget.images/get_image_list/pid/2/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550781, 0);
INSERT INTO `eb_system_log` VALUES (996, 1, 'admin', 'admin/widget.images/get_image_list/pid/8/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550783, 0);
INSERT INTO `eb_system_log` VALUES (997, 1, 'admin', 'admin/widget.images/get_image_list/pid/7/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550784, 0);
INSERT INTO `eb_system_log` VALUES (998, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550785, 0);
INSERT INTO `eb_system_log` VALUES (999, 1, 'admin', 'admin/store.storecategory/save/', '未知', 'POST', '127.0.0.1', 'system', 1570550789, 0);
INSERT INTO `eb_system_log` VALUES (1000, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570550790, 0);
INSERT INTO `eb_system_log` VALUES (1001, 1, 'admin', 'admin/store.storecategory/category_list/pid/24', '未知', 'GET', '127.0.0.1', 'system', 1570550790, 0);
INSERT INTO `eb_system_log` VALUES (1002, 1, 'admin', 'admin/store.storecategory/create/', '添加产品分类', 'GET', '127.0.0.1', 'system', 1570550796, 0);
INSERT INTO `eb_system_log` VALUES (1003, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570550831, 0);
INSERT INTO `eb_system_log` VALUES (1004, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570550831, 0);
INSERT INTO `eb_system_log` VALUES (1005, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1570550832, 0);
INSERT INTO `eb_system_log` VALUES (1006, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550832, 0);
INSERT INTO `eb_system_log` VALUES (1007, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550833, 0);
INSERT INTO `eb_system_log` VALUES (1008, 1, 'admin', 'admin/store.storecategory/save/', '未知', 'POST', '127.0.0.1', 'system', 1570550837, 0);
INSERT INTO `eb_system_log` VALUES (1009, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570550837, 0);
INSERT INTO `eb_system_log` VALUES (1010, 1, 'admin', 'admin/store.storecategory/category_list/pid/24', '未知', 'GET', '127.0.0.1', 'system', 1570550838, 0);
INSERT INTO `eb_system_log` VALUES (1011, 1, 'admin', 'admin/store.storecategory/create/', '添加产品分类', 'GET', '127.0.0.1', 'system', 1570550846, 0);
INSERT INTO `eb_system_log` VALUES (1012, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570550879, 0);
INSERT INTO `eb_system_log` VALUES (1013, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570550879, 0);
INSERT INTO `eb_system_log` VALUES (1014, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1570550880, 0);
INSERT INTO `eb_system_log` VALUES (1015, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550880, 0);
INSERT INTO `eb_system_log` VALUES (1016, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550881, 0);
INSERT INTO `eb_system_log` VALUES (1017, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/2/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550882, 0);
INSERT INTO `eb_system_log` VALUES (1018, 1, 'admin', 'admin/store.storecategory/save/', '未知', 'POST', '127.0.0.1', 'system', 1570550889, 0);
INSERT INTO `eb_system_log` VALUES (1019, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570550890, 0);
INSERT INTO `eb_system_log` VALUES (1020, 1, 'admin', 'admin/store.storecategory/category_list/pid/24', '未知', 'GET', '127.0.0.1', 'system', 1570550890, 0);
INSERT INTO `eb_system_log` VALUES (1021, 1, 'admin', 'admin/store.storecategory/create/', '添加产品分类', 'GET', '127.0.0.1', 'system', 1570550895, 0);
INSERT INTO `eb_system_log` VALUES (1022, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1570550914, 0);
INSERT INTO `eb_system_log` VALUES (1023, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1570550914, 0);
INSERT INTO `eb_system_log` VALUES (1024, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550915, 0);
INSERT INTO `eb_system_log` VALUES (1025, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550916, 0);
INSERT INTO `eb_system_log` VALUES (1026, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/3/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1570550917, 0);
INSERT INTO `eb_system_log` VALUES (1027, 1, 'admin', 'admin/store.storecategory/save/', '未知', 'POST', '127.0.0.1', 'system', 1570550921, 0);
INSERT INTO `eb_system_log` VALUES (1028, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570550922, 0);
INSERT INTO `eb_system_log` VALUES (1029, 1, 'admin', 'admin/store.storecategory/category_list/pid/24', '未知', 'GET', '127.0.0.1', 'system', 1570550922, 0);
INSERT INTO `eb_system_log` VALUES (1030, 1, 'admin', 'admin/store.storecategory/create/', '添加产品分类', 'GET', '127.0.0.1', 'system', 1570550954, 0);
INSERT INTO `eb_system_log` VALUES (1031, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570550968, 0);
INSERT INTO `eb_system_log` VALUES (1032, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1570550969, 0);
INSERT INTO `eb_system_log` VALUES (1033, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570550972, 0);
INSERT INTO `eb_system_log` VALUES (1034, 1, 'admin', 'admin/store.storecategory/category_list/pid/6', '未知', 'GET', '127.0.0.1', 'system', 1570550972, 0);
INSERT INTO `eb_system_log` VALUES (1035, 1, 'admin', 'admin/store.storecategory/edit/', '编辑产品分类', 'GET', '127.0.0.1', 'system', 1570550981, 0);
INSERT INTO `eb_system_log` VALUES (1036, 1, 'admin', 'admin/store.storecategory/update/id/7', '未知', 'POST', '127.0.0.1', 'system', 1570550994, 0);
INSERT INTO `eb_system_log` VALUES (1037, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570550994, 0);
INSERT INTO `eb_system_log` VALUES (1038, 1, 'admin', 'admin/store.storecategory/category_list/pid/6', '未知', 'GET', '127.0.0.1', 'system', 1570550995, 0);
INSERT INTO `eb_system_log` VALUES (1039, 1, 'admin', 'admin/store.storecategory/delete/', '未知', 'GET', '127.0.0.1', 'system', 1570551000, 0);
INSERT INTO `eb_system_log` VALUES (1040, 1, 'admin', 'admin/store.storecategory/edit/', '编辑产品分类', 'GET', '127.0.0.1', 'system', 1570551003, 0);
INSERT INTO `eb_system_log` VALUES (1041, 1, 'admin', 'admin/store.storecategory/update/id/21', '未知', 'POST', '127.0.0.1', 'system', 1570551011, 0);
INSERT INTO `eb_system_log` VALUES (1042, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570551012, 0);
INSERT INTO `eb_system_log` VALUES (1043, 1, 'admin', 'admin/store.storecategory/category_list/pid/6', '未知', 'GET', '127.0.0.1', 'system', 1570551012, 0);
INSERT INTO `eb_system_log` VALUES (1044, 1, 'admin', 'admin/store.storecategory/delete/', '未知', 'GET', '127.0.0.1', 'system', 1570551017, 0);
INSERT INTO `eb_system_log` VALUES (1045, 1, 'admin', 'admin/store.storecategory/delete/', '未知', 'GET', '127.0.0.1', 'system', 1570551019, 0);
INSERT INTO `eb_system_log` VALUES (1046, 1, 'admin', 'admin/store.storecategory/edit/', '编辑产品分类', 'GET', '127.0.0.1', 'system', 1570551021, 0);
INSERT INTO `eb_system_log` VALUES (1047, 1, 'admin', 'admin/store.storecategory/update/id/8', '未知', 'POST', '127.0.0.1', 'system', 1570551040, 0);
INSERT INTO `eb_system_log` VALUES (1048, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1570551040, 0);
INSERT INTO `eb_system_log` VALUES (1049, 1, 'admin', 'admin/store.storecategory/category_list/pid/6', '未知', 'GET', '127.0.0.1', 'system', 1570551041, 0);
INSERT INTO `eb_system_log` VALUES (1050, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570591115, 0);
INSERT INTO `eb_system_log` VALUES (1051, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570591116, 0);
INSERT INTO `eb_system_log` VALUES (1052, 1, 'admin', 'admin/store.copytaobao/index/', '未知', 'GET', '127.0.0.1', 'system', 1570591166, 0);
INSERT INTO `eb_system_log` VALUES (1053, 1, 'admin', 'admin/store.copytaobao/get_request_contents/', '未知', 'POST', '127.0.0.1', 'system', 1570591169, 0);
INSERT INTO `eb_system_log` VALUES (1054, 1, 'admin', 'admin/store.copytaobao/save_product/', '未知', 'POST', '127.0.0.1', 'system', 1570591213, 0);
INSERT INTO `eb_system_log` VALUES (1055, 1, 'admin', 'admin/store.storeproduct/index/type/2', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570591227, 0);
INSERT INTO `eb_system_log` VALUES (1056, 1, 'admin', 'admin/store.storeproduct/product_ist/type/2', '未知', 'GET', '127.0.0.1', 'system', 1570591227, 0);
INSERT INTO `eb_system_log` VALUES (1057, 1, 'admin', 'admin/store.storeproduct/set_show/is_show/1/id/33', '未知', 'GET', '127.0.0.1', 'system', 1570591230, 0);
INSERT INTO `eb_system_log` VALUES (1058, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570591582, 0);
INSERT INTO `eb_system_log` VALUES (1059, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570591582, 0);
INSERT INTO `eb_system_log` VALUES (1060, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1570591586, 0);
INSERT INTO `eb_system_log` VALUES (1061, 1, 'admin', 'admin/store.storeproduct/update/id/16', '未知', 'POST', '127.0.0.1', 'system', 1570591598, 0);
INSERT INTO `eb_system_log` VALUES (1062, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570591599, 0);
INSERT INTO `eb_system_log` VALUES (1063, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570591600, 0);
INSERT INTO `eb_system_log` VALUES (1064, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1570591605, 0);
INSERT INTO `eb_system_log` VALUES (1065, 1, 'admin', 'admin/store.storeproduct/update/id/17', '未知', 'POST', '127.0.0.1', 'system', 1570591616, 0);
INSERT INTO `eb_system_log` VALUES (1066, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570591616, 0);
INSERT INTO `eb_system_log` VALUES (1067, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570591617, 0);
INSERT INTO `eb_system_log` VALUES (1068, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1570591620, 0);
INSERT INTO `eb_system_log` VALUES (1069, 1, 'admin', 'admin/store.storeproduct/update/id/18', '未知', 'POST', '127.0.0.1', 'system', 1570591629, 0);
INSERT INTO `eb_system_log` VALUES (1070, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570591630, 0);
INSERT INTO `eb_system_log` VALUES (1071, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570591630, 0);
INSERT INTO `eb_system_log` VALUES (1072, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570591640, 0);
INSERT INTO `eb_system_log` VALUES (1073, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570591641, 0);
INSERT INTO `eb_system_log` VALUES (1074, 1, 'admin', 'admin/store.storeproduct/attr/', '未知', 'GET', '127.0.0.1', 'system', 1570591648, 0);
INSERT INTO `eb_system_log` VALUES (1075, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1570591652, 0);
INSERT INTO `eb_system_log` VALUES (1076, 1, 'admin', 'admin/store.storeproduct/update/id/22', '未知', 'POST', '127.0.0.1', 'system', 1570591662, 0);
INSERT INTO `eb_system_log` VALUES (1077, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570591663, 0);
INSERT INTO `eb_system_log` VALUES (1078, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570591663, 0);
INSERT INTO `eb_system_log` VALUES (1079, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1570592098, 0);
INSERT INTO `eb_system_log` VALUES (1080, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570593425, 0);
INSERT INTO `eb_system_log` VALUES (1081, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570593426, 0);
INSERT INTO `eb_system_log` VALUES (1082, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1570594105, 0);
INSERT INTO `eb_system_log` VALUES (1083, 1, 'admin', 'admin/store.storeproduct/update/id/19', '未知', 'POST', '127.0.0.1', 'system', 1570594127, 0);
INSERT INTO `eb_system_log` VALUES (1084, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570594127, 0);
INSERT INTO `eb_system_log` VALUES (1085, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570594128, 0);
INSERT INTO `eb_system_log` VALUES (1086, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1570594132, 0);
INSERT INTO `eb_system_log` VALUES (1087, 1, 'admin', 'admin/store.storeproduct/update/id/21', '未知', 'POST', '127.0.0.1', 'system', 1570594145, 0);
INSERT INTO `eb_system_log` VALUES (1088, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570594145, 0);
INSERT INTO `eb_system_log` VALUES (1089, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570594146, 0);
INSERT INTO `eb_system_log` VALUES (1090, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1570594150, 0);
INSERT INTO `eb_system_log` VALUES (1091, 1, 'admin', 'admin/store.storeproduct/update/id/23', '未知', 'POST', '127.0.0.1', 'system', 1570594159, 0);
INSERT INTO `eb_system_log` VALUES (1092, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570594160, 0);
INSERT INTO `eb_system_log` VALUES (1093, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570594160, 0);
INSERT INTO `eb_system_log` VALUES (1094, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1570594166, 0);
INSERT INTO `eb_system_log` VALUES (1095, 1, 'admin', 'admin/store.storeproduct/update/id/26', '未知', 'POST', '127.0.0.1', 'system', 1570594176, 0);
INSERT INTO `eb_system_log` VALUES (1096, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570594176, 0);
INSERT INTO `eb_system_log` VALUES (1097, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570594176, 0);
INSERT INTO `eb_system_log` VALUES (1098, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1570674290, 0);
INSERT INTO `eb_system_log` VALUES (1099, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1570674290, 0);
INSERT INTO `eb_system_log` VALUES (1100, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1570674290, 0);
INSERT INTO `eb_system_log` VALUES (1101, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1570674300, 0);
INSERT INTO `eb_system_log` VALUES (1102, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1570674300, 0);
INSERT INTO `eb_system_log` VALUES (1103, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1570674303, 0);
INSERT INTO `eb_system_log` VALUES (1104, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1570674303, 0);
INSERT INTO `eb_system_log` VALUES (1105, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1570674315, 0);
INSERT INTO `eb_system_log` VALUES (1106, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1570674315, 0);
INSERT INTO `eb_system_log` VALUES (1107, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1570674321, 0);
INSERT INTO `eb_system_log` VALUES (1108, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1570674321, 0);
INSERT INTO `eb_system_log` VALUES (1109, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1570674326, 0);
INSERT INTO `eb_system_log` VALUES (1110, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1570674326, 0);
INSERT INTO `eb_system_log` VALUES (1111, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1570674329, 0);
INSERT INTO `eb_system_log` VALUES (1112, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1570674329, 0);
INSERT INTO `eb_system_log` VALUES (1113, 1, 'admin', 'admin/user.user/index/', '会员列表页', 'GET', '127.0.0.1', 'system', 1570674333, 0);
INSERT INTO `eb_system_log` VALUES (1114, 1, 'admin', 'admin/user.user/get_user_list/', '未知', 'GET', '127.0.0.1', 'system', 1570674333, 0);
INSERT INTO `eb_system_log` VALUES (1115, 1, 'admin', 'admin/user.usernotice/index/', '未知', 'GET', '127.0.0.1', 'system', 1570674334, 0);
INSERT INTO `eb_system_log` VALUES (1116, 1, 'admin', 'admin/user.usernotice/index/', '未知', 'GET', '127.0.0.1', 'system', 1570674334, 0);
INSERT INTO `eb_system_log` VALUES (1117, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1570685216, 0);
INSERT INTO `eb_system_log` VALUES (1118, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1570685216, 0);
INSERT INTO `eb_system_log` VALUES (1119, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1570685216, 0);
INSERT INTO `eb_system_log` VALUES (1120, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1570685221, 0);
INSERT INTO `eb_system_log` VALUES (1121, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1570685221, 0);
INSERT INTO `eb_system_log` VALUES (1122, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570713682, 0);
INSERT INTO `eb_system_log` VALUES (1123, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570713682, 0);
INSERT INTO `eb_system_log` VALUES (1124, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570713697, 0);
INSERT INTO `eb_system_log` VALUES (1125, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570713698, 0);
INSERT INTO `eb_system_log` VALUES (1126, 1, 'admin', 'admin/setting.systemconfig/index/', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1570714277, 0);
INSERT INTO `eb_system_log` VALUES (1127, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/10/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1570714279, 0);
INSERT INTO `eb_system_log` VALUES (1128, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/5/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1570714294, 0);
INSERT INTO `eb_system_log` VALUES (1129, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/17/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1570714302, 0);
INSERT INTO `eb_system_log` VALUES (1130, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/1/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1570714312, 0);
INSERT INTO `eb_system_log` VALUES (1131, 1, 'admin', 'admin/order.storeorder/favicon.ico/', '未知', 'GET', '127.0.0.1', 'system', 1570721467, 0);
INSERT INTO `eb_system_log` VALUES (1132, 1, 'admin', 'admin/order.storeorder/favicon.ico/', '未知', 'GET', '127.0.0.1', 'system', 1570721484, 0);
INSERT INTO `eb_system_log` VALUES (1133, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1570721539, 0);
INSERT INTO `eb_system_log` VALUES (1134, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1570721550, 0);
INSERT INTO `eb_system_log` VALUES (1135, 1, 'admin', 'admin/store.storeproductreply/get_product_imaes_list/', '未知', 'GET', '127.0.0.1', 'system', 1570721597, 0);
INSERT INTO `eb_system_log` VALUES (1136, 1, 'admin', 'admin/favicon.ico/index/', '未知', 'GET', '127.0.0.1', 'system', 1570757481, 0);
INSERT INTO `eb_system_log` VALUES (1137, 1, 'admin', 'admin/favicon.ico/index/', '未知', 'GET', '127.0.0.1', 'system', 1570757520, 0);
INSERT INTO `eb_system_log` VALUES (1138, 1, 'admin', 'admin/favicon.ico/index/', '未知', 'GET', '127.0.0.1', 'system', 1570757817, 0);
INSERT INTO `eb_system_log` VALUES (1139, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1570857827, 0);
INSERT INTO `eb_system_log` VALUES (1140, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1570857828, 0);
INSERT INTO `eb_system_log` VALUES (1141, 1, 'admin', 'admin/system.express/index/', '物流公司', 'GET', '127.0.0.1', 'system', 1570857837, 0);
INSERT INTO `eb_system_log` VALUES (1142, 1, 'admin', 'admin/setting.systemconfig/index/', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1570857838, 0);
INSERT INTO `eb_system_log` VALUES (1143, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/5/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1570857897, 0);
INSERT INTO `eb_system_log` VALUES (1144, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/10/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1570857935, 0);
INSERT INTO `eb_system_log` VALUES (1145, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/17/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1570857943, 0);
INSERT INTO `eb_system_log` VALUES (1146, 1, 'admin', 'admin/record.record/chart_order/', '订单统计', 'GET', '127.0.0.1', 'system', 1570858305, 0);
INSERT INTO `eb_system_log` VALUES (1147, 1, 'admin', 'admin/record.record/get_echarts_order/', '未知', 'GET', '127.0.0.1', 'system', 1570858306, 0);
INSERT INTO `eb_system_log` VALUES (1148, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1570858314, 0);
INSERT INTO `eb_system_log` VALUES (1149, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1570858314, 0);
INSERT INTO `eb_system_log` VALUES (1150, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1570858315, 0);
INSERT INTO `eb_system_log` VALUES (1151, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1570858318, 0);
INSERT INTO `eb_system_log` VALUES (1152, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1570858318, 0);
INSERT INTO `eb_system_log` VALUES (1153, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1571840408, 0);
INSERT INTO `eb_system_log` VALUES (1154, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1571840408, 0);
INSERT INTO `eb_system_log` VALUES (1155, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1571840408, 0);
INSERT INTO `eb_system_log` VALUES (1156, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1571840411, 0);
INSERT INTO `eb_system_log` VALUES (1157, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1571840411, 0);
INSERT INTO `eb_system_log` VALUES (1158, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1571840412, 0);
INSERT INTO `eb_system_log` VALUES (1159, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1571840413, 0);
INSERT INTO `eb_system_log` VALUES (1160, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1571840872, 0);
INSERT INTO `eb_system_log` VALUES (1161, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1571840872, 0);
INSERT INTO `eb_system_log` VALUES (1162, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1571918243, 0);
INSERT INTO `eb_system_log` VALUES (1163, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1571918243, 0);
INSERT INTO `eb_system_log` VALUES (1164, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1571918245, 0);
INSERT INTO `eb_system_log` VALUES (1165, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1571918245, 0);
INSERT INTO `eb_system_log` VALUES (1166, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1571918257, 0);
INSERT INTO `eb_system_log` VALUES (1167, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1571919123, 0);
INSERT INTO `eb_system_log` VALUES (1168, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1571919124, 0);
INSERT INTO `eb_system_log` VALUES (1169, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1571919126, 0);
INSERT INTO `eb_system_log` VALUES (1170, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1571919126, 0);
INSERT INTO `eb_system_log` VALUES (1171, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1571919126, 0);
INSERT INTO `eb_system_log` VALUES (1172, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1571919130, 0);
INSERT INTO `eb_system_log` VALUES (1173, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1571919130, 0);
INSERT INTO `eb_system_log` VALUES (1174, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1571919143, 0);
INSERT INTO `eb_system_log` VALUES (1175, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1571919143, 0);
INSERT INTO `eb_system_log` VALUES (1176, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1571919144, 0);
INSERT INTO `eb_system_log` VALUES (1177, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1571919145, 0);
INSERT INTO `eb_system_log` VALUES (1178, 1, 'admin', 'admin/store.storecategory/create/', '添加产品分类', 'GET', '127.0.0.1', 'system', 1571919146, 0);
INSERT INTO `eb_system_log` VALUES (1179, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1571919150, 0);
INSERT INTO `eb_system_log` VALUES (1180, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1571919150, 0);
INSERT INTO `eb_system_log` VALUES (1181, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1571919151, 0);
INSERT INTO `eb_system_log` VALUES (1182, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1571919152, 0);
INSERT INTO `eb_system_log` VALUES (1183, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1571919162, 0);
INSERT INTO `eb_system_log` VALUES (1184, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1571919162, 0);
INSERT INTO `eb_system_log` VALUES (1185, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1571919162, 0);
INSERT INTO `eb_system_log` VALUES (1186, 1, 'admin', 'admin/store.storeproductreply/index/', '评论管理展示页', 'GET', '127.0.0.1', 'system', 1571919164, 0);
INSERT INTO `eb_system_log` VALUES (1187, 1, 'admin', 'admin/store.storeproductreply/get_product_imaes_list/', '未知', 'GET', '127.0.0.1', 'system', 1571919165, 0);
INSERT INTO `eb_system_log` VALUES (1188, 1, 'admin', 'admin/store.storeproductreply/get_product_reply_list/', '未知', 'GET', '127.0.0.1', 'system', 1571919165, 0);
INSERT INTO `eb_system_log` VALUES (1189, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1571929699, 0);
INSERT INTO `eb_system_log` VALUES (1190, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1571929700, 0);
INSERT INTO `eb_system_log` VALUES (1191, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1571929700, 0);
INSERT INTO `eb_system_log` VALUES (1192, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1571929704, 0);
INSERT INTO `eb_system_log` VALUES (1193, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1571929704, 0);
INSERT INTO `eb_system_log` VALUES (1194, 1, 'admin', 'admin/store.storecategory/index/', '产品分类展示页', 'GET', '127.0.0.1', 'system', 1571929705, 0);
INSERT INTO `eb_system_log` VALUES (1195, 1, 'admin', 'admin/store.storecategory/category_list/pid/0', '未知', 'GET', '127.0.0.1', 'system', 1571929706, 0);
INSERT INTO `eb_system_log` VALUES (1196, 1, 'admin', 'admin/store.storecategory/create/', '添加产品分类', 'GET', '127.0.0.1', 'system', 1571929710, 0);
INSERT INTO `eb_system_log` VALUES (1197, 1, 'admin', 'admin/setting.systemconfig/index/type/3/tab_id/9', '分销配置', 'GET', '127.0.0.1', 'system', 1571929722, 0);
INSERT INTO `eb_system_log` VALUES (1198, 1, 'admin', 'admin/agent.agentmanage/index/', '分销管理列表页', 'GET', '127.0.0.1', 'system', 1571929727, 0);
INSERT INTO `eb_system_log` VALUES (1199, 1, 'admin', 'admin/agent.agentmanage/get_spread_list/', '未知', 'GET', '127.0.0.1', 'system', 1571929727, 0);
INSERT INTO `eb_system_log` VALUES (1200, 1, 'admin', 'admin/agent.agentmanage/get_badge/', '未知', 'POST', '127.0.0.1', 'system', 1571929728, 0);
INSERT INTO `eb_system_log` VALUES (1201, 1, 'admin', 'admin/user.user/index/', '会员列表页', 'GET', '127.0.0.1', 'system', 1571929729, 0);
INSERT INTO `eb_system_log` VALUES (1202, 1, 'admin', 'admin/user.user/get_user_list/', '未知', 'GET', '127.0.0.1', 'system', 1571929729, 0);
INSERT INTO `eb_system_log` VALUES (1203, 1, 'admin', 'admin/user.usernotice/index/', '未知', 'GET', '127.0.0.1', 'system', 1571929730, 0);
INSERT INTO `eb_system_log` VALUES (1204, 1, 'admin', 'admin/user.usernotice/index/', '未知', 'GET', '127.0.0.1', 'system', 1571929730, 0);
INSERT INTO `eb_system_log` VALUES (1205, 1, 'admin', 'admin/user.userlevel/index/', '未知', 'GET', '127.0.0.1', 'system', 1571929731, 0);
INSERT INTO `eb_system_log` VALUES (1206, 1, 'admin', 'admin/user.userlevel/get_system_vip_list/', '未知', 'GET', '127.0.0.1', 'system', 1571929732, 0);
INSERT INTO `eb_system_log` VALUES (1207, 1, 'admin', 'admin/store.storeproductreply/index/', '评论管理展示页', 'GET', '127.0.0.1', 'system', 1571929736, 0);
INSERT INTO `eb_system_log` VALUES (1208, 1, 'admin', 'admin/store.storeproductreply/get_product_imaes_list/', '未知', 'GET', '127.0.0.1', 'system', 1571929737, 0);
INSERT INTO `eb_system_log` VALUES (1209, 1, 'admin', 'admin/store.storeproductreply/get_product_reply_list/', '未知', 'GET', '127.0.0.1', 'system', 1571929737, 0);
INSERT INTO `eb_system_log` VALUES (1210, 1, 'admin', 'admin/finance.userextract/index/', '未知', 'GET', '127.0.0.1', 'system', 1571929744, 0);
INSERT INTO `eb_system_log` VALUES (1211, 1, 'admin', 'admin/finance.userrecharge/index/', '充值记录', 'GET', '127.0.0.1', 'system', 1571929747, 0);
INSERT INTO `eb_system_log` VALUES (1212, 1, 'admin', 'admin/finance.finance/bill/', '资金监控', 'GET', '127.0.0.1', 'system', 1571929748, 0);
INSERT INTO `eb_system_log` VALUES (1213, 1, 'admin', 'admin/finance.finance/billlist/', '未知', 'GET', '127.0.0.1', 'system', 1571929748, 0);
INSERT INTO `eb_system_log` VALUES (1214, 1, 'admin', 'admin/finance.finance/commission_list/', '佣金记录', 'GET', '127.0.0.1', 'system', 1571929750, 0);
INSERT INTO `eb_system_log` VALUES (1215, 1, 'admin', 'admin/finance.finance/get_commission_list/', '未知', 'GET', '127.0.0.1', 'system', 1571929751, 0);
INSERT INTO `eb_system_log` VALUES (1216, 1, 'admin', 'admin/record.record/chart_order/', '订单统计', 'GET', '127.0.0.1', 'system', 1571929754, 0);
INSERT INTO `eb_system_log` VALUES (1217, 1, 'admin', 'admin/record.record/get_echarts_order/', '未知', 'GET', '127.0.0.1', 'system', 1571929754, 0);
INSERT INTO `eb_system_log` VALUES (1218, 1, 'admin', 'admin/record.record/chart_product/', '产品统计', 'GET', '127.0.0.1', 'system', 1571929755, 0);
INSERT INTO `eb_system_log` VALUES (1219, 1, 'admin', 'admin/record.record/get_echarts_maxlist/', '未知', 'GET', '127.0.0.1', 'system', 1571929755, 0);
INSERT INTO `eb_system_log` VALUES (1220, 1, 'admin', 'admin/record.record/get_echarts_profity/', '未知', 'GET', '127.0.0.1', 'system', 1571929756, 0);
INSERT INTO `eb_system_log` VALUES (1221, 1, 'admin', 'admin/record.record/get_echarts_product/', '未知', 'GET', '127.0.0.1', 'system', 1571929756, 0);
INSERT INTO `eb_system_log` VALUES (1222, 1, 'admin', 'admin/record.record/getnegativelist/', '未知', 'GET', '127.0.0.1', 'system', 1571929756, 0);
INSERT INTO `eb_system_log` VALUES (1223, 1, 'admin', 'admin/record.record/gettuiprieslist/', '未知', 'GET', '127.0.0.1', 'system', 1571929756, 0);
INSERT INTO `eb_system_log` VALUES (1224, 1, 'admin', 'admin/record.record/getlacklist/', '未知', 'GET', '127.0.0.1', 'system', 1571929756, 0);
INSERT INTO `eb_system_log` VALUES (1225, 1, 'admin', 'admin/record.record/chart_score/', '积分统计', 'GET', '127.0.0.1', 'system', 1571929757, 0);
INSERT INTO `eb_system_log` VALUES (1226, 1, 'admin', 'admin/record.record/getscorebadgelist/', '未知', 'GET', '127.0.0.1', 'system', 1571929758, 0);
INSERT INTO `eb_system_log` VALUES (1227, 1, 'admin', 'admin/record.record/getscorecurve/', '未知', 'GET', '127.0.0.1', 'system', 1571929758, 0);
INSERT INTO `eb_system_log` VALUES (1228, 1, 'admin', 'admin/record.record/chart_coupon/', '优惠券统计', 'GET', '127.0.0.1', 'system', 1571929759, 0);
INSERT INTO `eb_system_log` VALUES (1229, 1, 'admin', 'admin/record.record/getconponcurve/', '未知', 'GET', '127.0.0.1', 'system', 1571929759, 0);
INSERT INTO `eb_system_log` VALUES (1230, 1, 'admin', 'admin/record.record/getcouponbadgelist/', '未知', 'GET', '127.0.0.1', 'system', 1571929759, 0);
INSERT INTO `eb_system_log` VALUES (1231, 1, 'admin', 'admin/record.record/chart_cash/', '提现统计', 'GET', '127.0.0.1', 'system', 1571929764, 0);
INSERT INTO `eb_system_log` VALUES (1232, 1, 'admin', 'admin/record.record/getextracthead/', '未知', 'GET', '127.0.0.1', 'system', 1571929764, 0);
INSERT INTO `eb_system_log` VALUES (1233, 1, 'admin', 'admin/record.record/getextractdata/', '未知', 'GET', '127.0.0.1', 'system', 1571929764, 0);
INSERT INTO `eb_system_log` VALUES (1234, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1572401036, 0);
INSERT INTO `eb_system_log` VALUES (1235, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1572401037, 0);
INSERT INTO `eb_system_log` VALUES (1236, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/48', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1572401052, 0);
INSERT INTO `eb_system_log` VALUES (1237, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/47', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1572401054, 0);
INSERT INTO `eb_system_log` VALUES (1238, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/55', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1572401059, 0);
INSERT INTO `eb_system_log` VALUES (1239, 1, 'admin', 'admin/setting.systemconfig/index/', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1572401242, 0);
INSERT INTO `eb_system_log` VALUES (1240, 1, 'admin', 'admin/setting.systemconfig/save_basics/', '提交保存配置列表', 'POST', '127.0.0.1', 'system', 1572401251, 0);
INSERT INTO `eb_system_log` VALUES (1241, 1, 'admin', 'admin/setting.systemconfig/index/', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1572401252, 0);
INSERT INTO `eb_system_log` VALUES (1242, 1, 'admin', 'admin/setting.systemgroupdata/edit/gid/48/id/104', '编辑数据', 'GET', '127.0.0.1', 'system', 1572401433, 0);
INSERT INTO `eb_system_log` VALUES (1243, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1572401437, 0);
INSERT INTO `eb_system_log` VALUES (1244, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1572401437, 0);
INSERT INTO `eb_system_log` VALUES (1245, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1572401437, 0);
INSERT INTO `eb_system_log` VALUES (1246, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1572401437, 0);
INSERT INTO `eb_system_log` VALUES (1247, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1572401438, 0);
INSERT INTO `eb_system_log` VALUES (1248, 1, 'admin', 'admin/widget.images/get_image_list/pid/8/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1572401440, 0);
INSERT INTO `eb_system_log` VALUES (1249, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1572401442, 0);
INSERT INTO `eb_system_log` VALUES (1250, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '127.0.0.1', 'system', 1572401459, 0);
INSERT INTO `eb_system_log` VALUES (1251, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '127.0.0.1', 'system', 1572401459, 0);
INSERT INTO `eb_system_log` VALUES (1252, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '127.0.0.1', 'system', 1572401460, 0);
INSERT INTO `eb_system_log` VALUES (1253, 1, 'admin', 'admin/widget.images/upload/', '上传图片', 'POST', '127.0.0.1', 'system', 1572401460, 0);
INSERT INTO `eb_system_log` VALUES (1254, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1572401460, 0);
INSERT INTO `eb_system_log` VALUES (1255, 1, 'admin', 'admin/setting.systemgroupdata/update/id/104', '提交修改数据', 'POST', '127.0.0.1', 'system', 1572401485, 0);
INSERT INTO `eb_system_log` VALUES (1256, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/48', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1572401485, 0);
INSERT INTO `eb_system_log` VALUES (1257, 1, 'admin', 'admin/setting.systemgroupdata/edit/gid/48/id/169', '编辑数据', 'GET', '127.0.0.1', 'system', 1572401488, 0);
INSERT INTO `eb_system_log` VALUES (1258, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1572401490, 0);
INSERT INTO `eb_system_log` VALUES (1259, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1572401490, 0);
INSERT INTO `eb_system_log` VALUES (1260, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1572401491, 0);
INSERT INTO `eb_system_log` VALUES (1261, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1572401491, 0);
INSERT INTO `eb_system_log` VALUES (1262, 1, 'admin', 'admin/widget.images/editcate/id/9', '编辑分类展示', 'GET', '127.0.0.1', 'system', 1572401492, 0);
INSERT INTO `eb_system_log` VALUES (1263, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1572401495, 0);
INSERT INTO `eb_system_log` VALUES (1264, 1, 'admin', 'admin/setting.systemgroupdata/update/id/169', '提交修改数据', 'POST', '127.0.0.1', 'system', 1572401504, 0);
INSERT INTO `eb_system_log` VALUES (1265, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/48', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1572401504, 0);
INSERT INTO `eb_system_log` VALUES (1266, 1, 'admin', 'admin/setting.systemgroupdata/edit/gid/48/id/170', '编辑数据', 'GET', '127.0.0.1', 'system', 1572401506, 0);
INSERT INTO `eb_system_log` VALUES (1267, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1572401509, 0);
INSERT INTO `eb_system_log` VALUES (1268, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1572401509, 0);
INSERT INTO `eb_system_log` VALUES (1269, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1572401509, 0);
INSERT INTO `eb_system_log` VALUES (1270, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1572401510, 0);
INSERT INTO `eb_system_log` VALUES (1271, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1572401511, 0);
INSERT INTO `eb_system_log` VALUES (1272, 1, 'admin', 'admin/setting.systemgroupdata/update/id/170', '提交修改数据', 'POST', '127.0.0.1', 'system', 1572401516, 0);
INSERT INTO `eb_system_log` VALUES (1273, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/48', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1572401516, 0);
INSERT INTO `eb_system_log` VALUES (1274, 1, 'admin', 'admin/setting.systemgroupdata/edit/gid/48/id/171', '编辑数据', 'GET', '127.0.0.1', 'system', 1572401556, 0);
INSERT INTO `eb_system_log` VALUES (1275, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1572401558, 0);
INSERT INTO `eb_system_log` VALUES (1276, 1, 'admin', 'admin/widget.images/index/fodder/pic', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1572401558, 0);
INSERT INTO `eb_system_log` VALUES (1277, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1572401558, 0);
INSERT INTO `eb_system_log` VALUES (1278, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1572401558, 0);
INSERT INTO `eb_system_log` VALUES (1279, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1572401560, 0);
INSERT INTO `eb_system_log` VALUES (1280, 1, 'admin', 'admin/setting.systemgroupdata/update/id/171', '提交修改数据', 'POST', '127.0.0.1', 'system', 1572401563, 0);
INSERT INTO `eb_system_log` VALUES (1281, 1, 'admin', 'admin/setting.systemgroupdata/index/gid/48', '配置组合数据附加权限', 'GET', '127.0.0.1', 'system', 1572401564, 0);
INSERT INTO `eb_system_log` VALUES (1282, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1572402818, 0);
INSERT INTO `eb_system_log` VALUES (1283, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1572402818, 0);
INSERT INTO `eb_system_log` VALUES (1284, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1572402822, 0);
INSERT INTO `eb_system_log` VALUES (1285, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1572402843, 0);
INSERT INTO `eb_system_log` VALUES (1286, 1, 'admin', 'admin/store.storeproduct/update/id/17', '未知', 'POST', '127.0.0.1', 'system', 1572402855, 0);
INSERT INTO `eb_system_log` VALUES (1287, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1572402855, 0);
INSERT INTO `eb_system_log` VALUES (1288, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1572402856, 0);
INSERT INTO `eb_system_log` VALUES (1289, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1572403996, 0);
INSERT INTO `eb_system_log` VALUES (1290, 1, 'admin', 'admin/setting.systemconfig/index/', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1572404013, 0);
INSERT INTO `eb_system_log` VALUES (1291, 1, 'admin', 'admin/system.express/index/', '物流公司', 'GET', '127.0.0.1', 'system', 1572404014, 0);
INSERT INTO `eb_system_log` VALUES (1292, 1, 'admin', 'admin/setting.systemmenus/index/', '菜单管理展示页', 'GET', '127.0.0.1', 'system', 1572404018, 0);
INSERT INTO `eb_system_log` VALUES (1293, 1, 'admin', 'admin/setting.systemmenus/edit/id/476', '编辑菜单', 'GET', '127.0.0.1', 'system', 1572404022, 0);
INSERT INTO `eb_system_log` VALUES (1294, 1, 'admin', 'admin/order.storeorder/index/', '订单管理', 'GET', '127.0.0.1', 'system', 1572404069, 0);
INSERT INTO `eb_system_log` VALUES (1295, 1, 'admin', 'admin/order.storeorder/order_list/', '未知', 'GET', '127.0.0.1', 'system', 1572404069, 0);
INSERT INTO `eb_system_log` VALUES (1296, 1, 'admin', 'admin/order.storeorder/getbadge/', '未知', 'POST', '127.0.0.1', 'system', 1572404069, 0);
INSERT INTO `eb_system_log` VALUES (1297, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1572404072, 0);
INSERT INTO `eb_system_log` VALUES (1298, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1572404072, 0);
INSERT INTO `eb_system_log` VALUES (1299, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1572404074, 0);
INSERT INTO `eb_system_log` VALUES (1300, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1572405010, 0);
INSERT INTO `eb_system_log` VALUES (1301, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1572405024, 0);
INSERT INTO `eb_system_log` VALUES (1302, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1572405053, 0);
INSERT INTO `eb_system_log` VALUES (1303, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1572405182, 0);
INSERT INTO `eb_system_log` VALUES (1304, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1572405227, 0);
INSERT INTO `eb_system_log` VALUES (1305, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1572405306, 0);
INSERT INTO `eb_system_log` VALUES (1306, 1, 'admin', 'admin/store.storeproduct/create/', '未知', 'GET', '127.0.0.1', 'system', 1572405347, 0);
INSERT INTO `eb_system_log` VALUES (1307, 1, 'admin', 'admin/widget.images/index/fodder/image', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1572405369, 0);
INSERT INTO `eb_system_log` VALUES (1308, 1, 'admin', 'admin/widget.images/index/fodder/image', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1572405369, 0);
INSERT INTO `eb_system_log` VALUES (1309, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1572405369, 0);
INSERT INTO `eb_system_log` VALUES (1310, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1572405369, 0);
INSERT INTO `eb_system_log` VALUES (1311, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1572405371, 0);
INSERT INTO `eb_system_log` VALUES (1312, 1, 'admin', 'admin/widget.images/index/fodder/slider_image', '附件管理展示页', 'GET', '127.0.0.1', 'system', 1572405377, 0);
INSERT INTO `eb_system_log` VALUES (1313, 1, 'admin', 'admin/widget.images/get_image_cate/', '未知', 'GET', '127.0.0.1', 'system', 1572405378, 0);
INSERT INTO `eb_system_log` VALUES (1314, 1, 'admin', 'admin/widget.images/get_image_list/pid/0/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1572405378, 0);
INSERT INTO `eb_system_log` VALUES (1315, 1, 'admin', 'admin/widget.images/get_image_list/pid/9/page/1/limit/18', '未知', 'GET', '127.0.0.1', 'system', 1572405380, 0);
INSERT INTO `eb_system_log` VALUES (1316, 1, 'admin', 'admin/store.storeproduct/save/', '未知', 'POST', '127.0.0.1', 'system', 1572405392, 0);
INSERT INTO `eb_system_log` VALUES (1317, 1, 'admin', 'admin/store.storeproduct/save/', '未知', 'POST', '127.0.0.1', 'system', 1572405400, 0);
INSERT INTO `eb_system_log` VALUES (1318, 1, 'admin', 'admin/store.storeproduct/save/', '未知', 'POST', '127.0.0.1', 'system', 1572405445, 0);
INSERT INTO `eb_system_log` VALUES (1319, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1572405445, 0);
INSERT INTO `eb_system_log` VALUES (1320, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1572405446, 0);
INSERT INTO `eb_system_log` VALUES (1321, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1572406345, 0);
INSERT INTO `eb_system_log` VALUES (1322, 1, 'admin', 'admin/store.storeproduct/update/id/16', '未知', 'POST', '127.0.0.1', 'system', 1572406358, 0);
INSERT INTO `eb_system_log` VALUES (1323, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1572406358, 0);
INSERT INTO `eb_system_log` VALUES (1324, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1572406359, 0);
INSERT INTO `eb_system_log` VALUES (1325, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1572406361, 0);
INSERT INTO `eb_system_log` VALUES (1326, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1572407173, 0);
INSERT INTO `eb_system_log` VALUES (1327, 1, 'admin', 'admin/store.storeproduct/update/id/17', '未知', 'POST', '127.0.0.1', 'system', 1572407191, 0);
INSERT INTO `eb_system_log` VALUES (1328, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1572407192, 0);
INSERT INTO `eb_system_log` VALUES (1329, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1572407192, 0);
INSERT INTO `eb_system_log` VALUES (1330, 1, 'admin', 'admin/store.storeproduct/attr/', '未知', 'GET', '127.0.0.1', 'system', 1572416102, 0);
INSERT INTO `eb_system_log` VALUES (1331, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1572416107, 0);
INSERT INTO `eb_system_log` VALUES (1332, 1, 'admin', 'admin/store.storeproduct/update/id/32', '未知', 'POST', '127.0.0.1', 'system', 1572416123, 0);
INSERT INTO `eb_system_log` VALUES (1333, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1572416123, 0);
INSERT INTO `eb_system_log` VALUES (1334, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1572416124, 0);
INSERT INTO `eb_system_log` VALUES (1335, 1, 'admin', 'admin/store.storeproduct/index/type/1', '产品管理展示页', 'GET', '127.0.0.1', 'system', 1572426417, 0);
INSERT INTO `eb_system_log` VALUES (1336, 1, 'admin', 'admin/store.storeproduct/product_ist/type/1', '未知', 'GET', '127.0.0.1', 'system', 1572426417, 0);
INSERT INTO `eb_system_log` VALUES (1337, 1, 'admin', 'admin/store.storeproduct/edit/', '未知', 'GET', '127.0.0.1', 'system', 1572426422, 0);
INSERT INTO `eb_system_log` VALUES (1338, 1, 'admin', 'admin/setting.systemconfig/index/', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1572427451, 0);
INSERT INTO `eb_system_log` VALUES (1339, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/17/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1572427454, 0);
INSERT INTO `eb_system_log` VALUES (1340, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/5/type/0', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1572427455, 0);
INSERT INTO `eb_system_log` VALUES (1341, 1, 'admin', 'admin/setting.systemconfig/index/type/2/tab_id/7', '小程序配置', 'GET', '127.0.0.1', 'system', 1572427467, 0);
INSERT INTO `eb_system_log` VALUES (1342, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/14/type/2', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1572427468, 0);
INSERT INTO `eb_system_log` VALUES (1343, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/16/type/2', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1572427469, 0);
INSERT INTO `eb_system_log` VALUES (1344, 1, 'admin', 'admin/setting.systemconfig/save_basics/', '提交保存配置列表', 'POST', '127.0.0.1', 'system', 1572427485, 0);
INSERT INTO `eb_system_log` VALUES (1345, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/16/type/2', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1572427485, 0);
INSERT INTO `eb_system_log` VALUES (1346, 1, 'admin', 'admin/setting.systemconfig/index/type/2/tab_id/7', '小程序配置', 'GET', '127.0.0.1', 'system', 1572438981, 0);
INSERT INTO `eb_system_log` VALUES (1347, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/14/type/2', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1572438982, 0);
INSERT INTO `eb_system_log` VALUES (1348, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/16/type/2', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1572438982, 0);
INSERT INTO `eb_system_log` VALUES (1349, 1, 'admin', 'admin/setting.systemconfig/save_basics/', '提交保存配置列表', 'POST', '127.0.0.1', 'system', 1572438986, 0);
INSERT INTO `eb_system_log` VALUES (1350, 1, 'admin', 'admin/setting.systemconfig/index/tab_id/16/type/2', '配置列表展示页', 'GET', '127.0.0.1', 'system', 1572438987, 0);

-- ----------------------------
-- Table structure for eb_system_menus
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_menus`;
CREATE TABLE `eb_system_menus`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `pid` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级id',
  `icon` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图标',
  `menu_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '按钮名',
  `module` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '模块名',
  `controller` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '控制器',
  `action` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '方法名',
  `params` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '[]' COMMENT '参数',
  `sort` tinyint(3) NOT NULL DEFAULT 1 COMMENT '排序',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示',
  `access` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '子管理员是否可用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `is_show`(`is_show`) USING BTREE,
  INDEX `access`(`access`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 478 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_menus
-- ----------------------------
INSERT INTO `eb_system_menus` VALUES (1, 289, '', '系统设置', 'admin', 'setting.systemConfig', 'index', '[]', 90, 1, 1);
INSERT INTO `eb_system_menus` VALUES (2, 153, '', '权限规则', 'admin', 'setting.systemMenus', 'index', '[]', 7, 1, 1);
INSERT INTO `eb_system_menus` VALUES (4, 153, '', '管理员列表', 'admin', 'setting.systemAdmin', 'index', '[]', 9, 1, 1);
INSERT INTO `eb_system_menus` VALUES (7, 467, '', '配置分类', 'admin', 'setting.systemConfigTab', 'index', '[]', 1, 1, 1);
INSERT INTO `eb_system_menus` VALUES (8, 153, '', '身份管理', 'admin', 'setting.systemRole', 'index', '[]', 10, 1, 1);
INSERT INTO `eb_system_menus` VALUES (9, 467, '', '组合数据', 'admin', 'setting.systemGroup', 'index', '[]', 1, 1, 1);
INSERT INTO `eb_system_menus` VALUES (11, 0, 'wechat', '公众号', 'admin', 'wechat', 'index', '[]', 91, 1, 1);
INSERT INTO `eb_system_menus` VALUES (12, 354, '', '微信关注回复', 'admin', 'wechat.reply', 'index', '{\"key\":\"subscribe\",\"title\":\"\\u7f16\\u8f91\\u65e0\\u914d\\u7f6e\\u9ed8\\u8ba4\\u56de\\u590d\"}', 86, 1, 1);
INSERT INTO `eb_system_menus` VALUES (17, 360, '', '微信菜单', 'admin', 'wechat.menus', 'index', '[]', 95, 1, 1);
INSERT INTO `eb_system_menus` VALUES (19, 11, '', '图文管理', 'admin', 'wechat.wechatNewsCategory', 'index', '[]', 60, 1, 1);
INSERT INTO `eb_system_menus` VALUES (21, 0, 'magic', '维护', 'admin', 'system', 'index', '[]', 1, 1, 1);
INSERT INTO `eb_system_menus` VALUES (23, 0, 'laptop', '商品', 'admin', 'store', 'index', '[]', 110, 1, 1);
INSERT INTO `eb_system_menus` VALUES (24, 23, '', '商品管理', 'admin', 'store.storeProduct', 'index', '{\"type\":\"1\"}', 100, 1, 1);
INSERT INTO `eb_system_menus` VALUES (25, 23, '', '商品分类', 'admin', 'store.storeCategory', 'index', '[]', 1, 1, 1);
INSERT INTO `eb_system_menus` VALUES (26, 285, '', '订单管理', 'admin', 'order.storeOrder', 'index', '[]', 1, 1, 1);
INSERT INTO `eb_system_menus` VALUES (30, 354, '', '关键字回复', 'admin', 'wechat.reply', 'keyword', '[]', 85, 1, 1);
INSERT INTO `eb_system_menus` VALUES (31, 354, '', '无效关键词回复', 'admin', 'wechat.reply', 'index', '{\"key\":\"default\",\"title\":\"\\u7f16\\u8f91\\u65e0\\u6548\\u5173\\u952e\\u5b57\\u9ed8\\u8ba4\\u56de\\u590d\"}', 84, 1, 1);
INSERT INTO `eb_system_menus` VALUES (33, 284, '', '附加权限', 'admin', 'article.articleCategory', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (34, 33, '', '添加文章分类', 'admin', 'article.articleCategory', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (35, 33, '', '编辑文章分类', 'admin', 'article.articleCategory', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (36, 33, '', '删除文章分类', 'admin', 'article.articleCategory', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (37, 31, '', '附加权限', 'admin', 'wechat.reply', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (38, 283, '', '附加权限', 'admin', 'article.article', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (39, 38, '', '添加文章', 'admin', 'article. article', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (40, 38, '', '编辑文章', 'admin', 'article. article', 'add_new', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (41, 38, '', '删除文章', 'admin', 'article. article', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (42, 19, '', '附加权限', 'admin', 'wechat.wechatNewsCategory', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (43, 42, '', '添加图文消息', 'admin', 'wechat.wechatNewsCategory', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (44, 42, '', '编辑图文消息', 'admin', 'wechat.wechatNewsCategory', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (45, 42, '', '删除图文消息', 'admin', 'wechat.wechatNewsCategory', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (46, 7, '', '配置分类附加权限', 'admin', 'setting.systemConfigTab', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (47, 46, '', '添加配置分类', 'admin', 'setting.systemConfigTab', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (48, 117, '', '添加配置', 'admin', 'setting.systemConfig', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (49, 46, '', '编辑配置分类', 'admin', 'setting.systemConfigTab', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (50, 46, '', '删除配置分类', 'admin', 'setting.systemConfigTab', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (51, 46, '', '查看子字段', 'admin', 'system.systemConfigTab', 'sonConfigTab', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (52, 9, '', '组合数据附加权限', 'admin', 'setting.systemGroup', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (53, 468, '', '添加数据', 'admin', 'setting.systemGroupData', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (54, 468, '', '编辑数据', 'admin', 'setting.systemGroupData', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (55, 468, '', '删除数据', 'admin', 'setting.systemGroupData', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (56, 468, '', '数据列表', 'admin', 'setting.systemGroupData', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (57, 52, '', '添加数据组', 'admin', 'setting.systemGroup', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (58, 52, '', '删除数据组', 'admin', 'setting.systemGroup', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (59, 4, '', '管理员列表附加权限', 'admin', 'setting.systemAdmin', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (60, 59, '', '添加管理员', 'admin', 'setting.systemAdmin', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (61, 59, '', '编辑管理员', 'admin', 'setting.systemAdmin', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (62, 59, '', '删除管理员', 'admin', 'setting.systemAdmin', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (63, 8, '', '身份管理附加权限', 'admin', 'setting.systemRole', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (64, 63, '', '添加身份', 'admin', 'setting.systemRole', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (65, 63, '', '修改身份', 'admin', 'setting.systemRole', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (66, 63, '', '删除身份', 'admin', 'setting.systemRole', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (67, 8, '', '身份管理展示页', 'admin', 'setting.systemRole', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (68, 4, '', '管理员列表展示页', 'admin', 'setting.systemAdmin', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (69, 7, '', '配置分类展示页', 'admin', 'setting.systemConfigTab', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (70, 9, '', '组合数据展示页', 'admin', 'setting.systemGroup', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (71, 284, '', '文章分类管理展示页', 'admin', 'article.articleCategory', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (72, 283, '', '文章管理展示页', 'admin', 'article.article', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (73, 19, '', '图文消息展示页', 'admin', 'wechat.wechatNewsCategory', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (74, 2, '', '菜单管理附加权限', 'admin', 'setting.systemMenus', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (75, 74, '', '添加菜单', 'admin', 'setting.systemMenus', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (76, 74, '', '编辑菜单', 'admin', 'setting.systemMenus', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (77, 74, '', '删除菜单', 'admin', 'setting.systemMenus', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (78, 2, '', '菜单管理展示页', 'admin', 'setting.systemMenus', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (80, 0, 'leanpub', '内容', 'admin', 'article', 'index', '[]', 90, 1, 1);
INSERT INTO `eb_system_menus` VALUES (82, 11, '', '微信用户管理', 'admin', 'user', 'list', '[]', 5, 1, 1);
INSERT INTO `eb_system_menus` VALUES (84, 82, '', '用户标签', 'admin', 'wechat.wechatUser', 'tag', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (89, 30, '', '关键字回复附加权限', 'admin', 'wechat.reply', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (90, 89, '', '添加关键字', 'admin', 'wechat.reply', 'add_keyword', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (91, 89, '', '修改关键字', 'admin', 'wechat.reply', 'info_keyword', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (92, 89, '', '删除关键字', 'admin', 'wechat.reply', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (93, 30, '', '关键字回复展示页', 'admin', 'wechat.reply', 'keyword', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (94, 31, '', '无效关键词回复展示页', 'admin', 'wechat.reply', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (95, 31, '', '无效关键词回复附加权限', 'admin', 'wechat.reply', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (96, 95, '', '无效关键词回复提交按钮', 'admin', 'wechat.reply', 'save', '{\"key\":\"default\",\"title\":\"编辑无效关键字默认回复\"}', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (97, 12, '', '微信关注回复展示页', 'admin', 'wechat.reply', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (98, 12, '', '微信关注回复附加权限', 'admin', 'wechat.reply', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (99, 98, '', '微信关注回复提交按钮', 'admin', 'wechat.reply', 'save', '{\"key\":\"subscribe\",\"title\":\"编辑无配置默认回复\"}', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (100, 74, '', '添加提交菜单', 'admin', 'setting.systemMenus', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (101, 74, '', '编辑提交菜单', 'admin', 'setting.systemMenus', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (102, 59, '', '提交添加管理员', 'admin', 'setting.systemAdmin', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (103, 59, '', '提交修改管理员', 'admin', 'setting.systemAdmin', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (104, 63, '', '提交添加身份', 'admin', 'setting.systemRole', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (105, 63, '', '提交修改身份', 'admin', 'setting.systemRole', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (106, 46, '', '提交添加配置分类', 'admin', 'setting.systemConfigTab', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (107, 46, '', '提交修改配置分类', 'admin', 'setting.systemConfigTab', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (108, 117, '', '提交添加配置列表', 'admin', 'setting.systemConfig', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (109, 52, '', '提交添加数据组', 'admin', 'setting.systemGroup', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (110, 52, '', '提交修改数据组', 'admin', 'setting.systemGroup', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (111, 468, '', '提交添加数据', 'admin', 'setting.systemGroupData', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (112, 468, '', '提交修改数据', 'admin', 'setting.systemGroupData', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (113, 33, '', '提交添加文章分类', 'admin', 'article.articleCategory', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (114, 33, '', '提交添加文章分类', 'admin', 'article.articleCategory', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (115, 42, '', '提交添加图文消息', 'admin', 'wechat.wechatNewsCategory', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (116, 42, '', '提交编辑图文消息', 'admin', 'wechat.wechatNewsCategory', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (117, 1, '', '配置列表附加权限', 'admin', 'setting.systemConfig', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (118, 1, '', '配置列表展示页', 'admin', 'setting.systemConfig', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (119, 117, '', '提交保存配置列表', 'admin', 'setting.systemConfig', 'save_basics', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (123, 89, '', '提交添加关键字', 'admin', 'wechat.reply', 'save_keyword', '{\"dis\":\"1\"}', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (124, 89, '', '提交修改关键字', 'admin', 'wechat.reply', 'save_keyword', '{\"dis\":\"2\"}', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (126, 17, '', '微信菜单展示页', 'admin', 'wechat.menus', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (127, 17, '', '微信菜单附加权限', 'admin', 'wechat.menus', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (128, 127, '', '提交微信菜单按钮', 'admin', 'wechat.menus', 'save', '{\"dis\":\"1\"}', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (129, 82, '', '用户行为纪录', 'admin', 'wechat.wechatMessage', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (130, 469, '', '系统日志', 'admin', 'system.systemLog', 'index', '[]', 5, 1, 1);
INSERT INTO `eb_system_menus` VALUES (131, 130, '', '管理员操作记录展示页', 'admin', 'system.systemLog', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (132, 129, '', '微信用户行为纪录展示页', 'admin', 'wechat.wechatMessage', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (133, 82, '', '微信用户', 'admin', 'wechat.wechatUser', 'index', '[]', 1, 1, 1);
INSERT INTO `eb_system_menus` VALUES (134, 133, '', '微信用户展示页', 'admin', 'wechat.wechatUser', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (137, 135, '', '添加通知模板', 'admin', 'system.systemNotice', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (138, 135, '', '编辑通知模板', 'admin', 'system.systemNotice', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (139, 135, '', '删除辑通知模板', 'admin', 'system.systemNotice', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (140, 135, '', '提交编辑辑通知模板', 'admin', 'system.systemNotice', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (141, 135, '', '提交添加辑通知模板', 'admin', 'system.systemNotice', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (142, 25, '', '产品分类展示页', 'admin', 'store.storeCategory', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (143, 25, '', '产品分类附加权限', 'admin', 'store.storeCategory', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (144, 117, '', '获取配置列表上传文件的名称', 'admin', 'setting.systemConfig', 'getimagename', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (145, 117, '', '配置列表上传文件', 'admin', 'setting.systemConfig', 'view_upload', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (146, 24, '', '产品管理展示页', 'admin', 'store.storeProduct', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (147, 24, '', '产品管理附加权限', 'admin', 'store.storeProduct', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (148, 286, '', '优惠券', '', '', '', '[]', 10, 1, 1);
INSERT INTO `eb_system_menus` VALUES (149, 148, '', '优惠券制作', 'admin', 'ump.storeCoupon', 'index', '[]', 5, 1, 1);
INSERT INTO `eb_system_menus` VALUES (150, 148, '', '会员领取记录', 'admin', 'ump.storeCouponUser', 'index', '[]', 1, 1, 1);
INSERT INTO `eb_system_menus` VALUES (151, 0, 'user', '会员', 'admin', 'user', 'index', '[]', 107, 1, 1);
INSERT INTO `eb_system_menus` VALUES (153, 289, '', '管理权限', 'admin', 'setting.systemAdmin', '', '[]', 100, 1, 1);
INSERT INTO `eb_system_menus` VALUES (155, 154, '', '商户产品展示页', 'admin', 'store.storeMerchant', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (156, 154, '', '商户产品附加权限', 'admin', 'store.storeMerchant', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (158, 157, '', '商户文章管理展示页', 'admin', 'wechat.wechatNews', 'merchantIndex', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (159, 157, '', '商户文章管理附加权限', 'admin', 'wechat.wechatNews', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (170, 290, '', '评论管理', 'admin', 'store.store_product_reply', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (173, 469, '', '文件校验', 'admin', 'system.systemFile', 'index', '[]', 1, 1, 1);
INSERT INTO `eb_system_menus` VALUES (174, 360, '', '微信模板消息', 'admin', 'wechat.wechatTemplate', 'index', '[]', 1, 1, 1);
INSERT INTO `eb_system_menus` VALUES (175, 11, '', '客服管理', 'admin', 'wechat.storeService', 'index', '[]', 70, 1, 1);
INSERT INTO `eb_system_menus` VALUES (176, 151, '', '站内通知', 'admin', 'user.user_notice', 'index', '[]', 8, 1, 1);
INSERT INTO `eb_system_menus` VALUES (177, 151, '', '会员管理', 'admin', 'user.user', 'index', '[]', 10, 1, 1);
INSERT INTO `eb_system_menus` VALUES (179, 307, '', '充值记录', 'admin', 'finance.userRecharge', 'index', '[]', 1, 1, 1);
INSERT INTO `eb_system_menus` VALUES (190, 26, '', '订单管理展示页', 'admin', 'store.storeOrder', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (191, 26, '', '订单管理附加权限', 'admin', 'store.storeOrder', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (192, 191, '', '订单管理去发货', 'admin', 'store.storeOrder', 'deliver_goods', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (193, 191, '', '订单管理备注', 'admin', 'store.storeOrder', 'remark', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (194, 191, '', '订单管理去送货', 'admin', 'store.storeOrder', 'delivery', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (195, 191, '', '订单管理已收货', 'admin', 'store.storeOrder', 'take_delivery', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (196, 191, '', '订单管理退款', 'admin', 'store.storeOrder', 'refund_y', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (197, 191, '', '订单管理修改订单', 'admin', 'store.storeOrder', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (198, 191, '', '订单管理修改订单提交', 'admin', 'store.storeOrder', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (199, 191, '', '订单管理退积分', 'admin', 'store.storeOrder', 'integral_back', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (200, 191, '', '订单管理退积分提交', 'admin', 'store.storeOrder', 'updateIntegralBack', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (201, 191, '', '订单管理立即支付', 'admin', 'store.storeOrder', 'offline', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (202, 191, '', '订单管理退款原因', 'admin', 'store.storeOrder', 'refund_n', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (203, 191, '', '订单管理退款原因提交', 'admin', 'store.storeOrder', 'updateRefundN', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (204, 191, '', '订单管理修改配送信息', 'admin', 'store.storeOrder', 'distribution', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (205, 191, '', '订单管理修改配送信息提交', 'admin', 'store.storeOrder', 'updateDistribution', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (206, 191, '', '订单管理退款提交', 'admin', 'store.storeOrder', 'updateRefundY', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (207, 191, '', '订单管理去发货提交', 'admin', 'store.storeOrder', 'updateDeliveryGoods', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (208, 191, '', '订单管理去送货提交', 'admin', 'store.storeOrder', 'updateDelivery', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (209, 175, '', '客服管理展示页', 'admin', 'store.storeService', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (210, 175, '', '客服管理附加权限', 'admin', 'store.storeService', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (211, 210, '', '客服管理添加', 'admin', 'store.storeService', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (212, 210, '', '客服管理添加提交', 'admin', 'store.storeService', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (213, 210, '', '客服管理编辑', 'admin', 'store.storeService', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (214, 210, '', '客服管理编辑提交', 'admin', 'store.storeService', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (215, 210, '', '客服管理删除', 'admin', 'store.storeService', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (216, 179, '', '用户充值记录展示页', 'admin', 'user.userRecharge', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (217, 179, '', '用户充值记录附加权限', 'admin', 'user.userRecharge', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (218, 217, '', '用户充值记录退款', 'admin', 'user.userRecharge', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (219, 217, '', '用户充值记录退款提交', 'admin', 'user.userRecharge', 'updaterefundy', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (220, 180, '', '预售卡管理批量修改预售卡金额', 'admin', 'presell.presellCard', 'batch_price', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (221, 180, '', '预售卡管理批量修改预售卡金额提交', 'admin', 'presell.presellCard', 'savebatch', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (222, 210, '', '客服管理聊天记录查询', 'admin', 'store.storeService', 'chat_user', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (223, 210, '', '客服管理聊天记录查询详情', 'admin', 'store.storeService', 'chat_list', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (224, 170, '', '评论管理展示页', 'admin', 'store.storeProductReply', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (225, 170, '', '评论管理附加权限', 'admin', 'store.storeProductReply', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (226, 225, '', '评论管理回复评论', 'admin', 'store.storeProductReply', 'set_reply', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (227, 225, '', '评论管理修改回复评论', 'admin', 'store.storeProductReply', 'edit_reply', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (228, 225, '', '评论管理删除评论', 'admin', 'store.storeProductReply', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (229, 149, '', '优惠券管理展示页', 'admin', 'store.storeCoupon', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (230, 149, '', '优惠券管理附加权限', 'admin', 'store.storeCoupon', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (231, 230, '', '优惠券管理添加', 'admin', 'store.storeCoupon', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (232, 230, '', '优惠券管理添加提交', 'admin', 'store.storeCoupon', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (233, 230, '', '优惠券管理删除', 'admin', 'store.storeCoupon', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (234, 230, '', '优惠券管理立即失效', 'admin', 'store.storeCoupon', 'status', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (235, 148, '', '已发布管理', 'admin', 'ump.storeCouponIssue', 'index', '[]', 3, 1, 1);
INSERT INTO `eb_system_menus` VALUES (236, 82, '', '用户分组', 'admin', 'wechat.wechatUser', 'group', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (237, 21, '', '刷新缓存', 'admin', 'system.clear', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (238, 272, '', '拼团产品', 'admin', 'ump.storeCombination', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (239, 306, '', '提现申请', 'admin', 'finance.user_extract', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (241, 273, '', '限时秒杀', 'admin', 'ump.storeSeckill', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (244, 294, '', '财务报表', 'admin', 'record.storeStatistics', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (246, 295, '', '用户统计', 'admin', 'user.user', 'user_analysis', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (247, 153, '', '个人资料', 'admin', 'setting.systemAdmin', 'admininfo', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (248, 247, '', '个人资料附加权限', 'admin', 'setting.systemAdmin', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (249, 248, '', '个人资料提交保存', 'admin', 'system.systemAdmin', 'setAdminInfo', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (250, 247, '', '个人资料展示页', 'admin', 'setting.systemAdmin', 'admininfo', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (252, 21, '', '在线更新', 'admin', 'system.systemUpgradeclient', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (254, 271, '', '砍价产品', 'admin', 'ump.storeBargain', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (255, 289, '', '后台通知', 'admin', 'setting.systemNotice', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (256, 0, 'cloud', '服务器端', 'admin', 'upgrade', 'index', '[]', -100, 1, 1);
INSERT INTO `eb_system_menus` VALUES (261, 147, '', '编辑产品', 'admin', 'store.storeproduct', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (262, 147, '', '添加产品', 'admin', 'store.storeproduct', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (263, 147, '', '编辑产品详情', 'admin', 'store.storeproduct', 'edit_content', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (264, 147, '', '开启秒杀', 'admin', 'store.storeproduct', 'seckill', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (265, 147, '', '开启秒杀', 'admin', 'store.store_product', 'bargain', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (266, 147, '', '产品编辑属性', 'admin', 'store.storeproduct', 'attr', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (267, 360, '', '公众号接口配置', 'admin', 'setting.systemConfig', 'index', '{\"type\":\"1\",\"tab_id\":\"2\"}', 100, 1, 1);
INSERT INTO `eb_system_menus` VALUES (269, 0, 'cubes', '小程序', 'admin', 'routine', 'index', '[]', 92, 1, 1);
INSERT INTO `eb_system_menus` VALUES (270, 269, '', '小程序配置', 'admin', 'setting.systemConfig', 'index', '{\"type\":\"2\",\"tab_id\":\"7\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (271, 286, '', '砍价管理', 'admin', '', '', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (272, 286, '', '拼团管理', 'admin', '', '', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (273, 286, '', '秒杀管理', 'admin', '', '', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (276, 469, '', '附件管理', 'admin', 'widget.images', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (278, 469, '', '清除数据', 'admin', 'system.systemCleardata', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (283, 80, '', '文章管理', 'admin', 'article.article', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (284, 80, '', '文章分类', 'admin', 'article.article_category', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (285, 0, 'building-o', '订单', 'admin', 'order', 'index', '[]', 109, 1, 1);
INSERT INTO `eb_system_menus` VALUES (286, 0, 'paper-plane', '营销', 'admin', 'ump', 'index', '[]', 105, 1, 1);
INSERT INTO `eb_system_menus` VALUES (287, 0, 'money', '财务', 'admin', 'finance', 'index', '[]', 103, 1, 1);
INSERT INTO `eb_system_menus` VALUES (288, 0, 'line-chart', '数据', 'admin', 'record', 'index', '[]', 100, 1, 1);
INSERT INTO `eb_system_menus` VALUES (289, 0, 'gear', '设置', 'admin', 'setting', 'index', '[]', 90, 1, 1);
INSERT INTO `eb_system_menus` VALUES (290, 285, '', '售后服务', 'admin', '', '', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (293, 288, '', '交易数据', 'admin', '', '', '[]', 100, 1, 1);
INSERT INTO `eb_system_menus` VALUES (294, 288, '', '财务数据', 'admin', '', '', '[]', 80, 1, 1);
INSERT INTO `eb_system_menus` VALUES (295, 288, '', '会员数据', 'admin', '', '', '[]', 70, 1, 1);
INSERT INTO `eb_system_menus` VALUES (296, 288, '', '营销数据', 'admin', '', '', '[]', 90, 1, 1);
INSERT INTO `eb_system_menus` VALUES (297, 288, '', '排行榜', 'admin', '', '', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (300, 294, '', '提现统计', 'admin', 'record.record', 'chart_cash', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (301, 294, '', '充值统计', 'admin', 'record.record', 'chart_recharge', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (302, 294, '', '返佣统计', 'admin', 'record.record', 'chart_rebate', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (303, 295, '', '会员增长', 'admin', 'record.record', 'user_chart', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (304, 295, '', '会员业务', 'admin', 'record.record', 'user_business_chart', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (305, 295, '', '会员属性', 'admin', 'record.record', 'user_attr', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (306, 287, '', '财务操作', 'admin', '', '', '[]', 100, 1, 1);
INSERT INTO `eb_system_menus` VALUES (307, 287, '', '财务记录', 'admin', '', '', '[]', 50, 1, 1);
INSERT INTO `eb_system_menus` VALUES (308, 287, '', '佣金记录', 'admin', '', '', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (312, 307, '', '资金监控', 'admin', 'finance.finance', 'bill', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (313, 308, '', '佣金记录', 'admin', 'finance.finance', 'commission_list', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (314, 296, '', '积分统计', 'admin', 'record.record', 'chart_score', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (315, 296, '', '优惠券统计', 'admin', 'record.record', 'chart_coupon', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (316, 296, '', '拼团统计', 'admin', 'record.record', 'chart_combination', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (317, 296, '', '秒杀统计', 'admin', 'record.record', 'chart_seckill', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (318, 296, '', '砍价统计', 'admin', 'record.record', 'chart_bargain', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (319, 297, '', '产品销售排行', 'admin', 'record.record', 'ranking_saleslists', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (320, 297, '', '返佣排行', 'admin', 'record.record', 'ranking_commission', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (321, 297, '', '积分排行', 'admin', 'record.record', 'ranking_point', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (329, 285, '', '营销订单', 'admin', 'user', 'user', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (333, 272, '', '拼团列表', 'admin', 'ump.storeCombination', 'combina_list', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (334, 329, '', '秒杀订单', 'admin', 'user', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (335, 329, '', '积分兑换', 'admin', 'user', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (337, 0, 'users', '分销', 'admin', 'agent', 'index', '[]', 106, 1, 1);
INSERT INTO `eb_system_menus` VALUES (340, 293, '', '订单统计', 'admin', 'record.record', 'chart_order', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (341, 293, '', '产品统计', 'admin', 'record.record', 'chart_product', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (349, 286, '', '积分', 'admin', 'userPoint', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (350, 349, '', '积分配置', 'admin', 'setting.systemConfig', 'index', '{\"type\":\"3\",\"tab_id\":\"11\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (351, 349, '', '积分日志', 'admin', 'ump.userPoint', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (352, 148, '', '优惠券配置', 'admin', 'setting.systemConfig', 'index', '{\"type\":\"3\",\"tab_id\":\"12\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (353, 337, '', '分销配置', 'admin', 'setting.systemConfig', 'index', '{\"type\":\"3\",\"tab_id\":\"9\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (354, 11, '', '自动回复', '', '', '', '[]', 80, 1, 1);
INSERT INTO `eb_system_menus` VALUES (355, 11, '', '页面设置', '', '', '', '[]', 90, 1, 1);
INSERT INTO `eb_system_menus` VALUES (356, 355, '', '个人中心菜单', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"32\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (357, 355, '', '商城首页banner', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"34\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (358, 355, '', '商城首页分类按钮', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"35\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (359, 355, '', '商城首页滚动新闻', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"36\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (360, 11, '', '公众号配置', '', '', '', '[]', 100, 1, 1);
INSERT INTO `eb_system_menus` VALUES (361, 360, '', '公众号支付配置', 'admin', 'setting.systemConfig', 'index', '{\"type\":\"1\",\"tab_id\":\"4\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (362, 276, '', '附加权限', 'admin', 'widget.images', '', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (363, 362, '', '上传图片', 'admin', 'widget.images', 'upload', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (364, 362, '', '删除图片', 'admin', 'widget.images', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (365, 362, '', '附件管理', 'admin', 'widget.images', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (366, 254, '', '其它权限管理', '', '', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (367, 366, '', '编辑砍价', 'admin', 'ump.storeBargain', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (368, 366, '', '砍价产品更新', 'admin', 'ump.storeBargain', 'update', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (369, 143, '', '添加产品分类', 'admin', 'store.storeCategory', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (370, 143, '', '编辑产品分类', 'admin', 'store.storeCategory', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (371, 337, '', '分销员管理', 'admin', 'agent.agentManage', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (372, 462, '', '首页幻灯片', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"48\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (373, 462, '', '首页导航按钮', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"47\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (374, 295, '', '分销会员业务', 'admin', 'record.record', 'user_distribution_chart', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (376, 269, '', '小程序模板消息', 'admin', 'routine.routineTemplate', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (377, 469, '', '数据备份', 'admin', 'system.systemDatabackup', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (378, 289, '', '物流公司', 'admin', 'system.express', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (379, 469, '', '文件管理', 'admin', 'system.systemFile', 'opendir', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (380, 379, '', '权限规则', 'admin', 'system.systemFile', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (381, 380, '', '打开文件', 'admin', 'system.systemFile', 'openfile', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (382, 380, '', '编辑文件', 'admin', 'system.systemFile', 'savefile', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (386, 362, '', '移动图片分类展示', 'admin', 'widget.images', 'moveimg', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (387, 362, '', '编辑分类', 'admin', 'widget.images', 'updatecate', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (388, 362, '', '添加分类', 'admin', 'widget.images', 'savecate', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (389, 362, '', '移动图片分类', 'admin', 'widget.images', 'moveimgcecate', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (390, 362, '', '编辑分类展示', 'admin', 'widget.images', 'editcate', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (392, 362, '', '删除分类', 'admin', 'widget.images', 'deletecate', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (393, 362, '', '添加分类展示', 'admin', 'widget.images', 'addcate', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (394, 191, '', '订单获取列表', 'admin', 'store.storeOrder', 'order_list', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (395, 82, '', '微信用户附加权限', 'admin', 'wechat.wechatUser', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (396, 395, '', '推送消息', 'admin', 'wechat.wechat_news_category', 'push', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (397, 395, '', '推送优惠券', 'admin', 'ump.storeCouponUser', 'grant', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (398, 177, '', '会员列表页', 'admin', 'user.user', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (399, 177, '', '会员附加权限', '', 'user.user', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (400, 399, '', '修改用户状态', '', 'user.user', 'set_status', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (401, 399, '', '编辑用户', 'admin', 'user.user', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (402, 399, '', '更新用户', 'admin', 'user.user', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (403, 399, '', '查看用户', 'admin', 'user.user', 'see', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (405, 399, '', '发优惠券', 'admin', 'ump.storeCouponUser', 'grant', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (406, 399, '', '推送图文', 'admin', 'wechat.wechatNewsCategory', 'push', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (407, 399, '', '发站内信', 'admin', 'user.userNotice', 'notice', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (408, 176, '', '站内通知附加权限', 'admin', 'user.user_notice', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (409, 408, '', '添加站内消息', 'admin', 'user.user_notice', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (410, 408, '', '编辑站内消息', 'admin', 'user.user_notice', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (411, 408, '', '发送站内消息', 'admin', 'user.user_notice', 'send', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (412, 408, '', '删除站内消息', 'admin', 'user.user_notice', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (413, 408, '', '指定用户发送', 'admin', 'user.user_notice', 'send_user', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (415, 371, '', '分销管理附加权限', 'admin', 'agent.agentManage', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (416, 174, '', '微信模版消息附加权限', 'admin', 'wechat.wechatTemplate', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (417, 416, '', '添加模版消息', 'admin', 'wechat.wechatTemplate', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (418, 416, '', '添加模版消息展示', 'admin', 'wechat.wechatTemplate', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (419, 416, '', '编辑模版消息展示', 'admin', 'wechat.wechatTemplate', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (420, 416, '', '更新模版消息展示', 'admin', 'wechat.wechatTemplate', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (421, 416, '', '删除模版消息展示', 'admin', 'wechat.wechatTemplate', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (422, 376, '', '小程序模版消息附加权限', 'admin', 'routine.routineTemplate', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (423, 422, '', '添加模版消息展示', 'admin', 'routine.routineTemplate', 'create', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (424, 422, '', '添加模版消息', 'admin', 'routine.routineTemplate', 'save', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (425, 422, '', '编辑模版消息展示', 'admin', 'routine.routineTemplate', 'edit', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (426, 422, '', '编辑模版消息', 'admin', 'routine.routineTemplate', 'update', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (427, 422, '', '删除模版消息', 'admin', 'routine.routineTemplate', 'delete', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (439, 377, '', '数据库备份附加权限', 'admin', 'system.systemDatabackup', '', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (440, 439, '', '查看表结构', 'admin', 'system.systemDatabackup', 'seetable', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (441, 439, '', '优化表', 'admin', 'system.systemDatabackup', 'optimize', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (442, 439, '', '修复表', 'admin', 'system.systemDatabackup', 'repair', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (443, 439, '', '备份表', 'admin', 'system.systemDatabackup', 'backup', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (444, 439, '', '删除备份', 'admin', 'system.systemDatabackup', 'delFile', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (445, 439, '', '恢复备份', 'admin', 'system.systemDatabackup', 'import', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (446, 439, '', '下载备份', 'admin', 'system.systemDatabackup', 'downloadFile', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (447, 377, '', '数据备份展示页', 'admin', 'system.systemDatabackup', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (448, 379, '', '文件管理展示页', 'admin', 'system.systemFile', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (449, 176, '', '站内通知', 'admin', 'user.user_notice', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (450, 371, '', '分销管理列表页', 'admin', 'agent.agentManage', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (451, 376, '', '小程序模版消息列表页', 'admin', 'routine.routineTemplate', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (452, 174, '', '微信模版消息列表页', 'admin', 'wechat.wechatTemplate', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (453, 276, '', '附件管理展示页', 'admin', 'widget.images', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (456, 151, '', '会员等级', 'admin', 'user.user_level', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (458, 462, '', '签到天数配置', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"55\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (459, 462, '', '订单详情动态图', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"53\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (460, 462, '', '个人中心菜单', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"54\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (461, 462, '', '小程序首页滚动新闻', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"50\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (462, 269, '', '模块数据配置', 'admin', '', '', '[]', 100, 1, 1);
INSERT INTO `eb_system_menus` VALUES (463, 462, '', '热门榜单推荐banner', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"57\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (464, 462, '', '首发新品推荐banner', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"58\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (465, 462, '', '促销单品推荐banner', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"59\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (466, 462, '', '个人中心分销海报', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"60\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (467, 21, '', '开发配置', 'admin', 'system', '', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (468, 1, '', '配置组合数据附加权限', 'admin', 'setting.systemGroupData', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (469, 21, '', '安全维护', 'admin', 'system', '', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (470, 1, '', '配置组合数据展示页', 'admin', 'setting.systemGroup', 'index', '[]', 0, 0, 1);
INSERT INTO `eb_system_menus` VALUES (471, 462, '', '小程序精品推荐', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"52\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (472, 462, '', '首页活动区域图片', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"51\"}', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (476, 0, '', '书籍', 'admin', 'book', 'index', '[]', 0, 1, 1);
INSERT INTO `eb_system_menus` VALUES (477, 476, '', '书籍大全', 'admin', 'book.book', 'index', '[]', 0, 1, 1);

-- ----------------------------
-- Table structure for eb_system_notice
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_notice`;
CREATE TABLE `eb_system_notice`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '通知模板id',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知标题',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知类型',
  `icon` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图标',
  `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接',
  `table_title` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知数据',
  `template` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知模板',
  `push_admin` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知管理员id',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type`(`type`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知模板表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_notice
-- ----------------------------
INSERT INTO `eb_system_notice` VALUES (5, '用户关注通知', 'user_sub', 'user-plus', '', '[{\"title\":\"openid\",\"key\":\"openid\"},{\"title\":\"\\u5fae\\u4fe1\\u6635\\u79f0\",\"key\":\"nickname\"},{\"title\":\"\\u5173\\u6ce8\\u4e8b\\u4ef6\",\"key\":\"add_time\"}]', '有%u个新用户关注了公众号', '1', 1);
INSERT INTO `eb_system_notice` VALUES (7, '新订单提醒', '订单提醒', 'building-o', '', '[{\"title\":\"\\u8ba2\\u5355\\u53f7\",\"key\":\"key1\"}]', '新订单提醒', '1', 1);
INSERT INTO `eb_system_notice` VALUES (9, '测试通知中 ', '测试', 'buysellads', '', '[{\"title\":\"\\u8ba2\\u5355\\u53f7\",\"key\":\"key1\"}]', '测试', '20', 1);

-- ----------------------------
-- Table structure for eb_system_notice_admin
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_notice_admin`;
CREATE TABLE `eb_system_notice_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '通知记录ID',
  `notice_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知类型',
  `admin_id` smallint(5) UNSIGNED NOT NULL COMMENT '通知的管理员',
  `link_id` int(10) UNSIGNED NOT NULL COMMENT '关联ID',
  `table_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知的数据',
  `is_click` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击次数',
  `is_visit` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '访问次数',
  `visit_time` int(11) NOT NULL COMMENT '访问时间',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '通知时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_id`(`admin_id`, `notice_type`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `is_visit`(`is_visit`) USING BTREE,
  INDEX `is_click`(`is_click`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_system_role
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_role`;
CREATE TABLE `eb_system_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '身份管理id',
  `role_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份管理名称',
  `rules` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份管理权限(menus_id)',
  `level` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '身份管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_role
-- ----------------------------
INSERT INTO `eb_system_role` VALUES (1, '超级管理员', '23,24,147,266,265,263,262,261,264,146,25,143,370,369,142,285,26,191,192,193,194,195,208,207,206,205,204,203,202,201,200,199,198,197,196,394,190,290,170,225,227,226,228,224,329,335,334,151,177,399,400,401,402,407,406,405,403,398,176,449,408,413,412,411,410,409,456,337,353,371,450,415,286,148,149,229,230,231,234,233,232,235,150,352,349,351,350,273,241,272,238,333,271,254,366,368,367,287,306,239,307,179,217,219,218,216,312,308,313,288,293,341,340,296,317,318,316,315,314,294,244,302,301,300,295,246,374,303,304,305,297,321,320,319,269,462,373,372,472,471,466,465,464,463,461,460,459,458,376,451,422,427,426,425,424,423,270,11,360,267,17,127,128,126,174,452,416,421,420,419,418,417,361,355,359,358,357,356,354,12,98,99,97,30,89,92,91,90,123,124,93,31,95,96,94,37,175,210,223,213,222,214,211,212,215,209,19,73,42,45,44,43,116,115,82,133,134,236,84,129,132,395,397,396,289,153,8,67,63,66,65,64,105,104,4,68,59,103,102,62,61,60,2,74,77,76,75,101,100,78,247,248,249,250,1,117,48,145,144,108,119,118,470,468,56,55,54,53,112,111,255,378,80,284,71,33,36,35,34,114,113,283,72,38,41,40,39,21,252,237,469,130,131,173,379,448,380,382,381,377,447,439,446,445,444,443,442,441,440,278,276,362,363,364,365,393,392,390,389,388,387,386,453,467,7,69,46,47,49,51,50,107,106,9,70,52,58,57,110,109,0', 0, 1);

-- ----------------------------
-- Table structure for eb_system_user_level
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_user_level`;
CREATE TABLE `eb_system_user_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mer_id` int(11) NOT NULL DEFAULT 0 COMMENT '商户id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '会员名称',
  `money` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '购买金额',
  `valid_date` int(11) NOT NULL DEFAULT 0 COMMENT '有效时间',
  `is_forever` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为永久会员',
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否购买,1=购买,0=不购买',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示 1=显示,0=隐藏',
  `grade` int(11) NOT NULL DEFAULT 0 COMMENT '会员等级',
  `discount` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '享受折扣',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '会员卡背景',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '会员图标',
  `explain` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '说明',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除.1=删除,0=未删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `grade`(`grade`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设置用户等级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_user_level
-- ----------------------------
INSERT INTO `eb_system_user_level` VALUES (1, 0, '普通会员', 0.00, 0, 1, 0, 1, 1, 99.00, 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8cd632.jpg', 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8bc1e0.png', '普通会员', 1553824559, 0);
INSERT INTO `eb_system_user_level` VALUES (2, 0, '青铜会员', 0.00, 0, 1, 0, 1, 2, 98.00, 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca904016.jpg', 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8f0a30.png', '青铜会员', 1553824639, 0);
INSERT INTO `eb_system_user_level` VALUES (3, 0, '黄铜会员', 0.00, 0, 1, 0, 1, 3, 95.00, 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8c3bff.jpg', 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8e9365.png', '黄铜会员', 1553824742, 0);
INSERT INTO `eb_system_user_level` VALUES (4, 0, '白银会员', 0.00, 0, 1, 0, 1, 4, 94.00, 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8d6ae1.jpg', 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8a27f0.png', '白银会员', 1553824797, 0);
INSERT INTO `eb_system_user_level` VALUES (5, 0, '黄金会员', 0.00, 0, 1, 0, 1, 5, 90.00, 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8b27f1.jpg', 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8aa5b9.png', '黄金会员', 1553824837, 0);
INSERT INTO `eb_system_user_level` VALUES (6, 0, '钻石会员', 0.00, 0, 1, 0, 1, 6, 88.00, 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca8dfe16.jpg', 'http://datong.crmeb.net/public/uploads/attach/2019/03/28/5c9ccca90d2d3.png', '钻石会员', 1553824871, 0);

-- ----------------------------
-- Table structure for eb_system_user_task
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_user_task`;
CREATE TABLE `eb_system_user_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置原名',
  `task_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务类型',
  `number` int(11) NOT NULL DEFAULT 0 COMMENT '限定数',
  `level_id` int(11) NOT NULL DEFAULT 0 COMMENT '等级id',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示',
  `is_must` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否务必达成任务,1务必达成,0=满足其一',
  `illustrate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务说明',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '等级任务设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_system_user_task
-- ----------------------------
INSERT INTO `eb_system_user_task` VALUES (1, '满足积分100分', '积分数', 'SatisfactionIntegral', 100, 1, 0, 1, 1, '', 1553827616);
INSERT INTO `eb_system_user_task` VALUES (2, '消费满100元', '消费金额', 'ConsumptionAmount', 100, 1, 0, 1, 1, '', 1553827625);
INSERT INTO `eb_system_user_task` VALUES (3, '满足积分200分', '积分数', 'SatisfactionIntegral', 200, 2, 0, 1, 1, '', 1553827638);
INSERT INTO `eb_system_user_task` VALUES (4, '累计签到20天', '累计签到', 'CumulativeAttendance', 20, 2, 0, 1, 1, '', 1553827681);
INSERT INTO `eb_system_user_task` VALUES (5, '满足积分500分', '积分数', 'SatisfactionIntegral', 500, 3, 0, 1, 1, '', 1553827695);
INSERT INTO `eb_system_user_task` VALUES (6, '累计签到30天', '累计签到', 'CumulativeAttendance', 30, 3, 0, 1, 1, '', 1553827703);
INSERT INTO `eb_system_user_task` VALUES (7, '满足积分1000分', '积分数', 'SatisfactionIntegral', 1000, 4, 0, 1, 1, '', 1553827731);
INSERT INTO `eb_system_user_task` VALUES (8, '分享给朋友10次', '分享给朋友', 'SharingTimes', 10, 4, 0, 1, 1, '', 1553827740);
INSERT INTO `eb_system_user_task` VALUES (9, '满足积分1200分', '积分数', 'SatisfactionIntegral', 1200, 5, 0, 1, 1, '', 1553827759);
INSERT INTO `eb_system_user_task` VALUES (10, '累计签到60天', '累计签到', 'CumulativeAttendance', 60, 5, 0, 1, 1, '', 1553827768);
INSERT INTO `eb_system_user_task` VALUES (11, '消费5次', '消费次数', 'ConsumptionFrequency', 5, 5, 0, 1, 1, '', 1553827776);
INSERT INTO `eb_system_user_task` VALUES (12, '满足积分2000分', '积分数', 'SatisfactionIntegral', 2000, 6, 0, 1, 1, '', 1553827791);
INSERT INTO `eb_system_user_task` VALUES (13, '消费满10000元', '消费次数', 'ConsumptionAmount', 10000, 6, 0, 1, 1, '', 1553827803);
INSERT INTO `eb_system_user_task` VALUES (14, '累计签到100天', '累计签到', 'CumulativeAttendance', 100, 6, 0, 1, 1, '', 1553827814);

-- ----------------------------
-- Table structure for eb_token
-- ----------------------------
DROP TABLE IF EXISTS `eb_token`;
CREATE TABLE `eb_token`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户uid',
  `rand_string` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '10位随机字符串',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '保存token随机字符串' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user
-- ----------------------------
DROP TABLE IF EXISTS `eb_user`;
CREATE TABLE `eb_user`  (
  `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `real_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '真实姓名',
  `birthday` int(11) NOT NULL DEFAULT 0 COMMENT '生日',
  `card_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '身份证号码',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户备注',
  `group_id` int(10) NOT NULL DEFAULT 0 COMMENT '用户分组id',
  `partner_id` int(10) NOT NULL DEFAULT 0 COMMENT '合伙人id',
  `addres` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `avatar` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户头像',
  `phone` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `add_time` int(11) UNSIGNED NOT NULL COMMENT '添加时间',
  `add_ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加ip',
  `last_time` int(11) UNSIGNED NOT NULL COMMENT '最后一次登录时间',
  `last_ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '最后一次登录ip',
  `now_money` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '用户余额',
  `brokerage_price` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '佣金金额',
  `integral` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '用户剩余积分',
  `sign_num` int(11) NOT NULL DEFAULT 0 COMMENT '连续签到天数',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1为正常，0为禁止',
  `level` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '等级',
  `spread_uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '推广元id',
  `spread_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '推广员关联时间',
  `user_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户类型',
  `is_promoter` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为推广员',
  `pay_count` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '用户购买次数',
  `spread_count` int(11) NULL DEFAULT 0 COMMENT '下级人数',
  `clean_time` int(11) NOT NULL DEFAULT 0 COMMENT '等级清除时间为0没有清除过',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `account`(`account`) USING BTREE,
  INDEX `spreaduid`(`spread_uid`) USING BTREE,
  INDEX `level`(`level`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_promoter`(`is_promoter`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_user
-- ----------------------------
INSERT INTO `eb_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '', 0, '', '', 0, 0, '', '', '', NULL, 0, '', 1569132949, '127.0.0.1', 0.00, 0.00, 0.00, 0, 1, 0, 0, 0, '', 0, 0, 0, 0);
INSERT INTO `eb_user` VALUES (18, 'xxx130759763271570102514', '3d9188577cc9bfe9291ac66b5cc872b7', '', 0, '', '', 0, 0, '', '加油 | 加油、', '', '13075976327', 0, '', 1572439651, '127.0.0.1', 0.00, 0.00, 0.00, 0, 1, 0, 0, 0, '', 0, 0, 0, 0);

-- ----------------------------
-- Table structure for eb_user_address
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_address`;
CREATE TABLE `eb_user_address`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户地址id',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `real_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人所在省',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人所在市',
  `district` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人所在区',
  `detail` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人详细地址',
  `post_code` int(10) UNSIGNED NOT NULL COMMENT '邮编',
  `longitude` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '经度',
  `latitude` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '纬度',
  `is_default` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否默认',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `is_default`(`is_default`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_user_address
-- ----------------------------
INSERT INTO `eb_user_address` VALUES (1, 1, 'liwnwnn', '13075976327', '重庆', '铜梁县', '水口镇', 'wwww', 350181, '0', '0', 1, 0, 1568773265);
INSERT INTO `eb_user_address` VALUES (2, 18, '林文捷', '13075976327', '', '', '', '阳光学院', 0, '0', '0', 1, 0, 1570529601);
INSERT INTO `eb_user_address` VALUES (3, 18, '林文捷', '18344997512', '福建省', '福清市', '丧失', '阳光学院', 0, '0', '0', 0, 0, 1570529692);
INSERT INTO `eb_user_address` VALUES (4, 18, '水电费水电费所发生的', 'dfsdf', '', '', '', '发发发', 0, '0', '0', 0, 0, 1570529875);
INSERT INTO `eb_user_address` VALUES (5, 18, '林文捷', '15884427595', '福建省', '福州市', '仓山区', '阳光学院', 0, '0', '0', 0, 0, 1570530049);

-- ----------------------------
-- Table structure for eb_user_bill
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_bill`;
CREATE TABLE `eb_user_bill`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户账单id',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户uid',
  `link_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '关联id',
  `pm` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 = 支出 1 = 获得',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账单标题',
  `category` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '明细种类',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '明细类型',
  `number` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '明细数字',
  `balance` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '剩余',
  `mark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = 带确定 1 = 有效 -1 = 无效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `openid`(`uid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `pm`(`pm`) USING BTREE,
  INDEX `type`(`category`, `type`, `link_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户账单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_enter
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_enter`;
CREATE TABLE `eb_user_enter`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商户申请ID',
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
  `province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户所在省',
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户所在市',
  `district` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户所在区',
  `address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户详细地址',
  `merchant_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户名称',
  `link_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `link_tel` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户电话',
  `charter` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商户证书',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '添加时间',
  `apply_time` int(10) UNSIGNED NOT NULL COMMENT '审核时间',
  `success_time` int(11) NOT NULL COMMENT '通过时间',
  `fail_message` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '未通过原因',
  `fail_time` int(10) UNSIGNED NOT NULL COMMENT '未通过时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '-1 审核未通过 0未审核 1审核通过',
  `is_lock` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 = 开启 1= 关闭',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE,
  INDEX `province`(`province`, `city`, `district`) USING BTREE,
  INDEX `is_lock`(`is_lock`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商户申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_extract
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_extract`;
CREATE TABLE `eb_user_extract`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NULL DEFAULT NULL,
  `real_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `extract_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'bank' COMMENT 'bank = 银行卡 alipay = 支付宝wx=微信',
  `bank_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '银行卡',
  `bank_address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '开户地址',
  `alipay_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付宝账号',
  `extract_price` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '提现金额',
  `mark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `balance` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00,
  `fail_msg` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '无效原因',
  `fail_time` int(10) UNSIGNED NULL DEFAULT NULL,
  `add_time` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '添加时间',
  `status` tinyint(2) NULL DEFAULT 0 COMMENT '-1 未通过 0 审核中 1 已提现',
  `wechat` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `extract_type`(`extract_type`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `openid`(`uid`) USING BTREE,
  INDEX `fail_time`(`fail_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户提现表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_group
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_group`;
CREATE TABLE `eb_user_group`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户分组名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_user_group
-- ----------------------------
INSERT INTO `eb_user_group` VALUES (1, '未分组');
INSERT INTO `eb_user_group` VALUES (2, '活跃用户');
INSERT INTO `eb_user_group` VALUES (3, '测试');

-- ----------------------------
-- Table structure for eb_user_level
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_level`;
CREATE TABLE `eb_user_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户uid',
  `level_id` int(11) NOT NULL DEFAULT 0 COMMENT '等级vip',
  `grade` int(11) NOT NULL DEFAULT 0 COMMENT '会员等级',
  `valid_time` int(11) NOT NULL DEFAULT 0 COMMENT '过期时间',
  `is_forever` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否永久',
  `mer_id` int(11) NOT NULL DEFAULT 0 COMMENT '商户id',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:禁止,1:正常',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `remind` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已通知',
  `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0=未删除,1=删除',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `discount` int(11) NOT NULL DEFAULT 0 COMMENT '享受折扣',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户等级记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_notice
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_notice`;
CREATE TABLE `eb_user_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接收消息的用户id（类型：json数据）',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '消息通知类型（1：系统消息；2：用户通知）',
  `user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发送人',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知消息的标题信息',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知消息的内容',
  `add_time` int(11) NOT NULL COMMENT '通知消息发送的时间',
  `is_send` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否发送（0：未发送；1：已发送）',
  `send_time` int(11) NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_notice_see
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_notice_see`;
CREATE TABLE `eb_user_notice_see`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nid` int(11) NOT NULL COMMENT '查看的通知id',
  `uid` int(11) NOT NULL COMMENT '查看通知的用户id',
  `add_time` int(11) NOT NULL COMMENT '查看通知的时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户通知发送记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_recharge
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_recharge`;
CREATE TABLE `eb_user_recharge`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) NULL DEFAULT NULL COMMENT '充值用户UID',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `price` decimal(8, 2) NULL DEFAULT NULL COMMENT '充值金额',
  `recharge_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `paid` tinyint(1) NULL DEFAULT NULL COMMENT '是否充值',
  `pay_time` int(10) NULL DEFAULT NULL COMMENT '充值支付时间',
  `add_time` int(12) NULL DEFAULT NULL COMMENT '充值时间',
  `refund_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '退款金额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `recharge_type`(`recharge_type`) USING BTREE,
  INDEX `paid`(`paid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户充值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_sign
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_sign`;
CREATE TABLE `eb_user_sign`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户uid',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '签到说明',
  `number` int(11) NOT NULL DEFAULT 0 COMMENT '获得积分',
  `balance` int(11) NOT NULL DEFAULT 0 COMMENT '剩余积分',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '签到记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_user_task_finish
-- ----------------------------
DROP TABLE IF EXISTS `eb_user_task_finish`;
CREATE TABLE `eb_user_task_finish`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL DEFAULT 0 COMMENT '任务id',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有效',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户任务完成记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_wechat_media
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_media`;
CREATE TABLE `eb_wechat_media`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信视频音频id',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复类型',
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件路径',
  `media_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信服务器返回的id',
  `url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `temporary` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否永久或者临时 0永久1临时',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type`(`type`, `media_id`) USING BTREE,
  INDEX `type_2`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信回复表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_wechat_message
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_message`;
CREATE TABLE `eb_wechat_message`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户行为记录id',
  `openid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户openid',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型',
  `result` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作详细记录',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `openid`(`openid`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户行为记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_wechat_news_category
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_news_category`;
CREATE TABLE `eb_wechat_news_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '图文消息管理ID',
  `cate_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图文名称',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `new_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章id',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图文消息管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_wechat_news_category
-- ----------------------------
INSERT INTO `eb_wechat_news_category` VALUES (21, '11', 0, 1, '51,52,58,59,60,150', '1542379262');
INSERT INTO `eb_wechat_news_category` VALUES (30, '阿斯达斯', 0, 1, '2', '1552965683');

-- ----------------------------
-- Table structure for eb_wechat_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_qrcode`;
CREATE TABLE `eb_wechat_qrcode`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信二维码ID',
  `third_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '二维码类型',
  `third_id` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `ticket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '二维码参数',
  `expire_seconds` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '二维码有效时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信访问url',
  `qrcode_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信二维码url',
  `scan` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '被扫的次数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `third_type`(`third_type`, `third_id`) USING BTREE,
  INDEX `ticket`(`ticket`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信二维码管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_wechat_reply
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_reply`;
CREATE TABLE `eb_wechat_reply`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信关键字回复id',
  `key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复类型',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复数据',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '0=不可用  1 =可用',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key`(`key`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `hide`(`hide`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信关键字回复表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eb_wechat_template
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_template`;
CREATE TABLE `eb_wechat_template`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `tempkey` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板编号',
  `name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复内容',
  `tempid` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板ID',
  `add_time` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tempkey`(`tempkey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eb_wechat_template
-- ----------------------------
INSERT INTO `eb_wechat_template` VALUES (3, 'OPENTM200565259', '订单发货提醒', '{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n物流公司：{{keyword2.DATA}}\n物流单号：{{keyword3.DATA}}\n{{remark.DATA}}', 'KusKZOFc_4CrRU_gzuXMdMMTfFeR-OLVVuDiMyR5PiM', '1515052638', 1);
INSERT INTO `eb_wechat_template` VALUES (4, 'OPENTM413386489', '订单收货通知', '{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n订单状态：{{keyword2.DATA}}\n收货时间：{{keyword3.DATA}}\n商品详情：{{keyword4.DATA}}\n{{remark.DATA}}', 'UNyz81kgsn1WZHSqmwPiF9fUkcdZghfTZvN6qtDuu54', '1515052765', 1);
INSERT INTO `eb_wechat_template` VALUES (5, 'OPENTM410119152', '退款进度通知', '{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n订单金额：{{keyword2.DATA}}\n下单时间：{{keyword3.DATA}}\n{{remark.DATA}}', 'xrXtApBFv0L3-YXKkl9WYB89hJxFGfQo3jSsk2WpAwI', '1515053049', 1);
INSERT INTO `eb_wechat_template` VALUES (6, 'OPENTM405847076', '帐户资金变动提醒', '{{first.DATA}}\n变动类型：{{keyword1.DATA}}\n变动时间：{{keyword2.DATA}}\n变动金额：{{keyword3.DATA}}\n{{remark.DATA}}', 'Bk3XLd1Nwk9aNF1NIPBlyTDhrgNbzJW4H23OwVQdE-s', '1515053127', 1);
INSERT INTO `eb_wechat_template` VALUES (7, 'OPENTM207707249', '订单发货提醒', '\n{{first.DATA}}\n商品明细：{{keyword1.DATA}}\n下单时间：{{keyword2.DATA}}\n配送地址：{{keyword3.DATA}}\n配送人：{{keyword4.DATA}}\n联系电话：{{keyword5.DATA}}\n{{remark.DATA}}', 'KusKZOFc_4CrRU_gzuXMdMMTfFeR-OLVVuDiMyR5PiM', '1515053313', 1);
INSERT INTO `eb_wechat_template` VALUES (8, 'OPENTM408237350', '服务进度提醒', '{{first.DATA}}\n服务类型：{{keyword1.DATA}}\n服务状态：{{keyword2.DATA}}\n服务时间：{{keyword3.DATA}}\n{{remark.DATA}}', 'ul2g_y0oxqEhtWoSJBbLzmnPrUwtLnIAe30MTBRL7rw', '1515483915', 1);
INSERT INTO `eb_wechat_template` VALUES (9, 'OPENTM204431262', '客服通知提醒', '{{first.DATA}}\n客户名称：{{keyword1.DATA}}\n客服类型：{{keyword2.DATA}}\n提醒内容：{{keyword3.DATA}}\n通知时间：{{keyword4.DATA}}\n{{remark.DATA}}', 'j51mawxEmTuCCtMrXwSTnRfXH93qutoOebs5RG4MyHY', '1515484354', 1);
INSERT INTO `eb_wechat_template` VALUES (10, 'OPENTM407456411', '拼团成功通知', '{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n团购商品：{{keyword2.DATA}}\n{{remark.DATA}}', 'CNvCAz9GIoQri-ogSCODVRANCBUQjZIxWzWvizbHVoQ', '1520063823', 1);
INSERT INTO `eb_wechat_template` VALUES (11, 'OPENTM401113750', '拼团失败通知', '{{first.DATA}}\n拼团商品：{{keyword1.DATA}}\n商品金额：{{keyword2.DATA}}\n退款金额：{{keyword3.DATA}}\n{{remark.DATA}}', 'mSg4ZexW1qaQH3FCrFLe746EYMlTFsZhfTB6VI_ElYg', '1520064059', 1);
INSERT INTO `eb_wechat_template` VALUES (12, 'OPENTM205213550', '订单生成通知', '{{first.DATA}}\n时间：{{keyword1.DATA}}\n商品名称：{{keyword2.DATA}}\n订单号：{{keyword3.DATA}}\n{{remark.DATA}}', 'HYD99ERso6_PcA3hAT6pzH1RmO88H6IIe8crAVaXPRE', '1528966701', 1);
INSERT INTO `eb_wechat_template` VALUES (13, 'OPENTM207791277', '订单支付成功通知', '{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n支付金额：{{keyword2.DATA}}\n{{remark.DATA}}', 'hJV1d1OwWB_lbPrSaRHi9RGr5CFAF4PJcZdYeg73Mtg', '1528966759', 1);

-- ----------------------------
-- Table structure for eb_wechat_user
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_user`;
CREATE TABLE `eb_wechat_user`  (
  `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信用户id',
  `unionid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段',
  `openid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户的标识，对当前公众号唯一',
  `routine_openid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小程序唯一身份ID',
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户的昵称',
  `headimgurl` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户头像',
  `sex` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户所在城市',
  `language` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户所在省份',
  `country` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户所在国家',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注',
  `groupid` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '用户所在的分组ID（兼容旧的用户分组接口）',
  `tagid_list` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户被打上的标签ID列表',
  `subscribe` tinyint(3) UNSIGNED NULL DEFAULT 1 COMMENT '用户是否订阅该公众号标识',
  `subscribe_time` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '关注公众号时间',
  `add_time` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '添加时间',
  `stair` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '一级推荐人',
  `second` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '二级推荐人',
  `order_stair` int(11) NULL DEFAULT NULL COMMENT '一级推荐人订单',
  `order_second` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '二级推荐人订单',
  `now_money` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '佣金',
  `session_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小程序用户会话密匙',
  `user_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'wechat' COMMENT '用户类型',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `openid`(`openid`) USING BTREE,
  INDEX `groupid`(`groupid`) USING BTREE,
  INDEX `subscribe_time`(`subscribe_time`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE,
  INDEX `subscribe`(`subscribe`) USING BTREE,
  INDEX `unionid`(`unionid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信用户表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
