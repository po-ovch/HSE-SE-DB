CREATE TABLE "City" (
  "Name" varchar,
  "Region" varchar,
  PRIMARY KEY ("Name", "Region")
);

CREATE TABLE "Station" (
  "Name" varchar PRIMARY KEY,
  "CityName" varchar,
  "RegionName" varchar,
  "Tracks" int
);

CREATE TABLE "Train" (
  "TrainNr" int PRIMARY KEY,
  "Length" int,
  "StartStationName" varchar,
  "EndStationName" varchar,
  "DepartureDateTime" timestamp,
  "ArrivalDateTime" timestamp
);

ALTER TABLE "Station" ADD FOREIGN KEY ("Name", "RegionName") REFERENCES "City" ("Name", "Region");

ALTER TABLE "Train" ADD FOREIGN KEY ("StartStationName") REFERENCES "Station" ("Name");

ALTER TABLE "Train" ADD FOREIGN KEY ("EndStationName") REFERENCES "Station" ("Name");
