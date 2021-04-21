/* Create Customer Table */
CREATE TABLE Customer (
 CustomerID INTEGER,
 CustomerName CHAR(30),
 CustomerAddress CHAR(30),
 CustomerCity CHAR(30),
 CustomerState CHAR(30),
 CustomerPostalCode CHAR(30),
 CustomerEmail CHAR(30),
 CustomerUserName CHAR(30),
 CustomerPassword CHAR(30),
 PRIMARY KEY(CustomerID));

/* Create Territory Table */
CREATE TABLE Territory (
 TerritoryID INTEGER,
 TerritoryName CHAR(30),
 PRIMARY KEY(TerritoryID));

/* Create Salesperson Table */
CREATE TABLE Salesperson (
 SalespersonID INTEGER,
 SalespersonName CHAR(30),
 SalespersonPhone CHAR(30),
 SalespersonEmail CHAR(30),
 SalespersonUserName CHAR(30),
 SalesPersonPassword CHAR(30),
 TerritoryID INTEGER,
 PRIMARY KEY(SalespersonID),
 FOREIGN KEY(TerritoryID) REFERENCES Territory);
             
/* Create DoesBusinessIn Table */
CREATE TABLE DoesBusinessIn (
 CustomerID INTEGER,
 TerritoryID INTEGER,
 PRIMARY KEY(CustomerID, TerritoryID),
 FOREIGN KEY(CustomerID) REFERENCES Customer,
 FOREIGN KEY(TerritoryID) REFERENCES Territory);

/* Create ProductLine Table */
CREATE TABLE ProductLine (
 ProductLineID INTEGER,
 ProductLineName CHAR(30),
 PRIMARY KEY(ProductLineID));

/* Create Product Table */
CREATE TABLE Product (
 ProductID INTEGER,
 ProductName CHAR(30),
 ProductFinish CHAR(30),
 ProductStandardPrice INTEGER,
 ProductLineID INTEGER,
 Photo CHAR(30),
 PRIMARY KEY(ProductID),
 FOREIGN KEY(ProductLineID) REFERENCES ProductLine);

/* Create Order Table */
CREATE TABLE Orders (
 OrderID INTEGER,
 OrderDate DATE,
 CustomerID INTEGER,
 PRIMARY KEY(OrderID),
 FOREIGN KEY(CustomerID) REFERENCES Customer);
             
/* Create OrderLine Table */
CREATE TABLE OrderLine (
 OrderID INTEGER,
 ProductID INTEGER,
 OrderedQuantity INTEGER,
 SalePrice REAL,
 PRIMARY KEY(OrderID, ProductID),
 FOREIGN KEY(OrderID) REFERENCES Orders,
 FOREIGN KEY(ProductID) REFERENCES Product);

/* Create PriceUpdate Table */
CREATE TABLE PriceUpdate (
 PriceUpdateID INTEGER,
 DataChanged DATE,
 OldPrice INTEGER,
 NewPrice INTEGER);

/* Create View Comparison */
CREATE VIEW Comparison(Product, TotalSales) AS
SELECT PL.ProductLineName, SUM(P.ProductStandardPrice)
FROM Product P, ProductLine PL
WHERE PL.ProductLineID = P.ProductLineID
group by PL.ProductLineName;
             
/* Create View TotalValue */
CREATE VIEW TotalValue(Product, TotalOrdered) AS
SELECT P.ProductName, SUM(P.ProductStandardPrice * OL.OrderedQuantity)
FROM Product P, OrderLine OL
WHERE P.ProductID = OL.ProductID
group by P.ProductName;
             
/* Create View CustomerData */
CREATE VIEW CustomerData(Product, Price) AS
SELECT P.ProductName, P.ProductStandardPrice
FROM Product P;
             
/* Create View Shipment */
CREATE VIEW Shipment(StatesShipped, AddressCount)AS
SELECT C.CustomerState, COUNT(*)
FROM Customer C
GROUP BY C.CustomerState;
             
/* Create View PurchaseHistory */
CREATE VIEW PurchaseHistory(OrderDate, OrderedQuantity, ProductPrice, ProductName) AS
SELECT O.OrderDate, OL.OrderedQuantity, P.ProductStandardPrice, P.ProductName
FROM Orders O, OrderLine OL, Product P
WHERE O.OrderId = OL.OrderID AND OL.ProductID = P.ProductID;
             
/* Insert data into Customer */
INSERT INTO Customer VALUES (1, 'Contemporary Casuals', '1355 S Hines Blvd', 'Gainesville', 'FL',
'32601-2871','', '', '');
INSERT INTO Customer VALUES (2, 'Value Furnitures', '15145 S.W. 17th St.', 'Plano', 'TX', '75094-
7734','','', '');
INSERT INTO Customer VALUES (3, 'Home Furnishings', '1900 Allard Ave', 'Albany', 'NY', '12209-1125',
'homefurnishings?@gmail.com', 'CUSTOMER1', 'CUSTOMER1#');
INSERT INTO Customer VALUES (4, 'Eastern Furniture', '1925 Beltline Rd.', 'Carteret', 'NJ', '07008-3188',
'', '', '');
INSERT INTO Customer VALUES (5, 'Impressions', '5585 Westcott Ct.', 'Sacramento', 'CA', '94206-4056',
'', '','');
INSERT INTO Customer VALUES (6, 'Furniture Gallery', '325 Flatiron Dr.', 'Boulder', 'CO', '80514-4432',
'','', '');
INSERT INTO Customer VALUES (7, 'New Furniture', 'Palace Ave', 'Farmington', 'NM', '', '', '', '');
INSERT INTO Customer VALUES (8, 'Dunkins Furniture', '7700 Main St', 'Syracuse', 'NY', '31590', '', '', '');
INSERT INTO Customer VALUES (9, 'A Carpet', '434 Abe Dr', 'Rome', 'NY', '13440', '','', '');
INSERT INTO Customer VALUES (12, 'Flanigan Furniture', 'Snow Flake Rd', 'Ft Walton Beach', 'FL', '32548',
'', '', '');
INSERT INTO Customer VALUES (13, 'Ikards', '1011 S. Main St', 'Las Cruces', 'NM', '88001', '', '', '');
INSERT INTO Customer VALUES (14, 'Wild Bills', 'Four Horse Rd', 'Oak Brook', 'Il', '60522', '', '', '');
INSERT INTO Customer VALUES (15, 'Janets Collection', 'Janet Lane', 'Virginia Beach', 'VA', '10012', '', '','');
INSERT INTO Customer VALUES (16, 'ABC Furniture Co.', '152 Geramino Drive', 'Rome', 'NY', '13440', '', '',
'');
             
/* Insert data into Salesperson */
INSERT INTO Salesperson VALUES (1, 'Doug Henny', '8134445555', 'salesperson?@gmail.com',
'SALESPERSON', 'SALESPERSON#',1);
INSERT INTO Salesperson VALUES (2, 'Robert Lewis', '8139264006', '', '', '', 2);
INSERT INTO Salesperson VALUES (3, 'William Strong', '5053821212', '', '', '', 3);
INSERT INTO Salesperson VALUES (4, 'Julie Dawson', '4355346677', '', '', '', 4);
INSERT INTO Salesperson VALUES (5, 'Jacob Winslow', '2238973498', '', '', '', 5);
             
/* Insert data into Territory */
INSERT INTO Territory VALUES (1, 'SouthEast');
INSERT INTO Territory VALUES (2, 'SouthWest');
INSERT INTO Territory VALUES (3, 'NorthEast');
INSERT INTO Territory VALUES (4, 'NorthWest');
INSERT INTO Territory VALUES (5, 'Central');
             
/* Insert data into DoesBusinessIn */
INSERT INTO DoesBusinessIn VALUES (1, 1);
INSERT INTO DoesBusinessIn VALUES (2, 2);
INSERT INTO DoesBusinessIn VALUES (3, 3);
INSERT INTO DoesBusinessIn VALUES (4, 4);
INSERT INTO DoesBusinessIn VALUES (5, 5);
INSERT INTO DoesBusinessIn VALUES (6, 1);
INSERT INTO DoesBusinessIn VALUES (7, 2);
             
/* Insert data into Product */
INSERT INTO Product VALUES (1, 'End Table', 'Cherry', 175, 1, 'table.jpg');
INSERT INTO Product VALUES (2, 'Coffee Table', 'Natural Ash', 200, 2, '');
INSERT INTO Product VALUES (3, 'Computer Desk', 'Natural Ash', 375, 2, '');
INSERT INTO Product VALUES (4, 'Entertainment Center', 'Natural Maple', 650, 3, '');
INSERT INTO Product VALUES (5, 'Writers Desk', 'Cherry', 325, 1, '');
INSERT INTO Product VALUES (6, '8-Drawer Desk', 'White Ash', 750, 2, '');
INSERT INTO Product VALUES (7, 'Dining Table', 'Natural Ash', 800, 2, '');
INSERT INTO Product VALUES (8, 'Computer Desk', 'Walnut', 250, 3, '');
             
/* Insert data into ProductLine */
INSERT INTO ProductLine VALUES (1, 'Cherry Tree');
INSERT INTO ProductLine VALUES (2, 'Scandinavia');
INSERT INTO ProductLine VALUES (3, 'Country Look');
             
/* Insert data into Orders */
INSERT INTO Orders VALUES (1001, '21/Aug/16', 1);
INSERT INTO Orders VALUES (1002, '21/Jul/16', 8);
INSERT INTO Orders VALUES (1003, '22/ Aug/16', 15);
INSERT INTO Orders VALUES (1004, '22/Oct/16', 5);
INSERT INTO Orders VALUES (1005, '24/Jul/16', 3);
INSERT INTO Orders VALUES (1006, '24/Oct/16', 2);
INSERT INTO Orders VALUES (1007, '27/ Aug/16', 5);
INSERT INTO Orders VALUES (1008, '30/Oct/16', 12);
INSERT INTO Orders VALUES (1009, '05/Nov/16', 4);
INSERT INTO Orders VALUES (1010, '05/Nov/16', 1);
             
/* Insert data into OrderLine */
INSERT INTO OrderLine VALUES (1001, 1, 2, '');
INSERT INTO OrderLine VALUES (1001, 2, 2, '');
INSERT INTO OrderLine VALUES (1001, 4, 1, '');
INSERT INTO OrderLine VALUES (1002, 3, 5, '');
INSERT INTO OrderLine VALUES (1003, 3, 3, '');
INSERT INTO OrderLine VALUES (1004, 6, 2, '');
INSERT INTO OrderLine VALUES (1004, 8, 2, '');
INSERT INTO OrderLine VALUES (1005, 4, 4, '');
INSERT INTO OrderLine VALUES (1006, 4, 1, '');
INSERT INTO OrderLine VALUES (1006, 5, 2, '');
INSERT INTO OrderLine VALUES (1006, 7, 2, '');
INSERT INTO OrderLine VALUES (1007, 1, 3, '');
INSERT INTO OrderLine VALUES (1007, 2, 2, '');
INSERT INTO OrderLine VALUES (1008, 3, 3, '');
INSERT INTO OrderLine VALUES (1008, 8, 3, '');
INSERT INTO OrderLine VALUES (1009, 4, 2, '');
INSERT INTO OrderLine VALUES (1009, 7, 3, '');
INSERT INTO OrderLine VALUES (1010, 8, 10, '');
             
/* Which products have a standard price of less than $ 275?
 PRODUCT
 END TABLE
 COFFEE TABLE
 COMPUTER DESK */
SELECT P.ProductName
FROM PRODUCT P
WHERE P.ProductStandardPrice < 275;
             
/* List the unit price, product name, and product ID for all products in the Product table.
PRICE NAME ID
 175 END TABLE 1
 200 COFEE TABLE 2
 375 COMPUTER DESK 3
 650 ENTERTAINMENT CENTER 4
 325 WRITERS DESK 5
 750 8-DRAWER DESK 6
 800 DINING TABLE 7
 250 COMPUTER DESK 8 */
SELECT P.ProductStandardPrice, P.ProductName, P.ProductID
FROM PRODUCT P;
             
/* What is the average standard price for all products in inventory?
 AVG
 440.625 */
SELECT AVG(P.ProductStandardPrice)
FROM PRODUCT P;

/* How many different items were ordered on order number 1004?
 COUNT DIFF PRODUCTS ORDERED
 2 */
SELECT COUNT(*)
FROM OrderLine OL
WHERE OL.OrderID = '1004';
             
/* Which orders have been placed since 10/ 24/ 2010?
 ORDER
 1001
 1002
 1003
 1004
 1005
 1006
 1007
 1008
 1009
 1010 */
SELECT O.OrderID
FROM Orders O
WHERE O.OrderDate > '24/OCT/10';
             
/* What furniture does COSC3380 carry that isn’t made of cherry?
 PRODUCT
 COFFEE TABLE
 COMPUTER DESK
 ENTERTAINMENT CENTER
 8-DRAWER DESK
 DINING TABLE
 COMPUTER DESK */
SELECT P.ProductName
FROM Product P
WHERE P.ProductFinish != 'Cherry';
             
/* List product name, finish, and standard price for all desks and all tables
 that cost more than $ 300 in the Product table.
 NAME FINISH PRICE
 COMPUTER DESK NATURAL ASH 375
 WRITERS DESK CHERRY 325
 8-DRAWER DESK WHITE ASH 750
 DINING TABLE NATURAL ASH 800 */
SELECT P.ProductName, P.ProductFinish, P.ProductStandardPrice
FROM Product P
WHERE P.ProductStandardPrice > 300 AND (P.ProductName LIKE '%Desk%' OR P.ProductName LIKE
'%Table%');
             
/* Which products in the Product table have a standard price between $ 200 and $ 300?
 PRODUCT
 COFFEE TABLE
 COMPUTER DESK */
SELECT P.ProductName
FROM Product P
WHERE P.ProductStandardPrice >= 200 AND P.ProductStandardPrice <= 300;
             
/* List customer, city, and state for all customers in the Customer table whose address is Florida, Texas,
California, or Hawaii.
 List the customers alphabetically by state and alphabetically by customer within each state.
 CUSTOMER CITY STATE
 IMPRESSIONS SACRAMENTO CA
 CONTEMPORARY CASUALS GAINESVILLE FL
 FLANIGAN FURNITURE FT WALTON BEACH FL
 VALUE FURNITURE PLANO TX*/
SELECT C.CustomerName, C.CustomerCity, C.CustomerState
FROM Customer C
WHERE C.CustomerState = 'FL' OR C.CustomerState = 'TX' OR C.CustomerState = 'CA' OR
C.CustomerState = 'HI'
ORDER BY C.CustomerState, C.CustomerName;
             
/* Count the number of customers with addresses in each state to which we ship.
 STATE
 FL 2
 TX 1
 NY 4
 NJ 1
 CA 1
 CO 1
 NM 2
 IL 1
 VA 1 */
SELECT C.CustomerState, COUNT(*)
FROM Customer C
GROUP BY C.CustomerState;
             
/* Count the number of customers with addresses in each city to which we ship.
 List the cities by state.
 STATE CITY COUNT
 CA SACRAMENTO 1
 CO BOULDER 1
 FL FT WALTON BEACH 1
 FL GAINESVILLE 1
 IL OAK BROOK 1
 NJ CARTERET 1
 NM FARMINGTON 1
 NM LAS CRUCES 1
 NY ALBANY 1
 NY ROME 2
 NY SYRACUSE 1
 TX PLANO 1
 VA VIRGINIA BEACH 1*/
SELECT C.CustomerState, C.CustomerCity, COUNT(C.CustomerCity)
FROM Customer C
GROUP BY C.CustomerState, C.CustomerCity
ORDER BY C.CustomerState, C.CustomerCity;
             
/* Find only states with more than one customer.
 STATE
 NY
 FL
 NM */
SELECT C.CustomerState
FROM Customer C
GROUP BY C.CustomerState
HAVING COUNT(*) > 1;
             
/* List, in alphabetical order, the product finish and the average standard price for each finish for
 selected finishes having an average standard price less than 750. 
 FINISH AVG
 Cherry 250
 Natural Ash 458.333333333333333333333333333333333333
 Natural Maple 650
 Walnut 250 */
SELECT P.ProductFinish, AVG(P.ProductStandardPrice)
FROM Product P
GROUP BY P.ProductFinish
HAVING AVG(P.PRODUCTSTANDARDPRICE) < 750
ORDER BY P.ProductFinish;
             
/* What is the total value of orders placed for each furniture product?
PRODUCT TOTAL VALUE
End Table 875
Coffee Table 800
8-Drawer Desk 1500
Dining Table 4000
Writers Desk 650
Entertainment Center 5200
Computer Desk 7875 */
SELECT P.ProductName, SUM(P.ProductStandardPrice * OL.OrderedQuantity)
FROM Product P, OrderLine OL
WHERE P.ProductID = OL.ProductID
GROUP BY P.ProductName;
