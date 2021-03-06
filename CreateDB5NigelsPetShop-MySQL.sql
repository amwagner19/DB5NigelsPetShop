
	 
CREATE TABLE Animal
	 (AnimalID int,
	  AnimalName varchar(20),
	  Type varchar(3),
	  Gender varchar(1),
	  Breed varchar(20),
	  Neutered tinyint(1),
	  Decalwed tinyint(1),
	  Status tinyint(1),
	  CONSTRAINT Person_PK PRIMARY KEY (AnimalID));
					    
CREATE TABLE Adoption
	(AdoptionID int,
		DateOfAdoption DATE,
		EmployeeID int,
		CustomerID int,
		AnimalID int,
		CONSTRAINT Adoption_PK PRIMARY KEY (AdoptionID)); 
			
CREATE TABLE Inventory
		(InventoryID int, 
		 ProductName varchar(20), 
		 Price decimal(6,2), 
		 CONSTRAINT Inventory_PK PRIMARY KEY(InventoryID));
			     
CREATE TABLE Order1
		(OrderID int, 
		 OrderDate date, 
		 PersonID int, 
		 CONSTRAINT Order_PK PRIMARY KEY(OrderID));
									      
CREATE TABLE OrderLine
		(OrderedQuantity int, 
		 InventoryID int, 
		 OrderID int,
		 CONSTRAINT OrderLine_PK1 PRIMARY KEY (InventoryID, OrderID));
						   
CREATE TABLE Immunization
		(ImmunizationID int, 
		 ImmunizationName varchar(20),
		 CONSTRAINT Immunization_PK1 PRIMARY KEY (ImmunizationID));
							  
CREATE TABLE AnimalImmunization
		(ImmunizationID int, 
		 AnimalID int,
         	 ImmunizationDate date,
		 CONSTRAINT AnimalImmunization_FK1 FOREIGN KEY (ImmunizationID)
			REFERENCES Immunization(ImmunizationID),
         	 CONSTRAINT AnimalImmunization_FK2 FOREIGN KEY (AnimalID)
			REFERENCES Animal(AnimalID));																	

					  
INSERT INTO Inventory (InventoryID, ProductName, Price) VALUES (1, 'Green Grass Kibble', 40.00);
INSERT INTO Inventory (InventoryID, ProductName, Price) VALUES (2, 'Indestructible Squee', 25.00);		
INSERT INTO Inventory (InventoryID, ProductName, Price) VALUES (3, 'Princess Leash', 40.00);
INSERT INTO Inventory (InventoryID, ProductName, Price) VALUES (4, 'Customer Collar', 25.00);	

					  
INSERT INTO Animal
VALUES(1, 'tiny dog', 'Dog', 'F', 'Cocker Spaniel', 1, NULL, 1);
INSERT INTO Animal
VALUES(2, 'Foucault', 'Dog', 'M', 'French Bulldog', 1, NULL, 1);
INSERT INTO Animal
VALUES(3, 'Griffin', 'Dog', 'M', 'Airedale Terrier', 1, NULL, 1);
INSERT INTO Animal
VALUES(4, 'Griffin', 'Dog', 'M', 'Chihuahua', 1, NULL, 1);
INSERT INTO Animal
VALUES(5, 'Fifi', 'Dog', 'F', 'Yorkie', 1, NULL, 1);
INSERT INTO Animal
VALUES(6, 'Thomas', 'Cat', 'M', 'Tabby', 1, NULL, 1);

					  
--This code should be executed after a user has been added through the registration on our application
ALTER TABLE Adoption
ADD FOREIGN KEY (AnimalID) REFERENCES Animal(AnimalID);
ALTER TABLE Adoption
ADD FOREIGN KEY (EmployeeID) REFERENCES `user`(id);
ALTER TABLE Adoption
ADD FOREIGN KEY (CustomerID) REFERENCES `user`(id);
					  
ALTER TABLE Order1
ADD FOREIGN KEY (PersonID) REFERENCES `user`(id)
					  
INSERT INTO Immunization
VALUES(1, 'Bordatella');					  
INSERT INTO Immunization
VALUES(2, 'Rabies');
INSERT INTO Immunization
VALUES(3, 'Hepatitis');
INSERT INTO Immunization
VALUES(4, 'Leptospirosis');
INSERT INTO Immunization
VALUES(5, 'FVRCP');
					  
INSERT INTO Animal
VALUES(7, 'Rexina', 'Cat', 'F', 'Persian', 1, 0, 1);
INSERT INTO Animal
VALUES(8, 'Snowball', 'Dog', 'F', 'Maltese', 1, NULL, 1);
INSERT INTO Animal
VALUES(8, 'Max', 'Dog', 'M', 'Siberian Husky', 0, NULL, 1);
