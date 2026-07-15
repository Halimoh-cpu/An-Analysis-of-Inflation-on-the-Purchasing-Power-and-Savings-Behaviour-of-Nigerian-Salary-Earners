
--inserting data
SELECT * FROM AnalysisOfInflation

update AnalysisOfInflation
set Food_score_Num =1
where Food_score_Num=0;

SELECT DISTINCT Food_score_Num
FROM AnalysisOfInflation
ORDER BY Food_score_Num;

SELECT *
FROM AnalysisOfInflation
WHERE Food_score_Num = 0;

update AnalysisOfInflation
set Transportataion_score_Num =1
where Transportataion_score_Num=0;

update AnalysisOfInflation
set Healthcare_score_Num =1
where Healthcare_score_Num=0;

--Total respondents
SELECT COUNT(*) AS Total_Respondents
FROM AnalysisOfInflation;

--Purchasing power decline rate
SELECT 
    ROUND(
        SUM(CASE 
            WHEN Salary_Adequacy = 'It covers much less than before, I struggle significantly'
            OR Salary_Adequacy = 'It covers less than before, I manage but with difficulty'
            THEN 1.0 ELSE 0 
        END) / COUNT(*) * 100, 1
    ) AS Purchasing_Power_Decline_Rate
FROM AnalysisOfInflation;

--Spending More Than 70% of Salary on Essentials (70.39%):
SELECT 
    ROUND(
        SUM(CASE 
            WHEN Income_Expenditure = '71% - 90%'
            OR Income_Expenditure = 'More than 90%'
            THEN 1.0 ELSE 0 
        END) / COUNT(*) * 100, 2
    ) AS Spending_More_Than_70_Percent
FROM AnalysisOfInflation;

--Debt rate
SELECT 
    ROUND(
        SUM(CASE 
            WHEN Debt_Status = 'Yes, regularly, I borrow almost every month'
            OR Debt_Status = 'Yes, occasionally, I borrow when things get too tight'
            THEN 1.0 ELSE 0 
        END) / COUNT(*) * 100, 1
    ) AS Debt_Rate
FROM AnalysisOfInflation;

--most affected expenditure category
SELECT TOP 1
    Category,
    Average_Score
FROM (
    SELECT 'Food and Groceries' AS Category,
        ROUND(AVG(CAST(Food_score_Num AS FLOAT)), 2) AS Average_Score
    FROM AnalysisOfInflation
    UNION ALL
    SELECT 'Transportation and Fuel',
        ROUND(AVG(CAST(Transportataion_score_Num AS FLOAT)), 2)
    FROM AnalysisOfInflation
    UNION ALL
    SELECT 'Healthcare and Medications',
        ROUND(AVG(CAST(Healthcare_score_Num AS FLOAT)), 2)
    FROM AnalysisOfInflation
) AS Category_Scores
ORDER BY Average_Score DESC;

--completely stopped saving rate
SELECT 
    ROUND(
        SUM(CASE 
            WHEN Savings_Behaviour = 'I have completely stopped saving , there is nothing left to save'
            THEN 1.0 ELSE 0 
        END) / COUNT(*) * 100, 1
    ) AS Stopped_Saving_Rate
FROM AnalysisOfInflation;

--Stopped saving or significantly reduced savings
SELECT 
    ROUND(
        SUM(CASE 
            WHEN Savings_Behaviour = 'I have completely stopped saving , there is nothing left to save'
            OR Savings_Behaviour = 'I save much less than I used to'
            THEN 1.0 ELSE 0 
        END) / COUNT(*) * 100, 2
    ) AS Stopped_Or_Reduced_Saving_Rate
FROM AnalysisOfInflation;

--Depleted savings completely
SELECT 
    ROUND(
        SUM(CASE 
            WHEN Debt_Status = 'No, but I have completely depleted my savings to cope'
            THEN 1.0 ELSE 0 
        END) / COUNT(*) * 100, 2
    ) AS Depleted_Savings_Rate
FROM AnalysisOfInflation;

--most financially stable group
SELECT 
    Current_Monthly_Salary,
    ROUND(SUM(CASE 
        WHEN Debt_Status = 'No, I have managed without borrowing or depleting savings'
        THEN 1.0 ELSE 0 
    END) / COUNT(*) * 100, 2) AS Financially_Stable_Rate
FROM AnalysisOfInflation
GROUP BY Current_Monthly_Salary
ORDER BY Financially_Stable_Rate DESC;

--most Affected Gender
--Struggling rate among Gender
SELECT 
    Gender,
    ROUND(SUM(CASE 
        WHEN Salary_Adequacy = 'It covers much less than before, I struggle significantly'
        THEN 1.0 ELSE 0 
    END) / COUNT(*) * 100, 2) AS Struggling_Rate
FROM AnalysisOfInflation
GROUP BY Gender
ORDER BY Struggling_Rate DESC;

--managing with difficulty among Gender
SELECT 
    Gender,
    ROUND(SUM(CASE 
        WHEN Salary_Adequacy = 'It covers less than before, I manage but with difficulty'
        THEN 1.0 ELSE 0 
    END) / COUNT(*) * 100, 2) AS ManagingDifficulty_Rate
FROM AnalysisOfInflation
GROUP BY Gender
ORDER BY ManagingDifficulty_Rate DESC;

SELECT 
    Gender,
    Salary_Adequacy,
    COUNT(*) AS Total,
    ROUND(COUNT(*) * 100.0 / 
        SUM(COUNT(*)) OVER (PARTITION BY Gender), 2) AS Rate
FROM AnalysisOfInflation
GROUP BY Gender, Salary_Adequacy
ORDER BY Gender, Total DESC;

--Income group with improvement
SELECT 
    Current_Monthly_Salary,
    COUNT(*) AS Total_Respondents,
    SUM(CASE 
        WHEN Salary_Adequacy = 'It covers more than before, my situation has improved'
        THEN 1 ELSE 0 
    END) AS Improved_Count,
    ROUND(SUM(CASE 
        WHEN Salary_Adequacy = 'It covers more than before, my situation has improved'
        THEN 1.0 ELSE 0 
    END) / COUNT(*) * 100, 2) AS Improved_Rate
FROM AnalysisOfInflation
GROUP BY Current_Monthly_Salary
ORDER BY Improved_Rate DESC;

--Gender with improvement
SELECT 
    Gender,
    COUNT(*) AS Total_Respondents,
    SUM(CASE 
        WHEN Salary_Adequacy = 'It covers more than before, my situation has improved'
        THEN 1 ELSE 0 
    END) AS Improved_Count,
    ROUND(SUM(CASE 
        WHEN Salary_Adequacy = 'It covers more than before, my situation has improved'
        THEN 1.0 ELSE 0 
    END) / COUNT(*) * 100, 2) AS Improved_Rate
FROM AnalysisOfInflation
GROUP BY Gender
ORDER BY Improved_Rate DESC;


--Dominant Strategy Among Poorest Earners
SELECT 
    Current_Monthly_Salary,
    Coping_Strategy,
    COUNT(*) AS Total,
    ROUND(COUNT(*) * 100.0 / 
        SUM(COUNT(*)) OVER (PARTITION BY Current_Monthly_Salary), 2) AS Rate
FROM AnalysisOfInflation
WHERE Current_Monthly_Salary = 'Below #50,000'
GROUP BY Current_Monthly_Salary, Coping_Strategy
ORDER BY Rate DESC;

--Dominant Strategy Among Highest Earners 
SELECT 
    Current_Monthly_Salary,
    Coping_Strategy,
    COUNT(*) AS Total,
    ROUND(COUNT(*) * 100.0 / 
        SUM(COUNT(*)) OVER (PARTITION BY Current_Monthly_Salary), 2) AS Rate
FROM AnalysisOfInflation
WHERE Current_Monthly_Salary = 'Above #500,000'
GROUP BY Current_Monthly_Salary, Coping_Strategy
ORDER BY Rate DESC;

--most used coping strategy
SELECT 
    Current_Monthly_Salary,
    Coping_Strategy,
    COUNT(*) AS Total,
    ROUND(COUNT(*) * 100.0 / 
        SUM(COUNT(*)) OVER (PARTITION BY Current_Monthly_Salary), 2) AS Rate
FROM AnalysisOfInflation
GROUP BY Current_Monthly_Salary, Coping_Strategy
ORDER BY Current_Monthly_Salary, Total DESC;