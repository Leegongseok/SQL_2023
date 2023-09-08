--���տ�����:������(UNION),������(MINUS),������(INTERSECT)
--������ ������ ���
--������ �ֹ����� ���� ���� �̸��� ���ÿ�.
select name from customer;

select distinct custid from orders;

select name from customer
where custid in (select custid from orders);

select name from customer
minus
select name from customer
where custid in (select custid from orders);

--������ �����ڸ� ������� ������� 
select name from customer
where custid not in (select custid from orders);

--EXISTS:���������� ����� �����ϴ� ��쿡 true
-- �ֹ��� �ִ� ���� �̸��� �ּҸ� ����Ͻÿ�
--in������ ����� ���
select name,address from customer
where custid in(select custid from orders);
--�������ΰ� �ߺ��� ������ ��� 
select distinct name,address from customer c, orders o
where c.custid=o.custid;
--Exist ����� ��� 
select name, address from customer c
where exists(select * from orders o
                       where c.custid=o.custid);
--�������� ������ ������ ���ǻ� �� 
select count(*)publisher  from orders o, customer c, book b
where c.custid=o.custid and  b.bookid=o.bookid and c.name='������';
--�������� ������ ������ �̸�,����,������ �ǸŰ����� ����
select bookname,price,price-saleprice from customer c,orders o,book b
where c.custid=o.custid and  b.bookid=o.bookid and c.name='������';   
--�������� �������� ���� ������ �̸�
select bookname 
from book b, customer c, orders o
minus
select bookname
from book b, customer c,  orders o
where c.custid=o.custid and  b.bookid=o.bookid and c.name='������';   

--������ ����(Book���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�
select * from book b, orders o
where b.bookid=o.bookid
and price-saleprice=(select max(price-saleprice)
                    from book sb, orders so
                    where sb.bookid=so.bookid);
--DDl(Data Defination Language):������ ���Ǿ�
--create table/alter table/drop table
--���̺� ���� ����1
create table newbook1(
        bookid number,
        bookname varchar2(20),
        publisher varchar2(20),
        price number
);
--���̺� ���� ����2
--primary key ���� ��� 1
create table newbook3(
        bookid number primary key,
        bookname varchar2(20),
        publisher varchar2(20),
        price number
       
);

--bookname Į��:null�� ���� �� ����
--publisher �÷�: ������ ���� ���� �� ����
--price �÷� : ������ �ԷµǾ� ���� ������ �⺻���� 10000�����ϰ� �Էµ� �� 1000�ʰ��� ��
--bookname, publisher �÷��� ����Ű�� ����

create table newbook4(
        bookname varchar2(20) not null,
        publisher varchar2(20) unique,
        price number default 10000 check (price >1000),
        primary key(bookname,publisher)
       );
        
        );


