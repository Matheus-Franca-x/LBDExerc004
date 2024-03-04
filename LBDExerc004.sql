CREATE DATABASE LBDExerc004
GO
USE LBDExerc004
GO
CREATE TABLE produto
(
	codigo		INT 			NOT NULL,
	nome		VARCHAR(30) 	NOT NULL,
	valor		DECIMAL(7,2) 	NOT NULL,
	vencimento	DATE			NOT NULL
	PRIMARY KEY (codigo)
)

DECLARE @num1	INT,
		@num2	INT,
		@res	INT
SET	@num1 = 10
SET @num2 = 20
SET @res = @num1 * @num2
PRINT @res

--1) Fazer em SQL Server os seguintes algoritmos:
--a) Dado um número inteiro. Calcule e mostre o seu fatorial. (Não usar entrada superior a 12)
DECLARE @fat INT,
		@result INT
SET @fat = 5
SET @result = 1
WHILE (@fat > 0)
BEGIN
	SET @result = @result * @fat
	SET @fat = @fat - 1
END
PRINT @result


--b) Dados A, B, e C de uma equação do 2o grau da fórmula AX2+BX+C=0. Verifique e mostre a
--existência de raízes reais e se caso exista, calcule e mostre. Caso não existam, exibir mensagem.

DECLARE @a INT,
		@b INT,
		@c INT,
		@x1 DECIMAL(7, 2),
		@x2 DECIMAL(7, 2),
		@d DECIMAL(7,2)
SET @a = 2
SET @b = 3
SET @c = 5
SET @d = @b*@b - 4 * @a * @c
IF (@d > 0)
BEGIN 
	SET @x1 = (-@b + SQRT(@d)) / 2 * @a
	SET @x2 = (-@b - SQRT(@d)) / 2 * @a
	PRINT @x1
	PRINT @x2
END
ELSE
BEGIN
	PRINT 'Delta menor que zero!'
END


--c) Calcule e mostre quantos anos serão necessários para que Ana seja maior que Maria sabendo
--que Ana tem 1,10 m e cresce 3 cm ao ano e Maria tem 1,5 m e cresce 2 cm ao ano.
DECLARE @ana DECIMAL(7, 2),
		@maria DECIMAL(7, 2),
		@ano INT
SET @ana = 1.10
SET @maria = 1.5
SET @ano = 0
WHILE (@ana < @maria)
BEGIN 
	SET @ana = @ana + 0.03
	SET @maria = @maria + 0.02
	SET @ano = @ano + 1
END
PRINT @ana
PRINT @maria
PRINT @ano


--d) Seja a seguinte série: 1, 4, 4, 2, 5, 5, 3, 6, 6, 4, 7, 7, ...
--Escreva uma aplicação que a escreva N termos

DECLARE @var1 INT,
		@var2 INT,
		@cont INT
SET @var1 = 1
SET @var2 = 4
SET @cont = 0
WHILE (@cont < 5)
BEGIN 
	PRINT @var1
	PRINT @var2
	PRINT @var2
	SET @var1 = @var1 + 1
	SET @var2 = @var2 + 1
	SET @cont = @cont + 1
END


--e) Considerando a tabela abaixo, gere uma massa de dados, com 50 registros, para fins de teste
--com as regras estabelecidas (Não usar constraints na criação da tabela)

--Codigo    Nome        Valor       Vencimento
--INT (PK) VARCHAR(30) DECIMAL(7,2) DATE

--• Código inicia em 50001 e incrementa de 1 em 1
--• Nome segue padrão simples: Produto 1, Produto 2, Produto 3, etc.
--• Valor, gerar um número aleatório* entre 10.00 e 100.00
--• Vencimento, gerar um número aleatório* entre 3 e 7 e usando a função específica para
--soma de datas no SQL Server, somar o valor gerado à data de hoje.
--
--* Função RAND() gera números aleatórios entre 0 e 0,9999...

DECLARE @codigo INT,
		@nome VARCHAR(30),
		@valor DECIMAL(7, 2),
		@venc DATE,
		@pvalor INT,
		@cont1 INT
SET @codigo = 50001
SET @nome = 'Produto'
SET @venc = GETDATE()
SET @pvalor = 1
SET @cont1 = 1
WHILE (@cont1 <= 50)
BEGIN 
	INSERT INTO produto VALUES 
	(@codigo, @nome + ' ' + CAST(@cont1 AS VARCHAR), CAST(RAND() * 91 + 10 AS INT), @venc)
	SET @venc = DATEADD(DAY, CAST(RAND() * 4 + 3 AS INT), GETDATE())
	SET @codigo = @codigo + 1
	SET @cont1 = @cont1 + 1
END

SELECT * FROM produto






