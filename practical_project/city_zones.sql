-- city_zones.sql
-- Zone-level attributes: average traffic index, population density, traffic level

DROP TABLE IF EXISTS city_zones;

CREATE TABLE city_zones (
    zone_id             INTEGER PRIMARY KEY,
    zone_name           TEXT NOT NULL,
    avg_traffic_index   REAL,
    population_density  INTEGER,
    traffic_level       TEXT
);

INSERT INTO city_zones (zone_id, zone_name, avg_traffic_index, population_density, traffic_level) VALUES (1, 'Downtown Core', 4.37, 23841, 'Medium');
INSERT INTO city_zones (zone_id, zone_name, avg_traffic_index, population_density, traffic_level) VALUES (2, 'Riverside', 7.59, 15568, 'High');
INSERT INTO city_zones (zone_id, zone_name, avg_traffic_index, population_density, traffic_level) VALUES (3, 'Tech Park', 2.4, 5165, 'Low');
INSERT INTO city_zones (zone_id, zone_name, avg_traffic_index, population_density, traffic_level) VALUES (4, 'Old Town', 1.52, 21855, 'Low');
INSERT INTO city_zones (zone_id, zone_name, avg_traffic_index, population_density, traffic_level) VALUES (5, 'Airport District', 6.41, 18139, 'Medium');
INSERT INTO city_zones (zone_id, zone_name, avg_traffic_index, population_density, traffic_level) VALUES (6, 'Greenwood Hills', 1.19, 24292, 'Low');
INSERT INTO city_zones (zone_id, zone_name, avg_traffic_index, population_density, traffic_level) VALUES (7, 'University Belt', 8.49, 6489, 'High');
INSERT INTO city_zones (zone_id, zone_name, avg_traffic_index, population_density, traffic_level) VALUES (8, 'Harbor Bay', 2.64, 5810, 'Low');
INSERT INTO city_zones (zone_id, zone_name, avg_traffic_index, population_density, traffic_level) VALUES (9, 'North Ridge', 3.74, 13831, 'Low');
INSERT INTO city_zones (zone_id, zone_name, avg_traffic_index, population_density, traffic_level) VALUES (10, 'Sunset Plaza', 4.89, 8343, 'Medium');
INSERT INTO city_zones (zone_id, zone_name, avg_traffic_index, population_density, traffic_level) VALUES (11, 'Industrial Zone', 6.51, 4778, 'Medium');
INSERT INTO city_zones (zone_id, zone_name, avg_traffic_index, population_density, traffic_level) VALUES (12, 'Lakeview', 3.63, 10109, 'Low');
INSERT INTO city_zones (zone_id, zone_name, avg_traffic_index, population_density, traffic_level) VALUES (13, 'Central Market', 5.1, 19951, 'Medium');
INSERT INTO city_zones (zone_id, zone_name, avg_traffic_index, population_density, traffic_level) VALUES (14, 'East End', 2.8, 13584, 'Low');
INSERT INTO city_zones (zone_id, zone_name, avg_traffic_index, population_density, traffic_level) VALUES (15, 'West Gate', 6.33, 2591, 'Medium');
INSERT INTO city_zones (zone_id, zone_name, avg_traffic_index, population_density, traffic_level) VALUES (16, 'Hillcrest', 6.47, 5507, 'Medium');
