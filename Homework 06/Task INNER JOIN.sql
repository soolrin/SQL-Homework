--1. Показать названия и категории товаров, поставщиками которых являются ООО "Паньки" или ООО "Какие люди".
SELECT 
	Product.name AS [Название продукта], 
	Category.name AS [Категория]
FROM Product 
	JOIN Category ON Product.id_category = Category.id
	JOIN Delivery ON Delivery.id_product = Product.id
	JOIN Supplier ON Delivery.id_supplier = Supplier.id
WHERE Supplier.name = 'Бусік Пандори' OR Supplier.name = 'Смачний Стіл Знову'

--2. Выбрать все товары с указанием их поставщика, имя изготовителя которых не содержит букв [АКМ], и категория которых не "Крупы".
SELECT 
	Product.name AS [Название продукта],
	Category.name AS [Категория],
	Supplier.name AS [Поставщик],
	Producer.name AS [Производитель]
FROM Product 
	JOIN Producer ON Product.id_producer = producer.id
	JOIN Category ON Product.id_category = Category.id
	JOIN Delivery ON Delivery.id_product = Product.id
	JOIN Supplier ON Delivery.id_supplier = Supplier.id
WHERE 
	Producer.name NOT LIKE '%[АКМ]%' AND Category.name != 'Крупи'

--3. Показать наименования и категории товаров с указанием поставщика и страны производителя. Условие: страна производителя не Украина,
--не Молдова и не Польша, цена поставки меньше 50 гривен, а дата поставки с 10.02.2025 и по сей день.
SELECT 
	Product.name AS [Название продукта],
	Category.name AS [Категория],
	Supplier.name AS [Поставщик],
	Country.name AS [Страна производителя]
FROM Product 
	JOIN Producer ON Product.id_producer = producer.id
	JOIN Category ON Product.id_category = Category.id
	JOIN Delivery ON Delivery.id_product = Product.id
	JOIN Supplier ON Delivery.id_supplier = Supplier.id
	JOIN Address ON Producer.id_address = Address.id
	JOIN City ON Address.id_city = City.id
	JOIN Region ON City.id_region = Region.id
	JOIN Country ON Region.id_country = Country.id
WHERE 
	Country.name != 'Україна' AND
	Country.name != 'Молдова' AND
	Country.name != 'Білорусь' AND
    Delivery.price < 50 AND
    Delivery.date_of_delivery >= '2025-02-10'

--4. Показать все кондитерские и безалкогольные товары, которых было продано более 100. Показать информацию о поставщике и производителе.
-- Замена "кондитерские, безалкогольные"
SELECT 
	Product.name AS [Название продукта],
	Category.name AS [Категория],
	Supplier.name AS [Поставщик],
	Producer.name AS [Производитель]
FROM Product
	JOIN Category ON Product.id_category = Category.id
	JOIN Producer ON Product.id_producer = Producer.id
	JOIN Sale ON Sale.id_product = Product.id
	JOIN Delivery ON Delivery.id_product = product.id
	JOIN Supplier ON Delivery.id_supplier = Supplier.id
WHERE 
	(Category.name = 'Фрукти' OR Category.name = 'Напої')
	AND Sale.quantity > 100
	
--5. Запрос на выборку информации о поставке товаров в таком виде: название товара и его поставщика,
--- категории, дата поставки и общая стоимость поставляемых товаров. Условие: только три поставщика.
--- отсортировать названия товаров по алфавиту.
SELECT TOP 3
    Product.name AS [Название продукта],
    Supplier.name AS [Поставщик],
    Category.name AS [Категория],
    Delivery.date_of_delivery AS [Дата поставки],
    Delivery.price * Delivery.quantity AS [Общая стоимость]
FROM Delivery
    JOIN Product ON Delivery.id_product = Product.id
    JOIN Supplier ON Delivery.id_supplier = Supplier.id
    JOIN Category ON Product.id_category = Category.id
ORDER BY 
    Product.name
	
--6. Запрос на выборку о продаже товаров в таком виде: название товара и его производителя, полный адрес (страна, город, улица)
--производителя в одной ячейке, категории, дата продаж и общая стоимость продаж. Условие: выведенная информация не должна касаться
---двух указанных в запросе производителей. Отсортировать общую стоимость продаж по убыванию.
SELECT 
    Product.name AS [Название продукта],
    Producer.name AS [Производитель],
    Country.name + ', ' + City.name + ', ' + Address.street AS [Адрес производителя],
    Category.name AS [Категория],
    Sale.date_of_sale AS [Дата продажи],
    Sale.price * Sale.quantity AS [Общая стоимость продажи]
FROM Product
    JOIN Producer ON Product.id_producer = Producer.id
    JOIN Address ON Producer.id_address = Address.id
    JOIN Sale ON Sale.id_product = Product.id
    JOIN City ON Address.id_city = City.id
    JOIN Region ON City.id_region = Region.id
    JOIN Country ON Region.id_country = Country.id
    JOIN Category ON Product.id_category = Category.id
WHERE 
    Producer.name != 'Моя Ферма' AND 
	Producer.name != 'Паста-Фабрік'
ORDER BY 
    Sale.price * Sale.quantity DESC
