DROP TABLE IF EXISTS CUSTOMER;
CREATE TABLE CUSTOMER(
   CUSTOMER_ID   VARCHAR (20)               NOT NULL,
   COUNTRY VARCHAR (20)            NOT NULL,
   INDUSTRY  VARCHAR (20)          NOT NULL,

   PRIMARY KEY (CUSTOMER_ID),
   INDEX (COUNTRY),
   INDEX (INDUSTRY)
) Engine=INNODB;

DROP TABLE IF EXISTS SALES;
CREATE TABLE SALES(
    SALE_ID   VARCHAR (20)               NOT NULL,
   INVOICE_TOTAL INT            NOT NULL,
   CUSTOMER_ID  VARCHAR (20)          NOT NULL,
   `DATE` DATE  NOT NULL,
    PRIMARY KEY(SALE_ID),
    INDEX (`DATE`),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
)Engine=INNODB ;

INSERT INTO CUSTOMER Values('C1', 'DE', 'Automotive'), ('C2', 'EN', 'Healthcare'), ('C3', 'CH', 'F&B');

INSERT INTO SALES Values('S1', 10, 'C2', '2016-04-22'), ('S2', 185, 'C1', '2016-04-21'), ('S3', 185, 'C3', '2016-04-21');

-----------------------SELECT Statements-------------------------------------------------------
--1. Write a SQL query that displays the amount of customers per industry.
select industry, count(*) from CUSTOMER group by industry;

--2. Write a SQL query that displays the average invoice total per industry
select c.industry, avg(s.invoice_total) from CUSTOMER c join SALES s on c.CUSTOMER_ID = s.CUSTOMER_ID group by c.industry;

--3.Write a SQL query that displays what each customer spent per month, if that value is bigger than 100.
select c.CUSTOMER_ID, sum(s.INVOICE_TOTAL) from CUSTOMER c join SALES s on c.CUSTOMER_ID = s.CUSTOMER_ID where s.INVOICE_TOTAL > 100 group by month(s.`date`), c.customer_id;