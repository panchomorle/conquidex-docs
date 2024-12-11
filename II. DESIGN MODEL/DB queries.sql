CREATE TABLE "persons" (
  "id" integer PRIMARY KEY,
  "name" varchar NOT NULL,
  "surname" varchar NOT NULL,
  "nickname" varchar,
  "club_id" integer REFERENCES "clubs"("id") ON DELETE SET NULL
);

CREATE TABLE "clubs" (
  "id" integer PRIMARY KEY,
  "name" varchar NOT NULL,
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
  "name" varchar NOT NULL,
  "svg_url" varchar
);

CREATE TABLE "club_socials" (
  "id" integer PRIMARY KEY,
  "url" varchar NOT NULL,
  "social_id" integer REFERENCES "socials"("id") ON DELETE CASCADE,
  "club_id" integer REFERENCES "clubs"("id") ON DELETE CASCADE
);

CREATE TABLE "roles" (
  "id" integer PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "roles_persons" (
  "id_person" integer REFERENCES "persons"("id") ON DELETE CASCADE,
  "id_role" integer REFERENCES "roles"("id") ON DELETE CASCADE,
  PRIMARY KEY ("id_person", "id_role")
);

CREATE TABLE "units" (
  "id" integer PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "classes" (
  "id" integer PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "class_items" (
  "class_id" integer REFERENCES "classes"("id") ON DELETE CASCADE,
  "id" integer,
  "name" varchar NOT NULL,
  "desc" varchar,
  PRIMARY KEY ("class_id", "id")
);

CREATE TABLE "person_class_items" (
  "person_id" integer REFERENCES "persons"("id") ON DELETE CASCADE,
  "class_id" integer,
  "item_id" integer,
  "status" boolean NOT NULL,
  PRIMARY KEY ("person_id", "class_id", "item_id"),
  FOREIGN KEY ("class_id", "item_id") REFERENCES "class_items"("class_id", "id") ON DELETE CASCADE
);

CREATE TABLE "pathfinder_units" (
  "person_id" integer REFERENCES "persons"("id") ON DELETE CASCADE,
  "unit_id" integer REFERENCES "units"("id") ON DELETE CASCADE,
  PRIMARY KEY ("person_id", "unit_id")
);

CREATE TABLE "counselor_units" (
  "person_id" integer REFERENCES "persons"("id") ON DELETE CASCADE,
  "unit_id" integer REFERENCES "units"("id") ON DELETE CASCADE,
  "assignment_date" date NOT NULL,
  PRIMARY KEY ("person_id", "unit_id")
);

CREATE TABLE "staff_units" (
  "person_id" integer REFERENCES "persons"("id") ON DELETE CASCADE,
  "unit_id" integer REFERENCES "units"("id") ON DELETE CASCADE,
  "assignment_date" date NOT NULL,
  PRIMARY KEY ("person_id", "unit_id")
);

CREATE TABLE "person_classes" (
  "person_id" integer REFERENCES "persons"("id") ON DELETE CASCADE,
  "class_id" integer REFERENCES "classes"("id") ON DELETE CASCADE,
  PRIMARY KEY ("person_id", "class_id")
);

CREATE TABLE "honor" (
  "honor_category_id" varchar REFERENCES "honor_category"("id") ON DELETE CASCADE,
  "id" integer,
  "name" varchar NOT NULL,
  "level" integer NOT NULL,
  PRIMARY KEY ("honor_category_id", "id")
);

CREATE TABLE "honor_category" (
  "id" varchar PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "person_honor" (
  "person_id" integer REFERENCES "persons"("id") ON DELETE CASCADE,
  "honor_category_id" varchar,
  "honor_id" integer,
  "status" boolean NOT NULL,
  PRIMARY KEY ("person_id", "honor_category_id", "honor_id"),
  FOREIGN KEY ("honor_category_id", "honor_id") REFERENCES "honor"("honor_category_id", "id") ON DELETE CASCADE
);

CREATE TABLE "event" (
  "id" integer PRIMARY KEY,
  "name" varchar NOT NULL,
  "description" varchar,
  "startDate" timestamp NOT NULL,
  "endDate" timestamp NOT NULL,
  "street" varchar,
  "street_number" int,
  "city" varchar,
  "state" varchar,
  "country" varchar
);

CREATE TABLE "attendance" (
  "person_id" integer REFERENCES "persons"("id") ON DELETE CASCADE,
  "event_id" integer REFERENCES "event"("id") ON DELETE CASCADE,
  "status" boolean NOT NULL,
  "notes" varchar,
  "taken_by" integer REFERENCES "persons"("id") ON DELETE SET NULL,
  PRIMARY KEY ("person_id", "event_id")
);
