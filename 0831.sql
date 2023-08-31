insert into orders VALUES(1,1,1, 6000, TO_DATE('2023-01-10','yyyy-mm-dd'));
insert into orders VALUES(2,1,3, 21000, TO_DATE('2023-03-15','yyyy-mm-dd'));
insert into orders VALUES(3,2,5, 8000, TO_DATE('2022-11-07','yyyy-mm-dd'));
insert into orders VALUES(4,3,6, 6000, TO_DATE('2023-07-12','yyyy-mm-dd'));
insert into orders VALUES(5,4,7, 20000, TO_DATE('2023-07-07','yyyy-mm-dd'));
insert into orders VALUES(6,1,2, 12000, TO_DATE('2023-11-14','yyyy-mm-dd'));
insert into orders VALUES(7,4,8, 13000, TO_DATE('2023-08-28','yyyy-mm-dd'));
insert into orders VALUES(8,3,10, 12000, TO_DATE('2023-08-04','yyyy-mm-dd'));
insert into orders VALUES(9,2,10, 7000, TO_DATE('2023-10-29','yyyy-mm-dd'));
insert into orders VALUES(10,3,8, 13000, TO_DATE('2023-10-04','yyyy-mm-dd'));

insert into imported_book values(21,'zen Golf', 'person', 12000);
insert into imported_book values(22,'soccer Skills', 'Human Kinetics', 15000);

select publisher, price FROM book
                        where bookname like '축구의 역사'; 
                        
select phone from customer
where name='김연아';

select * from customer
where name='김연아';

--book테이블에서 도서명과 가격을 검색하시오.
select bookname, price from book;
--book테이블에서 가격과 도서명을 검색하시오.
select price, bookname from book;
--book테이블에서 도서번호,도서명,출판사,가격을 검색하시오
select *from book;
--book테이블에서 모든 출판사를 검색하시오.
select publisher from book;
--book테이블에서 모든 출판사를 검색하시오.(중복되는 출판사는 제거하세요.)
select distinct publisher from book;
--book테이블에서 가격이 8000원 미만인 도서를 검색하시오.
select *from book
where price <8000;
--book테이블에서 가격이 10000원이상 16000원 이하인 도서를 검색하시오.
select * from book where price BETWEEN 10000 and 20000;
--book테이블에서 가격이 10000원이상 16000원 이하인 도서를 검색하시오.
--단, between and 를 사용하지 마시오.
select * from book
where price >=10000 and price <= 16000;

--book테이블에서 출판사가 굿스포츠,데이원,어크로스인 도서를 검색하시오.
--단 in 연산자를 사용하시오.
select * from book where publisher In ('굿스포츠','데이원','어크로스');
--book테이블에서 출판사가 굿스포츠,데이원,어크로스인 도서를 검색하시오.
--단 in 연산자를 사용하지마시오. (비교연산자와 or 연산자 사용)
select * from book where publisher='굿스포츠' or publisher='데이원'or publisher='어크로스' ;
--book 테이블에서 출판사가 굿스포츠,데이원,어크로스가 아닌 도서를 검색하시오.
--단  not in 연산자를 사용하시오.
select *from book
where publisher not in ('굿스포츠','데이원','어크로스');
--book 테이블에서 출판사가 굿스포츠,데이원,어크로스가 아닌 도서를 검색하시오.
--단  not in 연산자를 사용하지마시오.(비교연산자와 or 연산자 사용)
select * from book 
where publisher<>'굿스포츠' and publisher<>'데이원' and publisher<>'어크로스';
--book테이블에서 도서명이 축구의 역사인 검색하시오. 
select * from book 
        where bookname='축구의 역사';
        
select * from book 
        where bookname like '축구의 역사'; 
--book테이블에서 도서명이 축구라는 문자열이 포함된 행을 검색하시오.
select *from book
where bookname like '%축구%';
--book테이블에서 도서명에 과학이라는 문자열이 포함된 행을 검색하시오.
select *from book
where bookname like '%과학%';
--book테이블에서 도서명에 과학이라는 문자열로 끝나는 행을 검색하시오.
select *from book
where bookname like '%과학';
--book테이블에서 도서명에  '의'자 앞에 임의의 3글자가 포함된 문자열을 갖는 행을 검색하시오.
select *from book where bookname like '___의%';

        

