/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.30 : Database - tubeskursus
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tubeskursus` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `tubeskursus`;

/*Table structure for table `guru` */

DROP TABLE IF EXISTS `guru`;

CREATE TABLE `guru` (
  `idguru` int NOT NULL AUTO_INCREMENT,
  `idkursus` int NOT NULL,
  `emailguru` varchar(50) DEFAULT NULL,
  `namaguru` varchar(50) DEFAULT NULL,
  `tarif` int NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idguru`),
  KEY `idguru` (`idguru`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `guru` */

/*Table structure for table `kursus` */

DROP TABLE IF EXISTS `kursus`;

CREATE TABLE `kursus` (
  `idkursus` int NOT NULL AUTO_INCREMENT,
  `tanggalpertemuan` date DEFAULT NULL,
  `idsiswa` int NOT NULL,
  `namaKursus` varchar(50) NOT NULL,
  PRIMARY KEY (`idkursus`),
  KEY `idkursus` (`idkursus`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `kursus` */

insert  into `kursus`(`idkursus`,`tanggalpertemuan`,`idsiswa`,`namaKursus`) values 
(1,NULL,3,'fisika'),
(2,NULL,3,'matematika'),
(3,NULL,2,'kimia'),
(4,NULL,2,'matematika');

/*Table structure for table `materi` */

DROP TABLE IF EXISTS `materi`;

CREATE TABLE `materi` (
  `idmateri` int NOT NULL AUTO_INCREMENT,
  `idsiswa` int NOT NULL,
  `namaguru` varchar(50) DEFAULT NULL,
  `tarif` int NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idmateri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `materi` */

/*Table structure for table `memilih` */

DROP TABLE IF EXISTS `memilih`;

CREATE TABLE `memilih` (
  `idkursus` int NOT NULL,
  `idsiswa` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `memilih` */

/*Table structure for table `siswa` */

DROP TABLE IF EXISTS `siswa`;

CREATE TABLE `siswa` (
  `idsiswa` int NOT NULL AUTO_INCREMENT,
  `namasiswa` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `asalsekolah` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `idtingkat` int NOT NULL,
  `foto` blob,
  PRIMARY KEY (`idsiswa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `siswa` */

insert  into `siswa`(`idsiswa`,`namasiswa`,`email`,`asalsekolah`,`pass`,`idtingkat`,`foto`) values 
(1,'Dev','devlin.venedict@gmail.com','dodo','XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=',3,NULL),
(2,'Reynaldi','Rey.sp@gmail.com','dodo','XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=',2,NULL),
(3,'Don','doni@gmail.com','dodo','XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=',3,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\\\0\0o\0\0\0ÉÛÇ\0\0xÂIDATxÚìÝÓdu}\'úýCnLR[º‰€«kp3À\Z–e¬á‡HÀèDV‹“‹ÁÌ8$(Ê¬ˆä’e˜I¸‹™Ap¯qÂ¸¬$”NÐHöR™«.	·4r×ŒW,•-nÕsy7{ÆžžþqºûœîóãEÕ«LæÇ3ýt÷sÎ÷ÝŸÏ÷óýG?üá7\0\0\0¨Þ?ò$\0\0\0\\\0\0\0\0\0\0\0\0€À\0\0 p\0\0 p\0\0\\\0\0\0\0\0\0\0\0€À\0\0 p\0\0 p\0\0\\\0\0\0\0\0\0\0\0€À\0\0 p\0\0 p\0\0\\\0\0\0\0\0\0\0\0€À\0\0 p\0\0 p\0\0\\\0\0\0\0\0\0\0\0€À\0\0 p\0\0 p\0\0\\\0\0\0\0\0\0\0\0€À\0\0 p\0\0 p\0\0\\\0\0\0\0\0\0\0\0€À@õŽ;¶qøðáã=phc÷-»\':°ÿÀ	þèÑ£žG\0¸\0ú+Á(A)éª-[6.½ø’ÓN9uã§^ö“•È×Ú¶uëàßñ|€ÀÐépµçÎ=ƒ\0tÁyçWªÊ:sÓ;wìPù\0 +•«T­V®fÉcJeÍë\0@kö\\%Ä¤5°Ê¶À:åqªz€ÀÐH	*i\\G‹`Õíõ\0 •¬&¶\nVÕn(x€À°RGŽ¼hK»`Á+ß³×\0€Ú¤šÕ…–ÁEeðÇpuoø¬¯Ñ³ÀŠÑö‹J t¶˜}f\0\\\0jÌ‚¿/Õ¬2Ã5šV}‹¼FÙC\' p´dFª,BV»[!3y1Õ1-‘\0\\\0‚+a©†€À h±‚øiEÔ†€ÀPã-áƒD¾\0¸\0*’ÅµaLj=ÌÞ/?\'\0\\\0sÊþ37!XPj*c* ª^\0\\\0%öieÏŽ Á\"²ÇOð¸\0ÃYZT¼²÷ÏÏ€ÀÐ{9)Ãêh5ô3 pôºª%P÷dC‡*\\\0ªZP#Õ.\0@Uj%oo€ÀÐI™§ªÅºå¸-†\0@§zà	„4j †Ð p´^Ú·2¢Û\"¡\0@!B\0€Bº\0¸€Þ1…6žÕez!€ÀÐøýZWmÙbO+e¯¡Ÿc\0À~-¨IZaý<\\\0’ý/ökÑ•ý\\Z.€Æ8°ÿ€…:²sÇ?Û\0Àúí¹s:\r]&\\\0kã0cúàÒ‹/±¯@à¶ Ngn:cÐ>ëç@à¨M†	˜DHßÏë:|ø°ë€À lA­†9\nÁµ@à¶ &»oÙí\Z p[Pg›¡‰†\0ÀÜ²ˆ¶@µ@à¨!lvÊ©Ò0gµËÞ.\0@Ø‚šägÇ$C\0`âž­œ9dáËÙsç×\0hK2 Ú\'‡„»†\\@Ã\'®¢=IØ‚úÎìZÕ‡&\0—\'X \0Õ¸„-¨˜†Ð p\rrÕ–-Çku.a„.\0è•C:a¡VgàÊ‹aº\0. 7­„£#Ù…-º\0¸€\nì¾e÷I´Uý;€é…\0Ðiã®úß8°ÿ€E/¬ÙÎ;\\ó\0.`•&¡*ÿì³Ø…fÈÏ¼k€À¬a2aëÈ‘#c+hÀzäç1?—®\0°‚a“eU}ý37a‘\r“ŸKC4\0.`Mí„U.gm!\Z\0Ð[ÓF´×ùµfÈù{®…\0P“ií~&B?ösi-¸€ïßŠE7Õ›HFÅ\\@ïÍ\nFùýy¿æÑ£GM$„2µ@à*¶û–Ý•.C2Àù\\\0@‰¡ó.C2 ýòAŒë#€ÀTàÒ‹/©lz™!`\\<€À0dÖ^«²Ÿtgï‡}[Ð-ù@ÆôB\0XB­EYÙ·Ý”ŸíÂq½¸€9¥*5k±uÕ–-3¿NÆI[˜B·Ïé2Á@àæTæ¬¬´Mû\ZÙãeA\ný]&\\@Å+¦µÚ·ÆÆ pcì¹sÏR‡¡Îšp˜` p½5ëÐãiŸh—\rk@wC—	†\0PAà\Zý4;Ë´™`(t\\À’+áJ+!0Î™›Î0Á@à–	\\Ãm…Z	cã. âÀU|Š­•0Á@à*\\Å§Ø•€Ð p5.\0cã.@àŒ¸\006@à.€CWÎîsÍ.@à06@à.@è¸\0ÀØx@à.\0¡@à*“EÅ t\\@\r>lá¬Í¡¹ pÔ5HÃ9]€ÀtÖÎ;,ú€µÚ¶u«ë1 pÝ“ƒH-ö€&HµÝu¸€NÉ§Êz@\\zñ%®Ë€ÀtGöLXä¦\\À’ÁÊ8x \rÎÜt†\Z€À´káU[¶Œý½üºÐ49ŒÝõ¸€Æ+*X“öEd³Å];½î´Wn\\xÖé\'¸áòÍSxïÛ§Ú»íŠ™_ãº‹Î;éß=çôW{M0&@à‚~†­IëÈ‘#v\r“à’\0sÕæ³Ç†¤¯þþõ­ðèG·Ÿð¸?°åMÇ¿ŸËÎ=óxPóšcL< p­[‘s¶FÿÌž;÷XÔ­A‚FBGÂÇm×^:$	(m	Su8¸ëš*lEMåŒ[áš\\@ãöl•Ùa|ýÕª\"X%L<|ó»{ª–‘ç.ÏajžOaL•@àÖ6pÜ¾¬q+m†tÕí§J¸Jë\\›ZÿºR+*cy\r1U.\0¨Í¤©ƒã—…Ür+û¬RqQ¹j¦bïX^\'!L•@àji%œ´‡+Ÿ[È•wÊ+^>¨žXíaE%,¯©÷¶*€À”6­EptJá´pÆ«XÞv5a¥»{Ã¢SËëí}¯Ê pcÍ\Zñ>\Z¸F§rbÈÊ¾ ¤ßLL•@àŽKËà<+{º,à~Ü.˜¶Jãr¤Ñ0U.\0zîÌMgL]¨drá<­/cÛSÍèûX”?Ì9ï—ìÿ~Ö#×±LbuÍ.`åÊ,VŒ„IªYF·³løJE4ï%AhµÆM\\¸€µM\'–?××ÀU´\rš0ˆÊW»¥šïº\\@#Weô-p%heŽ¶AV¾rö—=_õ:ôÀ!×~@àš¸†7œ÷aQ–iƒ‚ë¸aÚaMmÁ[¶¸öÐ¼À5ÜŠÓåÅXZ»´Ò´–CU/#âh©Lí*»HÉy]]\r\\YÐ\Z†A“åýiÐF5öÜ¹Çõ¸€ÕÉ¸äyÚ\n»¸OË‚ž6°¬Ýp9œw¾k? p«“ Uv¡2OE¬é.<ëtíƒ´ºÝ0^Ú\nh¸Lí*»H™\'œ5Y¦ÁY´#xi+¸€•ÈPŒ>,²^wÚ+à,Ôéjð¦ÊÉñ®ý€ÀÔ&í4™P˜Oyó¿;wìèü+z§/{¼„ªÙÜ\0¨\\0îK5k˜Áôqªaö)\nV“åÃ&÷@à*ÿžš¾-¨²¯%çY€ÓWyÿÛß5Þî[v»?\0PMØÊä>†-ûµà¥ý]×]tž5âª-[Ü#\0X^_+[ÂœÜf˜C¾…-çqP‘´Ì[À0Ó\rÎ\0. ¢I„§rª°Œ­vå˜Ë½¸€uåbaêÛÛÕ÷òGŽq¿\0.`±A}«n	[õ{òî7¾vÏMÇ}ã»7¾õ©Ûòô\'o=ákÅûvzžM2\\©\\\'Ó\rà¾\\À\\rÞVŸMF¿W¤‚†¾sèÎï?t÷Àÿ÷ÿi-ž{ä¾ã!§jE8ûë=7xí*”,úÚb˜áùÊ½¸€Ò2î¸/‹¥Œ»¶`.g¸*• óÃÏï_[ ªÊ³ß3ø^†«f*e‹·öõ°d¡¸€¹Ú	û²HÊˆkåÉá*!ä»îíD°ZÄpuLU¬¼¾îër. p¥zàPo†d<|ó»-_” ñÔþm;xÇ âÓÇpUVÂgB¨6{_WC×Î;ÜG\0˜.†>,Œön»¢×b«Ú–JXZ³ŸMàêwèÊX÷@à&ºôâK:¿ ºìÜ3{·øÍ¾¤ì¿JuFHª`Gžgì¥a\Z}œ`h\\< põ¡•0›ûû²²èWÅjF,·hAÌÿŽŽµÖ¥ ÖÇÐ•qñ†h\0p’|*k|û÷cea¿Î‘ìÔÚŠ1÷Ã#îÛÌúºÒ-à¾\\À	>ÜéPFVwyª`ª(ÂI?¥Š9<ÌCèj†Ý·ìvo.àÇ²8èôfö÷¾½sÕ¬´öul;³CX£d@JS¦)æg°oû¹òA–û p\\9¨K{³RÍÊpÁ‚yÎK@_÷ÁÎ}›^xæ¦3ìç.à%9¸³«‹ž.œ¹¥m*«_ë_7\\¾Ù¡È\0	¯ºÕœ euV¾†\'(®J~.ûºr¨¼û pÀÕÉ1ðm­ne Å*ÏKuUU¯ÏpÎé¯6*@à«ÍÒºÔÖ=ZB\0ë¬z­bÚa>éÓäÂm[·º×\0ôQÎßêj;a›9NKWÆz[ðÓ¤ó¿ÒnXçû~ï¶+L-¸ »vîØÑéÅM[ÂVµ¦Ò×àuÝEçõ&p]pÞùî=€À}½¹ñw}qcŸ4¿Õ0•è×öÊÞ„®=wîq.0^àª›öAÚ¼ª®Ñ§C‘\rÐ\0.è¸ì!èÃ¢&ÐšZÕÊ9Hî´]>4¨rœ|ŸFÅç y÷#@àÕ­V»ð¬ÓUµ`û»ªj3Lka_¦ªrtX_>AnRàJû•½ZtÙwÜ[Iµë[Þ¤Ê pÀÕiOjBØzjÿ‡L ¤7‡\'çý¾ìÏL_h¨r\\=^Ò±ƒwXˆÓ;yß/SíºíÚKM,¸ ½ºzÈq“W›Zé³†É€U®éÎÜt†û pA×äÕ>,dön»bmS3HÀ¢-†÷-|`rŸª\\‡8äÞ\\Ð%GíÅ\"&çú¬:leqi¿œÜb¨Ê5Ù¶­[Ý›\0ºfçŽ_ÄÜuÍÊÃ–Å5L>,yÞ}]}ªrž\\Ð1¹¹gBV—0«[ß9t§E5T¼¯+çri+¸ µrƒ¸„-Xõ¾®yB×9§¿Z[!€ÀZ›&‹4aÚ^×ugZ!€ÀívÕ–-[¼\\xÖéµ}ÿîƒ{-ža	e&öiW\Z¹\'tt?×çß©…ËU›Ï®5pe/Š3Ôº2üÆ>.\0„®z¬Vºú¸vß²Ûý¸ ë¡+·»°pI’°Ý]}œ‘ön÷\"@à‚Ž»ôâKz,lA£BWödö!påúë>\\ÐaigéÊÂåá›ß]iØ:vðbXqÓÓ\",p\\Ðj‡;¦8cãÛx@r•a+Ÿº[ÃúÎéúÀ–7	\\\0´{ïÖp¨JÐ:°ÿÀI¿Þ¯;í••…­¯Ýs“E0¬!t=±oçñŸÃ´\\\0´~ßV´Ú>µ°ª3¸ò){~À°z9z!çÝ	\\\0´~ßÖpÐ*´yZáuWÉÁÆÎÚ‚õÊáâ}\Z\r/ptÐhÐêÂðŒ*ÎàÊBÏ‚Öï[Ÿº½7+t¹/ô €õ}$|xºÐÙKÙ‡Ñð{îÜã>\\ÐeGŽiåŒ*GÂ’ÍóÃÏïßøå_øùÎ®\\ƒÝ‹\0z2©°Í–Ù·eH4Ó{®¼¸óË½¸ Ãa«­	Gsú«\\ßèn[h¨[·¿£ó+ûgÝ“\0:ÚJØ•ÀuÙ¹g.¶žþä­µ pi+. >GlÚnsøZdBaÎÛ² …f{ðö]½\\¹þº_µwÛs.çmAó}qß‡{¸L+.èpÀÚ¹cGë[çPh<\\M“FÙ[ëÞ\\Ð‘9l³+•yÂÖûvZÈB‹ô%pE>\0s.pîV£ä`TS	AàêŠt¸W8w«1®»è¼ÒaëŸØmW£¥ûÀý\n¸ ¥.½ø’Î-Nn»öRC‡½áõ›T¹\0.h¾Ã‡wrarp×5¥×±ƒwX¼B½ù‚sz¸†\\ ºÕªÎÜËÄB@àjÿÞÅEIÙe@{]}ÑæÞ®8°ÿ€û pA[zàP\'$ef|íž›,Z¡ÅnÝþŽ^®œèþ\\ €­ÕÞmWÌ\\?üü~‹V¸Ï\0.Àhøy=úÑíÆÀƒÀex pÍ‘3^º°yÝi¯TÝ‚¸ÿæë{¸´´°ºÕ•…ÈU›ÏVÝ‚øâ¾÷6pi+.h™L½êËÇª[ puÁž;÷¸´ÅU[¶tfòðÍïVÝ«órÝvÿ.h‰®Ë8çôW«nAO|ýà]½\\¹n»´À‘#Gzqþ–êtOŸ—}\\€Àöo5êü-Õ-¸º&g\'º4\\ÎséÂÂã”W¼|bØúÚ=7Yœ‚Àå<.@àVïÒ‹/éÄÂã²sÏœ¸¾ÿÐÝ§ puN®ßîc€À\r—4»<þ‰};-L¡£ÞðúM—û pA³ueáñèG·\r\\ß9t§…)tÔ›/8§÷U.÷1@àkmí„½ç†ç¹ÏÂ:êê‹6\\îc€ÀÍ•‘Â]n\'4\nºíÖíïè}à:vì˜û pAS>|¸Žï}ûØÀõìÃ÷X”B‡}qß‡{¸rw?.¸jõðÍï>)l=y÷[>ógßxÏ•öŒnö?ëµ¯üú°]ï¼rð	þ¾×\r–_½÷v‹l0©Pà.¸Vk\\uëØÁ;\Z¹8LèJZæûM8ËÞ•„±oß5øšÞœ!p\\ p­,pýðóûß\n•àTÕs¯•êÙý7_¿ñõƒwYˆ·TÂsÞ‘@]VQíc%´ïû¸.@à‚ÛsçžÖ/6Î9ýÕcWÓÔY §ÒõªŸý™Zž—´,æëkCl®¼6y$(×užTÑžšP’0ž÷^×*¢}ßÇ%p4Øî[v·~±qáY§Ÿ¶¾vÏMZ¦í/á§ÊŠÖ¼Õ/á«a;¡\'í uí²òïA,ïÏ¶WE×ý|®S¦ÍºŸ4Ôý:yWÆÁg[gk™ÊWª*ö}­¶“*VÓ–ò^Í{¶ï>ŸÇå^\\ÐpÛ¶nmõbã†Ë7Ÿ¸¾õ©Û×\Z´Ú²¸Îã´ß«Þ ÕÆyo¤òÕ¦ç:\"\\\04Ö¡mœ¹éŒÎ®ï?t÷ÚF¾·ñ9L(H8’ªÝ]˜œ—VÔ´¶å9ïcØºà¼óÝÃ\0Ú6µ0¯ÓN9µ5Ž½Û®Xû„Â|ºÞ…=$‚×ò²G«kû‰ò¾hC%t]{$×éÒ‹/qï.hsøÊP«¶l|ŠÚÔÇ÷¾}m\n»RÉ¥Õp1m­p–Õô6Ã®?ÿãä\Zí~\\Ð!™†• VhÂþ¯G?º}-\n»XÉ·À6\\ÃbtèJS« iì[àJ;¸{ pA‡÷}5ñÐãº\'¶y¯Ö¢ûx´\n[£2Í°‰¯Eß^‡cÇŽ¹tµÒÕ„}^ã=®sBaÂV]ÔZ`·Sª€}Ž—Ÿ…¦íÖ§ñðf\0tXöu5õÐãº&faÙçÃUãmž»ñìÃ÷Z=ŸŒ7*Ccš4´¤/ÏûÎ;Ü\0º:L£)Žë.:o%\n…­—\\µùìµŸs¦šÒLy.š°ß¯O!Øþ-@à‚ŽÊâ&ŸÁ%lÕç¶k/=þ<?y÷+¿¯º¥Å°Œ¾´ýºttïV“GÂW=¡pa+_?£å#û&É`†ü™už54:ò¯÷Ü°ñÝ÷Ú»Å	ïçu–œÇÎW›·lqO.è¢ìhÒ¢ãá›ß]Û„ÂªÃV¬²PÏ‚tÙJ@&æk­ê°¢pœ>¶vñüµ*e/•êc6í?àž\\ÐEM˜L8m$|Uÿ*ÂVþ~ªRYxÖÝf•½3ùT¿®ê×)¯xùIávÜ8þç¹OàZÑ¨þüûÙ7UT@óú\'„—1\\9Í×¨«rºÎa\Z]o+4¸À¹[k	_Å„ÂeÂVyYd®sKªgUsÞ»5Möuõ%teLþ*ÞçEUtÁ½¨%”å}œï1ÿþ2>äCm…Ú	(aÛÖ­Zt\\vî™•O(\\äœ­„›,†›0¡mtáœEç2Ÿô§²U6lõ-tåõ®z_¾^ÞOëí“ÞO	ó‹´±®£½°Ëm…Ú	´¶vBaÙ…dQÉjZÈš¾²˜/R™øo÷Ü2WØ\Z¦Ñ‡óºò¼.ÚZ˜×á—áçG$ÔþùGÞ3úRxú“·Zd¼cP¹mâó™PXö}µŽÐÕÅ¶Â\\‡Ý\0:èÈ‘#Íû”·â	…	³Èi±Ê\"»Aat/O!¿>$³7Kèšý|&PÕŸQÅs›?“ç÷ïîÿè ¸ÈóúÄ¾OíÿÐ Œ%ˆ5©š˜ï-?#ã‚N~~V]µëb[áî[v»\'tÑž;÷4náQå„Â,„§í¡YçÄµ&X4$tõù¬®a	F	I	L‹<—³Ú8SkÒˆþq-­ù¿WYîb[aŽæpO.è &v\\ì-ªjBá¸!Å„Á.T³ª\n	O‹†>M/œ´}þ‘\nØwÝÙ˜ç}8|¥Òg|ÿbr,‡û pý[+qáY§W2¡ptHF‚V„mÙ›µJy~—©Àô1t­:hM\Z×_ÅôÎ*Ã×*ÿ½iÕë¶íÝ2\n¸Àþ­µÌX¤u­Ø·•3ˆúÞ6XF8,SuéËó”êR­ƒËÈãÉãêÛ{¶Ži’ëc9Ü\0:*#ˆ›¶øØ»íŠ¥\'fÄµ 5¿§EýÙgÔõ*`†·4)h	^³â4]Žäp/.è°ìhÚäÑn_zBa&ª	P‹íIZ¦zÓÅÅ~ž“„É&­>¯ü¬·5le`‘û p+uÎé¯»OEZŒ{_t¡ßµqñ™¸î}ZËÈ‡}ßŸj¶Žh¤37Ñ¨EHŠ­jB!ëÙÏ•!\Z]¨j-Ó^Ù4©Ðuy°IÛÎäRÙ.è‘6ìßjÒ6û¹ÊisHNE¨iC1ª:Ï««Õ®ÏhKØJW{ p	…Ù¿µè„BÖ{>W´qq¿Le¯-ò=\Zž±¾ñï7.è‘Ã‡7j1rÙ¹gŽ] \n?í=Ÿ«Má2{»¶º¼/2“I›¸vß²Û½¸ OröK“#Øò¦±›þŸõZfB_ª)	[	‡}	[]=°ú«÷Þîpc@àš%Ÿ¶6iAòðÍï6¡°¡\r$iIlò¢>mmžB(tHu¸\0k‚Ï:½sÃŒŠoökØ÷°ÕÅQþª[€À\\sŒƒ7¡°Yœ]Ô7mð‰°urèêÂpšWýìÏ¨n psÃå›[±P×ZxãÂç@	[ÚëöæÎidàRÝ.¸\Z¸„œn´6e/W¼°ÕÝÐÕÄÀµmëV÷@à«™Ë„ÂnM-\\÷ÄÂ¾N#ìÓÈø«/ÚÜ¸À•ã7Üo\0®µ;ðÞ·›PØñ‘ŸØ·s­û©ý¨:~8ò­ÛßÑ¨°uæ¦3Ük\0œÃÕÜÀÕÕ	…9/èþ›¯,ßsåÅƒ6¨qòi}þÌ¾×m|qß‡7žù³7æ{øÎ¡;ZÈ¯kJD[ÃÏÁ]×lìÝvÅ \n9 <S=8“_Ï9vù9zô£Û+ùwÛ8¹°ikÏ{Ük\0ú,­.M\\]™Pøõƒw\rBSÔ²SÔÎzík_\'-_wßW*VmhW[f¤ý:ä<º„§„©Eß\'¯;í•Wm>{Ô}y}Û¶Ÿ«iëèÑ£î5€À}×äCÛ>¡0¡¨îMüoxý¦]ï¼r-á+x‘ám™¬¸J©J%dsú«+œòŠ—Â×¸5Ú4]²ŒT‚›rM»à¼óÝc\0øáÆ¥_ÒˆÅIW&¦í/Ÿ²§5îûL…+!,&,Ä´ÎjAÌŸ+Úó÷Ç}ý„¯ü™U¶f°I“Û\nm}\\e5+ahÚàEË`Ó´–Á|­ü~Ñ~˜ÖÃ„­ÑÊ×m×^ÚŠ6Ð¶®û¸Ç\0ðÃÁƒ&®6N(LØ™„ÒR8+X-î¼}× Â•c8Ô­ªêµH YUÕdÑáëZ	I©teßVÕ-ŠùÚ‹¯u;ikàÒN\\À@ä<í”S¸Ú4¡0Áf´u0Á+!k•­~	`	}Ã£±3”£îÇ0ï^®´ø­âùÈÐ•&¶¦ú4ü^Yv¯Õ\"­‹	\\E­L¸kË\0›¼×µ`Záˆì[ië/¡jxF‚WªNMhm_u¯E‚Í*žƒ¦U·ªŠ “÷|*LUM\\DÚ‹Á“oÚÁÕe˜N\\@#mÛºum‹“,úÚ¶o$&!f¸¢•v¦¦~êŸ½_E«aÕ{¼2Ü¤iû¸š´w+¡ªh\\txÅpðI»í°œ/–Ð[ýýYÁ3\'0¦U»Úò!H×‘#GÜW\0hNká¸ÀÕä	…	,Åž©„˜T¹Ú´Ï¬®±ÎI€u¬Û”CŽ`Šíã&qN\nTÙç–€óÝ÷ÂiÕ¥ŒÇÏ×Ê×MËîh+hÑj8ioW[ª\\;. ±2U«)«É‡-„i\\÷YXË¯Tèª\Zä‘€Ð”Á	M[	.yoO\nZ	<EuªªPµHu2ÕÀ\" æ±æ1\' ¶µÊ5<@fÒ-à~\\@£ÆÄîiê„Âá°•½E¾ÆWÜ¾ñ…}øÄß»ñ‘m×¿ÏüéÇW\Z¼ª¨vÍÛÂWçkœªÐºÃVÞÓ£ƒ0RLÐÌã›\'\\åý÷EÞ\'W½é7.9ÿÜóÏ:sã\'þ—Ÿ>.¿ïÇ[7îúí7xŸ-Tó:æqæñ\'xî1[Ç9jóªûì;ãàXÊáÃ‡×¸š8¡°[Qv(FÊÿùc7Á£ä2²€ÞvÅ%ƒôjÜ–Ée÷uÍ{rkÞj[]û¶RÁÊ{yÞ€5h‰<¸wðº/ò¾)œòO^9xÿ,òÞÉëyð¦ëÆ†®„2Ë8x@à–pÕ–-k\r\\Mk[J)ÂV™¼,p³Ð]t¡<+„e!žy“ž£yWm£‹Æ\\•T‡²?-û¥yì©z.²&Ùôš6øÚó>ž¿ú»7Þù¦óO]«\ZëßÆÀeÿ p¥äÚU.RF7é7iBa1 £LØJÐJ ª#hMZD§z¶HûX—×ºBÖ¢ƒ^R	M»`*R\'T¨^ùO7^ö?½ñ“?ñS/yÙOÍüYÊŸ9í”W½ø÷~jâ{&U×yÞuñO]Mj“v_û·\00&~xÏÃÈ˜ì&-æ2XbVØÊ‚9ÁgÑàtê)/-¬ãÔËÅûÔÁÂù§›¾ÖYùê[àJ»`*±Ë¾Wóš\r­—½(é\'+úÙJ\0÷ÞÉó¼WFCW“‡g¬3p9¸€FV¹FWÓ5ž¶R]JØ)µ§æ•ÿtã×¯zÇÆ›Î\Z,„_uêi/¢È&…°E÷ít!p¥•¯Î •=YUT`óú¿oòzÖù3öÑ[o¼ÿF÷xÍSí\Z]Mn+\\gàrþ p¬r\r®¦L(,†dL[Ù3Ú6.dmßöÿå¿<´‘ÿþþïÿ¾òç/‹õ„¸ªöí,\"-uM\\‹¿2Õ¬|UŒm®†æ½QwÐ*|éK_\Z¼÷FCWäñÌºn¼ê’F·æƒ’u.÷\r@à\Z9±pxoHS&Î:8AfVÐºõÖÛ6¾÷½ïmÿ÷ðµ<‡gqæ`A}ë˜JF‚WöÕ9n>¯[×WÂ&.ò8¾¸ïÃ\'M³,ªZÅ{#!hUA ÿVþûÒ_<:öýšqóeßùâæ«/nì´Â<÷ë[œw¾û pó[Å¹\\M›P˜–¤]ï¼rj;Ø´°µëý¿sRÐ*þ»ìÒ7×ö<&pU´´.Ž^WðZd2`SW^¤m0ÕŸ¼wÖGÏiËóž×àüó7o<þß)ü¬!på¿K/yËØ÷m¦#ÎºîÿÝ\'p\rÉtW÷@à\ZYåjÒ„Â¯¼k0VzÚž­Im„©\\¤‚0í¿T¢V±¨Î÷ßÿŸÆ¶Á«‹k™¡9ÔwÑ6¹b¿_Þ;y\r·¦zT„­á ^G{i™÷Fªk“>,˜7t	\\?¶û–Ýî€À,&­2«\n\\ëÞ’ÊÖð‚yÔ¤3’lŠÊÅ´ÿVµ¨.þËc\ZºªÞã•°Ò”ƒ\r\\‹TWSÕºú¢Íƒç´ª•p^¼_FÃVñß¢ƒSæ5üog?á´\ní<¡«‰×¸=pÈý¸€ÅØ ¶EÊ…gÞ˜	…ùd<•ŠI¿_´…SÅhZàšºŠáËN5\\dT]¯c&è-¸æŠ1|FÛè~­ÑJè¤0þŽ_¿ºö ðÆÞpüßKðJø›5Q3U¹¶®XÇÇÇŽs¿\0.`qYPÔ¸Ö=¡ptÑ<º€.Úñ2Õ-%ŠI…³Z	×ÑR8üß¾}8s‘qò‹V6æ\r7OòÖÚ^ÇìÁª;\0aë¬×¾æ¤Öº¼/†ÃV¦TNúï“Ÿüdía ƒZæ	[…UM¸ìBàJëµû pKÉþ„ºWS&Ž“*Ð¤Å,¬‹Á“þ«³¢1iPÇ¬a	£û»roÝg_eÌz“FÔÏÛN˜±¸¼fM¯œUý¬3„§e1ï‹| 0­Ê9ÜfšÖu€v—½[€ÀT\"í2§rjõ“½6ŸÝ¨	…«&3 Ã{»¦¯ºÆÂ·û/‹îq“§µ–]t/2°Îá(‹ÀyÆ¿ç¸€qa+‡Ï;µ²î*×»nüû³Bvª›ó‚Ütió4\n¸€Ö©ã ä.ßÜ˜	…Ë·ØNð\ZÝ»“…wmcãþ›4­°Lµ«L[Ù\"«ŠC„§ÉaÅuÀ„¬´ŽV™6½rø\0ìUîåÊ¡Ê›~þ_L¬du-d\rË´ÈºÃV>€:zô¨{ pÕÉâ¢ÎÀµî	…ËštrZùzŠ*Çïìº±–¶±Ñ`—sÒ‚{RÀJe+-eù^ÊÒHeržp“¡u¿Ù#VGàÊ$ÂIãÐóœåù›õ<gUöÔ\rWAóz¥JYUÐšTµL»hÂaCÖªW†	¹/\0P¹îYWàêÂB/‹Ùi‹î´õe±]åsøÙÏ~ö„‘ß©¤L«h¥ºQìIË<Áj™1àó®UìÕ›·­°làš6Xe¸ý4Ïk™ð•@œ–¿¼n?þøÂ¡+!ëeCA+á9“ó\Z/;RàrÈ1 p+TõAÈ{·]Ñˆ	…uìùšµè~Y¼¸HÎbù\'|þÞpÁÙ&È!«¨T†ªº*óV“¾sèÎ•¼óŒ‡¯³5Ï}^‡ „ÝY!ìe?1ô¾˜àe?®\\á*-‚mxQ…âl4#àh¥*B>ðÞ·7~BaU‹î´œï\"Û÷óÒ‚û§7N=åUÇØ—^ð¯6~ý’7m\\zþ¿\Zxÿ5o|­¢‚ëZh\',7iÿV!Á®	kÒû!†‹×1­œÅû¢P©Bž—­Jv]Z?€. µª<¹\\MžPHukû·ž1nL}Ú½¾—ð€À¬EU!«Í\nûî¯÷ÜÐˆó·–©r;ˆ97•×¶s¸Œ€. ÇU®®L(l£Tpªºó´®ãu.Såš´‡°l‚W»ìÛq]eA+Ç\0ä ë¯}õ¯\\ûh_•«K\nÛ$-œU*™g\Zàº£äPãY-Uºi¿¨â%xi5l¾/îûp%A+‡\\_ó…¿üôÆ¾÷Œk? p«³sÇŽJW×&6Y*Z¿áê*†WÌsèñª¦.ºÏlZÊï¥Rö-oÚ¸íÚK_/ßÏª€°ÚÀ•ŠV¹ýº/yÈµ¸€Õ9räÈR‹š×öÊÖN(L{Y›*y¼_ú½ßÚ¸î¢ó6>ûá­•…ìÉ*¶¦UVõýÏÚk6kYž³§öhãà®k6®Ú|ö xý×ÛsðþM¬«á%ßwÛöX.¸†«ZcŸ¿ý²ë? p«³Làºð¬Ó[=¡0í¢ÒÑäŠÖc{v\r‚V™Î”À*«2eÏàjÂk<+&L•ý:	oørÎé¯<·ßüîÁ¯åkäýÐæý^yìùòÚæýÒÆýk‹®ìýšõµµÐºÀÕæ	…YŒœ¦T:¨²`þÂmÿë sÙ¹gAÂ@Õ-peGÂ7eÁžç Š3Âòýß{*]	^‘–Ã<×ùõ´ æ=‘×¢©ÕÐüìåñ{ú†«€ùÿÛü³¹HaÙ¯ýüã¸þÐžÀÕöéoEè\ZnŸ+Ú«úÞŠ•@±wÛƒ•ç·îƒ¥ËŒ„oRËhž§iyÞjeþ|ñõò\\çyÏ{»_i?’ç#\'á¼î@S´FþÍT­ò¦MnÌïuá˜†y®Eoxý¦±{¶¦ùÑ·¿é\0\\@³GÃ§«+\n³ˆ~ô£Û¥á*G±€MÊ‚7Ù*ªL©˜dÁ^´}eaŸç3ûâ†ƒVÃ*&ÛTÝ*3Y±l[áh¨Ék[¯¼öÅk‘÷ù)¯xù ˆå}1üºŒ;:a(Š÷KYE{kaÖk’Ç‘Ç“÷kZMóþÉßëÒ^´¹†÷Ü{ûÄ×6-¤ãž—¾ò9÷@àêsôèÑÓN9u©À•…^—&{„²ØžVå®vDBÓ¬uQ™È¢<7á.•¬á…}õÃú½:[ÙÊŒ[oê@”i\"/\Zˆ,óýWÐò\Z%Ô$t\r¿÷óÞ(ÂNþÌ´ ¶¨¼ïŠ`•\'A¼x¯äókE«i/{Ê!Éeª×ãB×žù÷@àª—\rãÏ?ñè`ÏÃ²«\ng…b B±¸n¡Ì÷œ=?ùýá*Ø¬jDäïf‘žÅzñ5³/†6ŒºG–—˜ÑävÑÑVÐ²Ó\nËV¼FÛöFò´éy¯Š\'ãä÷†ÿìð{cÜ×ÍŸOËcËcìòaÎiœu\rzÕÏþÌÄVÂÑ#òœ´—ëÅë { pÕ†­oó„Ç2¡+Æ¶N(œg Â¬öp ‹ÑjÈ¨ü~‚WðëÜSTÛš<™p‘!\ZãÖËTÒÆý	ÈyoŒè*å}W´2&d5i°Ë*¼ù‚s–ªn{ÝÆV¹žý{ p…­‰<ºàX4t¥jÓÅV¦ÑñáE•*‹ë²ák\\K@Ôz–\'gUñÎÚ¿•ÇÓ†CóÇÇªß—ÃCM¦µ\0&DV®¦½gÖŠ?—¿WìKËi±/,•È¾„¬y×´êÖ¤÷÷¸Šüóßø÷@àª‘Mâ“7W_´y¡ÀÕå–¦b¡=Úz—êF±°.öÖR‘(~=fÒþ¯u­2{ Úv¶Ú¸ÐµÈðŒyÇ±ç9Ê¿3mbà<ò^(ö&`µ!ð®3pM«nM:³m\\õó…#¹?\0°¼çž~rêâ&ŸŸõÚ×Ì¸ú²øK°žd·¬„„žu-ª§UjÚRÝšºVýa@BX‚Òè ”QÅXùÈ{ ªÉ—]3«ò>mü´÷÷¸÷…ƒ¨¥•pTF+Ï¸¾ô{¿ÕË…`ÕY4Ï[ÙÈb;Ÿ¼¯»*˜Å}Wª[ÓBW×ºôM*X‹r<íý=n¨Š¶B@à–«n=ùØ	‹ÒáO³@-»ÈeAûãƒiS©7>¿Wçh÷ªÛ	ÛXÝšººÞòÚ×Àõàí»¦V£§U¢Çµ›>ÿø#î€À,>~Ö€Ñ\rùeÆ1G\'öÁ´é„]xM‡ßç>è^àÊ°ŒY7ïãi*Œ\rjî€À,\"çÌŠbÔù¬EvÙÖÂ.O(ìò^´®V·&….U®n®Yí„Åë?­Ê5®êœ#3Ü3\0X¸º5zè¬ªÆ®w^95leœµ…lûL:,8ÒjØµvÏ´åƒ¯}û|qß‡çn\',û^·ë¹¿ý²û p‹ïÝšTÝš¸2,­;ÓÎ•²(l_\0™ô©•‡71dªÆv#p•i\',¤Š5éš7ö<.û¸\0˜W1™pÖ!·ã>íµi=gäX¶Ë´}-]«nk¥ôhàÊyUìW{×cŸqß\0.`ŽêÖÐ¹[“-LúôÚÙ\\Wûô±ºE·×¾×U6‘sÜ~E÷@àÊËxü‘Rí„1mÁrÿÍ×\r\\©~Y¶Ç´…g×«[´S>ð½îd OUgÎû Éà@àÊ\rËxö¥5P`Ò^.«]&…nÕ-šlÑý[e†gŒÛ»šÎ\0÷@àæj\'œ¶q|Úþ­Y{¹®vQÝ¢íkÞý[…œ3Xvp†I…€ÀÌÝN8­•¬ìEãZ{ÒjhAØîÀ¥ºE›×2òŒÛ¿˜\Z\'®\'s. ütÂY“éæ9Ÿ(‡/~²¡Ý‚°Ý‡•NÓ\r·3/sÍyú“·–Ú¿úÂW>ç\\ÀŒý[ÏüÃ	ˆüºH;YãiG<^!¹÷v«¥Æzí0`Ú ÓP‹kN*í‹~I­ÕÃ×8¸€¹÷oM–›qc‘GÏ®Þãõ†×o¸:rþ–êm\n\\9žbÙ¯•ÚY? p³×“•:{iÜ†ñI‹óbŸ×ðˆøe>mfµF«œª[´-pUqîß¸óÇM*t.`úþ­¯|®ÔtºqÃ2&µÝáì¿?°çxà²láŠ¥êm\\ULE·—1{».@à˜1nïÎ´\nÇ´’Ó~˜¯wÙ¹g\n\\-žP¨ºE›ìzç••¶0~ø0îçÁ}¸€©fµÐLªpÌ\ZŸßÏß»íÚK®ÌPÝ¢MŠ3\0«úz£×D¸€ù&~ï™™û±Æ-0R½\Z·¡|´­0‹õÇÿðw*ÙOÁêf¨nÑÆÀUåõf\\[¡À\\@ùÀõíoÎl7\n~ÚY]Ã‡ä&påÏîÛqÅ`fŒŽÀ†6®*öoM\"#p°pà\ZÝ¯ÐTöPÜq¾ûàÞAè2¡°=Š)•“¦RB“í}ÿöÊ mŸý Â½¸€Ò«Lu+ñ²+ûÐ¾~ð.‹ÁÓã¦RBÓ}áû*ÿši¡ž´¯1C‡ÜK\0(¸Fãª[“¦NRœY£¥°ŠOòU·hmKáoüÛ¥‚UÆ¾§2?­­ð„Àåàc@àÊ®2Óé¦Ÿv×{®¼Øb°Šê¥êmußGn<þ\'<E‚Ô²û‡Û\n‡+ÿ p®qÓéæ­n\rWýìÏX¶@ªšª[åØ—ØÜs¸FRÞ×ãÚ£§íÓ\Z½w\0•{¸€¹×ð‚£ŠêVd\0CþnÎÅùê½·[¶`ÿ–êV9Þ¾ËÞÄ*FÂ;¶¢^Ãïñ©ISWG¯ƒEl8p=ÿÄ£î%€À”\\Å¢#‹Š*ª[Ç½´¸î¿ùzÂ†ïßRÝZ¬šB3äZ“ÀUözULäœdôZX|(5¸žûÛ/»—\00%p\r|\\®qŽEª[…‡ïýƒÀeqÚlóìuá%W_´ÙóÐ ùP\'+ïå…? \Z1Z\r¸\0˜ÛpàÊB¥ÒêÖ‹þ¾g¸ŠVš¹éËwßì¹X Â¥rÛ¬×#zÆµ.*G[Œ¶®t	¸\00UÎ‘ÉÂ!‹qŽeª[ñþ·ýÊ p…Ea3el¿ýH‹íãRåjÖþ­^{EeakR[á	ë™p.`FàúÊçJ„»¨.ß|<p}qß‡-µÆuFBjÞ×&6C^‹ß¾ò—*\r\\1:­px‚¡{ p3=÷äc3ÏeZÆuw<pÝºý†\r4à`êÅåÈm…Íxç\Z“xª\\£Ó\n‹ó/<ö÷@àJ®§Ÿ»€>wfžuúñÀeW3÷½Ù¿\\›ƒ½›10£®À5ÜB8Ì\\€ÀÌ=\Z~XötU¸´_5Ï^¿Éó°d`=ëµ¯ñ\\4àu¨+p;Þ„B@àÊW¸^\\4Œ[LT5ék4peÐ€bsÚ°ìßZ~àHÞ×†Ž¬ÿƒƒ¼ÞûöÊWq€ûIëé\'ÝC\0X,p-;\n~Ø)¯xù	KûU³Â‚ý[ËÉ $4c`F]+ÆMp5¸€Ržü‘Z†e†ÃVh¿jÖtB“#«	\\Â¬ÿ5¨3pÎÐR\\ÀRcáÓBSWà\nC\Zš3aÏóPMuEkæú$ìÖ¸ŠÉ„ pK®ï>¸·Ò…Ê¸À•\rîŠë•á%ªÕ.8×[©­;p›T(pP.pýå§kk\'œ¸,ô›Ñ†%$T¸T×[©-®-ßüîZW®‹ p©³ðà®kÆ.SÝš10Ã\0“jüž‹õx|¼]¹†°5i4¼À\\ÀÜëÙ‡ï©t‘’öžIËõï{ñ\ZTwø±ÀµÞ±ü p­\\Uv\\&pi+¸T¸¨rÿ–À\\@ã×Sû?´²ÀeZ¡ÀÕµ3 <ëÝ¿%pÐøÀUåþ­2Ë´Âõ.{¸®.íß¸\0htàzî‘û*_¤Ì\n\\&»­7p™R¸¼1¾û·.<ët¸€æ®ï?t÷ÊW<xû.‹Ç5Èó.ðV3^ßÁÇÍØ¿%pÐèÀõCw®%pY¨®·2cÝò•BS7×ÛÊ¹®Àõü7þÆ=¸€òë[Ÿº}-Ë™\\ë“I‘}ØÇ•÷Wö¾áõ›ÆNËÌsJÕ\"_»øš‹þ}¯Ð®2p;øøGßþ¦{ pí\\ªë­ÎTxóu<Š	ˆY¯;L\'h•yákžàTT	µf6ãu­3påú(p°¾ò¹µ.gr­Ç3öñAXXvàC‚Õ¸êQ!¿wÿÍ×¯ü{›ö˜¦IÅ+Ö¿‘?Wüyï§ÕWgG_·ËÎ=³¶ÀõÝ÷\n\\€À´7pÅªäœ8émÑÐ0O)hU{Ææy\\‹<ÖbX†–ØfŒƒ.ß\\[àúáç÷Ÿô8Ü?\0(åùÇiDà2V{}ŠJM^ƒyÂCÑR7TÔÊTª²¬<Öq¡+¿V¸«výãàë\\OìÛ9öq¸\0PJF¯s,ü0ƒš±\'&¬L%jR¥¡LËÞ:äU„®|í\"l¥\næ½³z“ZEë\n\\OòÖ“ÃGrÿ\0. d…ëóÒ§µŸß¿öÀe/ÌúÏ”J•k8läÿO+aÄÈŸŸ´ø·ÇfU^Ã@æ–‘ïsø{m/ÌñEÐ*~­îJóU/ë\n\\Ï>|ÏÉ#áÄý¸€r²ñ»XD<y÷k\r\\öÃ4gÌ¤1êe$œ¤”}y“BÌº*\\	My|yl“ªxùõ„¶á€5ü÷µ6¯°®À5îü-‡0_àzöÇÇÞ±öÀ¥ÊÕÌÊWa´ÒUÈë6­J´Ê\n×¸EyBVªróN:­ê©j5³0>~ÃÕ•®´Z\r\\ßzÊý¸€9&>ö™—Ü·ñ×{nXkàRåêVPKøI®Õª‡ZäS©ó~êötÂÂŸÞöÛµïÝ:>þ{Ï¸w\00Ç>®\'=¾Èy3ë\\ª\\Ý”6¾ì—ªkRaq®X1=P5ªû‡Ý){mÊK	T™Î\Ziþýo|b÷ÄÇñÂ_~Ú}¸€9\'>ýä	Š,DÖ¸L,ìöaËi«úL®âë¦uPE«›Æí©½fŒ§q²W5Õü“Ú_üµïºsjeËÀ@àÛÇõ½gNZTdá±ÎÀå\\®î‡®, ÓrXE«Y*g&v»:ZæCš2ç	¦Š¿ÌcÉdW÷\r@àæßÇuä¡“öüüþRŸ×¸\"‹,‹Íî†®âÀå„¥´\0.R™Ê{$ÁmÒ!ÅtC™a,yýËœ\'8®º5û·\0X¬­ð€<N‚W>9N+Nö><µÿC÷>ŒZöÐY‹nËä¿á3»ò§-0,a*U‹qïá3Ã„­î_)s½ÈŸÍ™Y³×2ÅÇ€ÀTÚVXV6˜×¸ŠqÞý¨1­Å4Cò¿Ã.ï¡¼ÛŠJh™À5h1­1pi\'.`¹¶Â¯|n¡EH*`u®˜÷ü$Ú]ñ\Z#?®ò™?c°J÷¥Í´ìu¢ø;³ªî“ÎÖ*ÕNøìÜ+\0X¢­ð[O->¸ ÆÀ•¶Ésý\\l\'T%„e¸Fqø²ç¦?RÁœ7pÍ\Zœ±hàÊñî€À,_åúŸ‡ W¸NyÅË+	]&ÐQÅ^ ´.fXZcÖ¨ñqïÃü½bŸY} °¾½[£kÖ>®E×žù÷@à–—=\nó.D¦M»ð¬Ó+	\\Åb×B´YâB‚GÈ¼R½ª«r•”ÇUfÂ]•ïÑ´;AÌûdqÓöôÍº6<±og¥+D¹?\0°¶áÓZxª\\*]ë«¥¢3:°¢©82Ý»—Ç¼ÊUæL¹<‡Xyyý—9·oÚ9‚‹.Ã2\0¨¶­pÌ™\\Ód\\üªWºŒ¯>\\¥*“`•ç·)a%¬Ìyl	á³&6Ežã<×Ú?ä¸ÌAé“ª\\‹.goPíðŒ§Ÿ,½É!¢ÓöK\\µùìÚ®‹–ËÛíæJ°N	REÕ«hAÌÿ]TßÚð=Lúð ¯ƒªíâakRàš´—kÞÀåì-@àªo+|ö¥#ß}pïÔÀuÃå›W¶h¾fWò<5©‚Å‰•¯¾¶d]Uà*®O9¬}™ÀõÜ“¹/\0PÃðŒÇYzÿÖª×0ç3¯fÍ:ÛŠfUóÊ´QvAZƒ«Øo7í€ôœ˜ÃÙ‹ÃT¾æj\'üö7Ý\0X_[á¬CFo»öÒµ\r*è{ðJEkÞá^m|o¦µ´®Çê°c@àÖÚV8Ú®3êÀ{ß¾ö	q}°‘ï¹\r$(¼ØØÔöÁªß›u.û·\0X{[á´°Õ„À5ÜjØ—Á‹ ÙòáA›÷)ÖYq­-p}åsî€ÀÔ¸f‚<i\nØ°G?º½Q#Æël=jJõ@8évµ«¤âZç°–º~®ŸûÛ/»\0Pc[áŒC3íkVàŠ&.Z»¸¿+qƒ1º/ÕÚ6¬b|&cÖý¾¸\0h­ûÌÒ«©! km†dôGS‡i$\\­cï`]{Ü.@àêŸVøäcK®cï¨dìsm†]H`ß–ÐÕ„ãÖuu]k¸€ú×·žšz¾Í´°õÔþ\rþÜºa}Hö-DèjÒ>ÂUWµë\n\\Ï?ñ¨û\0 pëÝÇ5i,|}î‘û&û+Ú°xÍ\"1-Q*[´I“Þ³	ÿëh!Vá. Õ¦-H¾ñ‰ÝcW&¦-k¸ÚÕ†½]m{^—}MÆÉ>¼I¿×§\"ëÚ8ÜŽ»ŽÊVë…¿ü´CXÑàŒ?~ä¾\'ï¾ñ¤}[mUÞä½]i}lò¾¸EÂTÚN S­)¦ÛÕ15/Áü;EPëR(Ë°ŠUò!-ÅtÀuWZëø¾U·\0X™Y \'t}çÐßúÔí\'…­¶ï1JhJµ+£ÍU­¢\"U„ª:ž×ï}æ7þþî¿qô÷~gãË¿û›cå÷žÚsóÆ3Ÿ¾kãGŸ¿÷ø‡	\r	mbùê~Ï&ô•¥&´µªnÐîÁO?¹ô¦í•ƒuŸÛ•Eí:Æm/óœáªîªKBSÔ½þ]¼{ËÜò÷ž¸uçÆÿ£ÛŽ°\"T‡°¶Uhë¨Qÿ¦|\0 º\\@»g<ûƒ©m…e´),¬úpÕY­6<woxý¦A0IfQ]ùúñAiÔp¨YV‚Ö—¶_³PÐšä¯vlTÉòøÇMàËkÒ–\0–÷NÁ«iß¥Õ­Ç>ãº\\À\Zª\\SÎãjãm™`QõøøT€†[Àòÿ§:Ôô\nJcóÿ÷\rªCE_Ù\0”?W´ø%à¤°ìs–0”`TeÐ\Z\'o´ò5.€å}Ñ†àUU«a—×¾ýM×|@àš7¾Ìû®\'¨r FÂ[1ì ÏQ“«YylyŒy¬	G	J‹¶ñMóø‡~kb…©Ø§UuU«L8LÛá´P˜0“P“ ÚÔ=`EP^¦Í3ïÙ¦}•µ>ù˜ë= pk¬rýí—0N°ì±M¯ŒäñeVQÕKµg•¥Ñö¾¢Â”¶ê°5î1åy(óú69Dçq\r¿¶e5í=›ÇSI+á‘‡\\çhÀ^®Ç>³p¸èâùGó´æ9È7“Û²âØýwÔRÍšG*L«{eª^ÙCVfOZÓ+˜Å¼YÃašøÁIÚ+™Jø½g\\çh@èúö7—\Z#ÝEãZ³ÀnÓ„»ávÁÑ½RÙÇÔ”ÓDó¯6„¯\"Ä$\\\rïoêÏð²k¶žù×w@àšãùoüMïFÃ—]ø5½EpÜ9c“ö£¥•oÝí{]^EÕ³É{¾†ySâ2KØ. ¹¡ë‰G{;©°íŠ½;“&Ö©j-¼Vç= Q?#ó»ô—~q¡Vçüa¸€N…®¦:ïºiÕ¬á½ZªZÕÈž·2Ã5Æµß¦å°éU¯¦Ø¶uë`éó?Rú9ÎŸÍßq. Sí…©ªX ®gø¬ÁiƒË8vA©ž³¼ràó\"-o©z	^Óí¾e÷	{L§¯AÐrÎ p­¤ñÌ?l¼ð•ÏõvRaSÛ3ô ÌA·ªZ«›²8él±YC6„®rkx¢j‚Õ	T´\0èÂÃYm†ˆõ­TEÊ,äUµÖ7XcžÀ•?ÿÙkÞºqÎ?{µ÷xÉÀ p½_Ï=ýäà°äB~í‚óÎ·H\\sÐRÕjÆþ®Ym†ùýâì³œ?–j¥}\';|ø°k. p²ÁÝ\"q}A+-mªZ/ùã-—oÜõ–7•ß[ÅcÈk1Úf˜ UL‰Leë{Ë¯l|ï3h/¤À\\ž`¶=wî±H¬hÆ<A«ïçjÝvñ…×œ}ÖÆþÙ«7^ùÿñ\\ÏõÏýÌ?ü½‹^÷sÛÿõ¿Üø£+/©¼ÍðèïýÎ@QÑŠü;ù·°F_ËL›´¯ë%GŽqm.€B>¶H\\NW.3c\\kZŸ¤:”€4oÀ*ã·ßø¯k}ìyÜÅk=m˜FÛÚ®ƒë* pŒš—=<mjüâ¿ûõÃÞ»7þê··n|ñ†ë6ö_û¶O\\÷ë7½ùM»~õâß¾ä—7~ëß¼qà’M¯T”:\"Õ©y[üŠêP¯Å/œvêÆ¾õÒÁ÷XÕóõÁ_~ÃñÇ×zV°Îïç|5@à8ÎàŒÅä0Ü²A+#ÈW®²÷)á(!é]çýË_üç§oü›³&W`ò{…Ÿ1¼”iíK[_ªKù·¦=–_˜òõòoåßLÐûÿöíü[×müé®ßØø»ÿð¡|éCïü^þÜ¹§¿vâ×û¥3þùÆ¼êW^©Ä\r­<¾YT;ãî%—^|‰k* pŒÚ¹c‡\05§2ûµÒ:¸Š •jS¬R‰šTIJH¹âÜ³O6	1£Á¦ðÕÞ8ø3ù³ù;ù»ÓÛðþªa£-„y¿qÑ…ßvÍàß˜ôïÏ’P¶ûÅïý›ÏÏþ§¯\Z„Á2{¼²ò^yæÏ¼ùßß}ûesµ‹Žžs×·}] pŒqèCBÔÃ1².ÎÍzjÿÇ6¾ýŸïüÿ™\\—ñî£ÃêØ•\nLÂÁ¤p•`”PS«ECÍ<alZU,¿Ÿ?»LÀ*ó˜âòxòýŸúŠWœ¸×îÀ¢52Õ¹q5ÿÿG.ÿ•™câKí×{1¬½ù‚sœÁ p}vôèQaªäpŒF^P\'lýâ?ÿ¹Aª{àDBVBÂ¸–¼TyRí©#\\Í#³\"ôÆµ®ãñLk•L~×¯lÞx`×öJ‚Ö¨[·¿Cà¸€>;sÓBÕ©RLj-Ë¯¸ñ={Û›âÖ9Ù/U›¢-0AbZK “=ðþíì¹y„ÒºhÛ Cgp@)@^~8FÔ©‚¥Rò‡ÿöm_xï»—>«*A+!+¬uVŠºäÿýOwn<ÿÈýµ¬>N1t pLp`ÿájL›Ù¼Óé\"“³^ûšãmˆÛßôÆß½ä—6ö_ûkƒöåßýÍ‰!ëW]~|Ö¯~Uíûžúä›ÿûG7þÇC_KÐ\Z7Å°‹Õ.×R@à°káýZ‹¯iò{…Ñ_/s»ï÷…¥%}ý®[6¾wèîF­a_?xW§j¤-Ùµ¸\0ìã*ÕBXåžž,¬¾ÒJVT¾&°\"hpŽ×C¼ZÏüñ]kk,+áÞHx\0è¾ŸÇµhá¢†•©¦ýèóŸØøîÁ}ÿ¨¦Èó“ç©éA«ØÓeB!€ÀôDßÏãJªéôÂÞ?þ}IBÖKþŸ¬‘­ƒ³ÚN»òó“ë‡ë( pLqìØ±ÞW¸Ú´X­|}ëÀï\rÚèúVÍJðÌsÐÆ×®KM(.€²£Ï¡kÜª¶Iõ«Ë¬Yù>Ûü:u©Ð„B@à(iÏ{œ¹ÕòÀ5®öƒÿã`€DBXÛö€%4æq\'D¶=duµÐÀ@à(©ïãá3E°kk’L?,‚X¦ fTÂXGO×VW§Fî¸~@I}Ÿ1î}	]³Ùp(+¤Ú”P4¬ìðŽá¿“P•¯—`•§­û°‘©”]ú™ÉÁé®€ÀPRßÇÃïÛqÀE­ÞsåÅú™10¸\0æÅSŸWZ½„ê–‘‰˜]ùy9í”S]7@[¡¶Bš!Ô.ý¬\\µe‹k& ph+4­fÈ`–.ý¬ì¾e·k& ph+4­£àëpøða×L@àÐVØÏCi–7_pNç~N\\+@[áB2INH *	ð]û±¸\0´.%å„T·ÆÛsç×J@àÐVèL.T·œ¿ p\r”O°\rÏPÝ\Z•c\\#`IGí}[áƒ·ï\ZPÝ\Z±mëV×H@à¨B6Æ÷9p¥:!8 ºu¢Cr}.€*Ø ÷U®¯Þ{»ð€ê–qð\0PÓN9Õˆø,þ¯¾hs+Ÿÿ<î6>çoxý¦Nþ< pëû™\\ñõƒwµ6lÝºý­þó=´é9¿ÿæë;û³ª·ë\" py\0Ã3T¹^” Ø…ç?Õ¢6=ï™pÙÕŸ…cÇŽ¹.—\'0<C•«kûˆTµ\\@ge*™*Wûª\\ø!p­Î3öñWýìÏh\'¸\0æ—ÃNM,lßÄÂ.€¶´îzç•}ïgxŽvB\0¨‘ñí<—«-nm¨.ve¿œÃŽ.`MòévßGÄGöEµ)pu¡Í-Sÿrì°c\0è¼Ý·ìî}àÊ:U®ÕIXLhlòóûàí»:ýžO;±ë€À¬¨ÊÕ÷ÀÕÆs¡XÚ:ª¼éÏu›ŸÛ²òA‹ë€À¬Hörô=p¥êÒ¶1ñm¬Â´¡ºÕå1ð…œÅçÚ p+â ä—\\}ÑæÖµæ1Û/gP†³·\0.@•«R5jSàJ@hË\0\rƒ2šáðáÃ®y\0 Ê¥å­¬};®SÙª@a×ßß†e\0\\€*—ÖÂŽUfÚpÈqFí—‘³÷\\ë\0.@•Kka‡öµadbîú{:gî¹Î\\€*—ÖÂízç•Ú	Ç×‡÷´Qð\0Ð\09—+Ÿ„]?9hÓSåZž3·šQÝÊÏ¶k€À4@>	¸Úy röK5­R¨*¨º p¨rµzÂ^Símr•°/­„ª[\0Ð@™f&lý¸J“v½6®û¸´ªn\\@\\pÞù×Ðhó6ÑhZÕ¦©«/­„ª[\0Ð`‡¶†dt¸ÀÕþÀÕ—VBÕ-\0hcâÛ5DCàÒJX8sÓª[\0`€FûÜóõ+ñþÕ{o¸´.,û0]Ã\0. öÜ¹GÐ\Z‘áu†­êÈ¾±¶O)\\ä{ÐJ¸¼K/¾Äµ@àÐh÷äÂy+P	ieoŸ¥5ocö™9øx|+a^³¾¼?³ÿÒu@àZäÈ‘#‚Ö’¡+áéê‹6Oý3iW\\f$}÷\'­b¤þ¬ ›ç½/ïË;v¸f\\@eâ™ µxè*Úý¦íÊîƒJ°é[ûåðóV6Ä\Z€Àh-ì`è*×´ªÕ2¡eßŽë\ZùüdPÅ*{ž¶®/ïÅCr¸\0­…ý]Ã-Æ\r“˜6Ô!_VÛ\\SÇ×98cxoÖ¬ýp]wÕ–-®Q\0 µ°Û¡kZ%jt‚àè@ŒY­oÓ*EMŸÀW×>®áÌ>€×J pZ{N×¸‘í	JóŒtþóm\Z\nQÇÑE+á¸ÀÕ§ðZ	. £­…Dž/`ŒTi,ZË®qíyielúó‘ï³î1ï}¿mëV×$\0è¢ûWSäL¬2‡öÊZ<\Zæ2Å°­!´ŠVÂÑÀÕ–ç£\ngn:C+!€ÀtY>]®¦W¤ÊT°Ò†X6p\rO9lSëÜ\"‡E—i%\\eŸÃ®ì<òþW×!\0è²|ºn?W¹ 1-äÏ¤\"Vök¦Š“ ×ÔÉ„u…®ií‚}Û·uß-¿í\Z pös1\\íªòëµµu.)á3i^Ó†ƒôißV&0>ÿÄ£®?\0`?PÇÞÀçž~Òµ@àìçêØø£ï=ãº p}c?Ô§8Xû…¿ü´ë\r€ÀôÑÑ£Gíç‚šÏ2{þñG\\o\0. ¯>lËÑEàzîo¿ìZ p}¶û–ÝÉPCuk°ëÛßt¸€¾»ê×Þj±îÝ:¸žýk€ÀôÝ·¿ùõÊÏž‚¾ÉykÃaë…#¹¾\0\\\0/ùòg?Õ«i¡j_½÷ö—\0Àq9+(íPÎ0¿[·¿ã„°e`€Àp’çŸxt°p´€†ùe‡˜ pL­re¡øž+/¶†’¾¸ïÃ\'…-3\0.€±^øÊçŸÖ¢³ízç•cÃÖùi×\0àdÏ}ë©Á‚ñëï2D¦È‡ãÂÖ p}ås®\'\0À„*×_~z°hÌÔ5k8Y>ŒJh`€ÀPzxF±p¼ÿæë-°aD~.&…­AàzúI×\0`z[aÁäBø±•™¶L(¸\0J·L.„éû¶†¹†\0\\\0ÓÛ\nä„ä÷º{ãœÓ_mÑM¯÷m;oë¤}Æ5@à˜ÑVøô“\'®G?º]èÂŒòa…k€À0Uqòpàúêï_¿qp×5§¼âåá’aB!€ÀPÕ>®\"p	]ôÍ¾×•[&\\\0íãzî‘ûŽ®Ø»í\n‹qL$4¡@àXx×ß~ù„…äpàŠÛ®½Ô¢aË„B\0`¡}\\ßþæ	É\'öí<)t}`Ë›,Îéäø÷2	M(¸\0*œñµ{n:)pÅU›Ï¶H§÷ak¸¾ò9×\0 ¼áÅä7>±{làº¶L(¸\0™Txä¡ã‹Éo}êö‰Kè¢ïakp×7þÆu@à˜#p}åsÇ“ß}pïÔÀF¦¯aË„B\0`nÏ?ñèñÅä³ß33p=úÑíB½[ƒÀõì\\7\0.€òf†º¶Œ„¸\0*\n\\“&\n]ô=l™P pÌ¸ž~ò„EåÓŸ¼µTàºèSØ\ZÌxü×\0`>£‡—œ!tÑ·°e$<€ÀPIàúáç÷Ï¸„.šä=W^\\yÐ*Üúïß5@àX.pÅûv\n][#Þò–k7ÞxÙ¶cßþŽk€À°xàšg—ÐEìÛq]­a+®ÙrÝÆ?þ¹_ÙxõÙWlüù_ü•ë€À°Xàšw×hèºìÜ3…\0Væþ›¯¯=lÅm;Þ?\\…ÜñG®!\0Àüë¹Gî[8p®Ú|¶0@­^õ³?³ñÕ{o_IØŠ?øàN\\qõ¶h1¸\0æ\\ñÔþ	]4zá×Þµ²°qÏïŸ¸\"ûºþ¯¯>áz p”\\ß9tçÒ+n¸|³€@¥®¾hs-cßgùê\'÷Ž\r\\Å¾®{?õY×\0àDÏ}ë©ñgUÐVX¸íÚK*qëöw¬<h\r›¸\n»>|—ë\n€ÀðÃ£÷Á¤µû÷ýÁÄÅem……½Û®Ø8å/\ZXx¿Öƒ·ïZkØŠ×ü‹Ëf†®Ë®~Ÿ}]\0ÐGÙg’Oà_ÿ‹×†çž÷–ÏÜüž‰‹Ëe¦Žsp×5Bí×ZåpŒYgqÍ\n\\‘Ÿ1ûº\0. \'RÉÊ§îÃÂ„­GoûÍAš¶Àüë=7T\ZºœÕÅ¼‡¯c¿Ö¬³¸Ê°¯@àzÐ68\Z´âUg\\|<lÅ?¿âsÑCg….iÂaÆËžÅU†}]\0ÐA9”uÜâ/aëOnÚzB\0úþCwO\\`&ŒU¸L0dš³^ûšÆ´ŽÚû»7Î¸ìë¸€É¢n\\U«ð±m×ž|2~Ú\"óŸØ][è2Lƒ&·ŽúÒ¾Ý.ûº\0. #C1Šã\\~Ñ[Ç†žo}jz5!°ºW<|ó»íë2…°SgùÚ=7\r>´H¥x‘Ð•}]Ÿyè®W\0ÐÆ°•ÅÜ¤…Þè¾­aÿ^f¡Ygè²¯«¿Þ|Á9_?xWãÃÖðÏÁ½;¯[¸ÒiùuÝ¸€–È$´Y¼¾ëš‰a\'‹ÈYÍº«\\Ã‡$k1ìOU«‰ƒ1Ê~ðŸ©eB×{vÜf_€Àt!lm:ûÍ3ƒÎ¼‹M-†ô¥ª5ì‰};Ox¯¦Mw™ÐõÆË¶	]\0ÐÖ6Âiƒ2FM\r_xöá{V¸L1TÕjª“>¸eûÂû¹†÷u¦ p-\r[eª[³FÃ¯jbá8Þûö×öJaEU«‘+ÞwõÕK.‡$\\@Ã¤iÚ4Ây«[e&ž{ä¾¿ÞsÃJCWj\\wÑyB‹	„\\F³l•«p×=ì\Z\\\0ë–}eoÓ&.2©°pìà+\r\\ÃÕ.{»Úe×;¯lô¹Zó˜68¦Š*×ð0\r×9@àX“]¾«ôÂíê·¼­t˜yòîžÖ¶jövµ£}ð«÷ÞÞ‰ U&påƒª×àgwÛÓ\0.€UË©ó,Úö]ÿ®¹‚Ì<‹ÏÙXukáè$ÃÏ:]¸i˜ì·Û»íŠÁ€•.…­2G#äŽ*C—	†€À°BGÿî¥†d·ÎbÊÎ(|çÐk\\†j4KÎNKå1¯I‚x×ÂV™÷{>à¨2p¡ËC@àXË®~ß|-Is´Î;8cS\'ùÀ–790yA+ƒMŠ×\"ï‰.®ü|ÌzV5<ÃØx@àX¡L.›w‘Vv:á¢ƒ3†§fÿWBWýYü^«qÕæ³­ËVJ»¸ªn+º\0 a­„…È:o`ybßÎ…¢ëÞÏ%x5#h-ójƒ§?yëÌ÷^m…B p4¨•pÑý[…„§E£’Ð”À%xÕÓ:8-hrd@WWÙÉœu.¡¸\0*vï§>»Ð¢ì—/üÕ…CJÔ5T`ÝÁËpjöhM’*gZLû¸òó\'t\\@Ãeô\"­„‘CX\r\'Ë<hjè*Üví¥ÆÉ—¦ó\\Õ=t¥‹«ÊC….@à¨É<úà»®Y8Ì{\0rCWÜuÍ EN»áÉû³2jÞç³ëÕ­(»O±Î}\\£¡Ë9]€À°à Œeb÷î¼n©0²è>®¶…®áª×eçžÙëjVÆê—i¬£µ-JÊ}Ëö•®ÈO×L@àXÁ Œ*WU‹ç|&M/,³×«/á+ûÙ®»è¼A¥oÙç­Ë“		\\uÇ5ñÌ½mØøó¿ø+×N@à(#§e`Ë. «<¸6ÓÛº†Ã×ÞmWZìº2l£ÊÕ‡s·F>˜ç9©{pÆ8o¼lÛ`ÐŽ6C@à˜\"‹¦u®ª+M:yQ‡ž¶»T¿ÚÀ²?-7{Ö8÷E-rXv%TÎó¼lýµ-+\\Ã{»Þ³ã6C5\0`Ô¢cà«\\UíãZäàØ6°TÀ22=S›Â†Ö\"ƒ/Ê¨.p­bR¡ª pÌéõ¿xMcW]Ø~÷Á½­l1,+A\'ûÀÄÒŽXGK°Ê×Í×Ï¿“³®\nV_9^vÌª&ÎSõÊäÓäq­.@u««ÎV±TE²O¬«¡kVe,iXBÓ$©¢n¡j’œIÕ—°9clžç\'ƒkš¸F\'æzãº\\€½[k\\Qw»XÚ´²_¬Á«ÍR¡¬£å´KëOnÚÚØÀ¥ê\\€É„\r	\\iÿ«{!›P7ïb–õZÅû¢iÙØôÀ5ZõúÌC_p=. ýòirVZz>rÇ\rTYÝª2pU9¾Ìøø´©	4ÍÖ—©„£yo¶)p²4×$U/@àZ!c™ïºç#š—=Ìx+­c«^ØfC—‡j´YÚ?û2•°¯kô@eU/@à\Z°²PÉþˆu-”²a¿Í‡Úöy¨F“¥\nÙÇ°‹œ#×öÀ5Zõ2Z¸€•Ë$­©`­3`Õ¸²wegi3l†>€g‘ç¬+kX®ui‰vý. Ö=XE«©‹¢m»¶Ò6²&œ¤ÍÐ¾-«YU¯\\U½\0¨´’Uõp‹º¼ïê«;×Jfšáz¤•®¯û¶†ß{×ôªWÚ©Ý+\0X(d5¹’5q³û[ÞVé¢{m…£rþS*.ÂÐjÎÛêó¾­áÖVk¶| •k¦ª pSeBÓödÍë—/üÕÊÞM\\ÛßU¯´rö=l	\\‹¨¬ê\\ÀIÕ¬ìGÈ¾„®,zúrØmWö™	H×w¶ªÙ„=„×â*§êå>\\ÐójV:ß²½Òø*A6XÃŒ&Ydï`&…\n\\\'V½v}ø.*ôioV—ªYãì»þ]•·6}xB1XCð2$£J©ö	\\ª^€À”çžOXÛ¼7k“\nÛ´§GðZ<Tg(‰u¢EZVs4ƒpUî@eU/@à‚–ËÆí®¶\r®rpFQýhÓB9á!­ÂT{Æÿ7ñ=´Ès™<„ª9&«nûÀÆgú‚{ pAÛög¥u¥Ï‹˜:åm¬€^&®z`Æå½UZ¢êe´<\\@ƒeo@ßƒV!ûHL¯û±TpŒ’?YÚ/…«ñ=óíÜóÞâ\ZTÁÊùàÌ}\r. AA«ëƒ0š°«‰gr-r®RÚ#…­æOŸ\\·E÷ºþT[õÊ±ª^ p‚V/öqu©ý¬ï£ä¯çÀc\në­z9P.`…{´ÞxÙ6‹½í7+_¨§-¯+‹êL4\\dì·ñïÆÁOòÁwù\0¨n¹öçÃ6U/¸\0Ã0Ö.ã©M´+WÍXdü·°Õ]‹¶\Z˜±Ú•U½@à*<G+£ƒ-2æ·ü–·Ùû3Gµ«ë{»œµUï8øxÕ»ö8P¸ =Ò2’1Á‹Éâ¯®Å{«$]]	[ÎÚªw¼ý[Í¨zå{*ƒÀ”ˆ‘›§EÄrö]ÿ.ãÄç]]k/¶V3~ë¯mqÍiXÕËÊ pc¤ß>­æ·fßÕ½@‹N¨¶ú=~ÓÙovÍiðÊª^ pöAíƒ­k+ìÊˆøqºRåêòkT×ÙÚ	;üÔ¶8P.è§´}8O«}Ó\nJººðÎø{a«Ò*»ÈsJ²k•Œyï©Œª¶¨_ÍÂ»)Ž¼C€ZÑ8øœwç:Óî•U½@à‚NŽyÏMÎÍ~u¾e»*×Š†\'4aß–³¶V7þ}W_í\Zã@e@àA«ï²(TåêÇ˜ø.ž“ÖÔqð©n9{ËÊ€Àh´Ö+ÔêZàw¹Ê•ªÇ¢SëÖÅTÂÕU4U·¨\\`ÇýÉM[U¹œ\\×–Ð•aÂÓjÆÁ«n9P¸`­‡›:Ø<9˜U•kuíf&vûì5“	¨\\°òýY9G+Ÿº)÷¯­°‹ý¦O.ìzè­ÓÓŸ¼Õ¹[8P.hnÛ`“tn‡}×¿Ë‚	H¡ºÕïƒ®ÓJ˜/\\Op 2\\P›ŒÍÍ¡‘ÚÛç—/üUç?­á¬&Õ­îŒƒ×Jˆ•AàÓYË™\\}9*ßß<Õ­fË‡ePÇÊFËƒÀªY}myËÛj]üg¯S×éMš\\˜Š›à´šqðÛv­kTª‘)Löf©r-*mZ&Û­F‡à´xµržçúÜóÞâúÑò pÁr“sCPÍRåZVª}X°¯{\\|_žçº|÷Á½&â@e¸`5-ƒi{p#TåRyiÏäÂ´4ö¡’Ø”×Î°Œ–´Ò¨‰…}šœ7Ï> !›£ì>¼|8ášÑò pAé)ƒ\'¦6)4ªÙ´Êqñ_»ç&©‚Á\'ª[-,-ciíËb’àªí­ºóœV1¹P+a5žþä­ª[-,>üÂ(wÊúà»®QiÑ¸øz˜Vw€µêM-o}ƒÀ\r	Y†_0¯äZ÷\0>…„:\'¦*#,USTÝÂhy¸@Èbe.¿è­µ·ÁeŸS_ôÙ»Võs˜‰zÂR52pDu‹¶ÙÈð+k!.²h‘}×¿Ë™Q\rß—á#Mš*©º…! p!dAå­…Þö›Z×°OhÚþ·¾œg¶Ê‰’ežû›àº€! p!dÖÂÒH[ª*9›¬ÌùeÙ«•¿\' ­g]ŽKp= ­.»ú}†l pEŸ§ö­µpœT­ÆˆšÑêyîyoq- í†¹ãÙ@àçdÑÄÖÂ?¹ik­¡+U‹ÖaÖØþm»Öu€N¶þù_ü•uý‘ÉBBM–OøëÜÏåð^Ö!{§½/óžÏ®8Ó.Z&ÓƒrË\'L9GÃEŸVŒ~ËÛj­re „@“Ú	·þÚ?ûôæL/í†\\tf?V6¯º¸ÓVi¯ª3t9È—Uš6´Äx´Z»!paè¬EÝû¹ú6*žõM‹4´\"p!dAïÎç²Ÿ‹UH5Õ (ßnè0e.\Z±\'KÈ¢OC4ìç¢‹í„eÀôvCû¼¸XùtÁ«·}ÀEC4j‚«n\'ÌûÚÏ7Ì>LÙ>/.j?\'ËtAø•÷]}µó¹hcïû~»wçu~®aÎàeŸZ¡å“¿ÿÐÝB•JËê¸÷Ú¦³ßìg\ZsD/.®f9+Öº2D#-`‚UÈ@–qï³Tký,ÃòÁË€\r.JQÍ‚ù\'Ö9.>‰ç¹O` –vÂ¼wýƒÉ†\\¬`œ{.ªYÐÌÐõµ{n¨¥0S7ýƒà…ÀEM2e\'mƒ.ŒÐüÐer!U·j%Á‹\ZÛ3]Ç…Úºr`­ð@í„Z	AðBà¢†iƒwÝóÇƒM.|ÐÞÐe\\<U´j%Á‹\nƒ–ýY t¡P+!\'ÀEÅƒ0Œu¡†Û	pÍ^ŸyèÖ®\\mZ.b tÁp;á£·ý¦Ž¡¡²·>ÃÌ¬e¸-`Ð•ªB]¡ËÁÈ”m\'Üúk[üLòÿ·w¯UÞwÀÿ£Q/WPzQ¼()^´°¤­]QB€45]q%U¤	ÓÒ6-T\\T†¡ÕŽ€Ò¢TÂpz%B`xÑÑ)”•Ž9ØÍØU¶wÊY£S“sržß¯‹×E¡XûœçyÎ÷}¾ßÏçCÍe-—5µ­ÀåBZ@Ÿ>š:PHàúÓo-t±éqÂ3oMz¡A4Ö¸\\A¨Qèr¼Ç¹sæõ£„ÙiõBó:\Zj¬!p!h}\Z{Mè¢ÙùÌ}±çù—={Ððú®Û«w¬ƒ.- ŸÐ•]¡‹\"ePöÜ¤Ù‹ÐG/8f(p!h[•Á³BEúêÄ[Ž‚c†\\l6°ØË´Ä½Ïß::ì¯—Ï¬‡zÏ´÷˜¡n†ÛZCwBWQÍ4„®î:2õ+Ït`·+kFëg‹>d‹8Ç½D {2#©ˆÐ•¡·ÿþãï…¹zÊ1tè’çF§4Õ¸ØL&‹Z@ºÉQ×•ÐeVW7Ü½|nmÇÎQÏttv—uµÀÅCòkDÎàzI\0E×ue@ò?—\'”´ÜÈžýž#°Ûe-p‘:-\'I;ï\"ŽþðÅ\'‚IK›>ìÙÖ-,^²æ¸ºKC`«^záÕBŽ¦™†º.u[@û;šÛ%puÊ•å›ê´€Ž^xç º.Ômu2Ì\ZÔZ\\àjýàbuZÀv½=>^H]—!Éê¶€ö;z|Áº\\à2¸`3EIvÄPÝÐþ†\Z†%\\Ž<AQ³º1T·8bˆÀåø  žëé\\=ß_üX˜i€Õ¥Óê¶€™Ù%p5¶û (Ú™·&…®Ž»ý¼º-`ÛÆ§fu1¸š3¼8gb=¸@)_c¯¸â_øL¸©©éÉiÏ0´º.ƒ’®Ú7ÆP«´íX¡]®ú:;7ë9\0†^×%t	\\µ•›T Ç\nÓ2^çÂzYY<éþ\nsáâ5ë{«^n¬Üòp­>VhFW½ê¶4É\04Ó¸%(É×óo¸Ò*^Ø1Üè–C3óBÀå(!ÀGSJÙå2›K“@èBàr”èœ—^xµ”ÀõÝÒBO…–><á~*‘Ù²ÚÆ\\•Ètn!Ð•c…wÎ¼#øT8ÜØ}TÝ6^è¸9+4“«•ægŽ¸Ï¡Kàê®œmõUÚóüË¥®¾øD\0ªÀØØ÷9 t	\\Ý–³­B J×O¼QxàúËg¿€*°k÷^÷8 t	\\ÚÃçæóU™›œ(e²\0T>÷7P7ãS³2€Àe&Ð-ÏîSÇ%ph/pµÛíÕ;kO=óŠ‡hí±Â|uZÒ¡@è¸„.À±Â\"|ñcA¨D+‹\'ÝÛ@­]¸xM¸Ê—Ï”íçÏü¢ðÀuïó÷!à™O+\\BÐ	_¾ûz¡ëÏ‹ï\nBÀrº+§¼d\0«t‹—<„@©^ÿå>KàÐ.^à2 ©Ç\n!@»xKè+¸.€’å„—õ¿ÀU‰$~!Ð†c…‚Àð$ê¹®Ê#çl«‡(ÚÏž~Qà¸\0*³kdB=—À%tívæ­IKà¨ÌÑãÖÿ—Ð´¸pyì5«î^>ç~\ZëÆÊ-ë«ºÐ•yD iÇ\nµ…/Ÿûp´Pàb\0)&º€¦+¸.\0G.¡  c…ß-} 	\\\0º\n\\B@|=ÿæ@Áêú‰7Öæ&\'Ö^záÕµ=Ï¿¼þg=»{líÅö­›]¯-†.€­Ûº_àº€vúhêÀ–CVÂYþý«­üÙÇ¦¯Ý¿~^(*ØÈžýîe ñ.\\¼fÝ/p	]@ûd‡j+»Y9~˜Fýþù	BW±ÆÆ¸—V4Ð°æ¸jº<@YÇ\n/¼sðÇ·Cè¸\0ìr	\\‘Ñ	y¬pXAk£„á¨ûº»\\BPW	W	Z_¾ûúÐƒÖFi¦! \rßüÌ÷1`—KàBèê,5ZEÿ7vìu´Pà°Ë%p	]\0E™žœ’†,;‡î-À.—À…Ð°ÎŒ®áZY<é¾ZÅ\\.KèØ†”.€\'Iwnë|Kèä|þî½‚ÒeÇÐ}´ÍÑãÖø—Ð0¨«§æ…¥!rOmóÔ3¯Xß\\B€æ@Q®,ß´¾¸êéÆÊ­õ_<¨@]¥E¼ 4<,í¾ÚæÐÌ¼µ½ÀU_)4º€:K³aIàp¬Pàº\0t+¬µÑtOm”“[Öõ—Ð0€‘=û…¥!IxuOº\n\\]\0¸ý¼À4gçfÝO@+=7:e=/p	]\0ƒÒÞðc€Í|óí=ëy«~øÛß×%ðàuqlú°À4«K§ÝO€n…B€:.³¸\04Ï¸„.\0u\\@mŒŽ¿m/p5/tO)²Ôq™Å`—Kà¢09ëÔq	\\\0u—ÍëwKèPÇ5°í¯4‹Ð±Pà¢Æ/yˆu\\‡­„Ï»—Ï\rÔ¥pÇÎQ÷ c¡ÀE]¸xÍƒ¨ãªÈôäôúµÈcaÀ.—ÀÕRW–o\Z¨ã*ÙÆã€û\n[\0Oðþ\'ŸZ·\\Ív{õŽÐ¨ã*Iv÷¾ÂÀãešŽÛ—àÒøÐeV Ž«XM›±¶€®K)ŒÀ%´Ð‡¥Ot²IF¿G,…- k²Íàã%ŒÌãRÇ%pµ*ti”!M#ÌÍúÑ®Ý{…- “Á*ëN¡Jàê¤£Ç¼€B=.d´Qv°6»·‡¶€V½óG&Ög4QÂ•õ¶À…¶ñ@	™AÕ49:¹•k±±=¼°´!`e÷*ëI;WO_ t0Ôq\r·IÆ£ôÚÃ[@“f+ÍØ¬£.úì`˜_)¼H\0u\\ý5Éè78	[@Óä˜`v±´m¸ÐÁPÇUªÇu$hËN–%pQ\0u\\›ËÎÏh“”˜¤©šz,‹ä\r/@×öšd\04Aæa:,pQ+Ë75Ó\0Ôq=deñ¤Ï°›…ÀÅðši¨ëÔqý(G#5¼\0šÞÊ]m–ÀE\r›id«ÙK\nèrW:j’86ˆÀEa²íì…tµŽK“ ©A+3W­e.\Z\"¿Œ¨ëºVÇ5?sÄg4JºNN,p¡®PÇU{WO•4+hi„!pÑ’º®L÷bú±ºtºQa+_M2\0A‹Ê¼ÿÉ§^rÀ–›Õ$@ÐBà¢)ÄT×lÅÄ¾ƒ	\\cc|f€ …À…Öñ@säx^ÂÖ±éÃ>/@ÐBàBëx@×°¥}½Ï	¨c{w].Xweù¦#†@#ë¸4É\0ê´ÌÑ¸ÀC u\\šd\0‚ºê¸\nÚÝòù\0UÛ52±váâ5ëHúëb˜—‡—(Pç:.2\0Aƒ’u\\Q»T!uï9”µ’5#Û¶°xIC\r vu\\WOÍû\\\0A‹vÈìˆçF§¼lAWmLONû\\€Ò˜¥…À…†\Z@gê¸î_?ïó\0J‘ò\nA‹Re€Ÿ†\Z ŽË c@‹w¸(°¡ÆÑã^È ŽËì- u-.´*SuØº{ùœÏÐâ»]@;­,ž¬4pÍÏñ9\0:\"pa·h§ž*×®Ý{}ÀPZ\\Øíjglì@ea+»k>@‹w.ìv­Ü2·Ôq™½Ô®ó`º-[«!pan Žë2|Ùõú•uDà¢µ²eŸ_”¼ðA—Ù[€Îƒ\\P+Ë7×;ù\0u\\ƒÈ0×ØjçÁ…ÅKÖ_\\hª¨ã2{Ðâ†,«Ž‚:®­:;7ëš:\"pA¿r®Ú1CPÇµ™‘=û]sà‘Æ§f-.Øì˜¡n† ŽëqV—N»ÞÀ#[¼ë<ˆÀ}v3Ì¯T¾D@×FÇ¦»ÖÀ-.ØæÐdõ] ŽËì-@‹w.(¸¾+/W_2P_Ù}*2l]=5ï:ƒÎƒ:\"pA‘2GCc\r¨§4³(2pMON»ÎÐa‚”ÜXCð‚ú¹ý|!a+®ëZ¼ƒÀ:\ZB§åØ_kéÃ®/t°ó  …À5éh˜_¿|9A{ë¸ÌÞ-ÞAàÁÔqPÇu÷ò9×´xê¼ÔxA{ê¸ægŽ¸® Å;\\ ¹PD×®Ý{]Whq‹wk.hAðJ;ys¼ yu\\¦ìš‚YZ pAƒ(?7:å\ZRÇeö´¯Å» …À¢\\\r6 þu\\;vŽºž`–\\ Á0ì:.³·À,-¸ eÇ\róÅàêQÇ5±ï k	fiÀmÜõ:z|Á®TXÇeö˜¥tÀ•å›kãS³¾D¡ä:®³sž;0K.èTky¡?©Á\Z4pe‡Ì5„f´x´@à‚¡9Ì\\/áž,-Ý	[«K§]?0K.@ø‚\'1Ú½w À•†®Z p_j¾à\'i~aöZPHÃt;L!±/jÔqmMæw¹n`h1\\@ß»_)*Îî—vó¨ãz¼üû®Z pC	`ù2³†:®¥¼k†ƒÀÒv>_n)DÎ.X›CX\ZŒ$h&p&xæÿ=ÿl‘£Ž+Ç]/´@àJ\raiÄ‘Z°|6é8bþ®ù;çïžÿ‡Í¾ÄóïXðt»ŽËì-¨î‡0A.`ƒ|1¦)GvÄza¬Š@–/éüw³C•¿Kv­òw´‹ÕíÕ;ŽXv´Ž+»`®”|ä÷¿ï[C‹Aà¶ÊzzálPÿ¬¢¨Ö´Öï^×üÌ×\n-¸\0Ê’Å€ŽŽÝ©ãJ(s ø£Þ‚\\\0tsÌ‘E¥v×q­,žt à •Ó\n†ƒÀðHY(X4µ·ŽËì-´@à¨X\Zj¤I‡ETûê¸vìu@ÐÀnÛ±ºtÚì-(XºÆ\nZ pØíê ³s³ÿ¸&ötm`HA«è.²€Àtp·K\'ÃæH¸2{-¸\0t2¤\0©ÕÚ¸²ãåº€ @˜ÛÕ¼:®‘=û]èS~`Ê±jï}¸\0J—BñüêkQVÿ:®/×úZ7Vny×ƒÀP½,J4Õ¨w×±éÃ®Z p4ÙÂâ%ÇkZÇeöZ p8fHægŽ¸ hÀÐ¶c†ºÖg—Ëu€í\Z™´@àhG7Ã,l,ð€º­¼—¼ŸAàhÕ1CC“A¸\0Ôw‚ p4×7ßÞ[Ÿšµ-@àÐX´\0 ÁÁËàd@Ð.\0\rA¸\0/ ½Òõ4ÝO½3Aàr!\0/`ÈA+]O½\'@ð-@à¼\05Z€À «¡vò h\\\0Å/”¡]2\"BÐ.€\ZùæÛ{k‡fæ-V¡Á²kQ¼Ó\0 ¦RLŸ¢ú×[ÀB3äÇ’ühâ\\\0\rk°‘£I´PßŽƒ‚ p´ ÎËqCÐ¸\0(¸Î+¿¨k+ÕTŸ\\\0:n¨­<¿›åØ  pt|×ëèñM6`ÈÝ¯,ßôŽ.\0~’¢™^`7¸\0(x×kañ’Z/Ø‚üHa7¸\0ÈíÕ;ŽÂC2n!?Jdî÷ p0´#‡é´&|ÑÕ#ƒùñÁ‘A@à PùU?]Õ{Ñ…áÄù‘!;½ž}@à@ø‚!…,uY€À@-Ã—c‡Y\0\0%Õ|évHk²n¬Üò¼\0Íïv˜Eéîf±OÕÝÕd\0ŽÂŽ\næ~ÓÂ¸\0èôî×èøÛBÛ–û(÷“],@à€GHM\0F?ÇS‹•šA»X€À\0€À@}X\Zdö—ˆí¯ÁêÌç.`\\\0”ì›oï­ïvôvÁ4âhþîUš\\¨Á¸\0hH³VÏæ	WÙ­4@à ár­w1}»aåíZåøgÂoBpÂ°û@à cA,ÇØ\n4èèOv{;V½z+G.\0ØR“Ž^§ÄÞÅ®íŽõUo§ªwP¨¸\0 ”²»dqhfþá¬n;f½î=½©Þ±¿ÞÿÏ@à€FÊîP/Ø<,;H½\0´U	{ûóÔM\\\0\0\0\\\0\0\0\0\0€À\0\0€À\0\0 p\0\0\\\0\0\0\\\0\0\0\0\0€À\0\0€À\0\0 p\0\0\\\0\0\0\\\0\0\0\0\0€À\0\0€À\0\0 p\0\0\\\0\0\0\\\0\0\0\0\0€À\0\0€À\0\0 p\0\0\\\0\0\0\\\0\0\0\0\0€À\0\0€À\0\0 p\0\0\\\0\0\0\\\0\0\0\0\0€À\0\0€À\0\0 p\0\0\\.\0\0€À\0\0 p\0\0\\.\0\0@1þË}ÍyèÑÀ\0\0\0\0IEND®B`‚'),
(4,'jason','6182001053@sadasd.com','sma 1','XohImNooBHFR0OVvjcYpJ3NgPQ1qq73WKhHvch0VQtg=',3,NULL);

/*Table structure for table `tingkatpendidikan` */

DROP TABLE IF EXISTS `tingkatpendidikan`;

CREATE TABLE `tingkatpendidikan` (
  `idtingkat` int NOT NULL,
  `tingkat` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tingkatpendidikan` */

/*Table structure for table `transaksi` */

DROP TABLE IF EXISTS `transaksi`;

CREATE TABLE `transaksi` (
  `idtransaksi` int NOT NULL AUTO_INCREMENT,
  `tanggaltransaksi` date DEFAULT NULL,
  `idkursus` int NOT NULL,
  `idsiswa` int NOT NULL,
  PRIMARY KEY (`idtransaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `transaksi` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
