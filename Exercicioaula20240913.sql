CREATE DATABASE clinica;

USE clinica;

CREATE TABLE clinica (
  cnpj_cli INTEGER NOT NULL,
  nom_cli VARCHAR(50) NOT NULL,
  PRIMARY KEY(cnpj_cli)
);

CREATE TABLE especialidade (
  cod_esp INTEGER NOT NULL,
  dsc_esp VARCHAR(50) NOT NULL,
  PRIMARY KEY(cod_esp)
);

CREATE TABLE medico (
  crm_med INTEGER NOT NULL,
  nom_med VARCHAR(50) NOT NULL,
  dat_nas DATETIME NOT NULL,
  val_sal NUMERIC(15,2) NULL DEFAULT 0,
  cod_esp INTEGER NOT NULL,
  PRIMARY KEY(crm_med),
  FOREIGN KEY(cod_esp) REFERENCES especialidade(cod_esp)
);

CREATE TABLE formacao (
  cod_esp INTEGER NOT NULL,
  crm_med INTEGER NOT NULL,
  dat_for DATETIME NOT NULL,
  nom_fac VARCHAR(30) NULL,
  PRIMARY KEY(cod_esp, crm_med),
  FOREIGN KEY(cod_esp) REFERENCES especialidade(cod_esp),
  FOREIGN KEY(crm_med) REFERENCES medico(crm_med)
);

CREATE TABLE paciente (
  cpf_pac INTEGER NOT NULL,
  nom_pac VARCHAR(50) NOT NULL,
  dat_nas DATETIME NOT NULL,
  tel_pac VARCHAR(20) NULL,
  crm_med INTEGER NOT NULL,
  cnpj_cli INTEGER NOT NULL,
  PRIMARY KEY(cpf_pac),
  FOREIGN KEY(crm_med) REFERENCES medico(crm_med),
  FOREIGN KEY(cnpj_cli) REFERENCES clinica(cnpj_cli)
);

CREATE TABLE quarto (
  num_qua INTEGER NOT NULL,
  num_and INTEGER NOT NULL,
  cpf_pac INTEGER NOT NULL,
  PRIMARY KEY(num_qua),
  FOREIGN KEY(cpf_pac) REFERENCES paciente(cpf_pac)
);

CREATE TABLE tratamento (
  crm_med INTEGER NOT NULL,
  cpf_pac INTEGER NOT NULL,
  dat_ini DATETIME NOT NULL,
  dat_fin DATETIME NULL,
  val_tot NUMERIC(15,2) NULL DEFAULT 0,
  PRIMARY KEY(crm_med, cpf_pac, dat_ini),
  FOREIGN KEY(crm_med) REFERENCES medico(crm_med),
  FOREIGN KEY(cpf_pac) REFERENCES paciente(cpf_pac)
);

/* Inserção de dados nas tabelas */
INSERT INTO clinica 
  (cnpj_cli, nom_cli)
VALUES
  (12345, 'Clínica Boa Morte');

INSERT INTO clinica 
  (cnpj_cli, nom_cli)
VALUES
  (22334, 'Clínica Até Logo');

INSERT INTO especialidade
  (cod_esp, dsc_esp)
VALUES
  (1, 'Cardiologia');
  
INSERT INTO especialidade
  (cod_esp, dsc_esp)
VALUES
  (2, 'Ortopedia');
  
INSERT INTO especialidade
  (cod_esp, dsc_esp)
VALUES
  (3, 'Dermatologia');
  
INSERT INTO especialidade
  (cod_esp, dsc_esp)
VALUES
  (4, 'Otorrino');
  
INSERT INTO especialidade
  (cod_esp, dsc_esp)
VALUES
  (5, 'Clínica Médica');
  
INSERT INTO especialidade
  (cod_esp, dsc_esp)
VALUES
  (6, 'Neurologia');
  
INSERT INTO especialidade
  (cod_esp, dsc_esp)
VALUES
  (7, 'Psiquiatria');
  
INSERT INTO especialidade
  (cod_esp, dsc_esp)
VALUES
  (8, 'Geriatria');
  
INSERT INTO especialidade
  (cod_esp, dsc_esp)
VALUES
  (9, 'Oftalmologia');
  
INSERT INTO medico
  (crm_med, nom_med, dat_nas, val_sal, cod_esp)
VALUES
  (1234, 'Dino da Silva Sauro', '1950/10/10', 1590, 1);
  
INSERT INTO medico
  (crm_med, nom_med, dat_nas, val_sal, cod_esp)
VALUES
  (2233, 'Ayrton Senna da Silva Sauro', '1965/11/01', 12000, 1);
  
INSERT INTO medico
  (crm_med, nom_med, dat_nas, val_sal, cod_esp)
VALUES
  (4646, 'Steve Jobs', '1975/03/26', 3900, 2);
  
INSERT INTO medico
  (crm_med, nom_med, dat_nas, val_sal, cod_esp)
VALUES
  (1817, 'Bill Gates', '1966/09/09', 3899, 3);

INSERT INTO medico
  (crm_med, nom_med, dat_nas, val_sal, cod_esp)
VALUES
  (4590, 'Lima Duarte', '1973/12/23', 5475.99, 3);
  
INSERT INTO medico
  (crm_med, nom_med, dat_nas, val_sal, cod_esp)
VALUES
  (9088, 'Saddam Hussein', '1980/10/17', 7500, 5);
  
INSERT INTO medico
  (crm_med, nom_med, dat_nas, val_sal, cod_esp)
VALUES
  (7865, 'Osama Bin Laden', '1949/11/23', 507.5, 6);
  
INSERT INTO medico
  (crm_med, nom_med, dat_nas, val_sal, cod_esp)
VALUES
  (1113, 'George W. Bush', '1959/08/08', 9200, 7);
  
INSERT INTO medico
  (crm_med, nom_med, dat_nas, val_sal, cod_esp)
VALUES
  (4566, 'Tiririca Abestado', '1977/12/01', 19500, 3);
  
INSERT INTO medico
  (crm_med, nom_med, dat_nas, val_sal, cod_esp)
VALUES
  (1263, 'Fred Mercury Prateado', '1930/10/21', 1877.91, 5);
  
INSERT INTO medico
  (crm_med, nom_med, dat_nas, val_sal, cod_esp)
VALUES
  (4870, 'Maguila', '1920/05/28', 6200, 5);
  
INSERT INTO formacao 
  (cod_esp, crm_med, dat_for, nom_fac)
VALUES
  (5, 4870, '1950/01/01', 'Faculdade do Boxe');
  
INSERT INTO formacao 
  (cod_esp, crm_med, dat_for, nom_fac)
VALUES
  (2, 4870, '1960/09/11', 'Faculdade do Boxe');
  
INSERT INTO formacao 
  (cod_esp, crm_med, dat_for, nom_fac)
VALUES
  (5, 1263, '1975/11/23', 'Faculdade da Música Medicinal');
  
INSERT INTO formacao 
  (cod_esp, crm_med, dat_for, nom_fac)
VALUES
  (3, 4566, '2006/12/02', 'Faculdade Tom Cavalcante');
  
INSERT INTO formacao 
  (cod_esp, crm_med, dat_for, nom_fac)
VALUES
  (7, 4566, '2008/12/23', 'Faculdade dos Abestados');
  
INSERT INTO formacao 
  (cod_esp, crm_med, dat_for, nom_fac)
VALUES
  (7, 1113, '2005/02/22', 'MIT');
  
INSERT INTO formacao 
  (cod_esp, crm_med, dat_for, nom_fac)
VALUES
  (5, 9088, '1990/08/03', 'Universidade do Iraque');
  
INSERT INTO formacao 
  (cod_esp, crm_med, dat_for, nom_fac)
VALUES
  (6, 7865, '2001/09/11', 'Universidade do Afeganistão');
  
INSERT INTO formacao 
  (cod_esp, crm_med, dat_for, nom_fac)
VALUES
  (9, 7865, '2001/09/11', 'Universidade das Bombas');
  
INSERT INTO formacao 
  (cod_esp, crm_med, dat_for, nom_fac)
VALUES
  (1, 1234, '1965/11/23', 'Universidade dos Dinossauros');
  
INSERT INTO formacao 
  (cod_esp, crm_med, dat_for, nom_fac)
VALUES
  (3, 1817, '1995/04/18', 'Universidade das Antas');
  
INSERT INTO paciente
  (cpf_pac, nom_pac, dat_nas, tel_pac, crm_med, cnpj_cli)
VALUES
  (9010, 'Documentado Registrado da Silva', '1990/10/19', NULL, 1234, 22334);
  
INSERT INTO paciente
  (cpf_pac, nom_pac, dat_nas, tel_pac, crm_med, cnpj_cli)
VALUES
  (9011, 'Assumida Prometida de Souza', '2000/01/20', '(37) 8888-1234', 7865, 22334);
  
INSERT INTO paciente
  (cpf_pac, nom_pac, dat_nas, tel_pac, crm_med, cnpj_cli)
VALUES
  (9012, 'Acompanhado da Garrucha do Socorro', '1978/05/09', '(31) 3322-9090', 4566, 22334);
  
INSERT INTO paciente
  (cpf_pac, nom_pac, dat_nas, tel_pac, crm_med, cnpj_cli)
VALUES
  (9013, 'Maria do Futuro Comprometido', '2001/11/30', '(37) 9909-9909', 4566, 22334);
  
INSERT INTO paciente
  (cpf_pac, nom_pac, dat_nas, tel_pac, crm_med, cnpj_cli)
VALUES
  (9014, 'Ana Mariana Tertuliana Santana', '1955/09/19', NULL, 1263, 22334);
  
INSERT INTO paciente
  (cpf_pac, nom_pac, dat_nas, tel_pac, crm_med, cnpj_cli)
VALUES
  (9015, 'Mário Pelúcia Torres', '1980/06/30', '(11) 2104-4500', 1817, 12345);
  
INSERT INTO paciente
  (cpf_pac, nom_pac, dat_nas, tel_pac, crm_med, cnpj_cli)
VALUES
  (9016, 'Venezuela Boliviana Paraíba da Silva', '1949/02/11', '(34) 3344-5566', 1113, 12345);
  
INSERT INTO paciente
  (cpf_pac, nom_pac, dat_nas, tel_pac, crm_med, cnpj_cli)
VALUES
  (9017, 'José Coton Coteneto Paranhos', '1978/02/16', '(11) 8907-1299', 4646, 12345);
  
INSERT INTO paciente
  (cpf_pac, nom_pac, dat_nas, tel_pac, crm_med, cnpj_cli)
VALUES
  (9018, 'Gentleman Benvindo Welcomer da Silva', '1999/02/10', NULL, 1234, 12345);
  
INSERT INTO paciente
  (cpf_pac, nom_pac, dat_nas, tel_pac, crm_med, cnpj_cli)
VALUES
  (9019, 'Medula Óssea Trindade', '2005/10/23', '(37) 9900-0099', 4566, 12345);
  
INSERT INTO quarto 
  (num_qua, num_and, cpf_pac)
VALUES
  (1, 1, 9018);
  
INSERT INTO quarto 
  (num_qua, num_and, cpf_pac)
VALUES
  (2, 1, 9011);                                                                                                                                                                                                                                                                                                                                                                         
  
INSERT INTO quarto 
  (num_qua, num_and, cpf_pac)
VALUES
  (3, 2, 9014);
  
INSERT INTO quarto 
  (num_qua, num_and, cpf_pac)
VALUES
  (4, 2, 9015);  

INSERT INTO quarto 
  (num_qua, num_and, cpf_pac)
VALUES
  (5, 4, 9012);
  
INSERT INTO tratamento 
  (crm_med, cpf_pac, dat_ini, dat_fin, val_tot)
VALUES
  (2233, 9016, '2007/02/01', '2007/03/01', 1500);

INSERT INTO tratamento 
  (crm_med, cpf_pac, dat_ini, dat_fin, val_tot)
VALUES
  (2233, 9016, '2008/05/20', '2008/05/25', 723.56);

INSERT INTO tratamento 
  (crm_med, cpf_pac, dat_ini, dat_fin, val_tot)
VALUES
  (4646, 9013, '1996/10/15', '1996/10/15', 150);

INSERT INTO tratamento 
  (crm_med, cpf_pac, dat_ini, dat_fin, val_tot)
VALUES
  (4646, 9014, '2005/11/01', NULL, 0);

INSERT INTO tratamento 
  (crm_med, cpf_pac, dat_ini, dat_fin, val_tot)
VALUES
  (4646, 9014, '2009/08/04', '2009/08/20', 2390);
  
INSERT INTO tratamento 
  (crm_med, cpf_pac, dat_ini, dat_fin, val_tot)
VALUES
  (1817, 9012, '2010/04/11', NULL, 0);

INSERT INTO tratamento 
  (crm_med, cpf_pac, dat_ini, dat_fin, val_tot)
VALUES
  (1817, 9011, '2009/03/24', NULL, 0);
  
INSERT INTO tratamento 
  (crm_med, cpf_pac, dat_ini, dat_fin, val_tot)
VALUES
  (2233, 9015, '1997/12/25', NULL, 0);

INSERT INTO tratamento 
  (crm_med, cpf_pac, dat_ini, dat_fin, val_tot)
VALUES
  (1234, 9015, '2010/04/18', '2010/04/18', 999.99);
  
INSERT INTO tratamento 
  (crm_med, cpf_pac, dat_ini, dat_fin, val_tot)
VALUES
  (1234, 9015, '1999/12/31', '2001/01/01', 3600);
  
INSERT INTO tratamento 
  (crm_med, cpf_pac, dat_ini, dat_fin, val_tot)
VALUES
  (9088, 9018, '1994/10/01', NULL, 0);

INSERT INTO tratamento 
  (crm_med, cpf_pac, dat_ini, dat_fin, val_tot)
VALUES
  (9088, 9018, '1996/06/06', NULL, 0);
  
INSERT INTO tratamento 
  (crm_med, cpf_pac, dat_ini, dat_fin, val_tot)
VALUES
  (7865, 9018, '2002/09/11', '2005/06/22', 12979);