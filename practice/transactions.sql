begin transaction
-- alter table Student drop column lastname
alter table Student add lastname varchar(max)
commit transaction
rollback transaction


select * from STUDENT