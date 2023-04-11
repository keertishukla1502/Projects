Create FUNCTION [dbo].[fn_split_string]
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





DECLARE @ID NVARCHAR(300)= 'abc,d,e,f,g';
select id from fn_split_string(@ID,',')

-- If you need exactly string_split functionality (without id column):
select value from fn_split_string(@ID,',')