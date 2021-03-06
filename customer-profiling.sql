/****** Script for SelectTopNRows command from SSMS  ******/

SELECT 
 q.KundIdExists 
,q.namnExists 
,q.EpostExists 
,q.MobiltelefonExists ,
COUNT(*),
(COUNT(*)*1.0)/34249*100

FROM (

SELECT CASE WHEN KundId IS NULL THEN 0 ELSE 1 END AS KundIdExists,
CASE WHEN LEN([Efternamn]) <3 OR  Efternamn IS NULL THEN 0 ELSE 1 END AS namnExists,
CASE WHEN LEN([Epost]) <3  OR  [Epost] IS NULL THEN 0 ELSE 1 END AS EpostExists,
CASE WHEN LEN([Mobiltelefon]) <3  OR  [Mobiltelefon] IS NULL THEN 0 ELSE 1 END AS MobiltelefonExists

FROM [dbo].[rQT_BokningKund]
) q

  GROUP BY
  q.KundIdExists ,
  q.EpostExists,
  q.MobiltelefonExists,
  q.namnExists
ORDER BY COUNT(*) DESC
