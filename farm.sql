CREATE TABLE Crop (
  crop_id SERIAL PRIMARY KEY,
  crop_name VARCHAR(100),
  type_of_crop VARCHAR(50)
);

CREATE TABLE Farmer (
  farmer_id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  surname VARCHAR(100),
  phone VARCHAR(12)
);

CREATE TABLE Animal_Plots (
  plot_id SERIAL PRIMARY KEY,
  plot_name VARCHAR(100),
  size INT,
  location VARCHAR(100)
);

CREATE TABLE Animal (
  animal_id SERIAL PRIMARY KEY,
  kind_of_animal VARCHAR(100),
  plot_id INT REFERENCES Animal_Plots(plot_id),
  farmer_id INT REFERENCES Farmer(farmer_id)
);

CREATE TABLE Field (
  field_id SERIAL PRIMARY KEY,
  name_of_field VARCHAR(100),
  size INT,
  location VARCHAR(100),
  type_of_crop INT REFERENCES Crop(crop_id)
);

CREATE TABLE Inventory (
  inventory_id SERIAL PRIMARY KEY,
  quantity INT,
  farmer_id INT REFERENCES Farmer(farmer_id)
);

CREATE TABLE Farmer_Field (
  farmer_field_id SERIAL PRIMARY KEY,
  farmer_id INT REFERENCES Farmer(farmer_id),
  field_id INT REFERENCES Field(field_id)
);

CREATE TABLE Harvest (
  harvest_id SERIAL PRIMARY KEY,
  quantity INT,
  date DATE,
  crop_id INT REFERENCES Crop(crop_id)
);

CREATE TABLE Equipment (
  equipment_id SERIAL PRIMARY KEY,
  type_of_equipment VARCHAR(100),
  state VARCHAR(50),
  farmer_id INT REFERENCES Farmer(farmer_id)
);

CREATE TABLE Warehouse (
  warehouse_id SERIAL PRIMARY KEY,
  warehouse_name VARCHAR(100),
  location VARCHAR(100),
  crop_id INT REFERENCES Harvest(crop_id)
);

CREATE TABLE Orders (
  order_id SERIAL PRIMARY KEY,
  order_date DATE,
  order_amount INT,
  crop_id INT REFERENCES Harvest(crop_id)
);

CREATE TABLE Warehouse_Inventory (
  warehouse_id INT REFERENCES Warehouse(warehouse_id),
  inventory_id INT REFERENCES Inventory(inventory_id),
  quantity INT,
  PRIMARY KEY (warehouse_id, inventory_id)
);
