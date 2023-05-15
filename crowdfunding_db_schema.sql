-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/3dLXG1
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).


CREATE DATABASE crowdfunding_db
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE "category" (
    "category_id" varchar(5)   NOT NULL,
    "category" varchar(15)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "contact" (
    "contact_id" int   NOT NULL,
    "first_name" varchar(20)   NOT NULL,
    "last_name" varchar(20)   NOT NULL,
    "email" varchar(50)   NOT NULL,
    CONSTRAINT "pk_contact" PRIMARY KEY (
        "contact_id"
     )
);

CREATE TABLE "subcategory" (
    "subcategory_id" varchar(9)   NOT NULL,
    "subcategory" varchar(20)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar(100)   NOT NULL,
    "description" varchar(100)   NOT NULL,
    "goal" int   NOT NULL,
    "pledged" int   NOT NULL,
    "outcome" varchar(11)   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar(3)   NOT NULL,
    "currency" varchar(4)   NOT NULL,
    "launched_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_id" varchar(5)   NOT NULL,
    "subcategory_id" varchar(9)   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contact" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

