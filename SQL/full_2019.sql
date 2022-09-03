/****** Script for SelectTopNRows command from SSMS  ******/
select distinct(Country_ID), [Country Name] from
(SELECT [Country_ID]
	  ,cc.[Country Name]
      ,[Col3] AS Year
	  ,[Control_of_Corr]
      ,[Govt_ effectiveness]
	  ,[Rule_of_Law]
	  ,ROUND(([Control_of_Corr]+[Rule_of_Law]+[Govt_ effectiveness])/3,5) as Overall_inst_index
	  ,ROUND([GDP per capita (constant 2015 US$)], 3) as GDP_per_capita
	  ,[HDI]
	  ,[group]
  FROM [master_thesis].[dbo].[c_group$] gp
  JOIN [master_thesis].[dbo].[contrl_corr$] cc
  ON cc.[Country Name] = trim(gp.[Country])
  JOIN [master_thesis].[dbo].[Govt_effevct$] ge
  ON cc.[Col3] = ge.Year
  AND cc.[Country Name] = ge.[Country Name] 
  JOIN [master_thesis].[dbo].[rule_of_law$] rl
  ON cc.[Col3] = rl.Year
  AND cc.[Country Name] = rl.[Country Name] 
  JOIN [master_thesis].[dbo].[Sheet1$] gd
  ON cc.[Col3] = gd.Year
  AND cc.[Country Name] = gd.[Country Name] 
  JOIN [master_thesis].[dbo].[Human Development$] hd
  ON cc.[Col3] = hd.Year
  AND cc.[Country Name] = trim(hd.Country)) a 

    Update  [master_thesis].[dbo].[Sheet1$]
  SET [Country Name] = (case 
						when [Country Name] = 'Congo, Rep.'  then 'Congo Rep'
                         when [Country Name] = 'Gambia, The'  then 'Gambia'
                         when [Country Name] = 'Venezuela, RB'  then 'Venezuela'
                    end)
  WHERE [Country Name] in ('Congo, Rep.','Gambia, The','Venezuela, RB') 