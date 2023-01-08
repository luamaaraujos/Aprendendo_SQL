/* A partir daqui alguns processos mais complexos começam a ser trabalhados, como o relacionamento entre tabelas via SQL 
Trabalhando um pouco a parte de DML 
Importante lembrar que muitas etapas aqui foram mais para aprendizado e fixação do que para montagem do banco em si*/

CREATE DATABASE COMERCIO;

USE COMERCIO;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT, 
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,

	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT, 
	TIPO ENUM('RES','COM','CEL') NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT,

	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);
INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAOA@IG.COM','76567587887');
INSERT INTO CLIENTE VALUES(NULL,'CARLOS','M','CARLOSA@IG.COM','5464553466');
INSERT INTO CLIENTE VALUES(NULL,'ANA','F','ANA@IG.COM','456545678');
INSERT INTO CLIENTE VALUES(NULL,'CLARA','F',NULL,'5687766856');
INSERT INTO CLIENTE VALUES(NULL,'JORGE','M','JORGE@IG.COM','8756547688');
INSERT INTO CLIENTE VALUES(NULL,'CELIA','M','JCELIA@IG.COM','5767876889');


DESC ENDERECO;

INSERT INTO ENDERECO VALUES(NULL,'RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',4);
INSERT INTO ENDERECO VALUES(NULL,'RUA CAPITAO HERMES','CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO VALUES(NULL,'RUA PRES VARGAS','JARDINS','SAO PAULO','SP',3);
INSERT INTO ENDERECO VALUES(NULL,'RUA ALFANDEGA','ESTACIO','RIO DE JANEIRO','RJ',2);
INSERT INTO ENDERECO VALUES(NULL,'RUA DO OUVIDOR','FLAMENGO','RIO DE JANEIRO','RJ',6);
INSERT INTO ENDERECO VALUES(NULL,'RUA URUGUAIANA','CENTRO','VITORIA','ES',5);
INSERT INTO ENDERECO VALUES(NULL,'RUA ALFANDEGA','CENTRO','SAO PAULO','SP',5);
INSERT INTO ENDERECO VALUES(NULL,'RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',15);


DESC TELEFONE;

INSERT INTO TELEFONE VALUES(NULL,'CEL','78458743',5);
INSERT INTO TELEFONE VALUES(NULL,'RES','56576876',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','87866896',1);
INSERT INTO TELEFONE VALUES(NULL,'COM','54768899',2);
INSERT INTO TELEFONE VALUES(NULL,'RES','99667587',1);
INSERT INTO TELEFONE VALUES(NULL,'CEL','78989765',3);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99766676',3);
INSERT INTO TELEFONE VALUES(NULL,'COM','66687899',1);
INSERT INTO TELEFONE VALUES(NULL,'RES','89986668',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88687909',2);

--Adicionando alguns campos
INSERT INTO CLIENTE VALUES(NULL,'PAULA','M',NULL,'77437493');
INSERT INTO ENDERECO VALUES(NULL,'RUA JOAQUIM SILVA','ALVORADA','NITEROI','RJ',7);

/* FILTROS */
SELECT * FROM CLIENTE
WHERE SEXO = 'M';

/* UPDATE */
SELECT * FROM CLIENTE
WHERE IDCLIENTE = 7;

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 7;

/* DELETE */ 
INSERT INTO CLIENTE VALUES(NULL,'XXX','M',NULL,'XXX');

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 8;

DELETE FROM CLIENTE WHERE IDCLIENTE = 8;

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME_PRODUTO VARCHAR(30) NOT NULL,
	PRECO INT,
	FRETE FLOAT(10,2) NOT NULL
);

/* ALTER TABLE */
/* ALTERANDO O NOME DE UMA COLUNA - CHANGE */
ALTER TABLE PRODUTO
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;
DESC PRODUTO;

ALTER TABLE PRODUTO
CHANGE VALOR_UNITARIO VALOR_UNITARIO INT;
DESC PRODUTO;

/* MODIFY - ALTERANDO O TIPO */

ALTER TABLE PRODUTO
MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL;

/* ADICIONANDO COLUNAS */

ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL;

/* APAGANDO UMA COLUNA */

ALTER TABLE PRODUTO
DROP COLUMN PESO;

/* ADICIONANDO UMA COLUNA NA ORDEM ESPECIFICA */

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
AFTER NOME_PRODUTO;

ALTER TABLE PRODUTO
DROP COLUMN PESO;

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
FIRST;

/* EXERCICIOS DML */

INSERT INTO CLIENTE VALUES(NULL,'FLAVIO','M','FLAVIO@IG.COM','4657765');
INSERT INTO CLIENTE VALUES(NULL,'ANDRE','M','ANDRE@GLOBO.COM','7687567');
INSERT INTO CLIENTE VALUES(NULL,'GIOVANA','F',NULL,'0876655');
INSERT INTO CLIENTE VALUES(NULL,'KARLA','M','KARLA@GMAIL.COM','545676778');
INSERT INTO CLIENTE VALUES(NULL,'DANIELE','M','DANIELE@GMAIL.COM','43536789');
INSERT INTO CLIENTE VALUES(NULL,'LORENA','M',NULL,'774557887');
INSERT INTO CLIENTE VALUES(NULL,'EDUARDO','M',NULL,'54376457');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','F','ANTONIO@IG.COM','12436767');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','M','ANTONIO@UOL.COM','3423565');
INSERT INTO CLIENTE VALUES(NULL,'ELAINE','M','ELAINE@GLOBO.COM','32567763');
INSERT INTO CLIENTE VALUES(NULL,'CARMEM','M','CARMEM@IG.COM','787832213');
INSERT INTO CLIENTE VALUES(NULL,'ADRIANA','F','ADRIANA@GMAIL.COM','88556942');
INSERT INTO CLIENTE VALUES(NULL,'JOICE','F','JOICE@GMAIL.COM','55412256');

/* CADASTRE UM ENDERECO PARA CADA CLIENTE */

INSERT INTO ENDERECO VALUES(NULL,'RUA GUEDES','CASCADURA','B. HORIZONTE','MG',9);
INSERT INTO ENDERECO VALUES(NULL,'RUA MAIA LACERDA','ESTACIO','RIO DE JANEIRO','RJ',10);
INSERT INTO ENDERECO VALUES(NULL,'RUA VISCONDESSA','CENTRO','RIO DE JANEIRO','RJ',11);
INSERT INTO ENDERECO VALUES(NULL,'RUA NELSON MANDELA','COPACABANA','RIO DE JANEIRO','RJ',12);
INSERT INTO ENDERECO VALUES(NULL,'RUA ARAUJO LIMA','CENTRO','VITORIA','ES',13);
INSERT INTO ENDERECO VALUES(NULL,'RUA CASTRO ALVES','LEBLON','RIO DE JANEIRO','RJ',14);
INSERT INTO ENDERECO VALUES(NULL,'AV CAPITAO ANTUNES','CENTRO','CURITIBA','PR',15);
INSERT INTO ENDERECO VALUES(NULL,'AV CARLOS BARROSO','JARDINS','SAO PAULO','SP',16);
INSERT INTO ENDERECO VALUES(NULL,'ALAMEDA SAMPAIO','BOM RETIRO','CURITIBA','PR',17);
INSERT INTO ENDERECO VALUES(NULL,'RUA DA LAPA','LAPA','SAO PAULO','SP',18);
INSERT INTO ENDERECO VALUES(NULL,'RUA GERONIMO','CENTRO','RIO DE JANEIRO','RJ',19);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',20);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',21);

/* CADASTRE TELEFONES PARA OS CLIENTES */


INSERT INTO TELEFONE VALUES(NULL,'RES','68976565',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99656675',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','33567765',11);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88668786',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','55689654',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','88687979',12);
INSERT INTO TELEFONE VALUES(NULL,'COM','88965676',13);
INSERT INTO TELEFONE VALUES(NULL,'CEL','89966809',15);
INSERT INTO TELEFONE VALUES(NULL,'COM','88679978',16);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99655768',17);
INSERT INTO TELEFONE VALUES(NULL,'RES','89955665',18);
INSERT INTO TELEFONE VALUES(NULL,'RES','77455786',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','89766554',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','77755785',20);
INSERT INTO TELEFONE VALUES(NULL,'COM','44522578',20);

/* Uma vez banco de dados e relacionamentos criados entre as tabelas, agora é a hora de fazer as análises propriamente ditas */ 
/* RELATORIO GERAL DE TODOS OS CLIENTES */
/* 1. RELATORIO GERAL DE TODOS OS CLIENTES (TELEFONE E ENDERECO) */
--Apenas para nível de conheecimento da tabela, é feita a descrição das tabelas. 
DESC CLIENTE;
+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int(11)       | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| SEXO      | enum('M','F') | NO   |     | NULL    |                |
| EMAIL     | varchar(50)   | YES  | UNI | NULL    |                |
| CPF       | varchar(15)   | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+

DESC ENDERECO;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| IDENDERECO | int(11)     | NO   | PRI | NULL    | auto_increment |
| RUA        | varchar(30) | NO   |     | NULL    |                |
| BAIRRO     | varchar(30) | NO   |     | NULL    |                |
| CIDADE     | varchar(30) | NO   |     | NULL    |                |
| ESTADO     | char(2)     | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)     | YES  | UNI | NULL    |                |
+------------+-------------+------+-----+---------+----------------+

DESC TELEFONE;
mysql> DESC TELEFONE;
+------------+-------------------------+------+-----+---------+----------------+
| Field      | Type                    | Null | Key | Default | Extra          |
+------------+-------------------------+------+-----+---------+----------------+
| IDTELEFONE | int(11)                 | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RES','COM','CEL') | NO   |     | NULL    |                |
| NUMERO     | varchar(10)             | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)                 | YES  | MUL | NULL    |                |
+------------+-------------------------+------+-----+---------+----------------+

--Aqui é retornado o que foi solicitado na questão
SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, 
	   E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, 
	   T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;
---+----------+
| IDCLIENTE | NOME   | SEXO | EMAIL          | CPF         | RUA                | BAIRRO  | CIDADE         | ESTADO | TIPO | NUMERO   |
+-----------+--------+------+----------------+-------------+--------------------+---------+----------------+--------+------+----------+
|         5 | JORGE  | M    | JORGE@IG.COM   | 8756547688  | RUA URUGUAIANA     | CENTRO  | VITORIA        | ES     | CEL  | 78458743 |
|         5 | JORGE  | M    | JORGE@IG.COM   | 8756547688  | RUA URUGUAIANA     | CENTRO  | VITORIA        | ES     | RES  | 56576876 |
|         1 | JOAO   | M    | JOAOA@IG.COM   | 76567587887 | RUA CAPITAO HERMES | CENTRO  | RIO DE JANEIRO | RJ     | CEL  | 87866896 |
|         2 | CARLOS | M    | CARLOSA@IG.COM | 5464553466  | RUA ALFANDEGA      | ESTACIO | RIO DE JANEIRO | RJ     | COM  | 54768899 |
|         1 | JOAO   | M    | JOAOA@IG.COM   | 76567587887 | RUA CAPITAO HERMES | CENTRO  | RIO DE JANEIRO | RJ     | RES  | 99667587 |
|         3 | ANA    | F    | ANA@IG.COM     | 456545678   | RUA PRES VARGAS    | JARDINS | SAO PAULO      | SP     | CEL  | 78989765 |
|         3 | ANA    | F    | ANA@IG.COM     | 456545678   | RUA PRES VARGAS    | JARDINS | SAO PAULO      | SP     | CEL  | 99766676 |
|         1 | JOAO   | M    | JOAOA@IG.COM   | 76567587887 | RUA CAPITAO HERMES | CENTRO  | RIO DE JANEIRO | RJ     | COM  | 66687899 |
|         5 | JORGE  | M    | JORGE@IG.COM   | 8756547688  | RUA URUGUAIANA     | CENTRO  | VITORIA        | ES     | RES  | 89986668 |
|         2 | CARLOS | M    | CARLOSA@IG.COM | 5464553466  | RUA ALFANDEGA      | ESTACIO | RIO DE JANEIRO | RJ     | CEL  | 88687909 |
+-----------+--------+------+----------------+-------------+--------------------+---------+----------------+--------+------+----------+

/* 2. RELATORIO DE HOMENS */
SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, 
	   E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, 
	   T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'M';
+-----------+--------+------+----------------+-------------+--------------------+---------+----------------+--------+------+----------+
| IDCLIENTE | NOME   | SEXO | EMAIL          | CPF         | RUA                | BAIRRO  | CIDADE         | ESTADO | TIPO | NUMERO   |
+-----------+--------+------+----------------+-------------+--------------------+---------+----------------+--------+------+----------+
|         5 | JORGE  | M    | JORGE@IG.COM   | 8756547688  | RUA URUGUAIANA     | CENTRO  | VITORIA        | ES     | CEL  | 78458743 |
|         5 | JORGE  | M    | JORGE@IG.COM   | 8756547688  | RUA URUGUAIANA     | CENTRO  | VITORIA        | ES     | RES  | 56576876 |
|         1 | JOAO   | M    | JOAOA@IG.COM   | 76567587887 | RUA CAPITAO HERMES | CENTRO  | RIO DE JANEIRO | RJ     | CEL  | 87866896 |
|         2 | CARLOS | M    | CARLOSA@IG.COM | 5464553466  | RUA ALFANDEGA      | ESTACIO | RIO DE JANEIRO | RJ     | COM  | 54768899 |
|         1 | JOAO   | M    | JOAOA@IG.COM   | 76567587887 | RUA CAPITAO HERMES | CENTRO  | RIO DE JANEIRO | RJ     | RES  | 99667587 |
|         1 | JOAO   | M    | JOAOA@IG.COM   | 76567587887 | RUA CAPITAO HERMES | CENTRO  | RIO DE JANEIRO | RJ     | COM  | 66687899 |
|         5 | JORGE  | M    | JORGE@IG.COM   | 8756547688  | RUA URUGUAIANA     | CENTRO  | VITORIA        | ES     | RES  | 89986668 |
|         2 | CARLOS | M    | CARLOSA@IG.COM | 5464553466  | RUA ALFANDEGA      | ESTACIO | RIO DE JANEIRO | RJ     | CEL  | 88687909 |
+-----------+--------+------+----------------+-------------+--------------------+---------+----------------+--------+------+----------+

/* 3. RELATORIO DE MULHERES */
SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, 
	   E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, 
	   T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F';
+-----------+------+------+------------+-----------+-----------------+---------+-----------+--------+------+----------+
| IDCLIENTE | NOME | SEXO | EMAIL      | CPF       | RUA             | BAIRRO  | CIDADE    | ESTADO | TIPO | NUMERO   |
+-----------+------+------+------------+-----------+-----------------+---------+-----------+--------+------+----------+
|         3 | ANA  | F    | ANA@IG.COM | 456545678 | RUA PRES VARGAS | JARDINS | SAO PAULO | SP     | CEL  | 78989765 |
|         3 | ANA  | F    | ANA@IG.COM | 456545678 | RUA PRES VARGAS | JARDINS | SAO PAULO | SP     | CEL  | 99766676 |
+-----------+------+------+------------+-----------+-----------------+---------+-----------+--------+------+----------+

/* 4. QUANTIDADE DE HOMENS E MULHERES */
SELECT COUNT(*) AS QUANTIDADE, SEXO
FROM CLIENTE
GROUP BY SEXO;
+------------+------+
| QUANTIDADE | SEXO |
+------------+------+
|          5 | M    |
|          2 | F    |
+------------+------+

/* 5. IDS E EMAIL DAS MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO E 
NAO TENHAM CELULAR */
SELECT C.IDCLIENTE, C.EMAIL, C.NOME, C.SEXO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F'
AND BAIRRO = 'CENTRO' AND CIDADE = 'RIO DE JANEIRO';

/* 6. nome, email, numero, estado */
SELECT C.NOME, C.EMAIL, E.ESTADO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;
+--------+----------------+--------+----------+
| NOME   | EMAIL          | ESTADO | NUMERO   |
+--------+----------------+--------+----------+
| JORGE  | JORGE@IG.COM   | ES     | 78458743 |
| JORGE  | JORGE@IG.COM   | ES     | 56576876 |
| JOAO   | JOAOA@IG.COM   | RJ     | 87866896 |
| CARLOS | CARLOSA@IG.COM | RJ     | 54768899 |
| JOAO   | JOAOA@IG.COM   | RJ     | 99667587 |
| ANA    | ANA@IG.COM     | SP     | 78989765 |
| ANA    | ANA@IG.COM     | SP     | 99766676 |
| JOAO   | JOAOA@IG.COM   | RJ     | 66687899 |
| JORGE  | JORGE@IG.COM   | ES     | 89986668 |
| CARLOS | CARLOSA@IG.COM | RJ     | 88687909 |
+--------+----------------+--------+----------+

/* 7. PARA UMA CAMPANHA DE MARKETING, O SETOR SOLICITOU UM RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR 
DOS CLIENTES QUE MORAM NO ESTADO DO RIO DE JANEIRO. VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA
O PROGRAMADOR */
SELECT   C.NOME, C.EMAIL, T.NUMERO AS CELULAR 
FROM CLIENTE C 
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE 
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE 
WHERE TIPO = 'CEL' AND ESTADO = 'RJ'; 
+--------+----------------+----------+
| NOME   | EMAIL          | CELULAR  |
+--------+----------------+----------+
| JOAO   | JOAOA@IG.COM   | 87866896 |
| CARLOS | CARLOSA@IG.COM | 88687909 |
+--------+----------------+----------+

/* 8. PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR 
 DAS MULHERES QUE MORAM NO ESTADO DE SÃO PAULO. VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA O PROGRAMADOR */
SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F'
AND ESTADO = 'SP';
+------+------------+----------+
| NOME | EMAIL      | CELULAR  |
+------+------------+----------+
| ANA  | ANA@IG.COM | 78989765 |
| ANA  | ANA@IG.COM | 99766676 |
+------+------------+----------+

SELECT  C.NOME, 
		IFNULL(C.EMAIL,'************'), 
		E.ESTADO, 
		T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

+---------+--------------------------------+--------+----------+
| NOME    | IFNULL(C.EMAIL,'************') | ESTADO | NUMERO   |
+---------+--------------------------------+--------+----------+
| JORGE   | JORGE@IG.COM                   | ES     | 78458743 |
| JORGE   | JORGE@IG.COM                   | ES     | 56576876 |
| JOAO    | JOAOA@IG.COM                   | RJ     | 87866896 |
| CARLOS  | CARLOSA@IG.COM                 | RJ     | 54768899 |
| JOAO    | JOAOA@IG.COM                   | RJ     | 99667587 |
| ANA     | ANA@IG.COM                     | SP     | 78989765 |
| ANA     | ANA@IG.COM                     | SP     | 99766676 |
| JOAO    | JOAOA@IG.COM                   | RJ     | 66687899 |
| JORGE   | JORGE@IG.COM                   | ES     | 89986668 |
| CARLOS  | CARLOSA@IG.COM                 | RJ     | 88687909 |
| FLAVIO  | FLAVIO@IG.COM                  | MG     | 68976565 |
| FLAVIO  | FLAVIO@IG.COM                  | MG     | 99656675 |
| GIOVANA | ************                   | RJ     | 33567765 |
| GIOVANA | ************                   | RJ     | 88668786 |
| GIOVANA | ************                   | RJ     | 55689654 |
| KARLA   | KARLA@GMAIL.COM                | RJ     | 88687979 |
| DANIELE | DANIELE@GMAIL.COM              | ES     | 88965676 |
| EDUARDO | ************                   | PR     | 89966809 |
| ANTONIO | ANTONIO@IG.COM                 | SP     | 88679978 |
| ANTONIO | ANTONIO@UOL.COM                | PR     | 99655768 |
| ELAINE  | ELAINE@GLOBO.COM               | SP     | 89955665 |
| CARMEM  | CARMEM@IG.COM                  | RJ     | 77455786 |
| CARMEM  | CARMEM@IG.COM                  | RJ     | 89766554 |
| ADRIANA | ADRIANA@GMAIL.COM              | RJ     | 77755785 |
| ADRIANA | ADRIANA@GMAIL.COM              | RJ     | 44522578 |
| JOICE   | JOICE@GMAIL.COM                | RJ     | 44522578 |
+---------+--------------------------------+--------+----------+

