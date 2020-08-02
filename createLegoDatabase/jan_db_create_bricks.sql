use jan_db;
DROP TABLE IF EXISTS lego_set_parts;
DROP TABLE IF EXISTS lego_sets;
DROP TABLE IF EXISTS brick;
DROP TABLE IF EXISTS color_exact;
DROP TABLE IF EXISTS color_family;
CREATE TABLE IF NOT EXISTS color_family(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS color_exact(
  id INT PRIMARY KEY,
  name VARCHAR(100),
  color_family_id INT,
  FOREIGN KEY(color_family_id) REFERENCES color_family(id)
);
CREATE TABLE IF NOT EXISTS brick(
  color_exact_id INT,
  category VARCHAR(100),
  element_id VARCHAR(16) PRIMARY KEY,
  model_id VARCHAR(10),
  price DECIMAL(8, 2),
  description VARCHAR(200),
  img_pathname VARCHAR(200),
  FOREIGN KEY(color_exact_id) REFERENCES color_exact(id)
);
CREATE TABLE IF NOT EXISTS lego_sets(
  set_number VARCHAR(20) PRIMARY KEY,
  name VARCHAR(100),
  description VARCHAR(200)
);
CREATE TABLE IF NOT EXISTS lego_set_parts (
  lego_set_id VARCHAR(20) NOT NULL,
  brick_id VARCHAR(16) NOT NULL,
  quantity INT,
  FOREIGN KEY(lego_set_id) REFERENCES lego_sets(set_number),
  FOREIGN KEY(brick_id) REFERENCES brick(element_id),
  PRIMARY KEY(lego_set_id, brick_id)
);
INSERT INTO color_family(name)
VALUES ('Black'),
  ('Blue'),
  ('Bright Orange'),
  ('Dark Green'),
  ('Grey'),
  ('Lilac'),
  ('Purple'),
  ('Red'),
  ('Reddish Brown'),
  ('Silver'),
  ('Warm Gold'),
  ('White'),
  ('Yellow');