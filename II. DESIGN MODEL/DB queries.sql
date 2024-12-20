-- Tabla de personas
CREATE TABLE "persons" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR,
  "surname" VARCHAR,
  "nickname" VARCHAR,
  "email" VARCHAR UNIQUE NOT NULL CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
  "club_id" INTEGER NOT NULL,
  "last_enrollment" TIMESTAMP,
  "role_id" INTEGER NOT NULL,
  "auth_user_uuid" UUID -- En Supabase, auth.user UUID es el tipo correcto
);

-- Tabla de clubes
CREATE TABLE "clubs" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR NOT NULL,
  "founding_date" TIMESTAMP, -- Cambiado de datetime a timestamp
  "street" VARCHAR,
  "street_number" INTEGER,
  "city" VARCHAR,
  "province" VARCHAR,
  "country" VARCHAR,
  "description" VARCHAR, -- Cambiado desc por description, para evitar conflictos con palabras reservadas
  "phone_number" VARCHAR
);

-- Tabla de redes sociales
CREATE TABLE "socials" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR NOT NULL,
  "svg_url" VARCHAR
);

-- Tabla de redes sociales de clubes
CREATE TABLE "club_socials" (
  "social_id" INTEGER,
  "club_id" INTEGER,
  "url" VARCHAR NOT NULL,
  PRIMARY KEY ("social_id", "club_id")
);

-- Tabla de roles
CREATE TABLE "roles" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR NOT NULL,
  "hierarchy" INTEGER NOT NULL
);

-- Tabla de unidades
CREATE TABLE "units" (
  "id" SERIAL PRIMARY KEY,
  "club_id" INTEGER PRIMARY KEY,
  "name" VARCHAR NOT NULL
);

-- Tabla de clases
CREATE TABLE "classes" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR NOT NULL
);

-- Tabla de ítems de clases
CREATE TABLE "class_items" (
  "class_id" INTEGER,
  "id" INTEGER,
  "name" VARCHAR NOT NULL,
  "description" VARCHAR, -- Cambiado desc por description
  PRIMARY KEY ("class_id", "id")
);

-- Tabla de ítems completados por personas
CREATE TABLE "person_class_items" (
  "person_id" INTEGER,
  "class_id" INTEGER,
  "item_id" INTEGER,
  PRIMARY KEY ("person_id", "class_id", "item_id")
);

-- Unidades de pathfinders
CREATE TABLE "pathfinder_units" (
  "person_id" INTEGER,
  "unit_id" INTEGER,
  "club_id" INTEGER,
  PRIMARY KEY ("person_id", "unit_id", "club_id")
);

-- Unidades de consejeros
CREATE TABLE "counselor_units" (
  "person_id" INTEGER,
  "unit_id" INTEGER,
  "club_id" INTEGER,
  PRIMARY KEY ("person_id", "unit_id", "club_id")
);

-- Unidades de staff
CREATE TABLE "staff_units" (
  "person_id" INTEGER,
  "unit_id" INTEGER,
  "club_id" INTEGER,
  PRIMARY KEY ("person_id", "unit_id", "club_id")
);

-- Clases asignadas a personas
CREATE TABLE "person_classes" (
  "person_id" INTEGER,
  "class_id" INTEGER,
  PRIMARY KEY ("person_id", "class_id")
);

-- Tabla de honores
CREATE TABLE "honors" (
  "honor_category_id" VARCHAR,
  "id" SERIAL,
  "name" VARCHAR NOT NULL,
  "level" INTEGER NOT NULL,
  PRIMARY KEY ("honor_category_id", "id")
);

-- Categorías de honores
CREATE TABLE "honor_category" (
  "id" VARCHAR PRIMARY KEY,
  "name" VARCHAR NOT NULL
);

-- Honores obtenidos por personas
CREATE TABLE "person_honors" (
  "person_id" INTEGER,
  "honor_category_id" VARCHAR,
  "honor_id" INTEGER,
  PRIMARY KEY ("person_id", "honor_category_id", "honor_id")
);

-- Eventos
CREATE TABLE "events" (
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR NOT NULL,
  "description" VARCHAR,
  "start_date" TIMESTAMP NOT NULL,
  "end_date" TIMESTAMP NOT NULL,
  "club_id" INTEGER NOT NULL,
  "street" VARCHAR,
  "street_number" INTEGER,
  "city" VARCHAR,
  "state" VARCHAR,
  "country" VARCHAR
);

-- Asistencia a eventos
CREATE TABLE "attendance" (
  "person_id" INTEGER,
  "event_id" INTEGER,
  "notes" VARCHAR,
  "taken_by" INTEGER,
  PRIMARY KEY ("person_id", "event_id")
);

--////////////---------RELACIONES-------//////////////--

-- Relaciones de personas
ALTER TABLE "persons"
  ADD FOREIGN KEY ("club_id") REFERENCES "clubs" ("id") ON DELETE SET NULL,
  ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id"),
  ADD FOREIGN KEY ("auth_user_uuid") REFERENCES "auth"."users" ("id") ON DELETE SET NULL;


-- Relaciones de club_socials
ALTER TABLE "club_socials"
  ADD FOREIGN KEY ("social_id") REFERENCES "socials" ("id") ON DELETE CASCADE,
  ADD FOREIGN KEY ("club_id") REFERENCES "clubs" ("id") ON DELETE CASCADE;

-- Relaciones de class_items
ALTER TABLE "class_items"
  ADD FOREIGN KEY ("class_id") REFERENCES "classes" ("id") ON DELETE CASCADE;

-- Relaciones de person_class_items
ALTER TABLE "person_class_items"
  ADD FOREIGN KEY ("person_id") REFERENCES "persons" ("id") ON DELETE CASCADE,
  ADD FOREIGN KEY ("class_id", "item_id") REFERENCES "class_items" ("class_id", "id") ON DELETE CASCADE;

-- Relaciones de unidades con restricción de unicidad
ALTER TABLE "pathfinder_units"
  ADD CONSTRAINT "fk_person_unit"
    FOREIGN KEY ("person_id") REFERENCES "persons" ("id") ON DELETE CASCADE,
  ADD CONSTRAINT "fk_unit_club"
    FOREIGN KEY ("unit_id", "club_id") REFERENCES "units" ("id", "club_id") ON DELETE CASCADE,
  ADD CONSTRAINT "unique_person_unit"
    UNIQUE ("person_id", "unit_id", "club_id");

ALTER TABLE "counselor_units"
  ADD CONSTRAINT "fk_person_unit_counselor"
    FOREIGN KEY ("person_id") REFERENCES "persons" ("id") ON DELETE CASCADE,
  ADD CONSTRAINT "fk_unit_club_counselor"
    FOREIGN KEY ("unit_id", "club_id") REFERENCES "units" ("id", "club_id") ON DELETE CASCADE,
  ADD CONSTRAINT "unique_person_unit_counselor"
    UNIQUE ("person_id", "unit_id", "club_id");

ALTER TABLE "staff_units"
  ADD CONSTRAINT "fk_person_unit_staff"
    FOREIGN KEY ("person_id") REFERENCES "persons" ("id") ON DELETE CASCADE,
  ADD CONSTRAINT "fk_unit_club_staff"
    FOREIGN KEY ("unit_id", "club_id") REFERENCES "units" ("id", "club_id") ON DELETE CASCADE,
  ADD CONSTRAINT "unique_person_unit_staff"
    UNIQUE ("person_id", "unit_id", "club_id");

ALTER TABLE "units"
  ADD FOREIGN KEY ("club_id") REFERENCES "clubs" ("id") ON DELETE CASCADE,

-- Relaciones de person_classes
ALTER TABLE "person_classes"
  ADD FOREIGN KEY ("person_id") REFERENCES "persons" ("id") ON DELETE CASCADE,
  ADD FOREIGN KEY ("class_id") REFERENCES "classes" ("id") ON DELETE CASCADE;

-- Relaciones de honores
ALTER TABLE "honors"
  ADD FOREIGN KEY ("honor_category_id") REFERENCES "honor_category" ("id") ON DELETE CASCADE;

ALTER TABLE "person_honors"
  ADD FOREIGN KEY ("person_id") REFERENCES "persons" ("id") ON DELETE CASCADE,
  ADD FOREIGN KEY ("honor_category_id", "honor_id") REFERENCES "honors" ("honor_category_id", "id") ON DELETE CASCADE;

-- Relaciones de attendance
ALTER TABLE "attendance"
  ADD FOREIGN KEY ("person_id") REFERENCES "persons" ("id") ON DELETE CASCADE,
  ADD FOREIGN KEY ("event_id") REFERENCES "events" ("id") ON DELETE CASCADE,
  ADD FOREIGN KEY ("taken_by") REFERENCES "persons" ("id") ON DELETE SET NULL;

-- Relaciones de eventos
ALTER TABLE "events"
  ADD FOREIGN KEY ("club_id") REFERENCES "clubs" ("id");
