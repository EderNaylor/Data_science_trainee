CREATE DATABASE asignacion;
use asignacion;

CREATE TABLE IF NOT EXISTS supervisor (
    clave_de_supervisor INT NOT NULL AUTO_INCREMENT,
        PRIMARY KEY(clave_de_supervisor)
);

CREATE TABLE IF NOT EXISTS nivel_de_riesgo (
    clave_nivel_de_riesgo INT NOT NULL AUTO_INCREMENT,
        PRIMARY KEY(clave_nivel_de_riesgo)
);

CREATE TABLE IF NOT EXISTS status (
    clave_status INT NOT NULL AUTO_INCREMENT,
        PRIMARY KEY(clave_status)
);

CREATE TABLE IF NOT EXISTS flokzu_procesos_de_retencion (
    flokzu_psbaja INT NOT NULL AUTO_INCREMENT,
        PRIMARY KEY(flokzu_psbaja)
);
CREATE TABLE IF NOT EXISTS asunto (
    clave_de_asunto INT NOT NULL AUTO_INCREMENT,
        PRIMARY KEY(clave_de_asunto)
);

CREATE TABLE IF NOT EXISTS agente (
    clave_de_agente INT NOT NULL AUTO_INCREMENT,
        PRIMARY KEY(clave_de_agente)
);

CREATE TABLE IF NOT EXISTS crm (
    clave_de_llamada INT NOT NULL,
    clave_de_asunto_id INT,
    clave_de_agente_id INT,
        PRIMARY KEY(clave_de_llamada),
            FOREIGN KEY (clave_de_asunto_id)
                REFERENCES asunto(clave_de_asunto)
                    ON UPDATE CASCADE
                    ON DELETE RESTRICT,
            FOREIGN KEY (clave_de_agente_id)
                REFERENCES agente(clave_de_agente)
                    ON UPDATE CASCADE
                    ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS alumno (
    matricula INT NOT NULL,
    clave_nivel_de_riesgo_id INT,
    clave_de_supervisor_id INT,
    clave_status_id INT,
    clave_de_llamada_id INT,
        PRIMARY KEY(matricula),
            FOREIGN KEY(clave_nivel_de_riesgo_id)
                REFERENCES nivel_de_riesgo(clave_nivel_de_riesgo)
                    ON UPDATE CASCADE
                    ON DELETE RESTRICT,
            FOREIGN KEY(clave_de_supervisor_id)
                REFERENCES supervisor(clave_de_supervisor)
                    ON UPDATE CASCADE
                    ON DELETE RESTRICT,
            FOREIGN KEY(clave_status_id)
                REFERENCES status(clave_status)
                    ON UPDATE CASCADE
                    ON DELETE RESTRICT,
            FOREIGN KEY(clave_de_llamada_id)
                REFERENCES crm(clave_de_llamada)
                    ON UPDATE CASCADE
                    ON DELETE RESTRICT                    
);

CREATE TABLE IF NOT EXISTS interacciones (
    clave_de_llamada_id INT,
    matricula_id INT,
        PRIMARY KEY (matricula_id),
            FOREIGN KEY(clave_de_llamada_id)
                REFERENCES crm(clave_de_llamada)
                    ON UPDATE CASCADE
                    ON DELETE RESTRICT,
            FOREIGN key(matricula_id)
                REFERENCES alumno(matricula)
                    ON UPDATE CASCADE
                    ON DELETE RESTRICT
    );

CREATE TABLE IF NOT EXISTS flokzu (
    flokzu_psbaja_id INT,
    matricula_id INT,
        PRIMARY KEY (matricula_id),
            FOREIGN KEY(flokzu_psbaja_id)
                REFERENCES flokzu_procesos_de_retencion(flokzu_psbaja)
                    ON UPDATE CASCADE
                    ON DELETE RESTRICT,
            FOREIGN key(matricula_id)
                REFERENCES alumno(matricula)
                    ON UPDATE CASCADE
                    ON DELETE RESTRICT
);  