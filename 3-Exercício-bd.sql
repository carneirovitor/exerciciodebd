--3 Q1

SELECT A.*, B.nome
FROM equipe as A 
LEFT JOIN jogador as B on A.idequipe = B.idequipe

--3 Q2

SELECT A.*, b.nome, b.estado, b.tipo, b.saldo_gols
FROM uniforme as A
INNER JOIN equipe as B on a.equipe=b.idequipe
WHERE b.estado='MG'
AND b.tipo='Profissional'
AND a.tipo='Titular'

--3 Q3

SELECT A.nome, A.naturalidade, B.nome as nome_eq, B.estado as estado_eq, C.posicao
FROM jogador as A
INNER JOIN equipe as B on a.equipe=b.equipe
INNER JOIN posicao_jogador as C on a.rg=c.jogador

--3 Q4

SELECT AVG(saldo_gols) as media_saldo_gol, estado
FROM equipe
GROUP BY estado
ORDER BY estado desc

--3 Q5

SELECT AVG(saldo_gols) as media_saldo_gol, tipo, estado
FROM equipe
GROUP BY tipo, estado
ORDER BY tipo, estado desc

--3 Q6

SELECT AVG(saldo_gols) as media_saldo_gol, estado
FROM equipe
WHERE tipo='Profissional'
GROUP BY estado
HAVING AVG(saldo_gols) between 3 and 10

--3 Q7

SELECT AVG(saldo_gols) as media_saldo_gol, estado
FROM equipe
WHERE tipo='Profissional'
GROUP BY estado
HAVING AVG(saldo_gols) >= 1
--O resultado difere da anterior pois agora usamos o operador >= 1, então abrangemos mais dados da base, o que acaba aumentando o numero de registros retornados (abaixo de 3 gols e acima de 10 gols também são incluídos no retorno dessa consulta)

--3 Q8

SELECT rg, nome, naturalidade
FROM jogador
WHERE EXTRACT(YEAR FROM data_nascimento) = '1980'

--3 Q9

SELECT rg, nome, naturalidade
FROM jogador
WHERE (EXTRACT(YEAR FROM current_date)-EXTRACT(YEAR FROM data_nascimento)) > 30

--3 Q10

SELECT * FROM partida as A
WHERE (select * FROM equipe as WHERE nome = 'Corinthians')