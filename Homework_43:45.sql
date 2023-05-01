-- (1) 
-- (2) 
-- 
-- (4) Вывести страны стримеров, у которых рейтинг ниже 2 
-- (5) Вывести имена пользователей и сколько оценок за все время они поставили


-- 1 ТОП-2 страны по сумме донатов
-- выбрать таблицу донейшн и таблицу юзерс
-- связать юзера и его донат/ скгруппировать по стране/ сложить донейшн по тсранам и вывести 2
select
users.country,
sum(donations.amount) as total_donations
from donations
join users on donations.donator_id = users.user_id
group by users.country
order by total_donations
limit 2;

SELECT users.country, SUM(donations.amount) AS total_donations
FROM donations
JOIN users ON donations.donator_id = users.user_id
GROUP BY users.country
ORDER BY total_donations DESC
LIMIT 2;
-- вопрос почему когда добавляешь деск меняеются страны?
-- франция всегда остается/ топ 2 по сумме выходит может быть как по возраст так и по убыв? или топ  - всегда взрастание?

-- 2 Вывести рейтинг для каждого незавершенного стрима

select 
avg(reactions.value) as rating
from streams
join reactions on streams.stream_id = reactions.reaction_id
WHERE streams.is_completed = 0
group by streams.stream_id
order by rating;

-- (3) Вывести ТОП-1 донаторов (имя, сумма в долларах)
-- донаторы в таблице донэйшен, сумма в донэйшен/ имена в таблице юзерс
-- обьединяем донэшен и юзерс по -id
SELECT 
users.fullname,
sum(donations.amount/1.20) as total_amount_USD
FROM donations
LEFT JOIN users ON donations.donator_id = users.user_id
group by users.fullname
order by total_amount_USD desc 
limit 1;





-- 4
-- вывести страны стримеров - рейтинг нижн 2
-- таблица стримс  -  таблица юзерс - 
-- юзерсы дают рейтинг/ у стримс страна зашита в тайтл

SELECT streams.title
FROM streams
JOIN users ON users.user_id = streams.stream_id
JOIN reactions ON reactions.stream_id = streams.stream_id
GROUP BY streams.stream_id, streams.title
HAVING AVG (reactions.reaction_id) < 2;

-- 5
-- Вывести имена пользователей и сколько оценок за все время они поставили
-- взять таблицу юзерс, взять таблицу реакшенсalter
-- соотнести пользователя и рекцииa
--   внутренний ключ юзерс айди внешний рекцтионс айди

select 
users.fullname,
COUNT(reactions.reaction_id) AS total_reactions
from users
left join reactions on users.user_id = reactions.user_id
group by users.fullname;


