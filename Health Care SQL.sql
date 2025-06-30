SELECT *
FROM [dbo].[Health Dataset]


--Count of Individuals
SELECT Gender, COUNT(Gender) AS TotalCount, ROUND(COUNT(Gender) * 100.0 / SUM(COUNT(Gender)) OVER(), 2) AS Percentage
FROM [dbo].[Health Dataset]
GROUP  BY Gender


--Average Age
SELECT Gender, AVG(Age) AS AvgAge
FROM [dbo].[Health Dataset]
GROUP BY Gender


--BMI Category Distribution
SELECT 
    CASE 
        WHEN BMI < 18.5 THEN 'Underweight'
        WHEN BMI BETWEEN 18.5 AND 24.9 THEN 'Normal'
        WHEN BMI BETWEEN 25 AND 29.9 THEN 'Overweight'
        WHEN BMI >= 30 THEN 'Obese'
        ELSE 'Unknown'
    END AS BMI_Category,
	COUNT(BMI) AS BMICount,
    ROUND(COUNT(BMI) * 100.0 / SUM(COUNT(BMI)) OVER(), 2) AS Percentage
FROM [dbo].[Health Dataset]
GROUP BY 
    CASE 
        WHEN BMI < 18.5 THEN 'Underweight'
        WHEN BMI BETWEEN 18.5 AND 24.9 THEN 'Normal'
        WHEN BMI BETWEEN 25 AND 29.9 THEN 'Overweight'
        WHEN BMI >= 30 THEN 'Obese'
        ELSE 'Unknown'
    END;


--Average BMI
SELECT Gender, AVG(BMI) AS AvgBMI, COUNT(BMI) AS BMICount 
FROM [dbo].[Health Dataset]
GROUP BY(Gender)


--Chronic Disease Peoples
SELECT Gender, COUNT(Chronic_Disease) AS Count, ROUND(COUNT(Chronic_Disease) * 100.0 / SUM(COUNT(Chronic_Disease)) OVER(), 2) AS Percentage
FROM [dbo].[Health Dataset]
GROUP BY(Gender)


--Chronic Disease Count
SELECT Chronic_Disease, ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS Percentage
FROM [dbo].[Health Dataset]
GROUP BY Chronic_Disease;


--Average Gender Sleep Duration
SELECT Gender, ROUND(AVG(Sleep_Hours), 2) AS Avg_Sleep_Hours
FROM [dbo].[Health Dataset]
GROUP BY(Gender)


--Average Age Sleep Duration
SELECT * 
FROM (
   SELECT
    CASE 
        WHEN Age BETWEEN 18 AND 29 THEN '18-29'
        WHEN Age BETWEEN 30 AND 44 THEN '30-44'
        WHEN Age BETWEEN 45 AND 59 THEN '45-59'
        WHEN Age >= 60 THEN '60+'
        ELSE 'Unknown'
    END AS Age_Group,
    ROUND(AVG(Sleep_Hours), 2) AS Avg_Sleep_Hours
FROM [dbo].[Health Dataset]
GROUP BY 
    CASE 
        WHEN Age BETWEEN 18 AND 29 THEN '18-29'
        WHEN Age BETWEEN 30 AND 44 THEN '30-44'
        WHEN Age BETWEEN 45 AND 59 THEN '45-59'
        WHEN Age >= 60 THEN '60+'
        ELSE 'Unknown'
    END) AS grouped
ORDER BY
    CASE 
        WHEN Age_Group = '18-29' THEN 1
        WHEN Age_Group = '30-44' THEN 2
        WHEN Age_Group = '45-59' THEN 3
        WHEN Age_Group = '60+' THEN 4
        ELSE 5
    END;


--Average Stress Level by Gender
SELECT Gender, AVG(Stress_Level) AS Avg_Stress_Level
FROM [dbo].[Health Dataset]
GROUP  BY Gender


--Average Stress Level by Age
SELECT *
FROM (
SELECT 
CASE
  WHEN Age BETWEEN 18 AND 29 THEN '18-29'
        WHEN Age BETWEEN 30 AND 44 THEN '30-44'
        WHEN Age BETWEEN 45 AND 59 THEN '45-59'
        WHEN Age >= 60 THEN '60+'
        ELSE 'Unknown'
    END AS Age_Group,
	ROUND(AVG(Stress_Level), 2) AS Avg_Stress_Level
FROM [dbo].[Health Dataset]
GROUP BY 
    CASE 
        WHEN Age BETWEEN 18 AND 29 THEN '18-29'
        WHEN Age BETWEEN 30 AND 44 THEN '30-44'
        WHEN Age BETWEEN 45 AND 59 THEN '45-59'
        WHEN Age >= 60 THEN '60+'
        ELSE 'Unknown'
    END) AS grouped
ORDER BY
    CASE 
        WHEN Age_Group = '18-29' THEN 1
        WHEN Age_Group = '30-44' THEN 2
        WHEN Age_Group = '45-59' THEN 3
        WHEN Age_Group = '60+' THEN 4
        ELSE 5
    END;


--Average Stress Level by Smoker
SELECT Smoker, ROUND(AVG(Stress_Level), 2) AS Avg_Stress_Level
FROM [dbo].[Health Dataset]
GROUP BY Smoker
ORDER BY Smoker


--Smoker Rate
SELECT Smoker, ROUND(COUNT(Smoker) * 100.0 / SUM(COUNT(Smoker)) OVER(), 2) AS Percentage 
FROM [dbo].[Health Dataset]
GROUP BY Smoker


--Exercise Frequency
SELECT Exercise_Freq, COUNT(Exercise_Freq) AS Count, ROUND(COUNT(Exercise_Freq) * 100.0 / SUM(COUNT(Exercise_Freq)) OVER(), 2) AS Percentage
FROM [dbo].[Health Dataset]
GROUP BY(Exercise_Freq)
ORDER BY(Percentage)


--Diet Quality Breakdown
SELECT Diet_Quality, COUNT(Diet_Quality) AS Count, ROUND(COUNT(Diet_Quality) * 100.0 / SUM(COUNT(Diet_Quality)) OVER(), 2) AS Percentage
FROM [dbo].[Health Dataset]
GROUP BY(Diet_Quality)


--Alcohol Consumption Pattern
SELECT Alcohol_Consumption, COUNT(Alcohol_Consumption) AS Count, ROUND(COUNT(Alcohol_Consumption) * 100.0 / SUM(COUNT(Alcohol_Consumption)) OVER(), 2) AS Percentage
FROM [dbo].[Health Dataset]
GROUP BY(Alcohol_Consumption)

