CREATE TYPE "orders_status" AS ENUM (
  'in_progress',
  'ready',
  'taken',
  'canceled'
);

CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "email" varchar UNIQUE,
  "password" varchar,
  "name" varchar,
  "surname" varchar,
  "created_at" datetime DEFAULT (now()),
  "updated_at" datetime DEFAULT (now()),
  "birth_date" datetime NOT NULL
);

CREATE TABLE "orders" (
  "id" SERIAL PRIMARY KEY,
  "user_id" int NOT NULL,
  "status" orders_status,
  "updated_at" datetime DEFAULT (now()),
  "created_at" datetime DEFAULT (now())
);

CREATE TABLE "orders_positions" (
  "id" SERIAL PRIMARY KEY,
  "order_id" int NOT NULL,
  "item_id" int NOT NULL,
  "count" int
);

CREATE TABLE "items" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar,
  "description" text,
  "imageName" varchar,
  "imageData" text,
  "available_count" int DEFAULT 0,
  "updated_at" datetime DEFAULT (now()),
  "created_at" datetime DEFAULT (now())
);

CREATE TABLE "doctors" (
  "id" SERIAL PRIMARY KEY
);

ALTER TABLE "orders" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "orders_positions" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

ALTER TABLE "orders_positions" ADD FOREIGN KEY ("item_id") REFERENCES "items" ("id");
