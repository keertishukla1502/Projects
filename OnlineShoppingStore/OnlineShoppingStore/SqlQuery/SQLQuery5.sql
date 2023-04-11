
CREATE PROCEDURE spselectByIDAspNetUsers
(  @id    int)
AS
 BEGIN
            select *from  tblUser
            WHERE  id = @id
        END
