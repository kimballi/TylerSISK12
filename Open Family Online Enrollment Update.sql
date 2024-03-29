/****** Script for SelectTopNRows command from SSMS  ******/
--This file allows you to open back up the parent portal for online enrollment.
--You need to update both xx with the Family Id and verify the YearId

INSERT INTO tblC2Audit
(Description,TableChanged,FieldChanged,OldValue,NewValue,RecordID,DateChanged,ChangedBy)
SELECT 'Online Registration Release','tblOnlineRegUserPacket','datAccepted',datAccepted,'',lngID,GETDATE(),'leechk'
FROM tblOnlineRegUserPacket
WHERE lngYearId=15    --Please verify the year id you need in tblyear
and lngFamilyId='xx'  --FamilyID can be found in the top right corner on the Primary Parent tab


UPDATE tblOnlineRegUserPacket
SET datAccepted=NULL  --resets date accepted
   ,blnStatus=0       --resets status to 0
WHERE lngYearId=15    --Please verify the year id you need in tblyear
and lngFamilyId='xx'  --FamilyID can be found in the top right corner on the Primary Parent tab