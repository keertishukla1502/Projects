create TYPE OptionTable1 AS TABLE 

(  Id int NOT NULL identity(1,1),options NVARCHAR(100) );
GO


create PROCEDURE [dbo].[spRegisterQuestionList]

@Option OptionTable1 READONLY,
@Text NVARCHAR(100) ,
@CurrectAnswer NVARCHAR(100) 
AS
BEGIN
			  
BEGIN TRAN
              BEGIN TRY
						 DECLARE @Q_Id int;
					   INSERT INTO QuizQuestion (Text, CurrectAnswer) 
					   VALUES(@Text,@CurrectAnswer)
					   set @Q_Id=SCOPE_IDENTITY();  
	 
	                  --insert into OptionTable1 @Option; 


						 While (Select Count(*) From @Option) > 0
					Begin

						 INSERT INTO QuizQuestionOptions (QuestionID, Options) 
					     VALUES(@Q_Id,@Option)

					End

					  
			 COMMIT TRANSACTION


    END TRY
    BEGIN CATCH   
	       
              ROLLBACK TRANSACTION
       END CATCH
END
GO