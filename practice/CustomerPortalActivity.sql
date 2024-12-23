USE [HollardDW]
GO
/****** Object:  StoredProcedure [pbi].[KPI_UpdateCustomerPortalActivity]    Script Date: 4/24/2024 9:45:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [pbi].[KPI_UpdateCustomerPortalActivity]
AS
BEGIN

    SET NOCOUNT ON;

    BEGIN TRY

    TRUNCATE TABLE [HollardDW].[pbi].[tblCustomerPortalActivity]
    INSERT INTO [HollardDW].[pbi].[tblCustomerPortalActivity]
    (
        DateID, 
        Component, 
        ClientActivity, 
        ClientTotalActivities, 
        Age, 
        Gender, 
        ProductType, 
        Tenure,
		BrandName,
		ClientId
    )
    SELECT 
    CONVERT(DATE, dtmInserted) AS DateID, 
    'Activity' AS Component,
    CASE
        WHEN CallTypeID = 18 THEN 'Update Payment Details'
        ELSE 'Update Contact Details'
    END AS ClientActivity, 
    COUNT(*) AS ClientTotalActivities, 
    NULL AS Age, 
    'N/A' AS Gender, 
    'Life Insurance' AS ProductType, 
    0 AS Tenure, 
    c.BrandName, 
    a.ClientId
FROM 
    Evolve.dbo.tblCallLog a WITH(NOLOCK)
    LEFT JOIN Evolve.dbo.tblClient b
    ON a.ClientID = b.ClientID
    LEFT JOIN Evolve.dbo.tblBrand c
    ON c.BrandID = b.BrandID
WHERE
      UserID = 'OnlineServiceUser' --AND b.FirstName NOT LIKE '%Test%'
      AND ((C.BrandId = 1 AND dtmInserted>='2022-05-30') OR (C.BrandId = 2 AND dtmInserted > ='2022-07-25'))
GROUP BY 
    CONVERT(DATE, dtmInserted), 
    CallTypeID, 
	 Case when CallTypeID = 18 then 'Update Payment Details' else 'Update Contact Details' END,
    c.BrandName, 
    a.ClientId

UNION ALL

SELECT 
    CONVERT(DATE, CreatedDate) AS DateID, 
    'Login' AS Component,
    CASE
        WHEN s.ClientPortalLoginStatusId = 2 THEN 'Success Login'
        ELSE 'Unsuccessful Login'
    END AS ClientActivity, 
    COUNT(*) AS ClientTotalActivities, 
    NULL AS Age, 
    'N/A' AS Gender, 
    'Life Insurance' AS ProductType, 
    0 AS Tenure, 
    c.BrandName, 
    l.ClientId
FROM 
    [CustomerPortal].[dbo].[tblClientPortalLogin] AS l
    INNER JOIN [CustomerPortal].[dbo].tblClientPortalLoginStatus AS s
    ON s.ClientPortalLoginStatusId = l.ClientPortalLoginStatusId
    LEFT JOIN Evolve.dbo.tblBrand c
    ON c.BrandID = l.BrandID
WHERE ((L.BrandId = 1 AND CreatedDate>='2022-05-30') OR (L.BrandId = 2 AND CreatedDate > ='2022-07-25')) --and l.clientid is not null
GROUP BY 
    CONVERT(DATE, CreatedDate), 
    s.ClientPortalLoginStatusId, 
    c.BrandName, 
    ClientId

UNION ALL

SELECT 
    CONVERT(DATE, CreatedDate) AS DateID, 
    'PayNow' AS Component,
    CASE
        WHEN t.PaymentTypeId = 1 THEN 'FullPayment'
        ELSE 'PartialPayment'
    END AS ClientActivity, 
    COUNT(*) AS ClientTotalActivities, 
    NULL AS Age, 
    'N/A' AS Gender, 
    'Life Insurance' AS ProductType, 
    0 AS Tenure, 
    BrandName, 
    l.ClientId
FROM 
    [CustomerPortal].[dbo].[tblPayNowLog] l
    INNER JOIN [CustomerPortal].[dbo].[tblPaymentType] t
    ON l.PaymentTypeId = t.PaymentTypeId
    LEFT JOIN Evolve.dbo.tblClient c
    ON l.ClientID = c.ClientID
    LEFT JOIN Evolve.dbo.tblBrand b
    ON c.BrandID = b.BrandID
WHERE CreatedDate >= '2022-05-30'
GROUP BY 
    CONVERT(DATE, CreatedDate), 
    t.PaymentTypeId, 
    BrandName, 
    l.ClientId

UPDATE [pbi].[tblCustomerPortalActivity]
SET 
    Gender = CASE
                 WHEN sex = 2 THEN 'Female'
                 ELSE 'Male'
             END, 
    Age = AgeAtEntry, 
    BrandName = p.BrandName, 
    ProductType = p.ProductType, 
    Tenure = DATEDIFF("yy", policystartdate, GETDATE())
FROM Evolve.dbo.tblMOSDaily d
     LEFT JOIN Hollarddw.dbo.DimProduct p
     ON d.ProductCode = p.ProductCode
WHERE 
   -- PolicyCount = 1
   -- AND 
	[pbi].[tblCustomerPortalActivity].ClientId = d.ClientId


UPDATE [pbi].[tblCustomerPortalActivity] SET Gender = 'Female' where gender = 'n/a' and customerportalactivityid%2=1 
UPDATE [pbi].[tblCustomerPortalActivity] SET Gender = 'Male' where gender = 'n/a' and customerportalactivityid%2=0

UPDATE [pbi].[tblCustomerPortalActivity]
SET 
    Age = (0 + FORMAT(GETDATE(), 'yyyyMMdd') - FORMAT(DOB, 'yyyyMMdd')) / 10000
FROM EVOLVE.DBO.TBLCLIENT dc
     JOIN HollardDW.[pbi].[tblCustomerPortalActivity] CP
     ON DC.ClientID = CP.Clientid
WHERE 
    CP.AGE IS NULL


-- IsFirstLogin = Identifies first ever log in 
update [HollardDW].[pbi].[tblCustomerPortalActivity] set isfirstlogin = 0

update [HollardDW].[pbi].[tblCustomerPortalActivity] set isfirstlogin = 1
where Component = 'login' and ClientActivity = 'success login'
and cast ( clientid as varchar(12) ) + cast ( dateid as varchar(12)) in 
(
select cast ( clientid as varchar(12) ) + cast ( dateid as varchar(12)) from 
(
select clientid , min(dateid) as dateid 
from [HollardDW].[pbi].[tblCustomerPortalActivity] 
where Component = 'login'and ClientActivity = 'success login'
group by clientid 
) z
)

-- IsUniqueLogin = Identifies the first login of each month
update [HollardDW].[pbi].[tblCustomerPortalActivity] set IsUniqueLogin = 0

update [HollardDW].[pbi].[tblCustomerPortalActivity] set IsUniqueLogin = 1
where Component = 'login'and ClientActivity = 'success login'
and cast ( clientid as varchar(12) ) + cast ( dateid as varchar(12)) in 
(
select cast ( clientid as varchar(12) ) + cast ( dateid as varchar(12)) from 
(
select clientid , left ( convert( varchar(12), dateid, 112 ) , 6 ) monthid , min(dateid) as dateid 
from [HollardDW].[pbi].[tblCustomerPortalActivity] 
where Component = 'login'and ClientActivity = 'success login'
group by left ( convert( varchar(12), dateid, 112 ) , 6 ) ,clientid 
) z
)



	END TRY
    BEGIN CATCH
        EXEC dbo.usp_ThrowError
    END CATCH;
END;
