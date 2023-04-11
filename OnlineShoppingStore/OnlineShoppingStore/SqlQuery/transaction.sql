--   exec [Atul].[spTransation]  'Keerti','Female',100000, 'HR', 'KeertiShukla@gmail.com','123456','9691871943','Rewa'

alter PROCEDURE [Atul].[spTransation]  
 (
                                          @Name    VARCHAR(100),
                                          @Gender    VARCHAR(100),
                                          @Salary       int,
                                          @DeptName          VARCHAR(100),
                                          @Email VARCHAR(100),
										  @Password        VARCHAR(100),
                                          @PhoneNumber        VARCHAR(100),
                                          @Address VARCHAR(100)
)
AS
BEGIN
   BEGIN TRAN
              BEGIN TRY
			  
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
										 @Gender,
										 @Salary,
										 @DeptName,
										 @Email,
										 @Password,
										 @PhoneNumber,
										 @Address)
                     END
					 
					 BEGIN
										DECLARE @salt UNIQUEIDENTIFIER=NEWID()
										DECLARE @Id UNIQUEIDENTIFIER=NEWID()

										 INSERT INTO AspNetUsers
										(id,UserName,
										 Email,EmailConfirmed,
										 PhoneNumber,PhoneNumberConfirmed,
										 PasswordHash,TwoFactorEnabled,LockoutEnabled,AccessFailedCount)
							VALUES     ( @Id,@Name,
										 @Email,'0',
										
										 @PhoneNumber,'0',
										 PWDENCRYPT ( @Password) 
										 --HASHBYTES('SHA2_512', 'Kee@123456')
										-- HASHBYTES('SHA2_512', '123456'+CAST(@salt AS NVARCHAR(36)))
										 ,'0','1','0'
                                        )
					END
						
				 Select 'Inserted SuccessFully' as Msg 			  
              COMMIT TRANSACTION

       END TRY
       BEGIN CATCH   
	   Select 'Somthing Wrong' as ErrorMsg        
              ROLLBACK TRANSACTION
       END CATCH
      
  END
