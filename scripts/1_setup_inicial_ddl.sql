--------------------------------------------------------------------------------
 
-- SETUP DE CRIACAO DO UCONTADB

--------------------------------------------------------------------------------

-- VARIAVEIS
DEFINE P_SCHEMA     = UCONTA_USER;

DEFINE P_TS_DADOS   = UCONTA_D;


alter session set "_ORACLE_SCRIPT"=true;

-- TABLESPACES
CREATE TABLESPACE &P_TS_DADOS DATAFILE '&P_TS_DADOS..DBF' SIZE 20M AUTOEXTEND ON NEXT 20M;



-- USUARIOS
CREATE USER &P_SCHEMA IDENTIFIED BY unisenha DEFAULT TABLESPACE &P_TS_DADOS QUOTA UNLIMITED ON &P_TS_DADOS;

GRANT CREATE SESSION TO &P_SCHEMA;

-- Tabelas
CREATE TABLE &P_SCHEMA..TB_BILL (
	COD_BILL NUMBER(*, 0) NOT NULL,
	DATE_BILL DATE NOT NULL, 
	DESCRIPTION VARCHAR2(200) NOT NULL, 
	VALUE DOUBLE PRECISION NOT NULL, 
	CATEGORY NUMBER(*, 0) NOT NULL
);

CREATE TABLE &P_SCHEMA..TB_CATEGORY (
	COD_CATEGORY NUMBER(*, 0) NOT NULL, 
	NAME VARCHAR2(200) NOT NULL
	);

-- Sequences
create sequence &P_SCHEMA..SEQ_CF_COD_BILL start with 5 increment by 1 cache 20 nocycle noorder;
create sequence &P_SCHEMA..SEQ_CF_COD_CATEGORY start with 5 increment by 1 cache 20 nocycle noorder;

-- Pks
ALTER TABLE &P_SCHEMA..TB_CATEGORY ADD CONSTRAINT PK_COD_CATEGORY PRIMARY KEY (COD_CATEGORY);
ALTER TABLE &P_SCHEMA..TB_BILL ADD CONSTRAINT PK_COD_BILL PRIMARY KEY (COD_BILL);

-- FKs
ALTER TABLE &P_SCHEMA..TB_BILL ADD CONSTRAINT FK_COD_CATEGORY FOREIGN KEY (CATEGORY) REFERENCES &P_SCHEMA..TB_CATEGORY(COD_CATEGORY);
	





