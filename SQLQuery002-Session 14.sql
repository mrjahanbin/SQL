--SQL Learning 14

--حذف دیتابیس با چک کردن اینکه دیتابیس وجود داشته باشه
Drop Database if exists SampleDB
go


--ایجاد یک دیتابیس ساده
create database SampleDB
Go
--به کمک CTRL + R  میشه بخش نتیجه رو مخفی کرد

--انتخاب دیتابیس
use SampleDB
go


--مشاهده مشخصات دیتابیس sampleDB
select * from sysfiles 
go
--گفته شده از کد زیر بهتره استفاده کنیم 
--گویا کد بالا منسوخ شده است
select * from sys.database_files
go

exec sp_helpfile
go

--ایجاد جدول
create table students(
FirstName nvarchar(100) NOT NULL,
LastName nvarchar(100) NOT NULL,
Age int NOT NULL)
go




--درج رکورد در جدول
insert into students
VALUES(N'علی',N'تقوی',21),(N'سهیلا',N'کاشفی',22)
GO

--مشاهده رکوردها در جدول
SELECT * FROM students

--مشاهده پیج های تخصیص داده شده به جدول students
DBCC IND('sampleDB','students',1);
GO

--مشاهده محتوای درون پیج
DBCC TRACEON(3604)
DBCC PAGE('sampleDB',1,328,3);
go



-----------------------------------------------------
/*بررسی جزئیات لاگ فایل ها*/
-----------------------------------------------------

DBCC LOG('sampleDB')
GO

--تغییر ریکاوری مدل به حالت sample
ALTER DATABASE sampleDB SET RECOVERY SIMPLE
GO

checkpoint

DBCC LOG('sampleDB')
GO


