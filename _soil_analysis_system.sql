create database _soil_analysis_system;
use _soil_analysis_system;

create table farmer(
id int primary key,
name_ varchar(255) not null,
phone_no bigint,
email_id varchar(255)  default null,
village varchar(255) not null,
sub_district varchar(255),
district varchar(255) not null,
house_no int
);

create table soil_sample(
id int primary key,
date_of_collection varchar(255) not null,
farm_area int not null,
geo_position varchar(255),
irrigation_status varchar(255) default null,
khasra_no int not null,
village varchar(255),
farmer_id int,
foreign key (farmer_id) references farmer(id)
);

create table soil_test_lab(
id int primary key,
district varchar(255),
subdistrict varchar(255),
contact_person_name varchar(255)not null,
contact_person_phone_no bigint not null,
sample_id int,
foreign key(sample_id) references soil_sample(id)
);

create table _soil_health_card(
id int primary key,
soil_type varchar(255),
ph_value int not null,
electrical_conductivity int not null,
organic_carbon int not null,
nitrogen int default null,
phosphorus int default null,
potassium int default null,
lab_id int,
sample_id int,
foreign key (lab_id) references soil_test_lab(id),
foreign key(sample_id) references soil_sample(id)
);

create table crop_recommendation(
id int primary key,
crop_name varchar(255) not null,
recommended_nitrogen int default null,
recommended_phosphorus int default null,
recommended_potassium int default null
);

create table fertilizer_recommendation(
id int primary key,
nitrogen int default null,
phosphorus int default null,
potassium int default null,
manure varchar(255),
health_id int,
crop_id int,
farmer_id int,
foreign key(health_id) references _soil_health_card(
id),
foreign key(crop_id) references crop_recommendation(id),
foreign key(farmer_id)references farmer(
id)
);