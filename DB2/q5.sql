-- 아래에 미션을 수행하는 코드를 작성해 봅시다.


create table if not exists shareholder(

    name varchar(32) not null,

    stock int not null,

    agree tinyint(1) not null

);



insert into shareholder values("Alexis", 78000, 0);

insert into shareholder values("Brian", 145000, 1);

insert into shareholder values("Craig", 126000, 0);

insert into shareholder values("Dave", 95000, 1);

insert into shareholder values("Elice", 235000, 0);

insert into shareholder values("Fred", 67000, 1);

insert into shareholder values("Grace", 50000, 1);

insert into shareholder values("Helena", 100000, 1);

insert into shareholder values("Irene", 45000, 0);

insert into shareholder values("Jane", 80000, 1);

insert into shareholder values("Kevin", 105000, 0);





select  * from shareholder;

select * from shareholder where stock >= 100000;

select  name, stock from shareholder where name in ('Alexis','Craig','Fred');

select  name, stock from shareholder where agree = 0 and stock >= 100000;

select  name, stock from shareholder where agree = 1 and stock >= 100000;

select * from shareholder where stock >= 200000 or stock <= 100000;
