CREATE DATABASE plataforma_de_gestion_de_eventos;

USE plataforma_de_gestion_de_eventos;

CREATE TABLE Usuarios (
    id_usuarios INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255),
    telefono INT,
    email VARCHAR(255),
    direccion_fisica VARCHAR(255)
);
CREATE TABLE Eventos (
    id_evento INT PRIMARY KEY AUTO_INCREMENT, 
    fecha_registro DATE, 
    fecha_evento DATE, 
    lugar VARCHAR(255),
    tipo VARCHAR(255), 
    descripcion TEXT
);
 CREATE TABLE Inscripciones (
    id_usuarios INT, 
    id_evento INT, 
    PRIMARY KEY (id_usuarios, id_evento)
);

create or replace view v_all_tables as 
(select u.id_usuarios, nombre, telefono, email, direccion_fisica,
e.id_evento, fecha_registro, fecha_evento, lugar, tipo, descripcion 
from Usuarios u join Inscripciones i on u.id_usuarios = i.id_usuarios
JOIN Eventos e on e.id_evento = i.id_evento);

 INSERT INTO Usuarios (nombre, telefono, email, direccion_fisica) 
VALUES 
    ('Juan Perez', '879901010', 'juanperez@gmail.com', 'Calle 123'),
    ('Maria Gomez', '874578569', 'mariagomez@gmail.com', 'Av. Principal'),
    ('Carlos Sanchez', '875472893', 'carlossanchez@gmail.com', 'Calle 987'),
    ('Ana Marilu', '875556547', 'anamari@gmail.com', 'Plaza Principal'),
    ('Laura Martinez', '939987896', 'lauramartinez@hotmail.com', 'Calle 741'),
    ('Jose Lopez', '939333213', 'joselo@outlook.com', 'Calle 555'),
    ('Ana Gonzalez', '878882589', 'anagonza@gmail.com', 'Av Libertad'),
    ('Luis Torres', '939741234', 'josetorres@hotmail.com', 'Calle 111'),
    ('David Perez', '939951456', 'davidperez@gmail.com', 'Plaza Central'),
    ('Marta Garcia', '874120002', 'mariagarcia@yahoo.com', 'Plaza Principal');


INSERT INTO Eventos (fecha_registro, fecha_evento, lugar, tipo, descripcion) 
VALUES 
    ('2024-05-01', '2024-05-10', 'Centro de convenciones', 'Conferencia', 'Conferencia sobre tecnología'), 
    ('2024-05-02', '2024-05-15', 'Teatro Municipal', 'Concierto', 'Concierto de música clásica'),
    ('2024-05-03', '2024-05-20', 'Estadio Olímpico', 'Deporte', 'Partido de fútbol'), 
    ('2024-05-04', '2024-05-25', 'Parque Central', 'Festival', 'Festival de comida'), 
    ('2024-05-05', '2024-05-30', 'Plaza Mayor', 'Conferencia', 'Conferencia sobre negocios'), 
    ('2024-05-06', '2024-06-05', 'Auditorio Nacional', 'Concierto', 'Concierto de rock'), 
    ('2024-05-07', '2024-06-07', 'Playa del Este', 'Deporte', 'Torneo de voleibol de playa'), 
    ('2024-05-08', '2024-06-10', 'Centro Cultural', 'Festival', 'Festival de cine'), 
    ('2024-05-09', '2024-06-15', 'Estadio Municipal', 'Deporte', 'Carrera de atletismo'), 
    ('2024-05-10', '2024-06-20', 'Plaza del Oeste', 'Concierto', 'Concierto de música electrónica');

