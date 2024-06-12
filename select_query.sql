-- Tabel Tara
SELECT nume, ST_Area(geom) AS area FROM tara;
SELECT nume, ST_Perimeter(geom) AS perimeter FROM tara;
SELECT nume, ST_Centroid(geom) AS centroid FROM tara;
SELECT nume, ST_Area(geom) AS area FROM tara WHERE ST_Area(geom) > 13;
SELECT nume, ST_Perimeter(geom) AS perimeter FROM tara WHERE ST_Perimeter(geom) < 17;
SELECT nume, ST_Centroid(geom) AS centroid FROM tara WHERE fid < 2;

-- Tabel Oras
SELECT nume, ST_Perimeter(geom) AS perimeter FROM oras;
SELECT nume, ST_Centroid(geom) AS centroid FROM oras;
SELECT nume, ST_Area(geom) AS area FROM oras WHERE ST_Area(geom) > 0.003;
SELECT nume, ST_Perimeter(geom) AS perimeter FROM oras WHERE ST_Perimeter(geom) < 0.3;
SELECT nume, ST_Centroid(geom) AS centroid FROM oras WHERE fid BETWEEN 1 AND 5;

-- Tabel Atractii Turistice
SELECT nume, ST_AsText(geom) AS coordinates FROM atractii_turistice;
SELECT nume, geom FROM atractii_turistice WHERE ST_DWithin(geom, ST_SetSRID(ST_MakePoint(0, 0), 4326), 1000);
SELECT nume, ST_Distance(geom, ST_SetSRID(ST_MakePoint(0, 0), 4326)) AS distance FROM atractii_turistice;
SELECT nume, ST_AsText(geom) AS coordinates FROM atractii_turistice WHERE fid < 10;
SELECT nume, geom FROM atractii_turistice WHERE ST_DWithin(geom, ST_SetSRID(ST_MakePoint(0, 0), 4326), 1000) AND fid < 5;
SELECT nume, ST_Distance(geom, ST_SetSRID(ST_MakePoint(0, 0), 4326)) AS distance FROM atractii_turistice WHERE ST_Distance(geom, ST_SetSRID(ST_MakePoint(0, 0), 4326)) < 51;

-- Tabel Piste de Bicicleta
SELECT start_point, end_point, ST_Length(geom) AS length FROM piste_de_bicicleta;
SELECT start_point, end_point, ST_AsText(geom) AS geometry FROM piste_de_bicicleta;
SELECT start_point, end_point, ST_Length(geom) AS length FROM piste_de_bicicleta WHERE ST_Length(geom) > 1000;
SELECT start_point, end_point, ST_AsText(geom) AS geometry FROM piste_de_bicicleta WHERE fid < 10;

-- Tabela Parcuri
SELECT nume, ST_Area(geom) AS area FROM parcuri;
SELECT nume, ST_Perimeter(geom) AS perimeter FROM parcuri;
SELECT nume, ST_Centroid(geom) AS centroid FROM parcuri;
SELECT nume, ST_Perimeter(geom) AS perimeter FROM parcuri WHERE ST_Perimeter(geom) < 0.03;
SELECT nume, ST_Centroid(geom) AS centroid FROM parcuri WHERE fid BETWEEN 1 AND 5;

-- Tabel Statii de Autobuz
SELECT nume, ST_AsText(geom) AS coordinates FROM statii_de_autobuz;
SELECT nume, geom FROM statii_de_autobuz WHERE ST_DWithin(geom, ST_SetSRID(ST_MakePoint(0, 0), 4326), 500);
SELECT nume, ST_Distance(geom, ST_SetSRID(ST_MakePoint(0, 0), 4326)) AS distance FROM statii_de_autobuz;
SELECT nume, ST_AsText(geom) AS coordinates FROM statii_de_autobuz WHERE fid < 10;
SELECT nume, geom FROM statii_de_autobuz WHERE ST_DWithin(geom, ST_SetSRID(ST_MakePoint(0, 0), 4326), 500) AND fid < 5;
SELECT nume, ST_Distance(geom, ST_SetSRID(ST_MakePoint(0, 0), 4326)) AS distance FROM statii_de_autobuz WHERE ST_Distance(geom, ST_SetSRID(ST_MakePoint(0, 0), 4326)) < 50;

-- Tabel Alei Parc
SELECT fid, ST_Length(geom) AS length FROM alee_parc;
SELECT fid, ST_AsText(geom) AS geometry FROM alee_parc;
SELECT fid, ST_Length(geom) AS length FROM alee_parc WHERE ST_Length(geom) > 0.003;
SELECT fid, ST_AsText(geom) AS geometry FROM alee_parc WHERE fid < 10;