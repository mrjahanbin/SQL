--SQL Learning 16

USE SampleDB

--ایجاد جدول
CREATE TABLE tbl1
(
code INT NOT NULL,
family NVARCHAR(100 ) NULL
)
GO

--مشاهده مشخصات جدول
EXEC sp_help @objname = 'tbl1'
GO

--درج رکورد در جدول
INSERT INTO dbo.tbl1(code,family)
VALUES(1,N'صابری'),(2,N'x')
go

--مشاهده رکوردها در جدول
SELECT * FROM dbo.tbl1
GO


--ایجاد جدول
CREATE TABLE tbl2
(
code INT IDENTITY(1,1) NOT NULL,
family VARCHAR(100 ) NULL
)
GO

--درج رکورد در جدول
INSERT INTO dbo.tbl2(code,family)
VALUES(1,N'صابری'),(2,N'x')
go

--مشاهده رکوردها در جدول
SELECT * FROM dbo.tbl2
GO

--اصلاح نوع داده یک فیلد
ALTER TABLE dbo.tbl2
ALTER COLUMN family NVARCHAR(10)

--اضاف کردن فیلد به جدول
ALTER TABLE dbo.tbl2
ADD country NVARCHAR(50) NULL,
city NVARCHAR(50)NULL
go


