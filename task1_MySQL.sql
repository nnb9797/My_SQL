
-- DROP DATABASE IF EXISTS lesson_1;
-- CREATE DATABASE lesson_1;

-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс.
DROP TABLE IF EXISTS `mobile_phones`;
CREATE TABLE `mobile_phones` (
  `id_mobile_phones` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `manufacturers` VARCHAR(45) NOT NULL,
  `price` DECIMAL NULL,
  `product_count` INT NOT NULL,
  PRIMARY KEY (`id_mobile_phones`));
  
-- Заполните БД данными
INSERT INTO `mobile_phones` 
  (`product_name`, `manufacturers`, `price`, `product_count`) 
VALUES 
  ('iPhone X', 'Apple', '76000', '3'),
  ('iPhonmobile_phonese 8', 'Apple', '51000', '2'),
  ('Galaxy S9', 'Samsung', '56000', '2'),
  ('Galaxy S8', 'Samsung ', '41000', '1'),
  ('P20 Pro', 'Huawei ', '36000', '5');

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT `product_name`, `manufacturers`, `price`
FROM mobile_phones
WHERE product_count > 2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT `product_name`, `manufacturers`, `price`, `product_count` 
FROM mobile_phones
WHERE manufacturers  LIKE '%Samsung%';

-- 4.1. Товары, в которых есть упоминание "Iphone"
SELECT `product_name`, `manufacturers`, `price`, `product_count`  
FROM mobile_phones
WHERE product_name LIKE '%iPhone%';

-- 4.2. Товары, в которых есть упоминание "Samsung"
SELECT `product_name`, `manufacturers`, `price`, `product_count`  
FROM mobile_phones
WHERE manufacturers LIKE '%Samsung%';

-- 4.3. Товары, в которых есть ЦИФРЫ  
SELECT `product_name`, `manufacturers`, `price`, `product_count`  
FROM mobile_phones
WHERE product_name IS NOT NULL;

-- 4.4. Товары, в которых есть ЦИФРА "8" 
SELECT `product_name`, `manufacturers`, `price`, `product_count`  
FROM mobile_phones
WHERE product_name LIKE '%8%';