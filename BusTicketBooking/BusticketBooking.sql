
CREATE TABLE BUS_DETAILS (
  BUS_ID int GENERATED ALWAYS AS IDENTITY START WITH 1,
  BUS_NO int ,
  OPERATOR_ID int ,
  BUS_CATEGORY varchar(20),
  FROM_CITY varchar(100) NOT NULL,
  TO_CITY varchar(100) NOT NULL,
  DEPARTURE timestamp NOT NULL,
  ARRIVAL timestamp NOT NULL,
  SEATER_FARE int NULL,
  TOTAL_SEAT int NOT NULL,
  SEAT_STATUS varchar(50),

  CONSTRAINT pk_busid PRIMARY KEY (Bus_Id),
  CONSTRAINT fk_bus_operatorid FOREIGN KEY (Operator_Id) REFERENCES bus_operators (Operator_Id)
) ;
commit;

desc bus_details;



CREATE TABLE USER_DETAILS (
  USER_ID int GENERATED ALWAYS AS IDENTITY START WITH 1,
  USER_NAME varchar(40) NOT NULL,
  USER_DOB date NOT NULL,
  USER_EMAIL varchar(30) NOT NULL UNIQUE,
  USER_CONTACT int NOT NULL UNIQUE,
  USER_GENDER varchar(30) NOT NULL,
  USER_PASSWORD varchar(50) NOT NULL,
  USER_WALLET int DEFAULT 0,
  USER_STATUS varchar(50) DEFAULT 'active',
  
  CONSTRAINT pk_userid PRIMARY KEY (user_id)
--  CONSTRAINT unique_user UNIQUE (user_email,user_contact)
);
commit;
desc bus_operators;

CREATE TABLE BUS_OPERATORS (
  OPERATOR_ID int GENERATED ALWAYS AS IDENTITY START WITH 1,
  OPERATOR_NAME varchar(40) NOT NULL,
  OPERATOR_EMAIL varchar(40) NULL UNIQUE,
  OPERATOR_CONTACT int NOT NULL UNIQUE,
  OPERATOR_AGE int NOT NULL, 
  OPERATOR_STATUS varchar(50) DEFAULT 'active' ,
  
  CONSTRAINT pk_operatorid PRIMARY KEY (Operator_Id)
--  CONSTRAINT unique_operator UNIQUE (operator_email,operator_contact)
) ;


CREATE TABLE BOOKED_TICKETS (
  BOOKING_ID int GENERATED ALWAYS AS IDENTITY START WITH 1,
  TICKET_NO varchar(50) NOT NULL,
  USER_ID int NOT NULL,
  BUS_ID int NOT NULL,
  BOOKING_DATE date DEFAULT sysdate,
  DEPARTURE_DATE date,
  SEAT_NO varchar(50) ,
  TICKET_COUNT int NOT NULL,
  TOTAL_PRICE int,
  BOOKING_STATUS varchar(30) DEFAULT 'confirmed',
  PAYMENT_STATUS varchar(50),

  CONSTRAINT pk_ticketno PRIMARY KEY (ticket_no),
  CONSTRAINT fk_booking_userid FOREIGN KEY (user_Id) REFERENCES user_details (user_Id) ,
  CONSTRAINT fk_booking_busid FOREIGN KEY (bus_Id) REFERENCES bus_details (bus_Id) 
);

insert into ticket_details (ticket_no,user_id,bus_id) values('564K210',1,2);

select * from ticket_details;
CREATE TABLE TICKET_DETAILS (
 TICKET_NO VARCHAR(50) NOT NULL ,
 USER_ID INT NOT NULL,
 BUS_ID INT NOT NULL,
 SEAT_NO INT NULL
 
  CONSTRAINT fk_ticket_ticketno FOREIGN KEY (ticket_no) REFERENCES booked_tickets (ticket_no),
  CONSTRAINT fk_ticket_busid FOREIGN KEY (bus_Id) REFERENCES bus_details (bus_Id),
  CONSTRAINT fk_ticket_userid FOREIGN KEY (user_Id) REFERENCES user_details (user_Id) 
);
 


CREATE TABLE ADMIN_DETAILS (
 ADMIN_ID int GENERATED ALWAYS AS IDENTITY START WITH 1,
 ADMIN_NAME varchar(50) NOT NULL,
 ADMIN_CONTACT int NOT NULL UNIQUE,
 ADMIN_PASSWORD varchar(50) NOT NULL,
 ADMIN_EMAIL varchar(50) NOT NULL UNIQUE,
 
 CONSTRAINT pk_adminid primary key (Admin_Id)
-- CONSTRAINT unique_admin UNIQUE (Admin_Email,Admin_contact)
 );
 





commit;

insert into admin_details (ADMIN_NAME,ADMIN_CONTACT,ADMIN_PASSWORD,ADMIN_EMAIL) values ('kalam',8923782372,'kalam','kalamadmin@gmail.com');
--insert into bus_details (bus_catagory, from_city, to_city, departure, arrival,sleeper_fare, seater_fare, total_seat) values ('super','trichy','bangalore',to_timestamp ( '21-12-2020 12:12', 'DD-MM-YYYY HH24:MI' ),to_timestamp ( '21-12-2020 23:11', 'DD-MM-YYYY HH24:MI' ),234,555,10);

commit;

select * from bus_details where to_char(departure,'dd-mm-yyyy')='24-12-2021' and from_city='Madurai' and to_city='Chennai';
select booking_id from booked_tickets where user_id=21 and booking_date='23-12-21';
commit;
drop table bus_details cascade constraints;

select * from user_details;
select * from bus_operators;
select  * from bus_details; 

desc booked_tickets;
COMMIT;
select * from admin_details;
select * from user_details where user_contact=7373639018 and user_status='Inactive';
select * from booked_tickets;

alter table booked_tickets drop column bus_no;


update bus_details set seat_status='Available'  where bus_id=1;

--------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------


select * from booked_tickets where ticket_no='1iMWhc6';
