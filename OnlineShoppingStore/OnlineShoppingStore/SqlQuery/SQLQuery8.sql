declare @Options nvarchar(max);
set @Options='ASPX View Engine,Razor View Engine,Both A & B,None'
DECLARE @TempTable TABLE ( id int,opt VARCHAR(200))
 select * from split_string(@Options,',')
select * from @TempTable





declare @Options nvarchar(max);
set @Options='ASPX View Engine,Razor View Engine,Both A  B,None'
select * from fn_split_string(@Options,',')