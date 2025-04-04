CREATE TABLE STORE(
  store_id		INT 		NOT NULL PRIMARY KEY,
  store_name	VARCHAR(30) NOT NULL
);

INSERT INTO STORE VALUES
(1000, 'pizza'),
(1001, 'bunsik'),
(1002, 'ice-cream'),
(1003, 'coffee'),
(1004, 'cake');

CREATE TABLE PAYMENT(
  payment_id	INT NOT NULL PRIMARY KEY,
  store_id		INT NOT NULL,
  pay_amount	INT NOT NULL
);

INSERT INTO PAYMENT VALUES
(10123, 1000, 1000),
(10124, 1002, 6000),
(10125, 1001, 10000),
(10126, 1001, 3000),
(10127, 1003, 4500),
(10128, 1002, 5000);


