/****** Script for SelectTopNRows command from SSMS  ******/
SELECT cg.Country_ID
	  ,trim(cg.[Country]) as [Country]
		--ge.[Country Name]
      ,gp.[Year]
      ,[Govt_ effectiveness]
	  ,[Rule_of_Law]
	  ,[Control_of_Corr]
	  ,ROUND(([Control_of_Corr]+[Rule_of_Law]+[Govt_ effectiveness])/3,5) as Overall_inst_index
	  ,[Gdp_per_capita]
	  ,[HDI]
	  ,cg.[group]
  FROM [master_thesis].[dbo].[Govt_effevct$] ge
  JOIN [master_thesis].[dbo].[rule_of_law$] rol
  ON ge.[Country Name] = rol.[Country Name]
  AND ge.Year = rol.Year
  JOIN [master_thesis].[dbo].[contrl_corr$] cc
  ON ge.[Country Name] = cc.[Country Name]
  AND ge.Year = cc.Col3
  JOIN [master_thesis].[dbo].[c_group$] cg
  ON ge.[Country Name] = trim(cg.[Country])
  JOIN [master_thesis].[dbo].[gdp_cap_piv$] gp
  ON ge.[Year] = gp.[Year]
  AND gp.Country= trim(cg.[Country])
  JOIN [master_thesis].[dbo].[Human Development$] hd
  ON cc.[Col3] = hd.Year
  AND cc.[Country Name] = trim(hd.Country)

  order by Country_ID
 RIGHT JOIN [master_thesis].[dbo].[c_group$] cg
  ON  gp.Country= trim(cg.[Country])
  Where [group] is not null

  --Fixing the discrepancies between the two tables
  /* Update  [master_thesis].[dbo].[Govt_effevct$] 
  SET [Country Name] = (case 
						when [Country Name] = 'Congo, Rep.'  then 'Congo Rep'
                         when [Country Name] = 'Gambia, The'  then 'Gambia'
                         when [Country Name] = 'Venezuela, RB'  then 'Venezuela'
                    end)
 
  WHERE [Country Name] in ('Congo, Rep.','Gambia, The','Venezuela, RB')

    Update  [master_thesis].[dbo].[rule_of_law$]
  SET [Country Name] = (case 
						when [Country Name] = 'Congo, Rep.'  then 'Congo Rep'
                         when [Country Name] = 'Gambia, The'  then 'Gambia'
                         when [Country Name] = 'Venezuela, RB'  then 'Venezuela'
                    end)
  WHERE [Country Name] in ('Congo, Rep.','Gambia, The','Venezuela, RB')
  

     Update  [master_thesis].[dbo].[contrl_corr$]
  SET [Country Name] = (case 
						when [Country Name] = 'Congo, Rep.'  then 'Congo Rep'
                         when [Country Name] = 'Gambia, The'  then 'Gambia'
                         when [Country Name] = 'Venezuela, RB'  then 'Venezuela'
                    end)
  WHERE [Country Name] in ('Congo, Rep.','Gambia, The','Venezuela, RB') */

/*Update  [master_thesis].[dbo].[Human Development$ ]
  SET [Country] = (case 
						when [Country] = ' Congo (Democratic Republic of the)'  then 'Congo Rep'
                         when [Country] = ' Bolivia (Plurinational State of)'  then 'Bolivia'
                         when [Country] = ' Venezuela (Bolivarian Republic of)'  then 'Venezuela'
                    end)
  WHERE [Country] in (' Congo (Democratic Republic of the)',' Bolivia (Plurinational State of)',' Venezuela (Bolivarian Republic of)') */