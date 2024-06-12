create extension postgis;

CREATE TABLE IF NOT EXISTS tara (
    fid serial PRIMARY KEY NOT NULL,
    nume VARCHAR(100) NOT NULL,
	geom GEOMETRY (POLYGON, 4326),
	populatie integer NOT NULL
);

CREATE TABLE IF NOT EXISTS oras (
    fid serial PRIMARY KEY NOT NULL,
    nume VARCHAR(50) NOT NULL,
    geom GEOMETRY (POLYGON, 4326),
    tara_id INT NOT NULL ,
    FOREIGN KEY (tara_id) REFERENCES tara(fid)

);

CREATE TABLE IF NOT EXISTS atractii_turistice (
    fid serial PRIMARY KEY NOT NULL,
    nume VARCHAR(255) NOT NULL,
    geom GEOMETRY (POINT, 4326),
    oras_id INT NOT NULL,
    FOREIGN KEY (oras_id) REFERENCES oras(fid)
);

CREATE TABLE IF NOT EXISTS piste_de_bicicleta(
	fid serial PRIMARY KEY NOT NULL,
	start_point VARCHAR(30),
	end_point VARCHAR(30),
	geom GEOMETRY (LineString, 4326),
	oras_id INTEGER NOT NULL,
	FOREIGN KEY (oras_id) REFERENCES oras(fid)
);

CREATE TABLE IF NOT EXISTS parcuri(
	fid serial PRIMARY KEY NOT NULL,
	nume VARCHAR(100) NOT NULL,
	geom GEOMETRY (POLYGON, 4326),
	oras_id INTEGER NOT NULL,
	FOREIGN KEY (oras_id) REFERENCES oras(fid)
);

CREATE TABLE IF NOT EXISTS statii_de_autobuz(
	fid serial PRIMARY KEY NOT NULL,
	nume VARCHAR(100) NOT NULL,
	geom GEOMETRY (POINT, 4326),
    oras_id INT NOT NULL,
    FOREIGN KEY (oras_id) REFERENCES oras(fid)	
);

CREATE TABLE IF NOT EXISTS alee_parc(
	fid serial PRIMARY KEY NOT NULL,
	geom GEOMETRY (LineString, 4326),
	parcuri_id INTEGER NOT NULL,
	FOREIGN KEY (parcuri_id) REFERENCES parcuri(fid)
);
	