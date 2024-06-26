/** 
 ** CREATED BY: ALEX NEWSHAM
 ** CREATED ON: 21/06/2024
 ** PURPOSE: GET THE DAY NAMES FOR THE FIRST AND LAST DAYS OF LAST MONTH
*/

-- Last Month - GET THE NAME OF THE FIRST AND LAST DAYS OF THE MONTH
SELECT 'Get the day names for the first and last dates of last month' AS Interval, DATENAME(WEEKDAY, DATEADD(S, +0.99, DATEADD(M, DATEDIFF(M,0,GETDATE())-1,0))) as FirstDayName ,DATENAME(WEEKDAY, DATEADD(S, -1, DATEADD(M, DATEDIFF(M,0,GETDATE()),0))) as LastDayName
