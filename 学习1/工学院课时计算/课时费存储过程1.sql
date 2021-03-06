USE [zmceshi]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Calculate_Class_Fee]    Script Date: 2017/9/22 10:54:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,工学院导入后计算课时费>
-- =============================================
ALTER PROCEDURE [dbo].[Proc_Calculate_Class_Fee]
	@rows int --最大周数排序号
AS
BEGIN
	
	--*****计算之前先删除
	delete  bb  where 1=1

--***********专职教师
declare @i int,@sqlstr nvarchar(max) ,@sqlstr1 nvarchar(max),@sqlstr2 nvarchar(max) --周序号次数

set @sqlstr1='--1-4周  周序号=1
insert into bb ([岗位类别],[开课单位],[工资号],[姓名],[身份证号],[所属单位],[课时周数],[折合系数课时量],[本次二次分配] ,[累积应发二次分配],
[本次应发],[累计已发],[累计应发],[课时标准],[外聘应发],[累计期末应发],[实发课时费],[周序号])
select [岗位类别],[开课单位],[工资号],[姓名],[身份证号],[所属单位],[课时周数],[折合系数课时量],
      [课时周数]*4 as [本次二次分配],
      [课时周数]*4 as [累积应发二次分配],
      [折合系数课时量]-[课时周数]*4 as [本次应发],
      0 as [累计已发],
      [折合系数课时量]-[课时周数]*4 as [累计应发],
      50 as [课时标准],
      0 as [外聘应发],
      [课时周数]*4*50 as [累计期末应发],
      ([折合系数课时量]-[课时周数]*4)*50  as [实发课时费],
      [周序号]
      from aa where 周序号=1 and [岗位类别]=''专职教师'''

exec (@sqlstr1)	
print @sqlstr1   
set @sqlstr='' 
set @i=2     
while (@i<=@rows)
begin
set @sqlstr='
--周序号='+convert(nvarchar(2),@i)+'
insert into bb ([岗位类别],[开课单位],[工资号],[姓名],[身份证号],[所属单位],[课时周数],[折合系数课时量],[本次二次分配] ,[累积应发二次分配],
[本次应发],[累计已发],[累计应发],[课时标准],[外聘应发],[累计期末应发],[实发课时费],[周序号])
select [岗位类别],[开课单位],[工资号],[姓名],[身份证号],[所属单位],[课时周数],[折合系数课时量]
      ,[本次二次分配],[累积应发二次分配],[本次应发],[累计已发],[累计应发],[课时标准],[外聘应发],[累计期末应发],
      case when ([累计已发]<=96) then [本次应发]*[课时标准]
			when (96<[累计已发] and [累计已发]<=192 and [累计应发]<192) then [本次应发]*[课时标准]*0.8
			when (96<[累计已发] and [累计已发]<=192 and [累计应发]>192) then ([本次应发]-([累计应发]-192))*[课时标准]*0.8 + ([累计应发]-192)*[课时标准]*0.6
			when ([累计已发]>192) then [本次应发]*[课时标准]*0.6
		else 0 end as [实发课时费],
		[周序号]
       from (  
	   select			[岗位类别],[开课单位],[工资号],[姓名],[身份证号],[所属单位],[课时周数],[折合系数课时量],
      [课时周数]*4 as [本次二次分配],
      [累积应发二次分配]=(select sum([课时周数]*4) from aa a where 周序号<='+convert(nvarchar(2),@i)+' and [岗位类别]=''专职教师'' and a.工资号=aa.工资号),
      [折合系数课时量]-[课时周数]*4 as [本次应发],
      [累计已发]=(select sum([折合系数课时量]-[课时周数]*4) from aa a where  周序号<='+convert(nvarchar(2),@i-1)+'  and [岗位类别]=''专职教师'' and a.工资号=aa.工资号),
      [累计应发]=(select sum([折合系数课时量]-[课时周数]*4) from aa a where  周序号<='+convert(nvarchar(2),@i)+' and [岗位类别]=''专职教师'' and a.工资号=aa.工资号),
      50 as [课时标准],
      0 as [外聘应发],
      [累计期末应发]=(select sum([课时周数]*4*50) from aa a where  周序号<='+convert(nvarchar(2),@i)+' and [岗位类别]=''专职教师'' and a.工资号=aa.工资号),
      0 as [实发课时费],
      [周序号]
      from aa where 周序号='+convert(nvarchar(2),@i)+' and [岗位类别]=''专职教师''
      )qwer'
exec (@sqlstr)
print @sqlstr	
set @i=@i+1    
end

--***********外聘教师
set @sqlstr2='--外聘教师
insert into bb ([岗位类别],[开课单位],[工资号],[姓名],[身份证号],[所属单位],[课时周数],[折合系数课时量],[本次二次分配] ,[累积应发二次分配],
[本次应发],[累计已发],[累计应发],[课时标准],[外聘应发],[累计期末应发],[实发课时费],[周序号])
select [岗位类别],[开课单位],[工资号],[姓名],[身份证号],[所属单位],[课时周数],[折合系数课时量],
      0 as [本次二次分配],
      0 as [累积应发二次分配],
      [折合系数课时量] as [本次应发],
      0 as [累计已发],
      0 as [累计应发],
      40 as [课时标准],
      [折合系数课时量]*40 as [外聘应发],
      [折合系数课时量]*40*0.2 as [累计期末应发],
      [折合系数课时量]*40*0.8  as [实发课时费],
      [周序号]
      from aa where  [岗位类别]=''外聘教师'''
exec (@sqlstr2)	
print @sqlstr2   

END
