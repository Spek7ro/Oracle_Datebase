-- Practica #01: Venta de productos
-- Materia: Laboratorio de Base de Datos
-- Alumno: Cristian Omar Alvarado Rodriguez

CREATE TABLE CUSTOMER (
    ID_CUSTOMER NUMBER(5) CONSTRAINT CUSTOMER_PK PRIMARY KEY,
    NAME_CUSTOMER VARCHAR2(30) CONSTRAINT CUSTOMER_NAME_NN NOT NULL,
    SURNAME_CUSTOMER VARCHAR2(30) CONSTRAINT CUSTOMER_SURNAME_NN NOT NULL,
    ADDRESS_CUSTOMER VARCHAR2(70) CONSTRAINT CUSTOMER_ADDRESS_NN NOT NULL,
    PHONE_CUSTOMER VARCHAR2(10) CONSTRAINT CUSTOMER_PHONE_NN NOT NULL
);

SELECT * FROM CUSTOMER;

CREATE TABLE TYPE_PRODUCT (
    ID_TYPE_PRODUCT NUMBER(5) CONSTRAINT TYPE_PRODUCT_PK PRIMARY KEY,
    NAME_TYPE_PRODUCT VARCHAR2(30) CONSTRAINT TYPE_PRODUCT_NAME_NN NOT NULL,
    DESCRIPTION_TYPE_PRODUCT VARCHAR2(70) CONSTRAINT TYPE_PRODUCT_DESCRIPTION_NN NOT NULL
);

SELECT * FROM TYPE_PRODUCT;

CREATE TABLE PRODUCT (
    ID_PRODUCT NUMBER(5),
    ID_TYPE_PRODUCT NUMBER(5),
    NAME_PRODUCT VARCHAR2(30) CONSTRAINT PRODUCT_NAME_NN NOT NULL,
    PRICE_PRODUCT NUMBER(8,2) CONSTRAINT PRODUCT_PRICE_NN NOT NULL,
    AUTHOR_PRODUCT VARCHAR2(30) CONSTRAINT PRODUCT_AUTHOR_NN NOT NULL,
    EDITORIAL_PRODUCT VARCHAR2(30) CONSTRAINT PRODUCT_EDITORIAL_NN NOT NULL,
    CONSTRAINT PRODUCT_PK PRIMARY KEY (ID_PRODUCT, ID_TYPE_PRODUCT),
    CONSTRAINT PRO_FK_TYPE_PRO FOREIGN KEY (ID_TYPE_PRODUCT) REFERENCES TYPE_PRODUCT (ID_TYPE_PRODUCT)
);

ALTER TABLE PRODUCT ADD STOCK_PRODUCT NUMBER(5) CONSTRAINT PRODUCT_STOCK_NN NOT NULL;

SELECT * FROM PRODUCT;

CREATE TABLE STORE (
    ID_STORE NUMBER(5) CONSTRAINT STORE_PK PRIMARY KEY,
    NAME_STORE VARCHAR2(30) CONSTRAINT STORE_NAME_NN NOT NULL,
    ADDRESS_STORE VARCHAR2(70) CONSTRAINT STORE_ADDRESS_NN NOT NULL,
    PHONE_STORE VARCHAR2(10) CONSTRAINT STORE_PHONE_NN NOT NULL,
    OTHER_STORE_DETAILS VARCHAR2(70) CONSTRAINT STORE_OTHER_NN NOT NULL
);

SELECT * FROM STORE;

CREATE TABLE STORE_PRODUCT (
    ID_STORE NUMBER(5),
    ID_PRODUCT NUMBER(5),
    ID_TYPE_PRODUCT NUMBER(5),
    ID_STORE_PRODUCT NUMBER(5),
    DATE_ADD_PRODUCT DATE CONSTRAINT STORE_PRODUCT_DATE_NN NOT NULL,
    OTHER_DEATILS VARCHAR2(70) CONSTRAINT STORE_PRODUCT_OTHER_NN NOT NULL,
    CONSTRAINT STORE_PRO_PK PRIMARY KEY (ID_STORE, ID_PRODUCT, ID_TYPE_PRODUCT),
    CONSTRAINT STORE_PRO_FK_STORE FOREIGN KEY (ID_STORE) REFERENCES STORE (ID_STORE),
    CONSTRAINT STORE_PRO_FK_PRODUCT FOREIGN KEY (ID_PRODUCT, ID_TYPE_PRODUCT) 
    REFERENCES PRODUCT (ID_PRODUCT, ID_TYPE_PRODUCT)
);

SELECT * FROM STORE_PRODUCT;

CREATE TABLE SHOPPING_CART (
    ID_PRODUCT NUMBER(5),
    ID_TYPE_PRODUCT NUMBER(5),
    ID_CUSTOMER NUMBER(5),
    ID_SHOPPING_CART NUMBER(5),
    ADDED_DATE DATE CONSTRAINT CART_ADD_DATE_NN NOT NULL,
    CONSTRAINT SHOPPING_CART_PK PRIMARY KEY (ID_SHOPPING_CART, ID_CUSTOMER, ID_PRODUCT, ID_TYPE_PRODUCT),
    CONSTRAINT SHOP_CART_FK_CUSTOMER FOREIGN KEY (ID_CUSTOMER) REFERENCES CUSTOMER (ID_CUSTOMER),
    CONSTRAINT SHOP_CART_FK_PRODUCT FOREIGN KEY (ID_PRODUCT, ID_TYPE_PRODUCT) 
    REFERENCES PRODUCT (ID_PRODUCT, ID_TYPE_PRODUCT)
);

SELECT * FROM SHOPPING_CART;

CREATE TABLE SALE_PRODUCT (
    ID_PRODUCT NUMBER(5),
    ID_TYPE_PRODUCT NUMBER(5),
    ID_CUSTOMER NUMBER(5),
    ID_SHOPPING_CART NUMBER(5),
    ID_SALE NUMBER(5),
    TOTAL_SALE NUMBER(8,2) CONSTRAINT SALE_TOTAL_NN NOT NULL,
    SALE_DATE DATE CONSTRAINT SALE_DATE_NN NOT NULL,
    CONSTRAINT SALE_PK PRIMARY KEY (ID_PRODUCT, ID_TYPE_PRODUCT, ID_CUSTOMER, ID_SHOPPING_CART, ID_SALE),
    CONSTRAINT CART_SALE_FK FOREIGN KEY (ID_PRODUCT, ID_TYPE_PRODUCT, ID_CUSTOMER, ID_SHOPPING_CART)
    REFERENCES SHOPPING_CART (ID_PRODUCT, ID_TYPE_PRODUCT, ID_CUSTOMER, ID_SHOPPING_CART)
);

