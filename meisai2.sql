
select review_id as review_id,star_rating,review_body ,h.helpful_votes
from hairdryer h
where 
review_body like '%powerful%' or
review_body like '%fast%' or
review_body like '%strong%' or
review_body like '%weak%' or
review_body like '%long%' or
review_body like '%short%' or
review_body like '%expensive%' or
review_body like '%cheap%' or
review_body like '%easy%' or
review_body like '%hard%' or
review_body like '%beautiful%' or
review_body like '%ugly%' ;

select * from hairdryer_analysis;

create table hairdryer_analysis(
    review_id VARCHAR2(26 BYTE),
    star_rating NUMBER(2),
    helpful_votes  number(38),
    powerful NUMBER(2),
    durability number（2）,
    price number(2),
    comfortable number(2),
    appearance number(2),
    review_body varchar2(4000 byte)
); 

drop table hairdryer_analysis;

UPDATE hairdryer_analysis SET hairdryer_analysis.powerful=1 where review_body  like '%powerful%' or review_body  like '%strong%' or review_body  like '%fast%'  or review_body  like '%hot%' ;
UPDATE hairdryer_analysis SET hairdryer_analysis.powerful=-1 where review_body  like '%weak%';
UPDATE hairdryer_analysis SET hairdryer_analysis.durability=1 where review_body  like '%long%';
UPDATE hairdryer_analysis SET hairdryer_analysis.durability=-1 where review_body  like '%short%';
UPDATE hairdryer_analysis SET hairdryer_analysis.price=1 where review_body  like '%expensive%';
UPDATE hairdryer_analysis SET hairdryer_analysis.price=-1 where review_body  like '%cheap%';
UPDATE hairdryer_analysis SET hairdryer_analysis.comfortable=1 where review_body  like '%easy%';
UPDATE hairdryer_analysis SET hairdryer_analysis.comfortable=-1 where review_body  like '%hard%';
UPDATE hairdryer_analysis SET hairdryer_analysis.appearance=1 where review_body  like '%beautiful%';
UPDATE hairdryer_analysis SET hairdryer_analysis.appearance=-1 where review_body  like '%ugly%';

review_body like '%powerful%' or
review_body like '%weak%' or
review_body like '%long%' or
review_body like '%short%' or
review_body like '%expensive%' or
review_body like '%cheap%' or
review_body like '%easy%' or
review_body like '%hard%' or
review_body like '%beautiful%' or
review_body like '%ugly%' ;

UPDATE hairdryer_analysis SET hairdryer_analysis.powerful=0,durability=0,price=0,comfortable=0,appearance=0;

select review_id,star_rating,helpful_votes,powerful,durability,price,comfortable,appearance from hairdryer_analysis;

--第二大问D题
select product_id,count(*)  from hairdryer group by product_id order by count(*) desc;

select product_id,to_char(review_date,'yyyy-mm')as month,count(*),round(sum(star_rating)/count(star_rating),1) as avgstars
from hairdryer where 
product_id='B003V264WW' or 
product_id='B0009XH6TG' or 
product_id='B00132ZG3U' or 
product_id='B00005O0MZ' or 
product_id='B000R80ZTQ' 
group by to_char(review_date,'yyyy-mm'),product_id
order by  to_char(review_date,'yyyy-mm');

create table hairdryer_final(
    review_id varchar2(26 byte),
    product_id varchar2(26 byte),
    star_rating number(38,0),
    helpful_votes number(38,0),
    powerful number(2,0),
    durability number(2,0),
    price number(2,0),
    comfortable number(2,0),
    appearance number(2,0),
    review_date date,
    review_body varchar2(4000 byte)
);

delete from hairdryer_final;

drop table hairdryer_final;
 
select h2.review_id, h1.product_id, h2.star_rating ,h2.helpful_votes, h2.powerful, durability, price ,comfortable ,appearance,h1.review_date ,h2.review_body
from hairdryer h1 ,hairdryer_analysis h2 
where h1.review_id=h2.review_id ;

select h1.review_id,h2.review_id,h2.star_rating
from hairdryer h1,
hairdryer_analysis h2 
where h1.review_id=h2.review_id ;


select review_id, product_id, star_rating, helpful_votes, review_date, review_body from hairdryer where review_id in (select distinct(review_id) from hairdryer_analysis);


--第二大问B题

select to_char(review_date,'yyyy-Q')as SEASON,round(sum(star_rating)/count(*),1)*0.2 as avgstars,(round((sum(powerful)+sum(durability)+sum(price)+sum(comfortable)+sum(appearance))/count(*),1)/2+2.5)*0.8 as reputation
from hairdryer_final 
group by to_char(review_date,'yyyy-Q')
order by  to_char(review_date,'yyyy-Q');

select to_char(review_date,'yyyy-Q') as time
 from hairdryer_final ;

--第二大问E题

select review_body from hairdryer where star_rating =1;

select review_body from hairdryer where star_rating =2;

select review_body from hairdryer where star_rating =3;

select review_body from hairdryer where star_rating =4;

select review_body from hairdryer where star_rating =5;

select * from hairdryer_final;

--微波炉
select review_id,star_rating,helpful_votes,review_body 
from microwave
where 
review_body like '%stainless%' or
review_body like '%lasted%' or
review_body like '%broke%' or
review_body like '%break%' or
review_body like '%larger%' or
review_body like '%big%' or
review_body like '%small%' or
review_body like '%tiny%' or
review_body like '%repaired%' or
review_body like '%repaired%' or
review_body like '%powerful%' or
review_body like '%useful%' or
review_body like '%useless%' or
review_body like '%incompetent%' or
review_body like '%expensive%' or
review_body like '%costly%' or
review_body like '%cheap%' or
review_body like '%inexpensive%' ;

create table microwave_analysis(
    review_id VARCHAR2(26 BYTE),
    star_rating NUMBER(2),
    helpful_votes  number(38),
    quality   NUMBER(2),
    capacity        number（2）,
    after_sale   number(2),
    function	 number(2),
    price		 number(2),
    review_body varchar2(4000 byte)
); 
drop table microwave_analysis;
select * from microwave_analysis;
UPDATE microwave_analysis SET quality=0,capacity=0,after_sale=0,function=0,price=0;

UPDATE microwave_analysis SET quality=1 where review_body  like '%stainless%' or review_body  like '%lasted%';
UPDATE microwave_analysis SET quality=-1 where review_body  like '%broke%' or review_body  like '%break%';
UPDATE microwave_analysis SET capacity=1 where review_body  like '%large%' or review_body  like '%big%';
UPDATE microwave_analysis SET capacity=-1 where review_body  like '%small%' or review_body  like '%tiny%';
UPDATE microwave_analysis SET after_sale=1 where review_body  like '%Warranty%';
UPDATE microwave_analysis SET after_sale=-1 where review_body  like '%repaired%';
UPDATE microwave_analysis SET function=1 where review_body  like '%powerful%' or review_body  like '%useful%';
UPDATE microwave_analysis SET function=-1 where review_body  like '%useless%' or review_body  like '%incompetent%';
UPDATE microwave_analysis SET price=1 where review_body  like '%expensive%' or review_body  like '%costly%';
UPDATE microwave_analysis SET price=-1 where review_body  like '%cheap%' or review_body  like '%inexpensive%';

select review_id ,star_rating ,helpful_votes ,quality ,capacity ,after_sale ,FUNCTION ,price from microwave_analysis;
--奶嘴
select review_id,star_rating,helpful_votes,review_body 
from pacifier2
where 
review_body like '%%' ;

create table pacifier_analysis(
    review_id VARCHAR2(26 BYTE),
    star_rating NUMBER(2),
    helpful_votes  number(38),
    quality   NUMBER(2),
    size_        number（2）,
    appearant   number(2),
    health	 number(2),
    texture		 number(2),
    review_body varchar2(4000 byte)
); 
drop table pacifier_analysis;

select review_id,star_rating,helpful_votes,review_body 
from pacifier2
where 
review_body like '%months%' or
review_body like '%lasted%' or
review_body like '%broke%' or
review_body like '%break%' or
review_body like '%larger%' or
review_body like '%big%' or
review_body like '%small%' or
review_body like '%little%' or
review_body like '%cute%' or
review_body like '%pretty%' or
review_body like '%ugly%' or
review_body like '%unlovely%' or
review_body like '%health%' or
review_body like '%clean%' or
review_body like '%dirty%' or
review_body like '%unsafe%' or
review_body like '%soft%' or
review_body like '%plastic%' or
review_body like '%hard%'or
review_body like '%material%';

UPDATE pacifier_analysis SET quality=0,size_=0,appearant=0,health=0,texture=0;

UPDATE pacifier_analysis SET quality=1 where review_body  like '%months%' or review_body  like '%lasted%';
UPDATE pacifier_analysis SET quality=-1 where review_body  like '%broke%' or review_body  like '%break%';
UPDATE pacifier_analysis SET size_=1 where review_body  like '%large%' or review_body  like '%big%';
UPDATE pacifier_analysis SET size_=-1 where review_body  like '%small%' or review_body  like '%little%';
UPDATE pacifier_analysis SET appearant=1 where review_body  like '%cute%' or review_body  like '%pretty%';
UPDATE pacifier_analysis SET appearant=-1 where review_body  like '%ugly%' or review_body  like '%unlovely%';
UPDATE pacifier_analysis SET health=1 where review_body  like '%health%' or review_body  like '%clean%';
UPDATE pacifier_analysis SET health=-1 where review_body  like '%dirty%' or review_body  like '%unsafe%';
UPDATE pacifier_analysis SET texture=1 where review_body  like '%soft%';
UPDATE pacifier_analysis SET texture=-1 where review_body  like '%hard%' or review_body  like '%material%';

select review_id ,star_rating ,helpful_votes ,quality ,size_ ,appearant ,health ,price from pacifier_analysis;

select * from pacifier_analysis;