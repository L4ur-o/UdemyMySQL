CREATE DATABASE hospital_db_matheus;

CREATE TABLE medico (
	id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    nascimento DATE,
    endereco VARCHAR(50),
    telefone VARCHAR(11),
    email VARCHAR(100),
    cpf VARCHAR(11) UNIQUE NOT NULL,
    RG VARCHAR(10) UNIQUE
);

CREATE TABLE especialidade (
	id_especialidade INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(70) NOT NULL
);

CREATE TABLE medico_especialidade (
	id_medico INT,
    id_especialidade INT,
    PRIMARY KEY (id_medico,id_especialidade),
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
    FOREIGN KEY (id_especialidade) REFERENCES especialidade(id_especialidade)
);

CREATE TABLE convenio (
	id_convenio INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30),
    cnpj VARCHAR(14) UNIQUE NOT NULL
);

CREATE TABLE paciente (
	id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    nascimento DATE NOT NULL,
    endereco VARCHAR(50),
    telefone VARCHAR(11),
    email VARCHAR(100),
    cpf VARCHAR(11) UNIQUE NOT NULL,
    RG VARCHAR(10) UNIQUE,
    convenio_id INT,
	FOREIGN KEY (convenio_id) REFERENCES convenio(id_convenio)
);

CREATE TABLE consulta (
	id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    id_medico INT NOT NULL,
    id_paciente INT NOT NULL,
    valor DECIMAL (10, 2) NOT NULL,
    id_convenio INT,
    id_especialidade INT NOT NULL,
	receita TEXT,
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    FOREIGN KEY (id_convenio) REFERENCES convenio(id_convenio),
    FOREIGN KEY (id_especialidade) REFERENCES especialidade(id_especialidade)
);


