/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3306
 Source Schema         : f_test_db

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 17/04/2024 17:54:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `course_chapter_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程名称/教学资源id',
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '题目',
  `type` int NULL DEFAULT NULL COMMENT '试题类型 1:单选 2:多选 3:判断 4:填空 5:简答',
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '试题选项',
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '正确答案',
  `analysis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '题目解析',
  `score` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '分值',
  `level_choices` int NULL DEFAULT NULL COMMENT '题目难度:1入门,2简单,3普通,4较难,5困难',
  `is_delete` int NULL DEFAULT NULL COMMENT '是否删除, 1：删除、0：保留，默认值：0',
  `status` int NULL DEFAULT NULL COMMENT '试题状态',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_chapter_id`(`course_chapter_id` ASC) USING BTREE,
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`course_chapter_id`) REFERENCES `course_chapter` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES ('014dea7c-9487-41e2-a10f-4b28ce1fa58b', 'utBLMIBCTN4heLOYFqhyfKc5PnZGIoHFxJyE', '软件重用可以分为哪几个层次?', 5, NULL, '1）知识重用 （2）方法和标准重 （3）软件成分重用', NULL, '10', 3, 1, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:39');
INSERT INTO `questions` VALUES ('03c51633-c072-42b0-8dac-ebcce4eb735c', 'utBLMIBCTN4heLOYFqhyfKc5PnZGIoHFxJyE', '软件过程的输出信息可分为?', 5, NULL, '（1）计算机程序（2）描迹计算机程序的有关文档（3）数据', NULL, '10', 3, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:39');
INSERT INTO `questions` VALUES ('0496873c-622d-46db-b2df-ef1f442615b3', 'utBLMIBCTN4heLOYFqhyfKc5PnZGIoHFxJyE', '某农业园区采用“公司+合作社+农户”的模式，成立土地经营权流转合作社，整合散户。吸纳资金、土地、技术入股，形成规模化、集约化、现代化的经营方式。吸引500多名外出务工农民返乡创业。解决200多名贫困人口的就业问题，这种模式（   ）', 1, 'A完善了就业机制，扩大了就业发展\r\nB用公司股份制代替了家庭土地承包制\r\nC是农业先进生产力的体现和标志\r\nD整合了农业生产要素，降低了经营成本', 'D', NULL, '2', 1, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:30');
INSERT INTO `questions` VALUES ('04a20a91-0a83-4cda-9d5e-25f121ab9862', 'utBLMIBCTN4heLOYFqhyfKc5PnZGIoHFxJyE', '2010年5月，国务院发布“新非公36条”，鼓励和引导民间资本进入法律法规未明确禁止准入的行业和领域。2012年9月，国务院发布“关于第六批取消和调整行政审批项目的决定”，进一步扫除民间资本进入铁路、市政、金融等领域的障碍。这表明（   ）\r\n\r\n①各种所有制经济依法公平参与市场竞争的原则进一步得到了贯彻 \r\n\r\n②非公有制经济的主导性作用进一步得到了发挥\r\n\r\n③市场规律进一步得到了尊重\r\n\r\n④非公有制经济发展的障碍扫清了', 1, 'A①③B①④C②③D②④', 'A', NULL, '2', 1, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:02:30');
INSERT INTO `questions` VALUES ('08f4c485-7ad5-4b5f-82dd-4b78599b7624', 'utBLMIBCTN4heLOYFqhyfKc5PnZGIoHFxJyE', '中小企业作为我国社会主义市场经济的主体之一，在国民经济中发挥了巨大作用。据统计，2010年我国规模以上工业企业中，中小企业44．9万户，占比高达99．3%：从业人员7056万人，占比77．9%：上缴税金1．5万亿元，占比54．3%。由此可以看出，大力发燕尾服中小企业可以（     ）\r\n\r\n①扩大消费需要 \r\n\r\n②增加财政收入 \r\n\r\n③降低恩格尔系数 \r\n\r\n④提供就业岗位', 1, 'A①②B②③C②④D③④', 'C', NULL, '2', 1, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:30');
INSERT INTO `questions` VALUES ('09c02a58-747f-4ed4-afe5-d4190bb96ae2', 'utBLMIBCTN4heLOYFqhyfKc5PnZGIoHFxJyE', '改革开放以来，我国逐渐完善了社会主义初级阶段基本经济制度，经济持续快速发展。如2000年2012年，国有和集体工业企业资产从5.70万亿元增加到10.61万亿元，私营工业企业资产从0.39万亿元增加到15.25万亿元。这说明 （   ）\r\n\r\n①我国各种所有制经济地位相同．相互促进\r\n\r\n②非公有制经济已成为我国经济的主体\r\n\r\n③应继续坚持公有制为主体，多种所有制共同发展\r\n\r\n④应毫不动摇巩固和发展公有制经济，毫不动摇鼓励．支持．引导非公有制经济发展\r\n\r\n', 1, 'A①②B③④C①③D②④', 'B', NULL, '2', 1, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:30');
INSERT INTO `questions` VALUES ('0ff85f23-95cd-4498-b891-1c1380e92703', 'utBLMIBCTN4heLOYFqhyfKc5PnZGIoHFxJyE', '月饼是中国传统的节日食品，随着生活水平的提高，人们对中秋月饼的消费日益多样，除枣泥、豆沙等传统月饼外，消费者也开始购买海鲜、木瓜、冰激凌等新式月饼，多样化的月饼消费（     ）', 1, 'A取决于月饼消费观念的多样化\r\nB导致了月饼消费结构升级\r\nC促进了月饼生产的多样化\r\nD促进了月饼质量的提高', 'C', NULL, '2', 1, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:30');
INSERT INTO `questions` VALUES ('0ffa2aca-495b-4c3e-bd8b-05b2f42ba5fa', 'utBLMIBCTN4heLOYFqhyfKc5PnZGIoHFxJyE', '某知名家电企业通过互联网收集消费者的需求信息，并根据他们的特殊需求专门生产了近万台定制彩电．从消费者下单到生产、配送、安装，整个过程仅耗时一个月，比传统批量生产模式(含产供销)少用半年多的时间。与传统的批量生产模式相比，这种定制生产模式能够（     ）\r\n\r\n①充分发挥企业规模优势，降低生产成本\r\n\r\n②以需定产缩短生产周期，减少企业库存\r\n\r\n③更灵活应对市场变化，满足消费者多样化需求\r\n\r\n④优化企业决策流程，提高企业技术水平', 1, 'A①②B①④C②③D③④', 'C', NULL, '2', 1, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:02:30');
INSERT INTO `questions` VALUES ('1074bd2b-25b7-4b77-a9fd-9d9c8488504d', 'utBLMIBCTN4heLOYFqhyfKc5PnZGIoHFxJyE', '中小企业作为我国社会主义市场经济的主体之一，在国民经济中发挥了巨大作用。据统计，2010年我国规模以上工业企业中，中小企业44．9万户，占比高达99．3%：从业人员7056万人，占比77．9%：上缴税金1．5万亿元，占比54．3%。由此可以看出，大力发燕尾服中小企业可以（     ）\r\n\r\n①扩大消费需要 \r\n\r\n②增加财政收入 \r\n\r\n③降低恩格尔系数 \r\n\r\n④提供就业岗位', 1, 'A①②B②③C②④D③④', 'C', NULL, '2', 1, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:30');
INSERT INTO `questions` VALUES ('11b40d16-f837-4e4d-9b1b-03b155c0de02', 'utBLMIBCTN4heLOYFqhyfKc5PnZGIoHFxJyE', '下列对象能构成集合的是', 1, 'A大于3的实数\r\nB二中所有年轻的教师\r\nC语文，英语，数学，物理，历史这五门课中难学的课程\r\nD所有个子高的人', 'A', NULL, '2', 1, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:02:30');
INSERT INTO `questions` VALUES ('135f9301-2f78-4e6e-aaef-b49673a31a45', 'utBLMIBCTN4heLOYFqhyfKc5PnZGIoHFxJyE', '下列关于集合的说法中，正确的是\r\n\r\n[ ]', 1, 'A绝对值很小的数的全体形成一个集合\r\nB方程x(x-1)2=0的解集是{1，0，1}\r\nC集合{1，a，b，c}和集合{c，b，a，1}相等\r\nD空集是任何集合的真子集', 'C', NULL, '2', 1, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:30');
INSERT INTO `questions` VALUES ('15b87874-7980-462d-9cc3-f61e4224e3dd', 'utBLMIBCTN4heLOYFqhyfKc5PnZGIoHFxJyE', '设P、Q为两个非空实数集合，定义集合P+Q={a+b|a∈P，b∈Q}，若P={0，2，5}，Q={1，2，6}，则P+Q中元素的个数为\r\n\r\n[ ]', 1, 'A9B8C7D6', 'B', NULL, '2', 1, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:02:30');
INSERT INTO `questions` VALUES ('17e6502e-cdc6-40d1-a233-7556bdf56cba', 'utBLMIBCTN4heLOYFqhyfKc5PnZGIoHFxJyE', '设集合A={0，1，2}，B={-1，1，3}，若集合P={(x，y)|x∈A，y∈B，且x≠y}，则集合P中元素个数为\r\n\r\n[ ]', 1, 'A3个B6个C9个D8个', 'D', NULL, '2', 1, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:30');
INSERT INTO `questions` VALUES ('19358e67-8ca4-4edd-8205-d28e87eac3d6', 'utBLMIBCTN4heLOYFqhyfKc5PnZGIoHFxJyE', '设P，Q为两个非空集合，定义集合P+Q={a+b|a∈P，b∈Q}，若P={0，2，5}，Q={1，2，6}，则P+Q中元素的个数是\r\n\r\n[ ]\r\n\r\n', 1, 'A9B8C7D6', 'B', NULL, '2', 1, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:30');
INSERT INTO `questions` VALUES ('1c46fa25-9538-46e0-b629-a682cf0aca9d', 'utBLMIBCTN4heLOYFqhyfKc5PnZGIoHFxJyE', '如图，两光滑斜面在B处连接，小球由A处静止释放，经过B、C两点时速度大小分别为3m/s和4m/s, AB=BC。设球经过B点前后速度大小不变，则球在AB、BC段的加速度大小之比为_______，球由A运动到C的平均速率为_______m/s。\r\n\r\n如图，两光滑斜面在B处连接，小球由A处静止释放，经过B、C两点时速度大小分别为3m/s和4m/s, AB=BC。设球经过B点前后速度大小不变，则球在AB、BC段的加速度大小之比为_______，球由A运动到C的平均速率为_______m/s。\r\n\r\n如图，两光滑斜面在B处连接，小球由A处静止释放，经过B、C两点时速度大小分别为3m/s和4m/s, AB=BC。设球经过B点前后速度大小不变，则球在AB、BC段的加速度大小之比为_______，球由A运动到C的平均速率为_______m/s。\r\n\r\n如图，两光滑斜面在B处连接，小球由A处静止释放，经过B、C两点时速度大小分别为3m/s和4m/s, AB=BC。设球经过B点前后速度大小不变，则球在AB、BC段的加速度大小之比为_______，球由A运动到C的平均速率为_______m/s。\r\n\r\n如图，两光滑斜面在B处连接，小球由A处静止释放，经过B、C两点时速度大小分别为3m/s和4m/s, AB=BC。设球经过B点前后速度大小不变，则球在AB、BC段的加速度大小之比为_______，球由A运动到C的平均速率为_______m/s。\r\n\r\n如图，两光滑斜面在B处连接，小球由A处静止释放，经过B、C两点时速度大小分别为3m/s和4m/s, AB=BC。设球经过B点前后速度大小不变，则球在AB、BC段的加速度大小之比为_______，球由A运动到C的平均速率为_______m/s。\r\n\r\n如图，两光滑斜面在B处连接，小球由A处静止释放，经过B、C两点时速度大小分别为3m/s和4m/s, AB=BC。设球经过B点前后速度大小不变，则球在AB、BC段的加速度大小之比为_______，球由A运动到C的平均速率为_______m/s。\r\n\r\n如图，两光滑斜面在B处连接，小球由A处静止释放，经过B、C两点时速度大小分别为3m/s和4m/s, AB=BC。设球经过B点前后速度大小不变，则球在AB、BC段的加速度大小之比为_______，球由A运动到C的平均速率为_______m/s。\r\n\r\n', 3, NULL, '9：7 ；2.1', '设AB=BC＝x，根据匀变速直线运动的规律，AB段有：；BC段有：，联立得；根据平均速率公式可知两段的平均速率分别为：所以全程的平均速度为', '5', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 14:29:04');
INSERT INTO `questions` VALUES ('1c5dc67c-c25f-4fc4-a0ed-cdee972283c0', 'utBLMIBCTN4heLOYFqhyfKc5PnZGIoHFxJyE', '如果力所作的功与物体运动路径无关，这种力叫做', 3, NULL, '保守力', NULL, '5', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:32');
INSERT INTO `questions` VALUES ('1c9d2da3-6ca0-464d-a8fe-affae6473c3e', 'utBLMIBCTN4heLOYFqhyfKc5PnZGIoHFxJyE', '振动方向与传播方向垂直的波，称为', 3, NULL, '横波', NULL, '5', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:32');
INSERT INTO `questions` VALUES ('1dc933aa-a149-44c5-bff0-6d93ee27e2a1', 'utBLMIBCTN4heLOYFqhyfKc5PnZGIoHFxJyE', '由于波源或观察者的运动而出现观测频率与波源频率不同的现象，称为', 3, NULL, '多普勒效应', NULL, '5', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:32');
INSERT INTO `questions` VALUES ('2035e45a-e86e-45d1-87c3-f87ea86ed759', 'utBLMIBCTN4heLOYFqhyfKc5PnZGIoHFxJyE', '变化的电场和变化的磁场交替产生，由近及远,以有限速度在空间传播的过程称为', 3, NULL, '电磁波', NULL, '5', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:32');
INSERT INTO `questions` VALUES ('206bf553-0499-4c56-8160-14c524b44e86', 'utBLMIBCTN4heLOYFqhyfKc5PnZGIoHFxJyE', '在点电荷q 激发的电场中作一个球面，当q 位于球面外时，通过球面的电通量为', 3, NULL, '0', NULL, '5', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:32');
INSERT INTO `questions` VALUES ('208e6915-b3ef-4e44-9165-f0d94fd602bd', 'utBLMIBCTN4heLOYFqhyfKc5PnZGIoHFxJyE', '通过任意闭合面的磁通量恒等于', 3, NULL, '0', NULL, '5', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:32');
INSERT INTO `questions` VALUES ('21702071-6a51-419c-8511-565798784439', 'utBLMIBCTN4heLOYFqhyfKc5PnZGIoHFxJyE', '生当作人杰，________。', 3, NULL, '死亦为鬼雄', NULL, '5', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:32');
INSERT INTO `questions` VALUES ('23dd8a2f-6c00-491d-8231-071c57576878', '1nW9vtP0VOzn1TIxoRWyOI7BJxnTppFNsFi7', '________，波撼岳阳城。', 3, NULL, '气蒸云梦泽', NULL, '5', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:45:32');
INSERT INTO `questions` VALUES ('25104be7-93e6-463d-a44d-76988f2124e1', 'xPqaXWHUXxkGVecvuC0hNV88QKlnmONRLTMZ', '软件的开发与运行经常受到硬件的限制和制约。', 4, NULL, 'T', NULL, '2', 1, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:02:45');
INSERT INTO `questions` VALUES ('251c1335-7788-4d2e-a15a-9f065d36f43b', 'xPqaXWHUXxkGVecvuC0hNV88QKlnmONRLTMZ', '草木有本心，________。', 3, NULL, '何求美人折', NULL, '5', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:32');
INSERT INTO `questions` VALUES ('271a5efb-a2fa-423e-9a2d-f5c115fafc49', 'xPqaXWHUXxkGVecvuC0hNV88QKlnmONRLTMZ', '人生自古谁无死，________。', 3, NULL, '留取丹心照汗青', NULL, '5', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:32');
INSERT INTO `questions` VALUES ('29a5c906-cc92-4f2a-8d26-43d5deaa2274', 'xPqaXWHUXxkGVecvuC0hNV88QKlnmONRLTMZ', '黄金若粪土，________。', 3, NULL, '肝胆硬如铁', NULL, '5', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:45:32');
INSERT INTO `questions` VALUES ('2b837f62-8b67-4f33-989e-878533aa83e4', 'xPqaXWHUXxkGVecvuC0hNV88QKlnmONRLTMZ', '枝上柳绵吹又少，________。', 3, NULL, '天涯何处无芳草', NULL, '5', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:32');
INSERT INTO `questions` VALUES ('2c90466b-a407-4e2f-b4f2-796681ec521d', 'xPqaXWHUXxkGVecvuC0hNV88QKlnmONRLTMZ', '________，道是无晴却有晴。', 3, NULL, '东边日出西边雨', NULL, '5', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:45:32');
INSERT INTO `questions` VALUES ('2e18aeea-eb35-46b1-831b-ccf7e6ac5500', 'xPqaXWHUXxkGVecvuC0hNV88QKlnmONRLTMZ', '模块内的高内聚往往意味着模块间的松耦合。', 4, NULL, 'T', NULL, '2', 1, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:45');
INSERT INTO `questions` VALUES ('2ed22298-458b-4a4a-ab82-7b72f9bb1322', 'xPqaXWHUXxkGVecvuC0hNV88QKlnmONRLTMZ', '不解三角形，下列判断中正确的是\r\n\r\n[ ]', 1, 'Aa=30，b=25，A=150°有一解\r\nBa=9，c=10，B=60°无解\r\nCa=6，b=9，A=45°有两解\r\nDa=7，b=14，A=30°有两解', 'A', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:30');
INSERT INTO `questions` VALUES ('317a3636-7624-4a4b-95d6-8be871b9ea6c', 'xPqaXWHUXxkGVecvuC0hNV88QKlnmONRLTMZ', '在△ABC中，sin2A=sin2B+sin2C+sinBsinC，则∠A等于\r\n\r\n[ ]\r\n\r\n', 1, 'A30°B60°C120°D150°', 'C', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:30');
INSERT INTO `questions` VALUES ('389e4966-df8b-48b8-afd8-e8ede85fcc52', 'xPqaXWHUXxkGVecvuC0hNV88QKlnmONRLTMZ', '设Sn是公差为d（d≠0）的无穷等差数列{an}的前n项和，则下列命题错误的是（　　）', 1, 'A若d＜0，则列数{Sn}有最大项\r\nB若数列{Sn}有最大项，则d＜0\r\nC若数列{Sn}是递增数列，则对任意n∈N*，均有Sn＞0\r\nD若对任意n∈N*，均有Sn＞0，则数列{Sn}是递增数列', 'C', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:30');
INSERT INTO `questions` VALUES ('3903cc31-da8a-4b73-aee2-0db63ed32f9f', 'xPqaXWHUXxkGVecvuC0hNV88QKlnmONRLTMZ', '已知等差数列{an}满足，a1＞0，5a8=8a13，则前n项和Sn取最大值时，n的值为（　　）', 1, 'A20B21C22D23', 'B', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('3b22768a-f213-4065-86f8-01f3a0375704', 'xPqaXWHUXxkGVecvuC0hNV88QKlnmONRLTMZ', '“λ＜1”是“数列an=n2-2λn（n∈N*）为递增数列”的（　　）', 1, 'A充分不必要条件B必要不充分条件C充要条件D既不充分也不必要条件', 'A', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('3bb31da2-a4be-494f-b7c1-65b4782f4c73', 'pg1z9J8SzfN54y1EWKLPjIN4Dj0rRHg9DIUA', 'Jackson图只能表达程序结构，不能表达数据结构。', 4, NULL, 'F', NULL, '2', 1, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:45');
INSERT INTO `questions` VALUES ('3cd1bac5-2e8f-427b-9143-9101a13a1f2b', 'PgpamMe9jiNLuGlkgpeKAZvzT0SxsEB6RCE5', '通常边覆盖和哪种标准一致？', 1, ' A、语句覆盖 B、判定覆盖 C、条件覆盖 D、组合覆盖 ', ' B', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('3d7c5a8b-d83d-48ef-802d-c34fe5d9cb7c', 'phdvNPe2esk0ygT58uqechsvKmDRPlCHaFou', '筛选正确的类与对象时，哪项不需要我们考虑？', 1, ' A、无关 B、操作 C、实现 D、结构 ', ' D ', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('3f0e92f9-1e9f-44b6-966d-85424a3dee2e', 'Pslvxt0OCVsNPSBOaiKumkk4HbQId92YPtxO', '软件可靠性模型使用故障率数据，估计软件将来出现故障的情况并预测软件的什么特性？', 1, ' A、可维护性 B、可靠性 C、可修改性 D、可移植性 ', 'B', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('45af5054-fbcc-4dcd-b5cb-7077977ad0e3', '3wJpK3EAG2xmKi1pZKIBX6VHZ7FP6L8TZYKm', '用户界面设计是一个怎样的过程？', 1, ' A、迭代 B、循环 C、顺序 D、变化 ', 'A ', NULL, '2', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('46f7da5c-9bb8-44f7-8d62-c622bfbb4404', 'FECZQOlni5vMg8axjxKNZAychPqOalM7xY6V', '什么是多重继承', 5, NULL, '指的是一个类别可以同时从多于一个父类继承行为与特征的功能。与单一继承相对', NULL, '10', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:39');
INSERT INTO `questions` VALUES ('47c8ccfd-6bd9-4b3f-b368-66fa2fe42de7', 'psRT2neveOrn2IjsdwlhnawHZvQ0NF7iRMv7', '应从哪些方面验证需求的正确性?', 5, NULL, '1）一致性 （2）完整性 （3）现实性 （4）有效性 （5）精确性', NULL, '10', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:39');
INSERT INTO `questions` VALUES ('49c582d8-8aa3-48bc-a128-e18f5ce0069f', '41nq7SkwDqSl6iKIe0Y58vD78jf5FSC6w7cy', '至少可以从哪些方面研究每种解法的可行性', 5, NULL, '1）技术可行性 （2）经济可行性 （3）操作可行性', NULL, '10', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:02:39');
INSERT INTO `questions` VALUES ('4ac1cf80-d81a-45f5-9891-06a9c5247314', 'FKq04eikUQmPVBetezbCDeUVkmd0VnOyMOTV', '总体设计阶段,完成的文档有哪几种?', 5, NULL, '1）系统说明 （2）用户手册 （3）测试计划 （4）详细的实现计划（5）数据库设计结果', NULL, '10', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:39');
INSERT INTO `questions` VALUES ('4c77d4d3-2def-420c-971f-43873286ae89', 'pXOnILB6Xqzw374yOX32d0qKvyZYda6fvljx', '代码省查比计算机测试的优越性表现?', 5, NULL, '减少工作量,提高效率.计算机测试发现错误后,需改正错误才能继续测试,错误是一个个发现并改正,但省查一次就可以查很多错误.', NULL, '10', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:39');
INSERT INTO `questions` VALUES ('4d1c00b7-8922-49ab-95b9-bfb01dfc7a6c', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '有哪几种维护活动?', 5, NULL, '1）改正性维护 （2）适应性维护 （3）完善性维护 （4）预防性维护', NULL, '10', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:39');
INSERT INTO `questions` VALUES ('4fb625df-4ae7-4611-b692-8cb5e4e636ea', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '面向对象方法学有哪些优点?', 5, NULL, '1）与人类习惯的思维一致 （2）稳定性好 （3）可重用性好（4）较易开发大型软件产品', NULL, '10', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:39');
INSERT INTO `questions` VALUES ('50344b11-8cac-4e86-846a-d4be205d60c6', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '类与类之间有那几种联系?', 5, NULL, '1）关联 （2）继承 （3）依赖 （4）细化', NULL, '10', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:39');
INSERT INTO `questions` VALUES ('504a8f2f-b211-420e-bbb6-b7881fde5905', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '大型系统对象模型层次组成?', 5, NULL, '（1）主题层 （2）类与对象层 （3）结构层 （4）属性层 （5）服务层', NULL, '10', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:02:39');
INSERT INTO `questions` VALUES ('54113a4d-fe65-4760-9912-0020dd21700e', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '测试单个类的方法有哪些?', 5, NULL, '（1）随机测试 （2）划分测试 （3）基于故障的测试', NULL, '10', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:02:39');
INSERT INTO `questions` VALUES ('5782a0c4-73e9-422c-8c6d-a8f50c9c388d', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '能力成熟度的5个等级?', 5, NULL, '（1）初始级 （2）可重复级 （3）已定义级 （4）已管理级 （5）优化级', NULL, '10', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:39');
INSERT INTO `questions` VALUES ('5b02612f-db55-4f18-88c5-470019a6146b', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '当前，网络售假问题制约着我国电子商务的进一步发展。2013年上半年中电子商务投诉与维权公共服务平台监测数据显示，网络售价问题是网友投诉最多的热点问题之一。\r\n\r\n（1）据材料一，运用经济生活知识，分析我国电子商务发展的经济意义。\r\n\r\n（2）运用经济生活知识，分析政府应如何解决材料二所示问题。', 5, NULL, '1）有利于拉动消费；有利于扩大就业；有利于带动相关产业发展；有利于优化资源配置；有利于促进经济结构调整；有利于促进社会主义市场经济发展。\r\n\r\n（2）加强宏观调控，综合运用经济手段、法律手段和必要的行政手段规范网络交易秩序；加强诚信建设，完善网络信用监督和失信惩戒制度。', NULL, '10', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:02:39');
INSERT INTO `questions` VALUES ('61b82578-636b-4545-9368-ef6637cd1191', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '阅读下列材料，结合所学知识回答问题。\r\n\r\n材料一：中国社科院人口专家认为，中国正面临一个劳动力从过剩到短缺的转折点——“刘易斯拐点”，劳动力的劳动年龄人口数量在2010年至2015年处于峰值，随后将不断下降，中国经济享受人口红利的时代即将过去。\r\n\r\n材料二：作为改革开放前沿的广东，目前面临着生产要素成本攀升、低附加值经济增长方式难以为继，原有竞争优势日趋弱化的挑战。如果不能实质性地转变经济发展方式，就有可能陷入经济学家所说的“中等收入陷阱”，即当一国或地区收入达到中等水平时，各类生产要素成本上升，劳动密集型生产的比较优势减少，经济增长因缺乏新的动力而速度下降或长期停滞。\r\n\r\n材料三：“十二五”时期是我国深化改革开放、加快转变经济发展方式的攻坚时期。综合判断国际国内形势，我国发展仍处于重要战略机遇期，既面临难得的历史机遇，也面临诸多挑战。\r\n\r\n（1）结合材料一，分析“刘易斯拐点”可能对我国劳动力市场产生的影响。\r\n\r\n（2）结合材料二，运用《经济生活》的相关知识，请你为广东避免陷入“中等收入陷阱”提出建议。\r\n\r\n（3）结合材料三，运用“当代国际社会”的相关知识，简述我国经济发展面临的有利和不利国际形势。', 5, NULL, '1）劳动力转向买方市场，工资水平上升；企业用工成本加大，劳动力成本的比较优势逐渐丧失。\r\n\r\n（2）转变经营战略，通过自主创新、提高员工素质等提高企业竞争力；加快产业结构升级，从劳动密集型生产方式向技术密集型生产方式转变；政府出台优惠措施，鼓励企业加大研发投入；实现从粗放型增长向集约型号增长的发展方式的转变。\r\n\r\n（3）\r\n\r\n有利形势：和平与发展仍是时代主题；世界多极化不可逆转，经济便于深入发展；国际形势总体稳定，有利于我国的和平发展。\r\n\r\n不利形势：霸权主义和强权政治仍是解决世界和平与发展的主要障碍；国家间贫富差距加大，国际经济秩序不公正和不合理，竞争日益加剧，保护主义抬头。', NULL, '10', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:39');
INSERT INTO `questions` VALUES ('63074ffa-0896-4ccd-8a7c-3be3b574109d', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '复杂系统的对象模型通常由5个层次组成，下列不属于其中的组成部分是？', 1, ' A、主题层 B、逻辑层 C、属性层 D、服务层 ', 'B ', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('63370657-91ef-4e54-8f72-700324460067', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '筛选正确的类与对象时，哪项不需要我们考虑？', 1, ' A、无关 B、操作 C、实现 D、结构 ', 'D ', NULL, '2', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('6348eb82-a6ef-4c19-bcb8-ff9c871631ef', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '软件可靠性模型使用故障率数据，估计软件将来出现故障的情况并预测软件的什么特性？', 1, ' A、可维护性 B、可靠性 C、可修改性 D、可移植性 ', 'B ', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('63b8092a-e88c-4ed2-a030-b1a208381a38', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '用户界面设计是一个怎样的过程？', 1, ' A、迭代 B、循环 C、顺序 D、变化 ', 'A ', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('6404bc2f-96e9-4bff-94b6-e17f0ef57d99', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '软件可靠性模型使用故障率数据，估计软件将来出现故障的情况并预测软件的什么特性？', 1, ' A、可维护性 B、可靠性 C、可修改性 D、可移植性 ', 'B ', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('65f6e79a-c947-4a61-9949-20c8ad0c6c0d', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', 'UML是哪个组织批准的基于面向对象技术的标准建模语言？', 1, ' A、OMG B、BIC C、BODD D、OMA ', ' A ', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('664507ca-763d-4cdb-aefb-e3a83e733ac0', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '通常可以通过描述软件交付使用后可能进行的活动有几项？', 1, ' A、1 B、2 C、3 D、4 ', 'D ', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('66f416d8-923c-4111-a9fa-9968c647155b', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '哪种模型表明了系统中数据之间的依赖关系，以及有关的数据处理功能？', 1, ' A、对象 B、动态 C、功能 D、用例 ', 'C ', NULL, '2', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('677bb6dd-8aae-4f9e-8ae0-33673729e91b', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '环形复杂度等于多少是模块规模的一个更科学更精确的上限？', 1, ' A、12 B、11 C、10 D、9 ', 'C ', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('67c49d8e-7fc7-4867-9106-31bf4264a86a', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '下列哪项不属于三种基本控制结构？', 1, ' A、顺序 B、选择 C、调用 D、循环 ', 'C ', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('69838de7-aebe-4b68-a9b7-2528aa14afb9', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '对象={ID,MS,DS,MI}，其中DS指的是？', 1, ' A、对象的名字 B、操作集合 C、对象的数据结构 D、消息名集合 ', 'C ', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('6dde2537-ba17-4e26-8715-bdcad1eb8146', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '复杂系统的对象模型通常由5个层次组成，下列不属于其中的组成部分是？', 1, ' A、主题层 B、逻辑层 C、属性层 D、服务层 ', 'B ', NULL, '2', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('6e48aec1-cb33-431b-a23f-e33528206f80', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', 'UML是哪个组织批准的基于面向对象技术的标准建模语言？', 1, ' A、OMG B、BIC C、BODD D、OMA ', 'A ', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('6f7514bd-f798-4d3f-b005-38397ddf68ed', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '一幅用例图不包括什么？', 1, ' A、系统 B、数据流 C、行为者 D、用例 ', 'B ', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('7af4fc4e-aa62-49b8-9dc7-4554aa6bf5de', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '数据流图具有多少种最基本的符号？', 1, ' A、1 B、2 C、3 D、4 ', 'D ', NULL, '2', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('7c45aba0-2be0-4d62-90c9-74770cffe8d8', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '软件工程学的主要目的是提高软件的什么，降低维护的代价？', 1, ' A、可测试性 B、可理解性 C、可维护性 D、可设计性 ', 'C ', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('7e202659-600f-4d04-9881-4868add83c3e', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '通常可以通过描述软件交付使用后可能进行的活动有几项？', 1, ' A、1 B、2 C、3 D、4 ', 'D ', NULL, '2', 2, 0, 1, '2024-04-11 17:38:56', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('7e554f23-9653-4e82-b76a-3b731c717da3', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '一个消息由3部分组成，下列哪项不属于消息的组成成分？', 1, ' A、接收消息的对象 B、消息选择符 C、实现代码 D、零个或多个变元 ', 'C ', NULL, '2', 2, 0, 1, '2024-04-11 17:38:56', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('86b43b6d-2d5f-429b-aced-4aa3ab4d1047', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '一个消息由3部分组成，下列哪项不属于消息的组成成分？', 1, ' A、接收消息的对象 B、消息选择符 C、实现代码 D、零个或多个变元 ', 'C ', NULL, '2', 2, 0, 1, '2024-04-11 17:38:56', '2024-04-16 15:02:31');
INSERT INTO `questions` VALUES ('86f85bec-09b6-47c0-b018-49e22dd6779b', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '软件定义时期的最后一个阶段是？', 2, ' A、问题定义 B、总体设计 C、需求分析 D、可行性研究 ', 'A,B,C,D', NULL, '4', 2, 0, 1, '2024-04-11 17:38:56', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('87b45955-58aa-4c55-ac66-85a1669a9ffe', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '软件开发过程中普遍存在的一种内在现象是？', 2, ' A、综合 B、迭代 C、建模 D、归纳 ', 'A,B,C', NULL, '4', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('8b50985f-303a-4f1b-b987-4bfe5a675217', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '用面向对象的方法开发软件，通常需要建立3种形式的模型，下列哪一种不属于需要建立的模型？', 2, ' A、对象模型 B、动态模型 C、ER模型 D、功能模型 ', 'A,B,C,D', NULL, '4', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('8bbdb828-f34d-411a-aa9d-95109f3d22ea', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '下列哪项不属于描绘软件结构的图形工具？', 2, ' A、层次方框图 B、层次图 C、HIPO图 D、结构图 ', 'A,B,C', NULL, '4', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('92dd0f54-6949-4e38-a4e0-76b2f4145df4', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '通常可以通过描述软件交付使用后可能进行的活动有几项？', 2, ' A、1 B、2 C、3 D、4 ', 'B,C', NULL, '4', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('94797c07-2ac1-443c-b9e9-2e802f25d0f8', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '下列哪项不属于应用形式化方法的准则？', 2, ' A、应该估算成本 B、应该建立详细的文档 C、可以放弃质量标准 D、应该重用 ', 'B,C', NULL, '4', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('95878cfd-fc8d-42f7-81aa-feec21a1c0ca', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '通常可以通过描述软件交付使用后可能进行的活动有几项？', 2, ' A、1 B、2 C、3 D、4 ', 'A,B,C,D', NULL, '4', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('95f356a0-694a-4a91-a731-0c1e5ffc1926', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '对象={ID,MS,DS,MI}，其中DS指的是？', 2, ' A、对象的名字 B、操作集合 C、对象的数据结构 D、消息名集合 ', 'B,C', NULL, '4', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('97a1fb5b-e81a-43ab-a727-dd7c49a952e2', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '用户界面设计是一个怎样的过程？', 2, ' A、迭代 B、循环 C、顺序 D、变化 ', 'A,C', NULL, '4', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('9aa5c563-4c89-401f-8fd0-94a28d3409f8', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '哪种图既能表达数据结构，也能表达程序结构？', 2, ' A、数据流 B、Jackson C、层次方框 D、IPO ', 'A,B,C,D', NULL, '4', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('9b91edba-df08-496f-aaa2-55712b20d701', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '面向对象方法学具有几个要点？', 2, ' A、1 B、2 C、3 D、4 ', 'A,B,D', NULL, '4', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('9cd878ac-d5ce-4b71-ba12-869eb3d71630', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '哪种模型表明了系统中数据之间的依赖关系，以及有关的数据处理功能？', 2, ' A、对象 B、动态 C、功能 D、用例 ', 'A,B,C,D', NULL, '4', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('a0d5d58f-f557-4283-a23b-4ee4eca3751a', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '软件定义时期的最后一个阶段是？', 2, ' A、问题定义 B、总体设计 C、需求分析 D、可行性研究 ', 'A,B,C,D', NULL, '4', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('a502d018-f351-4fbf-870b-a78134e1dd2e', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '下列哪项不属于描绘软件结构的图形工具？', 2, ' A、层次方框图 B、层次图 C、HIPO图 D、结构图 ', 'A,B,D', NULL, '4', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('aa2e7c39-2654-40b1-8fa2-363dae405f0b', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '下列哪项不属于描绘软件结构的图形工具？', 2, ' A、层次方框图 B、层次图 C、HIPO图 D、结构图 ', 'A,B,C,D', NULL, '4', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('aba63176-43b8-493b-b936-de2278316be9', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', 'UML是哪个组织批准的基于面向对象技术的标准建模语言？', 2, ' A、OMG B、BIC C、BODD D、OMA ', 'A,B,D', NULL, '4', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('ae57ab6b-be56-490b-88cf-0d05a3d6be3c', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '阅读材料，完成下列问题。\r\n\r\n　　随着我国财政收入稳定持续增加，综合国力不断增强，国家开始推行普惠式养老金制度，农民长期处于低福利、无国家养老保险的状态正在逐渐得到改善。2009年，320    个县开展新型农村社会养老保险(以下简称新农保)试点，1 300多万农村60岁以上的居民能够享受最基本的养老保障。\r\n\r\n　　新农保有三个筹资渠道，即个人缴费、集体补助和政府补贴。新农保由基础养老金和个人账户养老金构成，其中基础养老金全部由国家财政支付，直接补贴到农民的头上。这是继取消农业税、农业直补、新型农村合作医疗等一系列惠农政策之后的又一项重大惠农政策。\r\n\r\n（1）运用政治知识说明党和政府为什么要在农村实行普惠式养老金制度。\r\n\r\n（2）结合材料和所学知识，概括指出新农保筹资模式的特点，并说明新农保对经济发展的作用。', 5, NULL, '1）是践行党的全心全意为人民服务宗旨的要求，是我国政府的重要职责\r\n\r\n是促进城乡协调发展，构建社会主义和谐社会的内在要求，有利于巩固以工农联盟为基础的社会主义里国家政权。\r\n\r\n是维护农民权益的必然要求，有利于农村居民分享改革发展成果。\r\n\r\n（2）突出了国家财政在新农保中的重要作用。\r\n\r\n强调个人、集体、国家三者在筹资中都应承担相应的责任。\r\n\r\n基础养老金部分采用直接补贴方式。\r\n\r\n有利于引导农民合理消费，扩大内需，促进经济增长。\r\n\r\n有利于解除农民养老的后顾之忧，调动农民劳动积极性，提高劳动生产率。(若回答有利于缩小城乡差别、维护社会和谐稳定、是完善社会保障体系的重要内容等，可酌情给分)', NULL, '10', NULL, NULL, NULL, '2024-04-16 14:18:22', '2024-04-16 15:02:39');
INSERT INTO `questions` VALUES ('ae9ed72d-1f6f-48c2-9854-c62b075e2826', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '下面哪项不属于软件工程方法学的要素？', 2, ' A、方法 B、模型 C、工具 D、过程 ', 'A,B,D', NULL, '4', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('affdd844-e9cb-43d0-91fc-ee236431cfb9', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '下面哪项不属于软件工程方法学的要素？', 2, ' A、方法 B、模型 C、工具 D、过程 ', 'A,B,D', NULL, '4', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('b35cce8a-683e-4649-b559-07d631d432b3', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '环形复杂度等于多少是模块规模的一个更科学更精确的上限？', 2, ' A、12 B、11 C、10 D、9 ', 'A,B,D', NULL, '4', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('b6b4f08b-46e5-4302-866b-9e93f2433492', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '对象={ID,MS,DS,MI}，其中DS指的是？', 2, ' A、对象的名字 B、操作集合 C、对象的数据结构 D、消息名集合 ', 'A,B,C,D', NULL, '4', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('b809c6cf-0737-464a-a98f-04308ed4018c', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '子系统测试和系统测试又称为什么测试？', 2, ' A、单元 B、验收 C、集成 D、计算机 ', 'B,C', NULL, '4', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('bb753ddd-ffe7-4a83-80c3-c6d1c8ece097', 'tuOKtd7MXDbaqaXxcwkJ1E4wN8Y0vHK2hhkn', '一幅用例图不包括什么？', 2, ' A、系统 B、数据流 C、行为者 D、用例 ', 'B,C', NULL, '4', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('bbcbadb0-48cf-4f6c-b479-690f001d6f60', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '软件工程学的主要目的是提高软件的什么，降低维护的代价？', 2, ' A、可测试性 B、可理解性 C、可维护性 D、可设计性 ', 'A,B,C,D', NULL, '4', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:45:23');
INSERT INTO `questions` VALUES ('bf5c7e45-a8e1-400c-908d-e3593fc36e79', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '复杂系统的对象模型通常由5个层次组成，下列不属于其中的组成部分是？', 2, ' A、主题层 B、逻辑层 C、属性层 D、服务层 ', 'A,B,C,D', NULL, '4', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:45:24');
INSERT INTO `questions` VALUES ('c0f74fc2-03cd-47f3-9b75-b885b6e87426', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '环形复杂度等于多少是模块规模的一个更科学更精确的上限？', 2, ' A、12 B、11 C、10 D、9 ', 'A,C', NULL, '4', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:24');
INSERT INTO `questions` VALUES ('c26b3823-f3cf-40a7-a00b-977c833e7b07', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '筛选正确的类与对象时，哪项不需要我们考虑？', 2, ' A、无关 B、操作 C、实现 D、结构 ', 'A,C', NULL, '4', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:24');
INSERT INTO `questions` VALUES ('ca64d852-c26c-4dd7-8c0e-2aa6eef8d4cc', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '下列哪项不属于软件工程方法学的要素？', 2, ' A、方法 B、模型 C、工具 D、过程 ', 'A,C', NULL, '4', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:45:24');
INSERT INTO `questions` VALUES ('caa8b02b-696d-42f6-b7e6-e2d6a4664a2f', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '哪种模型表明了系统中数据之间的依赖关系，以及有关的数据处理功能？', 2, ' A、对象 B、动态 C、功能 D、用例 ', 'A,C', NULL, '4', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:24');
INSERT INTO `questions` VALUES ('cc5fe398-bfcc-48fd-b0b0-91df48ffb92f', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '下列哪项不属于三种基本控制结构？', 2, ' A、顺序 B、选择 C、调用 D、循环 ', 'A,C,D', NULL, '4', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:45:24');
INSERT INTO `questions` VALUES ('cc9da341-463e-4484-9c4c-f98ec1527677', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '完整、正确的脚本为建立哪种模型奠定了必要的基础？', 2, ' A、对象 B、动态 C、功能 D、用例 ', 'A,C', NULL, '4', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:24');
INSERT INTO `questions` VALUES ('cd73d5ce-3a7a-41ba-a027-195a22e7e4d9', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '通常可以通过描述软件交付使用后可能进行的活动有几项？', 2, ' A、1 B、2 C、3 D、4 ', 'A,C', NULL, '4', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:45:24');
INSERT INTO `questions` VALUES ('d057bb38-a4d7-48d3-b3af-8ae0a938b2d5', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '软件生命周期中需我进行需求分析，再进行可行性研究。', 4, NULL, 'F', NULL, '2', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:02:45');
INSERT INTO `questions` VALUES ('d285b047-feae-4f2e-b463-796370f1b213', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '软件的质量好坏主要由验收人员负责，其他开发人员不必关心。', 4, NULL, 'F', NULL, '2', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:02:45');
INSERT INTO `questions` VALUES ('d4f50e45-939c-4de0-9a28-0afa0337c197', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '阅读材料，完成下列要求。\r\n\r\n　　在信息技术快速发展的今天，不断出现的新产品和新服务正在改变着我们的生活，与此同时，侵害公民个人信息的事件和犯罪行为频发，个人信息安全问题日益凸显。\r\n\r\n材料一\r\n\r\n　　信息消费是指一种直接或间接以信息产品（如计算机、手机、智能电视机等）和信息服务（如电话、短信、微博、有线电视等）为消费对象的消费活动。\r\n\r\n　　近年来，信息消费日益成为消费热点，2012年，我国已是全球最大的通信和互联网用户市场。网民数量高达5.64亿。2013年，我国信息消费总额为2.2万亿元，较上年（下称“同比”）增长28%。同期，全国智能手机销售4.23亿部，同比增长99%，约占国内手机市场的70%；智能电视机销售2113万台，同比增长31%，约占国内电视机市场的40%。2012年，全国电话业务量同比下降5%，短信量下降20%，彩信量下降25%。与此形成对比的是，QQ、微博、微信的注册用户数和相应的移动互联网业务数据流量则大幅增长。\r\n\r\n材料二\r\n\r\n　　2009年，我国将公民个人信息纳入刑法保护。2012年，全国人大常委会表决通过关于加强网络信息保护的决定。2012年上半年，20个省、自治区、直辖市公安机关抓获侵害公民个人信息的犯罪嫌疑人1700余名。2013年，工业和信息化部联合其他部门制定的个人信息保护国家标准正式实施。该标准规定，个人信息管理者在处理个人信息时要遵循安全保障等原则，在收集身份证号码、手机号码和指纹等个人敏感信息之前，要得到个人信息主体的明确授权。\r\n\r\n（1）结合材料一和所学经济知识，概括我国当前信息消费的特点，并分析发展信息消费的积极作用。\r\n\r\n（2）结合材料二，运用政治生活知识，阐明为什么要对公民个人信息进行保护，并分别说明人大和政府应怎样保护公民个人信息。', 5, NULL, '（1）特点：我国信息消费市场规模大、网民数量多；信息产品消费总体发展快速，但细分产品市场发展不均衡；信息服务中的传统业务萎缩，新型业务发展迅速。\r\n\r\n（2）公民个人信息属于公民的合法权益，受法律保护。侵害公民个人信息，不仅是对公民合法权益的侵害，也会扰乱正常的社会秩序。\r\n\r\n人大要制定和完善保护公民个人信息的法律，监督法律的实施，政府要履行保护公民个人信息的职责，健全保护机制，依法打击侵害公民个人信息的行为。', NULL, '10', 5, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:39');
INSERT INTO `questions` VALUES ('d8a04501-fec0-46a8-a6d1-f3a33830933f', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '判定覆盖不一定包含条件覆盖，条件覆盖也不一定包含判定覆盖。', 4, NULL, 'T', NULL, '2', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:02:45');
INSERT INTO `questions` VALUES ('df355b4e-bedf-48d9-884a-53ead30169d1', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '应该尽量使用机器语言编写代码，提高程序运行效率，而减少高级语言的使用。', 4, NULL, 'F', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:45');
INSERT INTO `questions` VALUES ('df503d3e-8e17-49c4-a130-c3e105ca6b44', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', 'UML只能应用于软件系统模型的建立。', 4, NULL, 'F', NULL, '2', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:02:45');
INSERT INTO `questions` VALUES ('e0908702-d64e-4cb7-bf60-07454b51908e', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '容错就是每个程序采用两种不同的算法编写。', 4, NULL, 'F', NULL, '2', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:02:45');
INSERT INTO `questions` VALUES ('e166357e-6bb9-4def-b8f0-8f40e53e3aae', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '软件测试的目的是为了无一遗漏的找出所有的错误。', 4, NULL, 'F', NULL, '2', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:02:45');
INSERT INTO `questions` VALUES ('e1de5bac-7ee7-4e32-a46e-9a685b7ecc4e', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '在进行总体设计时应加强模块间的联系。', 4, NULL, 'F', NULL, '2', 2, 0, 1, '2024-04-11 17:38:54', '2024-04-16 15:02:46');
INSERT INTO `questions` VALUES ('e2626f01-c532-4f91-80ad-1faa184b5e9a', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '系统结构图是精确表达程序结构的图形表示法。因此，有时也可以将系统结构图当作统流程图使用。', 4, NULL, 'F', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:46');
INSERT INTO `questions` VALUES ('e4915b29-737f-4dcb-808c-d84649012a75', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '用黑盒法测试时，测试用例是根据程序内部逻辑设计的。', 4, NULL, 'F', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:46');
INSERT INTO `questions` VALUES ('e759a64e-7863-4906-bba0-42ed596f77b7', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '在程序调试时，找出错误的位置和性质比改正该错误更难。', 4, NULL, 'T', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:46');
INSERT INTO `questions` VALUES ('eb5881d7-0a2d-43ff-8fbb-c002b3588564', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '以对象、类、继承和通信为基础的面向对象设计方法(00D)也是常见的软件概要设计方法之一。', 4, NULL, 'T', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:46');
INSERT INTO `questions` VALUES ('f12a94e1-fbd4-49a5-be1c-94492d6b1295', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '如果通过软件测试没有发现错误，则说明软件是正确的。', 4, NULL, 'T', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:46');
INSERT INTO `questions` VALUES ('f151e6f6-0445-4b8f-9758-4450f6a0bf6e', 'BZBdBF7mZhufqOTBvoqnneDAdfRG5ImCwSNT', '快速原型模型可以有效地适应用户需求的动态变化。', 4, NULL, 'F', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:46');
INSERT INTO `questions` VALUES ('f696b3ee-e62f-4dd5-8c62-5f26846b1324', 'E5S8FUW1dkZtlxCHMud5HnesX4dSaNNcgc1X', '模块化，信息隐藏，抽象和逐步求精的软件设计原则有助于得到高内聚，低耦合度的软件产品', 4, NULL, 'T', NULL, '2', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:02:46');
INSERT INTO `questions` VALUES ('f95bd7f0-e1e7-4fb3-859d-ecf44874562c', 'JmNz9OQgAbrdTedoDInkXsRyPjvxmKseaQQ8', '哪种模型表明了系统中数据之间的依赖关系，以及有关的数据处理功能？', 2, ' A、对象 B、动态 C、功能 D、用例 ', 'A,C', NULL, '4', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:24');
INSERT INTO `questions` VALUES ('facfea2c-1b67-4d56-96af-823877558900', 'eKunP7tuXFuIzzlhFzV8IUmRdrhWiavdQXLF', '环形复杂度等于多少是模块规模的一个更科学更精确的上限？', 2, ' A、12 B、11 C、10 D、9 ', 'A,B,C,D', NULL, '4', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:24');
INSERT INTO `questions` VALUES ('fc2e3d1c-6154-4ad5-a098-c3637c3e5772', 'joMMKSgyeFEuhOGeXPYg7XLzjzNOAA6zSzTT', '下列哪项不属于三种基本控制结构？', 2, ' A、顺序 B、选择 C、调用 D、循环 ', 'A,B,C,D', NULL, '4', 2, 0, 1, '2024-04-11 17:38:55', '2024-04-16 15:45:24');

SET FOREIGN_KEY_CHECKS = 1;