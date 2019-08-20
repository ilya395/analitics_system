SELECT 
-- id кв в системе
dj_flats.id AS "ID квартиры",
--
dj_flats.number AS "# квартиры",
-- 
dj_flat_statuses_history.price AS "Цена за помещение, руб.",
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
GROUP BY dj_flats.id, dj_flat_statuses_history.price;
-- FROM dj_flat_statuses_history 
-- JOIN dj_flats ON dj_flats.id = dj_flat_statuses_history.flat_id 
-- JOIN dj_plans ON dj_plans.id = dj_flats.plan_id
-- JOIN dj_sections ON dj_sections.id = dj_flats.section_id
-- JOIN dj_buildings ON dj_buildings.id = dj_flats.building_id
-- JOIN dj_projects ON dj_projects.id = dj_flats.project_id
-- JOIN dj_flat_statuses_history ON dj_flat_statuses_history.flat_id = dj_flats.id
-- WHERE dj_flats.project_id IN (41, 42, 43, 44, 46, 47, 97) AND dj_plans.typex = 'flat' 
-- GROUP BY dj_flat_statuses_history.price, dj_flats.id;