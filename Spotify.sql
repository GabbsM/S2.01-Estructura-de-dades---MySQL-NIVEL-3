CREATE TABLE IF NOT EXISTS usuario_free
(
    id INT NOT NULL,
    mail VARCHAR(60),
    password VARCHAR(60),
    nombre_usuario VARCHAR(60),
    fecha_nacimiento VARCHAR(60),
    sexo VARCHAR(60),
    pais VARCHAR(60),
    codigo_postal VARCHAR(60),
    artista_id INT,
    cancion_id INT,
    album_id INT,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS usuario_premium
(
    id INT NOT NULL,
    mail VARCHAR(60),
    password VARCHAR(60),
    nombre_usuario VARCHAR(60),
    fecha_nacimiento VARCHAR(60),
    sexo VARCHAR(60),
    pais VARCHAR(60),
    codigo_postal VARCHAR(60),
    suscripcion_id INT,
    pagos_numero_orden INT,
    playlist_id INT,
    album_id INT,
    artista_id INT,
    cancion_id INT,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS suscripcion
(
    id INT NOT NULL,
    fecha_inicio DATE,
    fecha_renovacion DATE,
    forma_pago VARCHAR(50),
    tarjeta_credito_numero INT,
    paypal_nombre_usuario VARCHAR(50),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS tarjeta_credito
(
    numero INT NOT NULL,
    mes_anio_caducidad VARCHAR(50),
    PRIMARY KEY(numero)
);

CREATE TABLE IF NOT EXISTS paypal
(
    nombre_usuario VARCHAR(50) NOT NULL,
    PRIMARY KEY(nombre_usuario)
);

CREATE TABLE IF NOT EXISTS pagos
(
    numero_orden INT NOT NULL,
    fecha DATE,
    total INT,
    PRIMARY KEY(numero_orden)
);

CREATE TABLE IF NOT EXISTS playlist
(
    id INT NOT NULL,
    titulo VARCHAR(50),
    num_canciones INT,
    fecha_creacion DATE,
    estado VARCHAR(50),
    agregada_por VARCHAR(50),
    album_id INT,
    cancion_id INT,
    artista_id INT,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS album
(
    id INT NOT NULL,
    titulo VARCHAR(50),
    favorito VARCHAR(50),
    cancion_id INT,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS artista
(
    id INT NOT NULL,
    nombre VARCHAR(50),
    favorito VARCHAR(50),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS cancion
(
    id INT NOT NULL,
    nombre VARCHAR(50),
    favorita VARCHAR(50),
    artista_id INT,
    PRIMARY KEY(id)
);


# Create FKs
ALTER TABLE usuario_premium
    ADD    FOREIGN KEY (suscripcion_id)
    REFERENCES suscripcion(id)
;
    
ALTER TABLE suscripcion
    ADD    FOREIGN KEY (tarjeta_credito_numero)
    REFERENCES tarjeta_credito(numero)
;
    
ALTER TABLE suscripcion
    ADD    FOREIGN KEY (paypal_nombre_usuario)
    REFERENCES paypal(nombre_usuario)
;
    
ALTER TABLE usuario_premium
    ADD    FOREIGN KEY (pagos_numero_orden)
    REFERENCES pagos(numero_orden)
;
    
ALTER TABLE playlist
    ADD    FOREIGN KEY (album_id)
    REFERENCES album(id)
;
    
ALTER TABLE playlist
    ADD    FOREIGN KEY (cancion_id)
    REFERENCES cancion(id)
;
    
ALTER TABLE playlist
    ADD    FOREIGN KEY (artista_id)
    REFERENCES artista(id)
;
    
ALTER TABLE usuario_premium
    ADD    FOREIGN KEY (playlist_id)
    REFERENCES playlist(id)
;
    
ALTER TABLE usuario_premium
    ADD    FOREIGN KEY (album_id)
    REFERENCES album(id)
;
    
ALTER TABLE usuario_premium
    ADD    FOREIGN KEY (artista_id)
    REFERENCES artista(id)
;
    
ALTER TABLE usuario_premium
    ADD    FOREIGN KEY (cancion_id)
    REFERENCES cancion(id)
;
    
ALTER TABLE usuario_free
    ADD    FOREIGN KEY (artista_id)
    REFERENCES artista(id)
;
    
ALTER TABLE usuario_free
    ADD    FOREIGN KEY (cancion_id)
    REFERENCES cancion(id)
;
    
ALTER TABLE usuario_free
    ADD    FOREIGN KEY (album_id)
    REFERENCES album(id)
;
    
ALTER TABLE album
    ADD    FOREIGN KEY (cancion_id)
    REFERENCES cancion(id)
;
    
ALTER TABLE cancion
    ADD    FOREIGN KEY (artista_id)
    REFERENCES artista(id)
;
    

# Create Indexes
