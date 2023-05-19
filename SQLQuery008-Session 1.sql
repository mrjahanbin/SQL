USE master
GO
--SQL Server استخراج اطلاعاتي درباره انواع داده هاي موجود در 
SELECT * FROM sys.types
GO
--نوع داده عددي دقيق دقيقا همان مقداري را كه به آن نسبت مي دهيد ذخيره مي كند
DECLARE @VAR1 SMALLMONEY
SET @VAR1=12345.1234
SELECT @VAR1
--نمایش طول متغییر به بایت
SELECT DATALENGTH(@VAR1)
GO
--
DECLARE @VAR2 SMALLMONEY
SET @VAR2=1678.8734
SELECT @VAR2
SELECT DATALENGTH(@VAR2)
GO
--
--تعريف يك متغيير با حداكثر كل 3 رقم 
--یک رقم از کل ارقام اعشاری است
DECLARE @VAR3 DECIMAL(3,1)
SET @VAR3=75.2
SELECT @VAR3
SELECT DATALENGTH(@VAR3)
GO

--خطا
DECLARE @VAR3 DECIMAL(3,1)
SET @VAR3=750.0
SELECT @VAR3
SELECT DATALENGTH(@VAR3)
GO
--
--تعريف يك متغيير با حداكثر كل 3 رقم 
--یک رقم از کل ارقام اعشاری است
DECLARE @VAR3 DECIMAL(3,1)
SET @VAR3=99.9
SELECT @VAR3
SELECT DATALENGTH(@VAR3)
GO
--تعريف يك متغيير با حداكثر كل هشت رقم 
--سه رقم از کل ارقام اعشاری است
DECLARE @VAR1 DECIMAL(8,3)
SET @VAR1=12345.123
SELECT @VAR1
SELECT DATALENGTH(@VAR1)
GO
--اعشار 4 رو حذف میکنه
DECLARE @VAR1 DECIMAL(8,3)
SET @VAR1=12345.1234
SELECT @VAR1
SELECT DATALENGTH(@VAR1)
GO
--
--تعريف يك متغيير با حداكثر كل هشت رقم 
--سه رقم از کل ارقام اعشاری است
--خطا
DECLARE @VAR1 DECIMAL(8,3)
SET @VAR1=123456.123
SELECT @VAR1
SELECT DATALENGTH(@VAR1)
GO

--نوع داده تقریبی

USE master
GO
--نوع داده عددي تقريبي مقداري تقريبي از عددي را كه به آن نسبت مي دهيد ذخيره مي كند
DECLARE @VAR1 REAL
SET @VAR1=1223535324.0
SELECT @VAR1
SELECT DATALENGTH(@VAR1)
GO
--------------------------------
--FLOAT(n)
-- 1 ≤ n ≤ 24  = 4 Byte
-- 25 ≤ n ≤ 53 = 8 Byte
DECLARE @VAR2 FLOAT(32)
SET @VAR2=34634234626324623.201
SELECT @VAR2
SELECT DATALENGTH(@VAR2)
GO


--متغییرهای کاراکتری
USE master
GO
-----------------------------------------
--داده هاي كاركتري با طول ثابت
DECLARE @VAR1 CHAR(15)
SET @VAR1='ABCDE'
SELECT @VAR1
SELECT DATALENGTH(@VAR1)
GO
         
-----------------------------------------
--داده هاي كاركتري با طول متغيير
DECLARE @VAR1 VARCHAR(15)
SET @VAR1='ABCDE'
SELECT @VAR1
SELECT DATALENGTH(@VAR1)
GO

--داده هاي كاركتري با طول متغيير
DECLARE @VAR1 NVARCHAR(15)
SET @VAR1='ABCDE'
SELECT @VAR1
SELECT DATALENGTH(@VAR1)
GO


--Data TIME
-----------------------------------------
-- در نوع داده تاريخ و زمانFSPبررسي تاثير   
DECLARE @VAR1 DATETIME2(3)
SET @VAR1='2008-11-6 3:45:57.14435'
SELECT @VAR1
SELECT DATALENGTH(@VAR1)
GO
-----------------------------------------
--DATETIMEOFFSETبررسي نوع داده  
DECLARE @VAR1 DATETIMEOFFSET(2)
SET @VAR1='2008-11-6 3:45:57.14 +3:30'
SELECT @VAR1
SELECT DATALENGTH(@VAR1)
GO


--VarBinary و Binary
-----------------------------------------
--VarBinary و Binary تفاوت نوع داده    
DECLARE @VAR1 BINARY(10)
SET @VAR1=0x123
SELECT @VAR1
SELECT DATALENGTH(@VAR1)
GO
DECLARE @VAR1 VARBINARY(10)
SET @VAR1=0x123
SELECT @VAR1
SELECT DATALENGTH(@VAR1)
GO
-----------------------------------------



--XML بررسي نوع داده    
DECLARE @Var1 XML
SET @Var1=
	'<CustomerInfo>
	 <Customers CustomerID="ALFKI" Country="Germany"></Customers>
	 <Customers CustomerID="AROUT" Country="UK"></Customers>
	 </CustomerInfo>'
SELECT @Var1
SELECT DATALENGTH(@VAR1)
GO




-----------------------------------------
--SQL_VARIANT بررسي نوع داده    
DECLARE @Var1 SQL_VARIANT
SET @Var1=123
SELECT @Var1
SELECT DATALENGTH(@VAR1)--طول متغيير بستگی به داده موجود در متغییر دارد
GO
--
DECLARE @Var1 SQL_VARIANT
SET @Var1=0x1faaad23
SELECT @Var1
SELECT DATALENGTH(@VAR1)--طول متغيير بستگی به داده موجود در متغییر دارد
GO
--
DECLARE @Var1 SQL_VARIANT
SET @Var1=123.09
SELECT @Var1
SELECT DATALENGTH(@VAR1)--طول متغيير بستگی به داده موجود در متغییر دارد
GO
--
DECLARE @Var1 SQL_VARIANT
SET @Var1='2008-11-6 3:45:57.14435'
SELECT @Var1
SELECT DATALENGTH(@VAR1)--طول متغيير بستگی به داده موجود در متغییر دارد
GO


-----------------------------------------
--UNIQUEIDENTIFIER بررسي نوع داده    
DECLARE @Var1 UNIQUEIDENTIFIER
SET @Var1=NEWID()
SELECT @Var1
SELECT DATALENGTH(@VAR1)
GO