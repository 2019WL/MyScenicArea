create table TStaff --员工表
(
Id int primary key identity,--主键
Account varchar(16) not null,
Pwd varchar(64) not null,--密码  进行MD5加密处理
Name nvarchar(20) not null,--名称
mobile varchar(20),--移动电话
email varchar(64), --电子邮箱
LoginTime datetime, --登陆时间
LastLoginTime datetime, -- 最后登陆时间
LoginCount bigint default 0 not null, --登陆次数
CreateTime datetime not null,--创建时间
LastModifyTime datetime,--最后修改时间
CreateId int not null,--创建者
LastModifierId int default 0 not null,--最后修改者
Status int default 0 not null,--业务状态
IsEnable bit default 1 not null --是否有效 默认有效
)

create table TRole --角色表(部门)
(
Id int primary key identity,--主键
ParentId int default 0 not null,--父级id
Name nvarchar(20) not null, --名称
Description nvarchar(200), --描述
CreateTime datetime not null,--创建时间
LastModifyTime datetime,--最后修改时间
CreateId int not null,--创建者
LastModifierId int default 0 not null,--最后修改者
Status int default 0 not null,--业务状态
IsEnable bit default 1 not null--是否有效 默认有效
)

create table TPermission --权限表
(
Id int primary key identity,--主键
ParentId int default 0 not null,--父级id
Name nvarchar(20) not null, --名称
Description nvarchar(200), --描述
CreateTime datetime not null,--创建时间
LastModifyTime datetime,--最后修改时间
CreateId int not null,--创建者
LastModifierId int default 0 not null,--最后修改者
Status int default 0 not null,--业务状态
IsEnable bit default 1 not null--是否有效 默认有效
)

create table TGroup --组表
(
Id int primary key identity,--主键
ParentId int default 0 not null,--父级id
Name nvarchar(20) not null, --名称
Description nvarchar(200), --描述
CreateTime datetime not null,--创建时间
LastModifyTime datetime,--最后修改时间
CreateId int not null,--创建者
LastModifierId int default 0 not null,--最后修改者
Status int default 0 not null,--业务状态
IsEnable bit default 1 not null--是否有效 默认有效
)

create table TRolePermissionRelation --(角色<->权限)关系映射表
(
Id int primary key identity,--主键
RoleId int not null,--外键 角色
PermissionId int not null,--外键 权限
PermissionType int not null--（0:可访问，1:可授权）
)
create table TGroupPermissionRelation --(组<->权限)关系映射表
(
Id int primary key identity,--主键
GroupId int not null,--外键 组
PermissionId int not null,--外键 权限
PermissionType int not null--（0:可访问，1:可授权）
)
create table TGroupRoleRelation--(组<->角色)关系映射表
(
Id int primary key identity,--主键
GroupId int not null,--外键 组
RoleId int not null,--外键 角色
)
create table TStaffPermissionRelation --(员工<->权限)关系映射表
(
Id int primary key identity,--主键
StaffId int not null,--外键 角色
PermissionId int not null,--外键 权限
PermissionType int not null--（0:可访问，1:可授权）
)

create table TStaffRoleRelation --(员工<->角色)关系映射表
(
Id int primary key identity,--主键
StaffId int not null,--外键 员工
RoleId int not null,--外键 角色
)
create table TStaffGroupRelation --(员工<->组) 关系映射表
(
Id int primary key identity,--主键
StaffId int not null,--外键 员工
GroupId int not null,--外键 组
)
create table SysLogSetting --日志设置
(
Id int primary key identity, --主键
BusinessName nvarchar(50),--业务名
TableName nvarchar(50),--表名
)
create table SysLogOperation --系统操作日志
(
Id bigint primary key identity,--主键
LSId int not null,--外键 日志设置
PrimaryKey varchar(50) not null, --操作表主键
Type varchar(8) not null,--操作类型 (添加ADD,删除DELETE,修改UPDATE)
OperationId int not null,--操作者
OperationTime datetime not null --操作时间
)
create table SysLogOperationDetail --系统操作内容详情
(
Id bigint primary key identity,--主键
LOId bigint not null,--外键 系统操作日志
Field varchar(50) not null,--表字段
FieldName nvarchar(50) not null,--表字段名（中文）
OldValue varchar(200) not null,--旧值
NewValue Varchar(200) not null--新值
)
create table TScenicArea --景区
(
Id int primary key identity,--主键
Name nvarchar(20) not null,--景区名称

CreateTime datetime not null,--创建时间
LastModifyTime datetime,--最后修改时间
CreateId int not null,--创建者
LastModifierId int default 0 not null,--最后修改者
Status int default 0 not null,--业务状态
IsEnable bit default 1 not null--是否有效 默认有效
) 
create table TScenicSpot --景点
(
Id int primary key identity,--主键
ScenicAreaId int not null, --外键 景区
Name nvarchar(20) not null,--景点名称

CreateTime datetime not null,--创建时间
LastModifyTime datetime,--最后修改时间
CreateId int not null,--创建者
LastModifierId int default 0 not null,--最后修改者
Status int default 0 not null,--业务状态
IsEnable bit default 1 not null--是否有效 默认有效
) 
Create table TScenicSpotProduct --景点游玩项目表(景点里面包含的项目)
(
Id int primary key identity,--主键
ScenicSpotId int not null,--外键 景点
Name nvarchar(30) not null,--项目名称

CreateTime datetime not null,--创建时间
LastModifyTime datetime,--最后修改时间
CreateId int not null,--创建者
LastModifierId int default 0 not null,--最后修改者
Status int default 0 not null,--业务状态
IsEnable bit default 1 not null--是否有效 默认有效
)
create table TScenicAreaTicket --景区门票
(
Id int primary key identity,--主键
Name nvarchar(30) not null,--名称
SSPId int not null,--外键 景点游玩项目表
CreateTime datetime not null,--创建时间
LastModifyTime datetime,--最后修改时间
CreateId int not null,--创建者
LastModifierId int default 0 not null,--最后修改者
Status int default 0 not null,--业务状态
IsEnable bit default 1 not null--是否有效 默认有效
)

create table TTicketBank --票库
(
Id int primary key identity,--主键
Name nvarchar(20) not null,--票库名 标识
StartTicketNumber bigint not null, --开始票号
EndTicketNumber bigint not null--结束票号 
)

create table TTicketSection --票段
(
Id int primary key identity,--主键
TicketBankId int not null,--外键 票库
StaffId int not null,--外键 员工
StartTicketNumber bigint not null, --开始票号
EndTicketNumber bigint not null,--结束票号
CurrentTicketNumber bigint not null--当前票号
)
create table TOrder -- 订单表(按日期（月）分表)
(
OrderNumber varchar(50) not null
)

create table TOrderDetails --订单详情(按日期（月）分表)
(
Id int primary key identity,
OrderNumber varchar(50) not null
)

create table TCancelOrder --取消退款订单表（按日期（月）分表）
(
Id int primary key identity,
OrderNumber varchar(50) not null,
OrderDetailsId int not null 
)

create table TCheckingTicket --校验订单门票表(按日期（月）分表)
(
Id int primary key identity,
OrderNumber varchar(50) not null,
OrderDetailsId int not null 
)

create table TWriteOffOrder --核销订单门票表(按日期（月）分表)
(
Id int primary key identity,
OrderNumber varchar(50) not null,
OrderDetailsId int not null 
)

create table OrderStatisticsDay --订单统计（按天生成一条数据，并按日期（年）分表）
(
Id int primary key identity
)

create table OrderStatisticsMonth --订单统计（按月生成一条数据）
(
Id int primary key identity
)

create table OrderStatisticsYear --订单统计(按年生成一条数据)
(
Id int primary key identity
)

