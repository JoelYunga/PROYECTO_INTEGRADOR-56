
CREATE TABLE public.clase (
                id_clase INTEGER NOT NULL,
                clase VARCHAR(50) NOT NULL,
                CONSTRAINT clase_pk PRIMARY KEY (id_clase)
);


CREATE TABLE public.provincia (
                id_provincia INTEGER NOT NULL,
                provincia VARCHAR(50) NOT NULL,
                CONSTRAINT provincia_pk PRIMARY KEY (id_provincia)
);


CREATE TABLE public.Tipo (
                id_tipo INTEGER NOT NULL,
                tipo VARCHAR(100) NOT NULL,
                CONSTRAINT tipo_pk PRIMARY KEY (id_tipo)
);


CREATE TABLE public.sector (
                id_sec INTEGER NOT NULL,
                sector VARCHAR(100) NOT NULL,
                CONSTRAINT sector_pk PRIMARY KEY (id_sec)
);


CREATE TABLE public.entidad (
                id_ent INTEGER NOT NULL,
                entidad VARCHAR(100) NOT NULL,
                CONSTRAINT entidad_pk PRIMARY KEY (id_ent)
);


CREATE TABLE public.area (
                id_area INTEGER NOT NULL,
                area VARCHAR(30) NOT NULL,
                CONSTRAINT area_pk PRIMARY KEY (id_area)
);


CREATE TABLE public.canton (
                id_canton INTEGER NOT NULL,
                canton VARCHAR(100) NOT NULL,
                CONSTRAINT canton_pk PRIMARY KEY (id_canton)
);


CREATE TABLE public.Auditoria (
                id_auditoria INTEGER NOT NULL,
                Fecha DATE NOT NULL,
                Observacion VARCHAR(1000) NOT NULL,
                Nombre_Equipo VARCHAR(100) NOT NULL,
                Usuario VARCHAR(50) NOT NULL,
                Tabla VARCHAR(50) NOT NULL,
                CONSTRAINT auditoria_pk PRIMARY KEY (id_auditoria)
);


CREATE TABLE public.Perfil (
                Id_Perfil INTEGER NOT NULL,
                Descripcion VARCHAR(20) NOT NULL,
                CONSTRAINT perfil_pk PRIMARY KEY (Id_Perfil)
);


CREATE TABLE public.usuario (
                Id_usuario INTEGER NOT NULL,
                Id_Perfil INTEGER NOT NULL,
                usuario VARCHAR(30) NOT NULL,
                correo VARCHAR(50) NOT NULL,
                contraseña VARCHAR(50) NOT NULL,
                CONSTRAINT usuario_pk PRIMARY KEY (Id_usuario)
);


CREATE TABLE public.establecimiento (
                id_establecimiento INTEGER NOT NULL,
                id_ent INTEGER NOT NULL,
                id_sec INTEGER NOT NULL,
                id_tipo INTEGER NOT NULL,
                id_clase INTEGER NOT NULL,
                CONSTRAINT establecimiento_pk PRIMARY KEY (id_establecimiento)
);


CREATE TABLE public.ubicacion (
                id_ubicacion INTEGER NOT NULL,
                id_canton INTEGER NOT NULL,
                id_area INTEGER NOT NULL,
                id_provincia INTEGER NOT NULL,
                CONSTRAINT ubicacion_pk PRIMARY KEY (id_ubicacion)
);


CREATE TABLE public.Cabezera (
                id_c INTEGER NOT NULL,
                id_ubicacion INTEGER NOT NULL,
                id_establecimiento INTEGER NOT NULL,
                fecha DATE NOT NULL,
                CONSTRAINT cabezera_pk PRIMARY KEY (id_c)
);


CREATE TABLE public.Fallecidos (
                ID_fallecidos INTEGER NOT NULL,
                Fallecidos_en_menos_de_48_horas INTEGER NOT NULL,
                Fallecidos_en_mas_de_48_horas INTEGER NOT NULL,
                id_c INTEGER NOT NULL,
                CONSTRAINT fallecidos_pk PRIMARY KEY (ID_fallecidos)
);


CREATE TABLE public.Estadia (
                ID_Estadia INTEGER NOT NULL,
                Dias_de_estada INTEGER NOT NULL,
                Días_cama_disponibles INTEGER NOT NULL,
                Total_de_egreso_hospitalarios INTEGER NOT NULL,
                id_c INTEGER NOT NULL,
                CONSTRAINT estadia_pk PRIMARY KEY (ID_Estadia)
);


CREATE TABLE public.Camas (
                id_camas INTEGER NOT NULL,
                Total_Dotación_normal INTEGER NOT NULL,
                Total_Camas_Disponibles INTEGER NOT NULL,
                Camas_de_cuidados_intermedios INTEGER NOT NULL,
                Camas_de_emergencia INTEGER NOT NULL,
                Camas_de_cuidados_intensivos INTEGER NOT NULL,
                Camas_de_otros_servicios_de_apoyo INTEGER NOT NULL,
                id_c INTEGER NOT NULL,
                CONSTRAINT camas_pk PRIMARY KEY (id_camas)
);


ALTER TABLE public.establecimiento ADD CONSTRAINT clase_clase_fk
FOREIGN KEY (id_clase)
REFERENCES public.clase (id_clase)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ubicacion ADD CONSTRAINT provincia_ubicacion_fk
FOREIGN KEY (id_provincia)
REFERENCES public.provincia (id_provincia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.establecimiento ADD CONSTRAINT tipo_clase_fk
FOREIGN KEY (id_tipo)
REFERENCES public.Tipo (id_tipo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.establecimiento ADD CONSTRAINT sector_clase_fk
FOREIGN KEY (id_sec)
REFERENCES public.sector (id_sec)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.establecimiento ADD CONSTRAINT entidad_clase_fk
FOREIGN KEY (id_ent)
REFERENCES public.entidad (id_ent)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ubicacion ADD CONSTRAINT area_provincia_fk
FOREIGN KEY (id_area)
REFERENCES public.area (id_area)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ubicacion ADD CONSTRAINT canton_provincia_fk
FOREIGN KEY (id_canton)
REFERENCES public.canton (id_canton)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.usuario ADD CONSTRAINT perfil_usuario_fk
FOREIGN KEY (Id_Perfil)
REFERENCES public.Perfil (Id_Perfil)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Cabezera ADD CONSTRAINT establecimiento_cabezera_fk
FOREIGN KEY (id_establecimiento)
REFERENCES public.establecimiento (id_establecimiento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Cabezera ADD CONSTRAINT ubicacion_cabezera_fk
FOREIGN KEY (id_ubicacion)
REFERENCES public.ubicacion (id_ubicacion)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Camas ADD CONSTRAINT cabezera_camas_fk
FOREIGN KEY (id_c)
REFERENCES public.Cabezera (id_c)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Estadia ADD CONSTRAINT cabezera_estadia_fk
FOREIGN KEY (id_c)
REFERENCES public.Cabezera (id_c)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Fallecidos ADD CONSTRAINT cabezera_fallecidos_fk
FOREIGN KEY (id_c)
REFERENCES public.Cabezera (id_c)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
