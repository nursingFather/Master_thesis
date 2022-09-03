/****** Script for SelectTopNRows command from SSMS  ******/
SELECT DISTINCT [Country Name]
  FROM [master_thesis].[dbo].[contrl_corr$]
  Where ([Country Name] like '%Gamb%' or [Country Name] like '%Con%' or  [Country Name] like '%enezu%')

 --Fixing the discrepancies between the two tables
   Update [master_thesis].[dbo].[gdp_cap_piv$]
  SET Country = 'Congo Rep'
  WHERE Country = 'Congo Rep.'
  
   Update [master_thesis].[dbo].[gdp_cap_piv$]
  SET Country = 'Gambia'
  WHERE Country = 'Gambia The'

  Update [master_thesis].[dbo].[gdp_cap_piv$]
  SET Country = 'Venezuela'
  WHERE Country = 'Venezuela RB'