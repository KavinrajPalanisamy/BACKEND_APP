CREATE TABLE user_auth_credentials (
	sl_no numeric NOT NULL,
	user_id varchar NOT NULL,
	email varchar NOT NULL,
	"password" varchar NULL,
	password_1 varchar NULL,
	password_2 varchar NULL,
	password_3 varchar NULL,
	created_date timestamp DEFAULT current_timestamp NULL,
	updated_date timestamp NULL,
	failed_attempts numeric DEFAULT 0 NULL,
	last_login timestamp NULL,
	profile_image_refno numeric DEFAULT 101 NULL,
	CONSTRAINT user_auth_credentials_unique UNIQUE (email,user_id,sl_no)
);

CREATE TABLE image_type_master (
	image_type bpchar(1) NOT NULL,
	description varchar NULL,
	CONSTRAINT image_type_master_unique UNIQUE (image_type)
);

CREATE TABLE image_data (
	ref_no serial2 NOT NULL,
	email varchar NOT NULL,
	image_type bpchar(1) NOT NULL,
	content_type varchar NOT NULL,
	file_content bytea NOT NULL,
	file_name varchar NULL,
	created_date timestamp DEFAULT current_timestamp NULL,
	updated_date timestamp NULL,
	CONSTRAINT image_data_unique UNIQUE (ref_no,email,image_type)
);

ALTER TABLE image_data ADD CONSTRAINT image_data_image_type_master_fk FOREIGN KEY (image_type) REFERENCES image_type_master(image_type);

CREATE TABLE session_logs (
	user_id varchar NOT NULL,
	email varchar NOT NULL,
	created_time timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	updated_time timestamp NULL,
	session_id varchar NOT NULL,
	session_token varchar NULL,
	login_time timestamp NULL,
	logout_time timestamp NULL,
	session_active bpchar(1) NOT NULL DEFAULT 'Y'::bpchar,
	device varchar NULL,
	platform varchar NULL,
	CONSTRAINT session_logs_unique UNIQUE (user_id,email,session_active,session_id)
);