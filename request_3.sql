-- SELECT * FROM dj_flat_statuses_history WHERE flat_id IN (19244, 17834);
SELECT 
-- 
dj_flat_statuses_history.flat_id AS "ID квартиры", 
-- 
dj_flats.number AS "Номер квартиры",
-- 
CASE WHEN dj_flats.project_id = 41 THEN 'Малиновка. Первая очередь.'
	 WHEN dj_flats.project_id = 42 THEN 'Норвежский'
	 WHEN dj_flats.project_id = 43 THEN 'Скайлайн'
	 WHEN dj_flats.project_id = 44 THEN 'Ричмонд'
	 WHEN dj_flats.project_id = 46 THEN 'Малиновка. Вторая очередь.'
	 WHEN dj_flats.project_id = 47 THEN 'Привилегия'
	 WHEN dj_flats.project_id = 97 THEN 'Атлантис'
	 ELSE ''
END AS "Проект",
-- 
CASE WHEN dj_flat_statuses_history.status_id = 14 THEN 'Рассрочка'
	 WHEN dj_flat_statuses_history.status_id = 12 THEN 'Оформление'
	 WHEN dj_flat_statuses_history.status_id = 28 THEN 'Подрядчик'
	 WHEN dj_flat_statuses_history.status_id = 2 THEN 'Бронь ипотека'
	 WHEN dj_flat_statuses_history.status_id = 15 THEN 'Продано'
	 WHEN dj_flat_statuses_history.status_id = 21 THEN 'Продается'
	 WHEN dj_flat_statuses_history.status_id = 1 THEN 'Устная бронь'
	 WHEN dj_flat_statuses_history.status_id = 16 THEN 'Бронь рассрочка'
	 WHEN dj_flat_statuses_history.status_id = 3 THEN 'Бронь подрядчик'
	 WHEN dj_flat_statuses_history.status_id = 4 THEN 'Резерв оплаченный'
	 WHEN dj_flat_statuses_history.status_id = 5 THEN 'Резерв без оплаты'
	 WHEN dj_flat_statuses_history.status_id = 6 THEN 'Резерв вторичка'
	 WHEN dj_flat_statuses_history.status_id = 23 THEN 'Резерв особый'
	 WHEN dj_flat_statuses_history.status_id = 24 THEN 'Зарегистрирован'
	 WHEN dj_flat_statuses_history.status_id = 25 THEN 'Приостановка'
	 WHEN dj_flat_statuses_history.status_id = 27 THEN 'Зачет'
	 WHEN dj_flat_statuses_history.status_id = 30 THEN 'Снято с продажи'
	 WHEN dj_flat_statuses_history.status_id = 29 THEN 'Особый статус'
 	 WHEN dj_flat_statuses_history.status_id = 13 THEN 'На регистрации'
	 ELSE CONCAT('неопределен статус: ', dj_flat_statuses_history.status_id)
END AS "Статус продажи",
-- 
CASE WHEN dj_flat_statuses_history.state_id = 1 THEN 'чистая'
	 WHEN dj_flat_statuses_history.state_id = 2 THEN 'перепродажа'
	 ELSE 'переуступка'
END AS "Тип продажи",
-- 
dj_flat_statuses_history.price AS "Цена", 
-- 
CAST(dj_flat_statuses_history.changedon AS Date) AS "Время изменения"
-- 
FROM dj_flat_statuses_history 
JOIN dj_flats ON dj_flats.id = dj_flat_statuses_history.flat_id
JOIN dj_projects ON dj_projects.id = dj_flats.project_id
JOIN dj_plans ON dj_plans.id = dj_flats.plan_id
WHERE dj_flats.project_id IN (41, 42, 43, 44, 46, 47, 97) AND dj_plans.typex = 'flat';