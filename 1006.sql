set serveroutput on;
exec interest;

create table book_log(
    bookid_l number,
    bookname_l varchar2(40),
    publisher_1 varchar2(40),
    price_l number
);

--Ŀ���� �̿��ϴ� ���ν���
create or replace procedure interest 
as
   myInterest numeric;
   price numeric;
   cursor interestcursor is select saleprice from orders;
begin
    myinterest :=0.0;
    open interestcursor;
    loop
        fetch interestCursor into price;
        exit when interestCursor%NOTFOUND;
        if price >=30000 then 
                myInterest :=myInterest +price*0.1;
        else
                myInterest :=myInterest +price*0.05;
        end if;
    end loop;
    close interestCursor;
    DBMS_OUTPUT.PUT_LINE('��ü ���ͱݾ� =' || round(myInterest,3));
end;
--Ʈ����
create or replace trigger afterinsertbook
after insert on book for each row
declare 
    average number;
begin
    insert into book_log
    values(:new.bookid,:new.bookname,:new.publisher,:new.price);
    dbms_output.put_line('���� ���� book_log ���̺� ����߽��ϴ�.');
end;

insert into book values(15,'�������ƿ�','���й̵��',25000);
select * from book where bookid=15;
select * from book_log where bookid_l=15;

--����� ���� �Լ� �����
create or replace function fnc_interest(price number)
                            return int
is
   myInterest number;
begin
    if price >=30000 then 
        myinterest := price *0.1;
        
    else
         myinterest := price *0.05;
        
    end if;
    return myInterest;
end;

--�����Ҷ� �������ϰ� ������ �ּ���.
select custid,orderid,saleprice,fnc_interest(saleprice) ���ͱ� from orders;
--��������
create or replace PROCEDURE INSERTcustomer (
     myCustid in number,
     myName in varchar2,
     myAddress in varchar2,
     myPhone in varchar2)
As
BEGIN
 insert into customer(custid,name,address,phone)
 values(myCustid,myName,myAddress,myPhone);
END;

--�����Ҷ� �������� �Ŀ� �ϱ�
exec insertcustomer(6,'������','����� ��걸 �ѳ���', '010-1234-7653');
select * from customer;
