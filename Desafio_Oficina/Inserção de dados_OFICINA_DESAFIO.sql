-- INSERÇÃO DE DADOS 
USE oficina_desafio;

SHOW TABLES; 
SELECT * FROM cliente;
SELECT * FROM equipe_mecanicos;
SELECT * FROM veiculo;
SELECT * FROM os;
SELECT * FROM peca;
SELECT * FROM pecasOs;
SELECT * FROM servico ;

-- INSERINDO DADOS NA TABELA CLIENTE
INSERT INTO cliente (nome, sobrenome,Endereço ,CPF , dataDeNascimento)
		VALUES 		('Lucas', 'Ferreira', 'Rua das Palmeiras, 123, São Paulo', '48293120758', '1992-06-15'),
					('Mariana', 'Oliveira', 'Av. Brasil, 789, Rio de Janeiro', '13564892130', '1989-03-22'),
					('João', 'Souza', 'Rua Bela Vista, 45, Belo Horizonte', '91238406591', '2000-11-10'),
					('Ana', 'Santos', 'Rua do Sol, 300, Salvador', '30618977420', '1995-08-05'),
					('Pedro', 'Lima', 'Av. Central, 88, Curitiba', '05412768804', '1985-01-17'),
					('Camila', 'Rocha', 'Rua Amapá, 50, Porto Alegre', '71049336280', '1997-07-02'),
					('Rafael', 'Costa', 'Rua 7 de Setembro, 410, Recife', '60418903716', '1990-04-30'),
					('Juliana', 'Martins', 'Rua das Acácias, 102, Fortaleza', '23891047633', '1998-09-26'),
					('Bruno', 'Almeida', 'Av. Paulista, 950, São Paulo', '37920458892', '1983-12-08'),
					('Larissa', 'Ribeiro', 'Rua Paraná, 21, Manaus', '89123016427', '1994-05-13'),
					('Cristina', 'Ferreira', 'Rua das mangabeiras, 201, Minas Gerais', '12345678911', '2003-04-30');
                    
-- INSERINDO DADOS NA TABELA 
INSERT INTO equipe_mecanicos (turno,quantidadeDeMecanicos)
		VALUES 		('Manha', '5'),
					('Tarde', '8'),
                    ('Noite', '11');
                    
-- INSERINDO DADOS NA TABELA MECANICO
INSERT INTO mecanico (codigo , nome , endereço, especialidade, idEquipeMecanicos)
		VALUES 		('5001' , 'Geraldo silva Santos' , 'Rua:Espirito Santo , VENDA NOVA , BELO HORIZONTE , MG' , 'Manutençao' , '1'),
					('5002', 'Carlos Henrique Lima', 'Rua: Amazonas, CENTRO, CONTAGEM, MG', 'Elétrica', '2'),
					('5003', 'Fernanda Rocha Souza', 'Av: Afonso Pena, CENTRO, BELO HORIZONTE, MG', 'Suspensão', '1'),
					('5004', 'João Batista Ferreira', 'Rua: São Paulo, CENTRO, BETIM, MG', 'Freios', '3'),
					('5005', 'Luciana Alves Martins', 'Rua: Pará, BARREIRO, BELO HORIZONTE, MG', 'Motor', '2'),
					('5006', 'Marcos Vinícius Pereira', 'Rua: Rio de Janeiro, CENTRO, SABARÁ, MG', 'Transmissão', '3');
                    
-- INSERINDO DADOS NA TABELA VEICULO
INSERT INTO veiculo (placa, modelo,cor, idCliente , idEquipeMecanicos)
		VALUES 		('BRA2E19','Fiat Strada','Cinza','1','1'),
					('BRA2E20','Volkswagen Polo','Azul','3','2'),
					('BRA2E21','Chevrolet Onix','Preto','2','3'),
					('BRA2E22','Fiat Argo','Branco','4','1'),
					('BRA2E23','Hyundai HB20','Vermelho','5','2'),
					('BRA2E24','Toyota Corolla','Prata','3','4'),
					('BRA2E25','Renault Kwid','Cinza','1','3');
									
                    
-- INSERINDO DADOS NA TABELA OS
INSERT INTO os ( idEquipeMecanicos, idVeiculo, idCliente , numeroOS ,dataDeEmissao , statusOs , dataParaConslusao , tipoDeServico , varloServiço , valorMaoDeObra , valorPecas , valorTotal)
		VALUES 		('1' , '1000', '1' , '20251', '2025-02-12', 'Em analise' , '2025-02-15', 'Troca de Oleo','150.0' , '25.0', '0.0' , '175.0'),
					('2', '1001', '3', '20252', '2025-03-01', 'Em analise', '2025-03-05', 'Revisão geral', '300.0', '50.0', '20.0', '370.0'),
					('3', '1008', '2', '20253', '2025-03-10', 'Concluido', '2025-03-12', 'Alinhamento e Balanceamento', '120.0', '30.0', '0.0', '150.0'),
					('1', '1009', '4', '20254', '2025-04-05', 'Cancelado', '2025-04-08', 'Troca de pastilhas de freio', '200.0', '40.0', '60.0', '300.0'),
					('2', '1010', '5', '20255', '2025-04-15', 'Concluido', '2025-04-20', 'Substituição de bateria', '250.0', '35.0', '150.0', '435.0'),
					('1', '1011', '3', '20256', '2025-05-01', 'Em analise', '2025-05-03', 'Troca de filtro de ar', '80.0', '20.0', '10.0', '110.0');
                    
-- INSERINDO DADOS NA TABELA PEÇA
INSERT INTO peca (nome , valor , quantidadeEstoque)
		VALUES 		('Amortecedor' , '500.0' , '12'),
					('Bateria' , '455.0' , '6'),
                    ('Pastiilha de Freio' , '80.0' , '80'),
                    ('PNEU' , '699.0' , '35'),
                    ('Farol dianteiro ' , '25.0' , '100'),
                    ('Filtro de ar', '80.0' , '15');
                    
-- INSERINDO DADOS NA TABELA SERVIÇO                    
INSERT INTO servico (tipoServico, valor)
		VALUES 		('Troca de Oleo' , '150.0'),
					('Revisao geral' , '300.0'),
					('Alinhamento e Balanceamento' , '120.0'),
                    ('Troca de pastilhas de freio' , '200.0'),
                    ('Troca de PNEU' , '30.0'),
                    ('Troca de Bateria' , '250.0'),
                    ('Troca de Filtros de AR' , '80');
                    
-- INSERINDO DADOS NA TABELA PAGAMENTO
INSERT INTO pagamento (idCliente, idOs, formaDePagamento, dataDepagamento, valorPago , statusDoPagamento)
		VALUES 			('1' , '1' , 'CartaoDebito' , '2025-02-15' , '175.00', 'Aprovado'),
						('3' , '2' , 'CartaoCredito' , '2025-03-05' , '370.00', 'Aprovado'),
                        ('2' , '3' , 'PIX' , '2025-03-12' , '150.00', 'Aprovado'),
                        ('4' , '4' , 'CartaoCredito' , '2025-04-08' , '300.00', 'Em analise'),
                        ('5' , '5' , 'CartaoCredito' , '2025-04-20' , '435.00', 'Reprovado'),
                        ('3' , '6' , 'CartaoDebito' , '2025-05-03' , '110.00', 'Reprovado');
                        
-- INSERINDO DADOS NA TABELA PEÇASos
INSERT INTO pecasOs (idOs , idEquipeOS, idpeca)
		VALUES  		('4' , '1', '3' ),
						('5' , '2' , '2' ),
                        ('6' , '1' , '6' );

-- INSERINDO DADOS NA TABELA SERVICOSDAOS
INSERT INTO servicosDaOs (idServicoOs, idEquipeOS , idOs)
		VALUES 			('4' , '1' , '4'),                   
						('6' , '2' , '5'),     
                        ('7' , '1' , '6');			
        
        
        
        
        
        
        