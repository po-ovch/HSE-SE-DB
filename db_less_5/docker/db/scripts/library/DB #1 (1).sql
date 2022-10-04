CREATE TABLE "PublishingHouse" (
  "Name" varchar PRIMARY KEY,
  "Address" varchar
);

CREATE TABLE "Book" (
  "ISBN" int PRIMARY KEY,
  "Year" int,
  "Title" varchar,
  "Author" varchar,
  "PagesNum" int,
  "PublisherName" varchar
);

CREATE TABLE "Category" (
  "Name" varchar PRIMARY KEY,
  "ParentCategoryName" varchar
);

CREATE TABLE "BookCategory" (
  "ISBN" int,
  "CategoryName" varchar,
  PRIMARY KEY ("ISBN", "CategoryName")
);

CREATE TABLE "Copy" (
  "UniqueId" int,
  "ISBN" int,
  "Position" int,
  PRIMARY KEY ("UniqueId", "ISBN")
);

CREATE TABLE "Reader" (
  "UniqueId" int PRIMARY KEY,
  "Name" varchar,
  "Surname" varchar,
  "Address" varchar,
  "BirthDate" timestamp
);

CREATE TABLE "Borrow" (
  "CopyId" int,
  "ISBN" int,
  "ReaderId" int,
  "ReturnDate" timestamp,
  PRIMARY KEY ("CopyId", "ISBN", "ReaderId")
);

ALTER TABLE "Book" ADD FOREIGN KEY ("PublisherName") REFERENCES "PublishingHouse" ("Name");

ALTER TABLE "Category" ADD FOREIGN KEY ("ParentCategoryName") REFERENCES "Category" ("Name");

ALTER TABLE "BookCategory" ADD FOREIGN KEY ("CategoryName") REFERENCES "Category" ("Name");

ALTER TABLE "BookCategory" ADD FOREIGN KEY ("ISBN") REFERENCES "Book" ("ISBN");

ALTER TABLE "Copy" ADD FOREIGN KEY ("ISBN") REFERENCES "Book" ("ISBN");

ALTER TABLE "Borrow" ADD FOREIGN KEY ("CopyId", "ISBN") REFERENCES "Copy" ("UniqueId", "ISBN");

ALTER TABLE "Borrow" ADD FOREIGN KEY ("ReaderId") REFERENCES "Reader" ("UniqueId");
