SET SQL_SAFE_UPDATES = 0;
DROP DATABASE IF EXISTS atividade3;
CREATE DATABASE atividade3;
USE atividade3;

/* CRIAÇÃO DA TABELA 1 */
CREATE TABLE cliente (
	idCliente INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

/* INSERÇÃO DE DADOS DA TABELA 1 */
INSERT INTO cliente (nome, endereco, telefone) VALUES
('Maria Silva', 'Rua das Flores 123', '(11) 98765-4321'),
('João Santos', 'Avenida Paulista 1000', '(21) 91234-5678'),
('Ana Oliveira', 'Rua do Carmo 45', '(51) 93456-7890'),
('Carlos Souza', 'Rua das Palmeiras 555', '(55) 95678-1234'),
('Mariana Costa', 'Avenida Brasil 200', '(81) 99876-5432');

/* CRIAÇÃO DA TABELA 2 */
CREATE TABLE locacao (
	idLocacao INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    idCliente INT, 
    idFilme INT,
    tituloFilme VARCHAR(100),
    devolucao DATE,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

/* INSERÇÃO DE DADOS DA TABELA 2 */
INSERT INTO locacao (tituloFilme, devolucao) VALUES 
('O Poderoso Chefão', '2024-11-01'),
('Interestelar', '2024-11-05'),
('A Origem', '2024-11-08'),
('O Senhor dos Anéis: A Sociedade do Anel', '2024-11-10'),
('Matrix', '2024-11-12');

/* ==================================================================== */

/* CRIE AS NORMALIZAÇÕES LOGO ABAIXO */

                        -- criacao das tabelas Parte 1 
create table endereco( -- criacao de tabelas de acordodo com a Nf1, se um atributo possui varios valores deve ser separado em outra tabela.
id int not null auto_increment,
bairro varchar(100),
idcliente int,
primary key (id)
);

create table telefone(  -- criacao de tabelas de acordodo com a Nf1, se um atributo possui varios valores deve ser separado em outra tabela.
id int  not null auto_increment,
telefone varchar(100),
idcliente int,
primary key (id)
);

                                                -- criacao das fks 
alter table endereco        -- criacao das fks para interligar as tabelas
add constraint fk_idcliente1
foreign key (idcliente) references cliente (idcliente);

alter table telefone        -- criacao das fks para interligar as tabelas
add constraint fk_idcliente2
foreign key (idcliente) references cliente (idcliente);
 
                                  -- incerindo dados  
insert into endereco 
(bairro,idcliente)
value
('Rua das Flores 123', '1'),
('Avenida Paulista 1000', '2'),
('Rua do Carmo 45', '3'),
('Rua das Palmeiras 555', '4'),
('Avenida Brasil 200', '5');

insert into telefone 
(telefone,idcliente)
values
('(11) 98765-4321', '1'),
('(21) 91234-5678','2'),
('(51) 93456-7890', '3'),
('(55) 95678-1234', '4'),
('(81) 99876-5432', '5');

                              -- Deletes 
alter table cliente -- dados apagados para nao criar duplicidade 
drop column endereco;

alter table cliente -- dados apagados para nao criar duplicidade 
drop column telefone;

				             -- Criacao de tabelas parte 2 
                            -- criacao de tabelas de acordodo com a Nf1 e Nf2 , se um atributo possui varios valores deve ser separado em outra tabela e  
							-- Que todos os atributos dependam integralmente da chave primaria e eliminando dependencias parciais.  

create table filme(    
idfilme int not null auto_increment, 
titulofilme varchar(100),
primary key (idfilme)
);                                 

						-- incerindo dados 
 insert into filme
 (titulofilme)
 value
 ('O Poderoso Chefão'),
 ('Interestelar'),
 ('A Origem'),
 ('O Senhor dos Anéis: A Sociedade do Anel'),
 ('Matrix');
 
						-- Deletes
alter table locacao    -- dados apagados para nao criar duplicidade
drop column titulofilme; 

                         -- fks 
alter table locacao  -- criacao das fks para interligar as tabelas
add constraint fk_titulofilme
foreign key (idfilme) references filme (idfilme);
                         
                         -- Area de consultas 
    show tables;
    
    select * from cliente;
    select * from endereco;
    select * from locacao;
    select * from telefone;
    select * from filme;
    

    select cliente.nome, telefone.telefone
    from cliente join telefone 
    on cliente.idcliente = telefone.idcliente;
    
    
    
    
    
    