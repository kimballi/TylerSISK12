/****** Script for SelectTopNRows command from SSMS  ******/
--This file allows you to open back up the parent portal for online enrollment.

UPDATE tblOnlineRegUserPacket
SET datAccepted=NULL
   ,blnStatus=0
WHERE lngYearId=15 --Please verify the year id you need in tblyear
and lngFamilyId='xx' --FamilyID can be found in the top right courner on the Primary Parent tab