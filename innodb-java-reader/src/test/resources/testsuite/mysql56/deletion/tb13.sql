DROP TABLE IF EXISTS `tb13`;
CREATE TABLE `tb13`
(`id` int(11) NOT NULL ,
`a` bigint(20) NOT NULL,
`b` varchar(64) NOT NULL,
`c` varchar(1024) default 'THIS_IS_DEFAULT_VALUE',
PRIMARY KEY (`id`),
INDEX a_idx (a),
UNIQUE INDEX b_a_idx (b, a)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

delimiter ;;
drop procedure if EXISTS idata;
create procedure idata()
begin
declare i int;
set i=1;
while(i<=2000)do
insert into tb13 values(i, i * 2, REPEAT('A', 16), concat(REPEAT('C', 8), char(97+(i % 26))));
set i=i+1;
end while;
end;;
delimiter ;
call idata();

delete from tb13 where a % 4 = 0;

delimiter ;;
drop procedure if EXISTS idata;
create procedure idata()
begin
declare i int;
set i=2001;
while(i<=3000)do
insert into tb13 values(i, i * 5, REPEAT('我', 8), concat(REPEAT('你', 4), char(97+(i % 26))));
set i=i+1;
end while;
end;;
delimiter ;
call idata();