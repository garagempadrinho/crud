-- DROP DATABASE Garagem;
CREATE DATABASE Garagem;
USE Garagem;

-- CREATE (Criar tabelas e inserir dados)
CREATE TABLE garagem(
	id_carro INT auto_increment PRIMARY KEY,
    preco DECIMAL(8,2),
    modelo VARCHAR(30)
);

CREATE TABLE clientes(
	id_cliente INT auto_increment PRIMARY KEY,
    nome VARCHAR(30),
    telefone VARCHAR(14),
    id_carro INT,
    FOREIGN KEY (id_carro) REFERENCES garagem(id_carro)
    ON DELETE CASCADE
);

CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    vendedor VARCHAR(30),
    valor_venda DECIMAL(10,2),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
    ON DELETE CASCADE
);

INSERT INTO garagem (preco, modelo) VALUES
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

INSERT INTO clientes (nome, telefone, id_carro) VALUES
	('João Paulo', '(11)98877-1122', 1), 
	('Robert', '(21)97766-3344', 3), 
	('João Victor', '(31)96655-5566', 5),
	('Tiago Dotta', '(41)95544-7788', 7),
	('João Paulo', '(51)94433-9900', 10);
        
INSERT INTO vendas (id_venda, vendedor, valor_venda, id_cliente) VALUES
	(1, 'Rogério Ceni', 45000.00, 1),  
	(2, 'Loco Abreu', 95000.00, 2),   
	(3, 'Guerreiro', 65000.75, 3),  
	(4, 'Neymar Jr', 18000.00, 4),  
	(5, 'Pelé', 52000.00, 5); 

-- READ (Consultar dados)

-- Todas as vendas
SELECT * FROM vendas;

-- Carro comprado por Tiago Dotta
SELECT ve.id_venda, cl.nome AS cliente, ga.modelo AS carro
FROM vendas ve
INNER JOIN clientes cl USING (id_cliente)
INNER JOIN garagem ga USING (id_carro)
WHERE cl.nome = 'Tiago Dotta';

-- UPDATE (atualizar dados)

-- Alterar preço de um carro
UPDATE garagem
SET preco = 42000.00
WHERE id_carro = 1;

-- Alterar valor de compra
UPDATE vendas
SET valor_venda = 90000.00
WHERE id_cliente = 2;

-- DELETE (excluir dados)

-- Excluir uma compra
DELETE FROM vendas
WHERE id_venda = 3;

-- Excluir cliente (vai falhar se houver compras associadas, a menos que tenha ON DELETE CASCADE)
DELETE FROM clientes
WHERE id_cliente = 2;



