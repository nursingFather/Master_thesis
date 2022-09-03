/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [master_thesis].[dbo].[gdp_cap_piv$] gp
  RIGHT JOIN [master_thesis].[dbo].[c_group$] cg
  ON  gp.Country= trim(cg.[Country])
  Where [group] is not null




  
