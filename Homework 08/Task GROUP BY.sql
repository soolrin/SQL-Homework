--1. Показать товары, средняя цена продажи которых была больше 500 гривен.

--Решил выполнить и это задание, так как на паре вы показали его решение.
--Но вы, кажется, забыли учесть, что в таблице Sale есть поле quantity - количество проданных товаров.
--Оно влияет на расчёт средней цены и показывает другую картину по количеству продаж.
SELECT 
	Product.name AS [Категория], 
    SUM(Sale.price * Sale.quantity) / SUM(Sale.quantity) AS [Средняя цена], 
    SUM(Sale.quantity) AS [Количество продаж]
FROM Product
	JOIN Sale ON Product.id = Sale.id_product
GROUP BY 
	Product.name
HAVING 
	SUM(Sale.price * Sale.quantity) / SUM(Sale.quantity) > 50

--Это ваш запрос
--SELECT p.name, AVG(s.price), COUNT(s.id_product)
--FROM Product p
--JOIN Sale s ON p.id = s.id_product
--GROUP BY p.name
--HAVING AVG(s.price) > 60

--2. Вывести количество товаров каждой категории, средняя цена которых более 100 гривен.
SELECT 
	Category.name AS [Категория],
	SUM(Product.quantity) AS [Количество товаров]
FROM Product
	JOIN Category ON Product.id_category = Category.id
GROUP BY 
	Category.name
HAVING 
	AVG(Product.price) > 100

----3. Показать категории "Фрукты" и "Конфеты", их товары и общую сумму их продажи.
SELECT
	Product.name AS [Название продукта], 
	Category.name AS [Категория],
	SUM(Sale.price * Sale.quantity) AS [Общая сумма продаж]
FROM Product
	JOIN Category ON Product.id_category = Category.id
	JOIN Sale ON Sale.id_product = Product.id
GROUP BY 
	Category.name, Product.name
HAVING
	Category.name IN ('Солодощі', 'Фрукти')

--4. Показать информацию о производителе, его полном адресе и количестве товаров, которые он выпускает.
--Общая стоимость продаж товаров каждого производителя при этом должна быть от 500 до 2000 гривен.
SELECT  
    Producer.name AS [Производитель], 
    SUM(DISTINCT  Product.quantity) AS [Общее количество товаров],
    SUM(Sale.quantity) AS [Количество проданных товаров],
    'ул.' + Address.street + ', ' 
    + City.name + ', ' 
    + Region.name + ', ' 
    + Country.name AS [Полный адрес производителя]
FROM Producer
    JOIN Address ON Producer.id_address = Address.id
    JOIN City ON Address.id_city = City.id
    JOIN Region ON City.id_region = Region.id
    JOIN Country ON Region.id_country = Country.id
    JOIN Product ON Product.id_producer = Producer.id
    LEFT JOIN Sale ON Sale.id_product = Product.id
GROUP BY 
    Producer.name,Sale.price, Address.street, City.name, Region.name, Country.name
HAVING 
    SUM(Sale.price * Sale.quantity) BETWEEN 500 AND 2000;

--5. Показать категорию товаров, которых в магазине меньше.
SELECT TOP 5
	Category.name AS [Категория],
	SUM(Product.quantity) AS [Количество товаров категории]
FROM Category 
	JOIN Product ON Product.id_category = Category.id
GROUP BY
	Category.name
ORDER BY 2 

--6. Показать количество товаров каждой категории, учитывая только те товары, цена поставки которых превышает 400 гривен.
--Условие: выведенная информация относится только к трем определенным поставщикам.
SELECT 
    Category.name AS [Категория], 
    SUM(Delivery.quantity) AS [Количество товаров],
	Supplier.name AS [Поставщик]
FROM Product
    JOIN Delivery ON Delivery.id_product = Product.id
    JOIN Category ON Product.id_category = Category.id
    JOIN Supplier ON Delivery.id_supplier = Supplier.id
WHERE Delivery.price > 400 
    AND Supplier.name IN ('Смачний Стіл Знову', 'Котигорошко', 'Здоровий Лист')
GROUP BY Category.name, Supplier.name