--1. Подсчитать возможный доход за хлеб и молоко (с учетом скидок на эти товары)
SELECT name,
	price,
	quantity,
	discount,
	(price - (price * (discount / 100))) * quantity AS [total income]
FROM Product
WHERE 
	name LIKE 'Хлеб%' OR name LIKE 'Молоко%'

--2. Получить информацию о товарах, доставленных вчера и сегодня более 10 единиц (getdate, dateadd)
SELECT *
FROM Product
WHERE 
	(date_of_delivery = CAST(GETDATE() - 1 AS DATE) 
	OR date_of_delivery = CAST(GETDATE() AS DATE))
	AND quantity > 10

--3. Показать названия и цены товаров, доставленных в течение последнего месяца
SELECT name, price
FROM Product
WHERE 
	date_of_delivery >= CAST(DATEADD(MONTH, -1, GETDATE()) AS DATE)

--4. Показать на экран названия и цены товаров из категории "Кондитерские изделия", но только не торговой марки "Roshen" 
--Использую другую категорию и марку за отсутствием указанных.
SELECT name, price
FROM Product
WHERE 
	category = 'фрукты' AND producer != 'ГринАгро'

--5. Показать на экран все товары, названия которых начинаются с буквы "К", а категории содержат букву "А"
SELECT name, category
FROM Product
WHERE 
	name LIKE 'К%' AND category LIKE '%А%'
	
--6. Показать на экран все товары, названия которых начинаются с "В" и "Л" включительно
SELECT name
FROM Product
WHERE 
	name LIKE '[В-Л]%'

--7. Показать все товары, стоимость которых меньше 50 гривен, и дата поставки которых неделю назад от текущей даты
SELECT name, price, date_of_delivery
FROM Product
WHERE 
	price < 50 AND date_of_delivery >= CAST(DATEADD(WEEK, -1, GETDATE()) AS DATE)

--8. Показать все товары категории "Безалкогольные напитки", количество которых более 100
--Использую другую категорию из-за отсутствием указанной.
SELECT name, quantity, category
FROM Product
WHERE 
	category = 'фрукты' AND quantity > 100

--9. Получить информацию о товарах ценой от 100 до 200 гривен, отсортировав цену по росту
SELECT name, price
FROM Product
WHERE 
	price BETWEEN 100 AND 200 
ORDER BY price

--10. Уменьшить цены на товары на 5%
UPDATE Product
SET price = price + (price * 0.05);

SELECT name, price
FROM Product;

--11. Установить дату доставки на все товары, в которых такая информация отсутствует
UPDATE Product
SET date_of_delivery = CAST(GETDATE() AS DATE)
WHERE date_of_delivery IS NULL;

SELECT name, price, date_of_delivery
FROM Product
WHERE date_of_delivery IS NULL

--12. Удалить все товары, количество которых меньше 100, а цена больше 70 гривен
DELETE FROM Product
WHERE quantity < 100 AND price > 70

SELECT * 
FROM Product
WHERE quantity < 100 AND price > 70

--13. Удалить все алкогольные напитки и кондитерские изделия
--Использую другую категорию из-за отсутствием указанных.
DELETE FROM Product
WHERE category = 'Замороженные продукты' OR category = 'Молочная продукция'

--Для проверки что данных нет 
SELECT *
FROM Product
WHERE category = 'Замороженные продукты' OR category = 'Молочная продукция'

--14. Показать на экран все товары, в названии которых содержится РОВНО 3 буквы О (в любых местах названия, не обязательно подряд)
SELECT *
FROM Product
WHERE name LIKE '%О%О%О%'

--15. Удалить все товары, названия которых состоят из 5 букв
DELETE FROM Product
WHERE LEN(name) = 5

SELECT *
FROM Product
WHERE LEN(name) = 5

--16. Удалить все товары, дата доставки которых была более 3 месяцев назад от текущей даты
DELETE FROM Product
WHERE date_of_delivery < CAST(DATEADD(MONTH, -3, GETDATE()) AS DATE)

SELECT * 
FROM Product
WHERE date_of_delivery < CAST(DATEADD(MONTH, -3, GETDATE()) AS DATE)

--17. Показать 5 самых дорогих товаров
SELECT TOP 5 * 
FROM Product
ORDER BY price DESC

--18. Удалить все товары, информация о производителе которых неизвестна, или если скидка на эти товары больше 10%
DELETE FROM Product
WHERE producer IS NULL 
   OR discount > 10

SELECT * 
FROM Product
WHERE producer IS NULL 
	OR discount > 10