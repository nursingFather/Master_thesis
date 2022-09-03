/****** Script for SelectTopNRows command from SSMS  ******/
SELECT cg.[Country_ID]
	  ,Trim(cg.[Country]) as [Country]

      ,[Year]
      ,[Gdp_per_capita]
	  ,[group]
  FROM [master_thesis].[dbo].[gdp_cap_piv$] gp
  RIGHT JOIN [master_thesis].[dbo].[c_group$] cg
  ON  gp.Country= trim(cg.[Country])
  Where [group] is not null
  AND Gdp_per_capita is null -------------
 