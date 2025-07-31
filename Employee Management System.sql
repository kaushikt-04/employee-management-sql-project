CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

Create Table Worker(
	Worker_id int NOT NULL Primary Key Auto_increment,
    First_Name Char(25),
    Last_Name Char(25),
    Salary Int(15),
    Joining_date Datetime,
    Department char(25)
);

Insert Into Worker
	(Worker_id,First_Name,Last_Name,Salary,Joining_date,Department) Values
    (1,"Monika","Arora",100000,"14-02-20 09.00.00","Hr"),
    (2,"Niharika","Verma",80000,"14-06-11 09.00.00","Admin"),
    (3,"Vishal","Singhal",300000,"14-02-20 09.00.00","Hr"),
    (4,"Amitabh","Singh",500000,"14-02-20 09.00.00","Admin"),
    (5,"Vivek","Arora",500000,"14-06-11 09.00.00","Admin"),
    (6,"Vipul","Diwan",200000,"14-06-11 09.00.00","Account"),
    (7,"Satish","Kumar",75000,"14-02-20 09.00.00","Account"),
    (8,"Geetika","Chauhan",90000,"14-02-11 09.00.00","Admin");
    
Select * from Worker; 

Create Table Bonus(
Worker_Ref_Id int,
Bonus_Amount int(10),
Bonus_Date Datetime,
Foreign Key(Worker_Ref_Id) References Worker(Worker_Id) On Delete Cascade
);

Insert Into Bonus
	(Worker_Ref_Id,Bonus_Amount,Bonus_Date) Values
    (001,5000,"16-02-20"),
    (002,3000,"16-06-11"),
    (003,4000,"16-02-20"),
    (001,4500,"16-02-20"),
    (003,3500,"16-06-11");
    
Select * from Bonus;

CREATE TABLE Title (
    Worker_Ref_Id INT,
    Worker_Title CHAR(25),
    Affected_From DATETIME,
    FOREIGN KEY (Worker_Ref_Id) REFERENCES Worker(Worker_id) ON DELETE CASCADE
);

Insert Into Title
	(Worker_Ref_Id,Worker_Title,Affected_From) Values
    (1,'Manager','2016-02-20 00:00:00'),
    (2,'Executive','2016-06-11 00:00:00'),
    (8,'Executive','2016-06-11 00:00:00'),
    (5,'Manager','2016-06-11 00:00:00'),
    (4,'Asst. Manager','2016-06-11 00:00:00'),
    (7,'Asst. Manager','2016-06-11 00:00:00'),
    (6,'Asst. Manager','2016-06-11 00:00:00'),
    (3,'Asst. Manager','2016-06-11 00:00:00');

Select First_Name from Worker As WORKER_NAME;
Select Upper(First_Name) from Worker;
Select distinct Department from Worker;
Select substr(First_Name,1,3) from Worker;
Select Instr(First_Name,"B") from Worker where First_Name = 'Amitabh';
Select RTRIM(First_Name) from Worker;
Select LTRIM(Department) from Worker;
Select distinct Department,Length(Department) from Worker;
Select Replace(First_Name,'a','A') from Worker; 
Select concat(First_Name,' ',Last_Name) from Worker; 
Select * from Worker order by First_Name;
Select * from Worker order by First_Name DESC;
Select * from Worker Where First_Name in ('Vipul','Satish');
Select * from Worker Where First_Name NOT In ('Vipul','Satish');
Select * from Worker Where First_Name LIKE '%a';
Select * from Worker Where First_Name LIKE '_____h';
Select * from Worker Where Salary between 100000 and 500000;
Select * from Worker Where Year(Joining_date)=2014 and Month(Joining_date)=02;
Select concat(First_Name,' ',Last_Name) from Worker Where Salary between 50000 and 100000;
select Department,Count(*) from Worker Where Department='Admin';
Select Department,Count(Worker_id) As NO_Of_Worker from Worker group by Department order by NO_Of_Worker Desc;
Select W.* from Worker as W inner join title as t on W.Worker_id=t.Worker_Ref_Id where t.Worker_Title='Manager';
Select Worker_Title,Count(*) as Count from Title group by Worker_Title having Count>1;
Select * from Worker Where MOD(Worker_Id,2) !=0; 
Select * from Worker Where MOD(Worker_Id,2) =0; 
CREATE Table Worker_Clone Like Worker;
Insert Into Worker_Clone select * from Worker;
Select * from Worker_Clone;
Select * from Worker Inner Join Worker_Clone using(Worker_id);
Select * from Worker left join  Title 
ON Worker.Worker_id = Title.Worker_Ref_Id where Title.Worker_Ref_Id is NULL;
Select * from Worker order by Salary Desc Limit 5;
Select * from Worker order by Salary Limit 5;
Select * from Worker order by Salary Desc Limit  4,1;
Select * from Worker W1 Where 4 = (Select Count(Distinct(W2.Salary)) from Worker W2 Where W2.Salary>=W1.Salary);
Select Salary from Worker W1 Where 2 = (Select Count(Distinct(W2.Salary)) From Worker W2 Where W2.Salary>=W1.Salary);
select max(Salary) from worker
where Salary not in (select max(Salary) from Worker);
Select * from Worker W1,Worker W2 Where W1.Salary=W2.Salary and W1.Worker_id!=W2.Worker_id;
Select * from Worker Union All Select * from Worker Order by Worker_id;
Select W.Worker_id from Worker W left join 
Title T On W.Worker_id=T.Worker_Ref_Id Where T.Worker_Ref_Id is NULL;
Select * from Worker Where Worker_id <= (Select count(Worker_id)/2 from Worker);
Select Department,Count(Department) as Count from Worker Group by Department having Count<4;
Select Department,Count(Department) from Worker group by Department;
Select * from Worker Where Worker_id = (Select max(Worker_id) from Worker);
(Select * from Worker order by Worker_id desc LIMIt 5)order by Worker_id;
Select Department,First_Name,Last_Name,Salary from Worker 
Where (Department,Salary) In 
(Select Department,Max(Salary) from Worker Group By Department) ;

Select Distinct Salary from Worker W1 
Where 3>=(Select Count(Distinct Salary) from Worker W2 
Where W1.Salary<=W2.Salary) order by W1.Salary Desc;

Select Distinct Salary from Worker W1 
Where 3>=(Select Count(Distinct Salary) from Worker W2 
Where W1.Salary>=W2.Salary) order by W1.Salary Desc;

Select Sum(Salary) as TotSal from Worker group by Department Order by TotSal Desc;

Select First_name,Salary from Worker Where Salary = (Select MAx(Salary) from Worker);


