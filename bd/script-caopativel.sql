-- BD do Projeto Cãopatível
-- Autor: Adriano Alves (SPTech)

CREATE DATABASE caopativel;
USE caopativel;

-- Tabela 1: Usuários cadastrados no sistema
CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    email VARCHAR(60) UNIQUE NOT NULL,
    senha VARCHAR(60) NOT NULL
);

-- Tabela 2: Catálogo de Raças e Requisitos Mínimos
CREATE TABLE raca (
    idRaca INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    porte VARCHAR(20) NOT NULL,
    min_passeio TINYINT NOT NULL,   -- 1: <30min | 2: 30-60min | 3: 1-2h | 4: >2h
    min_moradia TINYINT NOT NULL,   -- 1: Ap Pequeno | 2: Ap Médio | 3: Casa | 4: Sítio
    max_sozinho TINYINT NOT NULL,   -- 1: >8h | 2: 4-8h | 3: <4h | 4: Quase nunca
    descricao TEXT NOT NULL
);

-- Tabela 3: Respostas do Quiz e Avaliação de Compatibilidade
CREATE TABLE IF NOT EXISTS resposta_quiz (
    idResposta INT PRIMARY KEY AUTO_INCREMENT,
    fkUsuario INT NOT NULL,
    fkRacaDesejada INT NOT NULL,
    tipo_moradia TINYINT NOT NULL,
    tempo_passeio TINYINT NOT NULL,
    tempo_sozinho TINYINT NOT NULL,
    experiencia TINYINT NOT NULL,
    is_compativel TINYINT(1) NOT NULL, -- 1 = Compatível | 0 = Incompatível
    dtResposta DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
    FOREIGN KEY (fkRacaDesejada) REFERENCES raca(idRaca)
);

-- Inserção de dados iniciais na tabela de Raças
INSERT INTO raca (nome, porte, min_passeio, min_moradia, max_sozinho, descricao) VALUES
('Border Collie', 'Médio', 3, 3, 2, 'Cão de altíssima energia e inteligência. Requer bastante espaço e atividades diárias intensas para não desenvolver estresse.'),
('Pug', 'Pequeno', 1, 1, 2, 'Cão de companhia calmo e adaptável a apartamentos. Exige passeios curtos devido à sensibilidade respiratória.'),
('Golden Retriever', 'Grande', 3, 2, 2, 'Amoroso e ativo. Precisa de atenção constante e passeios diários longos. Pode ter ansiedade se passar muito tempo sozinho.'),
('Pinscher', 'Pequeno', 1, 1, 3, 'Pequeno e alerta. Adapta-se bem a espaços reduzidos, mas exige atenção ao nível de estresse e latidos.'),
('Pastor Alemão', 'Grande', 3, 3, 2, 'Cão de guarda e trabalho, extremamente leal. Necessita de espaço amplo, rotina de exercícios e tutor com firmeza no adestramento.');

SHOW TABLES;
SELECT * FROM raca;