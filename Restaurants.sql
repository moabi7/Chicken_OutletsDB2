/*
    Copy the diretory where this SQL script is located
    Replace PATH with the copied directory on the command below 
    Then execute the command to create the Chicken_OutletsDB with all its tables
    
    ----------------

    source PATH\Chicken_OutlestsDB.sql
*/

DROP DATABASE IF EXISTS Restaurants;
CREATE DATABASE IF NOT EXISTS Restaurants;
USE Restaurants;

CREATE TABLE Restaurant (
    Restaurant_ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Street VARCHAR(150) NOT NULL,
    Town VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Province ENUM('Gauteng',
                'Mpumanlanga',
                'North West',
                'Limpopo',
                'Kwa-Zulu Natal',
                'Western Cape',
                'Northern Cape',
                'Eastern Cape') NOT NULL,
    Postal_code VARCHAR(4)  NOT NULL
);

INSERT INTO Restaurant VALUES
    (NULL, 'KFC','Bloed St','Pretoria CBD', 'Pretoria', 'Gauteng', '0001'),
    (NULL, 'Chiken Liken', 'Andries St','Pretoria CBD', 'Pretoria', 'Gauteng', '0001'),
    (NULL, 'Nandos', 'Buitekant St','Soshanguve', 'Pretoria', 'Gauteng', '0152'),
    (NULL, 'McDonalds', 'Bosman Street', 'Pretoria CBD', 'Pretoria', 'Gauteng', '0152'),
    (NULL, 'Garlitos', 'West Street','Durban Central', 'Durban', 'Kwa-Zulu Natal', '0252');

CREATE TABLE Item (
    Item_ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DOUBLE(8,2) NOT NULL,
    Restaurant_ID INT UNSIGNED NULL,
	INDEX(Restaurant_ID),
	CONSTRAINT FK_Restaurant_Menu_ID FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant (Restaurant_ID)
);

-- KFC Menu
-- =====================
INSERT INTO Item VALUES
(NULL, 'Wrapsta Box With Small Drink', 52.90, 1),
(NULL, '2x Colone Burgers', 59.90, 1),
(NULL, '21 Piece Bucket', 279.90, 1),
(NULL, '9 Piece Bucket', 129.90, 1),
(NULL, 'ALl-In-One Feast', 129.90, 1),
(NULL, 'All Star Box With Buddy Bottle', 69.90, 1),
(NULL, 'Nugget Box Buddy', 57.90, 1),
(NULL, 'Double Crunck Burger', 49.90, 1),
(NULL, 'Crunch Burger', 24.90, 1),
(NULL, 'Snack Burger', 19.90, 1),
(NULL, 'Classic Twister', 44.90, 1),
(NULL, 'Wrapsta', 29.90, 1),
(NULL, 'Steetwise Two With Chips', 34.90, 1),
(NULL, 'Steetwise Two With Regular Pap', 34.90, 1);

-- Chicken Licken Menu
-- =====================
INSERT INTO Item VALUES
(NULL, 'Hotwings 6 Piece', 38.0, 2),
(NULL, 'Hotwings 12 Piece', 73.0, 2),
(NULL, 'Hotwings 24 Piece', 135.0, 2),
(NULL, 'Rock My Soul 3 Piece Straight', 48.0, 2),
(NULL, 'Rock My Soul 3 Piece', 51.0, 2),
(NULL, 'Hotwings 6 Piece Delux', 58.0, 2),
(NULL, 'Hotwings 6 Piece Max', 62.0, 2),
(NULL, 'Soulman Load Up', 70.0, 2),
(NULL, 'Feed My Craving 10', 68.0, 2),
(NULL, 'Love Me Hot Burger', 34.0, 2);

-- Nandos Menu
-- =======================
INSERT INTO Item VALUES
(NULL, 'The Grand Salad (Chicken)', 89.0, 3),
(NULL, 'The Original Boujee Bowl', 72.0, 3),
(NULL, 'Full Chicken + any 3 Sharing Sides', 262.0, 3),
(NULL, '1/2 Chicken + any Single Side', 99.0, 3),
(NULL, 'Hotpot', 40.0, 3),
(NULL, 'Pulled Chicken Sandwich with cheese', 45.0, 3),
(NULL, 'Livers', 47.0, 3),
(NULL, 'Chicken Prego + any Single Side', 49.0, 3),
(NULL, 'Chicken Prego', 45.0, 3),
(NULL, '1/4 Chicken', 45.0, 3),
(NULL, '1/2 Chicken', 87.0, 3),
(NULL, 'Full Chicken', 167.0, 3),
(NULL, 'Halloumi Veg & Rice', 55.0, 3);

-- McDonalds Menu
-- ==========================
INSERT INTO Item VALUES
(NULL, 'Big Mac', 50.0, 4),
(NULL, 'Quater Pounder with Cheese', 55.0, 4),
(NULL, 'McDouble', 40.0, 4),
(NULL, 'Cheeseburger', 36.0, 4),
(NULL, 'Double Cheeseburger', 42.0, 4),
(NULL, 'Hamburger', 36.0, 4),
(NULL, 'Chocolatey Pretzel McFlurry', 21.0, 4),
(NULL, 'McFlurry with OREO cookies', 21.0, 4),
(NULL, 'Chocolate Shake', 19.0, 4),
(NULL, 'Vanilla Shake', 19.0, 4);

-- Garlitos Menu
-- =======================
INSERT INTO Item VALUES
(NULL, '1/4 Chicken', 40.0, 5),
(NULL, '1/2 Chicken', 73.0, 5),
(NULL, 'Full Chicken', 140.0, 5),
(NULL, 'Chicken Livers', 21.0, 5),
(NULL, 'Chicken Livers Meal', 30.0, 5),
(NULL, 'Quarter Chicken + Pap', 45.0, 5),
(NULL, 'Quarter Chicken + Pap', 49.0, 5),
(NULL, 'Laduma Meal', 50.0, 5),
(NULL, 'Go Go Meal', 59.0, 5),
(NULL, 'The Boss Box + Pap', 80.0, 5),
(NULL, 'The Boss Box + Chips', 85.0, 5);





CREATE TABLE Cashier (
    Cashier_ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Firstname VARCHAR(30) NOT NULL,
    Lastname VARCHAR(30) NOT NULL,
    Gender ENUM('Male', 'Female') NOT NULL,
    Restaurant_ID INT UNSIGNED NULL,
	INDEX(Cashier_ID), 
    CONSTRAINT FK_Restaurant_Cashier_ID FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant (Restaurant_ID)
);
	
INSERT INTO Cashier VALUES
    (NULL,'Andile', 'Mabena', 'Male', 1),-- 1 KFC
    (NULL,'Palesa', 'Maputla', 'Female',2),-- 2 Chicken Licken
    (NULL,'Dineo', 'Malebje', 'Female', 3),-- 3 Nandos
    (NULL,'Quintin', 'Smith', 'Male', 4),-- 4 McDonalds
    (NULL,'Diana', 'Ross', 'Female', 5),-- 5 Garlitos
    (NULL,'Kabelo', 'Nguni', 'Male', 1);-- 6 KFC

CREATE TABLE Sale (
    Sale_ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Sale_time TIMESTAMP NOT NULL,
    Cash_Received DOUBLE(10,2),
    Cost DOUBLE(10,2),
    Change_Given DOUBLE(8,2),
	Total_Items INT UNSIGNED,
    Cashier_ID INT UNSIGNED NULL,
	INDEX(Cashier_ID),
	CONSTRAINT FK_Cashier_Sale_ID FOREIGN KEY (Cashier_ID) REFERENCES Cashier (Cashier_ID)
);

CREATE TABLE SoldItem (
    Item_ID INT UNSIGNED NOT NULL,
    Sale_ID INT UNSIGNED NOT NULL,
    Quantity INT NOT NULL,
    Total DOUBLE(8,2) NOT NULL,
	INDEX(Item_ID),
	INDEX(Sale_ID),
	CONSTRAINT FK_Item_Sold_ID FOREIGN KEY (Item_ID) REFERENCES Item (Item_ID),
	CONSTRAINT FK_Sale_Items_ID FOREIGN KEY (Sale_ID) REFERENCES Sale (Sale_ID) ON DELETE CASCADE, -- Automatically delete when a transaction record is deleted
    PRIMARY KEY (Item_ID, Sale_ID)
);

-- Transaction records are captured using the captureTransaction prodedure
-- The procedure requires the cashier ID
-- The amount paid for the items 
-- And the list of menu items bought by the customer
-- The list items are separated by a comma (,)
-- Each item in the list has the quantity of the item be bought which separated by a pound sign (#) 


DELIMITER $$
    DROP PROCEDURE IF EXISTS captureTransation;
    CREATE PROCEDURE captureTransation (
		IN cashireID INT,
		IN amountPaid DOUBLE(8,2),
		IN itemList VARCHAR(1500)
	)
    BEGIN
        -- Declare variables
        DECLARE _counter INT DEFAULT 0;
        DECLARE _total_items INT DEFAULT 0;
        DECLARE _restaurantID INT DEFAULT 0;
        DECLARE _saleID INT DEFAULT 0;
        DECLARE _itemID INT DEFAULT 0;
        DECLARE _item_name VARCHAR(100);
        DECLARE _item_price DOUBLE(8,2);
        DECLARE _total_cost DOUBLE(10,2);
        DECLARE _quantity INT DEFAULT 0;
        DECLARE _saleTime TIMESTAMP DEFAULT NOW();

        -- Fetch Restaurant_ID
        SELECT Restaurant_ID
        INTO _restaurantID
        FROM Cashier
        WHERE Cashier_ID = cashireID;
		
		
        -- Create sale
        INSERT INTO Sale VALUES
        (NULL, _saleTime, NULL, NULL, NULL, NULL, cashireID);

        -- Get Sale ID
        SELECT Sale_ID
        INTO _saleID
        FROM Sale
        WHERE  Sale_time = _saleTime;

        -- Search for each bought item in the menu_item table
        WHILE (LOCATE(',', itemList) > 0) DO

            SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(itemList,',',1),',',-1)
            INTO _item_name;
            
            SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(_item_name,'#', 1),'#',-1)
            INTO _quantity;

            SET _item_name = SUBSTRING(_item_name, LOCATE('#', _item_name) + 1);

            SELECT Item_ID, price
            INTO _itemID, _item_price
            FROM Item
            WHERE name = _item_name
            AND Restaurant_ID = _restaurantID;

            -- Insert into sold items
            INSERT INTO SoldItem VALUES
            (_itemID, _saleID, _quantity, _quantity * _item_price); -- Convet quantity to number

			select _restaurantID, _saleID, _item_name, _quantity, _counter, _itemID, _item_price;
			
			SET _counter = _counter + 1;
			SET _total_items = _total_items + _quantity;
            SET itemList = SUBSTRING(itemList, LOCATE(',', itemList) + 1);
        END WHILE;

        -- Calculate the total cost of all the items bought and the change returned
        SELECT SUM(Total)
        INTO _total_cost
        FROM SoldItem
        WHERE Sale_ID = _saleID;
		
		select _total_items, _total_cost, _saleID;
		
        UPDATE Sale SET
        Cash_Received = amountPaid,
        Cost = _total_cost,
        Change_Given = amountPaid -_total_cost,
        Total_Items = _total_items
        WHERE Sale_ID = _saleID;
    END $$
DELIMITER ;



/*
-- Load sales into Transacton_Records
-- Load transaction one by one, at least 1 second apart
===================================================
-- 1 KFC
-- 2 Chicken Licken
-- 3 Nandos
-- 4 McDonalds
-- 5 Garlitos
-- 6 KFC

call captureTransation (1, 100.0,'2#Wrapsta,1#Steetwise Two With Chips,');
call captureTransation (1, 100.0,'1#Wrapsta,'); 
call captureTransation (4, 200.0,'1#Big Mac,1#Quater Pounder with Cheese,1#McDouble,');
call captureTransation (2, 170.0,'1#Hotwings 6 Piece,1#Rock My Soul 3 Piece Straight,2#Love Me Hot Burger,');
call captureTransation (6, 150.0,'4#Steetwise Two With Regular Pap,');
call captureTransation (6, 100.0,'1#Steetwise Two With Regular Pap,');
call captureTransation (1, 50.0,'1#Steetwise Two With Chips,');
*/

-- Transaction from KFC

-- Shows Sale ID = 4
SELECT S.Sale_ID,
	C.Firstname AS Cashier,
	S.Sale_time,
    CONCAT('R ', S.Cash_Received) AS 'Cash Paid',
	CONCAT('R ', S.Cost) AS 'Amount Due',
	CONCAT('R ', S.Change_Given) AS 'Change',
	CONCAT(S.Total_Items, ' items') AS 'Items Bought',
	R.name AS 'Restaurant Name', 
	CONCAT(R.Street, ', ', R.Town, ', ', R.City, ', ', R.Province) AS ADDRESS
FROM Sale S, Cashier C, Restaurant R
WHERE S.Sale_ID = 4
AND S.Cashier_ID = C.Cashier_ID
AND R.Restaurant_ID = C.Restaurant_ID;

-- Shows all the items bought Sale ID = 4
SELECT I.name As Item,
    CONCAT('R ', I.Price) AS Price,
	Quantity AS Quantity,
	CONCAT('R ', SI.Total) AS Total
FROM Sale S, SoldItem SI, Item I
WHERE S.Sale_ID = 4
AND S.Sale_ID = SI.Sale_ID
AND SI.Item_ID = I.Item_ID;

-- Shows Sale ID = 5
SELECT S.Sale_ID,
	C.Firstname AS Cashier,
	S.Sale_time,
    CONCAT('R ', S.Cash_Received) AS 'Cash Paid',
	CONCAT('R ', S.Cost) AS 'Amount Due',
	CONCAT('R ', S.Change_Given) AS 'Change',
	CONCAT(S.Total_Items, ' items') AS 'Items Bought',
	R.name AS 'Restaurant Name', 
	CONCAT(R.Street, ', ', R.Town, ', ', R.City, ', ', R.Province) AS ADDRESS
FROM Sale S, Cashier C, Restaurant R
WHERE S.Sale_ID = 5
AND S.Cashier_ID = C.Cashier_ID
AND R.Restaurant_ID = C.Restaurant_ID;

-- Shows all the items bought Sale ID = 5
SELECT I.name As Item,
    CONCAT('R ', I.Price) AS Price,
	Quantity AS Quantity,
	CONCAT('R ', SI.Total) AS Total
FROM Sale S, SoldItem SI, Item I
WHERE S.Sale_ID = 5
AND S.Sale_ID = SI.Sale_ID
AND SI.Item_ID = I.Item_ID;


-- The Query shows all sale made from a specific restaurant (Chicken Liken)
SELECT S.Sale_ID,
	CONCAT(C.Firstname, ' ', C.Lastname) AS Cashier,
	S.Sale_time,
    CONCAT('R ', S.Cash_Received) AS 'Cash Paid',
	CONCAT('R ', S.Cost) AS 'Amount Due',
	CONCAT('R ', S.Change_Given) AS 'Change',
	CONCAT(S.Total_Items, ' items') AS 'Items Bought'
FROM Sale S, Cashier C, Restaurant R
WHERE R.name = 'Chiken Liken'
AND S.Cashier_ID = C.Cashier_ID
AND C.Restaurant_ID = R.Restaurant_ID;

-- The Query shows all sale made from a specific restaurant (KFC)
SELECT S.Sale_ID,
	CONCAT(C.Firstname, ' ', C.Lastname) AS Cashier,
	S.Sale_time,
    CONCAT('R ', S.Cash_Received) AS 'Cash Paid',
	CONCAT('R ', S.Cost) AS 'Amount Due',
	CONCAT('R ', S.Change_Given) AS 'Change',
	CONCAT(S.Total_Items, ' items') AS 'Items Bought'
FROM Sale S, Cashier C, Restaurant R
WHERE R.name = 'KFC'
AND S.Cashier_ID = C.Cashier_ID
AND C.Restaurant_ID = R.Restaurant_ID;
