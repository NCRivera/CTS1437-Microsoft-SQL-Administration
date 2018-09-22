CREATE DATABASE lecture3;

CREATE TABLE book_library(
    author_name CHARACTER(50),
    book_title CHARACTER(70) unique,
    published_date INTEGER);

CREATE TABLE book_library1(
    author_name CHARACTER(50),
    book_title CHARACTER(70),
    published_date INTEGER, CONSTRAINT un_author_book unique(author_name,book_title));

CREATE TABLE book_library2(
    author_name CHARACTER(50),
    book_title CHARACTER(70) unique NOT NULL,
    published_date INTEGER);

--I'm creating fiction novel authors table now.
CREATE TABLE fiction_novel_authors1(
    author_id INTEGER,
    author_name CHARACTER(50) PRIMARY KEY,
    publisher_id INTEGER);--I made author name my primary key

--CREATE TABLE "fiction novel authors"
CREATE TABLE fiction_novel_authors(
    author_id INTEGER,
    author_name CHARACTER(50),
    publisher_id INTEGER, CONSTRAINT pk_author_id PRIMARY KEY(author_id,author_name));--I just created a superkey

--CREATE TABLE " second fiction novel authors"
CREATE TABLE fiction_novel_authors2(
    author_id INTEGER,
    author_name CHARACTER(50) PRIMARY KEY,
    publisher_id INTEGER, CONSTRAINT un_author_name unique(author_name));

CREATE TABLE product_manufacturers(
    manufacturer_id INTEGER,
    business_name CHARACTER (50));

CREATE TABLE product_names3(
    Product_name_id INTEGER,
    Product_name CHARACTER(50) PRIMARY KEY,
    Manufacturer_id INTEGER, CONSTRAINT un_product_name_id unique(product_name));

--Create product names 2 table
CREATE TABLE product_names2(
    product_name_id INTEGER,
    product_name CHARACTER(50),
    manufacturer_id INTEGER, CONSTRAINT ts_manufacturer_id foreign key (manufacturer_id) REFERENCES product_manufacturers(manufacturer_id));--I'm getting an error that was corrected later, identify the error and report the results.