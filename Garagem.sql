CREATE TABLE `carros` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `preco` decimal(8,2),
  `modelo` varchar(30)
);

CREATE TABLE `compra` (
  `id_compra` integer PRIMARY KEY AUTO_INCREMENT,
  `data_venda` varchar(10),
  `valor_venda` decimal(8,2),
  `id_cliente` integer,
  `id_carro` integer
);

CREATE TABLE `clientes` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(30),
  `telefone` varchar(14)
);

ALTER TABLE `carros` ADD FOREIGN KEY (`id`) REFERENCES `compra` (`id_carro`);

ALTER TABLE `compra` ADD FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);
