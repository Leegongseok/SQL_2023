--������ ���� ���
select abs(-15) from  dual;
--���ں��� ũ�ų� ���� �ּ��� ����
select ceil(15.7) from dual;
--�ڻ��ΰ� ��ȯ
select cos(3.14159) from dual;
--����(�ݿø��ݴ�)
select floor(15.7) from dual;
--������ �ڿ��αװ� ��ȯ
select log(10,100) from dual;
--11%4=3 , �������������
select mod(11,4) from dual;
--3��2�������(���Ǽ��ڰ�������,���Ǽ��ڰ�������)
select power(3,2) from dual;
--����(a,m)�Ҽ�m��°�ڸ��� �ݿø�(n+1�ڸ� ��������)
select round(15.7) from dual;
--���ڰ� �����̸� -1,0�̸� 0,����̸�1
select sign(-15) from dual;
--�Ҽ����� ������ �Լ��� ���� ���
select trunc(15.7) from dual;
--���� �ƽ�Ű�ڵ带 ���ڷ� ��ȯ
select chr(67) from dual;
--�ι��ڿ��� ����
select concat('HAPPY','Birthday') from dual;
--����ڿ��� ��� �ҹ��ڷ� ��ȯ
select lower('Birthday') from dual;
--����ڿ��� ���ʺ��� ������ �ڸ������� ������ ���ڷ� ä��
select lpad('page 1', 15,'*.') from dual;
--����ڿ��� �����ʺ��� ������ ���ڵ��� ����
select ltrim('page 1', 'ae') from dual;
--����ڿ��� ������ ���ڸ� ���ϴ� ���ڷ� ����
select replace('jack','j','bl') from dual;
--����ڿ��� �����ʺ��� ������ �ڸ������� �����ѹ��ڷ�ä��
select rpad('page 1', 15, '*.') from dual;
--����ڿ��� �����ʺ��� ������ ���ڵ��� ����
select rtrim('page 1', 'ae') from dual;

select substr('ABCDEFG',3,4) from dual;

select trim(LEADING 0 FROM '00AA00') from dual;

select upper('Birthday') from dual;

select ASCll('A') from dual;

select inster('coprorate floor', 'or',3,2) from dual;

select length('Birthday') from dual;

select add_months('14/05/21',1) from dual;

select last_day(sysdate) from dual;

select next_day(sysdate,'ȭ') from dual;

select round(sysdate) from dual;

select sysdate from dual;

select to_char(sysdate) from dual;

select to_char(123) from dual;

select to_date('12 05 2014', 'dd mm yyyy') from dual;

-- ���� �̸��� ��ȭ��ȣ�� ����Ͻÿ�.(��,��ȭ��ȣ�� ���� ���� '����ó����'���� ���)
select name �̸�,phone  ��ȭ��ȣ from customer; 
select name �̸�,nvl(phone,'����ó����')  ��ȭ��ȣ from customer; 

--����Ͽ��� ����,����ȣ,�̸�,��ȭ��ȣ�� ���� �θ� ����Ͻÿ�.
select rownum ����, custid, name, phone from customer;
select rownum ����, custid, name, phone from customer
where rownum<=2;

--mybook ���̺� ���� 
create table mybook(
    bookid number not null primary key,
    price number 
);

--������ �� ����
insert into mybook values (1,10000);
insert into mybook values (2,20000);
insert into mybook(bookid) values (3);

--mybook�� ������� ���̺� ����
select *from mybook;

--mybook���̺� null���� 0���� �ٲ㼭 ���
select bookid,nvl(price,0) from mybook;

--mybook���̺� null���ΰ͸� ǥ��
select * from mybook  where price is null;

--�ƹ��͵� �ȳ���
select * from mybook where price='';

--mybook���̺� price����+100�Ѱ��� ��ȯ  null���� ��� x
select bookid,price+100 from mybook;

--bookid�� 4�̻��ΰ��� ���;��ϴµ� �����ϱ� null���� ��ȯ
select sum(price),avg(price),count(*)
from mybook
where bookid>=4;

--mybook���̺� �����Լ�  ���� null���� ��� x
select count(*),count(price)
from mybook;

--mybook���̺� �����հ�� ���� ���
select sum(price),avg(price)
from mybook;

--book���̺� ������� ����
select * from book;

--book���̺� ������ 5�������� ���̺�
select * from book where rownum<=5;


select * from book where rownum<=5 order by price;


select * from(select * from book order by price)b
where rownum<=5;


select * from (select *from book where rownum<=5)b order by price;


select * from (select *from book where rownum <=5 order by price)b;

--����Ǹűݾ� ������ �ֹ��� ���� �ֹ���ȣ�� �ݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ,saleprice �Ǹűݾ� from orders;
select avg(saleprice) from orders;

select orderid �ֹ���ȣ,saleprice �Ǹűݾ� from orders
where saleprice <= (select avg(saleprice) from orders);

--�� ���� ����Ǹűݾ׺��� ū �ݾ��� �ֹ� ���������ؼ��� �ֹ���ȣ,����ȣ,�Ǹűݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ, custid ����ȣ, saleprice �Ǹűݾ� from orders;

select orderid �ֹ���ȣ, custid ����ȣ, saleprice �Ǹűݾ� from orders mo
where saleprice > (select avg(saleprice) from orders so where mo.custid=so.custid );

--���￡ �����ϴ� ������ �Ǹ��� ������ ���Ǹűݾ��� ����Ͻÿ�.
select sum(saleprice) ���Ǹűݾ� from orders;
--���￡ �����ϴ� ����� ����ȣ
select custid from customer 
where address like '%����%';

select sum(saleprice) ���Ǹűݾ� from orders
where custid in (select custid from customer 
where address like '%����%');

--���￡ �������� �ʴ� ������ �Ǹ��� ������ ���Ǹűݾ��� ����Ͻÿ�.
select sum(saleprice) ���Ǹűݾ� from orders
where custid not in (select custid from customer 
where address like '%����%');

--3������ �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders;

select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders
where saleprice > all(select saleprice from orders where custid=3);

select saleprice from orders where custid=3;

--���￡ �����ϴ� ������ �Ǹ��� ������ ���Ǹž��� ���Ͻÿ�.(��,exist ������ ���)
select sum(saleprice) ���Ǹűݾ� from orders mo
where exists(
    select * from customer c 
    where address like '%����%' and mo.custid=c.custid
);

--���� �Ǹűݾ��� �հ踦 ����Ͻÿ�.(����ȣ,�Ǹ��հ�)
select custid,����ȣ, sum(saleprice) �Ǹ��հ� from orders
group by custid; 

--���� �Ǹűݾ��� �հ踦 ����Ͻÿ�.(����,�Ǹ��հ�)
select (select name from customer c 
        where c.custid=o.custid) ���� , sum(saleprice) �Ǹ��հ� from orders o
group by o.custid; 

--�ֹ���Ͽ� å�̸��� ������ �� �ִ� �÷��� �߰��Ͻÿ�.
alter table orders add bookname varchar2(40);

update orders o set bookname = (select bookname from book b where b.bookid=o.bookid );

--����ȣ�� 2������ ����ȣ�� �̸��� ����Ͻÿ�.
select custid ����ȣ, name �̸� from customer 
where custid <=2;

--����ȣ�� 2������ ���� �Ǹűݾ��� ����Ͻÿ�,(���̸��� ���� �Ǹž� ���)
select name ���̸�,sum(saleprice) �Ǹ��Ѿ�
from (select custid , name  from customer 
where custid <=2) c, orders o
where c.custid=o.custid
group by name;

select name ���̸�,sum(saleprice) �Ǹ��Ѿ�
from customer c,orders o
where c.custid=o.custid
group by name;

select custid,(select address from customer cs where cs.custid=od.custid)"address",
sum(saleprice)"total" from orders od group by od.custid;