CREATE DATABASE asignacion;
USE asignacion;

CREATE TABLE clave_supervisor (
	clave_de_supervisor INTEGER NOT NULL UNIQUE PRIMARY KEY,
	nombre_de_supervisor VARCHAR(100)	NOT NULL
);

CREATE TABLE matricula_alumno (
	matricula	INTEGER NOT NULL UNIQUE,
	nombre_del_alumno VARCHAR (100),
	correo_del_alumno varchar (100),
	PRIMARY KEY (matricula)

);

CREATE TABLE supervisor (
	clave_de_supervisor	INTEGER,
	matricula	INTEGER,
	CONSTRAINT fk_Asignacion_supervisor
	FOREIGN KEY(matricula) REFERENCES matricula_alumno(matricula),
	FOREIGN KEY(clave_de_supervisor) REFERENCES clave_supervisor(clave_de_supervisor)
);

CREATE TABLE clave_nivel_de_riesgo (
	clave_nivel_de_riesgo	INTEGER NOT NULL UNIQUE PRIMARY KEY,
	nivel_de_riesgo	VARCHAR(50) NOT NULL
);


CREATE TABLE nivel_de_riesgo (
	clave_nivel_de_riesgo	INTEGER NOT NULL,
	matricula_id	INTEGER NOT NULL,
	FOREIGN KEY(matricula_id) REFERENCES matricula_alumno(matricula),
	FOREIGN KEY(clave_nivel_de_riesgo) REFERENCES clave_nivel_de_riesgo(clave_nivel_de_riesgo)
);

CREATE TABLE clave_de_status (
	clave_de_status	INTEGER NOT NULL UNIQUE,
	status	varchar(100) NOT NULL UNIQUE,
	PRIMARY KEY(clave_de_status)
);
CREATE TABLE estatus (
	clave_de_status_id	INTEGER NOT NULL,
	matricula	INTEGER NOT NULL,
	FOREIGN KEY(clave_de_status_id) REFERENCES clave_de_status(clave_de_status),
	FOREIGN KEY(matricula) REFERENCES matricula_alumno(matricula)
);
CREATE TABLE asunto (
	clave_de_asunto	INTEGER NOT NULL UNIQUE,
	asunto	varchar(100) NOT NULL UNIQUE,
	PRIMARY KEY(clave_de_asunto)
);

CREATE TABLE nombre_del_agente (
	identificador_id	varchar(100) NOT NULL UNIQUE,
	nombre_del_agente	varchar(100) NOT NULL,
	PRIMARY KEY(identificador_id)
);


CREATE TABLE IF NOT EXISTS crm (
	clave_de_llamada	varchar(100) NOT NULL UNIQUE,
	matricula_id	INTEGER,
	identificador_id	varchar(100),
	FOREIGN KEY(matricula_id) REFERENCES matricula_alumno(matricula),
	FOREIGN KEY(identificador_id) REFERENCES nombre_del_agente(identificador_id),
	PRIMARY KEY(clave_de_llamada)
);
CREATE TABLE interaccion (
	clave_de_llamada_id	varchar(100) NOT NULL,
	fecha	varchar(100) NOT NULL,
	clave_asunto_id	INTEGER NOT NULL,
	FOREIGN KEY(clave_de_llamada_id) REFERENCES crm(clave_de_llamada),
	FOREIGN KEY(clave_asunto_id) REFERENCES asunto(clave_de_asunto),
	PRIMARY KEY(fecha)
);

CREATE TABLE flokzu(
	flokzu INTEGER NOT NULL UNIQUE PRIMARY KEY,
	matricula_id INTEGER,
	FOREIGN KEY(matricula_id) REFERENCES matricula_alumno(matricula)
);

CREATE TABLE asignacion(
		matricula_id INTEGER,
		supervisor_id INTEGER,
		nivel_de_riesgo_id INTEGER,
		flokzu_id INTEGER,
		status_id INTEGER,
		llamada_id VARCHAR(100),

		FOREIGN KEY(matricula_id) REFERENCES matricula_alumno(matricula),
		FOREIGN KEY(supervisor_id) REFERENCES supervisor(clave_de_supervisor),
		FOREIGN KEY(nivel_de_riesgo_id) REFERENCES nivel_de_riesgo(clave_nivel_de_riesgo),
		FOREIGN KEY(flokzu_id) REFERENCES flokzu(flokzu),
		FOREIGN KEY(status_id) REFERENCES estatus(clave_de_status_id),
		FOREIGN KEY(llamada_id) REFERENCES interaccion(clave_de_llamada_id)



);