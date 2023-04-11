--CREATE TYPE RTableType AS TABLE(Id int, NAME VARCHAR )
CREATE TYPE TableType AS TABLE(Id int NOT NULL identity(1,1), NAME VARCHAR )
go

CREATE PROCEDURE Rproc @Rtable RTABLETYPE READONLY,
                       @id     INT
AS
  BEGIN
      SELECT *
      FROM   @Rtable
      WHERE  ID = @id
  END

go


alter PROCEDURE RprocList @Rtable TableType READONLY,
                      @Text NVARCHAR(100) ,
					@CurrectAnswer NVARCHAR(100)
AS
  BEGIN
     
      BEGIN TRY
			  BEGIN TRAN
						 DECLARE @Q_Id int;
					   INSERT INTO QuizQuestion (Text, CurrectAnswer) 
					   VALUES(@Text,@CurrectAnswer)
					   set @Q_Id=SCOPE_IDENTITY();  
	 
	                  --insert into OptionTable1 @Option; 

					  DECLARE @Listid int;
					  set @Listid=1;
						 While (@Listid <=(select Count(*) from @Rtable))
					Begin
					 
						 INSERT INTO QuizQuestionOptions (QuestionID, Options) 
					     VALUES(@Q_Id,(select NAME from @Rtable where id=@Listid))
						set @Listid=@Listid+1;
					End

					  
			 COMMIT TRANSACTION


    END TRY
    BEGIN CATCH   
	       
              ROLLBACK TRANSACTION
       END CATCH
  END

go


DECLARE @Rtable TableType


INSERT INTO @Rtable
VALUES      ('Result filters'),
            ('Action filters'),
			('Authorization filters'),
			('All of these')

EXEC RprocList
  @Rtable,'What are the various types of filters in an ASP.NET MVC application','All of these'



  select * from QuizQuestion
select * from QuizQuestionOptions

