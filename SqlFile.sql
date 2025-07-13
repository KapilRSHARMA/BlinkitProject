Select * from blinkit_data;
Select count(*) from blinkit_data;
UPDATE blinkit_data
set `Item Fat Content`=
CASE
WHEN `Item Fat Content` in ('LF', 'low fat') THEN 'Low Fat'
WHEN `Item Fat Content`= 'reg' THEN 'Regular'
else `Item Fat Content`
END;
describe blinkit_data;

Select distinct(`Item Fat Content`) FROM blinkit_data;
Select CONCAT(cast(sum(Sales)/1000000 as DECIMAL(10,2)),'M') AS Total_Sales_Millions
from blinkit_data
where `Item Fat Content`='Low Fat';

select cast(avg(Sales) as DECIMAL(10,1)) as Avg_Sales from blinkit_data;

select count(*) as No_Of_Items from blinkit_data 
where `Outlet Establishment Year`=2022;

select cast(avg(Rating) as decimal(10,2)) as Avg_Rating from blinkit_data;

select `Item Fat Content`, 
  concat(CAST(sum(Sales)/1000 as decimal(10,2)),'K') as Total_Sales_Thousands,
   CAST(avg(Sales) as decimal(10,2)) as Average_Sales,
    CAST(avg(Rating) as decimal(10,2)) as Avg_Rating,
    count(*) as No_Of_Items
from blinkit_data
group by `Item Fat Content`
order by Total_Sales_Thousands DESC;

select `Item Type`, 
	CAST(sum(Sales) as decimal(10,2)) as Total_Sales,
   CAST(avg(Sales) as decimal(10,2)) as Average_Sales,
    CAST(avg(Rating) as decimal(10,2)) as Avg_Rating,
    count(*) as No_Of_Items
from blinkit_data
group by `Item Type`
order by Total_Sales DESC
LIMIT 5;

SELECT 
    `Outlet Location Type`,
    SUM(CASE WHEN `Item Fat Content` = 'Low Fat' THEN Sales ELSE 0 END) AS Low_Fat,
    SUM(CASE WHEN `Item Fat Content` = 'Regular' THEN Sales ELSE 0 END) AS Regular
FROM blinkit_data
GROUP BY `Outlet Location Type`
ORDER BY `Outlet Location Type`;

select `Outlet Establishment Year`,
CAST(sum(Sales) as decimal(10,2)) as Total_Sales,
   CAST(avg(Sales) as decimal(10,2)) as Average_Sales,
    CAST(avg(Rating) as decimal(10,2)) as Avg_Rating,
    count(*) as No_Of_Items
from blinkit_data
group by `Outlet Establishment Year`
order by `Outlet Establishment Year` ASC;

SELECT
 `Outlet Size`,
 cast(sum(Sales) as decimal(10,2)) as Total_Sales,
 cast((sum(Sales)*100.0/sum(sum(Sales)) over())as decimal(10,2)) as Sales_Percentage
 from blinkit_data
 group by `Outlet Size`
 order by Total_Sales DESC;
 
select `Outlet Location Type`,
   CAST(sum(Sales) as decimal(10,2)) as Total_Sales,
   CAST(avg(Sales) as decimal(10,2)) as Average_Sales,
   CAST(avg(Rating) as decimal(10,2)) as Avg_Rating,
    count(*) as No_Of_Items
from blinkit_data
group by `Outlet Location Type`
order by Total_Sales desc;

select `Outlet Type`,
   CAST(sum(Sales) as decimal(10,2)) as Total_Sales,
   CAST(avg(Sales) as decimal(10,2)) as Average_Sales,
   CAST(avg(Rating) as decimal(10,2)) as Avg_Rating,
    count(*) as No_Of_Items
from blinkit_data
group by `Outlet Type`
order by Total_Sales desc;