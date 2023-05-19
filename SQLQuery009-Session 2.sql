USE tempdb
GO
--tempdb در صورتیکه یک جدول در بانک اطلاعاتی
--شدن سرور اطلاعات جدول پاک خواهد شدReset ایجاد شود پس از 
GO
--PhoneBookايجاد جدول 
CREATE TABLE PhoneBook
(
	Code INT,
	FName NVARCHAR(30),
	LName NVARCHAR(60),
	Tel NVARCHAR(30)
)
GO



-------------------------------------
-------------------------------------
--ايجاد جدول دانشجويان
USE tempdb
GO
--Studentsايجاد جدول 
CREATE TABLE Students
(
	Code INT,
	FName NVARCHAR(30),
	LName NVARCHAR(60),
	BDate DATETIME2,
	EDate DATETIME2,
	Pic VARBINARY(MAX)
)
GO