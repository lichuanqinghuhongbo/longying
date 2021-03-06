SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE BIZ_CONTACT;
DROP TABLE BIZ_PRODUCT;
DROP TABLE BIZ_PRODUCTMANGER;
DROP TABLE BIZ_PTYPE;
DROP TABLE BIZ_VENDER;
DROP TABLE BIZ_XILIE;




/* Create Tables */

CREATE TABLE BIZ_CONTACT
(
	ID BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
	UNAME VARCHAR(20) COMMENT '姓名',
	-- 0：女
	-- 1：男
	SEX SMALLINT COMMENT '性别',
	MOBILE VARCHAR(20) COMMENT '手机',
	-- 供非员工用的系统参数处获取
	PARTID BIGINT COMMENT '部门',
	POSTID BIGINT COMMENT '职位',
	QQ VARCHAR(10) COMMENT 'QQ',
	EMAIL VARCHAR(50) COMMENT 'Email',
	FAX VARCHAR(50) COMMENT '传真',
	MSN VARCHAR(50) COMMENT 'MSN',
	WORKTEL VARCHAR(50) COMMENT '工作电话',
	-- yyyy-MM-dd
	BIRTHDAY VARCHAR(10) COMMENT '生日',
	ISMAIN SMALLINT DEFAULT 0 COMMENT '主联系人',
	-- 多选，逗号分隔
	AIHAO VARCHAR(20) COMMENT '爱好',
	HOMEADDR VARCHAR(100) COMMENT '家庭地址',
	-- A ,B,O,AB,未知
	XUEXING VARCHAR(2) COMMENT '血型',
	XINGZUO VARCHAR(5) COMMENT '星座',
	VID BIGINT COMMENT '厂商id',
	CID BIGINT COMMENT '客户id',
	-- 记录公司员工的通信录
	UID BIGINT COMMENT '员工id',
	-- 员工个人通信录
	CREATER BIGINT COMMENT '创建人',
	REMARK VARCHAR(500) COMMENT '备注',
	CTIME DATETIME COMMENT '创建时间',
	-- 1
	ISPER SMALLINT COMMENT '是否个人通信录联系人',
	PRIMARY KEY (ID)
) COMMENT = '联系人';


CREATE TABLE BIZ_PRODUCT
(
	ID BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
	CNAME VARCHAR(50) COMMENT '产品名称',
	DW VARCHAR(20) COMMENT '产品单位',
	SN VARCHAR(50) COMMENT '序列号',
	-- 从系统参数处获取
	PTYPE BIGINT COMMENT '产品类型',
	XINGHAO VARCHAR(50) COMMENT '产品型号',
	CK BIGINT COMMENT '存放仓库',
	GKLSJ FLOAT COMMENT '公开零售价',
	ZCLSJ FLOAT COMMENT '正常零售价',
	PFZDJ FLOAT COMMENT '批发指导价',
	ZCPFJ FLOAT COMMENT '正常批发价',
	NBZDJ FLOAT COMMENT '内部指导价',
	CBJ FLOAT COMMENT '成本价',
	CGREN BIGINT COMMENT '采购人id',
	AQKCL SMALLINT COMMENT '安全库存量',
	XYKCBJ SMALLINT DEFAULT 0 COMMENT '需要库存比较',
	CPJJ VARCHAR(500) COMMENT '产品简介',
	JSCS VARCHAR(500) COMMENT '技术参数',
	ZKGZ VARCHAR(500) COMMENT '折扣规则',
	VID BIGINT NOT NULL COMMENT '厂商ID',
	XLID BIGINT NOT NULL COMMENT '系列ID',
	PRIMARY KEY (ID)
) COMMENT = '产品';


CREATE TABLE BIZ_PRODUCTMANGER
(
	ID BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
	UID BIGINT NOT NULL COMMENT '产品经理',
	-- id1,id2,id3
	VENDERID VARCHAR(100) COMMENT '厂商',
	-- id1,id2,id3
	XILIE VARCHAR(100) COMMENT '系列',
	UNAME VARCHAR(20) NOT NULL COMMENT '姓名',
	PRIMARY KEY (ID)
) COMMENT = '产品经理';


CREATE TABLE BIZ_PTYPE
(
	ID BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
	CNAME VARCHAR(20) NOT NULL COMMENT '名称',
	SORTNUM SMALLINT DEFAULT 1 COMMENT '排序',
	PRIMARY KEY (ID)
) COMMENT = '产品类型';


CREATE TABLE BIZ_VENDER
(
	ID BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
	CNAME VARCHAR(100) NOT NULL COMMENT '厂商名称',
	JCNAME VARCHAR(30) COMMENT '简称',
	HANGYE BIGINT COMMENT '行业',
	-- 0:预用供应商
	-- 1:普通供应商
	-- 2:重要供应商
	-- 
	TYPE SMALLINT DEFAULT 0 NOT NULL COMMENT '厂商类型',
	-- 0:直接创建
	-- 1:其他来源
	LAIYUAN SMALLINT DEFAULT 0 COMMENT '来源',
	PROVINCE BIGINT COMMENT '省份',
	CITY BIGINT COMMENT '地市',
	TELPHONE VARCHAR(50) COMMENT '电话',
	ZIPCODE VARCHAR(10) COMMENT '邮编',
	FAX VARCHAR(20) COMMENT '传真',
	EMAIL VARCHAR(100) COMMENT '接收报备的EMAIL',
	ADDR VARCHAR(100) COMMENT '地址',
	WEB VARCHAR(100) COMMENT '公司网址',
	BANKACCOUNT VARCHAR(30) COMMENT '银行账号',
	-- 银行库
	BANK BIGINT COMMENT '开户行',
	NETSCALE BIGINT COMMENT '网络规模',
	TAXNUM VARCHAR(30) COMMENT '税号',
	BBLIMIT SMALLINT COMMENT '报备期限',
	SUMMARY LONGTEXT COMMENT '公司简介',
	PRIMARY KEY (ID)
) COMMENT = '厂商厂家';


CREATE TABLE BIZ_XILIE
(
	ID BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id',
	CNAME VARCHAR(20) COMMENT '名称',
	SORTNUM SMALLINT COMMENT '排序',
	PID BIGINT DEFAULT 0 NOT NULL COMMENT '上一级',
	PRIMARY KEY (ID)
) COMMENT = '系列';



/* Create Foreign Keys */

ALTER TABLE BIZ_PRODUCT
	ADD FOREIGN KEY (VID)
	REFERENCES BIZ_VENDER (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE BIZ_PRODUCT
	ADD FOREIGN KEY (XLID)
	REFERENCES BIZ_XILIE (ID)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



