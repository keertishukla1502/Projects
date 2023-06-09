USE [delete2]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_split_string]    Script Date: 9/28/2021 11:51:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[fn_split_string]
(
    @string    nvarchar(max),
    @delimiter nvarchar(max)
)

RETURNS TABLE AS RETURN
(
    SELECT 
      
        Split.a.value('let $n := . return count(../*[. << $n]) + 1', 'int') AS id
      , Split.a.value('.', 'NVARCHAR(MAX)')                                 AS value
    FROM
    (
        SELECT CAST('<X>'+REPLACE(@string, @delimiter, '</X><X>')+'</X>' AS XML) AS String
    ) AS a
    CROSS APPLY String.nodes('/X') AS Split(a)
)



--  declare @Options nvarchar(max);
--  set @Options ='A,B,C,D,E';
--  select * from fn_split_string(@Options,',')


-- select @@VERSION