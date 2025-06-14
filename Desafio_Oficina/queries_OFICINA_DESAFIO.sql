-- RESPONDENDO PERGUNTAS COM QUERIES ELABORADAS
USE oficina_desafio;
SHOW TABLES;

SELECT * FROM cliente;
SELECT * FROM servico;
SELECT * FROM os;
SELECT * FROM equipe_mecanicos;
-- Quantos serviços foramm solicitados por cada cliente ?
SELECT c.idCliente, concat(nome, '' , sobrenome) AS nome_completo , COUNT(o.idCliente) AS total_de_servicos
	FROM cliente AS c 
    JOIN os AS o ON c.idcliente = o.idCliente
    GROUP BY o.idCliente;
    
-- Quantas OS (ordem de serviço) , foram Concluidas , Canceladas e quantas estão em Analise
    
SELECT statusOs , COUNT(*) AS quantidade_de_OS
	FROM os o
    JOIN cliente c ON c.idCliente = o.idCliente
    GROUP BY statusOs
    ORDER BY quantidade_de_OS DESC;


-- Total de pedido para João Souza
SELECT nome , sobrenome , COUNT(*) AS quantidade_total_de_pedidos FROM os o INNER JOIN cliente c ON c.idCliente = o.idCliente
				WHERE c.nome = 'João'
                GROUP BY c.idCliente;
                

-- Quais os tipos de serviços foram solicitados por quais clientes
SELECT o.tipoDeServico , concat(nome, '' , sobrenome) AS nome_completo 
FROM os AS o
JOIN cliente AS c ON c.idcliente = o.idCliente
ORDER BY nome_completo ;

-- Qual cliente comprou uma bateria
SELECT nome , sobrenome , tipoDeServico FROM cliente c INNER JOIN os o ON c.idCliente = o.idCliente
		WHERE tipoDeServico LIKE '%BATERIA%';
        
-- Qual equipe de mecânicos executou mais ordens de serviço no último mês?

SELECT o.idEquipeMecanicos , COUNT(*) AS quantidade_total_de_OS_atendidas , e.turno 
	FROM os AS o JOIN equipe_mecanicos AS e ON e.idEquipeMecanicos = o.idEquipeMecanicos
	GROUP BY idEquipeMecanicos
    ORDER BY quantidade_total_de_os_atendidas DESC
    LIMIT 1;
    
-- Quais clientes possuem mais de duas OS
SELECT  idCliente, COUNT(*) AS total_os 
FROM os
GROUP BY idCliente
HAVING COUNT(*) > 1;

