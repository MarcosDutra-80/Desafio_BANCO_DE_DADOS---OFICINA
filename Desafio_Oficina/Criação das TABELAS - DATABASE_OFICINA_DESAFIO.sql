-- Criação das TABELAS - DATABASE_OFICINA_DESAFIO
CREATE DATABASE oficina_desafio ;
USE oficina_desafio;
SHOW TABLES;

-- TABELA CLIENTE
CREATE TABLE cliente(
			idcliente INT AUTO_INCREMENT PRIMARY KEY ,
            nome VARCHAR (100),
            sobrenome VARCHAR (100),
            CPF CHAR (11),
            Endereço VARCHAR (225),
            dataDeNascimento DATE,
            CONSTRAINT unico_cpf_cliente UNIQUE (CPF)         
	
        );

-- TABELA EQUIPE_DE_MECANICOS

CREATE TABLE equipe_mecanicos (
			idEquipeMecanicos INT AUTO_INCREMENT PRIMARY KEY,
            turno ENUM ('Manha' , 'Tarde' , 'Noite'),
            quantidadeDeMecanicos INT	
		);
        
-- TABELA MECÂNICO
CREATE TABLE mecanico(
			idMecanico INT AUTO_INCREMENT PRIMARY KEY,
            codigo INT (11) ,
            nome VARCHAR (150),
			endereço VARCHAR (255),
            especialidade VARCHAR (45),
            idEquipeMecanicos INT,
            CONSTRAINT unico_codigo_mecanico UNIQUE (codigo),
            CONSTRAINT fk_id_equipeDe_mecanicos FOREIGN KEY (idEquipeMecanicos) REFERENCES equipe_mecanicos(idEquipeMecanicos)
        );
        

-- TABELA VEICULOS
CREATE TABLE veiculo(
		idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
        placa CHAR (7) NOT NULL,
        modelo VARCHAR (45) NOT NULL,
        cor VARCHAR (15) NOT NULL,
        idCliente INT ,
        idEquipeMecanicos INT,
        CONSTRAINT unica_placa_veiculo UNIQUE (placa),
        CONSTRAINT fk_idcliente_dono_veiculo FOREIGN KEY (idCliente) REFERENCES cliente (idcliente),
        CONSTRAINT fk_idEquipeMecanicos_responsaveis_veiculo FOREIGN KEY (idEquipeMecanicos) REFERENCES equipe_mecanicos (idEquipeMecanicos)
	);
    
-- TABELA ORDEM DE SERVIÇO (OS)
CREATE TABLE os(
		idOs INT AUTO_INCREMENT PRIMARY KEY ,
        idEquipeMecanicos INT,
        idVeiculo INT,
        idCliente INT,
        numeroOS INT,
        dataDeEmissao DATE NOT NULL ,
        statusOs ENUM('Concluido', 'Em analise', 'Cancelado'),
        dataParaConslusao DATE NOT NULL ,
        tipoDeServico VARCHAR (100) NOT NULL,
        varloServiço FLOAT DEFAULT 0,
        valorMaoDeObra FLOAT DEFAULT 0,
        valorPecas FLOAT DEFAULT 0,
        valorTotal FLOAT NOT NULL ,
        CONSTRAINT fk_idcliente_OS FOREIGN KEY (idCliente) REFERENCES cliente (idCliente),
		CONSTRAINT fk_idEquipeMecanicos_OS FOREIGN KEY (idEquipeMecanicos) REFERENCES equipe_mecanicos (idEquipeMecanicos),
        CONSTRAINT fk_idVeiculo_Os FOREIGN KEY (idVeiculo) REFERENCES veiculo  (idVeiculo)
	);
    
-- TABELA PEÇA
CREATE TABLE peca (
		idPeca INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR (150),
        valor FLOAT NOT NULL,
        quantidadeEstoque INT DEFAULT 0
);
    

-- TABEELA SERVIÇO
CREATE TABLE servico (
		idServico INT AUTO_INCREMENT PRIMARY KEY,
        tipoServico VARCHAR (45),
        valor FLOAT 
	);
    
    
-- TABELA PAGAMENTO
CREATE TABLE pagamento (
		idPagamento INT AUTO_INCREMENT PRIMARY KEY,
        idCliente INT,
        idOs INT,
        formaDePagamento ENUM ('CartãoCredito', 'CartaoDebito', 'PIX'),
        dataDepagamento DATE NOT NULL,
        valorPago FLOAT NOT NULL,
        statusDoPagamento ENUM('Aprovado', 'Reprovado', 'Em analise'),
        CONSTRAINT fk_idcliente_do_Pagamento FOREIGN KEY (idCliente) REFERENCES cliente (idCliente),
        CONSTRAINT fk_os_do_Pagamento FOREIGN KEY (idOs) REFERENCES os  (idOS)
);

-- TABELA PEÇAS DA OS
CREATE TABLE pecasOs (
			idOs INT,
            idEquipeOS INT,
            idpeca INT,
            CONSTRAINT fk_id_da_OS FOREIGN KEY (idOs) REFERENCES os  (idOS),
            CONSTRAINT fk_idEquipe_na_OS FOREIGN KEY (idEquipeOS) REFERENCES equipe_mecanicos  (idEquipeMecanicos),
			CONSTRAINT fk_idpeca_na_os FOREIGN KEY (idpeca) REFERENCES peca (idPeca)	
);


-- TABELA SERVIÇOS DA OS

CREATE TABLE servicosDaOs (
			idServicoOs INT,
            idEquipeOS INT,
            idOs INT,
            CONSTRAINT fk_id_do_servico_OS FOREIGN KEY (idServicoOs) REFERENCES servico (idServico),
            CONSTRAINT fk_id_da_Equipe_na_OS FOREIGN KEY (idEquipeOS) REFERENCES equipe_mecanicos  (idEquipeMecanicos),
			CONSTRAINT fk_id_os FOREIGN KEY (idOs) REFERENCES os (idOs)	
);