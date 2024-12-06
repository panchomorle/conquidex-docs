CREATE TABLE "persons" (
  "id" integer,
  "name" varchar,
  "surname" varchar,
  "nickname" varchar,
  "club_id" integer
);

CREATE TABLE "clubs" (
  "id" integer,
  "name" varchar,
  "desc" varchar,
  "phone_number" varchar
);

CREATE TABLE "socials" (
  "id" integer,
  "name" varchar,
  "svg_url" varchar
);

CREATE TABLE "club_socials" (
  "id" integer,
  "url" string,
  "social_id" integer,
  "club_id" integer
);

CREATE TABLE "roles" (
  "id" integer,
  "name" string
);

CREATE TABLE "roles_persons" (
  "id_person" integer,
  "id_role" integer
);

CREATE TABLE "units" (
  "id" integer,
  "name" varchar
);

CREATE TABLE "classes" (
  "id" integer,
  "name" varchar
);

CREATE TABLE "class_items" (
  "class_id" integer,
  "id" integer,
  "name" varchar,
  "desc" varchar
);

CREATE TABLE "person_class_items" (
  "person_id" integer,
  "item_id" integer,
  "status" varchar
);

CREATE TABLE "pathfinder_units" (
  "person_id" integer,
  "unit_id" integer
);

CREATE TABLE "counselor_units" (
  "person_id" integer,
  "unit_id" integer,
  "assignment_date" date
);

CREATE TABLE "staff_units" (
  "person_id" integer,
  "unit_id" integer,
  "assignment_date" date
);

CREATE TABLE "person_classes" (
  "person_id" integer,
  "class_id" integer
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
