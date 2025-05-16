--1. Показать названия товаров и их производителей, а также производителей, у которых нет товаров.
SELECT 
	Product.name AS [Название продукта],
	Producer.name AS [Производитель]
FROM 
	Product	RIGHT JOIN Producer ON Product.id_producer = Producer.id
	
--2. Показать только те категории, к которым не входит ни один товар.
SELECT 
	Category.name AS [Категория без товаров]
FROM
	Product RIGHT JOIN Category ON Product.id_category = Category.id
WHERE
	Product.id IS NULL

--3. Показать названия товаров, даты их поставки и поставщиков, в том числе ничего не успевших поставить поставщиков.
SELECT 
	Product.name AS [Название продукта],
	Delivery.date_of_delivery AS [Дата поставки],
	Supplier.name AS [Поставщик]
FROM
	Product JOIN Delivery ON Delivery.id_product = Product.id
	RIGHT JOIN Supplier ON Delivery.id_supplier = Supplier.id

--4. Показать области (регионы), в которых нет ни одного производителя (EXCEPT).
SELECT 
	name AS [Области без производителя]
FROM 
	Region 
EXCEPT
SELECT DISTINCT
	Region.name
FROM Producer 
	JOIN Address ON Producer.id_address = Address.id
	JOIN City ON Address.id_city = City.id
	JOIN Region ON City.id_region = Region.id

--5. Показать названия категорий, в которых нет товаров фирмы ООО «Нли Ю» (EXCEPT).
--Замена ООО «Нли Ю» из-за отсутствия 
SELECT 
	name AS [Категория]
FROM Category
EXCEPT
SELECT DISTINCT
	Category.name
FROM Product
	JOIN Category ON Product.id_category = Category.id
	JOIN Producer ON Product.id_producer = Producer.id
WHERE 
	Producer.name = 'Coca-Cola Company'

--6. Показать производителей, не выпускающих продукты молочной категории (EXCEPT).
SELECT 
	name AS [Производитель]
FROM
	Producer
EXCEPT
SELECT DISTINCT
	Producer.name
FROM Product
	JOIN Producer ON Product.id_producer = Producer.id
	JOIN Category ON Product.id_category = Category.id
WHERE
	Category.name = 'Молочна продукція'
