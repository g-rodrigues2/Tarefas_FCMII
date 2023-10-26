-- SELECT *
-- FROM sales.products

-- Agrupando o maior e o menor preço pela marca
SELECT
    sales.products.brand,
    MAX(price) AS maior_preco,
    MIN(price) AS menor_preco
FROM
    sales.products
GROUP BY
    sales.products.brand;
	



-- Podemos ver apenas a coluna de interesse
-- SELECT
-- 	brand, price
-- 	MAX(price) AS MaiorPreco,
-- 	MIN(price) AS MenorPreco
-- FROM sales.products
-- GROUP BY price;