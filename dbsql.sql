create database johnson;

use johnson;

create table city(
name char(30) not null,
state char(30),
primary key (name));

create table store(
store_id int not null,
city_name char(30),
primary key (store_id),
foreign key (city_name) references city (name));

create table dept (
dept_id int not null,
name char(30),
floor int,
store_id int,
primary key (dept_id),
foreign key (store_id) references store (store_id));

create table employee (
employee_id int not null,
name char(30),
salary int,
manager int,
birthdate int,
startdate int,
primary key(employee_id));

alter table dept add column employee_id int;
alter table dept add foreign key (employee_id) references employee (employee_id);

create table debit(
debit_id int not null,
sdate date,
account int,
employee_id int,
primary key (debit_id),
foreign key (employee_id) references employee (employee_id));

create table sale(
quantity int,
debit_id int,
item_id int,
foreign key (debit_id) references debit (debit_id) );

create table item (
item_id int not null,
name char(30),
price int,
qoh int,
dept_id int,
primary key(item_id),
foreign key (dept_id) references dept (dept_id));

create table supplier(
supplier_id int not null,
name char(30),
city_name char(30),
primary key (supplier_id),
foreign key (city_name) references city (name) );

alter table item add column supplier_id int;
alter table item add foreign key (supplier_id) references supplier (supplier_id);

create table supply (
shipdate int,
quan int,
supplier_id int,
parts_id int,
foreign key (supplier_id) references supplier (supplier_id));

create table parts(
parts_id int not null,
name char(30),
color char(20),
weight int,
qoh int,
primary key (parts_id));

alter table supply add foreign key (parts_id) references parts (parts_id);

use johnson;
INSERT INTO city values ("Amherst","Mass");
INSERT INTO city values ("Atlanta","Ga");
INSERT INTO city values ("Boston","Mass");
INSERT INTO city values ("Dallas","Tex");
INSERT INTO city values ("Denver","Colo");
INSERT INTO city values ("El Cerrito","Calif");
INSERT INTO city values ("Hickville","Okla");
INSERT INTO city values ("Los Angeles","Calif");
INSERT INTO city values ("Madison","Wisc");
INSERT INTO city values ("New York","NY");
INSERT INTO city values ("Oakland","Calif");
INSERT INTO city values ("Paxton","Ill");
INSERT INTO city values ("Salt Lake City","Utah");
INSERT INTO city values ("San Diego","Calif");
INSERT INTO city values ("San Francisco","Calif");
INSERT INTO city values ("Seattle","Wash");
INSERT INTO city values ("White Plains","Neb");

insert into store (store_id,city_name) values (5,'San Francisco'),
(7,'Oakland'),(8,'El Cerrito');

select * from city;
select * from store;

select * from store order by store_id;

INSERT INTO EMPLOYEE values ("10","Ross Stanley","15908","199","1927","1945");
INSERT INTO EMPLOYEE values ("11","Ross Stuart","12067",NULL,"1931","1932");
INSERT INTO EMPLOYEE values ("13","Edwards Peter","9000","199","1928","1958");
INSERT INTO EMPLOYEE values ("26","Thompson Bob","13000","199","1930","1970");
INSERT INTO EMPLOYEE values ("32","Smythe Carol","9050","199","1929","1967");
INSERT INTO EMPLOYEE values ("33","Hayes Evelyn","10100","199","1931","1963");
INSERT INTO EMPLOYEE values ("35","Evans Michael","5000","32","1952","1974");
INSERT INTO EMPLOYEE values ("37","Raveen Lemont","11985","26","1950","1974");
INSERT INTO EMPLOYEE values ("55","James Mary","12000","199","1920","1969");
INSERT INTO EMPLOYEE values ("98","Williams Judy","9000","199","1935","1969");
INSERT INTO EMPLOYEE values ("129","Thomas Tom","10000","199","1941","1962");
INSERT INTO EMPLOYEE values ("157","Jones Tim","12000","199","1940","1960");
INSERT INTO EMPLOYEE values ("199","Bullock J.D.","27000",NULL,"1920","1920");
INSERT INTO EMPLOYEE values ("215","Collins Joanne","7000","10","1950","1971");
INSERT INTO EMPLOYEE values ("430","Brunet Paul C.","17674","129","1938","1959");
INSERT INTO EMPLOYEE values ("843","Schmidt Herman","11204","26","1936","1956");
INSERT INTO EMPLOYEE values ("994","Iwano Masahiro","15641","129","1944","1970");
INSERT INTO EMPLOYEE values ("1110","Smith Paul","6000","33","1952","1973");
INSERT INTO EMPLOYEE values ("1330","Onstad Richard","8779","13","1952","1971");
INSERT INTO EMPLOYEE values ("1523","Zugnoni Arthur A.","19868","129","1928","1949");
INSERT INTO EMPLOYEE values ("1639","Choy Wanda","11160","55","1947","1970");
INSERT INTO EMPLOYEE values ("2398","Wallace Maggie J.","7880","26","1940","1959");
INSERT INTO EMPLOYEE values ("4901","Bailey Chas M.","8377","32","1956","1975");
INSERT INTO EMPLOYEE values ("5119","Bono Sonny","13621","55","1939","1963");
INSERT INTO EMPLOYEE values ("5219","Schwarz Jason B.","13374","33","1944","1959");

insert into dept (dept_id,name,store_id,floor,employee_id)
values (1,'Bargain',5,0,37);
        (10,'Candy',5,1,13),
        (14,'Jewelry',8,1,33),
        (19,'Furniture',7,4,26),
        (20,'Major Appliances ',7,4,26),
        (26,'Linens',7,3,157),
        (28,"Women's",8,2,32),
        (34,'Stationary',5,1,33),
        (35,'Book',5,1,55),
        (43,"Children's",8,2,32),
        (47,'Junior Miss',7,2,129),
        (49,'Toys',8,2,35),
        (58,"Men's",7,2,129),
        (60,'Sportswear',2,1,10),
        (63,"Women's",7,3,32),
        (65,"Junior's",7,3,37),
        (70,"Women's",5,1,10),
        (73,"Children's",5,1,10),
        (99,'Giftwrap',5,1,98);

INSERT INTO dept values ("1","Bargain","5","0","37");
INSERT INTO dept (dept_id,name,store_id,floor,employee_id) values ("10","Candy","5","1","13");
INSERT INTO dept (dept_id,name,store_id,floor,employee_id)values ("14","Jewelry","8","1","33");
INSERT INTO dept (dept_id,name,store_id,floor,employee_id) values ("19","Furniture","7","4","26");
INSERT INTO dept (dept_id,name,store_id,floor,employee_id) values ("20","Major","Appliances","7","4","26");
INSERT INTO dept (dept_id,name,store_id,floor,employee_id) values ("26","Linens","7","3","157");
INSERT INTO dept (dept_id,name,store_id,floor,employee_id) values ("28","Women's","8","2","32");
INSERT INTO dept (dept_id,name,store_id,floor,employee_id) values ("34","Stationary","5","1","33");
INSERT INTO dept (dept_id,name,store_id,floor,employee_id) values ("35","Book","5","1","55");
INSERT INTO dept (dept_id,name,store_id,floor,employee_id) values ("43","Children's","8","2","32");
INSERT INTO dept (dept_id,name,store_id,floor,employee_id) values ("47","Junior Miss","7","2","129");
INSERT INTO dept (dept_id,name,store_id,floor,employee_id) values ("49","Toys","8","2","35");
INSERT INTO dept (dept_id,name,store_id,floor,employee_id) values ("58","Men's","7","2","129");
INSERT INTO dept (dept_id,name,store_id,floor,employee_id) values ("60","Sportswear","5","1","10");
INSERT INTO dept (dept_id,name,store_id,floor,employee_id) values ("63","Women's","7","3","32");
INSERT INTO dept (dept_id,name,store_id,floor,employee_id) values ("65","Junior's","7","3","37");
INSERT INTO dept (dept_id,name,store_id,floor,employee_id) values ("70","Women's","5","1","10");
INSERT INTO dept (dept_id,name,store_id,floor,employee_id) values ("73","Children's","5","1","10");
INSERT INTO dept (dept_id,name,store_id,floor,employee_id) values ("99","Giftwrap","5","1","98");

alter table dept drop constraint dept_ibfk_1;

insert into parts ("&parts_id","&name","&color","&weight","&qoh");
select * from parts;

show columns from dept;
select * from dept;

alter table dept add foreign key (store_id) references store (store_id);

insert into dept (dept_id,name,store_id,floor,employee_id) values (1,'Bargain',5,0,37);
delete from dept where dept_id=1;
alter table dept add foreign key (store_id) references store (store_id);


delete from debit where employee_id>34;

insert into debit (debit_id,sdate,employee_id,account)
values (100581,"1995-01-15",157,10000000),
(100582,"1995-01-15",1110,14356540),
(100586,"1995-01-16",35,14096831),
(100592,"1995-01-17",129,10000000),
(100593,"1995-01-18",13,11652133),
(100594,"1995-01-18",215,12591815);

select * from debit;

delete from parts where parts_id>0;

insert into parts (parts_id,name,color,weight,qoh)
values (1,'central processor','pink',10,1),
(2,'memory','gray',20,32),
(3,'disk drive','black',685,2),
(4,'tape drive','black',450,4),
(5,'tapes','gray',1,250),
(6,'line printer','yellow',578,3),
(7,'l-p paper','white',15,95),
(8,'terminals','blue',19,15),
(9,'terminal paper','white',2,350),
(10,'byte-soap','clear',0,143),
(11,'card reader','gray',327,0),
(12,'card punch','gray',427,0),
(13,'paper tape reader','black',107,0),
(14,'paper tape punch','black',147,0);

INSERT INTO supplier (supplier_id,name,city_name) values ("5","Amdahl","San Diego");
INSERT INTO supplier (supplier_id,name,city_name) values ("15","White Stag","White Plains");
INSERT INTO supplier (supplier_id,name,city_name) values ("20","Wormley","Hickville");
INSERT INTO supplier (supplier_id,name,city_name) values ("33","Levi-Strauss","San Francisco");
INSERT INTO supplier (supplier_id,name,city_name) values ("42","Whitman's","Denver");
use johnson;
INSERT INTO supplier (supplier_id,name,city_name) values 
(62,'Data General',"atlanta"),
(67,"Edger","Salt Lake City"),
(89,"Fisher-Price","Boston"),
(122,"White Paper","Seattle"),
(125,"Playskool","Dallas"),
(199,"Korret","Los Angeles"),
(213,"Cannon","Atlanta"),
(241,"IBM","New York"),
(440,"Spooley","Paxton"),
(475,"DEC","Amherst"),
(999,"A E Neumann","Madison");

alter table supply drop column shipdate;
alter table supply add column shipdate date;
insert into supply (supplier_id,parts_id,shipdate,quan) values
(5,4,"1994-11-15",3),
(5,4,"1995-01-22",6),
(20,5,"1995-01-10",20),
(20,5,"1995-01-11",75),
(62,3,"1994-06-18",3),
(67,4,"1995-07-01",1);
INSERT INTO supply (supplier_id,parts_id,shipdate,quan) values ("89","3","1995-07-04","1000");
INSERT INTO supply (supplier_id,parts_id,shipdate,quan) values ("89","4","1995-07-04","1000");
INSERT INTO supply (supplier_id,parts_id,shipdate,quan) values ("122","7","1995-02-01","144");
INSERT INTO supply (supplier_id,parts_id,shipdate,quan) values ("122","7","1995-02-02","48");
INSERT INTO supply (supplier_id,parts_id,shipdate,quan) values ("122","9","1995-02-01","144");
INSERT INTO supply (supplier_id,parts_id,shipdate,quan) values ("241","1","1995-06-01","1");
INSERT INTO supply (supplier_id,parts_id,shipdate,quan) values ("241","2","1995-06-01","32");
INSERT INTO supply (supplier_id,parts_id,shipdate,quan) values ("241","3","1995-06-01","1");
INSERT INTO supply (supplier_id,parts_id,shipdate,quan) values ("241","4","1993-12-31","1");
INSERT INTO supply (supplier_id,parts_id,shipdate,quan) values ("241","8","1995-07-01","1");
INSERT INTO supply (supplier_id,parts_id,shipdate,quan) values ("241","9","1995-07-01","144");
INSERT INTO supply (supplier_id,parts_id,shipdate,quan) values ("440","6","1994-10-10","2");
INSERT INTO supply (supplier_id,parts_id,shipdate,quan) values ("475","1","1993-12-31","1");
INSERT INTO supply (supplier_id,parts_id,shipdate,quan) values ("475","1","1994-07-01","1");
INSERT INTO supply (supplier_id,parts_id,shipdate,quan) values ("475","2","1993-12-31","32");
INSERT INTO supply (supplier_id,parts_id,shipdate,quan) values ("475","2","1994-05-31","32");
INSERT INTO supply (supplier_id,parts_id,shipdate,quan) values ("475","3","1993-12-31","2");
INSERT INTO supply (supplier_id,parts_id,shipdate,quan) values ("475","4","1994-05-31","1");
INSERT INTO supply (supplier_id,parts_id,shipdate,quan) values ("999","10","1996-01-01","144");

INSERT INTO item(item_id,name,price,qoh,supplier_id,dept_id) values ("11","Wash Cloth","75","575","213","1");
INSERT INTO item(item_id,name,price,qoh,supplier_id,dept_id) values ("19","Bellbottoms","450","600","33","43");
INSERT INTO item(item_id,name,price,qoh,supplier_id,dept_id) values ("21","ABC Blocks","198","405","125","1");
INSERT INTO item(item_id,name,price,qoh,supplier_id,dept_id) values ("23","1 lb Box","215","100","42","10");
INSERT INTO item(item_id,name,price,qoh,supplier_id,dept_id) values ("25","2 lb Box, Mix","450","75","42","10");
INSERT INTO item(item_id,name,price,qoh,supplier_id,dept_id) values ("26","Earrings","1000","20","199","14");
INSERT INTO item(item_id,name,price,qoh,supplier_id,dept_id) values ("43","Maze","325","200","89","49");
INSERT INTO item(item_id,name,price,qoh,supplier_id,dept_id) values ("52","Jacket","3295","300","15","60");
INSERT INTO item(item_id,name,price,qoh,supplier_id,dept_id) values ("101","Slacks","1600","325","15","63");
INSERT INTO item(item_id,name,price,qoh,supplier_id,dept_id) values ("106","Clock Book","198","150","125","49");
INSERT INTO item(item_id,name,price,qoh,supplier_id,dept_id) values ("107","The 'Feel' Book","225","225","89","35");
INSERT INTO item(item_id,name,price,qoh,supplier_id,dept_id) values ("115","Gold Ring","4995","10","199","14");
INSERT INTO item(item_id,name,price,qoh,supplier_id,dept_id) values ("118","Towels, Bath","250","1000","213","26");
INSERT INTO item(item_id,name,price,qoh,supplier_id,dept_id) values ("119","Squeeze Ball","250","400","89","49");
INSERT INTO item(item_id,name,price,qoh,supplier_id,dept_id) values ("120","Twin Sheet","800","750","213","26");
INSERT INTO item(item_id,name,price,qoh,supplier_id,dept_id) values ("121","Queen Sheet","1375","600","213","26");
INSERT INTO item(item_id,name,price,qoh,supplier_id,dept_id) values ("127","Ski Jumpsuit","4350","125","15","65");
INSERT INTO item(item_id,name,price,qoh,supplier_id,dept_id) values ("165","Jean","825","500","33","65");
INSERT INTO item(item_id,name,price,qoh,supplier_id,dept_id) values ("258","Shirt","650","1200","33","58");
INSERT INTO item(item_id,name,price,qoh,supplier_id,dept_id) values ("301","Boy's Jean Suit","1250","500","33","43");

INSERT INTO sale (debit_id,item_id,quantity) values ("100581","118","5");
INSERT INTO sale (debit_id,item_id,quantity) values ("100581","120","1");
INSERT INTO sale (debit_id,item_id,quantity) values ("100582","26","1");
INSERT INTO sale (debit_id,item_id,quantity) values ("100586","106","2");
INSERT INTO sale (debit_id,item_id,quantity) values ("100586","127","3");
INSERT INTO sale (debit_id,item_id,quantity) values 
(100592,258,1),
(100593,23,2),
(100594,52,1);

insert into dept (dept_id,name,store_id,floor,employee_id) values (20,"Major Appliances",7,4,26);
alter table city order by 
  delete from supply where shipdate is null;
  
  USE JOHNSON;
  select name,weight from parts where exists(select name from supplier where );
  
  select * from employee; /* 2*/
  
  select name from dept ;/*3*/
  
  select * from parts where qoh=0;/*4*/
  
  select * from employee where salary between 10000 and 12000;/*5*/
  
  select name,price,price+price*(10/100) from item where dept_id=49;/*6*/
  
  select name,employee_id,salary from employee where name like '% S%';/*7*/
  
  select name,weight from parts where parts_id in
    (select  parts_id from supply where supplier_id in
    (select supplier_id from supplier where name='DEC'));/*8*/
  
  select DISTINCT a.name,a.weight
    from parts a,supplier b,supply c
    where a.parts_id=c.parts_id and c.supplier_id=b.supplier_id and b.name='DEC';/*9*/
  
  select name,color from parts where weight>
    (select weight from parts where color='black' and name='tape drive');/*10*/
    
  select a.name,a.color 
    from parts a,parts b
    where a.weight > b.weight and b.color='black' and b.name='tape drive';/*11*/
     
  select avg(salary) from employee where manager=199;/*12*/
   
    select supplier.name ,count( distinct item_id) from supplier join item  on supplier.supplier_id=item.supplier_id group by name;/*13*/
    
    select sum(p.weight) from parts p,supplier s,supply a,city c 
        where c.state='Mass' and c.name=s.city_name and s.supplier_id=a.supplier_id and a.parts_id=p.parts_id group by s.supplier_id;/*14*/
     
    insert into supplier values (30,'xyz','San Diego');/*15*/
    
    select d.store_id ,e.name, e.salary ,e.salary+e.salary*(5/100)from employee e,dept d
    where d.store_id=8 and d.employee_id=e.employee_id;/*16*/