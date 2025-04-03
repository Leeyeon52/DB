-- 아래에 문제 설명대로 정보를 추가해 봅시다.






-- product테이블 전체를 조회해 봅시다.


create table if not exists product(
    id int not null,
    name varchar(32) not null,
    stock int,
    expiration_date date,
    list_price int,
    selling_price int,
    primary key(id)
);


insert into product (id, name, stock, expiration_date, list_price, selling_price)
values
	(1, '라면', 100, '2025-12-31', 1500, 1200),
    (2, '과자', 50, '2025-06-30', 2000, 1800),
    (3, '음료수', 200, '2025-09-30', 1000, 800),
    (4, '햇반', 80, '2026-03-31', 3000, 2500),
    (5, '통조림', 30, NULL, 5000, 4500);

SELECT * FROM product;
