-- 아래에 미션을 수행하는 쿼리를 작성해 보세요.


create table if not exists producct(
    id int not null,
    name varchar(32) not null,
    stock int,
    expiration_date date,
    list_price int,
    selling_price int,
    primary key(id)
);

insert into product values(1, 'carrot', 100, '2019-04-10', 1000, 900);
insert into product values(2, 'tea', 1000, '2020-02-10', 1000, 900);
insert into product values(3, 'clock', 100, null, 200000, 180000);
insert into product values(4, 'trump card', 100, null, 10000, 9000);
insert into product values(5, 'onion', 100, '2019-04-11', 2000, 1800);

select count(distinct name) as number_of_produccts
from producct;

select  sum(stock) as total_stock
from producct;

SELECT MAX(selling_price) AS max_selling_price
FROM product;
