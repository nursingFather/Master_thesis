/****** Script for SelectTopNRows command from SSMS  ******/
SELECT Country_ID
	  ,trim(cg.[Country]) as [Country]
		--ge.[Country Name]
      ,ge.[Year]
      ,[Govt_ effectiveness]
	  ,[Rule_of_Law]
	  ,[Control_of_Corr]
	  ,ROUND(([Control_of_Corr]+[Rule_of_Law]+[Govt_ effectiveness])/3,5) as Overall_inst_index
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

  --Fixing the discrepancies between the two tables
   Update  [master_thesis].[dbo].[Govt_effevct$] 
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
  WHERE [Country Name] in ('Congo, Rep.','Gambia, The','Venezuela, RB')