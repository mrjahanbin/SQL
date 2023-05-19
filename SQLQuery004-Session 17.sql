--SQL Learning 17

USE SampleDB
GO

/*
Constraintاضاف کردن
به فیلد

DontNull = اسم اون 
Constraint
هستش که میخواد ذخیره بشه
*/
ALTER TABLE  students --میگیم میخوایم جدول رو تغییر بدیم
ADD CONSTRAINT DontNull --یک محدودیت جدید بساز و اسمش رو بهش دادیم
DEFAULT (N'No') FOR LastName --توی این محدودیت بیا و برامون حالت دیفالت لست نیم رو به  مقداری که بهت گفتیم پر کن
GO



/*
DEFAULT CONSTRAINT
*/

USE master
GO
-- بررسی جهت وجود دیتابیس و حذف آن 
DROP DATABASE IF EXISTS sampleDB
GO

-- ایجاد دیتابیس
CREATE DATABASE sampleDB 
GO

USE sampleDB;
GO

-- ایجاد جدول
CREATE TABLE students
(
	nationalCode INT CONSTRAINT myConst1 DEFAULT 0,
	family NVARCHAR(100) NOT NULL,
	medical_status NVARCHAR(100) CONSTRAINT myConst2 DEFAULT N'ندارد',	
	BLOOD_GROUP NVARCHAR(100) CONSTRAINT myConst3 DEFAULT N'OOOOO'
)
GO

-- درج رکورد در جدول
INSERT INTO students (family)
	values (N'احمدی'),(N'راد'),(N'سعیدی')
GO

-- مشاهده رکوردها در جدول
SELECT * FROM students
GO

-- های جدولCONSTRAINT مشاهده
sp_helpCONSTRAINT 'students'
GO

/*
در زمان اضافه کردن فیلد جدید به جدول موجودDEFAULT CONSTRAINT اعمال
در این حالت میبینیم که اگر 
WITH VALUES
داشته باشه مقادیر قدیمی رو هم پر میکنه اگر نداشته باشه نال در نظر میگیره

*/
-- WITH VALUES با استفاده از
ALTER TABLE students
	ADD code1 INT DEFAULT 100000  WITH VALUES
GO

-- مشاهده رکوردها در جدول
SELECT * FROM STUDENTS
GO

-- WITH VALUES بدون استفاده از
ALTER TABLE students
	ADD code2 INT DEFAULT 200000
GO

/*
CONSTRAINT حذف
*/

ALTER TABLE students
	DROP CONSTRAINT myConst1
GO