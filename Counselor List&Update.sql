/****** Script for SelectTopNRows command from SSMS  ******/
SELECT e.lngId
      ,site.strSISCode
      ,p.strLastName
      ,p.strFirstName
      ,e.datEnrollmentDate
      ,e.lngStaffCounselorId
      ,e.datEnrollmentEntryDate
      ,e.datWithdrawDate
      ,y.strDescription
  FROM tblStudentEnrollment e
  JOIN tblSiteYear sy ON e.lngSiteYearId=sy.lngId
  JOIN tblSite site ON sy.lngSiteId=site.lngId
  JOIN tblYear y ON sy.lngYearId=y.lngId
  JOIN tblStudent st ON e.lngStudentId=st.lngId
  JOIN tblPeople p ON st.lngPeopleId=p.lngId
  WHERE e.datWithdrawDate is NULL
  and site.strSISCode='RM'
--  and p.strLastName>'k'
  and y.strDescription='2016-2017'


/**
  UPDATE e
  SET e.lngStaffCounselorId=2801
  FROM dbo.tblStudentEnrollment e
  JOIN dbo.tblSiteYear sy ON e.lngSiteYearId=sy.lngId
  JOIN dbo.tblSite site ON sy.lngSiteId=site.lngId
  JOIN dbo.tblYear y ON sy.lngYearId=y.lngId
  JOIN dbo.tblStudent st ON e.lngStudentId=st.lngId
  JOIN dbo.tblPeople p ON st.lngPeopleId=p.lngId
  JOIN dbo.lkuGradeLevels gl on gl.lngId=e.lngGradeLevelId
  WHERE e.datWithdrawDate is NULL
  and site.strSISCode='RM'
  and y.strDescription='2016-2017'
  and gl.strCode='06'
  
  ---rm laymank is 2801 6th 1617
  ---rm gerdesc is 442 7th 1617
  ---rm longc is 731 8th 1617
  ---cm ukleya m-z 1230
  ---cm bardwell a-l 2225
  ---rh young 9th 1353
  ---rh ron 10th 1828
  ---rh shana 11th 2204
  ---rh eric 12th 647
  
  --lookup id on tblfaculystaff
SELECT lngId
      ,strEmailAddress
FROM tblFacultyStaff
WHERE strEmailAddress like '%long%'


  **/
  