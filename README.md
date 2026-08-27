# 🎬 Locadora

Projeto desenvolvido para praticar conceitos de **MySQL, modelagem e normalização de bancos de dados relacionais**.

O projeto simula um sistema simples de **locação de filmes**, contendo informações sobre clientes, filmes, locações, endereços e telefones.

## 🎯 Objetivo

Aplicar na prática conceitos de **normalização de banco de dados**, utilizando principalmente a **Primeira Forma Normal (1FN)**, **Segunda Forma Normal (2FN)** e **Terceira Forma Normal (3FN)** .

Durante o desenvolvimento foram trabalhados:

* Criação de bancos de dados
* Criação e alteração de tabelas
* Inserção e exclusão de dados
* Chaves primárias
* Chaves estrangeiras
* Relacionamentos entre tabelas
* Normalização de dados
* 1FN e 2FN
* Consultas utilizando `SELECT`
* Consultas utilizando `JOIN`

## 🔗 Relacionamentos

As tabelas são relacionadas por meio de **chaves estrangeiras**, permitindo estabelecer relações entre clientes, telefones, endereços, locações e filmes.

## 📚 Normalização

Durante a atividade, o banco passou por um processo de normalização.

### 1FN — Primeira Forma Normal

Foram separados atributos que representam informações independentes, como:

* Endereço
* Telefone

Essas informações passaram a ser armazenadas em tabelas próprias e relacionadas à tabela `cliente`.

### 2FN — Segunda Forma Normal

A tabela `filme` foi criada para separar as informações dos filmes da tabela `locacao`.

Dessa forma, o título do filme não precisa ser armazenado diretamente em cada registro de locação, utilizando `idFilme` para estabelecer o relacionamento.

### 3FN — Terceira Forma Normal

Na 3FN, o objetivo é eliminar dependências transitivas, garantindo que os atributos de uma tabela dependam diretamente de sua chave primária.

A separação das informações em tabelas relacionadas contribui para uma estrutura mais organizada, reduzindo redundâncias e facilitando a manutenção dos dado

## 🔎 Consulta com JOIN

O projeto também contém consultas utilizando `JOIN`, como a consulta que relaciona clientes e seus respectivos telefones:

```sql
SELECT cliente.nome, telefone.telefone
FROM cliente
JOIN telefone
ON cliente.idcliente = telefone.idcliente;
```
## 📌 Status

🟢 **Concluído — Projeto de estudo**

## 👨‍💻 Autor

**Emerson Barreto dos Santos**

Projeto desenvolvido para fins de **estudo e aprendizado em MySQL e modelagem de bancos de dados relacionais**.

## 📄 Licença

Este projeto está licenciado sob a [MIT License](LICENSE).
