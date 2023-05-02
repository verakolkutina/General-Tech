 -- 1 уровень сложности: В рамках БД 'platform' написать след/запросы:


-- 1 Вывести количественное распределение оценок (реакций) по стриму №1.

-- 2Вывести список стран, откуда идут пожертвования.

-- 3Вывести сумму и ко-во всех полученных пожертвований стримером №1 

SELECT reactions.reaction_id, COUNT(*) as count
FROM streams
LEFT JOIN reactions ON streams.stream_id = reactions.stream_id
WHERE streams.stream_id = 1
GROUP BY reactions.reaction_id
ORDER BY count;

-- Вывести список стран, откуда идут пожертвования.
-- связать таблицу донейшени таблицу юзер

-- 2 а)
-- select users.country as donatator_country
--  from donations
--  left join users on users.user_id=donations.donator_id
--  group by donator_country;
-- 2б)

SELECT users.country as donations_country
FROM donations
LEFT JOIN users ON users.user_id = donations.donator_id
 GROUP BY donations_country;

-- почему в варианте а ошибка а в варианте 2 отрабатывает? сипарвила только одно слово в поле group by

-- 3)Вывести сумму и ко-во всех полученных пожертвований стримером №1 
-- 
select 
SUM(amount) as total_donations, 
COUNT(*) as donation_count
from donations
left join streams on donations.stream_id=streams.stream_id
where streams.stream_id = 1;







