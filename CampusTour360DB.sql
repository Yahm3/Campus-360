-- Connect to (or create) the database
CONNECT 'jdbc:derby://localhost:1527/CampusTourDB;create=true' USER 'app' PASSWORD '123';

-- Create the Location table
CREATE TABLE Location (
    id          INT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    image_path  VARCHAR(255) NOT NULL
);


--:NOTE: Not sure if this works, right now I am still configuring glassfish
-- CHANGE: 25/04/2026 22h00:00
INSERT INTO Location (id, name, image_path) VALUES (1, 'Outdoor Front Gate', 'images/panoramas/outdoors/1-outdoor-front-gate.jpg');
INSERT INTO Location (id, name, image_path) VALUES (2, 'Outdoor Cafeteria', 'images/panoramas/outdoors/2-outdoor-cafeteria.jpg');
INSERT INTO Location (id, name, image_path) VALUES (3, 'Outdoor Benches 1', 'images/panoramas/outdoors/3-outdoor-benches-1.jpg');






