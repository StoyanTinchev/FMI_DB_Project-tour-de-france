
-- 1. Взимане на всички колоездачи, времената им и общите им време по етап
SELECT c.registration_number,
       c.name,
       r.stage_number,
       r.stage_time,
       r.total_time
FROM cyclist c
         JOIN
     result r ON c.registration_number = r.cyclist_registration_number
WHERE r.stage_number = 1;

-- Взимане на всички колоездачи, сортирани по общо време за последния етап
SELECT c.registration_number,
       c.name,
       r.stage_number,
       r.total_time
FROM cyclist c
         JOIN
     result r ON c.registration_number = r.cyclist_registration_number
WHERE r.stage_number = (SELECT MAX(stage_number) FROM result)
ORDER BY r.total_time;

-- Взимане на всички колоездачи, сортирани по общо време за даден етап
SELECT c.registration_number,
       c.name,
       r.stage_number,
       r.total_time
FROM cyclist c
         JOIN
     result r ON c.registration_number = r.cyclist_registration_number
WHERE r.stage_number = 1
ORDER BY r.total_time;

-- Взимане на всички колоездачи по отбор
SELECT t.name AS team_name,
       c.registration_number,
       c.name AS cyclist_name
FROM team t
         JOIN
     cyclist c ON t.registration_number = c.team_registration_number

WHERE t.name = 'Movistar team';

-- Взимане на отбор по колоездач
SELECT c.name AS cyclist_name,
       t.name AS team_name
FROM cyclist c
         JOIN
     team t ON c.team_registration_number = t.registration_number
WHERE c.registration_number = 104;






