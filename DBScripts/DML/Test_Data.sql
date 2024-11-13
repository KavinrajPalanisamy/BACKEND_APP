CREATE TABLE nav_master (
	pfm_code varchar NULL,
	scheme_code varchar NULL,
	nav numeric(25, 5) NULL,
	nav_date date NULL,
	closing_balance numeric(25, 5) NULL,
	created_time timestamp DEFAULT current_timestamp NULL,
	updated_date timestamp NULL,
	CONSTRAINT nav_master_pk PRIMARY KEY (pfm_code,scheme_code,nav_date)
);

CREATE TABLE pfm_master (
	pfm_code varchar NULL,
	pfm_name varchar NULL,
	is_active bpchar(1) DEFAULT 'Y' null,
	CONSTRAINT pfm_master_pk PRIMARY KEY (pfm_code)
);

CREATE TABLE scheme_master (
	pfm_code varchar NULL,
	scheme_code varchar NULL,
	contribution_type varchar(10) NULL,
	asset_class varchar(10) NULL,
	scheme_name varchar NULL,
	is_active bpchar(1) DEFAULT 'Y' NULL,
	decimal_amount numeric NULL,
	decimal_units numeric NULL,
	CONSTRAINT scheme_master_pk PRIMARY KEY (scheme_code,pfm_code)
);

CREATE TABLE investor_master (
	reg_seq_no serial4 not null,
	pan varchar NULL,
	pran varchar NULL,
	first_name varchar NULL,
	last_name varchar NULL,
	contribution_type varchar(2) NULL,
	mobile_no varchar(10) NULL,
	email varchar NULL,
	is_active bpchar(1) NULL,
	CONSTRAINT investor_master_pk PRIMARY KEY (reg_seq_no,pan,pran)
);

CREATE TABLE investor_plan (
	pran varchar NULL,
	contribution_type varchar(10) NULL,
	pfm_code varchar NULL,
	scheme_code varchar NULL,
	asset_class varchar(10) NULL,
	percentage numeric NULL,
	amount numeric(25, 5) NULL,
	closing_balance numeric(25, 5) NULL,
	created_at timestamp DEFAULT current_timestamp NULL,
	updated_at timestamp NULL,
	CONSTRAINT investor_plan_pk PRIMARY KEY (pran,contribution_type,pfm_code,scheme_code)
);

INSERT INTO investor_plan (pran, contribution_type, pfm_code, scheme_code, asset_class, percentage, amount, closing_balance) VALUES
	('900001001', 'T1', 'PFM001', 'SM1001', 'E', '50', '5000', '1265.4566'),
	('900001001', 'T1', 'PFM001', 'SM1002', 'C', '30', '3000', '671.967'),
	('900001001', 'T1', 'PFM001', 'SM1003', 'G', '20', '2000', '467.7677'),
	('900001002', 'T1', 'PFM002', 'SM2001', 'E', '75', '7500', '1451.4066'),
	('900001002', 'T1', 'PFM002', 'SM2002', 'C', '10', '1000', '571.967'),
	('900001002', 'T1', 'PFM002', 'SM2003', 'G', '15', '1500', '167.7677'),
	('900001002', 'T2', 'PFM004', 'SM4004', 'E', '50', '5000', '1265.4566'),
	('900001002', 'T2', 'PFM004', 'SM4005', 'C', '30', '3000', '671.967'),
	('900001002', 'T2', 'PFM004', 'SM4006', 'G', '20', '2000', '467.7677'),
	('900001003', 'T1', 'PFM001', 'SM1001', 'E', '50', '5000', '1265.4566'),
	('900001003', 'T1', 'PFM001', 'SM1002', 'C', '30', '3000', '671.967'),
	('900001003', 'T1', 'PFM001', 'SM1003', 'G', '20', '2000', '467.7677'),
	('900001004', 'T1', 'PFM002', 'SM2001', 'E', '40', '4000', '401.4066'),
	('900001004', 'T1', 'PFM002', 'SM2002', 'C', '40', '4000', '409.967'),
	('900001004', 'T1', 'PFM002', 'SM2003', 'G', '10', '1000', '109.712'),
	('900001004', 'T2', 'PFM004', 'SM4004', 'E', '50', '5000', '1265.4566'),
	('900001004', 'T2', 'PFM005', 'SM5005', 'C', '30', '3000', '671.967'),
	('900001004', 'T2', 'PFM004', 'SM4006', 'G', '20', '2000', '467.7677'),
	('900001005', 'T1', 'PFM007', 'SM1001', 'E', '40', '4000', '401.4066'),
	('900001005', 'T1', 'PFM002', 'SM2002', 'C', '40', '4000', '409.967'),
	('900001005', 'T1', 'PFM003', 'SM3003', 'G', '10', '1000', '109.712');

INSERT INTO investor_master (reg_seq_no, pan, pran, first_name, last_name, contribution_type, mobile_no, email, is_active) VALUES
	('1001', 'CORP1001', '900001001', 'Kavin', 'Raj', 'T1', '9790336896', 'corp1001@gmail.com', 'Y'),
	('1002', 'CORP1002', '900001002', 'Priyadharshini', 'AP', 'T2', '9345933388', 'corp1002@gmail.com', 'Y'),
	('1003', 'CORP1003', '900001003', 'Kavinraj', 'VP', 'T1', '9790336896', 'corp1003@gmail.com', 'Y'),
	('1004', 'CORP1004', '900001004', 'Priyadharshini', 'AP', 'T2', '9876543210', 'corp1004@gmail.com', 'Y'),
	('1005', 'CORP1005', '900001005', 'Kavin', 'VP', 'T1', '9876543211', 'corp1005@gmail.com', 'Y');

INSERT INTO pfm_master (pfm_code, pfm_name, is_active) VALUES
	('PFM001', 'SBI Pension Fund', 'Y'),
	('PFM002', 'UTI Pension Fund', 'Y'),
	('PFM003', 'Kotak Pension Fund', 'Y'),
	('PFM004', 'LIC Pension Fund', 'Y'),
	('PFM005', 'TATA Pension Fund', 'Y'),
	('PFM006', 'Max Life Pension Fund', 'Y'),
	('PFM007', 'HDFC Pension Fund', 'Y');

INSERT INTO scheme_master (pfm_code, scheme_code, contribution_type, asset_class, scheme_name, is_active, decimal_amount, decimal_units) VALUES
	('PFM001', 'SM1001', 'T1', 'E', 'Equity Tier 1', 'Y', '2', '4'),
	('PFM001', 'SM1002', 'T1', 'C', 'Corporate Tier 1', 'Y', '2', '4'),
	('PFM001', 'SM1003', 'T1', 'G', 'Government Tier 1', 'Y', '2', '4'),
	('PFM001', 'SM1004', 'T2', 'E', 'Equity Tier 2', 'Y', '2', '4'),
	('PFM001', 'SM1005', 'T2', 'C', 'Corporate Tier 2', 'Y', '2', '4'),
	('PFM001', 'SM1006', 'T2', 'G', 'Government Tier 2', 'Y', '2', '4'),
	('PFM002', 'SM2001', 'T1', 'E', 'Equity Tier 1', 'Y', '2', '4'),
	('PFM002', 'SM2002', 'T1', 'C', 'Corporate Tier 1', 'Y', '2', '4'),
	('PFM002', 'SM2003', 'T1', 'G', 'Government Tier 1', 'Y', '2', '4'),
	('PFM002', 'SM2004', 'T2', 'E', 'Equity Tier 2', 'Y', '2', '4'),
	('PFM002', 'SM2005', 'T2', 'C', 'Corporate Tier 2', 'Y', '2', '4'),
	('PFM002', 'SM2006', 'T2', 'G', 'Government Tier 2', 'Y', '2', '4'),
	('PFM003', 'SM3001', 'T1', 'E', 'Equity Tier 1', 'Y', '2', '4'),
	('PFM003', 'SM3002', 'T1', 'C', 'Corporate Tier 1', 'Y', '2', '4'),
	('PFM003', 'SM3003', 'T1', 'G', 'Government Tier 1', 'Y', '2', '4'),
	('PFM003', 'SM3004', 'T2', 'E', 'Equity Tier 2', 'Y', '2', '4'),
	('PFM003', 'SM3005', 'T2', 'C', 'Corporate Tier 2', 'Y', '2', '4'),
	('PFM003', 'SM3006', 'T2', 'G', 'Government Tier 2', 'Y', '2', '4'),
	('PFM004', 'SM4001', 'T1', 'E', 'Equity Tier 1', 'Y', '2', '4'),
	('PFM004', 'SM4002', 'T1', 'C', 'Corporate Tier 1', 'Y', '2', '4'),
	('PFM004', 'SM4003', 'T1', 'G', 'Government Tier 1', 'Y', '2', '4'),
	('PFM004', 'SM4004', 'T2', 'E', 'Equity Tier 2', 'Y', '2', '4'),
	('PFM004', 'SM4005', 'T2', 'C', 'Corporate Tier 2', 'Y', '2', '4'),
	('PFM004', 'SM4006', 'T2', 'G', 'Government Tier 2', 'Y', '2', '4'),
	('PFM005', 'SM5001', 'T1', 'E', 'Equity Tier 1', 'Y', '2', '4'),
	('PFM005', 'SM5002', 'T1', 'C', 'Corporate Tier 1', 'Y', '2', '4'),
	('PFM005', 'SM5003', 'T1', 'G', 'Government Tier 1', 'Y', '2', '4'),
	('PFM005', 'SM5004', 'T2', 'E', 'Equity Tier 2', 'Y', '2', '4'),
	('PFM005', 'SM5005', 'T2', 'C', 'Corporate Tier 2', 'Y', '2', '4'),
	('PFM005', 'SM5006', 'T2', 'G', 'Government Tier 2', 'Y', '2', '4'),
	('PFM006', 'SM6001', 'T1', 'E', 'Equity Tier 1', 'Y', '2', '4'),
	('PFM006', 'SM6002', 'T1', 'C', 'Corporate Tier 1', 'Y', '2', '4'),
	('PFM006', 'SM6003', 'T1', 'G', 'Government Tier 1', 'Y', '2', '4'),
	('PFM006', 'SM6004', 'T2', 'E', 'Equity Tier 2', 'Y', '2', '4'),
	('PFM006', 'SM6005', 'T2', 'C', 'Corporate Tier 2', 'Y', '2', '4'),
	('PFM006', 'SM6006', 'T2', 'G', 'Government Tier 2', 'Y', '2', '4'),
	('PFM007', 'SM7001', 'T1', 'E', 'Equity Tier 1', 'Y', '2', '4'),
	('PFM007', 'SM7002', 'T1', 'C', 'Corporate Tier 1', 'Y', '2', '4'),
	('PFM007', 'SM7003', 'T1', 'G', 'Government Tier 1', 'Y', '2', '4'),
	('PFM007', 'SM7004', 'T2', 'E', 'Equity Tier 2', 'Y', '2', '4'),
	('PFM007', 'SM7005', 'T2', 'C', 'Corporate Tier 2', 'Y', '2', '4'),
	('PFM007', 'SM7006', 'T2', 'G', 'Government Tier 2', 'Y', '2', '4');

INSERT INTO nav_master (pfm_code, scheme_code, nav, nav_date, closing_balance) VALUES
	('PFM001', 'SM1001', '22.1001', '2024-10-26', '2991.5608'),
	('PFM001', 'SM1002', '20.8249', '2024-10-26', '7947.6173'),
	('PFM001', 'SM1003', '9.6045', '2024-10-26', '507.5439'),
	('PFM001', 'SM1004', '19.8555', '2024-10-26', '4979.6156'),
	('PFM001', 'SM1005', '41.9321', '2024-10-26', '8365.2141'),
	('PFM001', 'SM1006', '9.0637', '2024-10-26', '8813.5774'),
	('PFM002', 'SM2001', '25.7578', '2024-10-26', '4148.9583'),
	('PFM002', 'SM2002', '30.6315', '2024-10-26', '6786.3146'),
	('PFM002', 'SM2003', '47.14', '2024-10-26', '9010.0266'),
	('PFM002', 'SM2004', '10.2817', '2024-10-26', '6309.389'),
	('PFM002', 'SM2005', '6.2073', '2024-10-26', '2734.0082'),
	('PFM002', 'SM2006', '8.2637', '2024-10-26', '1890.7305'),
	('PFM003', 'SM3001', '17.2403', '2024-10-26', '542.0487'),
	('PFM003', 'SM3002', '3.1807', '2024-10-26', '6790.1315'),
	('PFM003', 'SM3003', '47.0022', '2024-10-26', '5352.2936'),
	('PFM003', 'SM3004', '8.1592', '2024-10-26', '9104.6017'),
	('PFM003', 'SM3005', '18.8891', '2024-10-26', '1413.7428'),
	('PFM003', 'SM3006', '14.7667', '2024-10-26', '3193.1914'),
	('PFM004', 'SM4001', '30.9997', '2024-10-26', '6759.8316'),
	('PFM004', 'SM4002', '47.4234', '2024-10-26', '8600.3366'),
	('PFM004', 'SM4003', '2.7536', '2024-10-26', '2766.21'),
	('PFM004', 'SM4004', '12.8482', '2024-10-26', '7853.1913'),
	('PFM004', 'SM4005', '4.1374', '2024-10-26', '6033.4377'),
	('PFM004', 'SM4006', '23.5586', '2024-10-26', '8848.5372'),
	('PFM005', 'SM5001', '10.8259', '2024-10-26', '5010.9858'),
	('PFM005', 'SM5002', '11.0224', '2024-10-26', '7327.3916'),
	('PFM005', 'SM5003', '0.5106', '2024-10-26', '97.9017'),
	('PFM005', 'SM5004', '21.2749', '2024-10-26', '4793.534'),
	('PFM005', 'SM5005', '40.4198', '2024-10-26', '9082.9686'),
	('PFM005', 'SM5006', '25.8293', '2024-10-26', '4536.1261'),
	('PFM006', 'SM6001', '40.3771', '2024-10-26', '2816.9657'),
	('PFM006', 'SM6002', '31.564', '2024-10-26', '5151.6482'),
	('PFM006', 'SM6003', '49.3714', '2024-10-26', '6994.3996'),
	('PFM006', 'SM6004', '39.2809', '2024-10-26', '452.7501'),
	('PFM006', 'SM6005', '0.7835', '2024-10-26', '4896.5198'),
	('PFM006', 'SM6006', '39.8948', '2024-10-26', '6169.3805'),
	('PFM007', 'SM7001', '45.1748', '2024-10-26', '3799.4279'),
	('PFM007', 'SM7002', '5.5279', '2024-10-26', '7275.5064'),
	('PFM007', 'SM7003', '31.2692', '2024-10-26', '8803.5863'),
	('PFM007', 'SM7004', '6.6075', '2024-10-26', '2796.0537'),
	('PFM007', 'SM7005', '0.0354', '2024-10-26', '5611.1869'),
	('PFM007', 'SM7006', '33.0736', '2024-10-26', '5008.1763'),
	('PFM001', 'SM1001', '32.3313', '2024-10-24', '539.4916'),
	('PFM001', 'SM1002', '16.4596', '2024-10-24', '338.8364'),
	('PFM001', 'SM1003', '46.6187', '2024-10-24', '277.9363'),
	('PFM001', 'SM1004', '28.216', '2024-10-24', '223.8477'),
	('PFM001', 'SM1005', '6.4715', '2024-10-24', '746.8788'),
	('PFM001', 'SM1006', '11.3603', '2024-10-24', '287.3381'),
	('PFM002', 'SM2001', '17.9966', '2024-10-24', '88.8607'),
	('PFM002', 'SM2002', '14.8086', '2024-10-24', '917.1859'),
	('PFM002', 'SM2003', '3.4647', '2024-10-24', '831.0855'),
	('PFM002', 'SM2004', '46.8815', '2024-10-24', '541.5796'),
	('PFM002', 'SM2005', '16.1913', '2024-10-24', '500.6024'),
	('PFM002', 'SM2006', '4.9005', '2024-10-24', '808.2573'),
	('PFM003', 'SM3001', '8.3212', '2024-10-24', '418.3403'),
	('PFM003', 'SM3002', '38.4206', '2024-10-24', '124.2286'),
	('PFM003', 'SM3003', '21.3847', '2024-10-24', '861.0681'),
	('PFM003', 'SM3004', '43.7059', '2024-10-24', '358.6521'),
	('PFM003', 'SM3005', '40.8677', '2024-10-24', '84.6248'),
	('PFM003', 'SM3006', '32.6044', '2024-10-24', '328.5539'),
	('PFM004', 'SM4001', '38.4967', '2024-10-24', '103.287'),
	('PFM004', 'SM4002', '41.6449', '2024-10-24', '594.8419'),
	('PFM004', 'SM4003', '4.8209', '2024-10-24', '472.8872'),
	('PFM004', 'SM4004', '9.4558', '2024-10-24', '859.5736'),
	('PFM004', 'SM4005', '30.7505', '2024-10-24', '752.7823'),
	('PFM004', 'SM4006', '2.1304', '2024-10-24', '970.9284'),
	('PFM005', 'SM5001', '12.2421', '2024-10-24', '232.8673'),
	('PFM005', 'SM5002', '5.076', '2024-10-24', '619.5223'),
	('PFM005', 'SM5003', '35.3323', '2024-10-24', '794.2493'),
	('PFM005', 'SM5004', '1.4702', '2024-10-24', '845.705'),
	('PFM005', 'SM5005', '47.2581', '2024-10-24', '864.2056'),
	('PFM005', 'SM5006', '12.3859', '2024-10-24', '985.0988'),
	('PFM006', 'SM6001', '13.8946', '2024-10-24', '272.6429'),
	('PFM006', 'SM6002', '40.9817', '2024-10-24', '864.6102'),
	('PFM006', 'SM6003', '4.6981', '2024-10-24', '962.8627'),
	('PFM006', 'SM6004', '0.7725', '2024-10-24', '638.4894'),
	('PFM006', 'SM6005', '10.8568', '2024-10-24', '173.7069'),
	('PFM006', 'SM6006', '3.4732', '2024-10-24', '674.4429'),
	('PFM007', 'SM7001', '0.5269', '2024-10-24', '274.8328'),
	('PFM007', 'SM7002', '7.1205', '2024-10-24', '121.571'),
	('PFM007', 'SM7003', '18.1229', '2024-10-24', '844.3371'),
	('PFM007', 'SM7004', '33.6858', '2024-10-24', '93.3982'),
	('PFM007', 'SM7005', '34.5211', '2024-10-24', '554.396'),
	('PFM007', 'SM7006', '39.5594', '2024-10-24', '819.1446'),
	('PFM001', 'SM1001', '32.3313', '2024-10-23', '376.1432'),
	('PFM001', 'SM1002', '16.4596', '2024-10-23', '411.6633'),
	('PFM001', 'SM1003', '46.6187', '2024-10-23', '619.3233'),
	('PFM001', 'SM1004', '28.216', '2024-10-23', '842.396'),
	('PFM001', 'SM1005', '6.4715', '2024-10-23', '74.7967'),
	('PFM001', 'SM1006', '11.3603', '2024-10-23', '863.29'),
	('PFM002', 'SM2001', '17.9966', '2024-10-23', '200.2013'),
	('PFM002', 'SM2002', '14.8086', '2024-10-23', '965.7638'),
	('PFM002', 'SM2003', '3.4647', '2024-10-23', '197.5554'),
	('PFM002', 'SM2004', '46.8815', '2024-10-23', '242.0919'),
	('PFM002', 'SM2005', '16.1913', '2024-10-23', '956.0059'),
	('PFM002', 'SM2006', '4.9005', '2024-10-23', '712.0484'),
	('PFM003', 'SM3001', '8.3212', '2024-10-23', '600.4275'),
	('PFM003', 'SM3002', '38.4206', '2024-10-23', '430.5599'),
	('PFM003', 'SM3003', '21.3847', '2024-10-23', '547.6385'),
	('PFM003', 'SM3004', '43.7059', '2024-10-23', '307.3295'),
	('PFM003', 'SM3005', '40.8677', '2024-10-23', '505.9597'),
	('PFM003', 'SM3006', '32.6044', '2024-10-23', '10.2837'),
	('PFM004', 'SM4001', '38.4967', '2024-10-23', '439.4038'),
	('PFM004', 'SM4002', '41.6449', '2024-10-23', '342.4527'),
	('PFM004', 'SM4003', '4.8209', '2024-10-23', '919.4425'),
	('PFM004', 'SM4004', '9.4558', '2024-10-23', '951.4447'),
	('PFM004', 'SM4005', '30.7505', '2024-10-23', '791.3696'),
	('PFM004', 'SM4006', '2.1304', '2024-10-23', '479.148'),
	('PFM005', 'SM5001', '12.2421', '2024-10-23', '24.5959'),
	('PFM005', 'SM5002', '5.076', '2024-10-23', '35.8679'),
	('PFM005', 'SM5003', '35.3323', '2024-10-23', '785.4859'),
	('PFM005', 'SM5004', '1.4702', '2024-10-23', '61.7128'),
	('PFM005', 'SM5005', '47.2581', '2024-10-23', '197.1203'),
	('PFM005', 'SM5006', '12.3859', '2024-10-23', '795.5134'),
	('PFM006', 'SM6001', '13.8946', '2024-10-23', '55.7636'),
	('PFM006', 'SM6002', '40.9817', '2024-10-23', '104.4099'),
	('PFM006', 'SM6003', '4.6981', '2024-10-23', '219.8667'),
	('PFM006', 'SM6004', '0.7725', '2024-10-23', '682.3895'),
	('PFM006', 'SM6005', '10.8568', '2024-10-23', '919.5731'),
	('PFM006', 'SM6006', '3.4732', '2024-10-23', '611.5023'),
	('PFM007', 'SM7001', '0.5269', '2024-10-23', '538.8487'),
	('PFM007', 'SM7002', '7.1205', '2024-10-23', '311.998'),
	('PFM007', 'SM7003', '18.1229', '2024-10-23', '185.3639'),
	('PFM007', 'SM7004', '33.6858', '2024-10-23', '33.7551'),
	('PFM007', 'SM7005', '34.5211', '2024-10-23', '879.3415'),
	('PFM007', 'SM7006', '39.5594', '2024-10-23', '737.3086'),
	('PFM001', 'SM1001', '32.3313', '2024-10-22', '251.1892'),
	('PFM001', 'SM1002', '16.4596', '2024-10-22', '425.2516'),
	('PFM001', 'SM1003', '46.6187', '2024-10-22', '644.6729'),
	('PFM001', 'SM1004', '28.216', '2024-10-22', '618.9504'),
	('PFM001', 'SM1005', '6.4715', '2024-10-22', '747.5458'),
	('PFM001', 'SM1006', '11.3603', '2024-10-22', '40.015'),
	('PFM002', 'SM2001', '17.9966', '2024-10-22', '271.6898'),
	('PFM002', 'SM2002', '14.8086', '2024-10-22', '157.1211'),
	('PFM002', 'SM2003', '3.4647', '2024-10-22', '925.9401'),
	('PFM002', 'SM2004', '46.8815', '2024-10-22', '818.8835'),
	('PFM002', 'SM2005', '16.1913', '2024-10-22', '291.8044'),
	('PFM002', 'SM2006', '4.9005', '2024-10-22', '491.0169'),
	('PFM003', 'SM3001', '8.3212', '2024-10-22', '99.9583'),
	('PFM003', 'SM3002', '38.4206', '2024-10-22', '553.4634'),
	('PFM003', 'SM3003', '21.3847', '2024-10-22', '843.2117'),
	('PFM003', 'SM3004', '43.7059', '2024-10-22', '213.3293'),
	('PFM003', 'SM3005', '40.8677', '2024-10-22', '49.0007'),
	('PFM003', 'SM3006', '32.6044', '2024-10-22', '661.1327'),
	('PFM004', 'SM4001', '38.4967', '2024-10-22', '327.1021'),
	('PFM004', 'SM4002', '41.6449', '2024-10-22', '118.0013'),
	('PFM004', 'SM4003', '4.8209', '2024-10-22', '674.4964'),
	('PFM004', 'SM4004', '9.4558', '2024-10-22', '517.8313'),
	('PFM004', 'SM4005', '30.7505', '2024-10-22', '750.1799'),
	('PFM004', 'SM4006', '2.1304', '2024-10-22', '636.4634'),
	('PFM005', 'SM5001', '12.2421', '2024-10-22', '177.575'),
	('PFM005', 'SM5002', '5.076', '2024-10-22', '21.2339'),
	('PFM005', 'SM5003', '35.3323', '2024-10-22', '996.516'),
	('PFM005', 'SM5004', '1.4702', '2024-10-22', '594.3463'),
	('PFM005', 'SM5005', '47.2581', '2024-10-22', '661.911'),
	('PFM005', 'SM5006', '12.3859', '2024-10-22', '39.5923'),
	('PFM006', 'SM6001', '13.8946', '2024-10-22', '193.5686'),
	('PFM006', 'SM6002', '40.9817', '2024-10-22', '691.9081'),
	('PFM006', 'SM6003', '4.6981', '2024-10-22', '673.3642'),
	('PFM006', 'SM6004', '0.7725', '2024-10-22', '714.6646'),
	('PFM006', 'SM6005', '10.8568', '2024-10-22', '783.5566'),
	('PFM006', 'SM6006', '3.4732', '2024-10-22', '154.9168'),
	('PFM007', 'SM7001', '0.5269', '2024-10-22', '526.3088'),
	('PFM007', 'SM7002', '7.1205', '2024-10-22', '147.6279'),
	('PFM007', 'SM7003', '18.1229', '2024-10-22', '201.7276'),
	('PFM007', 'SM7004', '33.6858', '2024-10-22', '406.9133'),
	('PFM007', 'SM7005', '34.5211', '2024-10-22', '712.0628'),
	('PFM007', 'SM7006', '39.5594', '2024-10-22', '232.9201');