CREATE TABLE QuizQuestion  
(  
     [QuestionID] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,  
     [Text] [varchar](500) NULL,  
     [CurrectAnswer] [varchar](100) NULL,  
     
)  



CREATE TABLE QuizQuestionOptions 
(  
     [OptionId] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL, 
	 [QuestionID] int FOREIGN KEY REFERENCES QuizQuestion(QuestionID), 
     [Options] [varchar](100) NULL,     
)  

select * from QuizQuestion
select * from QuizQuestionOptions


INSERT INTO QuizQuestion (Text, CurrectAnswer)
VALUES ('what is the disadvantages of MVC model?', 'All of the mentioned above');

INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (4, 'The model pattern is little complex');
INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (4, 'Multiple technologies knowledge is required');
INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (4, 'You need multiple programmers for parallel development');
INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (4, 'All of the mentioned above');


INSERT INTO QuizQuestion (Text, CurrectAnswer)
VALUES (' In MVC, Ajax can be implemented in _____________ ways', 'both 1 & 2');

INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (5, 'Ajax libraries');
INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (5, 'Jquery');
INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (5, 'both 1 & 2');
INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (5, 'None of the above');

INSERT INTO QuizQuestion (Text, CurrectAnswer)
VALUES ('Howmany types of result in MVC?', '12');

INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (6, '11');
INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (6, '12');
INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (6, '13');
INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (6, '10');



INSERT INTO QuizQuestion (Text, CurrectAnswer)
VALUES ('______________Request Processing technique follows ASP.Net?', 'Pipeline');

INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (7, 'Top-Down');
INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (7, 'Down-Up');
INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (7, 'Pipeline');
INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (7, 'Waterfall');



INSERT INTO QuizQuestion (Text, CurrectAnswer)
VALUES (' ______________is the name of default Viewstart Page in ASP.Net MVC.', '_ViewStart.cshtml');

INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (8, '_ViewStart.cshtml');
INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (8, '_Login.cshtml');
INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (8, '_Layout.cshtml');
INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (8, ' None');




INSERT INTO QuizQuestion (Text, CurrectAnswer)
VALUES ('Viewstart comes under which folder name ?', 'Views');

INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (9, 'Views');
INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (9, 'Account');
INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (9, 'Shared');
INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (9, 'Home');




INSERT INTO QuizQuestion (Text, CurrectAnswer)
VALUES ('which of the following is the extension of MVC view when using vb.net?', 'vbhtml');

INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (10, 'cshtml');
INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (10, 'vbhtml');
INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (10, 'Both A & B');
INSERT INTO QuizQuestionOptions (QuestionID, Options)
VALUES (10, 'None');