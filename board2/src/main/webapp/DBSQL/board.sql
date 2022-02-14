create table board(

	board_id int primary key not null , 
    board_title varchar(40) not null , 
	board_contents varchar(3000) not null ,
    board_userid varchar(40) not null ,
    board_date varchar(100) not null ,
    board_available int ,
    board_file varchar(1000) 
    
);

create table reply(

	reply_num int primary key AUTO_INCREMENT , 
    reply_boardid int,
    reply_userid varchar(50) , 
    reply_contents varchar(1000)
    
);

create table member(

	member_id varchar(50) not null primary key ,
    member_password varchar(50) not null , 
    member_name varchar(10) not null ,
    member_phone varchar(30) ,
    member_email varchar(50) , 
    member_address varchar(100) 
    
);


create table product(

	product_id int primary key auto_increment not null ,
    product_name varchar(50) not null , 
    product_price int not null ,
    product_manufacturer varchar(50) not null ,
    product_category varchar(50) not null ,
    product_stock int not null , 
    product_conditions int not null , 
    product_file varchar(50) not null , 
    product_activation int not null , 
    product_salesrate int not null 
    
    
);



