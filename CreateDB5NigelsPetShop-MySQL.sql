
	 
CREATE TABLE Animal
	 (AnimalID int,
	  AnimalName varchar(20),
	  Type varchar(3),
	  Gender varchar(1),
	  Breed varchar(20),
	  Neutered tinyint(1),
	  Decalwed tinyint(1),
	  CONSTRAINT Person_PK PRIMARY KEY (AnimalID));
					    
CREATE TABLE Adoption
	(AdoptionID int,
		DateOfAdoption DATE,
		EmployeeID int,
		CustomerID int,
		AnimalID int,
		CONSTRAINT Adoption_PK PRIMARY KEY (AdoptionID),
		CONSTRAINT Adoption_FK1 FOREIGN KEY (EmployeeID)
			REFERENCES Person(PersonID),
		CONSTRAINT Adoption_FK2 FOREIGN KEY (CustomerID)
			REFERENCES Person(PersonID),
		CONSTRAINT Adoption_FK3 FOREIGN KEY (AdoptionID)
			REFERENCES Animal(AnimalID)); 
			

					  
CREATE TABLE Inventory
		(InventoryID int, 
		 ProductName varchar(20), 
		 Price decimal(6,2), 
		 CONSTRAINT Inventory_PK PRIMARY KEY(InventoryID));
			     
CREATE TABLE Order1
		(OrderID int, 
		 OrderDate date, 
		 PersonID int, 
		 CONSTRAINT Order_PK PRIMARY KEY(OrderID), 
		 CONSTRAINT Order_FK1 FOREIGN KEY(PersonID) REFERENCES Person(PersonID));
									      
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
