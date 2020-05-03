# MySQL-Front 5.1  (Build 4.2)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: 127.0.0.1    Database: movie
# ------------------------------------------------------
# Server version 5.5.17

DROP DATABASE IF EXISTS `movie`;
CREATE DATABASE `movie` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `movie`;

#
# Source for table country
#

DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `countryName` varchar(30) DEFAULT NULL COMMENT '国家名称',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='国家表';

#
# Dumping data for table country
#

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (2,'大陆');
INSERT INTO `country` VALUES (4,'港台');
INSERT INTO `country` VALUES (5,'欧美');
INSERT INTO `country` VALUES (6,'日韩');
INSERT INTO `country` VALUES (7,'美国');
INSERT INTO `country` VALUES (8,'日本');
INSERT INTO `country` VALUES (9,'韩国');
INSERT INTO `country` VALUES (10,'法国');
INSERT INTO `country` VALUES (11,'德国');
INSERT INTO `country` VALUES (12,'印度');
INSERT INTO `country` VALUES (13,'泰国');
INSERT INTO `country` VALUES (14,'其它');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table hoby
#

DROP TABLE IF EXISTS `hoby`;
CREATE TABLE `hoby` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL COMMENT '用户编号',
  `countryId` int(11) DEFAULT NULL COMMENT '国家编号',
  `typeId` int(11) DEFAULT NULL COMMENT '类型编号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='兴趣爱好';

#
# Dumping data for table hoby
#

LOCK TABLES `hoby` WRITE;
/*!40000 ALTER TABLE `hoby` DISABLE KEYS */;
INSERT INTO `hoby` VALUES (1,2,2,5);
INSERT INTO `hoby` VALUES (2,2,4,6);
INSERT INTO `hoby` VALUES (3,2,5,7);
INSERT INTO `hoby` VALUES (4,7,13,17);
INSERT INTO `hoby` VALUES (6,8,4,18);
INSERT INTO `hoby` VALUES (8,9,4,17);
INSERT INTO `hoby` VALUES (9,9,13,18);
INSERT INTO `hoby` VALUES (10,10,2,9);
INSERT INTO `hoby` VALUES (11,10,2,9);
INSERT INTO `hoby` VALUES (12,12,0,17);
INSERT INTO `hoby` VALUES (13,12,12,0);
INSERT INTO `hoby` VALUES (14,14,8,12);
INSERT INTO `hoby` VALUES (15,14,7,9);
INSERT INTO `hoby` VALUES (16,15,7,9);
INSERT INTO `hoby` VALUES (17,15,7,13);
/*!40000 ALTER TABLE `hoby` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table manager
#

DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员';

#
# Dumping data for table manager
#

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (2,'tom','96e79218965eb72c92a549dd5a330112');
INSERT INTO `manager` VALUES (3,'bk','96e79218965eb72c92a549dd5a330112');
INSERT INTO `manager` VALUES (4,'root','96e79218965eb72c92a549dd5a330112');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table movie
#

DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '电影序号',
  `name` varchar(50) DEFAULT NULL COMMENT '电影名称',
  `startDate` date DEFAULT NULL COMMENT '上映时间',
  `countryId` int(11) DEFAULT NULL COMMENT '上映地区',
  `typeId` int(11) DEFAULT NULL COMMENT '电影类型',
  `director` varchar(30) DEFAULT NULL COMMENT '导演',
  `mainAct1` varchar(255) DEFAULT NULL COMMENT '主演1',
  `mainAct2` varchar(255) DEFAULT NULL COMMENT '主演2',
  `img` varchar(255) DEFAULT NULL COMMENT '封面图片',
  `introduce` text COMMENT '剧情简介',
  `rank` double DEFAULT '5' COMMENT '评分',
  `count` int(11) DEFAULT '0' COMMENT '播放量',
  `isPay` int(11) DEFAULT NULL COMMENT '1为会员电影0为普通',
  `movieSrc` varchar(255) DEFAULT NULL COMMENT '电影路径',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='电影表';

#
# Dumping data for table movie
#

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (22,'疯狂丑小鸭','2016-12-05',2,9,'蒋叶峰，郑成峰','张洋','杨进','1.png','影片讲述了丑小鸭和小伙伴丑小八为了找到琉璃鸟，推翻罗萨伯爵的统治而踏上冒险旅程的故事。 在遥远的地方有一个美丽的鸟类王国，但不久这里的宁静就被反对派的叛变打破，丑小鸭（苏倩芸 配音）的父母为了保护琉璃鸟而神秘失踪。为了解开琉璃鸟的秘密，找到自己的父母，丑小鸭和好朋友丑小八（王雪沁 配音）踏上了寻找老猫法师的征程，却不知道危险悄然而至。 在反对派的鼓动下鸟类对人类发动了战争，为了阻止战争的 进一步扩大，背负着天大秘密的丑小鸭毅然决然的登上了琉璃塔，前方等待他的将会是什么……',4.375,11,0,'Alan Walker - Alone.mp4');
INSERT INTO `movie` VALUES (24,'但丁密码[DVD版]','2016-12-05',7,15,'朗·霍华德','本·福斯特','汤姆·汉克斯','3.png','影片改编自丹· 布朗2013年出版的作品《地狱》，讲述了著名符号学专家罗伯特·兰登跟随一系列线索，一步步解密伟大诗人但丁的故事。 《但丁密码》改编自丹·布朗2013年的小说《地狱》，讲述了符号学教授罗伯特·兰登（汤姆·汉克斯 Tom Hanks 饰）在意大利一所医院中醒来，发觉自己头部受到重创且失忆，同时还受到多组人马追杀，女医生西恩娜·布鲁克斯（费莉西蒂·琼斯 Felicity Jones 饰）帮助他逃出医院，寻回记忆，在这一过程中发现隐藏在但丁、米开朗琪罗等大师作品里的一个惊天阴谋，有极端邪恶的科学家妄图利用病毒把地球变成但丁《神曲》中描绘的地狱。',3.5,2,0,'Alessia Cara - How Far I\'ll Go.mp4');
INSERT INTO `movie` VALUES (25,'古惑仔4：战无不胜','2016-12-05',4,9,'刘伟强','陈小春','郑伊健','5.png',' 该片讲述了洪兴社龙头蒋天养欲从山鸡、生蕃二人当中拣选一人担任屯门新任堂主，期间虽有雷耀扬从中阻拦，但在陈浩南的帮助下，山鸡最终成功当选。 黑社会洪兴社的屯门区话事人恐龙被东星社的耀扬杀害后，龙头蒋天养（万梓良）决定从山鸡（陈小春）和生蕃中选出一个填补该空缺，铜锣湾的话事人浩南（郑伊健）深知该职的压力，力劝山鸡放弃与人争权夺位，但苦劝无效。生蕃为打压山鸡，勾结耀扬设下诡计，令山鸡好友大天二死于非命。 另一方面，屯门区某中学教师欣欣（李嘉欣）一向反感黑社会，但在结识浩南后，对黑社会的以往印象有所改变，更在短短时间内对浩南产生倾慕之情，两人发生一夜情。然而因为生活于两个完全不同的世界，加上浩南始终无法对前女友（黎姿）忘情，他们的感情注定只能是无疾而终。',4.5,5,1,'TWICE - TT.mp4');
INSERT INTO `movie` VALUES (26,'时间机器','2016-12-05',7,9,'西蒙·威尔斯','盖·皮尔斯','西耶娜·盖尔利','7.png','《时间机器》是2002年上映的科幻电影，改编自赫伯特·乔治·威尔斯著同名科幻小说，由西蒙·威尔斯执导，盖·皮尔斯、萨曼莎·穆巴主演。 讲述了一位狂热的科学爱好者为了挽救未婚妻，研制时光机，穿梭时空的故事。 亚历山大（盖·皮尔斯 Guy Pearce 饰）博士是一位狂热的科学爱好者，他一直想证明时间旅行是可行的，并将全部的精力都投放到了时间机器的研究中。可是一天，未婚妻的意外离世让他悲愤不已，并加紧了时间机器的研制，希望能重返过去，拯救未婚妻的生命。时光机研制成功，亚历山大成功穿越到了过去，亲眼目睹了未婚妻的意外事故。可是无论他回到过去多少次，都没有办法救回未婚妻，未婚妻都会因为各种意外事故身亡。问题，到底出在了什么地方？亚历山大为了解开这个谜，将寻找答案的希望放在了过去。不停的穿越，不停的前往未来寻找答案……直到八十万年后的地球，亚历山大发现，人类已经进化到跟现在完全不一样。而那时的地球上分为了两个派系爱好和平的伊莱人和好战的莫洛人，为了帮助伊莱人摆脱莫洛人的统治，亚历山大不惜毁掉时光机，而他也发现了最终的秘密。',5,0,0,'BLACKPINK - PLAYING WITH FIRE.mp4');
INSERT INTO `movie` VALUES (27,'星际旅行5：终极先锋','2016-12-05',7,6,'威廉·夏特纳','伦纳德·尼莫伊','威廉·夏特纳','9.png','本片是《星舰迷航记》系列电影的第五集，由原班人马主演，但改由饰演寇克船长的威廉·赛特纳执导，也是他的导演处女作。故事描述一名神秘的疯狂幻想家赛布克占领了一个遥远的星球，劫持星际大使作人质，强迫企业号宇宙飞船紧急出发，进入没有人做访过的未知宇宙去寻找传说中的上帝，但上帝到底是谁呢？本片的开场颇具震撼力，可惜发展下去难以为继，使大部分的篇幅在过分玄奥的故事框架中兴圈子，只能靠壮观的视觉特效维持其吸引力，幸好结局是略有起色，不致令观众太过失望。 正在基地修整的企业号接受了一项紧急任务，科克船长一行奉命到属于中立区的宁布星球，解救遭到叛徒控制的乐园市民。叛军挟持了企业号到银河系中心去寻找根源。',3,0,1,'BLACKPINK - PLAYING WITH FIRE.mp4');
INSERT INTO `movie` VALUES (28,'星际旅行3：石破天惊','2016-12-05',7,6,'伦纳德·尼莫伊','伦纳德·尼莫伊','威廉·夏特纳','11.png','《星际旅行3：石破天惊》讲述了2285年，在与可汗的战斗中损坏的联邦星舰进取号，返回了地球的太空港以进行维修。柯克还在为斯波克的死感到悲伤。麦科伊医生出现了种种异常的行为：如擅自闯入被封锁的斯波克原来的舱房、胡言乱语等，最后他被送进了医院进行精神检查。斯科提被另分派到了联邦星舰精进号。星际舰队指挥部对新形成的创世星下达了禁入令。柯克被告知，进取号即将除役。 斯波克的父亲沙瑞克找到柯克并告诉他，斯波克的遗体必须返回瓦肯星，否则他的灵魂就不得安息。沙瑞克要求柯克必须回到创世星，寻回斯波克的遗棺并将它带回瓦肯星——而斯波克临死前与麦科伊进行了心灵融合，因此带有斯波克灵魂的麦科伊也必须前往瓦肯星。 可是，星际舰队拒绝让陈旧的进取号离开太空港。从医院出来后听闻消息的麦科伊，企图招募一艘飞船回到创世星。在与人争吵时他被逮捕，但这并没有影响到整个计划：在柯克、斯科特、苏鲁、乌乎拉和切科夫的帮助下麦科伊顺利逃脱，并一同登上了被废弃的进取号。为了避免被追击，斯科提还破坏了精进号的引擎。六名伙伴冒着毁掉毕生事业的风险，驾驶进取号航向创世星。 其间，克林贡人得知了创世计划和创世星的消息。由于担心联邦将其改造为一种新式武器，克鲁格船长率领一艘克林贡猛禽战舰，去夺取或摧毁这一战略性的武器。 在联邦星舰葛瑞森号上，戴维·马库斯博士与莎维可上尉在创世星的轨道上进行着科学观测。他们很快便在地面上发现了生命形式，出于好奇心的驱使，他们俩传送上了星球表面并发现了斯波克空荡的遗棺。循着生命形式的读数，他们发现了幼年斯波克的活体：成长速度奇快，但却没有意识或灵魂。 克林贡人在此时也抵达了创世星，他们摧毁了葛瑞森号并抓获莎维可、马库斯和少年的斯波克作为人质。不一会，进取号也抵达穆塔拉星区（Mutara Sector），很快就被克鲁格与他的一群克林贡战士攻击到瘫痪。由于克林贡人威胁将夺去人质的生命，柯克使用了一个计谋来重新掌控局势，但并未成功。戴维·马库斯随后被克林贡人杀害。由于没有其他的选择，柯克只得向克林贡人投降。柯克为了重新占据上风，冒死一搏启动了进取号的自毁程序。进取号的船员随后传送上了创世星，目睹着进取号在一片亮光中毁灭，同时也捎带上了克鲁格大部分的战士。 柯克最终与他的团队从克林贡人手中营救了斯波克与莎维可，并在与克鲁格的一对一战斗中杀死了他。由于创世星独特的力量，斯波克的遗体得以重生，并随着创世星衰老的速度迅速地成长。在离开不稳定的创世星时，斯波克刚好达到死亡前的年龄。在登上夺来的猛禽舰时，创世星开始了剧烈的爆炸。 在沙瑞克的庇护下，猛禽舰抵达了瓦肯星。在经历了危险的“浮图邦术”仪式后，斯波克的灵魂离开了麦科伊的意识回到了自己的身体中。仪式最终成功，复活的斯波克开始重新回忆他的过去与朋友。他问进取号的船员们，为什么要冒着失去生命与毁掉事业的危险营救他；柯克告诉他，有些时候需要“牺牲大我，成全小我”。',3.625,6,0,'Troye Sivan - WILD.mp4');
INSERT INTO `movie` VALUES (29,'星际旅行7：斗转星移','2016-12-05',7,6,'David Carson','帕特里克·斯图尔特','乔纳森·弗雷克斯','13.png','《星际旅行7：斗转星移》是星际迷航电影系列中的第七部。讲述疯狂博士苏伦野心勃勃，藉着武器毁灭宇宙，并走到一处没有时空界限的领域，进行连串恐怖计划。为了挽救人类安危，23世纪的太空船进取号舰长詹姆斯·柯克掉入时空，与24世纪的进取号舰长比皮卡德会合，阻止邪恶博士阴谋行动。寇克等人作为嘉宾乘新企业号试航，途中收到救援任务……而在另一时空，索伦博士正阴谋毁灭星球，攻击企业号。唯一能够帮助新船长皮卡特来阻止索伦的，只有销声匿迹了78年的寇克船长。',5,1,1,'Britney Spears - Slumber Party.mp4');
INSERT INTO `movie` VALUES (30,'绝地逃亡','2016-12-05',4,8,'雷尼·哈林','成龙','范冰冰','15.png','《绝地逃亡》是由雷尼·哈林执导的冒险动作片，成龙、约翰尼·诺克斯维尔、范冰冰等主演。讲述了一个背负承诺的退休警察和一个身为赌徒却恰巧目睹凶案现场的犯罪嫌疑人，在异国他乡开始了逃亡之旅的故事。 一个落魄警察（成龙 饰），一个滑头赌徒（约翰尼·诺克斯维尔 Johnny Knoxville 饰），一路南下追追逃逃。刚从俄罗斯黑手党中虎口脱险，又遇蒙古壮汉摔跤花式被虐，途径广西身陷急流险丢命，无奈香港黑帮穷追不舍……他们能否成功拯救白舒（范冰冰 饰）',5,0,0,'The Weeknd - M A N I A.mp4');
INSERT INTO `movie` VALUES (31,'警察故事2013','2016-12-05',4,9,'丁晟','成龙','景甜','17.png','刑警钟文（成龙 饰）一直忙于工作，对家庭始终怀有愧疚。这一天，搬出去独立生活的女儿苗苗（景甜 饰）竟然主动相约，钟文半是兴奋，半是忐忑的赶赴约定地点。约好的地方却是一个十足新潮的酒吧，张扬的搏击风格似乎让许多俊男靓女们如痴如醉，但钟文却始终隐隐感到有些怪异。父女见面并不顺利，当得知酒吧老板武江（刘烨 饰）竟是女儿的新男友时，钟文更是有些不知所措了。 　　正当谈话气氛陷入尴尬之时，酒吧内却发生意外劫持事件。农民工阿仓讨要工资不成，激动之下劫持了欠薪的老板牛总（刘仪伟 饰）。为了保护现场的人质，防止冲突升级，钟文隐瞒身份，以闲话家常般的口吻安抚阿仓。酒吧老板武江则抓住时机，以惊人的身手将阿仓制服。接到报案的警察终于赶来，众人本以为风波已经平息，却没想到酒吧内滨哥、皮颂、涛子等人却突然紧闭大门，暴力劫持了所有的顾客。钟文尽力保护人质，却被一直隐藏的武江偷袭，头部遭重击而昏迷。 　　苏醒过来的钟文已经落入以武江为首的一干劫匪的掌控。对手异常的镇静让钟文吃惊，面对酒吧外大批警察的包围，武江不为所动，反而执意与钟文玩起了“猜猜我是谁”的游戏。钟文虽然受困，但依然敏锐的捕捉到外围警方的突袭意图，言语之间捕捉着武江的犯罪动机，同时展开战术谈判，诱使武江进入射击位置——狙击手锁定目标即将射击之时，钟文终于意识到了这一切，都与5年前的一场劫持案有关。而那一起案件，同样也是钟文心头难以抹去的阴影。',5,0,0,'The Veronicas - On Your Side.mp4');
INSERT INTO `movie` VALUES (32,'我是谁','2016-12-05',7,9,'陈木胜','成龙','卢惠光','19.png',' 三名科学家在非洲大陆发现了一种神秘的矿石，这种矿石具有极强的杀伤力。就在这三名科学家携带矿石返回的途中，美国中央情报局派出了由11名来自不同国家的特种兵组成的特别行动小队将科学家和他们成果劫持了。 情报局内部出现了内鬼，想把这一成果据为己有。于是，他命令负责接应的飞行员制造了一次空难，以此来杀人灭口和掩饰其已夺取了成果。特别行动小队几乎全军覆灭，只有队员杰克（成龙 饰）侥幸逃生。 当杰克被当地的土著救活时，他因剧烈的碰撞而丧失了所有记忆，自己的名字、来历通通都一无所知。他逢人只会问“我是谁”。为了查明自己的身世，杰克回到了纽约……',5,0,1,'The Chainsmokers - Closer.mp4');
INSERT INTO `movie` VALUES (33,'尖峰时刻','2016-12-05',7,8,'布莱特·拉特纳','成龙','克里斯·塔克','21.png','韩大使（Tzi Ma 饰）驻派美国之前曾主持破获了中涛犯罪集团的走私活动，他因此受到仇家愤恨。在美国，中涛指示手下绑架了韩大使的女儿素洋（Julia Hsu 饰），并勒索赎金5千万美元。FBI闻讯展开全面调查，韩大使担心美方办事效率，执意要求调派香港的老搭档李督察（成龙 饰）前来协助。为了阻挠李抢先破案，FBI派出洛杉矶警察局状况不断的问题警探卡特（克里斯•塔克Chris Tucker 饰）作为李的搭档。卡特作风张扬高调，李则身手不凡、低调谨慎，这对临时组合的东西搭档闹出不少误会和笑话。但随着一次次危机发生，两人渐渐培养出默契。他们的营救行动最终能否成功？ 本片荣获1999年拉丁媒体艺术奖最佳女主角奖（Elizabeth Peña）、1999年MTV电影奖最佳银幕秀。 李警官（成龙饰演）在香港行政长官韩的协助下，一举截获5亿多美元赃款，可惜让主犯钱涛逃之夭夭。钱涛在海外纠集残部伺机报复，在洛杉矶绑架了韩的幼女小秀。虽然美国联邦调查局一口保证他们将抓获绑架者并将小秀完璧归赵，但韩长官仍放心不下，他认为只有一个人可以解救小秀，此人便是李警官。联邦调查局不愿外人染指案件侦破，碍于情面，他们决定让洛杉矶警察局最无能的警官詹姆斯·卡特做李的帮手。',4,1,1,'T-ara - Little Apple.mp4');
INSERT INTO `movie` VALUES (34,'尖峰时刻3','2016-12-05',7,8,' 布莱特·拉特纳','成龙','克里斯·塔克','23.png','严肃机警的李探长（成龙 饰）和贫嘴的警探James Carter (Chris Tucker饰)，在成功完成两次的跨国任务之后，这次又迎来了更加艰巨的任务。 调查“三和会”犯罪证据的韩领事被人暗杀，深感自责的李警官疯狂追击杀手，却被贬职当交警的James Carter帮了一个倒忙，理所当然，他们二日的奇特组合又开始 一方面，按照韩领事的线索，他们到了巴黎——这个“三和会”千方百计隐藏的心脏地带，克服重重困难，探索真相；另一方面，他们还要保护韩领事长大成人的女儿苏阳（张静初），而杀手，却是李探长小时候在孤儿院的好兄弟Kenji（Hiroyuki Sanada 饰）。 重重危机之下，二人如何应对？尖峰时刻，李探长的中国功夫将扭转乾坤。',5,0,0,'Shawn Mendes - Mercy.mp4');
INSERT INTO `movie` VALUES (35,'洪水泛滥之前','2016-12-05',7,19,'费舍·史蒂芬斯','莱昂纳多·迪卡普里奥','乔治·布什','25.png','《洪水泛滥之前》是费舍·史蒂芬斯执导的一部纪录片，小李是电影的制片人之一。 莱昂纳多·迪卡普里奥的全新纪录片终于揭开了神秘面纱。莱昂纳多·迪卡普里奥这部电影将在正在进行的多伦多国际电影节上亮相。这部纪录片几乎就是跟拍了小李子作为联合国大使游走世界各地考察环境的过程，马丁·斯科塞斯也有参与制片。由高清迅雷电影下载网编辑整理',3.5,0,1,'Shakira - Chantaje.mp4');
INSERT INTO `movie` VALUES (36,'电锯惊魂3','2016-12-05',7,13,'詹姆斯·温',' 丹尼·格洛弗','加利·艾尔维斯','27.png','在倒述的画面里，埃里克·马修警探用水箱盖打碎脚踝后逃出了浴室（第二集终结的场景），与阿曼达有了激烈的争吵，最后被阿曼达击倒了。在阿曼达离开之前，马修留下愤怒的咒骂，称阿曼达为“贩毒的贱女人”，说她并不能成为拼图杀人狂，使她十分的苦恼。在其他倒述的画面里，阿曼达在一开始就一直与约翰（拼图杀人狂）共事，遵从他的命令绑架亚当。但事实上，她以安乐死的方式使亚当窒息死亡。 艾莉森·凯莉警探、瑞格中尉以及霍夫曼捡视拼图杀人狂的受害者特洛伊时，发现他的机关并无法逃脱。凯莉回家时被绑架，醒来时发现她正处在一个机关内，当她试着使用所提供的方法逃脱时，阿曼达出现了，凯莉才发现这个机关也是无法脱逃，机关启动后她就死了。 同时，濒临死亡的拼图杀人狂下令多绑架两个受害者：医术高明但忧郁的医师莲恩·戴伦、一心为死去儿子报仇的父亲杰夫·雷恩哈特。阿曼达在莲恩的脖子上装上一个颈圈，颈圈上有五个上膛的子弹发射装置，以无线电的方式与拼图杀人狂的心电仪连接。莲恩的游戏规则相当简单──在杰夫完成试验时使约翰活着，如果她试着逃离侦测的区域或使约翰死亡，她颈部的项圈将会引爆。杰夫的游戏规则就是要拯救其他三位他原本想报仇的对象脱离机关，但他起初的犹豫不决使得每个人都无法脱离机关而死亡（虽然其中仁慈的法官获救，但他在拯救他人时误触机关死亡）。杰夫完成他的试验之后，他开始找寻拼图杀人狂。 莲恩成功地使约翰活下来。约翰在半梦半醒之间表明他对前妻吉尔的爱，阿曼达误以为约翰是在对莲恩表白，一时感到嫉妒及愤怒，不听从他取下莲恩颈圈的命令。杰夫到达拼图杀人狂的房间后，阿曼达开枪射伤莲恩，同时杰夫也开枪射杀阿曼达。阿曼达死去前，约翰告诉她她的表现很令人失望，事实上这是对阿曼达的一个考验。她射伤莲恩而激怒了杰夫，可以说是她的嫉妒使她迈向死亡。拼图杀人狂在最后才说出杰夫和莲恩本是夫妻的事实。 最后，约翰要求杰夫能够原谅他，并且告诉杰夫说，杰夫应该为他儿子的死亡负责。杰夫有点迟疑，吞吞吐吐的说他原谅约翰，但却拿了一把锯刀划过约翰的喉咙。约翰录了一卷录音带，内容为莲恩机关的详细内容，他表明他已经成功的杀了莲恩，之后杰夫发现他的女儿正被关在一个空气不足的房间里，他必须闯关成功才能找到她。房间的门关上了，拼图杀人狂死了，莲恩因颈圈引爆也死了，只剩下杰夫一人大声求救',4,0,1,'Pitbull - We Are One (Ole Ola).mp4');
INSERT INTO `movie` VALUES (37,'电锯惊魂','2016-12-05',7,15,'詹姆斯·温','丹尼·格洛弗','莫妮卡·波特','29.png','《电锯惊魂》讲述了亚当被人扔在有水的浴缸里，他醒来后立刻挣扎了出来，发现自己身处一间破败的地下室内，一只脚被铐在一段锈蚀的铁水管上。在他的对面还铐着另外一个人，同样是一位不知所措的被绑架者-----劳伦兹·戈登医生。在房间中央有一具躺在血泊中的尸体，他的手里握着一把点38手枪。 没有人知道自己为何被绑，更不明白自己为什么会出现在这个诡异的地方，没有人知道自己该做什么，但凶手却已将指示留给了他们。那具尸体右手握着一部小型录音机，里面录着绑架者的指令：戈登必须在6个小时之内杀死亚当，如果任务失败，不仅两个人都要死，戈登的家人也会惨遭毒手。 绑架者的这些做法不禁让戈登想起了警探泰普正在调查的一个凶手，这个精神变态的凶手喜欢将自己认为没有珍惜自己生命的受害者绑架，让他们在相互残杀中体验生命的价值。他和亚当两人已经成为了凶手的棋子，面临着和从前受害者相似的命运。 距离死亡的期限只有几个小时了，可是双方的实力对比又是如此悬殊：凶手似乎对他们了如指掌，而他们却只知道他是一个绰号“竖锯”的精神分裂狂徒；凶手控制着两个人和他们家人的命运，可他们能够从现场获得的蛛丝马迹似乎都是凶手有意留下的；凶手用各种设备掌握着他们的行动，却只给他们留下了两只手锯——它们不足以打开他们的脚链，却完全可以锯断脚腕逃出去。 在装手锯的袋子里，放着几张相片，正是亚当受泰普所雇而拍摄的戈登的一举一动。在摄有戈登房屋窗户的一张照片里，戈登医生意外发现了一个人影，正是医院的一名清洁工——赛普。这时他们断定赛普就是“竖锯”。 而此时的赛普确实绑架着戈登的家人，并给戈登打电话催促他尽快杀掉亚当（手机只能接听），然而戈登不忍心杀害亚当。戈登妻子与赛普争斗中通话中断，手机通话中断，戈登将手机也抛在了一边，结果戈登妻子得救，赛普逃跑。戈登妻子再度通电给戈登，戈登却由于刚刚将手机抛掉且脚被锁住，无法拿到手机。手机铃声响着，戈登在狂躁与绝望之下锯断了自己的脚，锯脚的过程中手机不再响了。戈登拖着断腿爬了出去。 戈登爬走后，被留在那里的亚当，发现了这一切背后的真相……',4,0,1,'ONE OK ROCK - Bedroom Warfare.mp4');
INSERT INTO `movie` VALUES (38,'十三号星期五','2016-12-05',7,15,'肖恩·S·坎宁安','凯文·贝肯','Adrienne King','31.png',' 1958年，水晶湖营地发生一起两人死亡的命案，而这只是陆续发生在水晶湖旁的一系列凶案和怪事之一，多年以来，附近居民视营地为不祥之地，有意无意敬而远之。水晶湖营地的老板史蒂夫为重整营地，雇佣六名辅导员一起将营地翻新，爱丽丝、杰克（凯文•贝肯 Kevin Bacon 饰）等六人性格活跃，不时用恶作剧缓解无聊的营地生活。另一方面，厨师安妮奔赴营地而来，却在临近村落受到了“疯子”劳夫的警告，结果安妮未到营地，便被害死在路上。水晶湖营地的怪事频现，蛇和劳夫先后拜访辅导员们，为当地的传言更增添了注脚。当夜大雨倾盆，各行其是的辅导员们先后被杀害，而凶手，就潜藏在他们的周围。一群少年怀着好奇之心悄悄地进入到水晶湖旁一个废弃营地。在树林里，却集体失踪了……六周之后，男孩特伦特邀请他的一帮朋友来到水晶湖旁参加他父亲的小木屋周末狂欢派对，此时，一个名叫克莱的男孩出现，并告之他是来到这里寻找六周前失踪的妹妹的。由于警方搜寻无踪，所以克莱才决定独自寻找妹妹，当地居民劝告他不要进入树林，因为任何一个失踪的人都遇害了，但克莱坚持己见。他们找到水晶湖被废弃的营地，在里面寻找各种可能的线索。然而很快他们发现自己将面对一个蒙面的恶魔，而他正是杀人狂魔杰森。',5,0,0,'OK GO - The One Moment.mp4');
INSERT INTO `movie` VALUES (39,'生化岛','2016-12-05',7,5,'尼克里昂','约瑟夫·劳伦斯',' Maryse Mizanin','33.png',' 《生化岛》讲述了十年前，政府在南太平洋的一座孤立热带小岛上建造了一座庞大的试验工厂，委派了一队科学家进行秘密实验。十年后的今天，一支海豹突击队进入岛上后消失，于是政府又派出一支攻击分队上岛调查情况，当他们抵达后，发现岛上早已被丧尸占据，残酷的战斗开始了..',5,4,0,'Meghan Trainor - NO.mp4');
INSERT INTO `movie` VALUES (40,'与歌同行','2016-12-05',7,7,'詹姆斯·曼高德','瑞茜·威瑟斯彭','杰昆·菲尼克斯','35.png','约翰·卡什（杰昆·菲尼克斯 Joaquin Phoenix 饰）本是个阿肯色州乡村小子，儿时一场意外令他弟弟身故，从此他便活在父亲（罗伯特·帕特里克 Robert Patrick 饰）的谴责和嘲讽下无力翻身。爱音乐的他慢慢以乡村歌手成名，也有了自己的家庭，但外出巡演时偶然接触到毒品慢慢令他不能自拔，将他带入深渊。吸毒令妻子薇薇安（詹妮弗·古德温 Ginnifer Goodwin 饰）带着孩子离开了他，他只好去找心仪已久、但因婚姻在身无法在一起的女歌手琼·卡特（莉丝·威瑟斯彭 Reese Witherspoon 饰），后者给予他援手，帮助他戒毒，却也一次次拒绝了他的求爱。戒毒成功的卡什得以重启事业，和卡特的爱情也在两人的舞台上终成正果。',4,0,0,'Maroon 5 - Don\'t Wanna Know.mp4');
INSERT INTO `movie` VALUES (41,'泰坦尼克号','2016-12-05',7,7,'詹姆斯·卡梅隆 ','莱昂纳多·迪卡普里奥','凯特·温丝莱特','37.png',' 《泰坦尼克号》是美国20世纪福克斯公司和派拉蒙影业公司共同出资，于1994年拍摄的一部浪漫的爱情灾难电影，由詹姆斯·卡梅隆创作、编辑、制作、导演及监制，莱昂纳多·迪卡普里奥、凯特·温斯莱特主演。影片于1997年11月1日在东京首映。 影片以1912年泰坦尼克号邮轮在其处女启航时触礁冰山而沉没的事件为背景，描述了处于不同阶层的两个人——穷画家杰克和贵族女露丝抛弃世俗的偏见坠入爱河，最终杰克把生命的机会让给了露丝的感人故事。 该片上映全球票房超过18亿美元，是1997年至2010年间票房最高的电影，并获得第70届奥斯卡金像奖最佳影片、最佳导演奖等11项奖。《泰坦尼克号》在2012年4月4日以3D版形式再度上映，纪念泰坦尼克号沉船事件100周年，3D版上映后中国票房是9.87亿元，北美票房5700万美元，全球票房3.44亿美元，总票房已达到21.87亿美元。 1912年4月10日，号称 “世界工业史上的奇迹”的豪华客轮泰坦尼克号开始了自己的处女航，从英国的南安普顿出发驶往美国纽约。富家少女罗丝（凯特•温丝莱特）与母亲及未婚夫卡尔坐上了头等舱；另一边，放荡不羁的少年画家杰克（莱昂纳多·迪卡普里奥）也在码头的一场赌博中赢得了下等舱的船票。 罗丝厌倦了上流社会虚伪的生活，不愿嫁给卡尔，打算投海自尽，被杰克救起。很快，美丽活泼的罗丝与英俊开朗的杰克相爱，杰克带罗丝参加下等舱的舞会、为她画像，二人的感情逐渐升温。 1912年4月14日，星期天晚上，一个风平浪静的夜晚。泰坦尼克号撞上了冰山，“永不沉没的”泰坦尼克号面临沉船的命运，罗丝和杰克刚萌芽的爱情也将经历生死的考验。',3,0,1,'Kanye West - Fade.mp4');
INSERT INTO `movie` VALUES (42,'罗马假日','2016-12-05',7,7,'威廉·惠勒',' 奥黛丽·赫本','格利高里·派克','39.png',' 《罗马假日》（Roman Holiday）是1953年由美国派拉蒙公司拍摄的浪漫爱情片，讲述了一位欧洲某公国的公主与一个美国记者之间在意大利罗马一天之内发生的浪漫故事。 英国的安妮公主到罗马去访问，国务烦身，但她又厌倦繁文缛节。一天晚上，身心俱疲的她偷偷来到民间欣赏夜景，巧遇报社记者乔。二人把手同游，相当快乐。公主更是到乔的家中作客并在那过夜。 不料乔无意中发现了公主的真实身份，他决定炮制一个独家新闻，于是乔偷拍了公主的很多生活照，看到了成名的曙光。然而，在接下来与公主的相处中，乔不知不觉恋上了公主。为了保护公主的形象，乔只能忍痛抛弃功成名就的良机，将照片送予了公主。 安妮公主在经历了罗马一日假期后，反而体验了自己对国家的责任，毅然返回了大使馆，为了本身的责任而果断抛弃了爱情。',2,0,1,'Hardwell - Get Down.mp4');
INSERT INTO `movie` VALUES (43,'美丽人生','2016-12-05',5,7,'罗伯托·贝尼尼','罗伯托·贝尼尼','尼可莱塔·布拉斯基','41.png',' 该片讲述了一对犹太父子被送进了纳粹集中营，父亲利用自己的想像力扯谎说他们正身处一个游戏当中，最后父亲让儿子的童心没有受到伤害，而自己却惨死的故事。1999年，该片在第71届奥斯卡奖获得了最佳外语片、最佳男主角、最佳配乐三项奖项。 犹太青年圭多（罗伯托·贝尼尼）邂逅美丽的女教师多拉（尼可莱塔·布拉斯基），他彬彬有礼的向多拉鞠躬：“早安！公主！”。历经诸多令人啼笑皆非的周折后，天遂人愿，两人幸福美满的生活在一起。 然而好景不长，法西斯政权下，圭多和儿子被强行送往犹太人集中营。多拉虽没有犹太血统，毅然同行，与丈夫儿子分开关押在一个集中营里。聪明乐天的圭多哄骗儿子这只是一场游戏，奖品就是一辆大坦克，儿子快乐、天真的生活在纳粹的阴霾之中。尽管集中营的生活艰苦寂寞，圭多仍然带给他人很多快乐，他还趁机在纳粹的广播里问候妻子：“早安！公主！” 法西斯政权即将倾覆，纳粹的集中营很快就要接受最后的清理，圭多编给儿子的游戏该怎么结束？他们一家能否平安的度过这黑暗的年代呢？',5,0,0,'Hailee Steinfeld - Starving.mp4');
INSERT INTO `movie` VALUES (44,'爱情与友谊','2016-12-05',10,8,' 惠特·斯蒂尔曼','凯特·贝金赛尔','斯蒂芬·弗雷','43.png',' 改编自Jane Austen书信体小说Lady Susan，讲述了一个爱慕虚荣的上层社会寡妇Lady Susan为她自己和女儿寻找如意郎君的故事。 本片设定在简·奥斯汀生活的英国摄政时期，讲述美丽精明的苏珊·弗农夫人，力求为自己的女儿找到有钱的如意郎君的荒唐故事。',4,1,1,'DNCE - Body Moves.mp4');
INSERT INTO `movie` VALUES (45,'新大头儿子和小头爸爸2一日成才','2016-12-05',2,12,'何澄，张振益','林永健','刘纯燕 ','45.png','《新大头儿子和小头爸爸2：一日成才》是由央视动画有限公司出品的家庭科幻喜剧动画电影，由何澄、张振益联合执导，鞠萍、董浩、刘纯燕、郏捷、耿晨晨、何子然、陈苏、霍小雷、黄炜等参与配音。影片围绕“成长与成才”为主题，讲述了大头儿子一家在孩子成长过程中遭遇困惑、不惧艰难、共同面对的故事。 大头儿子（刘纯燕 配音）尽管聪明懂事，却到底只是个孩子，无法克制内心里爱玩的冲动，耽误了学业，将这一切看在眼里的围裙妈妈（鞠萍 配音）十分焦急，不知该如何是好。某日，小头爸爸（董浩 配音）在偶然之中遇见了一位名叫王博士（林永健 配音）的神秘人物，王博士发起了名为“一日成才”的行动，声称能在极短的时间内制造天才。 望子成龙的围裙妈妈决定将大头儿子送到王博士处进行“改造”，而事情的结果也令她感到十分满意，然而，随着时间的推移，大头儿子身上开始慢慢浮现种种弊端，与此同时，王博士一手策划的阴谋亦渐渐浮出了水面。',3,0,0,'DJ Snake - Let Me Love You.mp4');
INSERT INTO `movie` VALUES (46,'蜡笔小新：爆睡！在梦的世界大突击','2016-12-05',8,12,'高橋渉','藤原啓治',' 矢島晶子','47.png','《蜡笔小新：爆睡！在梦的世界大突击》的故事发生在梦的世界里。剧团一人从很早之前就一直对“梦”非常感兴趣，这次他将“梦”选为作品的主题，要为观众们展现出“梦”不可思议的魅力。在本作中，小新立志要改变一名少女的命运，并且拼命帮助朋友。 《蜡笔小新》第24部剧场版《蜡笔小新：爆睡！在梦的世界大突击》由谐星剧团一人和高桥涉导演共同担任编剧，日前该片宣布安田显、吉濑美智子和谐星总之很开朗安村将担任嘉宾声优，为该片配音。',5,0,1,'Zedd - Ignite.mp4');
INSERT INTO `movie` VALUES (48,'ceshi','2016-12-06',2,18,'cskjd','dka','dkla','myselfbg.jpg','图片建议尺寸：320像素x240像素\r\n\r\n仅支持.jpg .jpeg .bmp .png格式\r\n\r\n长方形照片，大小不超过200K',5,0,1,'1234.mp4');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table movieimg
#

DROP TABLE IF EXISTS `movieimg`;
CREATE TABLE `movieimg` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `movieId` int(11) DEFAULT NULL COMMENT '电影序号',
  `img` varchar(255) DEFAULT NULL COMMENT '图片',
  `imgDesc` text COMMENT '剧照简介',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='剧照';

#
# Dumping data for table movieimg
#

LOCK TABLES `movieimg` WRITE;
/*!40000 ALTER TABLE `movieimg` DISABLE KEYS */;
INSERT INTO `movieimg` VALUES (1,11,'1','急招简介大家快来发酵的看法拉科技的酸辣粉代课老师打算开发老家啊考了多少分金科路');
INSERT INTO `movieimg` VALUES (2,11,'20151009162233.png','急招简介大家快来发酵的看法拉科技的酸辣粉代课老师打算开发老家啊考了多少分金科路');
INSERT INTO `movieimg` VALUES (3,11,'detil_item.jpg','急招简介大家快来发酵的看法拉科技的酸辣粉代课老师打算开发老家啊考了多少分金科路');
INSERT INTO `movieimg` VALUES (5,11,'20150827171215.jpg','11');
INSERT INTO `movieimg` VALUES (7,11,'235037-1401140R405100.jpg','11');
INSERT INTO `movieimg` VALUES (9,11,'detil_item.jpg','阿萨德撒所多');
INSERT INTO `movieimg` VALUES (11,11,'111.png','急招简介大家快来发酵的看法拉科技的酸辣粉代课老师打算开发老家啊考了多少分金科路');
INSERT INTO `movieimg` VALUES (12,12,'img3.jpg','dasfadfas');
INSERT INTO `movieimg` VALUES (13,12,'myselfbg.jpg','haohawan');
INSERT INTO `movieimg` VALUES (14,13,'myselfbg.jpg','白坤在吃屎');
INSERT INTO `movieimg` VALUES (15,13,'detil_item.jpg','白坤还是在吃屎');
INSERT INTO `movieimg` VALUES (16,15,'myselfbg.jpg','旅行');
INSERT INTO `movieimg` VALUES (17,15,'psb (1).jpg','游玩');
INSERT INTO `movieimg` VALUES (18,16,'LQB.jpg','这人有毒、');
INSERT INTO `movieimg` VALUES (19,20,'图片2.png','成长的烦恼，疯狂的旅行');
INSERT INTO `movieimg` VALUES (20,21,'2.png','adsfadfadfsdasffd');
INSERT INTO `movieimg` VALUES (21,22,'2.png','成长的烦恼，疯狂的旅行');
INSERT INTO `movieimg` VALUES (22,23,'图片4.png','韩版中字，一步步解密伟大诗人但丁的故事 \r\n又名： 地狱(台) , 地狱解码(港) , Inferno ');
INSERT INTO `movieimg` VALUES (23,24,'4.png','韩版中字，一步步解密伟大诗人但丁的故事');
INSERT INTO `movieimg` VALUES (24,25,'6.png','郑伊健陈小春动作片');
INSERT INTO `movieimg` VALUES (25,26,'8.png','过去是记忆，理想是未来');
INSERT INTO `movieimg` VALUES (26,27,'10.png','《星舰迷航记》系列电影的第五集');
INSERT INTO `movieimg` VALUES (27,28,'12.png','《星舰迷航记》第三部');
INSERT INTO `movieimg` VALUES (28,29,'14.png','经典科幻大片');
INSERT INTO `movieimg` VALUES (29,30,'16.png','大哥可以击退所有敌人，为什么要逃呢');
INSERT INTO `movieimg` VALUES (30,31,'18.png','刘烨做局成龙上演困兽斗');
INSERT INTO `movieimg` VALUES (31,32,'20.png','成龙巅峰之作');
INSERT INTO `movieimg` VALUES (32,33,'24.png','成龙，克里斯·塔克主演的喜剧动作片');
INSERT INTO `movieimg` VALUES (33,34,'24.png','剧情轻松幽默，乐趣横生');
INSERT INTO `movieimg` VALUES (34,35,'26.png','记录小李子作为联合国大使考察各地环境，提及北京雾霾');
INSERT INTO `movieimg` VALUES (35,36,'28.png','电锯惊魂系列第三部');
INSERT INTO `movieimg` VALUES (36,37,'30.png','两个只能活一个');
INSERT INTO `movieimg` VALUES (37,38,'32.png','黑色星期五第一部，杰森来了');
INSERT INTO `movieimg` VALUES (38,39,'34.png','小成本丧尸片');
INSERT INTO `movieimg` VALUES (39,40,'36.png','那似曾相识的感觉');
INSERT INTO `movieimg` VALUES (40,41,'38.png','影史上的精品之作，同类影片中的极品');
INSERT INTO `movieimg` VALUES (41,42,'40.png','天下有罗马,却无那样的假日');
INSERT INTO `movieimg` VALUES (42,43,'42.png','用爱编织的美丽谎言,催人泪下的父爱如山 ');
INSERT INTO `movieimg` VALUES (43,44,'44.png','颠覆你对珍奥斯汀的纯爱偏见');
INSERT INTO `movieimg` VALUES (44,45,'46.png','时代在变，人物不变');
INSERT INTO `movieimg` VALUES (45,46,'48.png','修复平板格式，发生在梦的世界里');
INSERT INTO `movieimg` VALUES (46,48,'20151009162141.png','写一段代码看看');
INSERT INTO `movieimg` VALUES (47,48,'20151009162233.png','截个图看一下截个图看一下截个图看一下截个图看一下截个图看一下截个图看一下截个图看一下截个图看一下截个图看一下');
/*!40000 ALTER TABLE `movieimg` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table mtype
#

DROP TABLE IF EXISTS `mtype`;
CREATE TABLE `mtype` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(30) DEFAULT NULL COMMENT '类型描述',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='类型';

#
# Dumping data for table mtype
#

LOCK TABLES `mtype` WRITE;
/*!40000 ALTER TABLE `mtype` DISABLE KEYS */;
INSERT INTO `mtype` VALUES (5,'恐怖片');
INSERT INTO `mtype` VALUES (6,'科幻片');
INSERT INTO `mtype` VALUES (7,'爱情片');
INSERT INTO `mtype` VALUES (8,'喜剧片');
INSERT INTO `mtype` VALUES (9,'动作片');
INSERT INTO `mtype` VALUES (10,'武侠片');
INSERT INTO `mtype` VALUES (11,'剧情片');
INSERT INTO `mtype` VALUES (12,'动画片');
INSERT INTO `mtype` VALUES (13,'惊悚片');
INSERT INTO `mtype` VALUES (14,'战争片');
INSERT INTO `mtype` VALUES (15,'悬疑片');
INSERT INTO `mtype` VALUES (16,'历史片');
INSERT INTO `mtype` VALUES (17,'文艺片');
INSERT INTO `mtype` VALUES (18,'传记片');
INSERT INTO `mtype` VALUES (19,'其他');
/*!40000 ALTER TABLE `mtype` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table mycollection
#

DROP TABLE IF EXISTS `mycollection`;
CREATE TABLE `mycollection` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL COMMENT '用户编号',
  `movieId` int(11) DEFAULT NULL COMMENT '电影编号',
  `director` varchar(30) DEFAULT NULL COMMENT '导演',
  `mainAct1` varchar(30) DEFAULT NULL COMMENT '主演1',
  `mainAct2` varchar(30) DEFAULT NULL COMMENT '主演2',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='收藏';

#
# Dumping data for table mycollection
#

LOCK TABLES `mycollection` WRITE;
/*!40000 ALTER TABLE `mycollection` DISABLE KEYS */;
INSERT INTO `mycollection` VALUES (1,3,2,'白坤','白坤','白坤');
INSERT INTO `mycollection` VALUES (2,3,3,'飞','的','的');
INSERT INTO `mycollection` VALUES (3,2,15,'bin','bin','bin');
INSERT INTO `mycollection` VALUES (4,2,13,'白坤','白坤','白坤');
INSERT INTO `mycollection` VALUES (5,2,12,'jdajkl','白坤','kljfakdl');
INSERT INTO `mycollection` VALUES (6,2,16,'不知道','黄渤','黄渤2');
INSERT INTO `mycollection` VALUES (7,13,21,'jkadfjkl','khdafjk;l','jklda;sfjk');
INSERT INTO `mycollection` VALUES (8,9,21,'jkadfjkl','khdafjk;l','jklda;sfjk');
INSERT INTO `mycollection` VALUES (9,9,21,'jkadfjkl','khdafjk;l','jklda;sfjk');
INSERT INTO `mycollection` VALUES (10,9,21,'jkadfjkl','khdafjk;l','jklda;sfjk');
INSERT INTO `mycollection` VALUES (11,9,21,'jkadfjkl','khdafjk;l','jklda;sfjk');
INSERT INTO `mycollection` VALUES (12,2,19,'我','你','你');
INSERT INTO `mycollection` VALUES (13,2,19,'我','你','你');
INSERT INTO `mycollection` VALUES (14,2,19,'我','你','你');
INSERT INTO `mycollection` VALUES (15,9,28,'伦纳德·尼莫伊','伦纳德·尼莫伊','威廉·夏特纳');
INSERT INTO `mycollection` VALUES (16,9,25,'刘伟强','陈小春','郑伊健');
INSERT INTO `mycollection` VALUES (17,9,43,'罗伯托·贝尼尼','罗伯托·贝尼尼','尼可莱塔·布拉斯基');
INSERT INTO `mycollection` VALUES (18,9,38,'肖恩·S·坎宁安','凯文·贝肯','Adrienne King');
INSERT INTO `mycollection` VALUES (19,9,41,'詹姆斯·卡梅隆 ','莱昂纳多·迪卡普里奥','凯特·温丝莱特');
INSERT INTO `mycollection` VALUES (20,14,36,'詹姆斯·温',' 丹尼·格洛弗','加利·艾尔维斯');
INSERT INTO `mycollection` VALUES (21,2,24,'朗·霍华德','本·福斯特','汤姆·汉克斯');
INSERT INTO `mycollection` VALUES (22,14,24,'朗·霍华德','本·福斯特','汤姆·汉克斯');
INSERT INTO `mycollection` VALUES (23,2,48,'cskjd','dka','dkla');
INSERT INTO `mycollection` VALUES (24,2,25,'刘伟强','陈小春','郑伊健');
INSERT INTO `mycollection` VALUES (25,14,25,'刘伟强','陈小春','郑伊健');
INSERT INTO `mycollection` VALUES (26,14,46,'高橋渉','藤原啓治',' 矢島晶子');
INSERT INTO `mycollection` VALUES (27,14,25,'刘伟强','陈小春','郑伊健');
/*!40000 ALTER TABLE `mycollection` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table pingjia
#

DROP TABLE IF EXISTS `pingjia`;
CREATE TABLE `pingjia` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `movieId` int(11) DEFAULT NULL COMMENT '影片编号',
  `uname` varchar(255) DEFAULT '匿名' COMMENT '用户名',
  `content` text COMMENT '评价内容',
  `pjdate` datetime DEFAULT NULL COMMENT '评价时间',
  `rank` int(11) DEFAULT NULL COMMENT '评分',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='评价表';

#
# Dumping data for table pingjia
#

LOCK TABLES `pingjia` WRITE;
/*!40000 ALTER TABLE `pingjia` DISABLE KEYS */;
INSERT INTO `pingjia` VALUES (1,15,'匿名','这个还可以','2016-11-29',4);
INSERT INTO `pingjia` VALUES (2,15,'匿名','一般','2016-11-29',5);
INSERT INTO `pingjia` VALUES (3,35,'匿名用户','还可以','2016-12-05 22:32:00',5);
INSERT INTO `pingjia` VALUES (4,35,'匿名用户','一般','2016-12-05 22:36:36',3);
INSERT INTO `pingjia` VALUES (5,35,'匿名用户','马马虎虎','2016-12-05 22:37:03',3);
INSERT INTO `pingjia` VALUES (6,22,'匿名用户','不好看','2016-12-05 22:40:39',2);
INSERT INTO `pingjia` VALUES (7,22,'匿名用户','kk','2016-12-05 22:41:55',4);
INSERT INTO `pingjia` VALUES (8,22,'baikun','非常好','2016-12-05 23:26:58',5);
INSERT INTO `pingjia` VALUES (9,28,'匿名用户','','2016-12-05 23:27:38',5);
INSERT INTO `pingjia` VALUES (10,28,'匿名用户','挺好的','2016-12-05 23:30:00',5);
INSERT INTO `pingjia` VALUES (11,25,'匿名用户','很好','2016-12-06 18:08:45',4);
INSERT INTO `pingjia` VALUES (12,36,'bkkk','挺好的','2016-12-06 18:11:10',5);
INSERT INTO `pingjia` VALUES (13,24,'111111','121111','2016-12-07 16:41:32',2);
INSERT INTO `pingjia` VALUES (14,44,'匿名用户','感觉还可以啊','2017-02-17 17:25:28',5);
INSERT INTO `pingjia` VALUES (15,28,'liqiangbin','不是我的菜','2017-02-17 17:30:40',3);
/*!40000 ALTER TABLE `pingjia` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table user
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `uName` varchar(30) DEFAULT NULL COMMENT '用户名',
  `uPassword` varchar(40) DEFAULT NULL COMMENT '密码',
  `isMember` varchar(2) DEFAULT '0' COMMENT '非会员0  会员1',
  `endTime` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '会员结束时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Dumping data for table user
#

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'l','sd','0',NULL);
INSERT INTO `user` VALUES (2,'baikun','baikun','1','2017-02-17 17:25:55');
INSERT INTO `user` VALUES (9,'liqiangbin','liqiangbin','0',NULL);
INSERT INTO `user` VALUES (13,'lll','111111','0',NULL);
INSERT INTO `user` VALUES (14,'bkkk','111111','0',NULL);
INSERT INTO `user` VALUES (15,'111111','111111','0',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
