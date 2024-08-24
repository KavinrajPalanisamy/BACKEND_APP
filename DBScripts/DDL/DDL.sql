CREATE TABLE user_auth_credentials (
	sl_no numeric NOT NULL,
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
	CONSTRAINT user_auth_credentials_unique UNIQUE (email,sl_no)
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
