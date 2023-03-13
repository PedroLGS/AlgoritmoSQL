-- a) Fazer um algoritmo que leia 1 número e mostre se são múltiplos de 2,3,5 ou nenhum deles

DECLARE		@num	INT
SET	@num = 16
IF (@num % 2 = 0 OR @num % 3 = 0 OR @num % 5 = 0)
BEGIN
		PRINT ('É multiplo de 2, 3, 5')
END
ELSE
BEGIN
		PRINT ('Não é multiplo de 2, 3, 5')
END

-- b)  Fazer um algoritmo que leia 3 números e mostre o maior e o menor

DECLARE		@n1		INT,
			@n2		INT,
			@n3		INT,
			@maior	INT,
			@menor	INT
SET @n1 = 3
SET @n2 = 15
SET @n3 = 17
IF (@n1 != @n2 AND @n1 != @n3 AND @n2 != @n3)
BEGIN
		IF (@n1 >= @n2 AND @n1 >= @n3)
		BEGIN
		SET @maior = @n1
		END
		IF (@n2 >= @n1 AND @n2 >= @n3)
		BEGIN
		SET @maior = @n2
		END
		IF (@n3 >= @n1 AND @n3 >= @n2)
		BEGIN
		SET @maior = @n3
		END
		IF (@n1 <= @n2 AND @n1 <= @n3)
		BEGIN
		SET @menor = @n1
		END
		IF (@n2 <= @n1 AND @n2 <= @n3)
		BEGIN
		SET @menor = @n2
		END
		IF (@n3 <= @n1 AND @n3 <= @n2)
		BEGIN
		SET @menor = @n3
		END
		PRINT (@maior)
		PRINT (@menor)
END

-- c) Fazer um algoritmo que calcule os 15 primeiros termos da série
-- 1,1,2,3,5,8,13,21,...
-- E calcule a soma dos 15 termos

CREATE TABLE tab_soma
(
NUM			INT			NOT NULL
) 
DECLARE @n1   INT,
		@i	  INT,
		@soma INT,
		@res  INT
SET @i = 1 
SET @n1 = 0
SET @soma = 0
SET @res = 0

WHILE (@i <= 15)
BEGIN
	SET @res = (SELECT TOP 1 s.num FROM tab_soma s ORDER BY s.num DESC)
	IF(@res IS NULL)
BEGIN
	SET @res = 1 
	INSERT INTO tab_soma VALUES
	(1)
END
	SET @res = @res + @soma
INSERT INTO tab_soma VALUES
(@res)
	SET @soma = @res - @soma
	PRINT(@res)
	SET @i = @i + 1
END
	SET @n1 = (SELECT SUM(s.NUM) FROM tab_soma s)
PRINT('soma: '+ CAST(@n1 AS VARCHAR(100)))

-- d) Fazer um algoritmo que separa uma frase, colocando todas as letras em maiúsculo e em minúsculo (Usar funções UPPER e LOWER)

DECLARE @frase VARCHAR(100)
SET @frase = 'laboratório de banco de dados'
PRINT (UPPER(@frase) + ' /  '+ LOWER(@frase))

-- e) Fazer um algoritmo que inverta uma palavra (Usar a função SUBSTRING)

DECLARE @palavra	VARCHAR(100),
		@inv		VARCHAR(100),
		@n			INT
SET @palavra = 'laboratório de banco de dados'
SET @inv = ''
SET @n = LEN(@palavra)
WHILE (@n > 0)
BEGIN
SET @inv = (SELECT CONCAT(@inv, SUBSTRING(@palavra, @n, 1)))
SET @n = @n-1
END
PRINT(@inv)

