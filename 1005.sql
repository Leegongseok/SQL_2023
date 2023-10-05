--고객번호 ,주소,총판매액이 고객번호별로 묶어서 수행하게 하는 명령문 
select custid,(SELECT address
               FROM customer cs
               WHERE cs.custid=od.custid)"adress",
                     SUM(saleprice)"total"
FROM Orders od
GROUP BY od.custid;
--주문을 한 고객별,이름,평균,구매가격을 구하시오.
SELECT cs.name,s
FROM (SELECT custid,AVG(saleprice)s
    FROM Orders
    GROUP BY custid)od,customer cs
    WHERE cs.custid=od.custid;
--3 custod가 3이하인 고객의 구매가격 총합을 구함    
SELECT SUM(saleprice)"total"
FROM orders od
WHERE EXISTS (SELECT *
              FROM customer cs
              where custid <=3 and cs.custid=od.custid);
              
select *from book;
--책이름에 과학이라는 단어가 포함된 결과행을 출력하시오.
select *from book
where bookname like '%과학%';

create view v_book
as select *from book
where bookname like '%과학%';

select *from customer;
--주소에 서울이라는 단어가 포함된 뷰를 생성하시오.
select * from customer
where address like '%서울%';

create view vw_customer
as select * from customer
where address like '%서울%';

select * from vw_customer;

--주문테이블에서 고객이름,도서이름을 바로 확인할수 있는 뷰를 생성한 후,
--김연아 고객이 구입한 도서의 주문번호,도서명,주문액을 출력하시오.

create view vw_orders(orderid,name,custid,bookid,bookname,saleprice,orderdate)
as select o.orderid,c.name,o.custid,o.bookid,b.bookname,o.saleprice,o.orderdate
  from orders o,customer c, book b
  where o.custid=c.custid and o.bookid=b.bookid;
  
select *from vw_orders;

select orderid,bookname,saleprice
from vw_orders
where name='김연아';

--기존의 뷰를 수정한다.

create or replace view vw_customer(custid,name,address)
as select custid,name,address
from customer
where address like '%영국%';

select *from customer;

select * from vw_customer;

--뷰삭제
drop view vw_customer;

--판매가격이 20,000원이상인 도서의 도서번호,도서이름,고객이름,출판사,판매가격을 
--보여주는 highorders 뷰를 생성하시오

create view highorders(도서번호,도서이름,고객이름,출판사,판매가격)
as select o.bookid,b.bookname,c.name,b.publisher,o.saleprice 
from book b,orders o,customer c
where b.bookid=o.bookid and o.custid=c.custid and saleprice>=20000;

--생성한 뷰를 이용하여 판매된 도서의 이름과 고객의 이름을 출력하는 sql문을작성하시오.
select 도서이름,고객이름
from highorders;
--highorders  뷰를 변경하고자 한다.판매가격의 속성을 삭제하는명령을 수행한후 삭제후 2번 sql문을 다시 수행하시오.
create or replace view highorders(도서번호,도서이름,고객이름,출판사)
as select o.bookid,b.bookname,c.name,b.publisher 
from book b,orders o,customer c
where b.bookid=o.bookid and o.custid=c.custid;

select 도서이름,고객이름 from highorders;

--insertbook 프로시저 실행
exec insertbook(13,'스포츠과학','마당과학서적',25000);

select * from book;

exec insertorupdate(14,'스포츠즐거움','마당과학서적',30000);

exec insertorupdate(14,'스포츠즐거움','마당과학서적',20000);

  select count(*)  from book
  where bookname like '스포츠과학';
  
set serveroutput on;
declare 
      averageVal number;
begin
    averagePrice(averageVal);
    dbms_output.put_line('도서평균가격:'|| averageVal);
end;
--도서추가프로시저
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
--반환하는타입
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
--결과를반환하는 프로시저
CREATE OR REPLACE PROCEDURE AVERAGEPRICE (
 averageVal out number)
AS 
BEGIN
  select avg(price) into averageVal from book
  where price is not null;
END AVERAGEPRICE;