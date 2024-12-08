CREATE TABLE "persons" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "surname" varchar,
  "nickname" varchar,
  "club_id" integer
);

CREATE TABLE "clubs" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "street" varchar,
  "street_number" int,
  "city" varchar,
  "state" varchar,
  "country" varchar,
  "desc" varchar,
  "phone_number" varchar
);

CREATE TABLE "socials" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "svg_url" varchar
);

CREATE TABLE "club_socials" (
  "id" integer PRIMARY KEY,
  "url" varchar,
  "social_id" integer,
  "club_id" integer
);

CREATE TABLE "roles" (
  "id" integer PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "roles_persons" (
  "id_person" integer,
  "id_role" integer,
  PRIMARY KEY ("id_person", "id_role")
);

CREATE TABLE "units" (
  "id" integer PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "classes" (
  "id" integer PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "class_items" (
  "class_id" integer,
  "id" integer,
  "name" varchar,
  "desc" varchar,
  PRIMARY KEY ("class_id", "id")
);

CREATE TABLE "person_class_items" (
  "person_id" integer,
  "class_id" integer,
  "item_id" integer,
  "status" boolean,
  PRIMARY KEY ("person_id", "class_id", "item_id")
);

CREATE TABLE "pathfinder_units" (
  "person_id" integer,
  "unit_id" integer,
  PRIMARY KEY ("person_id", "unit_id")
);

CREATE TABLE "counselor_units" (
  "person_id" integer,
  "unit_id" integer,
  "assignment_date" date,
  PRIMARY KEY ("person_id", "unit_id")
);

CREATE TABLE "staff_units" (
  "person_id" integer,
  "unit_id" integer,
  "assignment_date" date,
  PRIMARY KEY ("person_id", "unit_id")
);

CREATE TABLE "person_classes" (
  "person_id" integer,
  "class_id" integer,
  PRIMARY KEY ("person_id", "class_id")
);

CREATE TABLE "honor" (
  "honor_category_id" varchar,
  "id" integer,
  "name" varchar,
  "level" integer,
  PRIMARY KEY ("honor_category_id", "id")
);

CREATE TABLE "honor_category" (
  "id" varchar PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "person_honor" (
  "person_id" integer,
  "honor_category_id" varchar,
  "honor_id" integer,
  "status" boolean,
  PRIMARY KEY ("person_id", "honor_category_id", "honor_id")
);

CREATE TABLE "event" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "description" varchar,
  "startDate" datetime,
  "endDate" datetime,
  "street" varchar,
  "street_number" int,
  "city" varchar,
  "state" varchar,
  "country" varchar
);

CREATE TABLE "attendance" (
  "person_id" integer,
  "event_id" integer,
  "status" boolean,
  "notes" varchar,
  "taken_by" integer,
  PRIMARY KEY ("person_id", "event_id")
);

ALTER TABLE "club_socials" ADD FOREIGN KEY ("club_id") REFERENCES "clubs" ("id");

ALTER TABLE "club_socials" ADD FOREIGN KEY ("social_id") REFERENCES "socials" ("id");

ALTER TABLE "persons" ADD FOREIGN KEY ("club_id") REFERENCES "clubs" ("id");

ALTER TABLE "roles_persons" ADD FOREIGN KEY ("id_person") REFERENCES "persons" ("id");

ALTER TABLE "roles_persons" ADD FOREIGN KEY ("id_role") REFERENCES "roles" ("id");

ALTER TABLE "person_classes" ADD FOREIGN KEY ("person_id") REFERENCES "persons" ("id");

ALTER TABLE "person_classes" ADD FOREIGN KEY ("class_id") REFERENCES "classes" ("id");

ALTER TABLE "class_items" ADD FOREIGN KEY ("class_id") REFERENCES "classes" ("id");

ALTER TABLE "person_class_items" ADD FOREIGN KEY ("item_id") REFERENCES "class_items" ("id");

ALTER TABLE "person_class_items" ADD FOREIGN KEY ("person_id") REFERENCES "persons" ("id");

ALTER TABLE "pathfinder_units" ADD FOREIGN KEY ("unit_id") REFERENCES "units" ("id");

ALTER TABLE "counselor_units" ADD FOREIGN KEY ("unit_id") REFERENCES "units" ("id");

ALTER TABLE "staff_units" ADD FOREIGN KEY ("unit_id") REFERENCES "units" ("id");

ALTER TABLE "pathfinder_units" ADD FOREIGN KEY ("person_id") REFERENCES "persons" ("id");

ALTER TABLE "counselor_units" ADD FOREIGN KEY ("person_id") REFERENCES "persons" ("id");

ALTER TABLE "staff_units" ADD FOREIGN KEY ("person_id") REFERENCES "persons" ("id");

ALTER TABLE "person_honor" ADD FOREIGN KEY ("honor_id") REFERENCES "honor" ("id");

ALTER TABLE "person_honor" ADD FOREIGN KEY ("honor_category_id") REFERENCES "honor" ("honor_category_id");

ALTER TABLE "person_honor" ADD FOREIGN KEY ("person_id") REFERENCES "persons" ("id");

ALTER TABLE "honor" ADD FOREIGN KEY ("id") REFERENCES "honor_category" ("id");

ALTER TABLE "person_class_items" ADD FOREIGN KEY ("class_id") REFERENCES "class_items" ("class_id");

ALTER TABLE "attendance" ADD FOREIGN KEY ("person_id") REFERENCES "persons" ("id");

ALTER TABLE "attendance" ADD FOREIGN KEY ("event_id") REFERENCES "event" ("id");

ALTER TABLE "attendance" ADD FOREIGN KEY ("taken_by") REFERENCES "persons" ("id");
