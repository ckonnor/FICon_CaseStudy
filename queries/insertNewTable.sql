INSERT INTO dbo.orgData (Date, CPI, civLabor, unempLevel)
SELECT DISTINCT cpi.Date, cpi.Value AS CPI, cl.Value AS civLabor, ul.Value AS unempLevel FROM FI_CaseData cpi
LEFT JOIN FI_CaseData cl ON cl.Date = cpi.Date
LEFT JOIN FI_CaseData ul ON ul.Date = cpi.Date
WHERE (cpi.Data = 'Consumer Price Index' AND cl.Data = 'Civilian Labor Force'
AND ul.Data = 'Unemployment Level')
ORDER BY cpi.Date