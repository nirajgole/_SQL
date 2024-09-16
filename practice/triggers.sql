

select * from customer
select * from orders


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- Creating the 'Customer' table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    address VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    zip VARCHAR(20),
);


-- Insert 5 records into the "customer" table
INSERT INTO customer (customer_id, first_name, last_name, email, address, city, state, zip)
VALUES
(1, 'John', 'Doe', 'johndoe@example.com', '123 Main St', 'Anytown', 'CA', '12345'),
(2, 'Jane', 'Doe', 'janedoe@example.com', '456 Oak Ave', 'Somewhere', 'NY', '67890'),
(3, 'Bob', 'Smith', 'bobsmith@example.com', '789 Elm St', 'Nowhere', 'TX', '54321'),
(4, 'Alice', 'Jones', 'alicejones@example.com', '321 Maple Rd', 'Everywhere', 'FL', '09876'),
(5, 'Tom', 'Williams', 'tomwilliams@example.com', '555 Pine St', 'Anywhere', 'IL', '24680');

-- Insert 5 records into the "orders" table
INSERT INTO orders (order_id, order_date, amount, customer_id)
VALUES
(1, '2023-04-01', 100.50, 1),
(2, '2023-04-02', 50.00, 2),
(3, '2023-04-03', 75.25, 1),
(4, '2023-04-04', 125.75, 3),
(5, '2023-04-05', 200.00, 4);

--triggers--

--dml triggers
--ddl triggers

inserted--  insert + update(new data)



deleted-- deleted data + update(old data)


create trigger trigger_name
on database/table_name
after/for
as
begin

  trigger body

end

create or alter trigger show_inserted
on orders
after insert,update,delete
as
begin
   select * from inserted
   select * from deleted
end

create trigger show_deleted
on orders
after delete
as begin
   select * from deleted
end


insert into orders values(6, '2023-04-07', 20.00, 4);

update Orders 
set amount=400
where order_id=6


delete from Orders
where order_id=6

--ddl trigger
---create trigger for preventing the deletion of table----

create or alter trigger prevent_delete
on database
for drop_table
as
begin

 print('not allowed to delete')
 rollback;
end


drop table orders


---print messsage whenever new table is created---

create trigger table_created
on database
for create_table
as
 begin

  print('new table has been created')

end


create table abc(abc int)

drop table abc

--trigger to audit when the table has been altered--

create trigger alter_audit_table
on database
for alter_table
as
begin

  declare @audit_message varchar(70)
  set @audit_message='the table has been altered'

  insert into audit_log(action_time,action_type,action_message)
  values(getdate(),'table altered',@audit_message)

end

create table audit_log
( action_time varchar(400),
 action_type varchar(200),
 action_message varchar(300)
 )

 select * from audit_log

alter table customer
add abc int





-----DML triggers-----




create or alter trigger order_amount
on orders
after insert,update
as
begin

  if exists (select * from inserted where amount<10)
  begin
  raiserror('order amount must be at least 10',17,2)
  rollback transaction;
  end
 end

insert into orders values(7, '2023-04-07', 2.00, 4);


select * from Orders


--create trigger that keeps the record of auditing amount in the orders table

customer_Audit table (customer_id,old amount,newamount,date_of_audit)


create table customer_audit
(customer_id int,
 old_amount int,
 new_amount int,
 audit_date varchar(60)
 )


 create trigger customer_auditt
 on orders
 after update
 as
 begin
    
	insert into customer_audit(customer_id,old_amount,new_amount,audit_date)
	select d.customer_id,d.amount,i.amount,getdate() from inserted i 
	join deleted d on i.order_id=d.order_id
 end

 select * from Customer_audit




insert into orders values(10,'2023-03-21',456,3)



 select * from orders

 update orders
 set amount=400
 where order_id in (6,5,4)





 --trigger to update last_ordered column of customer table with data and time
 --whenever new record get inserted in orders tbale-



  create trigger insert_order
 on orders
 after insert
 as
 begin

    update customer
	set last_ordered = getdate()
	from inserted i
	where Customer.customer_id=i.customer_id

end


 select * from Customer




 alter table customer
 add last_ordered varchar(80)

 insert into orders values(8,'2023-04-21',345,3)



  ------log on triggers------

select * from sys.dm_exec_sessions

select is_user_process,original_login_name from sys.dm_exec_sessions
order by is_user_process desc

create trigger trg_logon
on all server
for logon
as begin
 declare @loginname varchar(80)
 set @loginname=ORIGINAL_LOGIN()

 if( select count(*) from sys.dm_exec_sessions
  where is_user_process=1 and original_login_name=@loginname)>3
  begin
     print 'fourth connection attempted by '+ @loginname + 'blocked'
	 rollback;
	end
end

drop trigger trigger_name on database
drop trigger trigger_name on all server
drop trigger trigge_name







