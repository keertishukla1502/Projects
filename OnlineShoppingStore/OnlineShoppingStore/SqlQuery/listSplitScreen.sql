--ALTER DATABASE delete2 SET COMPATIBILITY_LEVEL = 130

alter PROCEDURE [dbo].[spRegisterQuestion]
@Text NVARCHAR(1000) ,
@CurrectAnswer NVARCHAR(100) ,
@Options  NVARCHAR(MAX)
AS
BEGIN
			  
BEGIN TRAN
              BEGIN TRY
			      begin
						 DECLARE @Q_Id int;
					     INSERT INTO Atul.QuizQuestion (Text, CurrectAnswer) 
					     VALUES(@Text,@CurrectAnswer)
					     set @Q_Id=SCOPE_IDENTITY();  
	              end
	              Begin 
				       DECLARE @TempTable TABLE ( id int,opt VARCHAR(200))
				       insert into @TempTable select * from Atul.split_string(@Options,','); 


								
									DECLARE @idOption int=1;
									DECLARE @OptionValue NVARCHAR(100);
								
					   				 While (@idOption <=(select Count(*) from @TempTable))
								Begin
								    set @OptionValue=(select opt from @TempTable where id=@idOption); 

									INSERT INTO Atul.QuizQuestionOptions (QuestionID, Options) 
					                VALUES(@Q_Id,@OptionValue)

								    set @idOption=@idOption+1;

									 

								End
					
			       End

			             COMMIT TRANSACTION

              END TRY
    BEGIN CATCH   
	     
           ROLLBACK TRANSACTION
       END CATCH
END
GO

select * from QuizQuestion
select * from QuizQuestionOptions

--  exec spRegisterQuestion ' Which is more faster between ASPX View Engine and Razor View Engine','ASPX View Engine','ASPX View Engine,Razor View Engine,Both A & B,None'