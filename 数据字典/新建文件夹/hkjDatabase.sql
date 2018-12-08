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
   Name                 VARCHAR(50) not null comment '��˾����',
   No                   VARCHAR(50) not null comment '��˾���',
   Status               Char(1) not null comment '״̬',
   primary key (Id)
);

alter table goodsCompany comment '��Ʒ��˾��';

/*==============================================================*/
/* Table: goodsSubType                                          */
/*==============================================================*/
create table goodsSubType
(
   Id                   Integer not null auto_increment comment 'Id',
   SubTypeName          VARCHAR(50) not null comment '����������',
   SubTypeNo            VARCHAR(50) not null comment '�����ͱ��',
   Status               Char(1) not null comment '0:����,
            1:ֹͣ,
            2:ɾ��',
   sid                  integer not null,
   eid                  integer not null,
   primary key (Id)
);

alter table goodsSubType comment 'goodsSubType��Ʒ�����ͱ�';

/*==============================================================*/
/* Table: goodsSupplier                                         */
/*==============================================================*/
create table goodsSupplier
(
   Id                   Integer not null auto_increment comment 'id',
   sid                  integer not null,
   eid                  integer not null,
   Name                 VARCHAR(50) not null comment '����������',
   Address              VARCHAR(50) not null comment '�����̵�ַ',
   Linkman              VARCHAR(50) not null comment '��ϵ��',
   LinkMobile           VARCHAR(50) not null comment '��ϵ��ʽ',
   OtherLinkman         VARCHAR(50) comment '������ϵ��',
   OtherLinkMobile      VARCHAR(50) comment '������ϵ��ʽ',
   Status               Char(1) not null comment '״̬',
   primary key (Id)
);

alter table goodsSupplier comment '��Ʒ�����̱�';

/*==============================================================*/
/* Table: goodsType                                             */
/*==============================================================*/
create table goodsType
(
   Id                   Integer not null auto_increment comment 'Id',
   TypeName             VARCHAR(50) not null comment '��������',
   TypeNo               VARCHAR(50) not null comment '���ͱ��',
   Status               Char(1) not null comment '0:����,
            1:ͣ��,
            2:ɾ��',
   sid                  integer not null,
   eid                  integer not null,
   primary key (Id)
);

alter table goodsType comment 'goodsType��Ʒ���ͱ�';

/*==============================================================*/
/* Table: inOutDepot                                            */
/*==============================================================*/
create table inOutDepot
(
   Id                   Integer not null auto_increment,
   sid                  integer not null,
   eid                  integer not null,
   inOutDepotTypeName   VARCHAR(50) not null comment '�������������',
   No                   VARCHAR(50) not null comment '�������',
   inOutDepotTypeNo     VARCHAR(50) not null comment '�������',
   inOutDepotType       Char(1) not null comment '���������',
   Remark               VARCHAR(255) comment '��ע',
   CreateDate           Datetime not null comment '����ʱ��',
   AuditingDate         Datetime comment '���ʱ��',
   AccountName          VARCHAR(50) comment '�����',
   AccountId            VARCHAR(50) comment '�����ID',
   Money                double not null comment '���ݽ��',
   Status               Char(1) not null comment '0:δ���,
            1:�����,
            2:ɾ����
            3:ʧЧ',
   primary key (Id)
);

alter table inOutDepot comment 'inOutDepot���ⵥ��';

/*==============================================================*/
/* Table: inOutDepotDetail                                      */
/*==============================================================*/
create table inOutDepotDetail
(
   Id                   Integer not null auto_increment,
   sid                  integer not null,
   eid                  integer not null,
   Name                 VARCHAR(50) not null comment '��Ʒ����',
   No                   VARCHAR(50) not null comment '��Ʒ���',
   Barcode              VARCHAR(50) not null comment '��Ʒ����',
   unit                 VARCHAR(50) comment '�����䡢ƿ������֧',
   spec                 VARCHAR(50) comment '500ml,1.5l',
   Num                  double not null comment '����',
   Price                double not null comment '����',
   TotalMoney           double not null comment 'С��',
   remark               VARCHAR(255) comment '��ע',
   Status               Char(1) not null comment '0:δ���,
            1:�����,
            2:ɾ����
            3:ʧЧ',
   primary key (Id)
);

alter table inOutDepotDetail comment 'inOutDepotDetail�������ϸ��';

/*==============================================================*/
/* Table: inOutDepotType                                        */
/*==============================================================*/
create table inOutDepotType
(
   Id                   Integer not null auto_increment,
   sid                  integer not null,
   eid                  integer not null,
   Name                 VARCHAR(50) not null comment '�������������',
   No                   VARCHAR(50) not null comment '��������ͱ��',
   type                 Char(1) not null comment '1:����,
            2:���',
   Status               Char(1) not null comment '0:����,
            1:ֹͣ,
            2:ɾ��',
   primary key (Id)
);

alter table inOutDepotType comment 'inOutDepotType��������ͱ�';

/*==============================================================*/
/* Table: shops                                                 */
/*==============================================================*/
create table shops
(
   Id                   Integer not null auto_increment comment 'Id',
   sid                  integer not null,
   eid                  integer not null,
   Name                 VARCHAR(50) not null comment '��˾����',
   createDate           date not null comment '��˾���',
   Status               Char(1) not null comment '״̬',
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

alter table shops comment '��ҵ�ŵ��';

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

alter table spa_account comment 'ϵͳ�û���';

