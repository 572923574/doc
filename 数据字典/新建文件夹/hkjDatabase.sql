/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/12/8 21:26:03                           */
/*==============================================================*/


drop table if exists goods;

drop table if exists goodsCompany;

drop table if exists goodsSubType;

drop table if exists goodsSupplier;

drop table if exists goodsType;

drop table if exists inOutDepot;

drop table if exists inOutDepotDetail;

drop table if exists inOutDepotType;

drop table if exists shops;

drop table if exists spa_account;

/*==============================================================*/
/* Table: goods                                                 */
/*==============================================================*/
create table goods
(
   sid                  integer not null,
   eid                  integer not null,
   id                   int not null auto_increment,
   name                 varchar(50) not null,
   imgUrl               varchar(255),
   no                   varchar(50) not null,
   bar_code             varchar(50) not null,
   type                 int(50) not null,
   company              varchar(50),
   son_type             int(50),
   batch                varchar(50),
   saleprice            double,
   status               char(1) not null,
   unit                 varchar(50),
   spec                 varchar(50),
   num                  double,
   buyingPrice          double,
   costPrice            double,
   preferencePrice      double,
   safetyStock          double,
   excessWarning        double,
   goodsCompanyId       integer,
   supplierId           integer,
   primary key (id)
);

/*==============================================================*/
/* Table: goodsCompany                                          */
/*==============================================================*/
create table goodsCompany
(
   Id                   Integer not null auto_increment comment 'Id',
   sid                  integer not null,
   eid                  integer not null,
   Name                 VARCHAR(50) not null comment '公司名称',
   No                   VARCHAR(50) not null comment '公司编号',
   Status               Char(1) not null comment '状态',
   primary key (Id)
);

alter table goodsCompany comment '产品公司表';

/*==============================================================*/
/* Table: goodsSubType                                          */
/*==============================================================*/
create table goodsSubType
(
   Id                   Integer not null auto_increment comment 'Id',
   SubTypeName          VARCHAR(50) not null comment '子类型名称',
   SubTypeNo            VARCHAR(50) not null comment '子类型编号',
   Status               Char(1) not null comment '0:正常,
            1:停止,
            2:删除',
   sid                  integer not null,
   eid                  integer not null,
   primary key (Id)
);

alter table goodsSubType comment 'goodsSubType产品子类型表';

/*==============================================================*/
/* Table: goodsSupplier                                         */
/*==============================================================*/
create table goodsSupplier
(
   Id                   Integer not null auto_increment comment 'id',
   sid                  integer not null,
   eid                  integer not null,
   Name                 VARCHAR(50) not null comment '供货商名称',
   Address              VARCHAR(50) not null comment '供货商地址',
   Linkman              VARCHAR(50) not null comment '联系人',
   LinkMobile           VARCHAR(50) not null comment '联系方式',
   OtherLinkman         VARCHAR(50) comment '其他联系人',
   OtherLinkMobile      VARCHAR(50) comment '其他联系方式',
   Status               Char(1) not null comment '状态',
   primary key (Id)
);

alter table goodsSupplier comment '产品供货商表';

/*==============================================================*/
/* Table: goodsType                                             */
/*==============================================================*/
create table goodsType
(
   Id                   Integer not null auto_increment comment 'Id',
   TypeName             VARCHAR(50) not null comment '类型名称',
   TypeNo               VARCHAR(50) not null comment '类型编号',
   Status               Char(1) not null comment '0:正常,
            1:停用,
            2:删除',
   sid                  integer not null,
   eid                  integer not null,
   primary key (Id)
);

alter table goodsType comment 'goodsType产品类型表';

/*==============================================================*/
/* Table: inOutDepot                                            */
/*==============================================================*/
create table inOutDepot
(
   Id                   Integer not null auto_increment,
   sid                  integer not null,
   eid                  integer not null,
   inOutDepotTypeName   VARCHAR(50) not null comment '出入库类型名称',
   No                   VARCHAR(50) not null comment '出入库编号',
   inOutDepotTypeNo     VARCHAR(50) not null comment '出入库编号',
   inOutDepotType       Char(1) not null comment '出入库类型',
   Remark               VARCHAR(255) comment '备注',
   CreateDate           Datetime not null comment '创建时间',
   AuditingDate         Datetime comment '审核时间',
   AccountName          VARCHAR(50) comment '审核人',
   AccountId            VARCHAR(50) comment '审核人ID',
   Money                double not null comment '单据金额',
   Status               Char(1) not null comment '0:未审核,
            1:已审核,
            2:删除，
            3:失效',
   primary key (Id)
);

alter table inOutDepot comment 'inOutDepot出库单表';

/*==============================================================*/
/* Table: inOutDepotDetail                                      */
/*==============================================================*/
create table inOutDepotDetail
(
   Id                   Integer not null auto_increment,
   sid                  integer not null,
   eid                  integer not null,
   Name                 VARCHAR(50) not null comment '产品名称',
   No                   VARCHAR(50) not null comment '产品编号',
   Barcode              VARCHAR(50) not null comment '产品条码',
   unit                 VARCHAR(50) comment '个、箱、瓶、包、支',
   spec                 VARCHAR(50) comment '500ml,1.5l',
   Num                  double not null comment '数量',
   Price                double not null comment '单价',
   TotalMoney           double not null comment '小计',
   remark               VARCHAR(255) comment '备注',
   Status               Char(1) not null comment '0:未审核,
            1:已审核,
            2:删除，
            3:失效',
   primary key (Id)
);

alter table inOutDepotDetail comment 'inOutDepotDetail出入库明细表';

/*==============================================================*/
/* Table: inOutDepotType                                        */
/*==============================================================*/
create table inOutDepotType
(
   Id                   Integer not null auto_increment,
   sid                  integer not null,
   eid                  integer not null,
   Name                 VARCHAR(50) not null comment '出入库类型名称',
   No                   VARCHAR(50) not null comment '出入库类型编号',
   type                 Char(1) not null comment '1:出库,
            2:入库',
   Status               Char(1) not null comment '0:正常,
            1:停止,
            2:删除',
   primary key (Id)
);

alter table inOutDepotType comment 'inOutDepotType出入库类型表';

/*==============================================================*/
/* Table: shops                                                 */
/*==============================================================*/
create table shops
(
   Id                   Integer not null auto_increment comment 'Id',
   sid                  integer not null,
   eid                  integer not null,
   Name                 VARCHAR(50) not null comment '公司名称',
   createDate           date not null comment '公司编号',
   Status               Char(1) not null comment '状态',
   endDate              date,
   version              char,
   address              varchar(50) not null,
   shopImg              varchar(50),
   teltphone            varchar(50),
   linkMobile           varchar(50) not null,
   linkMan              varchar(50) not null,
   depotAddress         varchar(50),
   depotPhone           varchar(50),
   primary key (Id)
);

alter table shops comment '企业门店表';

/*==============================================================*/
/* Table: spa_account                                           */
/*==============================================================*/
create table spa_account
(
   id                   integer not null auto_increment,
   name                 varchar(50) not null,
   mobile               varchar(20) not null,
   password             varchar(50) not null,
   role                 char(1),
   status               char(1),
   sid                  integer not null,
   eid                  integer not null,
   primary key (id)
);

alter table spa_account comment '系统用户表';

