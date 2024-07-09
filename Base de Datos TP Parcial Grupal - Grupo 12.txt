CREATE DATABASE BaseCargaAlumnos;
GO

USE BaseCargaAlumnos;
GO

CREATE TABLE TablaCargaAlumno (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Apellido VARCHAR(50) NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Dni int NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Turno VARCHAR(50) NOT NULL 

);
GO

select * from TablaCargaAlumno;

CREATE TABLE Comentarios (
    idComentario INT IDENTITY(1,1) PRIMARY KEY,
    DNI INT NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    ComentarioTexto VARCHAR(1500) NOT NULL,
    FOREIGN KEY (idComentario) REFERENCES TablaCargaAlumno(ID)
); 
GO

select * from Comentarios;