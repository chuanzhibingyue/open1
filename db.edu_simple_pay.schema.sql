-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: edu_simple_pay
-- ------------------------------------------------------
-- Server version	5.7.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `RP_ACCOUNTING_RESERVES`
--

DROP TABLE IF EXISTS `RP_ACCOUNTING_RESERVES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RP_ACCOUNTING_RESERVES` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL COMMENT 'VERSION版本号',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `OPENBANKNAME` varchar(128) NOT NULL COMMENT '备付金银行账户名称',
  `BANKJNREGISTID` bigint(20) DEFAULT NULL COMMENT '银行流水登记ID\r\n            ',
  `ACCOUNTNATURE` varchar(10) NOT NULL COMMENT '账户性质(1:收付 2:汇缴)',
  `REGISTDETAILTYPE` varchar(32) DEFAULT NULL COMMENT '明细类型',
  `LASTBALANCE` double DEFAULT NULL COMMENT '上期余额',
  `CHANGEAMOUNT` double NOT NULL COMMENT '发生额',
  `BALANCE` double NOT NULL COMMENT '余额',
  `JOURNALDATE` date NOT NULL COMMENT '入账日期',
  `ACOUNTDATE` date NOT NULL COMMENT '所统计数据的日期',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2016 DEFAULT CHARSET=utf8 COMMENT='备付金银行帐户统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RP_ACCOUNTING_USER`
--

DROP TABLE IF EXISTS `RP_ACCOUNTING_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RP_ACCOUNTING_USER` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL COMMENT 'VERSION版本号',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `USERTYPE` smallint(6) NOT NULL COMMENT '用户类型（0：商户 1：会员）',
  `LOGINNAME` varchar(50) NOT NULL COMMENT '登录名',
  `SHOWNAME` varchar(90) NOT NULL COMMENT '会员真实姓名，商户签约名',
  `ACCOUNTBALANCE` double NOT NULL COMMENT '账户余额',
  `AVAILABLEAMOUNT` double NOT NULL COMMENT '可用金额',
  `NOTAVAILABLEAMOUNT` double NOT NULL COMMENT '不可用金额',
  `CANTRANSFERAMOUNT` double NOT NULL COMMENT '平台可转出金额',
  `OUTTOPLAYAMOUNT` double NOT NULL COMMENT '平台转出待打款金额',
  `TRANSFERREDOUTAMOUNT` double NOT NULL COMMENT '累计已转出金额',
  `ACOUNTDATE` date NOT NULL COMMENT '所统计数据的日期',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户账户统计表(会计)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RP_MEMBER`
--

DROP TABLE IF EXISTS `RP_MEMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RP_MEMBER` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL COMMENT 'VERSION版本号',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `MEMBERBUSTYPE` smallint(6) NOT NULL COMMENT '会员业务类型',
  `CREATENUM` int(11) NOT NULL COMMENT '新增数量',
  `CANCELNUM` int(11) NOT NULL COMMENT '终止数量',
  `STOCKNUM` int(11) NOT NULL COMMENT '存量数量',
  `CHECKINGNUM` int(11) NOT NULL COMMENT '审批数量',
  `PROVINCE` varchar(6) NOT NULL COMMENT '所属省份',
  `CITY` varchar(6) NOT NULL COMMENT '所属地市',
  `ACOUNTDATE` date NOT NULL COMMENT '所统计数据的日期',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员报表数据表（统计会员非金钱的数据）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RP_MERCHANT`
--

DROP TABLE IF EXISTS `RP_MERCHANT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RP_MERCHANT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL COMMENT 'VERSION版本号',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `MERCHANTTYPE` smallint(6) NOT NULL COMMENT '商户类型：1、在线，2、pos，3、移动',
  `MERCHANTBUSTYPE` smallint(6) NOT NULL COMMENT '商户业务类型:1、企业，2、个体工商，3、个人',
  `PROVINCE` varchar(6) NOT NULL COMMENT '所属省份',
  `CITY` varchar(6) NOT NULL COMMENT '所属地市',
  `CREATENUM` int(11) NOT NULL COMMENT '新增数量',
  `CANCELNUM` int(11) NOT NULL COMMENT '终止数量',
  `STOCKNUM` int(11) NOT NULL COMMENT '存量数量',
  `CHECKINGNUM` int(11) NOT NULL COMMENT '审批数量',
  `ACOUNTDATE` date NOT NULL COMMENT '所统计数据的日期',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户数统计表(统计商户非金钱的数据)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RP_ONLINE_BANK`
--

DROP TABLE IF EXISTS `RP_ONLINE_BANK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RP_ONLINE_BANK` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL COMMENT 'VERSION版本号',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `BANKNAME` varchar(100) DEFAULT NULL COMMENT '银行名称',
  `BANKCODE` varchar(30) NOT NULL COMMENT '银行编号：银行简称，例如：工商银行(ICBC)',
  `TRXTYPE` smallint(6) NOT NULL COMMENT '见字典说明',
  `BANKCHANNELCODE` varchar(30) NOT NULL COMMENT '银行渠道编号：系统自动生成',
  `BANKCHANNELNAME` varchar(100) DEFAULT NULL COMMENT '银行渠道名称：系统自动生成',
  `TRANSACTIONAMOUNT` decimal(18,6) NOT NULL COMMENT '交易金额',
  `TRANSACTIONNUMBER` int(11) NOT NULL COMMENT '交易笔数',
  `REFUNDAMOUNT` decimal(10,2) NOT NULL COMMENT '退款金额',
  `REFUNDNUMBER` smallint(6) NOT NULL COMMENT '退款笔数',
  `TOTALFEE` decimal(18,6) NOT NULL COMMENT '总手续费',
  `ACOUNTDATE` date NOT NULL COMMENT '所统计数据的日期',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COMMENT='在线银行报表数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RP_ONLINE_MEMBER`
--

DROP TABLE IF EXISTS `RP_ONLINE_MEMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RP_ONLINE_MEMBER` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL COMMENT 'VERSION版本号',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `REALNAME` varchar(30) NOT NULL COMMENT '会员名称',
  `LONGINNAME` varchar(50) NOT NULL COMMENT '会员登录名',
  `TRXTYPE` smallint(6) NOT NULL COMMENT '交易类型',
  `TRANSACTIONAMOUNT` decimal(18,6) NOT NULL COMMENT '交易金额',
  `TRANSACTIONNUMBER` int(11) NOT NULL COMMENT '交易笔数',
  `TOTALFEE` decimal(18,6) NOT NULL COMMENT '总手续费',
  `ACOUNTDATE` date NOT NULL COMMENT '所统计数据的日期',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='在线会员报表数据表（统计会员金钱有关的数据）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RP_ONLINE_MERCHANT`
--

DROP TABLE IF EXISTS `RP_ONLINE_MERCHANT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RP_ONLINE_MERCHANT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL COMMENT 'VERSION版本号',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `FULLNAME` varchar(90) NOT NULL COMMENT '公司全称',
  `MERCHANTNO` varchar(20) NOT NULL COMMENT '商户编号',
  `MERCHANTTYPE` smallint(6) NOT NULL COMMENT '商户类型：1、企业，2、个体工商，3、个人',
  `TRXTYPE` smallint(6) NOT NULL COMMENT '交易类型：见交易类型枚举类(加这个字段会造成数据冗余)',
  `FRPCODE` varchar(30) NOT NULL COMMENT '支付渠道编号',
  `BANKCHANNELCODE` varchar(30) NOT NULL COMMENT '银行渠道编号',
  `TRANSACTIONAMOUNT` decimal(18,6) NOT NULL COMMENT '交易金额',
  `TRANSACTIONNUMBER` int(11) NOT NULL COMMENT '交易笔数',
  `REFUNDAMOUNT` decimal(10,2) NOT NULL COMMENT '退款金额',
  `REFUNDNUMBER` smallint(6) NOT NULL COMMENT '退款笔数',
  `INCOME` decimal(18,6) NOT NULL COMMENT '收入',
  `ACOUNTDATE` date NOT NULL COMMENT '所统计数据的日期',
  `BANKNAME` varchar(100) DEFAULT NULL COMMENT '银行名称',
  `BANKCODENAME` varchar(100) DEFAULT NULL COMMENT '银行渠道名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='在线商户报表数据表（统计商户金钱有关的数据）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SEQ_TABLE`
--

DROP TABLE IF EXISTS `SEQ_TABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQ_TABLE` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `CURRENT_VALUE` bigint(20) NOT NULL DEFAULT '1000000002',
  `INCREMENT` smallint(6) NOT NULL DEFAULT '1',
  `REMARK` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_ACCOUNT`
--

DROP TABLE IF EXISTS `TBL_ACCOUNT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_ACCOUNT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` bigint(20) NOT NULL COMMENT '版本号',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `ACCOUNTNO` char(20) NOT NULL COMMENT '账户编号',
  `USERNO` varchar(30) NOT NULL COMMENT '用户编号',
  `ACCOUNTTYPE` smallint(6) NOT NULL COMMENT '1:在线商户 2:代理商 3:个人 4:内部账户 5:POS商户',
  `BALANCE` decimal(24,10) NOT NULL COMMENT '账户余额不含(不可用余额)',
  `UNBALANCE` decimal(24,10) DEFAULT NULL,
  `SECURITYMONEY` decimal(20,2) NOT NULL COMMENT '如设置了保证金,账户余额不能小于保证金',
  `STATUS` smallint(6) NOT NULL COMMENT '100:激活 101:冻结',
  `LASTTIME` datetime DEFAULT NULL COMMENT '最后变动时间',
  `AVAILABLESETTAMOUNT` decimal(20,2) NOT NULL COMMENT '可结算金额',
  `ACCOUNTTITLENO` varchar(20) NOT NULL COMMENT '会计科目编号',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`ACCOUNTNO`) USING BTREE,
  UNIQUE KEY `AK_KEY3` (`USERNO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=499 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_ACCOUNT_ACCOUNTHISTORY`
--

DROP TABLE IF EXISTS `TBL_ACCOUNT_ACCOUNTHISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_ACCOUNT_ACCOUNTHISTORY` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL COMMENT 'VERSION',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `ACCOUNTNO` char(20) NOT NULL COMMENT '账户编号',
  `AMOUNT` decimal(24,10) NOT NULL COMMENT '变动金额',
  `FEE` decimal(24,10) NOT NULL,
  `BALANCE` decimal(24,10) NOT NULL COMMENT '余额',
  `FUNDDIRECTION` smallint(6) NOT NULL COMMENT '321:减少 123:增加',
  `ISALLOWSETT` smallint(6) NOT NULL COMMENT '是否允许结算',
  `ISCOMPLETESETT` smallint(6) NOT NULL COMMENT '是否完成结算',
  `REQUESTNO` varchar(30) NOT NULL COMMENT '请求号',
  `TRXTYPE` smallint(6) NOT NULL COMMENT '交易类型',
  `REMARK` varchar(60) DEFAULT NULL COMMENT '描述',
  `RISK_DAY` smallint(6) DEFAULT NULL COMMENT '风险预存期天数',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36480 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_ACCOUNT_FROZEN_HISTORY`
--

DROP TABLE IF EXISTS `TBL_ACCOUNT_FROZEN_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_ACCOUNT_FROZEN_HISTORY` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL COMMENT 'VERSION',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `ACCOUNT_NO` char(20) NOT NULL COMMENT '账户编号',
  `AMOUNT` decimal(20,6) NOT NULL COMMENT '变动金额',
  `CURRENT_AMOUNT` decimal(20,6) NOT NULL COMMENT '当前不可用余额',
  `ACCOUNT_FROZEN_HISTORY_TYPE` smallint(6) NOT NULL COMMENT '321:解决 123:冻结',
  `REQUEST_NO` varchar(30) NOT NULL COMMENT '请求号',
  `TRX_TYPE` smallint(6) NOT NULL COMMENT '交易类型',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2170 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='资金冻结解冻历史';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_ACCOUNT_FROZEN_RECORD`
--

DROP TABLE IF EXISTS `TBL_ACCOUNT_FROZEN_RECORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_ACCOUNT_FROZEN_RECORD` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` bigint(20) NOT NULL COMMENT 'VERSION',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `ACCOUNT_NO` char(20) DEFAULT NULL COMMENT '账户编号',
  `INITIATOR` smallint(6) DEFAULT NULL COMMENT '发起方(AccountInitiatorEnum)',
  `OPERATION_TYPE` smallint(6) DEFAULT NULL COMMENT '账户操作类型(AccountOperationTypeEnum)',
  `LAST_TIME` datetime DEFAULT NULL COMMENT '最后更新时间',
  `REMARK` varchar(300) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='账户冻结记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BANK_BANKACCOUNT`
--

DROP TABLE IF EXISTS `TBL_BANK_BANKACCOUNT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BANK_BANKACCOUNT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL COMMENT 'VERSION版本号',
  `OPENBANK` varchar(30) NOT NULL COMMENT '开户银行：具体的银行名称',
  `OPENBANKADDRESS` varchar(300) NOT NULL COMMENT '开户行地址：具体到开户支行地址',
  `OPENDATE` datetime NOT NULL COMMENT '开户日期：账户开户的日期',
  `BANKACCOUNT` varchar(30) NOT NULL COMMENT '银行账号：具体的银行帐号',
  `BANKNO` varchar(20) NOT NULL COMMENT '银行行号：具体视银行支行行号，确定与银联系统数据相同',
  `USERNAME` varchar(250) NOT NULL COMMENT '银行账户名称：具体的银行账户名称',
  `OPERATOR` varchar(30) NOT NULL COMMENT '开户经办人：具体经办人',
  `COOPERATIONWAY` smallint(6) NOT NULL COMMENT '合作方式：1：存管银行、2：合作银行',
  `ACCOUNTNATURE` smallint(6) NOT NULL COMMENT '账户性质：1：备付金存管账户、2：自有资金账户、3：备付金收付账户 、4：备付金 汇缴账户',
  `ACCOUNTSTATUS` smallint(6) NOT NULL COMMENT '账户状态：1：正常、2：待销户、3：已销户',
  `ACCOUNTTYPE` smallint(6) NOT NULL COMMENT '账户类型：活期 、 定期 、通支',
  `ONLINEBANKFEE` decimal(12,2) NOT NULL COMMENT '网银管理费：按照具体情况填写',
  `ACCOUNTMNGFEE` decimal(12,2) NOT NULL COMMENT '账户管理费：按照具体情况填写',
  `ISONLINEBANK` smallint(6) NOT NULL COMMENT '是否有网银：1：是、2：否',
  `RECEIPTFORM` smallint(6) NOT NULL COMMENT '回单形式：1、邮寄、2、自取、3、打印',
  `RESERVESEAL` varchar(200) NOT NULL COMMENT '预留印鉴记录',
  `PROPOSER` varchar(60) NOT NULL COMMENT '申请人：具体申请人',
  `LINKMAN` varchar(1000) NOT NULL COMMENT '银行联系方式：姓名、类型、电话、邮箱',
  `OPENACCOUNTOBLIGATE` varchar(60) NOT NULL COMMENT '开户信息预留人',
  `ONLINEBANKOBLIGATE` varchar(60) NOT NULL COMMENT '网银验证码预留人',
  `BIGAMOUNTTRANSFEROBLIGATE` varchar(60) NOT NULL COMMENT '大额转款确定预留人',
  `PLEDGEFDEPOSITS` decimal(12,2) NOT NULL COMMENT '质押保证金',
  `COMMENTS` varchar(300) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='银行账户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BANK_BANKAGREEMENT`
--

DROP TABLE IF EXISTS `TBL_BANK_BANKAGREEMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BANK_BANKAGREEMENT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL COMMENT 'VERSION版本号',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `BANKCODE` varchar(10) NOT NULL COMMENT '银行编码，即银行简称，例如：工商银行（ICBC）',
  `MERCHANTNO` varchar(100) NOT NULL COMMENT '商户编号，支付平台在银行处的编号，由银行提供',
  `AGREEMENTNO` varchar(50) NOT NULL COMMENT '合同编号，支付平台与银行签订的接口协议编号，由具体合同确定',
  `BANKSEQUENCE` varchar(30) NOT NULL COMMENT '银行序号，由支付平台生成的用来区分银行接口的序号。',
  `INTERFACENAME` varchar(50) NOT NULL COMMENT '接口名称，具体根据银行接口名称耳钉',
  `AMOUNTSYSTEM` decimal(10,2) NOT NULL COMMENT '大小额：银行区分系统使用大小额的金额限制',
  `LINKTYPE` smallint(6) NOT NULL COMMENT 'B2B/B2C/快捷支付/批量大款/代收代付,1：B2B、2：B2C、3：快捷支付、4：批量大款、5：代收代付',
  `COMMUNICATIONMODE` varchar(10) NOT NULL COMMENT '通讯方式，HTTP、HTTPS、SFTP',
  `COMMUNICATIONADDRESS` varchar(200) NOT NULL COMMENT '通讯地址，支付平台请求银行的地址',
  `CONTRACTOANO` varchar(100) NOT NULL COMMENT '合同OA号，协议在支付平台OA系统中的标号',
  `CARDTYPE` varchar(50) NOT NULL COMMENT '卡种，借记卡100、信用卡101',
  `ONLINETIME` datetime NOT NULL COMMENT '上线时间，协议正式生效时间',
  `OFFLINETIME` datetime NOT NULL COMMENT '下线时间，协议到期时间',
  `MERCHANTTYPE` varchar(50) NOT NULL COMMENT '商户类型，接口支持的允许支付平台接入的商户类型',
  `PROVINCE` varchar(6) NOT NULL COMMENT '省',
  `CITY` varchar(6) NOT NULL COMMENT '市',
  `AREA` varchar(6) NOT NULL COMMENT '区',
  `LINKMAN` varchar(1000) DEFAULT NULL COMMENT '银行联系人：名称、类型、电话、邮箱',
  `REMARK` varchar(150) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='银行协议表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BANK_BANKCHANNEL`
--

DROP TABLE IF EXISTS `TBL_BANK_BANKCHANNEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BANK_BANKCHANNEL` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL COMMENT 'VERSION版本号',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `BANKCHANNELCODE` varchar(30) NOT NULL COMMENT '银行渠道编号：系统自动生成',
  `BANKCHANNELNAME` varchar(100) NOT NULL COMMENT '银行渠道名称：系统自动生成',
  `BANKNAME` varchar(30) NOT NULL COMMENT '银行名称',
  `BANKCODE` varchar(10) NOT NULL COMMENT '银行编号：银行简称，例如：工商银行(ICBC)',
  `STATUS` smallint(6) NOT NULL COMMENT '状态:100:激活 101:冻结',
  `LANDINGBANKNAME` varchar(200) NOT NULL COMMENT '落地行名称：具体到支行',
  `BANKAGREEMENTID` bigint(20) NOT NULL COMMENT '银行协议ID',
  `BANKACCOUNTID` bigint(20) NOT NULL COMMENT '银行账户ID',
  `REMARK` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`BANKCHANNELCODE`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='银行渠道表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BANK_BANKSETTLEMENT`
--

DROP TABLE IF EXISTS `TBL_BANK_BANKSETTLEMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BANK_BANKSETTLEMENT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) NOT NULL COMMENT '版本号',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `BANKCHANNELCODE` varchar(50) NOT NULL COMMENT '银行渠道编号',
  `SETTLECYCLE` smallint(6) NOT NULL COMMENT '结算周期：T+X',
  `CHARGEACCOUNT` varchar(30) NOT NULL COMMENT '手续费账户：关联银行账户表',
  `MARGINACCOUNT` varchar(30) NOT NULL COMMENT '保证金账户：关联银行账户表',
  `CHARGEDEDUCTWAY` smallint(6) NOT NULL COMMENT '手续费扣收方式：1：内扣、2：外扣',
  `CHARGEDEDUCTCYCLE` smallint(6) NOT NULL COMMENT '手续费扣收周期：1：实时、2：包年',
  `CHARGEPAYWAY` smallint(6) NOT NULL COMMENT '手续费支付方式：1：自动扣帐、2：人工转账',
  `REFOUNDTYPE` smallint(6) NOT NULL COMMENT '退款方式：1：内扣、2：外扣',
  `REFOUNDDEDUCTWAY` smallint(6) NOT NULL COMMENT '退款扣收方式：1：接口、2：网银、3：传真、4：邮件、5：邮寄',
  `REFOUNDVALIDITY` smallint(6) NOT NULL COMMENT '退款有效期：（X天内允许退款）',
  `ISRABATES` smallint(6) NOT NULL COMMENT '是否支持部分退款：1：是 、 2：否',
  `ISRETURNCHARGE` smallint(6) NOT NULL COMMENT '是否退回手续费：1：是 、 2：否',
  `ISRETURNPARTFEE` smallint(6) NOT NULL COMMENT '部分退款是否退回部分手续费：对于支持部分退款的情况 ：1：是 、 2 ：否',
  `REFUNDACCOUNTTIME` smallint(6) NOT NULL COMMENT '退款到账时间（X天后到帐）',
  `REFUNDLIMIT` decimal(15,2) DEFAULT NULL COMMENT '退款限额',
  `ISNONWORKDAYACCOUNT` smallint(6) NOT NULL COMMENT '是否非工作日到账',
  `COMMENTS` varchar(300) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='银行结算信息数据管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BANK_CARDBIN`
--

DROP TABLE IF EXISTS `TBL_BANK_CARDBIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BANK_CARDBIN` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL COMMENT '版本号',
  `CARDBIN` varchar(10) NOT NULL COMMENT '卡BIN',
  `BANKCODE` varchar(25) DEFAULT NULL COMMENT '发卡行代码',
  `BANKNAME` varchar(50) DEFAULT NULL COMMENT '发卡行名称',
  `CARDNAME` varchar(50) DEFAULT NULL COMMENT '卡名',
  `CARDKIND` smallint(6) DEFAULT NULL COMMENT '卡种:1借记卡,2贷记卡,3准贷记卡,4预付费卡',
  `CARDLENGTH` smallint(6) DEFAULT NULL COMMENT '卡片长度',
  `STATUS` smallint(6) DEFAULT NULL COMMENT '状态:101无效、100有效',
  `LASTUPDATORID` bigint(20) DEFAULT NULL COMMENT '最后修改人',
  `LASTUPDATORNAME` varchar(100) DEFAULT NULL COMMENT '最后修改人名称',
  `LASTUPDATETIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11592 DEFAULT CHARSET=utf8 COMMENT='银行卡BIN表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BOSS_AREA_CITY`
--

DROP TABLE IF EXISTS `TBL_BOSS_AREA_CITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BOSS_AREA_CITY` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PROVINCENO` varchar(6) NOT NULL COMMENT '省编号',
  `CITYNO` varchar(6) NOT NULL COMMENT '地市编号',
  `CITYNAME` varchar(200) NOT NULL COMMENT '地市名称',
  `ORDERS` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序号',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`PROVINCENO`,`CITYNO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8 COMMENT='地区管理--地市表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BOSS_AREA_PROVINCE`
--

DROP TABLE IF EXISTS `TBL_BOSS_AREA_PROVINCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BOSS_AREA_PROVINCE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PROVINCENO` varchar(6) NOT NULL COMMENT '省编号',
  `PROVINCENAME` varchar(50) NOT NULL COMMENT '省名称',
  `ORDERS` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序号',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`PROVINCENO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='地区管理--省份表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BOSS_AREA_TOWN`
--

DROP TABLE IF EXISTS `TBL_BOSS_AREA_TOWN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BOSS_AREA_TOWN` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CITYNO` varchar(6) NOT NULL,
  `TOWNNO` varchar(6) NOT NULL COMMENT '区域编号',
  `TOWNNAME` varchar(200) NOT NULL COMMENT '区域名称',
  `ORDERS` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序号',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`CITYNO`,`TOWNNO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3161 DEFAULT CHARSET=utf8 COMMENT='地区管理--镇区表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BOSS_ARTICLE`
--

DROP TABLE IF EXISTS `TBL_BOSS_ARTICLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BOSS_ARTICLE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL,
  `CREATETIME` datetime NOT NULL,
  `TYPE` smallint(6) NOT NULL COMMENT '1:文章 2:招聘 3:常见问题 4:产品',
  `TITLE` varchar(150) NOT NULL,
  `CONTENT` mediumtext NOT NULL,
  `EDITTIME` datetime NOT NULL,
  `OPERATORID` bigint(20) NOT NULL,
  `OPERATORNAME` varchar(90) NOT NULL,
  `STATUS` smallint(6) NOT NULL COMMENT '100:激活,101:停用',
  `ARTICLETYPE` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='文章管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BOSS_CONTRACT`
--

DROP TABLE IF EXISTS `TBL_BOSS_CONTRACT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BOSS_CONTRACT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL COMMENT 'VERSION版本号',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `USERNO` varchar(50) NOT NULL COMMENT '用户编号，关联商户编号，会员编号，银行协议编号',
  `USERNAME` varchar(90) DEFAULT NULL COMMENT '关联名称，关联的商户表的商户名称或者银行渠道表的银行渠道名称',
  `CONTRACTNO` varchar(30) NOT NULL COMMENT '合同编号',
  `CONTRACTTYPE` smallint(6) NOT NULL COMMENT '1、商户合同；2、银行合同',
  `FILEPROPERTIES` smallint(6) NOT NULL COMMENT '1、首次签约，2、续约，3、变更资料，4、其它\n            1、首次签约，2、续约，3、变更资料，4、其它\n            ',
  `CONTRACTFILE` varchar(300) DEFAULT NULL COMMENT '合同保存路径',
  `CREATER` varchar(50) DEFAULT NULL COMMENT '创建人',
  `MODIFYTIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  `FILENAME` varchar(200) DEFAULT NULL COMMENT '原文件名',
  `REMARK` varchar(500) DEFAULT NULL COMMENT '描述',
  `RELATIONNUNBER` varchar(50) DEFAULT NULL COMMENT '商户编号或者银行序号',
  `SIGNTIME` datetime DEFAULT NULL,
  `CONTRACTVALID` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BOSS_EMAIL_VERIFY`
--

DROP TABLE IF EXISTS `TBL_BOSS_EMAIL_VERIFY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BOSS_EMAIL_VERIFY` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL COMMENT 'VERSION',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `VALIDTIME` datetime NOT NULL COMMENT '有效时间',
  `TOKEN` varchar(200) NOT NULL COMMENT '令牌（32位UUID值）',
  `TYPE` smallint(6) NOT NULL COMMENT '类型',
  `STATUS` smallint(6) NOT NULL COMMENT '状态(100:已验证,101:未验证)',
  `USERNO` varchar(100) DEFAULT NULL COMMENT '用户编号',
  `USERTYPE` smallint(6) DEFAULT NULL COMMENT '用户类型（对应账户类型枚举值）',
  `TOEMAIL` varchar(100) DEFAULT NULL COMMENT '接收邮箱',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`TOKEN`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 COMMENT='邮箱验证记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BOSS_GLOBALSET`
--

DROP TABLE IF EXISTS `TBL_BOSS_GLOBALSET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BOSS_GLOBALSET` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL,
  `CREATETIME` datetime NOT NULL,
  `SETKEY` varchar(50) NOT NULL,
  `SETCONTENT` mediumtext NOT NULL,
  `DESCRIPTION` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`SETKEY`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BOSS_MERCHANT_SALES`
--

DROP TABLE IF EXISTS `TBL_BOSS_MERCHANT_SALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BOSS_MERCHANT_SALES` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL COMMENT 'VERSION版本号',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `MERCHANTNO` varchar(15) DEFAULT NULL,
  `SALESID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='商户销售人员管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BOSS_PMS_ACTION`
--

DROP TABLE IF EXISTS `TBL_BOSS_PMS_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BOSS_PMS_ACTION` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` int(11) NOT NULL DEFAULT '0' COMMENT 'VERSION',
  `CREATETIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `ACTIONNAME` varchar(90) NOT NULL COMMENT '权限名称',
  `ACTION` varchar(100) NOT NULL COMMENT '权限',
  `REMARK` varchar(300) NOT NULL COMMENT '描述',
  `MENUID` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `A_KEY_2` (`ACTION`) USING BTREE,
  UNIQUE KEY `A_KEY_3` (`ACTIONNAME`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=762 DEFAULT CHARSET=utf8 COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BOSS_PMS_MENU`
--

DROP TABLE IF EXISTS `TBL_BOSS_PMS_MENU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BOSS_PMS_MENU` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `VERSION` int(11) NOT NULL DEFAULT '0' COMMENT 'VERSION',
  `CREATETIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `NAME` varchar(90) DEFAULT NULL COMMENT '菜单名称',
  `URL` varchar(150) DEFAULT NULL COMMENT '菜单URL',
  `NUMBER` varchar(20) DEFAULT NULL COMMENT '序号',
  `ISLEAF` smallint(6) DEFAULT NULL COMMENT '是否叶子节点:0父节点,1叶节点',
  `LEVEL` smallint(6) DEFAULT NULL COMMENT '层级:一级菜单,二级菜单,三级菜单',
  `PARENTID` bigint(20) NOT NULL DEFAULT '0' COMMENT '父节点:一级菜单为0',
  `TARGETNAME` varchar(50) DEFAULT NULL COMMENT '目标名称（用于DWZUI的NAVTABID）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2308 DEFAULT CHARSET=utf8 COMMENT='菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BOSS_PMS_OPERATOR`
--

DROP TABLE IF EXISTS `TBL_BOSS_PMS_OPERATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BOSS_PMS_OPERATOR` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` int(11) NOT NULL DEFAULT '0' COMMENT 'VERSION',
  `CREATETIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `LOGINNAME` varchar(50) NOT NULL COMMENT '登录名',
  `LOGINPWD` varchar(256) NOT NULL COMMENT '登录密码',
  `REMARK` varchar(300) NOT NULL COMMENT '描述',
  `REALNAME` varchar(50) NOT NULL COMMENT '姓名',
  `MOBILENO` varchar(15) NOT NULL COMMENT '手机号',
  `STATUS` varchar(10) NOT NULL COMMENT '状态',
  `TYPE` char(1) NOT NULL COMMENT '操作员类型（1:超级管理员，0:普通操作员）',
  `LASTLOGINTIME` datetime DEFAULT NULL COMMENT '最后登录时间',
  `ISCHANGEDPWD` smallint(6) NOT NULL COMMENT '是否更改过密码',
  `PWDERRORCOUNT` smallint(6) DEFAULT '0' COMMENT '连续输错密码次数（连续5次输错就冻结帐号）',
  `PWDERRORTIME` datetime DEFAULT NULL COMMENT '最后输错密码时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `A_KEY_2` (`LOGINNAME`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='操作员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BOSS_PMS_OPERATOR_LOG`
--

DROP TABLE IF EXISTS `TBL_BOSS_PMS_OPERATOR_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BOSS_PMS_OPERATOR_LOG` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `CREATETIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `OPERATORID` bigint(20) NOT NULL COMMENT '操作员ID',
  `OPERATORNAME` varchar(50) NOT NULL COMMENT '操作员姓名',
  `OPERATETYPE` smallint(6) NOT NULL COMMENT '操作类型（1:增加，2:修改，3:删除，4:查询）',
  `STATUS` smallint(6) NOT NULL COMMENT '操作状态（1:成功，0:失败）',
  `IP` varchar(100) NOT NULL COMMENT 'IP地址',
  `CONTENT` varchar(3000) DEFAULT NULL COMMENT '操作内容',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15104 DEFAULT CHARSET=utf8 COMMENT='权限_操作员操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BOSS_PMS_ROLE`
--

DROP TABLE IF EXISTS `TBL_BOSS_PMS_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BOSS_PMS_ROLE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` int(11) NOT NULL DEFAULT '0' COMMENT 'VERSION',
  `CREATETIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `ROLETYPE` char(1) NOT NULL COMMENT '角色类型（1:超级管理员角色，0:普通操作员角色）',
  `ROLENAME` varchar(90) NOT NULL COMMENT '角色名称',
  `REMARK` varchar(300) NOT NULL COMMENT '描述',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `A_KEY_2` (`ROLENAME`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BOSS_PMS_ROLE_ACTION`
--

DROP TABLE IF EXISTS `TBL_BOSS_PMS_ROLE_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BOSS_PMS_ROLE_ACTION` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ROLEID` bigint(20) NOT NULL COMMENT '角色ID',
  `ACTIONID` bigint(20) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `A_KEY_2` (`ROLEID`,`ACTIONID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39519 DEFAULT CHARSET=utf8 COMMENT='权限与角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BOSS_PMS_ROLE_MENU`
--

DROP TABLE IF EXISTS `TBL_BOSS_PMS_ROLE_MENU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BOSS_PMS_ROLE_MENU` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ROLEID` bigint(20) NOT NULL COMMENT '角色ID',
  `MENUID` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `A_KEY_2` (`ROLEID`,`MENUID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22039 DEFAULT CHARSET=utf8 COMMENT='菜单与角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BOSS_PMS_ROLE_OPERATOR`
--

DROP TABLE IF EXISTS `TBL_BOSS_PMS_ROLE_OPERATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BOSS_PMS_ROLE_OPERATOR` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ROLEID` bigint(20) NOT NULL COMMENT '角色ID',
  `OPERATORID` bigint(20) NOT NULL COMMENT '操作员ID',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `A_KEY_2` (`ROLEID`,`OPERATORID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='操作员与角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BOSS_SALES`
--

DROP TABLE IF EXISTS `TBL_BOSS_SALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BOSS_SALES` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL,
  `CREATETIME` datetime NOT NULL,
  `SALESNO` char(20) NOT NULL,
  `SALESNAME` varchar(30) NOT NULL,
  `MOBILE` varchar(15) NOT NULL,
  `STATUS` smallint(6) NOT NULL COMMENT '状态：100:激活 101:冻结',
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`SALESNO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='销售人员信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BOSS_SCORE`
--

DROP TABLE IF EXISTS `TBL_BOSS_SCORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BOSS_SCORE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL,
  `CREATETIME` datetime NOT NULL,
  `ACCOUNTNO` char(20) NOT NULL,
  `LOGINSCORE` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`ACCOUNTNO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='积分表（记录与账户对应）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_BOSS_SCORE_LOG`
--

DROP TABLE IF EXISTS `TBL_BOSS_SCORE_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_BOSS_SCORE_LOG` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL,
  `CREATETIME` datetime NOT NULL,
  `ACCOUNTNO` char(20) NOT NULL,
  `CHANGESCORE` decimal(10,2) NOT NULL COMMENT '变动积分（增加积分为正数，扣减积分为负数）',
  `CHANGEDESC` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1938 DEFAULT CHARSET=utf8 COMMENT='积分变动记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_CAL_COST_INTERFACE`
--

DROP TABLE IF EXISTS `TBL_CAL_COST_INTERFACE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_CAL_COST_INTERFACE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` int(11) NOT NULL DEFAULT '0' COMMENT 'VERSION',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `INTERFACE_CODE` varchar(100) DEFAULT NULL COMMENT '计费接口编码',
  `INTERFACE_NAME` varchar(100) DEFAULT NULL COMMENT '计费接口名称',
  `CHARGE_TYPE` int(11) DEFAULT NULL COMMENT '扣费类型(1:内扣,2:外扣,对应枚举:CostInterfaceChargeTypeEnum)',
  `BILL_CYCLE` int(11) DEFAULT NULL COMMENT '账单周期(1:周结算,2:月结算,3:季度结算,4:年结算,5:自定义,对应枚举:CostBillCycleEnum)',
  `CUSTOM_BILL_CYCLE` int(11) DEFAULT NULL COMMENT '自定义账单周期',
  `CUSTOM_BILL_DAY` date DEFAULT NULL COMMENT '自定义账单日',
  `STATUS` int(11) DEFAULT NULL COMMENT '计费接口状态(100:开启,101:关闭,对应枚举:CostInterfaceStatusEnum)',
  `POLICY` int(11) DEFAULT NULL COMMENT '计费接口成本计费策略(1:逐笔,2:包年,对应枚举:CostInterfacePolicyEnum)',
  `REMARK` varchar(300) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='计费接口';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_CAL_COST_ORDER`
--

DROP TABLE IF EXISTS `TBL_CAL_COST_ORDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_CAL_COST_ORDER` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL,
  `MERCHANT_NO` varchar(32) DEFAULT NULL,
  `MERCHANT_NAME` varchar(256) DEFAULT NULL,
  `FROM_SYSTEM` smallint(6) NOT NULL,
  `FEE_WAY_ID` bigint(20) DEFAULT NULL,
  `MERCHANT_ORDER_NO` varchar(50) NOT NULL,
  `TRX_NO` varchar(64) DEFAULT NULL,
  `BANK_ORDER_NO` varchar(64) NOT NULL,
  `CAL_INTERFACE` varchar(50) DEFAULT NULL,
  `CAL_EXPRESSION` varchar(256) DEFAULT NULL,
  `AMOUNT` decimal(15,2) DEFAULT NULL,
  `FEE` decimal(18,6) DEFAULT NULL,
  `TRX_TIME` datetime DEFAULT NULL,
  `COST_ITEM` smallint(6) DEFAULT NULL,
  `STATUS` smallint(6) DEFAULT NULL,
  `FAILED_REASON` varchar(512) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `CAL_END_TIME` datetime DEFAULT NULL,
  `CAL_ORDER_TYPE` smallint(6) DEFAULT NULL COMMENT '实时  后算',
  `MCC` varchar(50) DEFAULT NULL,
  `ORG_TRX_NO` varchar(64) DEFAULT NULL COMMENT '原支付流水号',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_Key_2` (`FROM_SYSTEM`,`BANK_ORDER_NO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16490 DEFAULT CHARSET=utf8 COMMENT='成本订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_CAL_DIMENSION`
--

DROP TABLE IF EXISTS `TBL_CAL_DIMENSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_CAL_DIMENSION` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL,
  `CAL_PRODUCT` varchar(50) DEFAULT NULL,
  `CAL_COST_INTERFACE_CODE` varchar(50) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='计费维度';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_CAL_FEE_FLOW`
--

DROP TABLE IF EXISTS `TBL_CAL_FEE_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_CAL_FEE_FLOW` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL,
  `FEE_WAY_ID` bigint(20) DEFAULT NULL,
  `BEGIN_DATE` date DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `TOTAL_AMOUNT` decimal(18,2) DEFAULT NULL,
  `THIS_AMOUNT` decimal(18,2) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计费流量';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_CAL_FEE_RATE_FORMULA`
--

DROP TABLE IF EXISTS `TBL_CAL_FEE_RATE_FORMULA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_CAL_FEE_RATE_FORMULA` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL,
  `FEE_WAY_ID` bigint(20) DEFAULT NULL,
  `FIXED_FEE` decimal(18,6) DEFAULT NULL,
  `PERCENT_FEE` decimal(18,6) DEFAULT NULL,
  `MIN_AMOUNT` decimal(18,6) DEFAULT NULL,
  `MAX_AMOUNT` decimal(18,6) DEFAULT NULL,
  `MIN_LADDER_AMOUNT` decimal(18,6) DEFAULT NULL,
  `MAX_LADDER_AMOUNT` decimal(18,6) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `SINGLE_MIN_FEE` decimal(18,6) DEFAULT NULL,
  `SINGLE_MAX_FEE` decimal(18,6) DEFAULT NULL,
  `MODEL` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COMMENT='计费费率公式';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_CAL_FEE_WAY`
--

DROP TABLE IF EXISTS `TBL_CAL_FEE_WAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_CAL_FEE_WAY` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL COMMENT '版本号',
  `DIMENSION_ID` bigint(20) DEFAULT NULL COMMENT '维度ID',
  `WAY_NAME` varchar(60) DEFAULT NULL COMMENT '约束名称',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `FEE_FREE_AMOUNT` decimal(18,2) DEFAULT NULL COMMENT '免计费金额',
  `STATUS` smallint(6) DEFAULT NULL COMMENT '状态',
  `CYCLE_TYPE` smallint(6) DEFAULT NULL COMMENT '计费周期（周 月 季度 年）',
  `CUS_CYCLE_TYPE` smallint(6) DEFAULT NULL COMMENT '自定义计费周期',
  `CUSTOMIZE_DAY` date DEFAULT NULL COMMENT '自定义计费日',
  `CAL_TYPE` smallint(6) DEFAULT NULL COMMENT '计费类型（ 单笔：SIMPLE，区间：INTERVAL，阶梯：LADDER）',
  `CAL_PERIOD` smallint(6) DEFAULT NULL COMMENT '计费方式（实收 后收）',
  `CAL_ROLE` smallint(6) DEFAULT NULL COMMENT '计费角色（付款人收款人  支付平台）',
  `BEGIN_DATE` date DEFAULT NULL COMMENT '生效日期',
  `END_DATE` date DEFAULT NULL COMMENT '失效日期',
  `MCC` varchar(4) DEFAULT NULL COMMENT 'MCC码',
  `IS_ROUND` smallint(6) DEFAULT NULL COMMENT '是否四舍五入',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='计费约束';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_FEE_CALCULATE_WAY`
--

DROP TABLE IF EXISTS `TBL_FEE_CALCULATE_WAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_FEE_CALCULATE_WAY` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) NOT NULL COMMENT 'VERSION',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `FEE_DIMENSION_ID` bigint(20) NOT NULL COMMENT '费率维度ID',
  `ISREFUND_FEE` varchar(1) DEFAULT NULL COMMENT '退款是否退手续费',
  `CALCULATE_TYPE` varchar(32) DEFAULT NULL COMMENT '计费类型（阶梯..、直接）',
  `CHARGE_TYPE` varchar(32) DEFAULT NULL COMMENT '收费方式（实时收、后收）',
  `FEE_ROLE` varchar(32) DEFAULT NULL COMMENT '计费角色（收款方、付款方区分）',
  `FEE_FREE_AMOUNT` decimal(15,2) DEFAULT NULL COMMENT '免计费金额',
  `EFFECTIVEDATE_START` datetime DEFAULT NULL COMMENT '公式生效日期起',
  `EFFECTIVE_DATE_END` datetime DEFAULT NULL COMMENT '公式生效日期止',
  `BILL_CYCLE_TYPE` varchar(32) DEFAULT NULL COMMENT '账单周期类型',
  `CUSTOMIZE_BILL_CYCLE_TYPE` varchar(32) DEFAULT NULL COMMENT '自定义账单周期类型',
  `CUSTOMIZE_BILL_DAY` varchar(2) DEFAULT NULL COMMENT '自定义账单日',
  `ISDELETE` smallint(6) NOT NULL COMMENT '是否已删除',
  `MODIFYTIME` datetime DEFAULT NULL COMMENT '修改时间',
  `LADDER_CYCLE_TYPE` varchar(32) DEFAULT NULL,
  `CUSTOMIZE_CYCLE_TYPE` varchar(32) DEFAULT NULL,
  `CUSTOMERIZE_DAY` varchar(2) DEFAULT NULL,
  `LADDER_NAME` varchar(128) DEFAULT NULL,
  `IS_ROUND` smallint(6) DEFAULT NULL COMMENT '是否四舍五入',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='计费方式信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_FEE_DIMENSION`
--

DROP TABLE IF EXISTS `TBL_FEE_DIMENSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_FEE_DIMENSION` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` bigint(20) NOT NULL COMMENT 'VERSION',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `FEE_NODE_ID` bigint(20) NOT NULL COMMENT '费率节点id',
  `PAY_PRODUCT` varchar(100) NOT NULL COMMENT '支付产品',
  `FRP_CODE` varchar(100) NOT NULL COMMENT '支付方式',
  `BANK_CHANNEL_CODE` varchar(100) NOT NULL COMMENT '支付接口编号',
  `PAY_PRODUCT_NAME` varchar(200) DEFAULT NULL,
  `STATUS` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8 COMMENT='费率维度';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_FEE_FLOW_ACCUMULATOR`
--

DROP TABLE IF EXISTS `TBL_FEE_FLOW_ACCUMULATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_FEE_FLOW_ACCUMULATOR` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) NOT NULL COMMENT 'VERSION',
  `CREATETIME` datetime NOT NULL,
  `MERCHANTNO` varchar(64) NOT NULL,
  `CALCULATE_WAY_ID` bigint(20) NOT NULL,
  `ACC_INTERVAL_START` datetime DEFAULT NULL,
  `ACC_INTERVAL_END` datetime DEFAULT NULL,
  `TOTAL_AMOUNT` decimal(15,2) DEFAULT '0.00',
  `THIS_AMOUNT` decimal(15,2) DEFAULT '0.00',
  `MODIFY_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流量累加器';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_FEE_FORMULA`
--

DROP TABLE IF EXISTS `TBL_FEE_FORMULA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_FEE_FORMULA` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) NOT NULL COMMENT 'VERSION',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `CALCULATE_WAY_ID` bigint(20) NOT NULL COMMENT '计费方式信息ID',
  `FORMULA_TYPE` smallint(6) DEFAULT NULL COMMENT '公式类型（收款方、付款方区分）',
  `FIXED_FEE` decimal(15,6) DEFAULT NULL COMMENT '固定金额费率基数',
  `PERCENT_FEE` decimal(15,6) DEFAULT NULL COMMENT '百分比费率基数',
  `SINGLE_MIN_FEE` decimal(15,6) DEFAULT NULL COMMENT '单笔最低手续费',
  `SINGLE_MAX_FEE` decimal(15,6) DEFAULT NULL COMMENT '单笔最高手续费',
  `MIN_LADDER_AMOUNT` decimal(18,6) DEFAULT NULL COMMENT '阶梯金额下限',
  `MAX_LADDER_AMOUNT` decimal(18,6) DEFAULT NULL COMMENT '阶梯金额上限',
  `MIN_AMOUNT` decimal(18,6) DEFAULT NULL COMMENT '单笔金额下限',
  `MAX_AMOUNT` decimal(18,6) DEFAULT NULL COMMENT '单笔金额上限',
  `STATUS` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COMMENT='计费公式表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_FEE_NODE`
--

DROP TABLE IF EXISTS `TBL_FEE_NODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_FEE_NODE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` bigint(20) NOT NULL COMMENT 'VERSION',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `CALCULATE_FEE_ITEM` smallint(6) NOT NULL COMMENT '收费项',
  `NODE_TYPE` varchar(16) DEFAULT NULL,
  `NODE_NAME` varchar(256) DEFAULT NULL COMMENT '节点名称',
  `REMARK` varchar(256) DEFAULT NULL COMMENT '描述',
  `STATUS` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='费率节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_FEE_ORDER`
--

DROP TABLE IF EXISTS `TBL_FEE_ORDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_FEE_ORDER` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) NOT NULL COMMENT 'VERSION',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `CALCULATE_WAY_ID` bigint(20) DEFAULT NULL COMMENT '计费方式ID',
  `TRX_FLOW_NO` varchar(50) NOT NULL COMMENT '交易流水号',
  `PARENT_FLOW_NO` varchar(50) DEFAULT NULL COMMENT '父交易流水号(退款订单有值)',
  `TRX_DATE` datetime DEFAULT NULL COMMENT '交易时间',
  `MERCHANT_NO` varchar(64) DEFAULT NULL COMMENT '商户编号',
  `MERCHANT_NAME` varchar(200) DEFAULT NULL COMMENT '商户名称',
  `MERCHANT_ORDER_NO` varchar(50) DEFAULT NULL COMMENT '商户订单号',
  `USERTYPE` varchar(32) DEFAULT NULL COMMENT '用户类型',
  `TRXTYPE` varchar(64) DEFAULT NULL COMMENT '业务类型',
  `CALCULATE_FEE_ITEM` varchar(64) DEFAULT NULL COMMENT '收费项',
  `PAY_PRODUCT` varchar(32) DEFAULT NULL COMMENT '支付产品',
  `FRPCODE` varchar(32) DEFAULT NULL COMMENT '支付方式',
  `OL_PAY_PRODUCT` varchar(32) DEFAULT NULL COMMENT '原支付产品',
  `OL_FRPCODE` varchar(32) DEFAULT NULL COMMENT '原支付方式',
  `BANKCHANNELCODE` varchar(32) DEFAULT NULL COMMENT '支付接口',
  `FEE_ROLE` varchar(32) DEFAULT NULL COMMENT '计费角色（收款方、付款方、平台商)',
  `CALCULATE_TYPE` varchar(30) DEFAULT NULL COMMENT '计费类型（阶梯、直接）',
  `FEE_BASE` varchar(200) DEFAULT NULL COMMENT '费率/费额',
  `AMOUNT` decimal(15,2) DEFAULT NULL COMMENT '计费金额',
  `PAYALL_FEE` decimal(15,6) DEFAULT NULL COMMENT '总手续费',
  `PAYEE_FEE` decimal(15,6) DEFAULT NULL COMMENT '收款方实际费用',
  `PAYEE_UN_BACK_FEE` decimal(15,6) DEFAULT NULL COMMENT '收款方应收费用',
  `PAYER_FEE` decimal(15,2) DEFAULT NULL COMMENT '付款方实际费用',
  `PAYER_UN_BACK_FEE` decimal(15,2) DEFAULT NULL COMMENT '付款方应收费用',
  `CHARGE_TYPE` varchar(32) DEFAULT NULL COMMENT '收费模式（实扣、线下）',
  `CHARGE_PERIODIC` varchar(16) DEFAULT NULL COMMENT '收费周期类型',
  `ORDER_TYPE` varchar(16) DEFAULT NULL COMMENT '订单类型',
  `STATUS` varchar(16) DEFAULT NULL COMMENT '状态',
  `REMARK` varchar(256) DEFAULT NULL COMMENT '备注',
  `CALCULATE_DATE` datetime DEFAULT NULL COMMENT '计费时间',
  `CONFIRM_DATE` datetime DEFAULT NULL COMMENT '实收时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_Key_2` (`TRX_FLOW_NO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16708 DEFAULT CHARSET=utf8 COMMENT='计费订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_FEE_PREPAID_FLOW_INFO`
--

DROP TABLE IF EXISTS `TBL_FEE_PREPAID_FLOW_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_FEE_PREPAID_FLOW_INFO` (
  `ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `FEE_CAL_WAY_ID` bigint(20) DEFAULT NULL,
  `AMOUNT` double DEFAULT NULL,
  `QUANTITY` bigint(20) DEFAULT NULL,
  `FLOW_TYPE` smallint(6) DEFAULT NULL,
  `CYCLE_TYPE` smallint(6) DEFAULT NULL,
  `CUSTOMIZE_CYCLE_TYPE` smallint(6) DEFAULT NULL,
  `CUSTOMIZE_DAY` smallint(6) DEFAULT NULL,
  `PREPAID_AMOUNT` double DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_FEE_RULE_HISTORY`
--

DROP TABLE IF EXISTS `TBL_FEE_RULE_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_FEE_RULE_HISTORY` (
  `ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `USER_NO` varchar(50) DEFAULT NULL,
  `USER_NAME` varchar(50) DEFAULT NULL,
  `USER_TYPE` smallint(6) DEFAULT NULL,
  `CAL_FEE_ITEM` smallint(6) DEFAULT NULL,
  `PAY_PRODUCT` varchar(50) DEFAULT NULL,
  `FRP_CODE` varchar(50) DEFAULT NULL,
  `EFFECTIVE_START` datetime DEFAULT NULL,
  `EFFECTIVE_END` datetime DEFAULT NULL,
  `CREATE_RULE` datetime DEFAULT NULL,
  `FEE_RULE` varchar(3070) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_FEE_USER_FEE_SETTING`
--

DROP TABLE IF EXISTS `TBL_FEE_USER_FEE_SETTING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_FEE_USER_FEE_SETTING` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` bigint(20) NOT NULL COMMENT 'VERSION',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `USERNO` varchar(15) NOT NULL COMMENT '用户编号',
  `USERNAME` varchar(150) NOT NULL COMMENT '用户名称',
  `USERTYPE` smallint(6) NOT NULL COMMENT '用户类型(参考accountTypeEnum)',
  `CALCULATE_FEE_ITEM` smallint(6) NOT NULL COMMENT '收付项（参考（CalculateFeeItemEnum）',
  `FEE_NODE_ID` bigint(20) NOT NULL COMMENT '费率节点ID',
  `STATUS` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_Key_2` (`USERNO`,`FEE_NODE_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_LIMIT_AMOUNT_CUMULATE`
--

DROP TABLE IF EXISTS `TBL_LIMIT_AMOUNT_CUMULATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_LIMIT_AMOUNT_CUMULATE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) DEFAULT NULL,
  `AMOUNT_LIMIT_ID` bigint(20) DEFAULT NULL COMMENT '交易金额限制规则ID',
  `MERCHANT_NO` varchar(20) DEFAULT NULL COMMENT '商户号',
  `CUMULATE_AMOUNT` decimal(18,6) DEFAULT NULL COMMENT '累计金额',
  `BEGIN_TIME` datetime DEFAULT NULL COMMENT '开始时间',
  `END_TIME` datetime DEFAULT NULL COMMENT '结束时间',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `LAST_MODIFY_TIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_LIMIT_AMOUNT_LIMIT`
--

DROP TABLE IF EXISTS `TBL_LIMIT_AMOUNT_LIMIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_LIMIT_AMOUNT_LIMIT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) DEFAULT NULL,
  `AMOUNT_LIMIT_PACK_ID` bigint(20) DEFAULT NULL COMMENT '金额限制实体ID',
  `BIZ_FUNCTION` varchar(800) DEFAULT NULL COMMENT '业务功能',
  `PAY_PRODUCT` varchar(50) DEFAULT NULL COMMENT '支付产品',
  `PAY_WAY` varchar(50) DEFAULT NULL COMMENT '支付方式',
  `CARD_TYPE` varchar(50) DEFAULT NULL COMMENT '支付卡种',
  `LIMIT_TYPE` varchar(20) DEFAULT NULL COMMENT '限制类型',
  `MIN_AMOUNT` decimal(18,6) DEFAULT NULL COMMENT '最小金额',
  `MAX_AMOUNT` decimal(18,6) DEFAULT NULL COMMENT '最大金额',
  `EXPRESSION` varchar(800) DEFAULT NULL COMMENT '自定义限制表达式',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `LAST_MODIFY_TIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_LIMIT_AMOUNT_LIMIT_PACK`
--

DROP TABLE IF EXISTS `TBL_LIMIT_AMOUNT_LIMIT_PACK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_LIMIT_AMOUNT_LIMIT_PACK` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) DEFAULT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `DESCRIPTION` varchar(100) DEFAULT NULL COMMENT '描述',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `LAST_MODIFY_TIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_LIMIT_BIZ_FUNCTION_PARAM_CONFIG`
--

DROP TABLE IF EXISTS `TBL_LIMIT_BIZ_FUNCTION_PARAM_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_LIMIT_BIZ_FUNCTION_PARAM_CONFIG` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) DEFAULT NULL,
  `MERCHANT_NO` varchar(20) DEFAULT NULL COMMENT '商户编号',
  `BIZ_FUNCTION` varchar(800) DEFAULT NULL COMMENT '业务功能',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `LAST_MODIFY_TIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  `PARAM_NAME` varchar(20) DEFAULT NULL COMMENT '参数名',
  `PARAM_VALUE` varchar(20) DEFAULT NULL COMMENT '参数值',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_LIMIT_BIZ_FUNCTION_SWITCH`
--

DROP TABLE IF EXISTS `TBL_LIMIT_BIZ_FUNCTION_SWITCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_LIMIT_BIZ_FUNCTION_SWITCH` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) DEFAULT NULL,
  `SWITCH_LIMIT_PACK_ID` bigint(20) DEFAULT NULL COMMENT '开关限制包Id',
  `BIZ_FUNCTION` varchar(800) DEFAULT NULL COMMENT '业务功能',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `LAST_MODIFY_TIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  `STATUS` varchar(20) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_LIMIT_MERCHANT_CUSTOM_PAY_INTERFACE`
--

DROP TABLE IF EXISTS `TBL_LIMIT_MERCHANT_CUSTOM_PAY_INTERFACE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_LIMIT_MERCHANT_CUSTOM_PAY_INTERFACE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) DEFAULT NULL,
  `MERCHANT_NO` varchar(20) DEFAULT NULL COMMENT '商户编号',
  `PAY_WAY` varchar(100) DEFAULT NULL COMMENT '支付方式编码',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `LAST_MODIFY_TIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  `PAY_INTERFACE` varchar(100) DEFAULT NULL COMMENT '支付接口编码',
  `STATUS` varchar(20) DEFAULT NULL COMMENT '商户定制接口状态',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_LIMIT_PAY_PRODUCT_SWITCH`
--

DROP TABLE IF EXISTS `TBL_LIMIT_PAY_PRODUCT_SWITCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_LIMIT_PAY_PRODUCT_SWITCH` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) DEFAULT NULL,
  `SWITCH_LIMIT_PACK_ID` bigint(20) DEFAULT NULL COMMENT '开发限制包ID',
  `BIZ_FUNCTION` varchar(800) DEFAULT NULL COMMENT '业务功能',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `LAST_MODIFY_TIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  `PAY_PRODUCT` varchar(20) DEFAULT NULL COMMENT '支付产品',
  `STATUS` varchar(20) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_LIMIT_PAY_WAY_SWITCH`
--

DROP TABLE IF EXISTS `TBL_LIMIT_PAY_WAY_SWITCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_LIMIT_PAY_WAY_SWITCH` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) DEFAULT NULL,
  `SWITCH_LIMIT_PACK_ID` bigint(20) DEFAULT NULL COMMENT '开发限制包ID',
  `BIZ_FUNCTION` varchar(800) DEFAULT NULL COMMENT '业务功能',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `LAST_MODIFY_TIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  `PAY_PRODUCT` varchar(20) DEFAULT NULL COMMENT '支付产品',
  `STATUS` varchar(20) DEFAULT NULL COMMENT '状态',
  `PAY_WAY` varchar(20) DEFAULT NULL COMMENT '支付方式',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_LIMIT_SWITCH_LIMIT_PACK`
--

DROP TABLE IF EXISTS `TBL_LIMIT_SWITCH_LIMIT_PACK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_LIMIT_SWITCH_LIMIT_PACK` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) DEFAULT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `DESCRIPTION` varchar(100) DEFAULT NULL COMMENT '描述',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `LAST_MODIFY_TIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_LIMIT_SYSTEM_BACKUP_PAY_INTERFACE`
--

DROP TABLE IF EXISTS `TBL_LIMIT_SYSTEM_BACKUP_PAY_INTERFACE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_LIMIT_SYSTEM_BACKUP_PAY_INTERFACE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) DEFAULT NULL,
  `OLD_PAY_INTERFACE` varchar(500) DEFAULT NULL,
  `NEW_PAY_INTERFACE` varchar(500) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `LAST_MODIFY_TIME` datetime DEFAULT NULL,
  `STATUS` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_LIMIT_TRADE_LIMIT_ROUTER`
--

DROP TABLE IF EXISTS `TBL_LIMIT_TRADE_LIMIT_ROUTER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_LIMIT_TRADE_LIMIT_ROUTER` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) DEFAULT NULL,
  `MERCHANT_NO` varchar(20) DEFAULT NULL COMMENT '商户编号',
  `SWITCH_LIMIT_PACK_ID` bigint(20) DEFAULT NULL COMMENT '商户关联的开关限制包Id',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `LAST_MODIFY_TIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  `AMOUNT_LIMIT_PACK_ID` bigint(20) DEFAULT NULL COMMENT '商户关联的额度限制包Id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_PORTAL_CA`
--

DROP TABLE IF EXISTS `TBL_PORTAL_CA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_PORTAL_CA` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL COMMENT 'VERSION',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `USERID` bigint(20) NOT NULL COMMENT '用户ID',
  `USERTYPE` smallint(6) NOT NULL COMMENT '用户类型',
  `ADDRID` smallint(6) NOT NULL COMMENT '使用地点ID',
  `DN` varchar(100) NOT NULL COMMENT 'DN信息',
  `SN` varchar(32) NOT NULL COMMENT 'SN信息',
  `STATUS` smallint(6) NOT NULL COMMENT '状态',
  `UPDATETIME` datetime DEFAULT NULL COMMENT '修改时间',
  `USERNO` varchar(15) DEFAULT NULL COMMENT '用户编号',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`SN`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门户CA证书信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_PORTAL_MERCHANT_ACTION`
--

DROP TABLE IF EXISTS `TBL_PORTAL_MERCHANT_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_PORTAL_MERCHANT_ACTION` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `ACTIONNAME` varchar(90) NOT NULL,
  `ACTION` varchar(100) NOT NULL,
  `REMARK` varchar(60) NOT NULL,
  `CREATETIME` datetime NOT NULL,
  `MERCHANTBUSTYPE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`ACTION`) USING BTREE,
  UNIQUE KEY `AK_KEY_3` (`ACTIONNAME`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_PORTAL_MERCHANT_ROLE`
--

DROP TABLE IF EXISTS `TBL_PORTAL_MERCHANT_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_PORTAL_MERCHANT_ROLE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `CREATETIME` datetime NOT NULL,
  `ROLENAME` varchar(90) NOT NULL,
  `REMARK` varchar(90) NOT NULL,
  `USERNO` varchar(15) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`ROLENAME`,`USERNO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_PORTAL_MERCHANT_ROLE_ACTION`
--

DROP TABLE IF EXISTS `TBL_PORTAL_MERCHANT_ROLE_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_PORTAL_MERCHANT_ROLE_ACTION` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `ROLEID` bigint(20) NOT NULL,
  `ACTIONID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`ROLEID`,`ACTIONID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=624 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_PORTAL_MERCHANT_ROLE_OPERATOR`
--

DROP TABLE IF EXISTS `TBL_PORTAL_MERCHANT_ROLE_OPERATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_PORTAL_MERCHANT_ROLE_OPERATOR` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` int(11) NOT NULL,
  `ROLEID` bigint(20) NOT NULL,
  `OPERATORID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`ROLEID`,`OPERATORID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_PORTAL_USER_OPERATOR`
--

DROP TABLE IF EXISTS `TBL_PORTAL_USER_OPERATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_PORTAL_USER_OPERATOR` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` int(11) NOT NULL COMMENT 'VERSION',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `USERNO` varchar(15) NOT NULL COMMENT '用户编号',
  `LOGINNAME` varchar(50) NOT NULL COMMENT '登录名',
  `LOGINPWD` varchar(50) NOT NULL COMMENT '登录密码',
  `REALNAME` varchar(90) NOT NULL COMMENT '姓名',
  `MOBILENO` varchar(12) NOT NULL COMMENT '手机号',
  `STATUS` varchar(10) NOT NULL COMMENT '状态',
  `TYPE` varchar(10) NOT NULL COMMENT '操作员类型',
  `ISCHANGEDPWD` smallint(6) NOT NULL COMMENT '是否更改过密码(0:否,1:是)',
  `PWDERRORTIMES` smallint(6) NOT NULL COMMENT '登录密码错误次数',
  `LASTLOGINTIME` datetime DEFAULT NULL COMMENT '最后登录时间',
  `PWDERRORLASTTIME` datetime DEFAULT NULL COMMENT '最后一次登录密码错误时间',
  `LASTALERTPWDTIME` datetime DEFAULT NULL COMMENT '最后一次修改时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`LOGINNAME`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=352 DEFAULT CHARSET=utf8 COMMENT='用户操作员(会员与商户共用此操作员表)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_PORTAL_USER_OPERATOR_LOG`
--

DROP TABLE IF EXISTS `TBL_PORTAL_USER_OPERATOR_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_PORTAL_USER_OPERATOR_LOG` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `USERNO` varchar(15) NOT NULL COMMENT '用户编号',
  `LOGINNAME` varchar(50) NOT NULL COMMENT '登录名',
  `OPERATESTATUS` smallint(6) NOT NULL COMMENT '操作状态(操作成功1，操作失败0)',
  `IP` varchar(100) DEFAULT NULL COMMENT 'IP地址',
  `CONTENT` varchar(900) DEFAULT NULL COMMENT '操作内容',
  `OPERTYPE` smallint(6) DEFAULT NULL COMMENT '1-增加，2-修改，3-删除，4-查询',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2528 DEFAULT CHARSET=utf8 COMMENT='用户操作员操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_REMIT_BANK_AREA`
--

DROP TABLE IF EXISTS `TBL_REMIT_BANK_AREA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_REMIT_BANK_AREA` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL COMMENT '版本号',
  `AREA_CODE` varchar(4) DEFAULT NULL COMMENT '银行地区代码',
  `AREA_NAME` varchar(200) DEFAULT NULL COMMENT '银行地区名称',
  `LEVEL` smallint(6) DEFAULT NULL COMMENT '级别：1-省级，2-市级，3-县级，4-县级市，5-地级',
  `CITY` varchar(100) DEFAULT NULL COMMENT '所在城市',
  `PROVINCE` varchar(100) DEFAULT NULL COMMENT '所在省',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2319 DEFAULT CHARSET=utf8 COMMENT='银行地区信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_REMIT_BANK_INFO`
--

DROP TABLE IF EXISTS `TBL_REMIT_BANK_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_REMIT_BANK_INFO` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL COMMENT '版本号',
  `BANK_CHANNEL_NO` varchar(12) DEFAULT NULL COMMENT '银行行号',
  `BANK_NAME` varchar(256) DEFAULT NULL COMMENT '银行名称',
  `PROVINCE` varchar(50) DEFAULT NULL COMMENT '省份',
  `CITY` varchar(50) DEFAULT NULL COMMENT '城市',
  `BANK_TYPE` smallint(6) DEFAULT NULL COMMENT '类别：1-清算行，2-开户行',
  `CLEAR_BANK_CHANNEL_NO` varchar(12) DEFAULT NULL COMMENT '清算行行号',
  `IS_IN_PROVINCE` smallint(6) DEFAULT NULL COMMENT '是否省内：100-是，101-否',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=128366 DEFAULT CHARSET=utf8 COMMENT='银行信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_REMIT_BANK_TYPE`
--

DROP TABLE IF EXISTS `TBL_REMIT_BANK_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_REMIT_BANK_TYPE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL COMMENT '版本号',
  `TYPE_CODE` varchar(3) DEFAULT NULL COMMENT '银行行别代码',
  `TYPE_NAME` varchar(200) DEFAULT NULL COMMENT '银行行别名称',
  `CATEGORY` smallint(6) DEFAULT NULL COMMENT '类别：1-中央银行，2-国有独资商业银行，3-政策性银行，4-其他商业银行，5-非银行金融机构，6-外资在华银行或代表处，7-特区参与者',
  `BANK_CODE` varchar(20) DEFAULT NULL COMMENT '银行编号：例如：PINGANBANK',
  `STATUS` smallint(6) DEFAULT NULL COMMENT '状态：100-有效，101-无效',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_REMIT_BATCH`
--

DROP TABLE IF EXISTS `TBL_REMIT_BATCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_REMIT_BATCH` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL,
  `BATCH_NO` varchar(16) NOT NULL COMMENT '打款批次号',
  `STATUS` smallint(6) DEFAULT NULL COMMENT '1-待处理，2-处理中，3-处理完成',
  `TOTAL_NUM` smallint(6) DEFAULT NULL COMMENT '总笔数',
  `TOTAL_AMOUNT` decimal(18,2) DEFAULT NULL COMMENT '总金额',
  `ACCEPT_SUC_NUM` smallint(6) DEFAULT NULL COMMENT '受理成功笔数',
  `ACCEPT_SUC_AMOUNT` decimal(18,2) DEFAULT NULL COMMENT '受理成功金额',
  `ACCEPT_FAIL_NUM` smallint(6) DEFAULT NULL COMMENT '受理失败笔数',
  `ACCEPT_FAIL_AMOUNT` decimal(18,2) DEFAULT NULL COMMENT '受理失败金额',
  `PROCESS_SUC_NUM` smallint(6) DEFAULT NULL COMMENT '处理成功笔数',
  `PROCESS_SUC_AMOUNT` decimal(18,2) DEFAULT NULL COMMENT '处理成功金额',
  `PROCESS_FAIL_NUM` smallint(6) DEFAULT NULL COMMENT '处理失败笔数',
  `PROCESS_FAIL_AMOUNT` decimal(18,2) DEFAULT NULL COMMENT '处理失败金额',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `ACCEPT_DATE` datetime DEFAULT NULL COMMENT '受理时间',
  `PROCESS_DATE` datetime DEFAULT NULL COMMENT '处理时间',
  `CONFIRM` varchar(50) DEFAULT NULL,
  `CONFIRM_DATE` datetime DEFAULT NULL,
  `REMIT_CHANNEL_CODE` varchar(50) DEFAULT NULL COMMENT '打款通道编号',
  `IS_AUTO_REMIT` smallint(6) DEFAULT NULL COMMENT '是否支持自动打款:100-是，101-否',
  `REMIT_BANK_ACCOUNT_NO` varchar(30) DEFAULT NULL COMMENT '付款银行账户',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_Key_2` (`BATCH_NO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=489 DEFAULT CHARSET=utf8 COMMENT='打款处理批次';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_REMIT_CHANNEL`
--

DROP TABLE IF EXISTS `TBL_REMIT_CHANNEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_REMIT_CHANNEL` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL COMMENT '版本号',
  `CHANNEL_CODE` varchar(20) DEFAULT NULL COMMENT '打款通道编号',
  `CHANNEL_NAME` varchar(256) DEFAULT NULL COMMENT '打款通道名称',
  `ACCOUNT_TYPE` smallint(6) DEFAULT NULL COMMENT '账户类型：1-对公，2-对私',
  `BANK_TYPE_CODE` varchar(3) DEFAULT NULL COMMENT '所属银行行别',
  `LIMIT_NUM` bigint(20) DEFAULT NULL COMMENT '总笔数限制',
  `MIN_AMOUNT` decimal(18,2) DEFAULT NULL COMMENT '最小额',
  `MAX_AMOUNT` decimal(18,2) DEFAULT NULL COMMENT '最大额',
  `BATCH_MIN_AMOUNT` decimal(18,2) DEFAULT NULL COMMENT '单个批次最小额',
  `BATCH_MAX_AMOUNT` decimal(18,2) DEFAULT NULL COMMENT '单个批次最大额',
  `IS_URGENT` smallint(6) DEFAULT NULL COMMENT '是否支持加急：100-是，101-否',
  `IS_CONFIRM` smallint(6) DEFAULT NULL COMMENT '是否支持打款确认：100-是，101-否',
  `IS_AUTO_REMIT` smallint(6) DEFAULT NULL COMMENT '是否支持自动打款：100-是，101-否',
  `STATUS` smallint(6) DEFAULT NULL COMMENT '状态：100-开启，101-关闭',
  `SRC_BANK_CHANNEL_NO` varchar(12) DEFAULT NULL COMMENT '付款账号开户行行号',
  `SRC_BANK_NAME` varchar(500) DEFAULT NULL COMMENT '付款账号开户行名称',
  `SRC_ACCOUNT_NUM` varchar(30) DEFAULT NULL COMMENT '付款帐号',
  `SRC_ACCOUNT_NAME` varchar(300) DEFAULT NULL COMMENT '付款帐号户名',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='打款通道';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_REMIT_CHANNEL_FLOW_RULE`
--

DROP TABLE IF EXISTS `TBL_REMIT_CHANNEL_FLOW_RULE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_REMIT_CHANNEL_FLOW_RULE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL COMMENT '版本号',
  `CHANNEL_FLOW_NAME` varchar(150) DEFAULT NULL COMMENT '分流规则名称',
  `CHANNEL_CODE` varchar(20) DEFAULT NULL COMMENT '打款通道编号',
  `ACCOUNT_TYPE` varchar(20) DEFAULT NULL COMMENT '账户类型：1-对公，2-对私',
  `TRADE_TYPE` varchar(20) DEFAULT NULL COMMENT '业务类型：1-会员提现，2-商户结算',
  `INCLUDE_BANK_CODE` varchar(200) DEFAULT NULL COMMENT '包含的收款银行编号',
  `EXCLUDE_BANK_CODE` varchar(200) DEFAULT NULL COMMENT '排除的收款银行编号',
  `MIN_AMOUNT` decimal(18,2) DEFAULT NULL COMMENT '最小额',
  `MAX_AMOUNT` decimal(18,2) DEFAULT NULL COMMENT '最大额',
  `IS_URGENT` smallint(6) DEFAULT NULL COMMENT '是否加急：100-是，101-否',
  `STATUS` smallint(6) DEFAULT NULL COMMENT '状态：100-有效，101-失效',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='打款通道分流规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_REMIT_ERROR`
--

DROP TABLE IF EXISTS `TBL_REMIT_ERROR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_REMIT_ERROR` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL,
  `TYPE` smallint(6) DEFAULT NULL COMMENT ' 1-长款(多交易) 2-短款(少交易)',
  `REQUEST_NO` varchar(50) DEFAULT NULL COMMENT '打款请求号',
  `BANK_ORDER_NO` varchar(50) DEFAULT NULL COMMENT '银行订单号',
  `ACCOUNT_NAME` varchar(100) DEFAULT NULL COMMENT '收款户名',
  `ACCOUNT_NO` varchar(32) DEFAULT NULL COMMENT '收款帐户',
  `BANK_CHANNEL_NO` varchar(12) DEFAULT NULL COMMENT '开户行行号',
  `BANK_NAME` varchar(255) DEFAULT NULL COMMENT '开户行名称',
  `STATUS` smallint(6) DEFAULT NULL COMMENT '101-待处理,100-已处理',
  `AMOUNT` decimal(18,2) DEFAULT NULL COMMENT '收款金额',
  `USER_NO` varchar(15) DEFAULT NULL COMMENT '用户编号(预留)',
  `CREATOR` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `BANK_REMARK` varchar(256) DEFAULT NULL COMMENT '银行备注信息',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='打款差错记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_REMIT_PROCESS`
--

DROP TABLE IF EXISTS `TBL_REMIT_PROCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_REMIT_PROCESS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL COMMENT '版本号',
  `REQUEST_NO` varchar(50) DEFAULT NULL COMMENT '打款请求号',
  `FLOW_NO` varchar(50) DEFAULT NULL COMMENT '打款流水号',
  `CHANNEL_CODE` varchar(20) DEFAULT NULL COMMENT '打款通道编号',
  `BATCH_NO` varchar(16) DEFAULT NULL COMMENT '打款批次号',
  `TRADE_INITIATOR` smallint(6) DEFAULT NULL COMMENT '业务发起方',
  `ACCOUNT_TYPE` smallint(6) DEFAULT NULL COMMENT '帐户类型  1-对公，2-对私',
  `ACCOUNT_NAME` varchar(100) DEFAULT NULL COMMENT '开户名',
  `ACCOUNT_NO` varchar(32) DEFAULT NULL COMMENT '收款帐户编号',
  `BANK_CHANNEL_NO` varchar(12) DEFAULT NULL COMMENT '银行行号',
  `BANK_NAME` varchar(255) DEFAULT NULL COMMENT '开户银行名称',
  `PROVINCE` varchar(32) DEFAULT NULL COMMENT '省份',
  `CITY` varchar(32) DEFAULT NULL COMMENT '城市',
  `CURRENCY` varchar(3) DEFAULT NULL COMMENT '币种',
  `CLEAR_BANK_NAME` varchar(50) DEFAULT NULL COMMENT '清算行名称',
  `CLEAR_BANK_CHANNEL_NO` varchar(12) DEFAULT NULL COMMENT '清算行行号',
  `STATUS` smallint(6) DEFAULT NULL COMMENT '状态：1-待审核,2-处理中,3-打款成功,4-打款失败,5-已撤销,6-已重出,7-审核不通过,8-平台原因造成的打款失败,9-银行打款中,10-网银打款待处理',
  `IS_AUTO_PROCESS` smallint(6) DEFAULT NULL COMMENT '是否自动处理：100-是，101-否',
  `IS_URGENT` smallint(6) DEFAULT NULL COMMENT '是否加急：100-是，101-否',
  `AMOUNT` decimal(18,2) DEFAULT NULL COMMENT '金额',
  `ORDER_ID` varchar(32) DEFAULT NULL COMMENT '银行订单',
  `CAL_COST` decimal(18,6) DEFAULT NULL COMMENT '计费成本',
  `IS_RECONCILED` smallint(6) DEFAULT NULL COMMENT '是否已对账：100-是，101-否',
  `USER_NO` varchar(15) DEFAULT NULL COMMENT '用户编号',
  `BUSINESS_TYPE` smallint(6) DEFAULT NULL COMMENT '业务类型',
  `CREATOR` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `CONFIRM` varchar(50) DEFAULT NULL COMMENT '审核人',
  `CONFIRM_DATE` datetime DEFAULT NULL COMMENT '审核时间',
  `PROCESS_DATE` datetime DEFAULT NULL COMMENT '打款处理时间',
  `REASON` varchar(256) DEFAULT NULL COMMENT '退回原因',
  `BANK_REMARK` varchar(256) DEFAULT NULL COMMENT '银行备注信息',
  `EXPORT_BATCH_NO` varchar(16) DEFAULT NULL COMMENT '导出批次号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1865 DEFAULT CHARSET=utf8 COMMENT='打款处理记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_REMIT_REQUEST`
--

DROP TABLE IF EXISTS `TBL_REMIT_REQUEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_REMIT_REQUEST` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL COMMENT '版本号',
  `REQUEST_NO` varchar(50) NOT NULL COMMENT '打款请求号',
  `FLOW_NO` varchar(50) DEFAULT NULL COMMENT '打款流水号',
  `TRADE_INITIATOR` smallint(6) DEFAULT NULL COMMENT '业务发起方：1-会员提现，2-商户结算',
  `ACCOUNT_TYPE` smallint(6) DEFAULT NULL COMMENT '帐户类型：1-对公，2-对私',
  `IS_URGENT` smallint(6) DEFAULT NULL COMMENT '是否加急：100-是，101-否',
  `ACCOUNT_NAME` varchar(100) DEFAULT NULL COMMENT '开户名',
  `ACCOUNT_NO` varchar(32) DEFAULT NULL COMMENT '收款帐户编号',
  `BANK_CHANNEL_NO` varchar(12) DEFAULT NULL COMMENT '银行行号',
  `BANK_NAME` varchar(255) DEFAULT NULL COMMENT '开户银行名称',
  `PROVINCE` varchar(50) DEFAULT NULL COMMENT '省份',
  `CITY` varchar(50) DEFAULT NULL COMMENT '城市',
  `CURRENCY` varchar(3) DEFAULT NULL COMMENT '币种',
  `NOTIFY_ADDRESS` varchar(64) DEFAULT NULL COMMENT '结果通知地址',
  `STATUS` smallint(6) DEFAULT NULL COMMENT '状态：1-待审核,2-已审核,3-打款中,4-打款成功,5-打款失败,6-已撤销，7-审核未通过，8-已重新制单，9-银行打款中，10-网银打款待处理',
  `AMOUNT` decimal(18,2) DEFAULT NULL COMMENT '请求金额',
  `IS_AUTO_PROCESS` smallint(6) DEFAULT NULL COMMENT '是否自动处理：100-是，101-否',
  `USER_NO` varchar(15) DEFAULT NULL COMMENT '用户编号',
  `BUSINESS_TYPE` smallint(6) DEFAULT NULL COMMENT '业务类型',
  `ORIAL_ID` bigint(20) DEFAULT NULL COMMENT '原制单ID',
  `COPIED` smallint(6) DEFAULT NULL COMMENT '是否已重新制单：100-是，101-否',
  `CREATOR` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `CONFIRM` varchar(50) DEFAULT NULL COMMENT '审核人',
  `CONFIRM_DATE` datetime DEFAULT NULL COMMENT '审核时间',
  `CANCEL_REASON` varchar(256) DEFAULT NULL COMMENT '撤销原因',
  `BANK_REMARK` varchar(256) DEFAULT NULL COMMENT '银行备注信息',
  `BATCH_NO` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_Key_2` (`REQUEST_NO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=841 DEFAULT CHARSET=utf8 COMMENT='打款请求记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_REPORT_DAY`
--

DROP TABLE IF EXISTS `TBL_REPORT_DAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_REPORT_DAY` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) NOT NULL,
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `REPORT_TYPE` smallint(6) NOT NULL,
  `STAT_DATE` varchar(10) NOT NULL,
  `TRX_DATE` varchar(10) NOT NULL,
  `VAR_1` varchar(100) DEFAULT NULL,
  `VAR_2` varchar(100) DEFAULT NULL,
  `VAR_3` varchar(100) DEFAULT NULL,
  `VAR_4` varchar(100) DEFAULT NULL,
  `VAR_5` varchar(100) DEFAULT NULL,
  `DEC_16` decimal(20,10) DEFAULT NULL,
  `VAR_6` varchar(100) DEFAULT NULL,
  `VAR_7` varchar(100) DEFAULT NULL,
  `VAR_8` varchar(100) DEFAULT NULL,
  `VAR_9` varchar(100) DEFAULT NULL,
  `VAR_10` varchar(100) DEFAULT NULL,
  `VAR_11` varchar(100) DEFAULT NULL,
  `VAR_12` varchar(100) DEFAULT NULL,
  `VAR_13` varchar(100) DEFAULT NULL,
  `VAR_14` varchar(100) DEFAULT NULL,
  `VAR_15` varchar(100) DEFAULT NULL,
  `INT_1` int(11) DEFAULT NULL,
  `INT_2` int(11) DEFAULT NULL,
  `INT_3` int(11) DEFAULT NULL,
  `INT_4` int(11) DEFAULT NULL,
  `INT_5` int(11) DEFAULT NULL,
  `INT_6` int(11) DEFAULT NULL,
  `INT_7` int(11) DEFAULT NULL,
  `INT_8` int(11) DEFAULT NULL,
  `INT_9` int(11) DEFAULT NULL,
  `DEC_1` decimal(20,2) DEFAULT NULL,
  `DEC_2` decimal(20,2) DEFAULT NULL,
  `DEC_3` decimal(20,2) DEFAULT NULL,
  `DEC_4` decimal(20,2) DEFAULT NULL,
  `DEC_5` decimal(20,2) DEFAULT NULL,
  `DEC_6` decimal(20,2) DEFAULT NULL,
  `DEC_7` decimal(20,2) DEFAULT NULL,
  `DEC_8` decimal(20,2) DEFAULT NULL,
  `DEC_9` decimal(20,2) DEFAULT NULL,
  `DEC_10` decimal(20,2) DEFAULT NULL,
  `DEC_11` decimal(20,10) DEFAULT NULL,
  `DEC_12` decimal(20,10) DEFAULT NULL,
  `DEC_13` decimal(20,10) DEFAULT NULL,
  `DEC_14` decimal(20,10) DEFAULT NULL,
  `DEC_15` decimal(20,10) DEFAULT NULL,
  `DEC_17` decimal(20,10) DEFAULT NULL,
  `DEC_18` decimal(20,10) DEFAULT NULL,
  `DEC_19` decimal(20,10) unsigned zerofill DEFAULT NULL,
  `DEC_20` decimal(20,10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5771 DEFAULT CHARSET=utf8 COMMENT='日汇总报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_RULE_BANK_BRANCH`
--

DROP TABLE IF EXISTS `TBL_RULE_BANK_BRANCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_RULE_BANK_BRANCH` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL COMMENT '版本号',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_TIME` datetime NOT NULL COMMENT '最后修改时间',
  `FRP_CODE` varchar(20) NOT NULL COMMENT '支付渠道编号',
  `DEFAULT_BANK_CHANNEL_CODE` varchar(30) NOT NULL COMMENT '默认银行渠道',
  `SPARE_BANK_CHANNEL_CODE` varchar(30) NOT NULL COMMENT '备用银行渠道',
  `REMARK` varchar(300) NOT NULL COMMENT '描述',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `FRP_CODE` (`FRP_CODE`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='银行分流表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_RULE_FRP`
--

DROP TABLE IF EXISTS `TBL_RULE_FRP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_RULE_FRP` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) NOT NULL COMMENT '版本号',
  `FRP_CODE` varchar(40) NOT NULL COMMENT '支付渠道编号',
  `BANK_NAME` varchar(30) NOT NULL COMMENT '银行名称',
  `BANK_CODE` varchar(20) NOT NULL COMMENT '见字典说明',
  `STATUS` smallint(6) NOT NULL COMMENT '100:激活 101:冻结',
  `BUS_TYPE` varchar(20) DEFAULT NULL COMMENT '业务类型',
  `PAY_TYPE` smallint(6) DEFAULT NULL COMMENT '付款类型',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`FRP_CODE`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='支付渠道表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_RULE_PAY_PRODUCT`
--

DROP TABLE IF EXISTS `TBL_RULE_PAY_PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_RULE_PAY_PRODUCT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` int(11) NOT NULL DEFAULT '0' COMMENT 'VERSION',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `PAY_PRODUCT_CODE` varchar(50) NOT NULL COMMENT '支付产品编号',
  `PAY_PRODUCT_NAME` varchar(200) NOT NULL COMMENT '支付产品名称',
  `STATUS` smallint(6) NOT NULL DEFAULT '100' COMMENT '状态(100 正常,102非正常)',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_Key_2` (`PAY_PRODUCT_CODE`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='支付产品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_RULE_PAY_PRODUCT_SWITCH`
--

DROP TABLE IF EXISTS `TBL_RULE_PAY_PRODUCT_SWITCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_RULE_PAY_PRODUCT_SWITCH` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` int(11) NOT NULL DEFAULT '0' COMMENT 'VERSION',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `PAY_PRODUCT_CODE` varchar(50) NOT NULL COMMENT '支付产品编号',
  `PAY_RULE_ID` bigint(20) NOT NULL COMMENT '支付规则ID',
  `STATUS` smallint(6) NOT NULL DEFAULT '101' COMMENT '开关状态(100 开;101关,默认101)',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_key_2` (`PAY_PRODUCT_CODE`,`PAY_RULE_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='支付产品开关';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_RULE_PAY_RULE`
--

DROP TABLE IF EXISTS `TBL_RULE_PAY_RULE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_RULE_PAY_RULE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` int(11) NOT NULL COMMENT 'VERSION',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `RULE_NAME` varchar(100) NOT NULL COMMENT '规则名称',
  `RULE_TYPE` smallint(6) NOT NULL DEFAULT '100' COMMENT '规则类型(100:系统,101:为商户定制,默认100)',
  `DESCRIPTION` varchar(300) DEFAULT NULL COMMENT '规则描述',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_Key_2` (`RULE_NAME`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='支付规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_RULE_PAY_WAY`
--

DROP TABLE IF EXISTS `TBL_RULE_PAY_WAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_RULE_PAY_WAY` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` int(11) NOT NULL DEFAULT '0' COMMENT 'VERSION',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `PAY_WAY_CODE` varchar(50) NOT NULL COMMENT '支付方式编号',
  `PAY_WAY_NAME` varchar(100) NOT NULL COMMENT '支付方式名称',
  `PAY_PRODUCT_CODE` varchar(50) NOT NULL COMMENT '支付产品编号',
  `DEFAULT_PAY_INTERFACE` varchar(100) NOT NULL COMMENT '默认支付接口',
  `STATUS` smallint(6) NOT NULL COMMENT '状态(100:正常状态,101非正常状态)',
  `SORTS` int(11) NOT NULL DEFAULT '1000' COMMENT '排序(倒序排序,默认值1000)',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_Key_2` (`PAY_WAY_CODE`,`PAY_PRODUCT_CODE`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COMMENT='支付方式';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_RULE_PAY_WAY_PAUSE_NOTICE`
--

DROP TABLE IF EXISTS `TBL_RULE_PAY_WAY_PAUSE_NOTICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_RULE_PAY_WAY_PAUSE_NOTICE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` int(11) NOT NULL DEFAULT '0' COMMENT 'VERSION',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `PAY_WAY_CODE` varchar(50) NOT NULL COMMENT '支付方式编码',
  `PAUSE_NOTICE_MSG` varchar(900) NOT NULL COMMENT '暂停服务信息',
  `PAUSE_SCOPE` smallint(6) NOT NULL COMMENT '暂停服务范围(100:全部,101:部分)',
  `IS_ENABLE` smallint(6) NOT NULL COMMENT '是否有效(100:有效,101:无效)',
  `PAUSE_START_TIME` datetime DEFAULT NULL COMMENT '暂停服务起始时',
  `PAUSE_END_TIME` datetime DEFAULT NULL COMMENT '暂停服务截止时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付方式暂停公告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_RULE_PAY_WAY_SWITCH`
--

DROP TABLE IF EXISTS `TBL_RULE_PAY_WAY_SWITCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_RULE_PAY_WAY_SWITCH` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` int(11) NOT NULL DEFAULT '0' COMMENT 'VERSION',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `PAY_WAY_CODE` varchar(50) NOT NULL COMMENT '支付方式编号',
  `PAY_PRODUCT_CODE` varchar(50) NOT NULL COMMENT '支付产品编号',
  `PAY_RULE_ID` bigint(20) NOT NULL COMMENT '支付规则ID',
  `STATUS` smallint(6) NOT NULL DEFAULT '100' COMMENT '开关状态(100 开;101关,默认100)',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 COMMENT='支付方式开关';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_RULE_USER_PAY_RULE_SETTING`
--

DROP TABLE IF EXISTS `TBL_RULE_USER_PAY_RULE_SETTING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_RULE_USER_PAY_RULE_SETTING` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` int(11) NOT NULL DEFAULT '0' COMMENT 'VERSION',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `USER_NO` varchar(20) NOT NULL COMMENT '用户编号',
  `PAY_RULE_ID` bigint(20) NOT NULL COMMENT '支付规则ID',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_USER_NO` (`USER_NO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='用户支付规则关联表(一个用户只有一条规则)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_SETT_CONTROL`
--

DROP TABLE IF EXISTS `TBL_SETT_CONTROL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_SETT_CONTROL` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `SETT_MODE_TYPE` smallint(6) NOT NULL COMMENT '结算中发起作业类型(参考SettModeTypeEnum)',
  `BEGIN_TIME` time DEFAULT NULL COMMENT '开始时间',
  `END_TIME` time DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结算控制';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_SETT_DAILY_COLLECT`
--

DROP TABLE IF EXISTS `TBL_SETT_DAILY_COLLECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_SETT_DAILY_COLLECT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `ACCOUNT_NO` varchar(20) NOT NULL COMMENT '账户编号',
  `COLLECT_DATE` date NOT NULL COMMENT '汇总日期',
  `COLLECT_TYPE` smallint(6) NOT NULL COMMENT '汇总类型(参考枚举:SettDailyCollectTypeEnum)',
  `BATCH_NO` varchar(50) DEFAULT NULL COMMENT '结算批次号(结算之后再回写过来)',
  `TOTAL_AMOUNT` decimal(24,10) NOT NULL COMMENT '交易总金额',
  `TOTAL_COUNT` int(11) NOT NULL COMMENT '交易总笔数',
  `SETT_STATUS` smallint(6) NOT NULL COMMENT '结算状态(参考枚举:SettDailyCollectStatusEnum)',
  `REMARK` varchar(300) DEFAULT NULL COMMENT '备注',
  `RISK_DAY` smallint(6) DEFAULT NULL COMMENT '风险预存期',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1046 DEFAULT CHARSET=utf8 COMMENT='每日待结算汇总';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_SETT_DAY_ADJUST_SETTING`
--

DROP TABLE IF EXISTS `TBL_SETT_DAY_ADJUST_SETTING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_SETT_DAY_ADJUST_SETTING` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `OLD_DATE` date DEFAULT NULL COMMENT '原日期',
  `NEW_DATE` date DEFAULT NULL COMMENT '新日期',
  `REMARK` varchar(300) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='结算日调整设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_SETT_ERROR_RECORD`
--

DROP TABLE IF EXISTS `TBL_SETT_ERROR_RECORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_SETT_ERROR_RECORD` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `USER_NO` varchar(20) NOT NULL COMMENT '客户编号',
  `USER_NAME` varchar(200) DEFAULT NULL COMMENT '客户名称',
  `ACCOUNT_NO` varchar(20) DEFAULT NULL COMMENT '结算账户编号 ',
  `SETT_DATE` date DEFAULT NULL COMMENT '结算日',
  `SETT_MODE` smallint(6) DEFAULT NULL COMMENT '结算发起方式',
  `ERR_DESC` varchar(300) DEFAULT NULL COMMENT '结算失败原因',
  `STATUS` smallint(6) DEFAULT NULL COMMENT '结算失败处理状态(参考SettErrorRecordStatusEnum)',
  `BEGIN_DATE` date DEFAULT NULL COMMENT '结算开始日期',
  `END_DATE` date DEFAULT NULL COMMENT '结算结束日期',
  `OPERATOR_LOGIN_NAME` varchar(50) DEFAULT NULL COMMENT '操作员编号',
  `OPERATOR_REAL_NAME` varchar(200) DEFAULT NULL COMMENT '操作员名称',
  `REMARK` varchar(300) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8 COMMENT='结算失败记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_SETT_ERROR_RESEND_RECORD`
--

DROP TABLE IF EXISTS `TBL_SETT_ERROR_RESEND_RECORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_SETT_ERROR_RESEND_RECORD` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `BATCH_NO` varchar(50) NOT NULL COMMENT '结算批次号',
  `REMIT_NO` varchar(50) DEFAULT NULL COMMENT '打款请求号',
  `CURRENCY_TYPE` smallint(6) DEFAULT NULL COMMENT '结算账户币种(参考CurrencyTypeEnum)',
  `BANK_CODE` varchar(20) DEFAULT NULL COMMENT '银行编码',
  `BANK_ACCOUNT_NAME` varchar(60) DEFAULT NULL COMMENT '开户名',
  `BANK_ACCOUNT_NO` varchar(20) DEFAULT NULL COMMENT '开户账户',
  `BANK_ACCOUNT_TYPE` smallint(6) DEFAULT NULL COMMENT '银行卡类型(参考枚举:BankAccountTypeEnum)',
  `COUNTRY` varchar(200) DEFAULT NULL COMMENT '开户行所在国家',
  `PROVINCE` varchar(50) DEFAULT NULL COMMENT '开户行所在省份',
  `CITY` varchar(50) DEFAULT NULL COMMENT '开户行所在城市',
  `BANK_ACCOUNT_ADDRESS` varchar(300) DEFAULT NULL COMMENT '开户行地址',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '描述',
  `OPERATOR_LOGINNAME` varchar(50) DEFAULT NULL COMMENT '操作员登录名',
  `OPERATOR_REALNAME` varchar(50) DEFAULT NULL COMMENT '操作员姓名',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='结算失败重发记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_SETT_HOLIDAY_SETTING`
--

DROP TABLE IF EXISTS `TBL_SETT_HOLIDAY_SETTING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_SETT_HOLIDAY_SETTING` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `HOLIDAY` date NOT NULL COMMENT '节假日',
  `REMARK` varchar(300) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='节假日设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_SETT_RECORD`
--

DROP TABLE IF EXISTS `TBL_SETT_RECORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_SETT_RECORD` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `BATCH_NO` varchar(50) NOT NULL COMMENT '结算批次号',
  `REMIT_NO` varchar(50) NOT NULL COMMENT '打款请求号（也相关于结算记录的唯一编号）',
  `SETT_MODE` smallint(6) DEFAULT NULL COMMENT '结算发起方式(参考SettModeTypeEnum)',
  `ACCOUNT_NO` varchar(20) NOT NULL COMMENT '账户编号',
  `USER_NO` varchar(20) DEFAULT NULL COMMENT '用户编号',
  `USER_NAME` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `SETT_DATE` date DEFAULT NULL COMMENT '结算日期',
  `CURRENCY_TYPE` smallint(6) DEFAULT NULL COMMENT '结算账户币种(参考CurrencyTypeEnum)',
  `BANK_CODE` varchar(20) DEFAULT NULL COMMENT '银行编码',
  `BANK_CHANNEL_NO` varchar(50) DEFAULT NULL COMMENT '银行行号',
  `BANK_ACCOUNT_NAME` varchar(60) DEFAULT NULL COMMENT '开户名',
  `BANK_ACCOUNT_NO` varchar(20) DEFAULT NULL COMMENT '开户账户',
  `BANK_ACCOUNT_TYPE` smallint(6) DEFAULT NULL COMMENT '银行卡类型(参考枚举:BankAccountTypeEnum)',
  `COUNTRY` varchar(200) DEFAULT NULL COMMENT '开户行所在国家',
  `PROVINCE` varchar(50) DEFAULT NULL COMMENT '开户行所在省份',
  `CITY` varchar(50) DEFAULT NULL COMMENT '开户行所在城市',
  `BANK_ACCOUNT_ADDRESS` varchar(300) DEFAULT NULL COMMENT '开户行全称',
  `SETT_AMOUNT` decimal(24,10) DEFAULT NULL COMMENT '结算金额',
  `SETT_FEE` decimal(16,6) DEFAULT NULL COMMENT '结算手续费',
  `REMIT_AMOUNT` decimal(16,2) DEFAULT NULL COMMENT '结算打款金额',
  `TRADE_NUM` int(11) DEFAULT NULL COMMENT '交易笔数',
  `TRADE_AMOUNT` decimal(24,10) DEFAULT NULL COMMENT '交易金额',
  `TRADE_FEE` decimal(16,6) DEFAULT NULL COMMENT '交易手续费',
  `REFUND_NUM` int(11) DEFAULT NULL COMMENT '退款笔数',
  `REFUND_AMOUNT` decimal(16,2) DEFAULT NULL COMMENT '退款金额',
  `SETT_STATUS` smallint(6) DEFAULT NULL COMMENT '结算状态(参考枚举:SettRecordStatusEnum)',
  `REFUND_FEE` decimal(16,6) DEFAULT NULL COMMENT '退款手续费',
  `RETURN_FEE_TYPE` smallint(6) DEFAULT NULL COMMENT '结算失败退回手续费处理方式(参考枚举:SettReturnFeeTypeEnum)',
  `RETURN_AMOUNT` decimal(16,2) DEFAULT NULL COMMENT '结算退回金额',
  `BEGIN_DATE` date DEFAULT NULL COMMENT '结算开始日期',
  `END_DATE` date DEFAULT NULL COMMENT '结算截止日期',
  `REMIT_REQUEST_TIME` datetime DEFAULT NULL COMMENT '打款发送时间',
  `REMIT_CONFIRM_TIME` datetime DEFAULT NULL COMMENT '打款确认时间',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '描述',
  `REMIT_REMARK` varchar(200) DEFAULT NULL COMMENT '打款备注',
  `OPERATOR_LOGINNAME` varchar(50) DEFAULT NULL COMMENT '操作员登录名',
  `OPERATOR_REALNAME` varchar(50) DEFAULT NULL COMMENT '操作员姓名',
  `USER_TYPE` smallint(6) DEFAULT NULL COMMENT '用户类型',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`BATCH_NO`,`ACCOUNT_NO`) USING BTREE,
  UNIQUE KEY `AK_KEY_3` (`REMIT_NO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=381 DEFAULT CHARSET=utf8 COMMENT='结算记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_SETT_RULE`
--

DROP TABLE IF EXISTS `TBL_SETT_RULE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_SETT_RULE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` int(11) NOT NULL DEFAULT '0' COMMENT '版本号',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `ACCOUNT_NO` varchar(20) NOT NULL COMMENT '账户编号',
  `USER_NO` varchar(20) NOT NULL COMMENT '用户编号',
  `USER_NAME` varchar(200) DEFAULT NULL COMMENT '用户名称',
  `SETT_TYPE` smallint(6) DEFAULT NULL COMMENT '结算类型(参考SettTypeEnum)',
  `SETT_CYCLE_TYPE` smallint(6) DEFAULT NULL COMMENT '结算周期类型(参考SettRuleCycleTypeEnum)',
  `SETT_CYCLE_DATA` varchar(100) DEFAULT NULL COMMENT '结算周期',
  `RISK_DAY` smallint(6) DEFAULT NULL COMMENT '风险预存期天数',
  `IS_SETT` smallint(6) DEFAULT NULL COMMENT '是否可结算',
  `CURRENT_SETT_STATUS` smallint(6) DEFAULT NULL COMMENT '当前结算状态(参考SettRuleStatusEnum)',
  `LAST_SUM_DATE` date DEFAULT NULL COMMENT '上次汇总日期',
  `LAST_SETT_DATE` date DEFAULT NULL COMMENT '上次结算截止日期',
  `LAST_PROCESS_DATE` date DEFAULT NULL COMMENT '上次结算处理日期',
  `NEXT_PROCESS_DATE` date DEFAULT NULL COMMENT '下次结算处理日期',
  `LAST_BATCH_NO` varchar(50) DEFAULT NULL COMMENT '上次结算批次号',
  `LAST_MODIFY_TIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  `OPERATOR_LOGINNAME` varchar(50) DEFAULT NULL COMMENT '操作员登录名',
  `OPERATOR_REALNAME` varchar(50) DEFAULT NULL COMMENT '操作员姓名',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_ACCOUNT_NO_KEY` (`ACCOUNT_NO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8 COMMENT='结算规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_TRADE_NOTIFY_RECORD`
--

DROP TABLE IF EXISTS `TBL_TRADE_NOTIFY_RECORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_TRADE_NOTIFY_RECORD` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL DEFAULT '0' COMMENT 'VERSION',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_NOTIFY_TIME` datetime DEFAULT NULL COMMENT '最后一次通知时间',
  `NOTIFY_TIMES` smallint(6) NOT NULL COMMENT '通知次数',
  `LIMIT_NOTIFY_TIMES` smallint(6) NOT NULL COMMENT '限制通知次数',
  `URL` varchar(3000) NOT NULL DEFAULT '' COMMENT '通知URL',
  `MERCHANT_NO` varchar(100) NOT NULL DEFAULT '' COMMENT '商户编号',
  `MERCHANT_ORDER_NO` varchar(100) NOT NULL DEFAULT '' COMMENT '商户订单号',
  `STATUS` smallint(6) NOT NULL DEFAULT '101' COMMENT '通知状态(100:成功:101:未成功,默认101)',
  `NOTIFY_TYPE` smallint(6) NOT NULL DEFAULT '0' COMMENT '通知类型',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`MERCHANT_ORDER_NO`,`MERCHANT_NO`,`NOTIFY_TYPE`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=171517 DEFAULT CHARSET=utf8 COMMENT='通知记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_TRADE_NOTIFY_RECORD_LOG`
--

DROP TABLE IF EXISTS `TBL_TRADE_NOTIFY_RECORD_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_TRADE_NOTIFY_RECORD_LOG` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL DEFAULT '0' COMMENT 'VERSION',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `NOTIFY_ID` bigint(20) NOT NULL COMMENT '通知记录ID',
  `REQUEST` varchar(3000) NOT NULL DEFAULT '' COMMENT '请求信息',
  `RESPONSE` varchar(600) NOT NULL COMMENT '返回信息',
  `MERCHANT_NO` varchar(100) NOT NULL DEFAULT '' COMMENT '商户编号',
  `MERCHANT_ORDER_NO` varchar(100) NOT NULL DEFAULT '' COMMENT '商户订单号',
  `HTTP_STATUS` smallint(6) NOT NULL COMMENT 'HTTP状态',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=234164 DEFAULT CHARSET=utf8 COMMENT='通知记录日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_TRADE_PAYMENT_ORDER`
--

DROP TABLE IF EXISTS `TBL_TRADE_PAYMENT_ORDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_TRADE_PAYMENT_ORDER` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL DEFAULT '0' COMMENT '版本号',
  `CREATE_DATE` date DEFAULT NULL COMMENT '创建日期',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  `MERCHANT_ORDER_NO` varchar(30) NOT NULL COMMENT '商户订单号',
  `MERCHANT_NO` varchar(15) NOT NULL COMMENT '商户编号',
  `MERCHANT_NAME` varchar(90) DEFAULT NULL COMMENT '商户名称',
  `PAYER_USER_NO` varchar(15) DEFAULT NULL COMMENT '付款人编号',
  `PAYER_NAME` varchar(60) DEFAULT NULL COMMENT '付款人名称',
  `ORDER_TIME` datetime DEFAULT NULL COMMENT '下单时间',
  `ORDER_DATE` date DEFAULT NULL COMMENT '下单日期',
  `ORDER_IP` varchar(50) DEFAULT NULL COMMENT '下单IP(客户端IP,在网关页面获取)',
  `ORDER_REFERER_URL` varchar(100) DEFAULT NULL COMMENT '从哪个页面链接过来的(可用于防诈骗)',
  `ORDER_OPERATOR_LOGIN_NAME` varchar(50) DEFAULT NULL COMMENT '下单操作员登录名',
  `ORDER_OPERATOR_REAL_NAME` varchar(90) DEFAULT NULL COMMENT '下单操作员姓名',
  `ORDER_AMOUNT` decimal(10,2) DEFAULT '0.00' COMMENT '订单金额',
  `MERCHANT_DISCOUNT_AMOUNT` decimal(10,2) DEFAULT '0.00' COMMENT '商户优惠金额',
  `PLAT_DISCOUNT_AMOUNT` decimal(10,2) DEFAULT '0.00' COMMENT '平台优惠金额',
  `PAYER_FEE` decimal(20,6) DEFAULT '0.000000' COMMENT '付款方手续费',
  `PAYER_PAY_AMOUNT` decimal(10,2) DEFAULT '0.00' COMMENT '付款方支付金额',
  `RECEIVER_FEE` decimal(20,6) DEFAULT '0.000000' COMMENT '收款方手续费',
  `RECEIVER_POST_AMOUNT` decimal(20,6) DEFAULT '0.000000' COMMENT '收款方实收金额',
  `PRODUCT_NAME` varchar(180) DEFAULT NULL COMMENT '商品名称',
  `PRODUCT_DESC` varchar(600) DEFAULT NULL COMMENT '商品描述',
  `RETURN_URL` varchar(600) DEFAULT NULL COMMENT '页面回调通知URL',
  `NOTIFY_URL` varchar(600) DEFAULT NULL COMMENT '后台异步通知URL',
  `CANCEL_REASON` varchar(600) DEFAULT NULL COMMENT '订单撤销原因',
  `ORDER_PERIOD` smallint(6) DEFAULT NULL COMMENT '订单有效期(单位分钟)',
  `EXPIRE_TIME` datetime DEFAULT NULL COMMENT '到期时间',
  `ORDER_FROM` smallint(6) DEFAULT NULL COMMENT '订单来源(参考枚举:OrderFromTypeEnum)',
  `ORDER_FLAG` smallint(6) DEFAULT NULL COMMENT '订单特殊操作(参考枚举:OrderOperateEnum)',
  `CUR` smallint(6) DEFAULT NULL COMMENT '货币类型(参考枚举:CurrencyTypeEnum)',
  `STATUS` smallint(6) DEFAULT NULL COMMENT '状态(参考枚举:OrderStatusEnum)',
  `ORDER_ENCRYPT_TYPE` smallint(6) DEFAULT NULL COMMENT '订单加密类型(参考枚举:OrderEncryptTypeEnum)',
  `PAY_PRODUCT_CODE` varchar(50) DEFAULT NULL COMMENT '支付产品编号',
  `PAY_PRODUCT_NAME` varchar(100) DEFAULT NULL COMMENT '支付产品名称',
  `PAY_WAY_CODE` varchar(50) DEFAULT NULL COMMENT '支付方式编号',
  `PAY_WAY_NAME` varchar(100) DEFAULT NULL COMMENT '支付方式名称',
  `CONSIGNEE_NAME` varchar(90) DEFAULT NULL COMMENT '收货人姓名',
  `CONSIGNEE_ADDRESS` varchar(600) DEFAULT NULL COMMENT '收货人地址',
  `CONSIGNEE_POST_CODE` varchar(10) DEFAULT NULL COMMENT '收货人邮编',
  `CONSIGNEE_MOBILE` varchar(15) DEFAULT NULL COMMENT '收货人手机',
  `CONSIGNEE_PHONE` varchar(15) DEFAULT NULL COMMENT '收货人固话',
  `CONSIGNEE_EMAIL` varchar(50) DEFAULT NULL COMMENT '收货人EMAIL',
  `INVOICE_TITLE` varchar(200) DEFAULT NULL COMMENT '发票抬头',
  `BUYERLEAVE_MESSAGE` varchar(600) DEFAULT NULL COMMENT '买家留言',
  `CALL_BACK_PARA` varchar(900) DEFAULT NULL COMMENT '回调附加信息(和商户进行数据交互时附加信息)',
  `PAY_SUCCESS_DATE` date DEFAULT NULL COMMENT '支付成功日期',
  `PAY_SUCCESS_TIME` datetime DEFAULT NULL COMMENT '支付成功时间',
  `COMPLETE_DATE` date DEFAULT NULL COMMENT '完成日期',
  `COMPLETE_TIME` datetime DEFAULT NULL COMMENT '完成时间',
  `CANCEL_DATE` date DEFAULT NULL COMMENT '撤消日期',
  `CANCEL_TIME` datetime DEFAULT NULL COMMENT '撤消时间',
  `BIZ_TYPE` smallint(6) DEFAULT NULL COMMENT '交易业务类型',
  `PAYMENT_TYPE` smallint(6) DEFAULT NULL COMMENT '支付方式类型',
  `SUCCESS_TRX_NO` varchar(20) DEFAULT NULL COMMENT '成功支付流水号',
  `IS_REFUND` smallint(6) DEFAULT '101' COMMENT '是否退款(100:是,101:否,默认值为:101)',
  `SUCCESS_REFUND_TIMES` smallint(6) DEFAULT '0' COMMENT '成功退款次数(默认值为:0)',
  `SUCCESS_REFUND_AMOUNT` decimal(10,2) DEFAULT NULL COMMENT '成功退款总金额',
  `TRX_MODEL` smallint(6) DEFAULT NULL COMMENT '交易模式类型(参考枚举:TrxModelEnum)',
  `SPLIT_DETAIL` varchar(1000) DEFAULT NULL COMMENT '分账明细',
  `PAYER_USER_TYPE` smallint(6) DEFAULT NULL COMMENT '付款人类型',
  `RISK_DAY` smallint(6) DEFAULT NULL COMMENT '风险预存期天数',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`MERCHANT_ORDER_NO`,`MERCHANT_NO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23092 DEFAULT CHARSET=utf8 COMMENT='支付订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_TRADE_PAYMENT_RECORD`
--

DROP TABLE IF EXISTS `TBL_TRADE_PAYMENT_RECORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_TRADE_PAYMENT_RECORD` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL DEFAULT '0' COMMENT '版本号',
  `CREATE_DATE` date DEFAULT NULL COMMENT '创建日期',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  `MERCHANT_ORDER_NO` varchar(30) NOT NULL COMMENT '商户订单号',
  `TRX_NO` char(20) NOT NULL COMMENT '支付流水号',
  `BANK_ORDER_NO` char(20) DEFAULT NULL COMMENT '银行订单号',
  `BANK_TRX_NO` varchar(30) DEFAULT NULL COMMENT '银行流水号',
  `MERCHANT_NO` varchar(15) NOT NULL COMMENT '商户编号',
  `MERCHANT_NAME` varchar(90) DEFAULT NULL COMMENT '商户名称',
  `RECEIVER_ACCOUNT_TYPE` smallint(6) DEFAULT NULL COMMENT '收款方账户类型(参考账户类型枚举:AccountTypeEnum)',
  `PAYER_USER_NO` varchar(15) DEFAULT NULL COMMENT '付款人编号',
  `PAYER_NAME` varchar(60) DEFAULT NULL COMMENT '付款人名称',
  `PAYER_ACCOUNT_TYPE` smallint(6) DEFAULT NULL COMMENT '付款方账户类型(参考账户类型枚举:AccountTypeEnum)',
  `ORDER_IP` varchar(30) DEFAULT NULL COMMENT '下单IP(客户端IP,从网关中获取)',
  `ORDER_REFERER_URL` varchar(100) DEFAULT NULL COMMENT '从哪个页面链接过来的(可用于防诈骗)',
  `ORDER_AMOUNT` decimal(14,2) DEFAULT '0.00' COMMENT '订单金额',
  `PAYER_FEE` decimal(20,6) DEFAULT '0.000000' COMMENT '付款方手续费',
  `PAYER_PAY_AMOUNT` decimal(14,2) DEFAULT '0.00' COMMENT '付款方支付金额',
  `RECEIVER_FEE` decimal(20,6) DEFAULT '0.000000' COMMENT '收款方手续费',
  `RECEIVER_POST_AMOUNT` decimal(20,6) DEFAULT '0.000000' COMMENT '收款方实收金额',
  `PLAT_INCOME` decimal(20,6) DEFAULT NULL COMMENT '平台收入',
  `PRODUCT_NAME` varchar(180) DEFAULT NULL COMMENT '商品名称',
  `PRODUCT_DESC` varchar(600) DEFAULT NULL COMMENT '商品描述',
  `RETURN_URL` varchar(600) DEFAULT NULL COMMENT '页面回调通知URL',
  `NOTIFY_URL` varchar(600) DEFAULT NULL COMMENT '后台异步通知URL',
  `CANCEL_DESC` varchar(600) DEFAULT NULL COMMENT '订单撤销原因',
  `ORDER_FROM` smallint(6) DEFAULT NULL COMMENT '订单来源(参考枚举:OrderFromTypeEnum)',
  `ORDER_FLAG` smallint(6) DEFAULT NULL COMMENT '订单特殊操作(参考枚举:OrderOperateEnum)',
  `CUR` smallint(6) DEFAULT NULL COMMENT '货币类型(参考枚举:CurrencyTypeEnum)',
  `STATUS` smallint(6) DEFAULT NULL COMMENT '状态(参考枚举:PaymentRecordStatusEnum)',
  `TRX_MODEL` smallint(6) DEFAULT NULL COMMENT '交易模式(参考枚举:TrxModelEnum)',
  `PAY_PRODUCT_CODE` varchar(50) DEFAULT NULL COMMENT '支付产品编号',
  `PAY_PRODUCT_NAME` varchar(100) DEFAULT NULL COMMENT '支付产品名称',
  `PAY_WAY_CODE` varchar(50) DEFAULT NULL COMMENT '支付方式编号',
  `PAY_WAY_NAME` varchar(100) DEFAULT NULL COMMENT '支付方式名称',
  `PAY_INTERFACE_CODE` varchar(50) DEFAULT NULL COMMENT '支付接口编号',
  `PAY_INTERFACE_NAME` varchar(100) DEFAULT NULL COMMENT '支付接口名称',
  `PAY_RULE_ID` bigint(20) DEFAULT NULL COMMENT '支付规则ID',
  `FEE_DIMENSION_ID` bigint(20) DEFAULT NULL COMMENT '费率维度ID',
  `COST_DIMENSION_ID` bigint(20) DEFAULT NULL COMMENT '成本维度ID',
  `PAY_SUCCESS_DATE` date DEFAULT NULL COMMENT '支付成功日期',
  `PAY_SUCCESS_TIME` datetime DEFAULT NULL COMMENT '支付成功时间',
  `COMPLETE_DATE` date DEFAULT NULL COMMENT '完成日期',
  `COMPLETE_TIME` datetime DEFAULT NULL COMMENT '完成时间',
  `CANCEL_DATE` date DEFAULT NULL COMMENT '撤消日期',
  `CANCEL_TIME` datetime DEFAULT NULL COMMENT '撤消时间',
  `IS_REFUND` smallint(6) DEFAULT '101' COMMENT '是否退款(100:是,101:否,默认值为:101)',
  `REFUND_TIMES` smallint(6) DEFAULT '0' COMMENT '退款次数(默认值为:0)',
  `SUCCESS_REFUND_AMOUNT` decimal(14,2) DEFAULT NULL COMMENT '成功退款总金额',
  `BIZ_TYPE` smallint(6) DEFAULT NULL COMMENT '交易业务类型',
  `PAYMENT_TYPE` smallint(6) DEFAULT NULL COMMENT '支付方式类型',
  `PAY_INTERFACE_MCC` varchar(20) DEFAULT NULL COMMENT '支付接口mcc',
  `RISK_DAY` smallint(6) DEFAULT NULL COMMENT '风险预存期天数',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`TRX_NO`) USING BTREE,
  UNIQUE KEY `AK_KEY_3` (`BANK_ORDER_NO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26718 DEFAULT CHARSET=utf8 COMMENT='支付记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_TRADE_SPLIT_RECORD`
--

DROP TABLE IF EXISTS `TBL_TRADE_SPLIT_RECORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_TRADE_SPLIT_RECORD` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL DEFAULT '0' COMMENT '版本号',
  `CREATE_DATE` date NOT NULL COMMENT '创建日期',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  `MERCHANT_ORDER_NO` varchar(30) NOT NULL COMMENT '商户订单号',
  `ORDER_AMOUNT` decimal(14,2) DEFAULT '0.00' COMMENT '订单总金额',
  `PAY_AMOUNT` decimal(14,2) DEFAULT '0.00' COMMENT '支付总金额',
  `MERCHANT_NO` varchar(15) NOT NULL COMMENT '商户编号',
  `MERCHANT_NAME` varchar(90) DEFAULT NULL COMMENT '商户名称',
  `SPLIT_MERCHANT_NO` varchar(15) DEFAULT NULL COMMENT '分账商户编号',
  `SPLIT_MERCHANT_NAME` varchar(60) DEFAULT NULL COMMENT '分账商户名称',
  `SPLIT_AMOUNT` decimal(10,2) DEFAULT '0.00' COMMENT '分账金额',
  `SPLIT_SUCCESS_DATE` date DEFAULT NULL COMMENT '分账成功日期',
  `SPLIT_SUCCESS_TIME` datetime DEFAULT NULL COMMENT '分账成功时间',
  `SPLIT_STATUS` smallint(6) DEFAULT NULL COMMENT '分账状态',
  `TRX_MODEL` smallint(6) DEFAULT NULL COMMENT '交易类型',
  `SPLIT_LOGIN_NAME` varchar(50) DEFAULT NULL COMMENT '分账商户登录名',
  `IS_REFUND` smallint(6) DEFAULT NULL,
  `SUCCESS_REFUND_AMOUNT` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=480 DEFAULT CHARSET=utf8 COMMENT='分账记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_TRADE_TRANSFERRECORD`
--

DROP TABLE IF EXISTS `TBL_TRADE_TRANSFERRECORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_TRADE_TRANSFERRECORD` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL COMMENT '版本号',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `TRXNO` char(20) NOT NULL COMMENT '平台生成的交易流水号',
  `AMOUNT` decimal(14,2) NOT NULL COMMENT '转账金额',
  `SOURCERATE` decimal(6,4) NOT NULL COMMENT '收款方手续费率',
  `TARGETRATE` decimal(6,4) NOT NULL COMMENT '付款方手续费率',
  `SOURCEUSERNO` varchar(15) NOT NULL COMMENT '收款方用户编号',
  `TARGETUSERNO` varchar(15) NOT NULL COMMENT '付款方用户编号',
  `SOURCEUSERTYPE` smallint(6) NOT NULL COMMENT '收款方用户类型，1:商户 2:代理商 3:个人/会员 4:内部账户 5:POS商户 6:POS代理商',
  `TARGETUSERTYPE` smallint(6) NOT NULL COMMENT '付款方用户类型，1:商户 2:代理商 3:个人/会员 4:内部账户 5:POS商户 6:POS代理商',
  `TARGETFEE` decimal(20,6) NOT NULL COMMENT '付款方手续费',
  `SOURCEFEE` decimal(20,6) NOT NULL COMMENT '收款方手续费',
  `PLATFEE` decimal(20,6) NOT NULL COMMENT '平台收取的手续费',
  `STATUS` smallint(6) NOT NULL COMMENT '交易状态，100:交易成功 101:交易失败 102:订单已创建 103:订单已取消',
  `REMARK` varchar(300) DEFAULT NULL COMMENT '付款说明',
  `SOURCEMOBILENO` varchar(15) DEFAULT NULL COMMENT '收款人手机号，手工输入手机号,可选',
  `SOURCELOGINNAME` varchar(50) NOT NULL COMMENT '收款人登录名（对应会员信息表或商户信息表中的登录名）',
  `SOURCENAME` varchar(90) NOT NULL COMMENT '收款人姓名（对应会员信息表中的真实姓名字段或对应商户信息表中的签约名字段）',
  `TARGETLOGINNAME` varchar(50) NOT NULL COMMENT '付款人登录名（对应会员信息表或商户信息表中的登录名）',
  `TARGETNAME` varchar(90) NOT NULL COMMENT '付款人姓名（对应会员信息表中的真实姓名字段或对应商户信息表中的签约名字段）',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`TRXNO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='转账记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_USER_AUDIT_RECORD_COLSE`
--

DROP TABLE IF EXISTS `TBL_USER_AUDIT_RECORD_COLSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_USER_AUDIT_RECORD_COLSE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL COMMENT 'VERSION',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `USERNO` varchar(15) NOT NULL COMMENT '用户编号',
  `FULLNAME` varchar(90) DEFAULT NULL COMMENT '公司全称',
  `LOGINNAME` varchar(50) NOT NULL COMMENT '用户登录名',
  `USERTYPE` smallint(6) NOT NULL COMMENT '审核类型：会员、在线商户、pos商户',
  `AUDITSTATUS` smallint(6) NOT NULL COMMENT '审核状态：审核通过，审核不通过，未审核',
  `APPLYDESC` varchar(600) DEFAULT NULL COMMENT '申请描述',
  `AUDITDESC` varchar(600) DEFAULT NULL COMMENT '审核描述',
  `AUDITOPERATORLOGINNAME` varchar(50) DEFAULT NULL COMMENT '审核操作员的登陆名',
  `AUDITOPERATORNAME` varchar(30) DEFAULT NULL COMMENT '审核操作员的名字',
  `DEALTIME` date DEFAULT NULL COMMENT '处理时间',
  `APPLYOPERATORLOGINNAME` varchar(50) DEFAULT NULL COMMENT '申请操作员的登陆名',
  `APPLYOPERATORNAME` varchar(30) DEFAULT NULL COMMENT '申请操作员的名字',
  `ISLOGIN` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户销户审核表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_USER_AUDIT_RECORD_REALNAME`
--

DROP TABLE IF EXISTS `TBL_USER_AUDIT_RECORD_REALNAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_USER_AUDIT_RECORD_REALNAME` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL COMMENT 'VERSION',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `USERNO` varchar(15) NOT NULL COMMENT '用户编号',
  `FULLNAME` varchar(90) DEFAULT NULL COMMENT '公司全称',
  `LOGINNAME` varchar(50) NOT NULL COMMENT '用户登录名',
  `USERTYPE` smallint(6) NOT NULL COMMENT '审核类型：会员、在线商户、pos商户',
  `AUDITSTATUS` smallint(6) NOT NULL COMMENT '审核状态：审核通过，审核不通过，未审核',
  `APPLYDESC` varchar(600) DEFAULT NULL COMMENT '申请描述',
  `AUDITDESC` varchar(600) DEFAULT NULL COMMENT '审核描述',
  `AUDITOPERATORLOGINNAME` varchar(50) DEFAULT NULL COMMENT '审核操作员的登陆名',
  `AUDITOPERATORNAME` varchar(30) DEFAULT NULL COMMENT '什么操作员的名字',
  `DEALTIME` datetime DEFAULT NULL COMMENT '处理时间',
  `REALNAME` varchar(30) DEFAULT NULL COMMENT '真实姓名',
  `CARDNO` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `CARDFRONTPATH` varchar(256) DEFAULT NULL COMMENT '身份证扫描件正面文件路径，上传证件格式为bmp、jpg、jpeg，证件大小不超过2M',
  `CARDBACKPATH` varchar(256) DEFAULT NULL COMMENT '身份证扫描件反面文件路径，上传证件格式为bmp、jpg、jpeg，证件大小不超过2M',
  `CARDNOVALID` date DEFAULT NULL COMMENT '身份证到期日期',
  `APPLYOPERATORLOGINNAME` varchar(50) DEFAULT NULL COMMENT '申请操作员的登陆名',
  `APPLYOPERATORNAME` varchar(30) DEFAULT NULL COMMENT '申请操作员的名字',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='用户实名验证审核';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_USER_AUDIT_RECORD_STATUS`
--

DROP TABLE IF EXISTS `TBL_USER_AUDIT_RECORD_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_USER_AUDIT_RECORD_STATUS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL COMMENT 'VERSION',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `USERNO` varchar(15) NOT NULL COMMENT '用户编号',
  `FULLNAME` varchar(90) DEFAULT NULL COMMENT '公司全称',
  `LOGINNAME` varchar(50) NOT NULL COMMENT '用户登录名',
  `USERTYPE` smallint(6) NOT NULL COMMENT '审核类型：会员、在线商户、pos商户',
  `AUDITSTATUS` smallint(6) NOT NULL COMMENT '审核状态：审核通过，审核不通过，未审核',
  `APPLYDESC` varchar(600) DEFAULT NULL COMMENT '申请描述',
  `AUDITDESC` varchar(600) DEFAULT NULL COMMENT '审核描述',
  `AUDITOPERATORLOGINNAME` varchar(50) DEFAULT NULL COMMENT '审核操作员的登陆名',
  `AUDITOPERATORNAME` varchar(30) DEFAULT NULL COMMENT '什么操作员的名字',
  `DEALTIME` datetime DEFAULT NULL COMMENT '处理时间',
  `CHANGESTATUS` smallint(6) DEFAULT NULL COMMENT '申请变更状态',
  `ACTUALCHANGESTATUS` smallint(6) DEFAULT NULL COMMENT '实际变更状态',
  `CURRENTSTATUS` smallint(6) DEFAULT NULL COMMENT '当前状态',
  `APPLYOPERATORLOGINNAME` varchar(50) DEFAULT NULL COMMENT '申请操作员的登陆名',
  `APPLYOPERATORNAME` varchar(30) DEFAULT NULL COMMENT '申请操作员的名字',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=686 DEFAULT CHARSET=utf8 COMMENT='用户状态审核表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_USER_BANK_ACCOUNT`
--

DROP TABLE IF EXISTS `TBL_USER_BANK_ACCOUNT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_USER_BANK_ACCOUNT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL COMMENT 'VERSION',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `LOGINNAME` varchar(50) NOT NULL COMMENT '用户登录名',
  `USERNO` varchar(15) NOT NULL COMMENT '用户编号',
  `BANKNAME` varchar(60) NOT NULL COMMENT '银行名称',
  `BANKCODE` varchar(20) NOT NULL COMMENT '银行编码',
  `BANKACCOUNTNAME` varchar(60) NOT NULL COMMENT '开户名',
  `BANKACCOUNTNO` varchar(20) NOT NULL COMMENT '开户账户',
  `CONTRACTNO` varchar(60) DEFAULT NULL COMMENT '协议号',
  `BANKACCOUNTTYPE` smallint(6) NOT NULL COMMENT '银行卡类型(1:信用卡,2:储蓄卡)',
  `ISAUTH` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否已验证(1:是,0:否,默认值为0)',
  `AUTHTIME` datetime DEFAULT NULL COMMENT '验证时间',
  `CARDTYPE` smallint(6) DEFAULT NULL COMMENT '证件类型',
  `CARDNO` varchar(30) DEFAULT NULL COMMENT '证件号码',
  `MOBILENO` varchar(15) DEFAULT NULL COMMENT '手机号',
  `LASTTIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  `ISDELETE` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否已删除(1:是,0:否,默认值为0)',
  `ISDEFAULT` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否默认(1:是,0:否,默认值为0)',
  `PROVINCE` varchar(50) DEFAULT NULL COMMENT '开户行所在省份',
  `CITY` varchar(50) DEFAULT NULL COMMENT '开户行所在城市',
  `BANKACCOUNTADDRESS` varchar(250) DEFAULT NULL COMMENT '开户行地址',
  `BANKCHANNELNO` varchar(12) DEFAULT NULL COMMENT '银行行号',
  `REMARK` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`BANKACCOUNTNO`,`USERNO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=472 DEFAULT CHARSET=utf8 COMMENT='用户银行账户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_USER_INFO`
--

DROP TABLE IF EXISTS `TBL_USER_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_USER_INFO` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `VERSION` smallint(6) NOT NULL DEFAULT '0' COMMENT '版本号',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `ACCOUNTNO` char(20) NOT NULL COMMENT '账户编号',
  `USERNO` varchar(15) NOT NULL COMMENT '用户编号',
  `LOGINNAME` varchar(50) NOT NULL COMMENT '登录名',
  `USERTYPE` smallint(6) NOT NULL COMMENT '用户类型(参考账户类型)',
  `GREETING` varchar(200) DEFAULT NULL COMMENT '预留信息',
  `QUESTION` varchar(150) DEFAULT NULL COMMENT '安全保护问题',
  `ANSWER` varchar(150) DEFAULT NULL COMMENT '安全保护问题答案',
  `BINDMOBILENO` varchar(200) DEFAULT NULL COMMENT '绑定手机号',
  `BINDEMAIL` varchar(50) DEFAULT NULL COMMENT '绑定邮箱',
  `PROVINCE` varchar(100) DEFAULT NULL COMMENT '所属省份',
  `CITY` varchar(100) DEFAULT NULL COMMENT '所属地市',
  `AREA` varchar(100) DEFAULT NULL COMMENT '所属地区',
  `REALNAME` varchar(150) DEFAULT NULL COMMENT '真实姓名',
  `CARDNO` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `STATUS` smallint(6) DEFAULT NULL COMMENT '状态',
  `ISEMAILAUTH` smallint(6) NOT NULL DEFAULT '101' COMMENT '是否已认证邮箱(100:是,101:否,默认值为101)',
  `ISMOBILEAUTH` smallint(6) NOT NULL DEFAULT '101' COMMENT '是否已认证手机(100:是,101:否,默认值为101)',
  `ISREALNAMEAUTH` smallint(6) NOT NULL DEFAULT '101' COMMENT '是否已实名认证(100:是,101:否,默认值为101)',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`LOGINNAME`) USING BTREE,
  UNIQUE KEY `AK_KEY_3` (`USERNO`) USING BTREE,
  UNIQUE KEY `AK_KEY_5` (`ACCOUNTNO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=568 DEFAULT CHARSET=utf8 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_USER_MEMBER_INFO`
--

DROP TABLE IF EXISTS `TBL_USER_MEMBER_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_USER_MEMBER_INFO` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL COMMENT 'VERSION',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `MEMBERNO` char(15) NOT NULL COMMENT '会员编号',
  `STATUS` smallint(6) NOT NULL COMMENT '状态(100:激活,101:冻结,102:已销户)',
  `REALNAME` varchar(30) NOT NULL COMMENT '真实姓名',
  `CARDNO` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `ADDRESS` varchar(100) NOT NULL COMMENT '联系地址',
  `TELNO` varchar(15) NOT NULL COMMENT '固定电话',
  `FAX` varchar(20) NOT NULL COMMENT '传真号',
  `QQ` varchar(20) NOT NULL COMMENT 'QQ号',
  `ACCOUNTNO` varchar(20) DEFAULT NULL COMMENT '账户编号',
  `PROFESSION` varchar(100) DEFAULT NULL,
  `COUNTRY` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_Key_2` (`MEMBERNO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_USER_MERCHANT_FILE`
--

DROP TABLE IF EXISTS `TBL_USER_MERCHANT_FILE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_USER_MERCHANT_FILE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` bigint(20) NOT NULL,
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MERCHANT_NO` varchar(15) NOT NULL COMMENT '商户编号',
  `TRADE_LICENCE` varchar(500) DEFAULT NULL COMMENT '营业执照',
  `OPEN_ACCOUNT_LICENCE` varchar(500) DEFAULT NULL COMMENT '开户许可证',
  `CARD_POSITIVE` varchar(500) DEFAULT NULL COMMENT '法人身份证正面',
  `CARD_NEGATIVE` varchar(500) DEFAULT NULL COMMENT '法人身份证反面',
  `HANDLE_CARD` varchar(500) DEFAULT NULL COMMENT '手持身份证',
  `BANK_CARD` varchar(500) DEFAULT NULL COMMENT '银行卡正面',
  `CASHIER` varchar(500) DEFAULT NULL COMMENT '收银台',
  `TRADE_ADDRESS` varchar(500) DEFAULT NULL COMMENT '经营场所',
  `DOOR_HEAD` varchar(500) DEFAULT NULL COMMENT '门头照',
  `OTHER` varchar(1000) DEFAULT NULL COMMENT '其它',
  `BANK_CARD_NEGATIVE` varchar(500) DEFAULT NULL COMMENT '银行卡反面照',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_Key_2` (`MERCHANT_NO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COMMENT='商户申请资质扫描文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_USER_MERCHANT_ONLINE`
--

DROP TABLE IF EXISTS `TBL_USER_MERCHANT_ONLINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_USER_MERCHANT_ONLINE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL DEFAULT '0' COMMENT 'VERSION',
  `CREATETIME` datetime NOT NULL COMMENT '创建时间',
  `MERCHANTNO` char(15) NOT NULL COMMENT '商户编号',
  `STATUS` smallint(6) NOT NULL COMMENT '商户状态:97:已创建,98:待审核,99:审核不通过,100:激活,101:冻结,102:已销户',
  `MERCHANTTYPE` smallint(6) NOT NULL COMMENT '商户类型:10:个人,11:个体工商,12:企业',
  `MERCHANTKEY` varchar(256) NOT NULL COMMENT '商户密钥',
  `SHORTNAME` varchar(30) DEFAULT NULL COMMENT '公司简称',
  `FULLNAME` varchar(90) DEFAULT NULL COMMENT '公司全称',
  `ADDRESS` varchar(150) DEFAULT NULL COMMENT '公司地址',
  `URL` varchar(255) DEFAULT NULL COMMENT '公司网址',
  `ICP` varchar(50) DEFAULT NULL COMMENT 'ICP证备案号',
  `LEGALPERSON` varchar(90) DEFAULT NULL COMMENT '法人代表姓名',
  `CARDNO` varchar(200) DEFAULT NULL COMMENT '法人身份证号',
  `CERTIFICATEEXPIRY` varchar(100) DEFAULT NULL COMMENT '法人证件有效期:YYYY-MM-DD至YYYY-MM-DD',
  `SCOPE` varchar(300) DEFAULT NULL COMMENT '经营范围',
  `LICENSENO` varchar(50) DEFAULT NULL COMMENT '营业执照号',
  `LICENSEEXPIRY` varchar(100) DEFAULT NULL COMMENT '营业执照有效期:YYYY-MM-DD至YYYY-MM-DD',
  `LICENSENOVALID` datetime DEFAULT NULL COMMENT '营业执照到期日期',
  `ORGCODE` varchar(50) DEFAULT NULL COMMENT '组织机构代码',
  `NATIONALTAX` varchar(100) DEFAULT NULL COMMENT '税务登记证(国税)',
  `LANDTAX` varchar(100) DEFAULT NULL COMMENT '税务登记证(地税)',
  `SIGNTIME` datetime DEFAULT NULL COMMENT '签约时间',
  `CONTRACTVALID` datetime DEFAULT NULL COMMENT '合同到期日',
  `BUSICONTACTNAME` varchar(30) DEFAULT NULL COMMENT '业务联系人',
  `BUSICONTACTMOBILENO` varchar(15) DEFAULT NULL COMMENT '业务联系手机号码',
  `BUSICONTACTEMAIL` varchar(50) DEFAULT NULL COMMENT '业务联系邮箱',
  `BUSICONTACTQQ` varchar(15) DEFAULT NULL COMMENT '业务联系联系QQ',
  `TECHCONTACTNAME` varchar(30) DEFAULT NULL COMMENT '技术联系人',
  `TECHCONTACTMOBILENO` varchar(15) DEFAULT NULL COMMENT '技术联系手机号',
  `TECHCONTACTEMAIL` varchar(50) DEFAULT NULL COMMENT '技术联系邮箱',
  `TECHCONTACTQQ` varchar(15) DEFAULT NULL COMMENT '技术联系QQ',
  `FAX` varchar(20) DEFAULT NULL COMMENT '传真号',
  `IPSEG` varchar(200) DEFAULT NULL COMMENT 'IP段',
  `ACCOUNTNO` varchar(20) DEFAULT NULL COMMENT '账户编号',
  `MCC` varchar(15) DEFAULT NULL COMMENT 'POS商户编号:收单行3+MCC4+地区4+流水4',
  `USER_TYPE` smallint(6) DEFAULT NULL COMMENT '用户类型(参考枚举:UserTypeEnum)',
  `REGISTERMONEY` decimal(16,4) DEFAULT NULL COMMENT '注册资本(万元)',
  `PREAUTHORIZATION` smallint(6) DEFAULT NULL COMMENT '是否开通预授权:0:否,1:是',
  `DEPOSIT` decimal(16,4) DEFAULT NULL COMMENT '代理商所交的保证金',
  `ZIPCODE` varchar(10) DEFAULT NULL COMMENT '邮编',
  `TELEPHONENUM` varchar(15) DEFAULT NULL COMMENT '固定电话',
  `BUSINESSAREA` smallint(6) DEFAULT '0' COMMENT '经营面积',
  `EMPNUM` smallint(6) DEFAULT '0' COMMENT '员工数量',
  `CARDNO_ADDRESS` varchar(200) DEFAULT NULL COMMENT '身份证地址',
  `LICENSEEXPIRYFORM` varchar(10) DEFAULT NULL COMMENT '营业执照开始日期',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`MERCHANTNO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=391 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_USER_MERCHANT_SECRET`
--

DROP TABLE IF EXISTS `TBL_USER_MERCHANT_SECRET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_USER_MERCHANT_SECRET` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) DEFAULT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `PUBLICKEY` varchar(1000) DEFAULT NULL,
  `PRIVATEKEY` varchar(1000) DEFAULT NULL,
  `MERCHANTPUBLICKEY` varchar(1000) DEFAULT NULL,
  `MERCHANTNO` char(15) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_USER_RELATION`
--

DROP TABLE IF EXISTS `TBL_USER_RELATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_USER_RELATION` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION` smallint(6) DEFAULT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `PARENT_USER_NO` varchar(20) DEFAULT NULL,
  `CHILD_USER_NO` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_Key_2` (`PARENT_USER_NO`,`CHILD_USER_NO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_USER_TRADE_PWD`
--

DROP TABLE IF EXISTS `TBL_USER_TRADE_PWD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_USER_TRADE_PWD` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` smallint(6) NOT NULL COMMENT 'VERSION',
  `LOGINNAME` varchar(50) NOT NULL COMMENT '用户登录名',
  `USERNO` varchar(20) NOT NULL COMMENT '用户编号',
  `TRADEPWD` varchar(256) NOT NULL COMMENT '交易密码',
  `PWDERRORTIMES` smallint(6) NOT NULL DEFAULT '0' COMMENT '密码错误次数',
  `PWDERRORLASTTIME` datetime NOT NULL COMMENT '最后一次输错密码时间',
  `ISINITIALPWD` smallint(6) DEFAULT NULL COMMENT '是否初始密码',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_KEY_2` (`LOGINNAME`) USING BTREE,
  UNIQUE KEY `AK_KEY_3` (`USERNO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8 COMMENT='用户交易密码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_USER_VERIFICATIONCODE`
--

DROP TABLE IF EXISTS `TBL_USER_VERIFICATIONCODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBL_USER_VERIFICATIONCODE` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `VERSION` int(11) NOT NULL DEFAULT '0' COMMENT 'VERSION',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `USER_NO` varchar(15) NOT NULL COMMENT '用户编号',
  `LOGIN_NAME` varchar(50) NOT NULL COMMENT '登录名',
  `VERIFICATION_TYPE` smallint(6) NOT NULL COMMENT '类型',
  `STATUS` smallint(6) NOT NULL COMMENT '状态:100已验证 101未验证   102 已过期',
  `VERIFICATION_CODE` varchar(10) NOT NULL COMMENT '验证码',
  `GENERATE_TIME` datetime NOT NULL COMMENT '验证码生成时间',
  `MATURITY_TIME` datetime NOT NULL COMMENT '验证码到期时间',
  `REMARK` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='用户验证码信息表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-16 23:32:56
