DROP DATABASE IF EXISTS lesson_3;
CREATE DATABASE lesson_3;
USE lesson_3;

-- Сщздаем таблицу Персонал
DROP TABLE IF EXISTS staff;
CREATE TABLE staff (
	id INT AUTO_INCREMENT PRIMARY KEY, 
	firstname VARCHAR(45),
	lastname VARCHAR(45),
	post VARCHAR(100),
	seniority INT, 
	salary INT, 
	age INT
);

-- Наполняем таблицу данными
INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', '40', 100000, 60),
('Петр', 'Власов', 'Начальник', '8', 70000, 30),
('Катя', 'Катина', 'Инженер', '2', 70000, 25),
('Саша', 'Сасин', 'Инженер', '12', 50000, 35),
('Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
('Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);

-- Проверяем таблицу 
SELECT id, firstname, lastname, post, seniority, salary, age  FROM staff;

-- 1а. Сортируем данные по полю заработная плата (salary) в порядке: убывания 
SELECT * FROM staff ORDER BY salary DESC;

-- 1б. Сортируем данные по полю заработная плата (salary) в порядке: возрастания
SELECT * FROM staff ORDER BY salary;

-- 2. Выводим 5 максимальных заработных плат (salary)
SELECT * FROM staff ORDER BY salary DESC LIMIT 5;

-- 3. Считаем суммарную зарплату (salary) по каждой специальности (роst)
SELECT post, SUM(salary) 
FROM staff  
GROUP BY post;

-- выводим отдельно суммарную зарплату по каждой специальности для самопроверки
-- SELECT SUM(salary) FROM staff WHERE post = 'Начальник';
-- SELECT SUM(salary) FROM staff WHERE post = 'Инженер';
-- SELECT SUM(salary) FROM staff WHERE post = 'Рабочий';
-- SELECT SUM(salary) FROM staff WHERE post = 'Уборщик';

-- 4. Находим кол-во сотрудников со специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT COUNT(*) FROM staff 
WHERE post = 'Рабочий' 
AND age BETWEEN 24 AND 49;

-- выводим этих сотрудников со специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно (для самопроверки)
-- SELECT * FROM staff WHERE post = 'Рабочий' AND age BETWEEN 24 AND 49;

-- 5. Находим количество специальностей
SELECT COUNT(DISTINCT post) FROM staff;

-- выводим уникальные специальности (для самопроверки)
-- SELECT DISTINCT post FROM staff;

-- 6. Выводим специальности, у которых средний возраст сотрудников меньше 30 лет
SELECT post FROM staff  
GROUP BY post 
HAVING AVG(age) < 30;




