/****** View Students and their assigned counselor  ******/
SELECT s.strid as StudentID
      ,site.strSISCode as School
      ,p.strLastName as StudentLast
      ,p.strFirstName as StudentFirst
      ,CONVERT(VARCHAR(10),e.datEnrollmentEntryDate,101) as DistrictEntry
      ,CONVERT(VARCHAR(10),e.datEnrollmentDate,101) as EntryDate
	,gl.strCode as Grade
      ,e.lngStaffCounselorId
	,fsp.strLastName as CounselorName
      ,y.strDescription as Year
  FROM tblStudentEnrollment e
  JOIN dbo.lkuGradeLevels gl on gl.lngId=e.lngGradeLevelId
  JOIN tblSiteYear sy ON sy.lngId=e.lngSiteYearId
  JOIN tblSite site ON site.lngId=sy.lngSiteId
  JOIN tblYear y ON y.lngId=sy.lngYearId
  JOIN tblStudent s ON s.lngId=e.lngStudentId
  JOIN tblPeople p ON p.lngId=s.lngPeopleId
  JOIN tblFacultyStaff fs on fs.lngid=e.lngStaffCounselorId
  JOIN tblPeople fsp on fsp.lngid=fs.lngPeopleId
  WHERE e.datWithdrawDate is NULL --Update Active students only
  and site.strSISCode='RM' --School Abberviation
  and y.strDescription='2016-2017' --School Year (this may not be the format you use for they year description)

/**Query to find the Staff ID
SELECT lngId
      ,strEmailAddress
FROM tblFacultyStaff
WHERE strEmailAddress like '%long%' --this allows you to enter a bit of their email to find them
  **/

/**Update Student Counselor
  UPDATE e
  SET e.lngStaffCounselorId=2801 --This should be updated with the id found the in query above
  FROM dbo.tblStudentEnrollment e
  JOIN dbo.tblSiteYear sy ON e.lngSiteYearId=sy.lngId
  JOIN dbo.tblSite site ON sy.lngSiteId=site.lngId
  JOIN dbo.tblYear y ON sy.lngYearId=y.lngId
  JOIN dbo.tblStudent st ON e.lngStudentId=st.lngId
  JOIN dbo.tblPeople p ON st.lngPeopleId=p.lngId
  JOIN dbo.lkuGradeLevels gl on gl.lngId=e.lngGradeLevelId
  WHERE e.datWithdrawDate is NULL --Update Active students only
  and site.strSISCode='RM' --School Abberviation
  and y.strDescription='2016-2017' --School Year (this may not be the format you use for they year description)
  and gl.strCode='06' --Assign by Grade Level
 --  and p.strLastName>'k' --Assign by student last name
 





  
