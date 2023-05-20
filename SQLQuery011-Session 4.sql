USE tempdb
GO
----ايجاد جدول
CREATE TABLE TEST01
(
	CODE INT,
	NAME NVARCHAR(20),
	FAMILY NVARCHAR(20)
)
GO
--مشاهده ساختار جدول
SP_HELP 'TEST01'
GO
----اضافه شدن فيلد نمره درس رياضي به جدول
ALTER TABLE TEST01 
ADD MATH REAL
GO
--مشاهده ساختار جدول
SP_HELP 'TEST01'
----اضافه شدن نمره هاي درس فيزيك و هنر به جدول
ALTER TABLE TEST01 
ADD 
PHYSIC REAL,
ART REAL
GO
--مشاهده ساختار جدول
SP_HELP 'TEST01'
GO
----اضافه شدن فيلد معدل كه شامل معدل سه درس  رياضي فيزيك و هنر 	
ALTER TABLE TEST01 
ADD [AVG] AS ((MATH+PHYSIC+ART)/3) PERSISTED
GO
--مشاهده ساختار جدول
SP_HELP 'TEST01'
GO
----درج ركورد در جدول
INSERT INTO Test01 
(
CODE,NAME,FAMILY,MATH,PHYSIC,ART
)
VALUES 
(
12,N'ALI',N'ANSARI',10,13,15
)
INSERT INTO Test01 (CODE,NAME,FAMILY,MATH,PHYSIC,ART) VALUES (12,N'AHMAD',N'ANSARI',12,11,13)
GO
SELECT * FROM Test01
GO





----تغيير نوع  فيلدهاي جدول
USE tempdb
GO
SP_HELP 'TEST01'
GO
ALTER TABLE TEST01 ALTER COLUMN NAME NVARCHAR(100) COLLATE PERSIAN_100_CS_AI  
ALTER TABLE TEST01 ALTER COLUMN FAMILY NVARCHAR(100) COLLATE PERSIAN_100_CS_AI
GO
SP_HELP 'TEST01'




--------------------------------------------
--------------------------------------------

USE tempdb
GO
SP_HELP 'TEST01'
GO
--حذف فیلدهای یک جدول
ALTER TABLE TEST01 DROP COLUMN NAME 
ALTER TABLE TEST01 DROP COLUMN FAMILY
GO
SP_HELP 'TEST01'
GO
--مورد استفاده قرار گرفته استComputed Column حذف فیلدی که در فرمول
ALTER TABLE TEST01 DROP COLUMN PHYSIC





-------------------------------
-------------------------------
USE tempdb
GO
----حذف جدول
DROP TABLE TEST01
GO

