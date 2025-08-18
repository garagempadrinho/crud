-- DROP DATABASE GaragemPadrinho;
CREATE DATABASE GaragemPadrinho;
USE GaragemPadrinho;

-- CREATE (Criar tabelas e inserir dados)

CREATE TABLE carros(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    preco DECIMAL(8,2),
    modelo VARCHAR(30)
);
CREATE TABLE clientes(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30),
    telefone VARCHAR(14)
);
CREATE TABLE compra (
    id_compra INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    data_venda VARCHAR(10),
    valor_venda DECIMAL(9,2),
	id_cliente INT UNSIGNED,
    id_carro INT UNSIGNED,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_carro) REFERENCES carros(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


INSERT INTO carros (preco, modelo) VALUES
	(45000.00, 'Fiat Uno'),
	(78000.50, 'Chevrolet Onix'),
	(95000.00, 'Toyota Corolla'),
	(35000.00, 'Volkswagen Gol'),
	(65000.75, 'Toyota Etyos'),
	(82000.00, 'Hyundai HB20'),
	(18000.00, 'Peugoet 206'),
	(26000.00, 'Fiat Palio'),
	(41000.00, 'Ford Fiesta'),
	(52000.00, 'Fiat Strada');
    
INSERT INTO clientes (nome, telefone) VALUES
	('João Paulo',    '(11)98877-1122'), 
	('Robert',  '(21)97766-3344'), 
	('João Victor', '(31)96655-5566'),
	('Tiago Dotta',   '(41)95544-7788'),
	('João Paulo', '(51)94433-9900');
    
INSERT INTO compra (data_venda, valor_venda, id_cliente, id_carro) VALUES
('09/07/2025', 45000.00, 1, 1),  
('26/03/2024', 95000.00, 2, 3),   
('12/06/2019', 65000.75, 3, 5),  
('04/10/2021', 18000.00, 4, 7),  
('31/01/2024', 52000.00, 5, 10); 

-- READ (Consultar dados)

-- Todas as vendas
SELECT * FROM compra;

-- Carro comprado por Tiago Dotta
SELECT cl.id,cl.nome AS cliente, co.id_cliente, co.id_carro, ca.id, ca.modelo AS carro
FROM compra co
INNER JOIN clientes cl ON cl.id = co.id_cliente
INNER JOIN carros ca ON ca.id = co.id_carro
WHERE cl.nome = 'Tiago Dotta';

-- UPDATE (atualizar dados)

-- Alterar preço de um carro
UPDATE carros
SET preco = 42000.00
WHERE id = 1;

-- Alterar valor de compra
UPDATE compra
SET valor_venda = 90000.00
WHERE id = 1;

-- DELETE (excluir dados)

-- Excluir uma compra
DELETE FROM vendas
WHERE id = 3;

-- Excluir cliente (vai falhar se houver compras associadas, a menos que tenha ON DELETE CASCADE)
DELETE FROM clientes
WHERE id = 2;



