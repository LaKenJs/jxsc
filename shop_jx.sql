/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : shop_jx

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 12/03/2020 21:39:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `goods_id` int(5) NOT NULL,
  `goods_attrs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `goods_num` int(4) NULL DEFAULT NULL,
  `goods_ischeck` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, '白色', 1, '1', 3);
INSERT INTO `cart` VALUES (1, '黑色', 1, '1', 4);
INSERT INTO `cart` VALUES (2, '白色', 1, '1', 6);

-- ----------------------------
-- Table structure for cate_page
-- ----------------------------
DROP TABLE IF EXISTS `cate_page`;
CREATE TABLE `cate_page`  (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cate_title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cate_page
-- ----------------------------
INSERT INTO `cate_page` VALUES (1, '手机');
INSERT INTO `cate_page` VALUES (2, '鞋子');
INSERT INTO `cate_page` VALUES (3, '包包');

-- ----------------------------
-- Table structure for goods_descimg
-- ----------------------------
DROP TABLE IF EXISTS `goods_descimg`;
CREATE TABLE `goods_descimg`  (
  `good_id` int(11) NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_descimg
-- ----------------------------
INSERT INTO `goods_descimg` VALUES (1, '//img14.360buyimg.com/imgzone/jfs/t1/42252/19/15600/134607/5d848b9bEcc130630/29a25873cbe4ec32.jpg!q70.dpg.webp');
INSERT INTO `goods_descimg` VALUES (1, '//img14.360buyimg.com/imgzone/jfs/t1/81767/1/10866/109522/5d848b9bE6c5f2c31/03bb9d681799aa4d.jpg!q70.dpg.webp');
INSERT INTO `goods_descimg` VALUES (1, '//img14.360buyimg.com/imgzone/jfs/t1/76502/3/10648/234555/5d848b9cEc0aab670/25e3924b84fcc0ca.jpg!q70.dpg.webp');
INSERT INTO `goods_descimg` VALUES (1, '//img30.360buyimg.com/imgzone/jfs/t1/63423/2/10751/256870/5d848b9cEe3ce64c2/6214d33284cd8902.jpg!q70.dpg.webp');
INSERT INTO `goods_descimg` VALUES (3, '//img30.360buyimg.com/popWaterMark/jfs/t1/104373/25/1093/245541/5dba7a59E5e2186c0/ab58f773b81a5268.jpg!q70.dpg.webp');
INSERT INTO `goods_descimg` VALUES (3, '//img30.360buyimg.com/popWaterMark/jfs/t1/45110/20/14888/297491/5dba7a5aE429338b7/19acff4e6d6cfc16.jpg!q70.dpg.webp');
INSERT INTO `goods_descimg` VALUES (3, '//img30.360buyimg.com/popWaterMark/jfs/t1/78191/17/14391/274730/5dba7a5aEa0d8f6ee/b0d24fd0251e545f.jpg!q70.dpg.webp');
INSERT INTO `goods_descimg` VALUES (3, '//img30.360buyimg.com/popWaterMark/jfs/t1/65113/29/14446/324104/5dba7a5aE7c66aedf/f97d4182e274ed0c.jpg!q70.dpg.webp');
INSERT INTO `goods_descimg` VALUES (2, '//img20.360buyimg.com/vc/jfs/t1/87361/11/552/496868/5dafc681Ed711a611/dcd8cedeed011025.jpg!q70.dpg.webp');
INSERT INTO `goods_descimg` VALUES (2, '//img20.360buyimg.com/vc/jfs/t1/87224/13/7921/193935/5e002bb6Ee16909e3/89c43f77cdac0d4e.jpg!q70.dpg.webp');
INSERT INTO `goods_descimg` VALUES (2, NULL);
INSERT INTO `goods_descimg` VALUES (2, NULL);
INSERT INTO `goods_descimg` VALUES (4, '//img30.360buyimg.com/popWaterMark/jfs/t1/86711/20/9920/238906/5e13d9bbE38daed17/fd930f482f9630b8.jpg!q70.dpg.webp');
INSERT INTO `goods_descimg` VALUES (4, '//img30.360buyimg.com/popWaterMark/jfs/t1/90773/31/9964/228370/5e13d9bbE20d3ee6a/4a87ebdd839b2053.jpg!q70.dpg.webp');
INSERT INTO `goods_descimg` VALUES (4, '//img30.360buyimg.com/popWaterMark/jfs/t1/108720/40/3616/197853/5e13d9bbE81d5903f/12ab7f77ee6d9eed.jpg!q70.dpg.webp');
INSERT INTO `goods_descimg` VALUES (4, '//img30.360buyimg.com/popWaterMark/jfs/t1/88886/35/9941/174713/5e13d9bcE6a0f9848/32145ce75eae4cd0.jpg!q70.dpg.webp');
INSERT INTO `goods_descimg` VALUES (5, '//img30.360buyimg.com/sku/jfs/t28603/70/1017128530/296809/8d1743a9/5cdd0712N51864e26.jpg');
INSERT INTO `goods_descimg` VALUES (5, '//img30.360buyimg.com/sku/jfs/t30691/180/1290699453/280925/9833a5a0/5cdd0712N257f4f6e.jpg');
INSERT INTO `goods_descimg` VALUES (5, '//img30.360buyimg.com/sku/jfs/t1/42622/24/4674/280725/5cdd0712E0c8ff878/c3caeac2b9250d09.jpg');
INSERT INTO `goods_descimg` VALUES (5, '//img30.360buyimg.com/sku/jfs/t27922/99/1330209227/292309/dff63d75/5cdd0712Na3da5fae.jpg');
INSERT INTO `goods_descimg` VALUES (6, '//img30.360buyimg.com/popWaterMark/jfs/t25729/222/615822517/272470/18ea43f1/5b750c04N8e407254.jpg!q70.dpg.webp');
INSERT INTO `goods_descimg` VALUES (6, '//img30.360buyimg.com/popWaterMark/jfs/t26092/297/609289563/264309/5b4037a6/5b750c04N5c6d55d3.jpg!q70.dpg.webp');
INSERT INTO `goods_descimg` VALUES (6, '//img30.360buyimg.com/popWaterMark/jfs/t25165/191/570878769/176269/5e1ea500/5b750c03N37a30435.jpg!q70.dpg.webp');
INSERT INTO `goods_descimg` VALUES (6, '//img30.360buyimg.com/popWaterMark/jfs/t25750/6/583487938/181568/ad9225eb/5b750c03N1a77ea7c.jpg!q70.dpg.webp');
INSERT INTO `goods_descimg` VALUES (7, '//img13.360buyimg.com/imgzone/jfs/t1/104769/20/8220/228938/5e0433dbE285e5940/b8703cf6bbba059a.jpg!q70.dpg.webp');
INSERT INTO `goods_descimg` VALUES (7, '//img12.360buyimg.com/imgzone/jfs/t1/93223/15/8330/180668/5e0433dbE19f8a3db/546447b42bf6b0f7.jpg!q70.dpg.webp');
INSERT INTO `goods_descimg` VALUES (7, '//img10.360buyimg.com/imgzone/jfs/t1/86581/40/8333/180798/5e0433dbE076d6660/c567b38b0750fdfb.jpg!q70.dpg.webp');
INSERT INTO `goods_descimg` VALUES (7, '//img30.360buyimg.com/popWaterMark/jfs/t1/101257/21/9503/193542/5e100b91E0d034556/11cf4e3169a3e778.jpg!q70.dpg.webp');

-- ----------------------------
-- Table structure for goods_lunbo
-- ----------------------------
DROP TABLE IF EXISTS `goods_lunbo`;
CREATE TABLE `goods_lunbo`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_imgs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `goods_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_lunbo
-- ----------------------------
INSERT INTO `goods_lunbo` VALUES (1, '//m.360buyimg.com/mobilecms/s750x750_jfs/t1/84587/13/11193/385076/5d847600E032bbcc0/f57b875a7157e05c.jpg!q80.dpg.webp', '1');
INSERT INTO `goods_lunbo` VALUES (2, '//m.360buyimg.com/mobilecms/s843x843_jfs/t1/63512/6/10718/86475/5d847601E517e111e/f518ba503d948935.jpg!q70.dpg.webp', '1');
INSERT INTO `goods_lunbo` VALUES (3, '//m.360buyimg.com/mobilecms/s843x843_jfs/t1/48400/30/11234/254426/5d847603E5476e3bc/8fcc19ba6b688d51.jpg!q70.dpg.webp', '1');
INSERT INTO `goods_lunbo` VALUES (4, '//m.360buyimg.com/mobilecms/s843x843_jfs/t1/78256/21/10946/101518/5d847604E805e8bda/5bbe659963cf4394.jpg!q70.dpg.webp', '1');
INSERT INTO `goods_lunbo` VALUES (5, '//m.360buyimg.com/mobilecms/s843x843_jfs/t1/82401/17/11123/108598/5d89ba89Ef8ebeef4/9752014f4645215e.jpg!q70.dpg.webp', '3');
INSERT INTO `goods_lunbo` VALUES (6, '//m.360buyimg.com/mobilecms/s750x750_jfs/t1/98281/9/14747/152817/5e68c68fE36a628b2/847f9362f0669d9b.jpg!q80.dpg.webp', '3');
INSERT INTO `goods_lunbo` VALUES (7, '//m.360buyimg.com/mobilecms/s843x843_jfs/t1/79698/31/11222/89752/5d89ba88E5e1a08b1/a3f59ac5b2452e58.jpg!q70.dpg.webp', '3');
INSERT INTO `goods_lunbo` VALUES (8, '//m.360buyimg.com/mobilecms/s843x843_jfs/t1/70937/20/11145/60864/5d89ba88E12a5febc/59cbd4e7e87fb896.jpg!q70.dpg.webp', '3');
INSERT INTO `goods_lunbo` VALUES (9, '//m.360buyimg.com/mobilecms/s750x750_jfs/t1/98429/15/14318/171896/5e678f8bE13054c73/1945eb1eff8828e5.jpg!q80.dpg.webp', '2');
INSERT INTO `goods_lunbo` VALUES (10, '//m.360buyimg.com/mobilecms/s843x843_jfs/t1/49790/10/15656/156597/5dc9862aEf26fc821/8f0fff0e91ffecf2.jpg!q70.dpg.webp', '2');
INSERT INTO `goods_lunbo` VALUES (11, '//m.360buyimg.com/mobilecms/s843x843_jfs/t1/56804/31/14145/160488/5dafce27Ef2d53369/c713eec827795e85.jpg!q70.dpg.webp', '2');
INSERT INTO `goods_lunbo` VALUES (12, '//m.360buyimg.com/mobilecms/s843x843_jfs/t1/75813/23/13543/43128/5dafce28E225ff800/db0ee928d4915e1e.jpg!q70.dpg.webp', '2');
INSERT INTO `goods_lunbo` VALUES (13, '//m.360buyimg.com/mobilecms/s750x750_jfs/t1/89863/7/13809/116785/5e606d5cE44e0501e/b5f87c11761392ec.jpg!q80.dpg.webp', '4');
INSERT INTO `goods_lunbo` VALUES (14, '//m.360buyimg.com/mobilecms/s843x843_jfs/t1/86855/26/9464/98615/5e0fde59E80ba84c1/db1d04a6d49b63d8.jpg!q70.dpg.webp', '4');
INSERT INTO `goods_lunbo` VALUES (15, '//m.360buyimg.com/mobilecms/s843x843_jfs/t1/99711/30/4805/20317/5de8e59eE8c8e6557/f1f12ef2a4d86b9b.jpg!q70.dpg.webp', '4');
INSERT INTO `goods_lunbo` VALUES (16, '//m.360buyimg.com/mobilecms/s843x843_jfs/t1/103033/10/4769/29850/5de8e59eE80cd64fb/7a7b1319ffc681fd.jpg!q70.dpg.webp', '4');
INSERT INTO `goods_lunbo` VALUES (17, '//m.360buyimg.com/mobilecms/s750x750_jfs/t1/39603/16/2454/269902/5cc1129fEaf07cab3/057b462f922ea8c3.jpg!q80.dpg.webp', '5');
INSERT INTO `goods_lunbo` VALUES (18, '//m.360buyimg.com/mobilecms/s843x843_jfs/t1/31790/26/15094/245365/5cc112f1E72386f74/1e42b5137fea92af.jpg!q70.dpg.webp', '5');
INSERT INTO `goods_lunbo` VALUES (19, '//m.360buyimg.com/mobilecms/s843x843_jfs/t1/83027/34/10036/574511/5d79b3faE99c9d2b1/dcdde76f0560e364.jpg!q70.dpg.webp', '5');
INSERT INTO `goods_lunbo` VALUES (20, '//m.360buyimg.com/mobilecms/s843x843_jfs/t1/82598/37/10149/576172/5d79b3fbE56a1d858/2b5a478ae9323b0d.jpg!q70.dpg.webp', '5');
INSERT INTO `goods_lunbo` VALUES (21, '//m.360buyimg.com/mobilecms/s750x750_jfs/t1/94965/13/14829/244412/5e686374Ebd701640/8245af6c01ec33b5.jpg!q80.dpg.webp', '6');
INSERT INTO `goods_lunbo` VALUES (22, '//m.360buyimg.com/mobilecms/s843x843_jfs/t1/62586/10/11072/140137/5d883ce6E577a8db2/c4a318df943a9525.jpg!q70.dpg.webp', '6');
INSERT INTO `goods_lunbo` VALUES (23, '//m.360buyimg.com/mobilecms/s843x843_jfs/t1/62787/25/10998/177960/5d883ce8Edf0ce412/9d8aa17de1401167.jpg!q70.dpg.webp', '6');
INSERT INTO `goods_lunbo` VALUES (24, '//m.360buyimg.com/mobilecms/s750x750_jfs/t1/85558/2/12747/102579/5e4e4cdaE4a692705/07c1d1e640222362.jpg!q80.dpg.webp', '7');
INSERT INTO `goods_lunbo` VALUES (25, '//m.360buyimg.com/mobilecms/s843x843_jfs/t1/39305/39/11367/41102/5d29a4f9E87dbe8fc/9764d58acc9c7b16.jpg!q70.dpg.webp', '7');
INSERT INTO `goods_lunbo` VALUES (26, '//m.360buyimg.com/mobilecms/s843x843_jfs/t1/48921/28/5026/66776/5d29a4ffE3a3d75cb/59a496c864ba7ec6.jpg!q70.dpg.webp', '7');

-- ----------------------------
-- Table structure for goods_mesg
-- ----------------------------
DROP TABLE IF EXISTS `goods_mesg`;
CREATE TABLE `goods_mesg`  (
  `good_id` int(3) NOT NULL,
  `good_title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `good_price` decimal(10, 2) NOT NULL,
  `good_avator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `good_attr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_mesg
-- ----------------------------
INSERT INTO `goods_mesg` VALUES (1, '蒂洛克流苏包包女2020新款时尚菱格链条包休闲百搭真皮ck女包单肩斜挎包 大气黑色 流苏包', 799.00, '//m.360buyimg.com/mobilecms/s750x750_jfs/t1/84587/13/11193/385076/5d847600E032bbcc0/f57b875a7157e05c.jpg!q80.dpg.webp', '黑色,白色,红色');
INSERT INTO `goods_mesg` VALUES (2, '华为 HUAWEI Mate 30 Pro 5G 麒麟990 OLED环幕屏双4000万徕卡电影四摄8GB+256GB亮黑色5G全网通游戏手机', 6399.00, '//m.360buyimg.com/mobilecms/s750x750_jfs/t1/98429/15/14318/171896/5e678f8bE13054c73/1945eb1eff8828e5.jpg!q80.dpg.webp', '64G,128G,256G');
INSERT INTO `goods_mesg` VALUES (3, '李宁官方男子篮球鞋空袭VI减震中帮专业比赛鞋ABAP067 帝国蓝/标准黑/阳光橙-5 42', 359.00, '//m.360buyimg.com/mobilecms/s750x750_jfs/t1/98281/9/14747/152817/5e68c68fE36a628b2/847f9362f0669d9b.jpg!q80.dpg.webp', '42码,43码,44码');
INSERT INTO `goods_mesg` VALUES (4, '华为 HUAWEI nova 6 5G 105°前置广角双摄 超感光暗拍 麒麟990芯片8GB+128GB亮黑色全网通双卡双待', 3499.00, '//m.360buyimg.com/mobilecms/s750x750_jfs/t1/103457/32/14432/140845/5e678e14Efe657172/429708648071521f.jpg!q80.dpg.webp', '64G,128G,256G');
INSERT INTO `goods_mesg` VALUES (5, '乔丹 男鞋篮球鞋实战减震运动耐磨篮球鞋 XM1580103 新乔丹红/黑色 41', 219.00, '//m.360buyimg.com/mobilecms/s750x750_jfs/t1/39603/16/2454/269902/5cc1129fEaf07cab3/057b462f922ea8c3.jpg!q80.dpg.webp', '42码,43码,44码');
INSERT INTO `goods_mesg` VALUES (6, '361度篮球鞋男秋季实战耐磨高帮透气防侧翻科技运动鞋子 N 赤道蓝/米色（实战款） 43', 219.00, '//m.360buyimg.com/mobilecms/s750x750_jfs/t1/94965/13/14829/244412/5e686374Ebd701640/8245af6c01ec33b5.jpg!q80.dpg.webp', '42码,43码,44码');
INSERT INTO `goods_mesg` VALUES (7, '华为nova5 手机 绮境森林 全网通（8G+128G)', 2369.00, '//m.360buyimg.com/mobilecms/s750x750_jfs/t1/85558/2/12747/102579/5e4e4cdaE4a692705/07c1d1e640222362.jpg!q80.dpg.webp', '64G,128G,256G');

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `recommend_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `recommend_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `recommend_price` decimal(10, 2) NOT NULL,
  `cate_id` int(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `cate_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recommend
-- ----------------------------
INSERT INTO `recommend` VALUES (1, 'http://img12.360buyimg.com/mobilecms/s372x372_jfs/t1/84587/13/11193/385076/5d847600E032bbcc0/f57b875a7157e05c.jpg!q70.dpg.webp', '蒂洛克流苏包包女2020新款时尚菱格链条包休闲百搭...', 799.00, 3);
INSERT INTO `recommend` VALUES (2, '//img14.360buyimg.com/mobilecms/s372x372_jfs/t1/94961/5/13975/169546/5e5e56a7E8e590f89/12e508e6655edfc8.jpg!q70.dpg.webp', '华为 HUAWEI Mate 30 Pro 5G 麒麟990 OLED环...', 6399.00, 1);
INSERT INTO `recommend` VALUES (3, '//img12.360buyimg.com/mobilecms/s372x372_jfs/t1/99054/1/13810/161530/5e5d45c7E58d30622/45d2a3a03ea929b6.jpg!q70.dpg.webp', '李宁官方男子篮球鞋空袭VI减震中帮专业比赛鞋ABAP...', 359.00, 2);
INSERT INTO `recommend` VALUES (4, '//img12.360buyimg.com/mobilecms/s372x372_jfs/t1/75612/35/16648/140012/5de1114cEa692de29/a37a97011cf73354.jpg!q70.dpg.webp', '华为 HUAWEI nova 6 5G 105°前置广角双摄 超感...', 3799.00, 1);
INSERT INTO `recommend` VALUES (5, '//img13.360buyimg.com/mobilecms/s372x372_jfs/t1/39603/16/2454/269902/5cc1129fEaf07cab3/057b462f922ea8c3.jpg!q70.dpg.webp', '乔丹 男鞋篮球鞋实战减震运动耐磨篮球鞋 XM158...', 219.00, 2);
INSERT INTO `recommend` VALUES (6, '//img13.360buyimg.com/mobilecms/s372x372_jfs/t1/94965/13/14829/244412/5e686374Ebd701640/8245af6c01ec33b5.jpg!q70.dpg.webp', '361度篮球鞋男秋季实战耐磨高帮透气防侧翻...', 219.00, 2);
INSERT INTO `recommend` VALUES (7, '//img13.360buyimg.com/mobilecms/s372x372_jfs/t1/47193/2/3369/231278/5d11cb39Ef3674059/ba3c0a1d956429e2.jpg!q70.dpg.webp', '华为 HUAWEI nova 5 Pro 前置3200万人像超级夜景...', 2369.00, 1);

-- ----------------------------
-- Table structure for sm_image
-- ----------------------------
DROP TABLE IF EXISTS `sm_image`;
CREATE TABLE `sm_image`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `small_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `small_desc` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sm_image
-- ----------------------------
INSERT INTO `sm_image` VALUES (1, 'http://m.360buyimg.com/mobilecms/s750x750_jfs/t1/84587/13/11193/385076/5d847600E032bbcc0/f57b875a7157e05c.jpg!q80.dpg.webp', '大气黑色 流苏包');
INSERT INTO `sm_image` VALUES (2, '//m.360buyimg.com/mobilecms/s843x843_jfs/t1/81458/8/10893/60730/5d847605Ed05458a9/6a08cbe605573944.jpg!q70.dpg.webp', '大气白色 流苏包');
INSERT INTO `sm_image` VALUES (3, '//m.360buyimg.com/mobilecms/s843x843_jfs/t1/54857/18/11429/76006/5d847606E5f526fd3/27777c288434c4e2.jpg!q70.dpg.webp', '大气红色 流苏包');

-- ----------------------------
-- Table structure for swiper
-- ----------------------------
DROP TABLE IF EXISTS `swiper`;
CREATE TABLE `swiper`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of swiper
-- ----------------------------
INSERT INTO `swiper` VALUES (1, '//imgcps.jd.com/ling4/100008348530/5omL5py66LSt5a6e5oOg/5aSH6LSn6LaF5YC8/p-5c11d16482acdd181dbc1fb4/00f0dc31/cr_1125x445_0_171/s1125x690/q70.jpg');
INSERT INTO `swiper` VALUES (2, '//m.360buyimg.com/mobilecms/s700x280_jfs/t1/70854/5/7549/225182/5d58a5c7Ef340e35e/6af5e05a13123e25.jpg!cr_1125x445_0_171!q70.jpg.dpg');
INSERT INTO `swiper` VALUES (3, '//m.360buyimg.com/mobilecms/s700x280_jfs/t1/101977/37/12524/131515/5e4e5649Efd423fdd/bcad5aad2e1a28e7.jpg!cr_1125x445_0_171!q70.jpg.dpg');
INSERT INTO `swiper` VALUES (4, '//m.360buyimg.com/mobilecms/s700x280_jfs/t1/96527/38/12974/151566/5e54a879Ed290cac1/fc0590c91b3f159d.jpg!cr_1125x445_0_171!q70.jpg.dpg');
INSERT INTO `swiper` VALUES (5, '//m.360buyimg.com/mobilecms/s700x280_jfs/t1/95842/38/12546/80187/5e4ba3e7E09e0da3b/92aac67aefdf6b6f.jpg!cr_1125x445_0_171!q70.jpg.dpg');
INSERT INTO `swiper` VALUES (6, '//m.360buyimg.com/mobilecms/s700x280_jfs/t1/85817/22/12598/167208/5e4a1eb8E32cfec83/385b043602249a0e.jpg!cr_1125x445_0_171!q70.jpg.dpg');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `telephone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '18334659221', '123', '//m.360buyimg.com/mobilecms/s120x120_jfs/t16828/63/2653634926/5662/d18f6fa1/5b03b779N5c0b196f.png.webp', '撒地方');
INSERT INTO `users` VALUES (2, '13233274336', '123456', '', '');
INSERT INTO `users` VALUES (3, '13233274336', '123456', '', '');
INSERT INTO `users` VALUES (4, '12212121121', '22222', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
