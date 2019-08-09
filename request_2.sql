SELECT 
-- id кв в системе
dj_flats.id AS "ID квартиры",
--
dj_flats.number AS "# квартиры",
-- 
CASE WHEN dj_flats.status_id = 14 THEN 'Рассрочка'
	 WHEN dj_flats.status_id = 12 THEN 'Оформление'
	 WHEN dj_flats.status_id = 28 THEN 'Подрядчик'
	 WHEN dj_flats.status_id = 2 THEN 'Бронь ипотека'
	 WHEN dj_flats.status_id = 15 THEN 'Продано'
	 WHEN dj_flats.status_id = 21 THEN 'Продается'
	 WHEN dj_flats.status_id = 1 THEN 'Устная бронь'
	 WHEN dj_flats.status_id = 16 THEN 'Бронь рассрочка'
	 WHEN dj_flats.status_id = 3 THEN 'Бронь подрядчик'
	 WHEN dj_flats.status_id = 4 THEN 'Резерв оплаченный'
	 WHEN dj_flats.status_id = 5 THEN 'Резерв без оплаты'
	 WHEN dj_flats.status_id = 6 THEN 'Резерв вторичка'
	 WHEN dj_flats.status_id = 23 THEN 'Резерв особый'
	 WHEN dj_flats.status_id = 24 THEN 'Зарегистрирован'
	 WHEN dj_flats.status_id = 25 THEN 'Приостановка'
	 WHEN dj_flats.status_id = 27 THEN 'Зачет'
	 WHEN dj_flats.status_id = 30 THEN 'Снято с продажи'
	 WHEN dj_flats.status_id = 29 THEN 'Особый статус'
 	 WHEN dj_flats.status_id = 13 THEN 'На регистрации'
	 ELSE 'неопределен'
END AS "Статус",
--
CASE WHEN dj_flats.state_id = 1 THEN 'чистая'
	 WHEN dj_flats.state_id = 2 THEN 'перепродажа'
	 ELSE 'переуступка'
END AS "Тип продажи",
--
MAX(CAST(dj_flat_statuses_history.changedon AS Date )) AS "Дата"
-- CONVERT(nvarchar, dj_flat_statuses_history.changedon, 3) AS "Дата",
-- dj_flat_statuses_history.id AS "Дата id"
--
FROM dj_flats 
JOIN dj_floors ON dj_floors.id = dj_flats.floor_id 
JOIN dj_plans ON dj_plans.id = dj_flats.plan_id
JOIN dj_sections ON dj_sections.id = dj_flats.section_id
JOIN dj_buildings ON dj_buildings.id = dj_flats.building_id
JOIN dj_projects ON dj_projects.id = dj_flats.project_id
JOIN dj_flat_statuses_history ON dj_flat_statuses_history.flat_id = dj_flats.id
WHERE dj_flats.project_id IN (41, 42, 43, 44, 46, 47, 97) AND dj_plans.typex = 'flat'
GROUP BY dj_flats.id;