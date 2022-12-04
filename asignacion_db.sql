CREATE DATABASE asignacion;
use asignacion;

DROP TABLE IF EXISTS flokzu;
DROP TABLE IF EXISTS interacciones;
DROP TABLE IF EXISTS alumno;
DROP TABLE IF EXISTS crm;
DROP TABLE IF EXISTS agente;
DROP TABLE IF EXISTS asunto;
DROP TABLE IF EXISTS flokzu_procesos_de_retencion;
DROP TABLE IF EXISTS status;
DROP TABLE IF EXISTS nivel_de_riesgo;
DROP TABLE IF EXISTS supervisor;

CREATE TABLE IF NOT EXISTS supervisor (
    id INT NOT NULL AUTO_INCREMENT,
        PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS nivel_de_riesgo (
    id INT NOT NULL AUTO_INCREMENT,
        PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS status (
    id INT NOT NULL AUTO_INCREMENT,
        PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS flokzu_psbaja (
    flokzu_id INT NOT NULL UNIQUE,
        PRIMARY KEY(flokzu_id)
);
CREATE TABLE IF NOT EXISTS asunto (
    id INT NOT NULL AUTO_INCREMENT,
        PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS agente (
    id INT NOT NULL AUTO_INCREMENT,
        PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS crm (
    clave_llamada INT NOT NULL UNIQUE,
    asunto_id INT,
    agente_id INT,
        PRIMARY KEY(clave_llamada),
        FOREIGN KEY (asunto_id) REFERENCES asunto(id)
            ON UPDATE CASCADE
            ON DELETE SET NULL,
        FOREIGN KEY (agente_id) REFERENCES agente(id)
            ON UPDATE CASCADE
            ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS alumno (
    matricula INT NOT NULL,
    riesgo_id INT,
    supervisor_id INT,
    status_id INT,
    clave_llamada INT,
        PRIMARY KEY(matricula),
        FOREIGN KEY(riesgo_id) REFERENCES nivel_de_riesgo(id)
            ON UPDATE CASCADE
            ON DELETE SET NULL,
        FOREIGN KEY(supervisor_id) REFERENCES supervisor(id)
            ON UPDATE CASCADE
            ON DELETE SET NULL,
        FOREIGN KEY(status_id) REFERENCES status(id)
            ON UPDATE CASCADE
            ON DELETE SET NULL,
        FOREIGN KEY(clave_llamada) REFERENCES crm(clave_llamada)
            ON UPDATE CASCADE
            ON DELETE SET NULL                    
);

CREATE TABLE IF NOT EXISTS interacciones (
    matricula INT,
    clave_llamada INT,
        FOREIGN KEY(matricula) REFERENCES alumno(matricula)
            ON UPDATE CASCADE
            ON DELETE SET NULL,
        FOREIGN KEY(clave_llamada) REFERENCES crm(clave_llamada)
            ON UPDATE CASCADE
            ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS flokzu (
    matricula INT,
    flokzu_id INT,
        FOREIGN KEY(flokzu_id) REFERENCES flokzu_psbaja(flokzu_id)
            ON UPDATE CASCADE
            ON DELETE SET NULL,
        FOREIGN KEY(matricula) REFERENCES alumno(matricula)
            ON UPDATE CASCADE
            ON DELETE SET NULL
);
