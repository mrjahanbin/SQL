--SQL Learning 13

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

--حذف دیتابیس با چک کردن اینکه دیتابیس وجود داشته باشه
Drop Database if exists SampleDB
go

--ایجاد یک دیتابیس با چندین فایل به همراه تنظیمات اولیه
create database sampleDB
on
(name=smp01,filename='c:\temp\sampleData1.mdf',size=10mb,maxsize=100,filegrowth=20mb),
(name=smp02,filename='c:\temp\sampleData2.mdf',size=15mb,maxsize=100,filegrowth=20%),
(name=smp03,filename='c:\temp\sampleData3.mdf',size=20mb,maxsize=unlimited,filegrowth=20)
log On
(name=smpL1,filename='c:\temp\sampLog1.mdf',size=100mb,maxsize=100,filegrowth=20),
(name=smpL2,filename='c:\temp\sampLog2.mdf',size=50mb,maxsize=100,filegrowth=20)
Go


--اضافه کردن یک Data File به کمک دیتابیس
alter database sampleDB
add file
(name=smp4,filename='c:\temp\sampleData4.mdf',size=10mb,maxsize=200,filegrowth=20mb)
go

--اضافه کردن یک Log File به کمک دیتابیس
alter database sampleDB
add log file
(name=smpL3,filename='c:\temp\sampLog3.mdf',size=50mb,maxsize=100,filegrowth=20)
go


--------------------------------------------------
/*مبحث دیتابیس و فایل گروه ها*/
--------------------------------------------------

use sampleDB
go

Drop database if exists sampleDB
go

create database sampleDB
on primary (name=smpD1,filename='c:\temp\sampleData1.mdf',size=10mb,maxsize=100,filegrowth=20mb),
 filegroup fg1(name=smpD2,filename='c:\temp\sampleData2.mdf',size=15mb,maxsize=100,filegrowth=20%)
log On
(name=smpL1,filename='c:\temp\sampLog1.mdf',size=100mb,maxsize=100,filegrowth=20)
Go

select * from sys.filegroups


alter database sampleDB
add file
(name=smp3,filename='c:\temp\sampleData3.mdf',size=10mb,maxsize=200,filegrowth=20mb) to filegroup fg1
go

--تغییر file Group پیشفرض
Alter database sampledb
modify filegroup fg1 default
go

--تغییر وضعیت file Group به حالت فقط خواندنی
alter database sampledb
modify filegroup fg1 read_only
go

--تغییر وضعیت file Group به حالت عادی
alter database sampledb
modify filegroup fg1 read_write
go