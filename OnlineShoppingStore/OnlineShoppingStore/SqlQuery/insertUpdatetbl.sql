CREATE PROCEDURE spInsertAspNetUsers
 (
                                          @Name    VARCHAR(100),
                                          @gender    VARCHAR(100),
                                          @salary        int,
                                          @Department          VARCHAR(100),
                                          @email VARCHAR(100),
										  @Password        VARCHAR(100),
                                          @PhoneNumber          VARCHAR(100),
                                          @Address VARCHAR(100)
)
AS
BEGIN
      IF NOT EXISTS(SELECT * FROM tblUser WHERE Email=@email)
        BEGIN
            INSERT INTO tblUser
                        (Name,
                         Gender,
                         Salary,
                         DeptName,
                         Email,
						 Password,
						 PhoneNumber,
						 Address)
            VALUES     ( @Name,
                         @gender,
                         @salary,
                         @Department,
                         @email,
						 @Password,
						 @PhoneNumber,
						 @Address)
        END
    IF EXISTS(SELECT * FROM tblUser WHERE Email=@email)
        BEGIN
            UPDATE tblUser
            SET   
						 Name=@Name,
                         Gender=@gender,
                         Salary=@salary,
                         DeptName=@Department,
                         Email=@email,
						 Password=@Password,
						 PhoneNumber=@PhoneNumber,
						 Address=@Address
			 
            WHERE  Email = @email
        END
      
  END


