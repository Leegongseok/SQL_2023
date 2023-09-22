--숫자의 절댓값 계산
select abs(-15) from  dual;
--숫자보다 크거나 같은 최소의 정수
select ceil(15.7) from dual;
--코사인값 반환
select cos(3.14159) from dual;
--내림(반올림반대)
select floor(15.7) from dual;
--숫자의 자연로그값 반환
select log(10,100) from dual;
--11%4=3 , 나머지값을계산
select mod(11,4) from dual;
--3의2제곱계산(앞의숫자가밑으로,뒤의숫자가지수로)
select power(3,2) from dual;
--숫자(a,m)소수m번째자리를 반올림(n+1자리 기준으로)
select round(15.7) from dual;
--숫자가 음수이면 -1,0이면 0,양수이면1
select sign(-15) from dual;
--소수점을 버리는 함수를 쓸때 사용
select trunc(15.7) from dual;
--정수 아스키코드를 문자로 변환
select chr(67) from dual;
--두문자열을 연결
select concat('HAPPY','Birthday') from dual;
--대상문자열을 모두 소문자로 변환
select lower('Birthday') from dual;
--대상문자열의 왼쪽부터 지정한 자릿수까지 지정한 문자로 채움
select lpad('page 1', 15,'*.') from dual;
--대상문자열의 오른쪽부터 지정한 문자들을 제거
select ltrim('page 1', 'ae') from dual;
--대상문자열의 지정한 문자를 원하는 문자로 변경
select replace('jack','j','bl') from dual;
--대상문자열의 오른쪽부터 지정한 자릿수까지 지정한문자로채움
select rpad('page 1', 15, '*.') from dual;
--대상문자열의 오른쪽부터 지정한 문자들을 제거
select rtrim('page 1', 'ae') from dual;

select substr('ABCDEFG',3,4) from dual;

select trim(LEADING 0 FROM '00AA00') from dual;

select upper('Birthday') from dual;

select ASCll('A') from dual;

select inster('coprorate floor', 'or',3,2) from dual;

select length('Birthday') from dual;

select add_months('14/05/21',1) from dual;

select last_day(sysdate) from dual;

select next_day(sysdate,'화') from dual;

select round(sysdate) from dual;

select sysdate from dual;

select to_char(sysdate) from dual;

select to_char(123) from dual;

select to_date('12 05 2014', 'dd mm yyyy') from dual;

-- 고객의 이름과 전화번호를 출력하시오.(단,전화번호가 없는 고객은 '연락처없음'으로 출력)
select name 이름,phone  전화번호 from customer; 
select name 이름,nvl(phone,'연락처없음')  전화번호 from customer; 

--고객목록에서 연번,고객번호,이름,전화번호를 앞의 두명만 출력하시오.
select rownum 순번, custid, name, phone from customer;
select rownum 순번, custid, name, phone from customer
where rownum<=2;

--mybook 테이블 생성 
create table mybook(
    bookid number not null primary key,
    price number 
);

--데이터 행 삽입
insert into mybook values (1,10000);
insert into mybook values (2,20000);
insert into mybook(bookid) values (3);

--mybook에 만들어진 테이블 내용
select *from mybook;

--mybook테이블에 null값을 0으로 바꿔서 계산
select bookid,nvl(price,0) from mybook;

--mybook테이블에 null값인것만 표기
select * from mybook  where price is null;

--아무것도 안나옴
select * from mybook where price='';

--mybook테이블 price값에+100한값을 반환  null값은 계산 x
select bookid,price+100 from mybook;

--bookid가 4이상인것이 나와야하는데 없으니까 null값을 반환
select sum(price),avg(price),count(*)
from mybook
where bookid>=4;

--mybook테이블에 집계함수  갯수 null값은 계산 x
select count(*),count(price)
from mybook;

--mybook테이블에 가격합계와 가격 평균
select sum(price),avg(price)
from mybook;

--book테이블에 만들어진 내용
select * from book;

--book테이블에 순번이 5번이하인 테이블
select * from book where rownum<=5;


select * from book where rownum<=5 order by price;


select * from(select * from book order by price)b
where rownum<=5;


select * from (select *from book where rownum<=5)b order by price;


select * from (select *from book where rownum <=5 order by price)b;

--평균판매금액 이하의 주문에 대해 주문번호와 금액을 출력하시오.
select orderid 주문번호,saleprice 판매금액 from orders;
select avg(saleprice) from orders;

select orderid 주문번호,saleprice 판매금액 from orders
where saleprice <= (select avg(saleprice) from orders);

--각 고객의 평균판매금액보다 큰 금액의 주문 내역에대해서만 주문번호,고객번호,판매금액을 출력하시오.
select orderid 주문번호, custid 고객번호, saleprice 판매금액 from orders;

select orderid 주문번호, custid 고객번호, saleprice 판매금액 from orders mo
where saleprice > (select avg(saleprice) from orders so where mo.custid=so.custid );

--서울에 거주하는 고객에게 판매한 도서의 총판매금액을 출력하시오.
select sum(saleprice) 총판매금액 from orders;
--서울에 거주하는 사람의 고객번호
select custid from customer 
where address like '%서울%';

select sum(saleprice) 총판매금액 from orders
where custid in (select custid from customer 
where address like '%서울%');

--서울에 거주하지 않는 고객에게 판매한 도서의 총판매금액을 출력하시오.
select sum(saleprice) 총판매금액 from orders
where custid not in (select custid from customer 
where address like '%서울%');

--3번고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 출력하시오.
select orderid 주문번호, saleprice 판매금액 from orders;

select orderid 주문번호, saleprice 판매금액 from orders
where saleprice > all(select saleprice from orders where custid=3);

select saleprice from orders where custid=3;

--서울에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오.(단,exist 연산자 사용)
select sum(saleprice) 총판매금액 from orders mo
where exists(
    select * from customer c 
    where address like '%서울%' and mo.custid=c.custid
);

--고객별 판매금액의 합계를 출력하시오.(고객번호,판매합계)
select custid,고객번호, sum(saleprice) 판매합계 from orders
group by custid; 

--고객별 판매금액의 합계를 출력하시오.(고객명,판매합계)
select (select name from customer c 
        where c.custid=o.custid) 고객명 , sum(saleprice) 판매합계 from orders o
group by o.custid; 

--주문목록에 책이름을 저장할 수 있는 컬럼을 추가하시오.
alter table orders add bookname varchar2(40);

update orders o set bookname = (select bookname from book b where b.bookid=o.bookid );

--고객번호가 2이하인 고객번호와 이름을 출력하시오.
select custid 고객번호, name 이름 from customer 
where custid <=2;

--고객번호가 2이하인 고객의 판매금액을 출력하시오,(고객이름과 고객별 판매액 출력)
select name 고객이름,sum(saleprice) 판매총액
from (select custid , name  from customer 
where custid <=2) c, orders o
where c.custid=o.custid
group by name;

select name 고객이름,sum(saleprice) 판매총액
from customer c,orders o
where c.custid=o.custid
group by name;

select custid,(select address from customer cs where cs.custid=od.custid)"address",
sum(saleprice)"total" from orders od group by od.custid;