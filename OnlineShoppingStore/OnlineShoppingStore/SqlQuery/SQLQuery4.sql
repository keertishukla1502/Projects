
CREATE PROCEDURE spDeleteAspNetUsers
(  @id    int)
AS
 BEGIN
            DELETE FROM tblUser
            WHERE  id = @id
        END
