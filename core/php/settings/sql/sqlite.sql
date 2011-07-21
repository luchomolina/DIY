-- 
-- Created by SQL::Translator::Producer::SQLite
-- Created on Thu Jul 21 15:26:07 2011
-- 

BEGIN TRANSACTION;

--
-- Table: asst_analytics
--
CREATE TABLE asst_analytics (
  id INTEGER PRIMARY KEY NOT NULL,
  asset_id int(11) NOT NULL DEFAULT 0,
  element_id int(11) NOT NULL,
  access_time int(11) NOT NULL,
  client_ip varchar(15) NOT NULL,
  client_proxy varchar(15) NOT NULL,
  creation_date int(11) DEFAULT NULL,
  modification_date int(11) DEFAULT 0
);

--
-- Table: asst_assets
--
CREATE TABLE asst_assets (
  id INTEGER PRIMARY KEY NOT NULL,
  user_id int(11) DEFAULT NULL,
  parent_id int(11) DEFAULT NULL,
  location text,
  settings_id int(11) DEFAULT NULL,
  title text,
  description text,
  comment text NOT NULL,
  public_status bool DEFAULT '0',
  license_id int(11) DEFAULT 0,
  creation_date int(11) DEFAULT NULL,
  modification_date int(11) DEFAULT 0
);

--
-- Table: asst_licenses
--
CREATE TABLE asst_licenses (
  id INTEGER PRIMARY KEY NOT NULL,
  name text NOT NULL,
  description text NOT NULL,
  fulltext blob NOT NULL,
  uri text NOT NULL
);

--
-- Table: base_settings
--
CREATE TABLE base_settings (
  id INTEGER PRIMARY KEY NOT NULL,
  name text,
  type text NOT NULL,
  data text NOT NULL,
  user_id int(11) NOT NULL,
  creation_date int(11) DEFAULT NULL,
  modification_date int(11) DEFAULT NULL
);

--
-- Table: base_tags
--
CREATE TABLE base_tags (
  id INTEGER PRIMARY KEY NOT NULL,
  scope_table_alias varchar(64) NOT NULL DEFAULT '',
  scope_table_id int(11) NOT NULL DEFAULT 0,
  user_id int(11) NOT NULL DEFAULT 0,
  tag text,
  creation_date int(11) DEFAULT NULL,
  modification_date int(11) DEFAULT NULL
);

--
-- Table: cmrc_products
--
CREATE TABLE cmrc_products (
  id INTEGER PRIMARY KEY NOT NULL,
  sku varchar(20) DEFAULT NULL,
  title varchar(100) DEFAULT NULL,
  price decimal(9,2) DEFAULT NULL,
  type varchar(100) DEFAULT NULL,
  beneficiary varchar(50) DEFAULT NULL,
  sub_term_seconds int(11) DEFAULT NULL,
  qty_total int(11) NOT NULL DEFAULT 0,
  creation_date int(11) NOT NULL DEFAULT 0,
  modification_date int(11) DEFAULT NULL
);

--
-- Table: cmrc_transactions
--
CREATE TABLE cmrc_transactions (
  id INTEGER PRIMARY KEY NOT NULL,
  order_timestamp varchar(24) NOT NULL DEFAULT '',
  payer_email varchar(75) NOT NULL DEFAULT '',
  payer_id varchar(60) NOT NULL DEFAULT '',
  payer_firstname varchar(127) NOT NULL DEFAULT '',
  payer_lastname varchar(127) NOT NULL DEFAULT '',
  country varchar(8) NOT NULL DEFAULT '',
  product_sku varchar(48) NOT NULL DEFAULT '',
  product_name varchar(255) NOT NULL DEFAULT '',
  transaction_id varchar(24) NOT NULL DEFAULT '',
  transaction_status varchar(32) NOT NULL DEFAULT '',
  transaction_currency varchar(8) NOT NULL DEFAULT '',
  transaction_amount int(11) NOT NULL DEFAULT 0,
  transaction_fee decimal(9,2) NOT NULL DEFAULT 0.00,
  is_fulfilled smallint(1) NOT NULL DEFAULT 0,
  referral_code varchar(191) DEFAULT NULL,
  nvp_request_json text,
  nvp_response_json text,
  nvp_details_json text,
  creation_date int(11) NOT NULL DEFAULT 0,
  modification_date int(11) DEFAULT 0
);

--
-- Table: elmt_analytics
--
CREATE TABLE elmt_analytics (
  id INTEGER PRIMARY KEY NOT NULL,
  element_id int(11) NOT NULL,
  access_method varchar(24) NOT NULL,
  access_location text NOT NULL,
  access_time int(11) NOT NULL,
  client_ip varchar(15) NOT NULL,
  client_proxy varchar(15) NOT NULL,
  creation_date int(11) DEFAULT NULL,
  modification_date int(11) DEFAULT 0
);

--
-- Table: elmt_elements
--
CREATE TABLE elmt_elements (
  id INTEGER PRIMARY KEY NOT NULL,
  user_id int(11) DEFAULT NULL,
  name text,
  type text NOT NULL,
  options text,
  creation_date int(11) DEFAULT NULL,
  modification_date int(11) DEFAULT NULL
);

--
-- Table: live_events
--
CREATE TABLE live_events (
  id INTEGER PRIMARY KEY NOT NULL,
  date int(11) DEFAULT NULL,
  user_id int(11) DEFAULT NULL,
  venue_id int(11) DEFAULT NULL,
  publish tinyint(1) DEFAULT NULL,
  cancelled tinyint(1) DEFAULT NULL,
  comments text,
  creation_date int(11) DEFAULT NULL,
  modification_date int(11) DEFAULT NULL
);

--
-- Table: live_venues
--
CREATE TABLE live_venues (
  id INTEGER PRIMARY KEY NOT NULL,
  name text NOT NULL,
  address1 text,
  address2 text,
  city text,
  region text,
  country text,
  postalcode text,
  latitude float(8,2) DEFAULT NULL,
  longitude float(8,2) DEFAULT NULL,
  website text,
  phone text,
  creation_date int(11) DEFAULT NULL,
  modification_date int(11) DEFAULT NULL
);

--
-- Table: lock_codes
--
CREATE TABLE lock_codes (
  id INTEGER PRIMARY KEY NOT NULL,
  uid tinytext,
  asset_id int(11) DEFAULT NULL,
  claim_date int(11) DEFAULT NULL,
  creation_date int(11) DEFAULT 0,
  modification_date int(11) DEFAULT NULL
);

CREATE INDEX asset_id ON lock_codes (asset_id);

--
-- Table: lock_passwords
--
CREATE TABLE lock_passwords (
  id INTEGER PRIMARY KEY NOT NULL,
  password text,
  asset_id int(11) DEFAULT NULL,
  creation_date int(11) DEFAULT 0,
  modification_date int(11) DEFAULT NULL
);

CREATE INDEX asset_id02 ON lock_passwords (asset_id);

--
-- Table: lock_permissions
--
CREATE TABLE lock_permissions (
  id INTEGER PRIMARY KEY NOT NULL,
  user_list_id int(11) NOT NULL DEFAULT 0,
  element_id int(11) NOT NULL DEFAULT 0,
  allowed_logins int(11) NOT NULL DEFAULT -1,
  total_logins int(11) NOT NULL DEFAULT 0,
  date_expires int(11) NOT NULL DEFAULT -1,
  element_password tinytext,
  added_by int(11) NOT NULL DEFAULT 0,
  creation_date int(11) DEFAULT NULL,
  modification_date int(11) DEFAULT NULL
);

CREATE INDEX login_id ON lock_permissions (user_list_id, element_id);

--
-- Table: user_lists
--
CREATE TABLE user_lists (
  id INTEGER PRIMARY KEY NOT NULL,
  name varchar(128) NOT NULL DEFAULT '',
  description text,
  creation_date int(11) DEFAULT NULL,
  modification_date int(11) DEFAULT 0
);

--
-- Table: user_lists_members
--
CREATE TABLE user_lists_members (
  id INTEGER PRIMARY KEY NOT NULL,
  user_id int(11) NOT NULL,
  list_id int(11) NOT NULL,
  creation_date int(11) DEFAULT NULL,
  modification_date int(11) DEFAULT 0
);

--
-- Table: user_resetpassword
--
CREATE TABLE user_resetpassword (
  id INTEGER PRIMARY KEY NOT NULL,
  time_requested int(11) NOT NULL DEFAULT 0,
  random_key tinytext NOT NULL,
  user_id int(11) NOT NULL DEFAULT 0,
  creation_date int(11) DEFAULT NULL,
  modification_date int(11) DEFAULT NULL
);

--
-- Table: user_users
--
CREATE TABLE user_users (
  id INTEGER PRIMARY KEY NOT NULL,
  email_address varchar(255) NOT NULL DEFAULT '',
  password char(64) NOT NULL DEFAULT '',
  username varchar(32) NOT NULL DEFAULT '',
  display_name tinytext,
  first_name tinytext,
  last_name tinytext,
  organization tinytext,
  address_line1 tinytext,
  address_line2 tinytext,
  address_city tinytext,
  address_region tinytext,
  address_postalcode tinytext,
  address_country tinytext,
  comments text,
  verification_code text NOT NULL,
  verified bool NOT NULL,
  is_admin bool NOT NULL DEFAULT '0',
  creation_date int(11) DEFAULT NULL,
  modification_date int(11) DEFAULT NULL
);

COMMIT;
