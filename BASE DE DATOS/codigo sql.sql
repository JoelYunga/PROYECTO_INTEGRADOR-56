
CREATE TABLE ubicación (
                ID_Provincia VARCHAR(30) NOT NULL,
                Provincia VARCHAR(30) NOT NULL,
                Canton VARCHAR(30) NOT NULL,
                Parroquia VARCHAR(30) NOT NULL,
                CONSTRAINT ubicaci_n_pk PRIMARY KEY (ID_Provincia)
);


CREATE TABLE Cabezera_historica (
                año VARCHAR(30) NOT NULL,
                Nombre_del_Conjunto_de_Datos VARCHAR(30) NOT NULL,
                ID_Provincia VARCHAR(30) NOT NULL,
                CONSTRAINT cabezera_historica_pk PRIMARY KEY (año)
);


CREATE TABLE Area_Medicina (
                ID_Area VARCHAR(30) NOT NULL,
                Medica_interna_dotacion_normal_total VARCHAR(30) NOT NULL,
                Medicina_interna_disponibles VARCHAR(30) NOT NULL,
                Cirugia_dotacion_normal VARCHAR(30) NOT NULL,
                Cirugia_Disponibles VARCHAR(30) NOT NULL,
                Ginecologia_Obstetricia_Dotacion_normal_total VARCHAR(30) NOT NULL,
                Ginecologia_Obstetricia_disponibles VARCHAR(30) NOT NULL,
                Pediatria_Dotacion_Normal_Total VARCHAR(30) NOT NULL,
                Pediatria_disponibles VARCHAR(30) NOT NULL,
                Neonatologia_Dotacion_Normal_Total VARCHAR(30) NOT NULL,
                Neonatologia_disponibles VARCHAR(30) NOT NULL,
                Cardiologia_Dotacion_Total_Normal VARCHAR(30) NOT NULL,
                Cardiologia_disponibles VARCHAR(30) NOT NULL,
                Neumologia_Dotacion_Normal_Total VARCHAR(30) NOT NULL,
                Neumologia_disponibles VARCHAR(30) NOT NULL,
                Psiquiatria_Dotacion_Normal_Total VARCHAR(30) NOT NULL,
                Psiquiatria_disponibles VARCHAR(30) NOT NULL,
                Infectología_Dotación_Normal_total VARCHAR(30) NOT NULL,
                Oftalmología_Disponibles VARCHAR(30) NOT NULL,
                Gastroenterología_Dotación_Normal_total VARCHAR(30) NOT NULL,
                Urología_Dotación_Normal_total  VARCHAR(30) NOT NULL,
                Urología_Disponibles VARCHAR(30) NOT NULL,
                Otorrinolaringología_Dotación_Normal_total VARCHAR(30) NOT NULL,
                Oftalmología_Dotación_Normal_total VARCHAR(30) NOT NULL,
                Infectología_Disponibles VARCHAR(30) NOT NULL,
                Otorrinolaringología_Disponibles VARCHAR(30) NOT NULL,
                Gastroenterología_Disponibles VARCHAR(30) NOT NULL,
                Traumatologia_Dotacion_Normal_total VARCHAR(30) NOT NULL,
                Traumatologia_disponibles VARCHAR(30) NOT NULL,
                Otros_Servicios_Dotacion_Normal_Total VARCHAR(30) NOT NULL,
                Otros_servicios_disponibles VARCHAR(30) NOT NULL,
                Servicios_Indiferenciados_Dotacion_Normal_Total VARCHAR(30) NOT NULL,
                Servicios_Indiferenciados_disponibles VARCHAR(30) NOT NULL,
                ID_Provincia VARCHAR(30) NOT NULL,
                año VARCHAR(30) NOT NULL,
                CONSTRAINT area_medicina_pk PRIMARY KEY (ID_Area)
);


CREATE TABLE Camas_disponibles (
                ID_Camas VARCHAR(30) NOT NULL,
                Total_Dotación_normal VARCHAR(30) NOT NULL,
                Dias_de_estada VARCHAR(30) NOT NULL,
                Total_Camas_Disponibles VARCHAR(30) NOT NULL,
                Camas_de_cuidados_intermedios VARCHAR(30) NOT NULL,
                Camas_de_emergencia VARCHAR(30) NOT NULL,
                Días_cama_disponibles VARCHAR(30) NOT NULL,
                Camas_de_cuidados_intensivos VARCHAR(30) NOT NULL,
                Camas_de_otros_servicios_de_apoyo VARCHAR(30) NOT NULL,
                ID_Area VARCHAR(30) NOT NULL,
                año VARCHAR(30) NOT NULL,
                CONSTRAINT camas_disponibles_pk PRIMARY KEY (ID_Camas)
);


CREATE TABLE Estadia (
                ID_Estadia VARCHAR(30) NOT NULL,
                Dias_de_estada VARCHAR(30) NOT NULL,
                Días_cama_disponibles VARCHAR(30) NOT NULL,
                Total_de_egreso_hospitalarios VARCHAR(30) NOT NULL,
                ID_Camas VARCHAR(30) NOT NULL,
                año VARCHAR(30) NOT NULL,
                CONSTRAINT estadia_pk PRIMARY KEY (ID_Estadia)
);


CREATE TABLE clase (
                ID_Clase VARCHAR(30) NOT NULL,
                Clase_establecimiento VARCHAR(30) NOT NULL,
                Tipo_establecimiento VARCHAR(30) NOT NULL,
                Entidad_establecimiento VARCHAR(30) NOT NULL,
                Sector_establecimiento VARCHAR(30) NOT NULL,
                ID_Estadia VARCHAR(30) NOT NULL,
                año VARCHAR(30) NOT NULL,
                CONSTRAINT clase_pk PRIMARY KEY (ID_Clase)
);


CREATE TABLE Fallecidos (
                ID_facllecidos VARCHAR(30) NOT NULL,
                Fallecidos_en_menos_de_48_horas VARCHAR(30) NOT NULL,
                Fallecidos_en_mas_de_48_horas VARCHAR(30) NOT NULL,
                ID_Provincia VARCHAR(30) NOT NULL,
                ID_Clase VARCHAR(30) NOT NULL,
                año VARCHAR(30) NOT NULL,
                CONSTRAINT fallecidos_pk PRIMARY KEY (ID_facllecidos)
);


ALTER TABLE Fallecidos ADD CONSTRAINT ubicaci_n_fallecidos_fk
FOREIGN KEY (ID_Provincia)
REFERENCES ubicación (ID_Provincia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Area_Medicina ADD CONSTRAINT ubicaci_n_area_medicina_fk
FOREIGN KEY (ID_Provincia)
REFERENCES ubicación (ID_Provincia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Cabezera_historica ADD CONSTRAINT ubicaci_n_cabezera_historica_fk
FOREIGN KEY (ID_Provincia)
REFERENCES ubicación (ID_Provincia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Area_Medicina ADD CONSTRAINT cabezera_historica_area_medicina_fk
FOREIGN KEY (año)
REFERENCES Cabezera_historica (año)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Camas_disponibles ADD CONSTRAINT cabezera_historica_camas_disponibles_fk
FOREIGN KEY (año)
REFERENCES Cabezera_historica (año)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Estadia ADD CONSTRAINT cabezera_historica_estadia_fk
FOREIGN KEY (año)
REFERENCES Cabezera_historica (año)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE clase ADD CONSTRAINT cabezera_historica_clase_fk
FOREIGN KEY (año)
REFERENCES Cabezera_historica (año)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Fallecidos ADD CONSTRAINT cabezera_historica_fallecidos_fk
FOREIGN KEY (año)
REFERENCES Cabezera_historica (año)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Camas_disponibles ADD CONSTRAINT area_medicina_camas_disponibles_fk
FOREIGN KEY (ID_Area)
REFERENCES Area_Medicina (ID_Area)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Estadia ADD CONSTRAINT camas_disponibles_estadia_fk
FOREIGN KEY (ID_Camas)
REFERENCES Camas_disponibles (ID_Camas)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE clase ADD CONSTRAINT estadia_clase_fk
FOREIGN KEY (ID_Estadia)
REFERENCES Estadia (ID_Estadia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Fallecidos ADD CONSTRAINT clase_fallecidos_fk
FOREIGN KEY (ID_Clase)
REFERENCES clase (ID_Clase)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
