--Collation سطوح 
--1: Instance
--2: Database
--3: Field
GO
USE master
GO
--هاCollation استخراج لیست 
SELECT * FROM SYS.fn_helpcollations()
GO
--های پشتیبانی شده برای زبان فارسیCollation
SELECT * FROM SYS.fn_helpcollations()
	WHERE name LIKE 'PERSIAN%'
GO

-----------------------------------------
--هاي مختلفCollationايجاد جدول تستي با 
USE tempdb
GO
CREATE TABLE TestCollation
(
	Name NVARCHAR(50) COLLATE SQL_Latin1_General_CP1256_CI_AS,
	Family NVARCHAR(50) COLLATE Persian_100_CI_AI 
)
GO
/*
CI : Case Insensitive
CS : Case Sensitive
AI : Accent Insensitive
AS : Accent Sensitive
*/
GO
--حساس به حروف کوچک و بزرگCollation تاثیر انتخاب 
CREATE TABLE TB1
(
	F1 INT,
	F2 NVARCHAR(50) COLLATE Persian_100_CS_AI,
	F3 NVARCHAR(50) COLLATE Persian_100_CI_AI
)
GO
--درج چند داده تستی در جدول
INSERT INTO TB1(F1,F2,F3) VALUES (1,'A','A')
INSERT INTO TB1(F1,F2,F3) VALUES (2,'a','a')
INSERT INTO TB1(F1,F2,F3) VALUES (3,'B','B')
INSERT INTO TB1(F1,F2,F3) VALUES (4,'b','b')
INSERT INTO TB1(F1,F2,F3) VALUES (5,'C','C')
INSERT INTO TB1(F1,F2,F3) VALUES (6,'c','c')
GO
SELECT * FROM TB1
GO
SELECT * FROM TB1 WHERE F2='A' --حساس به حروف کوچک و بزرگ
SELECT * FROM TB1 WHERE F3='A' --بدون حساسیت به حروف کوچک و بزرگ
GO
SELECT * FROM TB1 WHERE F2='c' --حساس به حروف کوچک و بزرگ
SELECT * FROM TB1 WHERE F3='c' --بدون حساسیت به حروف کوچک و بزرگ







-----------------------------------------------------
-----------------------------------------------------

--Identity
USE tempdb
GO
CREATE TABLE TestIdentity
(
	ID INT IDENTITY,
	Name NVARCHAR(50) ,
	Family NVARCHAR(50) 
)
GO
INSERT INTO TestIdentity (Name,Family) VALUES (N'فريد',N'طاهري')
INSERT INTO TestIdentity (Name,Family) VALUES (N'مجيد',N'طاهري')
INSERT INTO TestIdentity (Name,Family) VALUES (N'احمد',N'غفاري')
INSERT INTO TestIdentity (Name,Family) VALUES (N'محمد',N'نوري')
GO
SELECT * FROM TestIdentity
GO
--در صورتيكه بخواهيم براي فيلد فوق مقدار وارد كنيم
SET IDENTITY_INSERT TestIdentity ON
GO
INSERT INTO TestIdentity (ID,Name,Family) VALUES (120,N'محمد',N'نوري')
INSERT INTO TestIdentity (ID,Name,Family) VALUES (145,N'محمد',N'نوري')
GO
SET IDENTITY_INSERT TestIdentity OFF
GO
SELECT * FROM TestIdentity
GO
INSERT INTO TestIdentity (Name,Family) VALUES (N'صادق',N'دانشمند')
GO
SELECT * FROM TestIdentity
GO
--را ريست كنيمIdentity در صورتيكه بخواهيم مقدار فيلد
DBCC CHECKIDENT ('TestIdentity', RESEED, 3001);
GO
INSERT INTO TestIdentity (Name,Family) VALUES (N'مجید',N'رادمهر')
GO
SELECT * FROM TestIdentity





--Allow Null
USE tempdb
GO
CREATE TABLE TestNull
(
	ID INT IDENTITY,
	Name NVARCHAR(50) Null, 
	Family NVARCHAR(50) Not Null
)
GO
INSERT INTO TestNull (Name,Family) VALUES (N'فريد',N'طاهري')
INSERT INTO TestNull (Name,Family) VALUES (Null,N'طاهري')
INSERT INTO TestNull (Name,Family) VALUES (N'احمد',Null)
INSERT INTO TestNull (Name,Family) VALUES (Null,Null)
---
SELECT * FROM TestNull 
GO
--براي رشته Nullتست مقدار   
DECLARE @VAR1 NVARCHAR(10)
SET @VAR1=NULL
SELECT @VAR1
SELECT DATALENGTH(@VAR1)
GO
DECLARE @VAR1 NVARCHAR(10)
SET @VAR1=''
SELECT @VAR1
SELECT DATALENGTH(@VAR1)
GO
---
--براي عدد Nullتست مقدار   
DECLARE @VAR1 INT
SET @VAR1=NULL
SELECT @VAR1
SELECT DATALENGTH(@VAR1)
GO
DECLARE @VAR1 INT
SET @VAR1=0
SELECT @VAR1
SELECT DATALENGTH(@VAR1)
GO


--Compunted
-----------------------------------------------------------------
-----------------------------------------------------------------


USE tempdb
GO
--ايجاد جدول با ستون محسابه شده
CREATE TABLE TestCompunted1
(
	Fld1 INT NOT NULL,
	Fld2 INT NOT NULL,
	Fld3 AS (Fld1+Fld2) * 2
)
GO
INSERT INTO TestCompunted1(Fld1,Fld2) VALUES (1,2)
GO
--فرمول مربوط به ازای هر رکورد محاسبه می شود SELECT با اجرای هر بار دستور
SELECT * FROM TestCompunted1 
GO
INSERT INTO TestCompunted1(Fld1,Fld2) VALUES (5,2)
GO
--فرمول مربوط به ازای هر رکورد محاسبه می شود SELECT با اجرای هر بار دستور
SELECT * FROM TestCompunted1
GO
--------------------------
--PERSISTED به شکلComputed Column
CREATE TABLE TestCompunted2
(
	Fld1 INT NOT NULL,
	Fld2 INT NOT NULL,
	Fld3 AS (Fld1+Fld2) * 2 PERSISTED
)
GO
INSERT INTO TestCompunted2(Fld1,Fld2) VALUES (1,2)
INSERT INTO TestCompunted2(Fld1,Fld2) VALUES (5,2)
GO
--نتیجه ذخیره شده نمایش داده می شود SELECT با اجرای هر بار دستور
SELECT * FROM TestCompunted2
GO





----------------------------------------------------
----------------------------------------------------
USE tempdb
GO
CREATE TABLE Employee
	(
	ID INT NULL,
	Name NVARCHAR(50) NULL,
	Family NVARCHAR(50) NULL,
	MahalehTavalod NVARCHAR(50) SPARSE  NULL,
	Tel NVARCHAR(20) SPARSE ,
	Comments NVARCHAR(100) SPARSE NULL
	) 
GO
INSERT Employee(ID,Name,Family,MahalehTavalod,Tel,Comments)
	VALUES (10001,N'محمد',N'احمدي',N'تهران',Null,Null)
GO
INSERT Employee(ID,Name,Family,MahalehTavalod,Tel,Comments) 
	VALUES (10002,N'جليل',N'مرادي',Null,'222434234',Null)
GO
INSERT Employee(ID,Name,Family,MahalehTavalod,Tel,Comments) 
	VALUES (10003,N'فريد',N'طاهري',Null,Null,Null)
GO
INSERT Employee(ID,Name,Family,MahalehTavalod,Tel,Comments)
	VALUES (10004,N'احمد',N'غفاري',Null,Null,Null)
GO
INSERT Employee(ID,Name,Family,MahalehTavalod,Tel,Comments)
	VALUES (10005,N'محمد رضا',N'حسيني',N'اصفهان',Null,Null)
GO
INSERT Employee(ID,Name,Family,MahalehTavalod,Tel,Comments)
	VALUES (10006,N'احمد',N'غفاري',Null,Null,Null)
GO
INSERT Employee(ID,Name,Family,MahalehTavalod,Tel,Comments)
	VALUES (10007,N'كريم',N'شريفي',Null,Null,Null)
GO
INSERT Employee(ID,Name,Family,MahalehTavalod,Tel,Comments)
	VALUES (10008,N'احسان',N'طالبي',Null,Null,Null)
GO
INSERT Employee(ID,Name,Family,MahalehTavalod,Tel,Comments) 
	VALUES (10009,N'رحيم',N'عسگري',Null,Null,Null)
GO
SELECT * FROM Employee
GO
--باعث می شود که در فضای ذخیره سازی صرفه جویی شدهSPARSE COLUMN استفاده از 
--خلاص شود NULL از شر محاسبات اضافی برای فیلدهایی از نوع SQL SERVER و 
