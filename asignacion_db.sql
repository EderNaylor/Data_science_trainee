

CREATE TABLE clave_supervisor (
	clave_de_supervisor INTEGER NOT NULL UNIQUE PRIMARY KEY,
	nombre_de_supervisor VARCHAR(100)	NOT NULL
);

CREATE TABLE Asignacion (
	Matricula	INTEGER NOT NULL UNIQUE PRIMARY KEY
);

CREATE TABLE supervisor (
	clave_de_supervisor	INTEGER,
	Matricula	INTEGER,
	CONSTRAINT fk_Asignacion_supervisor
	FOREIGN KEY(Matricula) REFERENCES Asignacion(Matricula),
	FOREIGN KEY(clave_de_supervisor) REFERENCES clave_supervisor(clave_de_supervisor)
);

CREATE TABLE clave_nivel_de_riesgo (
	clave_nivel_de_riesgo	INTEGER NOT NULL UNIQUE PRIMARY KEY,
	nivel_de_riesgo	VARCHAR(50) NOT NULL
);


CREATE TABLE nivel_de_riesgo (
	clave_nivel_de_riesgo	INTEGER NOT NULL,
	matricula_id	INTEGER NOT NULL,
	FOREIGN KEY(matricula_id) REFERENCES Asignacion(Matricula),
	FOREIGN KEY(clave_nivel_de_riesgo) REFERENCES clave_nivel_de_riesgo(clave_nivel_de_riesgo)
);



CREATE TABLE clave_de_status (
	clave_de_status	INTEGER NOT NULL UNIQUE,
	status	varchar(100) NOT NULL UNIQUE,
	PRIMARY KEY(clave_de_status)
);
CREATE TABLE status (
	clave_de_status_id	INTEGER NOT NULL,
	matricula	INTEGER NOT NULL,
	FOREIGN KEY(clave_de_status_id) REFERENCES clave_de_status(clave_de_status),
	FOREIGN KEY(matricula) REFERENCES Asignacion(Matricula)
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
	FOREIGN KEY(matricula_id) REFERENCES Asignacion(Matricula),
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
CREATE TABLE nombre_del_alumno (
	email	varchar(100) NOT NULL UNIQUE,
	nombre_del_alumno	varchar(100) NOT NULL,
	matricula_id	INTEGER NOT NULL,
	PRIMARY KEY(email),
	FOREIGN KEY(matricula_id) REFERENCES Asignacion(Matricula)
);


CREATE TABLE flokzu(
	flokzu INTEGER NOT NULL UNIQUE PRIMARY KEY,
	matricula_id INTEGER,
	FOREIGN KEY(matricula_id) REFERENCES Asignacion(Matricula)
);
