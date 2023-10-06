set serveroutput on;
exec interest;

create table book_log(
    bookid_l number,
    bookname_l varchar2(40),
    publisher_1 varchar2(40),
    price_l number
);

--커서를 이용하는 프로시저
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
    DBMS_OUTPUT.PUT_LINE('전체 이익금액 =' || round(myInterest,3));
end;
--트리거
create or replace trigger afterinsertbook
after insert on book for each row
declare 
    average number;
begin
    insert into book_log
    values(:new.bookid,:new.bookname,:new.publisher,:new.price);
    dbms_output.put_line('삽입 행을 book_log 테이블에 백업했습니다.');
end;

insert into book values(15,'과학좋아요','과학미디어',25000);
select * from book where bookid=15;
select * from book_log where bookid_l=15;

--사용자 정의 함수 만들기
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

--실행할때 블럭설정하고 실행해 주세요.
select custid,orderid,saleprice,fnc_interest(saleprice) 이익금 from orders;
--연습문제
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

--실행할때 블랙설정한 후에 하기
exec insertcustomer(6,'박현경','서울시 용산구 한남동', '010-1234-7653');
select * from customer;
