USE [baseproyecto]
GO

-- tables
-- Table: categoria
CREATE TABLE categoria (
    categoria_id numeric(19,0)  NOT NULL IDENTITY(1, 1),
    categoria varchar(50)  NOT NULL,
    fecha_creacion datetime  NOT NULL,
    CONSTRAINT categoria_pk PRIMARY KEY  (categoria_id)
);

-- Table: empleado
CREATE TABLE empleado (
    empleado_id numeric(19,0)  NOT NULL IDENTITY(1, 1),
    manager_id numeric(19,0)  NULL,
    categoria_id numeric(19,0)  NOT NULL,
    nombres varchar(100)  NOT NULL,
    apellidos varchar(100)  NOT NULL,
    fecha_nacimiento date  NOT NULL,
    genero varchar(1)  NOT NULL,
    email varchar(50)  NOT NULL,
    activo int  NOT NULL,
    fecha_creacion datetime  NOT NULL,
    CONSTRAINT empleado_pk PRIMARY KEY  (empleado_id)
);

-- Table: pais
CREATE TABLE pais (
    pais_id numeric(19,0)  NOT NULL IDENTITY(1, 1),
    pais varchar(50)  NOT NULL,
    activo int  NOT NULL DEFAULT 1,
    fecha_creacion datetime  NOT NULL,
    CONSTRAINT pais_pk PRIMARY KEY  (pais_id)
);

-- Table: region
CREATE TABLE region (
    region_id numeric(19,0)  NOT NULL IDENTITY(1, 1),
    pais_id numeric(19,0)  NOT NULL,
    region varchar(50)  NOT NULL,
    activo int  NOT NULL DEFAULT 1,
    fecha_creacion datetime  NOT NULL,
    CONSTRAINT region_pk PRIMARY KEY  (region_id)
);

-- Table: rotacion_personal
CREATE TABLE rotacion_personal (
    rotacion_personal_id numeric(19,0)  NOT NULL IDENTITY(1, 1),
    tienda_tienda_id numeric(19,0)  NOT NULL,
    empleado_empleado_id numeric(19,0)  NOT NULL,
    dia_laboral varchar(25)  NOT NULL,
    CONSTRAINT rotacion_personal_pk PRIMARY KEY  (rotacion_personal_id)
);

-- Table: salario
CREATE TABLE salario (
    salario_id numeric(19,0)  NOT NULL IDENTITY(1, 1),
    empleado_id numeric(19,0)  NOT NULL,
    monto decimal(14,2)  NOT NULL,
    fecha_pago datetime  NOT NULL,
    fecha_creacion datetime  NOT NULL,
    CONSTRAINT salario_pk PRIMARY KEY  (salario_id)
);

-- Table: tienda
CREATE TABLE tienda (
    tienda_id numeric(19,0)  NOT NULL IDENTITY(1, 1),
    region_id numeric(19,0)  NOT NULL,
    nombre varchar(50)  NOT NULL,
    telefono numeric(8,0)  NOT NULL,
    fecha_creacion datetime  NOT NULL,
    CONSTRAINT tienda_pk PRIMARY KEY  (tienda_id)
);

-- foreign keys
-- Reference: empleado_categoria (table: empleado)
ALTER TABLE empleado ADD CONSTRAINT empleado_categoria
    FOREIGN KEY (categoria_id)
    REFERENCES categoria (categoria_id);

-- Reference: manager_empleado (table: empleado)
ALTER TABLE empleado ADD CONSTRAINT manager_empleado
    FOREIGN KEY (manager_id)
    REFERENCES empleado (empleado_id);

-- Reference: pago_empleado (table: salario)
ALTER TABLE salario ADD CONSTRAINT pago_empleado
    FOREIGN KEY (empleado_id)
    REFERENCES empleado (empleado_id);

-- Reference: region_pais (table: region)
ALTER TABLE region ADD CONSTRAINT region_pais
    FOREIGN KEY (pais_id)
    REFERENCES pais (pais_id);

-- Reference: rotacion_personal_empleado (table: rotacion_personal)
ALTER TABLE rotacion_personal ADD CONSTRAINT rotacion_personal_empleado
    FOREIGN KEY (empleado_empleado_id)
    REFERENCES empleado (empleado_id);

-- Reference: rotacion_personal_tienda (table: rotacion_personal)
ALTER TABLE rotacion_personal ADD CONSTRAINT rotacion_personal_tienda
    FOREIGN KEY (tienda_tienda_id)
    REFERENCES tienda (tienda_id);

-- Reference: tienda_region (table: tienda)
ALTER TABLE tienda ADD CONSTRAINT tienda_region
    FOREIGN KEY (region_id)
    REFERENCES region (region_id);

-- End of file.

GO

INSERT INTO [dbo].[pais] ([pais] ,[activo] ,[fecha_creacion]) VALUES ('Estados Unidos', 1, GETDATE())
INSERT INTO [dbo].[pais] ([pais] ,[activo] ,[fecha_creacion]) VALUES ('España', 1, GETDATE())
INSERT INTO [dbo].[pais] ([pais] ,[activo] ,[fecha_creacion]) VALUES ('Alemania', 1, GETDATE())
INSERT INTO [dbo].[pais] ([pais] ,[activo] ,[fecha_creacion]) VALUES ('Francia', 1, GETDATE())
INSERT INTO [dbo].[pais] ([pais] ,[activo] ,[fecha_creacion]) VALUES ('Dinamarca', 1, GETDATE())
INSERT INTO [dbo].[pais] ([pais] ,[activo] ,[fecha_creacion]) VALUES ('Canadá', 1, GETDATE())

GO

INSERT INTO [dbo].[region] ([pais_id],[region],[activo],[fecha_creacion]) VALUES (1, 'Centro', 1, GETDATE())
INSERT INTO [dbo].[region] ([pais_id],[region],[activo],[fecha_creacion]) VALUES (1, 'Oriente', 1, GETDATE())
INSERT INTO [dbo].[region] ([pais_id],[region],[activo],[fecha_creacion]) VALUES (1, 'Occidente', 1, GETDATE())
INSERT INTO [dbo].[region] ([pais_id],[region],[activo],[fecha_creacion]) VALUES (1, 'Norte', 1, GETDATE())
INSERT INTO [dbo].[region] ([pais_id],[region],[activo],[fecha_creacion]) VALUES (1, 'Sur', 1, GETDATE())
INSERT INTO [dbo].[region] ([pais_id],[region],[activo],[fecha_creacion]) VALUES (2, 'Andalucía', 1, GETDATE())
INSERT INTO [dbo].[region] ([pais_id],[region],[activo],[fecha_creacion]) VALUES (2, 'Valencia', 1, GETDATE())
INSERT INTO [dbo].[region] ([pais_id],[region],[activo],[fecha_creacion]) VALUES (2, 'Cataluña', 1, GETDATE())
INSERT INTO [dbo].[region] ([pais_id],[region],[activo],[fecha_creacion]) VALUES (2, 'Galicia', 1, GETDATE())
INSERT INTO [dbo].[region] ([pais_id],[region],[activo],[fecha_creacion]) VALUES (6, 'Columbia Británica', 1, GETDATE())
INSERT INTO [dbo].[region] ([pais_id],[region],[activo],[fecha_creacion]) VALUES (6, 'Saskatchewan', 1, GETDATE())
INSERT INTO [dbo].[region] ([pais_id],[region],[activo],[fecha_creacion]) VALUES (6, 'Ontario', 1, GETDATE())
INSERT INTO [dbo].[region] ([pais_id],[region],[activo],[fecha_creacion]) VALUES (6, 'Quebec', 1, GETDATE())
INSERT INTO [dbo].[region] ([pais_id],[region],[activo],[fecha_creacion]) VALUES (6, 'Nueva Escocia', 1, GETDATE())

GO

INSERT INTO [dbo].[categoria] ([categoria],[fecha_creacion]) VALUES ('Gerente', GETDATE())
INSERT INTO [dbo].[categoria] ([categoria],[fecha_creacion]) VALUES ('Jefe de departamento', GETDATE())
INSERT INTO [dbo].[categoria] ([categoria],[fecha_creacion]) VALUES ('Vendedor', GETDATE())
INSERT INTO [dbo].[categoria] ([categoria],[fecha_creacion]) VALUES ('Cajero', GETDATE())
INSERT INTO [dbo].[categoria] ([categoria],[fecha_creacion]) VALUES ('Transportista', GETDATE())
INSERT INTO [dbo].[categoria] ([categoria],[fecha_creacion]) VALUES ('Vigilante', GETDATE())

GO

INSERT INTO [dbo].[empleado] ([manager_id],[categoria_id],[nombres],[apellidos],[fecha_nacimiento],[genero],[email],[activo],[fecha_creacion]) VALUES (null,1,'Seana','Gilleon',CAST('08/08/1980' AS DATE),'F','sgilleon0@wordpress.com',1,GETDATE())
INSERT INTO [dbo].[empleado] ([manager_id],[categoria_id],[nombres],[apellidos],[fecha_nacimiento],[genero],[email],[activo],[fecha_creacion]) VALUES (1,2,'Ludovico','Halbord',CAST('03/18/1996' AS DATE),'M','lhalbord1@ameblo.jp',1,GETDATE())
INSERT INTO [dbo].[empleado] ([manager_id],[categoria_id],[nombres],[apellidos],[fecha_nacimiento],[genero],[email],[activo],[fecha_creacion]) VALUES (1,2,'Helenelizabeth','Hopfner',CAST('02/28/1990' AS DATE),'F','hhopfner2@ucsd.edu',1,GETDATE())
INSERT INTO [dbo].[empleado] ([manager_id],[categoria_id],[nombres],[apellidos],[fecha_nacimiento],[genero],[email],[activo],[fecha_creacion]) VALUES (1,2,'Oran','Upston',CAST('03/17/1996' AS DATE),'M','oupston3@howstuffworks.com',1,GETDATE())
INSERT INTO [dbo].[empleado] ([manager_id],[categoria_id],[nombres],[apellidos],[fecha_nacimiento],[genero],[email],[activo],[fecha_creacion]) VALUES (2,3,'Cherida','Halworth',CAST('05/25/1981' AS DATE),'F','chalworth4@fc2.com',1,GETDATE())
INSERT INTO [dbo].[empleado] ([manager_id],[categoria_id],[nombres],[apellidos],[fecha_nacimiento],[genero],[email],[activo],[fecha_creacion]) VALUES (3,3,'Kin','Shyres',CAST('11/12/1985' AS DATE),'M','kshyres5@google.com.hk',1,GETDATE())
INSERT INTO [dbo].[empleado] ([manager_id],[categoria_id],[nombres],[apellidos],[fecha_nacimiento],[genero],[email],[activo],[fecha_creacion]) VALUES (4,3,'Homerus','Lanfer',CAST('03/30/1992' AS DATE),'M','hlanfer6@businessweek.com',1,GETDATE())
INSERT INTO [dbo].[empleado] ([manager_id],[categoria_id],[nombres],[apellidos],[fecha_nacimiento],[genero],[email],[activo],[fecha_creacion]) VALUES (2,4,'Norrie','Whipple',CAST('11/23/1991' AS DATE),'M','nwhipple7@seesaa.net',1,GETDATE())
INSERT INTO [dbo].[empleado] ([manager_id],[categoria_id],[nombres],[apellidos],[fecha_nacimiento],[genero],[email],[activo],[fecha_creacion]) VALUES (3,4,'Meryl','Temporal',CAST('08/21/1996' AS DATE),'F','mtemporal8@unicef.org',1,GETDATE())
INSERT INTO [dbo].[empleado] ([manager_id],[categoria_id],[nombres],[apellidos],[fecha_nacimiento],[genero],[email],[activo],[fecha_creacion]) VALUES (4,4,'Locke','Flockhart',CAST('11/28/1986' AS DATE),'M','lflockhart9@illinois.edu',1,GETDATE())
INSERT INTO [dbo].[empleado] ([manager_id],[categoria_id],[nombres],[apellidos],[fecha_nacimiento],[genero],[email],[activo],[fecha_creacion]) VALUES (2,5,'Hinze','Muro',CAST('12/14/1992' AS DATE),'M','hmuroa@who.int',1,GETDATE())
INSERT INTO [dbo].[empleado] ([manager_id],[categoria_id],[nombres],[apellidos],[fecha_nacimiento],[genero],[email],[activo],[fecha_creacion]) VALUES (3,5,'Dulcy','Burnell',CAST('05/02/1995' AS DATE),'F','dburnellb@diigo.com',1,GETDATE())
INSERT INTO [dbo].[empleado] ([manager_id],[categoria_id],[nombres],[apellidos],[fecha_nacimiento],[genero],[email],[activo],[fecha_creacion]) VALUES (2,6,'Judah','Phonix',CAST('12/08/1996' AS DATE),'M','jphonixc@chicagotribune.com',1,GETDATE())
INSERT INTO [dbo].[empleado] ([manager_id],[categoria_id],[nombres],[apellidos],[fecha_nacimiento],[genero],[email],[activo],[fecha_creacion]) VALUES (3,6,'Elvina','Gerin',CAST('09/25/1987' AS DATE),'F','egerind@mit.edu',1,GETDATE())
INSERT INTO [dbo].[empleado] ([manager_id],[categoria_id],[nombres],[apellidos],[fecha_nacimiento],[genero],[email],[activo],[fecha_creacion]) VALUES (4,6,'Helaina','Brodhead',CAST('03/12/1985' AS DATE),'F','hbrodheade@rakuten.co.jp',1,GETDATE())

GO

INSERT INTO [dbo].[tienda] ([region_id],[nombre],[telefono],[fecha_creacion]) VALUES (6,'Privet Aluche',66134473,GETDATE())
INSERT INTO [dbo].[tienda] ([region_id],[nombre],[telefono],[fecha_creacion]) VALUES (7,'Carrefour Express',91520960,GETDATE())
INSERT INTO [dbo].[tienda] ([region_id],[nombre],[telefono],[fecha_creacion]) VALUES (8,'Jiménez Textil',91565710,GETDATE())

GO

INSERT INTO [dbo].[salario] ([empleado_id],[monto],[fecha_pago],[fecha_creacion]) VALUES (1,2959.64,CAST('07/02/2021' AS DATE),GETDATE())
INSERT INTO [dbo].[salario] ([empleado_id],[monto],[fecha_pago],[fecha_creacion]) VALUES (2,2304.8,CAST('01/01/2021' AS DATE),GETDATE())
INSERT INTO [dbo].[salario] ([empleado_id],[monto],[fecha_pago],[fecha_creacion]) VALUES (3,2418.78,CAST('07/31/2021' AS DATE),GETDATE())
INSERT INTO [dbo].[salario] ([empleado_id],[monto],[fecha_pago],[fecha_creacion]) VALUES (4,2755.47,CAST('12/17/2021' AS DATE),GETDATE())
INSERT INTO [dbo].[salario] ([empleado_id],[monto],[fecha_pago],[fecha_creacion]) VALUES (5,782.39,CAST('09/05/2021' AS DATE),GETDATE())
INSERT INTO [dbo].[salario] ([empleado_id],[monto],[fecha_pago],[fecha_creacion]) VALUES (6,920.13,CAST('08/04/2021' AS DATE),GETDATE())
INSERT INTO [dbo].[salario] ([empleado_id],[monto],[fecha_pago],[fecha_creacion]) VALUES (7,1867.02,CAST('02/08/2021' AS DATE),GETDATE())
INSERT INTO [dbo].[salario] ([empleado_id],[monto],[fecha_pago],[fecha_creacion]) VALUES (8,1137.58,CAST('10/12/2021' AS DATE),GETDATE())
INSERT INTO [dbo].[salario] ([empleado_id],[monto],[fecha_pago],[fecha_creacion]) VALUES (9,1852.64,CAST('03/22/2021' AS DATE),GETDATE())
INSERT INTO [dbo].[salario] ([empleado_id],[monto],[fecha_pago],[fecha_creacion]) VALUES (10,1379.09,CAST('05/18/2021' AS DATE),GETDATE())
INSERT INTO [dbo].[salario] ([empleado_id],[monto],[fecha_pago],[fecha_creacion]) VALUES (11,1185.25,CAST('05/18/2021' AS DATE),GETDATE())
INSERT INTO [dbo].[salario] ([empleado_id],[monto],[fecha_pago],[fecha_creacion]) VALUES (12,830.0,CAST('12/27/2021' AS DATE),GETDATE())
INSERT INTO [dbo].[salario] ([empleado_id],[monto],[fecha_pago],[fecha_creacion]) VALUES (13,716.92,CAST('11/05/2021' AS DATE),GETDATE())
INSERT INTO [dbo].[salario] ([empleado_id],[monto],[fecha_pago],[fecha_creacion]) VALUES (14,453.41,CAST('04/23/2021' AS DATE),GETDATE())
INSERT INTO [dbo].[salario] ([empleado_id],[monto],[fecha_pago],[fecha_creacion]) VALUES (15,291.34,CAST('02/09/2021' AS DATE),GETDATE())

GO

INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,1,'Lunes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,1,'Martes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,1,'Miércoles')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,1,'Jueves')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,1,'Viernes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,2,'Lunes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,2,'Martes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,2,'Miércoles')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,2,'Jueves')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,2,'Viernes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,3,'Lunes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,3,'Martes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,3,'Miércoles')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,3,'Jueves')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,3,'Viernes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,4,'Lunes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,4,'Martes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,4,'Miércoles')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,4,'Jueves')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,4,'Viernes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,5,'Lunes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,5,'Martes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,5,'Miércoles')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,5,'Jueves')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,5,'Viernes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,6,'Lunes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,6,'Martes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,6,'Miércoles')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,6,'Jueves')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,6,'Viernes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,7,'Lunes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,7,'Martes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,7,'Miércoles')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,7,'Jueves')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,7,'Viernes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,8,'Lunes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,8,'Martes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,8,'Miércoles')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,8,'Jueves')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,8,'Viernes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,9,'Lunes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,9,'Martes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,9,'Miércoles')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,9,'Jueves')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,9,'Viernes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,10,'Lunes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,10,'Martes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,10,'Miércoles')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,10,'Jueves')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,10,'Viernes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,11,'Lunes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,11,'Martes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,11,'Miércoles')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,11,'Jueves')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,11,'Viernes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,12,'Lunes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,12,'Martes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,12,'Miércoles')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,12,'Jueves')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,12,'Viernes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,13,'Lunes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,13,'Martes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,13,'Miércoles')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,13,'Jueves')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,13,'Viernes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,14,'Lunes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,14,'Martes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,14,'Miércoles')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,14,'Jueves')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,14,'Viernes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,15,'Lunes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,15,'Martes')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (1,15,'Miércoles')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (2,15,'Jueves')
INSERT INTO [dbo].[rotacion_personal] ([tienda_tienda_id],[empleado_empleado_id],[dia_laboral]) VALUES (3,15,'Viernes')

GO
