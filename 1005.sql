--����ȣ ,�ּ�,���Ǹž��� ����ȣ���� ��� �����ϰ� �ϴ� ��ɹ� 
select custid,(SELECT address
               FROM customer cs
               WHERE cs.custid=od.custid)"adress",
                     SUM(saleprice)"total"
FROM Orders od
GROUP BY od.custid;
--�ֹ��� �� ����,�̸�,���,���Ű����� ���Ͻÿ�.
SELECT cs.name,s
FROM (SELECT custid,AVG(saleprice)s
    FROM Orders
    GROUP BY custid)od,customer cs
    WHERE cs.custid=od.custid;
--3 custod�� 3������ ���� ���Ű��� ������ ����    
SELECT SUM(saleprice)"total"
FROM orders od
WHERE EXISTS (SELECT *
              FROM customer cs
              where custid <=3 and cs.custid=od.custid);
              
select *from book;
--å�̸��� �����̶�� �ܾ ���Ե� ������� ����Ͻÿ�.
select *from book
where bookname like '%����%';

create view v_book
as select *from book
where bookname like '%����%';

select *from customer;
--�ּҿ� �����̶�� �ܾ ���Ե� �並 �����Ͻÿ�.
select * from customer
where address like '%����%';

create view vw_customer
as select * from customer
where address like '%����%';

select * from vw_customer;

--�ֹ����̺��� ���̸�,�����̸��� �ٷ� Ȯ���Ҽ� �ִ� �並 ������ ��,
--�迬�� ���� ������ ������ �ֹ���ȣ,������,�ֹ����� ����Ͻÿ�.

create view vw_orders(orderid,name,custid,bookid,bookname,saleprice,orderdate)
as select o.orderid,c.name,o.custid,o.bookid,b.bookname,o.saleprice,o.orderdate
  from orders o,customer c, book b
  where o.custid=c.custid and o.bookid=b.bookid;
  
select *from vw_orders;

select orderid,bookname,saleprice
from vw_orders
where name='�迬��';

--������ �並 �����Ѵ�.

create or replace view vw_customer(custid,name,address)
as select custid,name,address
from customer
where address like '%����%';

select *from customer;

select * from vw_customer;

--�����
drop view vw_customer;

--�ǸŰ����� 20,000���̻��� ������ ������ȣ,�����̸�,���̸�,���ǻ�,�ǸŰ����� 
--�����ִ� highorders �並 �����Ͻÿ�

create view highorders(������ȣ,�����̸�,���̸�,���ǻ�,�ǸŰ���)
as select o.bookid,b.bookname,c.name,b.publisher,o.saleprice 
from book b,orders o,customer c
where b.bookid=o.bookid and o.custid=c.custid and saleprice>=20000;

--������ �並 �̿��Ͽ� �Ǹŵ� ������ �̸��� ���� �̸��� ����ϴ� sql�����ۼ��Ͻÿ�.
select �����̸�,���̸�
from highorders;
--highorders  �並 �����ϰ��� �Ѵ�.�ǸŰ����� �Ӽ��� �����ϴ¸���� �������� ������ 2�� sql���� �ٽ� �����Ͻÿ�.
create or replace view highorders(������ȣ,�����̸�,���̸�,���ǻ�)
as select o.bookid,b.bookname,c.name,b.publisher 
from book b,orders o,customer c
where b.bookid=o.bookid and o.custid=c.custid;

select �����̸�,���̸� from highorders;

--insertbook ���ν��� ����
exec insertbook(13,'����������','������м���',25000);

select * from book;

exec insertorupdate(14,'��������ſ�','������м���',30000);

exec insertorupdate(14,'��������ſ�','������м���',20000);

  select count(*)  from book
  where bookname like '����������';
  
set serveroutput on;
declare 
      averageVal number;
begin
    averagePrice(averageVal);
    dbms_output.put_line('������հ���:'|| averageVal);
end;
--�����߰����ν���
CREATE OR REPLACE PROCEDURE INSERTBOOK (
     myBookId in number,
     myBookName in varchar2,
     mypublisher in varchar2,
     myprice in number)
As
BEGIN
 insert into book(bookid,bookname,publisher,price)
 values(myBookId,myBookName,mypublisher,myprice);
END;
--��ȯ�ϴ�Ÿ��
CREATE OR REPLACE PROCEDURE INSERTORUPDATE(
     myBookId  number,
     myBookName  varchar2,
     mypublisher  varchar2,
     myprice int) 
AS 
    myCount number;
BEGIN
  select count(*) into mycount from book
  where bookname like myBookName;
  
  if myCount!=0 then
     update book set price=myprice
     where bookname like myBookName;
  else
      insert into book(bookid,bookname,publisher,price)
      values(myBookId,myBookName,myPublisher,myprice);
  end if;
END INSERTORUPDATE;
--�������ȯ�ϴ� ���ν���
CREATE OR REPLACE PROCEDURE AVERAGEPRICE (
 averageVal out number)
AS 
BEGIN
  select avg(price) into averageVal from book
  where price is not null;
END AVERAGEPRICE;