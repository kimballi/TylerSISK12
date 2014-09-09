--This creates the table that I use to hold the audit records from any UPDATE I do.

CREATE TABLE tblC2Audit(
   ID INT,
   Description VARCHAR (50),
   TableChanged VARCHAR (50),
   FieldChanged VARCHAR (50),
   OldValue VARCHAR (50),        
   NewValue VARCHAR (50),
   RecordID INT,
   DateChanged SMALLDATETIME,    
   ChangedBy   VARCHAR (50),  
   PRIMARY KEY (ID)
);