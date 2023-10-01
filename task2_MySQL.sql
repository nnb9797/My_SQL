-- создаём новую базу данных
DROP DATABASE IF EXISTS hw_lesson_2;
CREATE  DATABASE hw_lesson_2;

-- 1.Используя операторы языка SQL, создаём таблицу “sales”.  
USE hw_lesson_2;
DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
	order_date  DATE NOT NULL,
	count_product  INT
);

-- заполняем таблицу данными
INSERT INTO sales (order_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

-- проверяем таблицу
SELECT * FROM sales;

/*Для данных таблицы “sales” указываем тип заказа в зависимости от кол-ва :
меньше 100 - Маленький заказ
от 100 до 300 - Средний заказ
больше 300 - Большой заказ
*/

SELECT 
	id AS 'Номер заказа',
	order_date AS 'Дата заказа',
    count_product AS 'Количество позиций',
	CASE 
		WHEN count_product < 100 THEN 'Маленький заказ'
		WHEN count_product BETWEEN 100 AND 300 THEN 'Средний заказ'
		WHEN count_product > 300 THEN 'Большой заказ'
        ELSE 'Не определено'
	END AS 'Тип заказа'	
FROM sales;

-- Используя операторы языка SQL, создаём таблицу “orders” 
CREATE TABLE orders (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
	employee_id  VARCHAR(10) NOT NULL,
	amount  DOUBLE,
    order_status  VARCHAR(50) NOT NULL
);

-- заполняем таблицу значениями (см. презентацию слайд 29).
INSERT INTO orders (employee_id, amount, order_status)
VALUES
('e03', '15.00', 'OPEN'),
('e01', '25.50', 'OPEN'),
('e05', '100.70', 'CLOSED'),
('e02', '22.18', 'OPEN'),
('e04', '9.50', 'CANCELLED');

-- проверяем таблицу
SELECT * FROM ORDERS;

/*Выбираем все заказы. В зависимости от поля order_status выводим столбец full_order_status:
OPEN – «Order is in open state» ;
CLOSED - «Order is closed»;
CANCELLED - «Order is cancelled»
*/

SELECT 
	id AS 'Номер заказа',
	employee_id AS 'id Исполнителя',
    amount AS 'Общая стоимость заказа',
	CASE 
		WHEN order_status = 'OPEN' THEN 'Order is in open state'
		WHEN order_status = 'CLOSED' THEN 'Order is closed'
		WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
        ELSE 'Не определено'
	END AS 'full_order_status'	
FROM orders;

-- Чем NULL отличается от 0?
/*  В SQL NULL — это термин, используемый для представления отсутствующего значения. 
Значение NULL в SQL таблице — это значение в поле, которое отображается как пустое.
Поле со значением NULL — это поле без значения. 
NULL отличается от 0 тем, что NULL не представляет никакого значения, 
в то время как 0 представляет число с математическим  значением 0.
*/