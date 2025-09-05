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
	ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    valor_venda DECIMAL(10,2),
	desconto DECIMAL(10,2),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
	ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO garagem (id_carro, preco, modelo) VALUES
	(1, 45000.00, 'Fiat Uno'),
	(2, 78000.50, 'Chevrolet Onix'),
	(3, 95000.00, 'Toyota Corolla'),
	(4, 35000.00, 'Volkswagen Gol'),
	(5, 65000.75, 'Toyota Etyos'),
	(6, 82000.00, 'Hyundai HB20'),
	(7, 18000.00, 'Peugoet 206'),
	(8, 26000.00, 'Fiat Palio'),
	(9, 41000.00, 'Ford Fiesta'),
	(10, 52000.00, 'Fiat Strada');

INSERT INTO clientes (id_cliente, nome, telefone, id_carro) VALUES
	(1, 'João Paulo', '(11)98877-1122', 1), 
	(2, 'Robert', '(21)97766-3344', 3), 
	(3, 'João Victor', '(31)96655-5566', 5),
	(4, 'Tiago Dotta', '(41)95544-7788', 7),
	(5, 'Vitor Sanchez', '(51)98461-0508', 9),
	(6, 'Guilherme Rodrigues', '(61)98461-0508', 10),
	(7, 'Jorge Fonseca', '(63)97263-4829', 6);
        
INSERT INTO vendas (id_venda, valor_venda, desconto, id_cliente) VALUES
	(1, 41000.00, 4000.00, 1),  
	(2, 88000.00, 7000.00, 2),   
	(3, 58500.00, 6500.00, 3),  
	(4, 16500.00, 1500.00, 4),  
	(5, 36000.00, 5000.00, 5),
	(6, 47000.00, 5000.00, 6),
	(7, 74000.00, 8000.00, 7);

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
WHERE id_cliente = 7;
