/** 
 
 ** CREATED BY: ALEX NEWSHAM
 ** CREATED ON: 21/06/2024
 ** PURPOSE: GET LAST MONTH'S FIRST AND LAST DATES OF THE MONTH
*/

-- Last Month
SELECT 'Get Last Month - First and Last Dates of the Month' AS Interval, DATEADD(S, +0.99, DATEADD(M, DATEDIFF(M,0,GETDATE())-1,0)) ,DATEADD(S, -1, DATEADD(M, DATEDIFF(M,0,GETDATE()),0))


SELECT 'Get Last Month - First and Last Dates of the Month' AS Interval, DATENAME(WEEKDAY, DATEADD(S, +0.99, DATEADD(M, DATEDIFF(M,0,GETDATE())-1,0))) ,DATENAME(WEEKDAY, DATEADD(S, -1, DATEADD(M, DATEDIFF(M,0,GETDATE()),0)))