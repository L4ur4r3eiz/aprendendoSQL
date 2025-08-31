CREATE DATABASE BatalhadeCranios;
GO

USE BatalhadeCranios;
GO

-- Dropar tabelas se já existirem
IF OBJECT_ID('Participa', 'U') IS NOT NULL DROP TABLE Participa;
IF OBJECT_ID('Pergunta_partida', 'U') IS NOT NULL DROP TABLE Pergunta_partida;
IF OBJECT_ID('Alternativa', 'U') IS NOT NULL DROP TABLE Alternativa;
IF OBJECT_ID('Partida', 'U') IS NOT NULL DROP TABLE Partida;
IF OBJECT_ID('Pergunta', 'U') IS NOT NULL DROP TABLE Pergunta;
IF OBJECT_ID('Usuario', 'U') IS NOT NULL DROP TABLE Usuario;
GO

-- Usuario
CREATE TABLE Usuario (
    id INT PRIMARY KEY IDENTITY(1,1),
    pontuacao_total INT DEFAULT 0,
    tipo VARCHAR(50) -- estava faltando no seu
);
GO

-- Pergunta
CREATE TABLE Pergunta (
    id_pergunta INT PRIMARY KEY IDENTITY(1,1),
    enunciado TEXT NOT NULL,
    tipo VARCHAR(50) -- também estava no diagrama
);
GO

-- Alternativa
CREATE TABLE Alternativa (
    id_alternativa INT PRIMARY KEY IDENTITY(1,1),
    opcao VARCHAR(500) NOT NULL,
    certo BIT DEFAULT 0,
    id_pergunta INT NOT NULL,
    FOREIGN KEY (id_pergunta) REFERENCES Pergunta(id_pergunta)
);
GO

-- Partida
CREATE TABLE Partida (
    id_partida INT PRIMARY KEY IDENTITY(1,1),
    pontuacao INT DEFAULT 0
);
GO

-- Participa (Usuario x Partida)
CREATE TABLE Participa (
    id_usuario INT,
    id_partida INT,
    pontuacao INT DEFAULT 0,
    PRIMARY KEY (id_usuario, id_partida),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
    FOREIGN KEY (id_partida) REFERENCES Partida(id_partida)
);
GO

-- Pergunta_partida (relação entre Partida, Pergunta e Alternativa escolhida)
CREATE TABLE Pergunta_partida (
    id_pergunta INT,
    id_alternativa INT,
    pontuacao INT DEFAULT 0,
    PRIMARY KEY (id_pergunta, id_alternativa),
    FOREIGN KEY (id_pergunta) REFERENCES Pergunta(id_pergunta),
    FOREIGN KEY (id_alternativa) REFERENCES Alternativa(id_alternativa)
);
GO
