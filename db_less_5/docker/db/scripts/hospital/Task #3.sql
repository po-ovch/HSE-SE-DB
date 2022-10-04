CREATE TABLE "Station" (
  "StatNr" int PRIMARY KEY,
  "Name" varchar
);

CREATE TABLE "Patient" (
  "PatientNr" int PRIMARY KEY,
  "Name" varchar,
  "Disease" varchar,
  "StatNr" int,
  "RoomNr" int,
  "AdmissionFrom" timestamp,
  "AdmissionTo" timestamp,
  "DoctorNr" int
);

CREATE TABLE "Room" (
  "StatNr" int,
  "RoomNr" int,
  "Beds" int,
  PRIMARY KEY ("StatNr", "RoomNr")
);

CREATE TABLE "Doctor" (
  "PersNr" int PRIMARY KEY,
  "Area" varchar,
  "Rank" varchar
);

CREATE TABLE "StationPersonnel" (
  "PersNr" int PRIMARY KEY,
  "Name" varchar,
  "StationNr" int
);

CREATE TABLE "Caregiver" (
  "PersNr" int PRIMARY KEY,
  "Qualification" varchar
);

ALTER TABLE "Patient" ADD FOREIGN KEY ("StatNr") REFERENCES "Station" ("StatNr");

ALTER TABLE "Patient" ADD FOREIGN KEY ("StatNr", "RoomNr") REFERENCES "Room" ("StatNr", "RoomNr");

ALTER TABLE "Patient" ADD FOREIGN KEY ("DoctorNr") REFERENCES "Doctor" ("PersNr");

ALTER TABLE "Room" ADD FOREIGN KEY ("StatNr") REFERENCES "Station" ("StatNr");

ALTER TABLE "StationPersonnel" ADD FOREIGN KEY ("PersNr") REFERENCES "Doctor" ("PersNr");

ALTER TABLE "StationPersonnel" ADD FOREIGN KEY ("StationNr") REFERENCES "Station" ("StatNr");

ALTER TABLE "Station" ADD FOREIGN KEY ("StatNr") REFERENCES "Caregiver" ("PersNr");
