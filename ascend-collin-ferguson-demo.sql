-- public.children definition

-- Drop table

-- DROP TABLE public.children;

CREATE TABLE public.children (
	dbkey int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	assigned_staff_db int4 NULL,
	first_name varchar NULL,
	last_name varchar NULL,
	age int4 NULL,
	status varchar NULL
);


-- public.children_programs_assigned definition

-- Drop table

-- DROP TABLE public.children_programs_assigned;

CREATE TABLE public.children_programs_assigned (
	db_key int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	child_dbkey int4 NULL,
	program_dbkey int4 NULL,
	enrollment_date date NULL,
	status varchar NULL
);


-- public.programs definition

-- Drop table

-- DROP TABLE public.programs;

CREATE TABLE public.programs (
	dbkey int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	program_name varchar NULL,
	program_display_name varchar NULL
);


-- public.users definition

-- Drop table

-- DROP TABLE public.users;

CREATE TABLE public.users (
	dbkey int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	first_name varchar NOT NULL,
	last_name varchar NULL,
	permissions int4 NULL,
	supervisor_id int4 NULL,
	status varchar NULL,
	"program" int4 NULL,
	latitude numeric NULL,
	longitude numeric NULL,
	"type" varchar NULL,
	title varchar NULL,
	email varchar NULL,
	CONSTRAINT users_pk PRIMARY KEY (dbkey),
	CONSTRAINT users_users_fk FOREIGN KEY (supervisor_id) REFERENCES public.users(dbkey) ON UPDATE SET NULL
);


-- public.visits definition

-- Drop table

-- DROP TABLE public.visits;

CREATE TABLE public.visits (
	dbkey int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	staff_dbkey int4 NULL,
	assigned_program_dbkey int4 NULL,
	assigned_child_dbkey int4 NULL,
	mileage numeric NULL,
	status varchar NULL,
	visit_date date NULL,
	CONSTRAINT staff_dbkey FOREIGN KEY (staff_dbkey) REFERENCES public.users(dbkey)
);

SET session_replication_role = 'replica';
INSERT INTO public.programs (program_name,program_display_name) VALUES
	 ('early_intervention','Early Intervention'),
	 ('nurse_family_partnership','Nurse Family Partnership'),
	 ('parents_as_teachers','Parents as Teachers'),
	 ('healthy_families_america','Healthy Families America'),
	 ('preschool_promise','Preschool Promise'),
	 ('catholic_social_services','Catholic Social Services');
INSERT INTO public.children (assigned_staff_db,first_name,last_name,age,status) VALUES
	 (46,'Diana','Hernandez',1,'active'),
	 (43,'Diana','Martinez',0,'active'),
	 (52,'Mia','Smith',2,'active'),
	 (39,'Charlie','Smith',2,'archived'),
	 (58,'Ethan','White',4,'active'),
	 (59,'Victor','Martin',3,'archived'),
	 (60,'Hannah','Jones',0,'active'),
	 (42,'Ivan','Thompson',2,'active'),
	 (58,'Ethan','Moore',0,'archived'),
	 (41,'Alice','Jones',1,'active');
INSERT INTO public.children (assigned_staff_db,first_name,last_name,age,status) VALUES
	 (40,'Mia','Martin',3,'active'),
	 (32,'Yvonne','Moore',3,'active'),
	 (45,'Fiona','Jackson',0,'active'),
	 (52,'George','White',0,'active'),
	 (51,'George','Martin',0,'active'),
	 (36,'Fiona','Brown',1,'active'),
	 (31,'Victor','Smith',2,'archived'),
	 (48,'Ivan','Johnson',0,'active'),
	 (57,'Ethan','Hernandez',0,'archived'),
	 (60,'Ivan','Rodriguez',2,'active');
INSERT INTO public.children (assigned_staff_db,first_name,last_name,age,status) VALUES
	 (49,'Ruby','Williams',0,'active'),
	 (37,'Charlie','Clark',0,'active'),
	 (42,'Victor','Gonzalez',3,'active'),
	 (31,'Paul','Davis',2,'active'),
	 (35,'Victor','Martin',3,'active'),
	 (58,'Zach','Clark',2,'active'),
	 (48,'Xavier','Martin',1,'active'),
	 (35,'Alice','Jones',1,'active'),
	 (46,'George','Davis',4,'active'),
	 (55,'Liam','Anderson',1,'active');
INSERT INTO public.children (assigned_staff_db,first_name,last_name,age,status) VALUES
	 (55,'Zach','Lewis',0,'active'),
	 (35,'Ivan','Smith',0,'active'),
	 (34,'Ruby','Taylor',0,'active'),
	 (44,'Ruby','Garcia',4,'active'),
	 (55,'Liam','Moore',1,'active'),
	 (60,'Yvonne','Thomas',4,'active'),
	 (54,'Wendy','Martinez',3,'active'),
	 (51,'Olivia','Davis',1,'active'),
	 (48,'Fiona','Miller',0,'active'),
	 (52,'Wendy','Harris',0,'active');
INSERT INTO public.children_programs_assigned (child_dbkey,program_dbkey,enrollment_date,status) VALUES
	 (1,5,'2024-01-19','active'),
	 (2,3,'2023-12-04','exited'),
	 (2,1,'2024-08-04','active'),
	 (3,1,'2024-02-03','active'),
	 (4,1,'2024-01-15','exited'),
	 (5,1,'2023-04-06','exited'),
	 (6,5,'2024-11-18','active'),
	 (6,3,'2024-09-16','exited'),
	 (7,2,'2023-06-23','active'),
	 (8,6,'2024-01-28','active');
INSERT INTO public.children_programs_assigned (child_dbkey,program_dbkey,enrollment_date,status) VALUES
	 (9,2,'2024-12-14','active'),
	 (9,3,'2024-01-30','exited'),
	 (10,4,'2024-01-18','active'),
	 (11,4,'2024-10-14','exited'),
	 (12,4,'2024-07-10','exited'),
	 (13,4,'2023-12-22','exited'),
	 (14,4,'2023-08-29','exited'),
	 (15,5,'2023-05-29','active'),
	 (16,2,'2024-07-02','active'),
	 (16,1,'2024-06-12','active');
INSERT INTO public.children_programs_assigned (child_dbkey,program_dbkey,enrollment_date,status) VALUES
	 (17,2,'2023-11-27','active'),
	 (18,4,'2023-03-14','active'),
	 (18,2,'2024-08-02','active'),
	 (19,1,'2023-06-12','active'),
	 (19,5,'2024-11-15','active'),
	 (20,6,'2024-11-05','exited'),
	 (20,2,'2024-09-12','active'),
	 (21,6,'2024-07-15','exited'),
	 (21,4,'2024-07-11','exited'),
	 (22,5,'2023-12-09','active');
INSERT INTO public.children_programs_assigned (child_dbkey,program_dbkey,enrollment_date,status) VALUES
	 (23,2,'2023-04-06','exited'),
	 (23,4,'2023-06-16','active'),
	 (24,1,'2023-03-15','active'),
	 (25,5,'2023-10-08','active'),
	 (25,1,'2023-12-13','active'),
	 (26,6,'2024-05-24','exited'),
	 (26,3,'2023-09-04','active'),
	 (27,3,'2024-12-06','active'),
	 (27,2,'2023-12-04','active'),
	 (28,6,'2024-03-29','active');
INSERT INTO public.children_programs_assigned (child_dbkey,program_dbkey,enrollment_date,status) VALUES
	 (28,4,'2024-10-14','active'),
	 (29,3,'2024-10-21','active'),
	 (29,6,'2023-07-17','exited'),
	 (30,3,'2024-09-22','active'),
	 (30,1,'2024-04-01','exited'),
	 (31,5,'2024-09-17','exited'),
	 (32,4,'2023-11-09','active'),
	 (32,5,'2024-07-18','active'),
	 (33,3,'2024-12-24','active'),
	 (34,6,'2023-03-06','exited');
INSERT INTO public.children_programs_assigned (child_dbkey,program_dbkey,enrollment_date,status) VALUES
	 (35,6,'2023-06-25','exited'),
	 (36,1,'2024-08-31','active'),
	 (37,6,'2023-11-27','active'),
	 (37,2,'2023-05-04','active'),
	 (38,6,'2024-12-20','exited'),
	 (38,1,'2024-09-11','active'),
	 (39,1,'2023-07-29','active'),
	 (40,1,'2024-02-02','active');
INSERT INTO public.users (first_name,last_name,permissions,supervisor_id,status,"program",latitude,longitude,"type",title,email) VALUES
	 ('Jack','Garcia',3,4,'active',2,39.6754,-84.00573,'staff','Service Coordinator','jack.garcia@testemail.test'),
	 ('Wendy','Jones',2,4,'active',6,39.70095,-84.11878,'staff','Data Coordinator','wendy.jones@testemail.test'),
	 ('Liam','Brown',5,4,'active',3,39.706,-84.3064,'caregiver','Caregiver','liam.brown@testemail.test'),
	 ('Collin','Ferguson',0,NULL,'active',1,40.170665984,-83.523997904,'staff','Super Admin','collinLeeFerguson@gmail.com'),
	 ('Hannah','Lee',1,4,'active',3,39.77273,-84.38118,'staff','Supervisor','hannah.lee@testemail.test'),
	 ('Alice','Lopez',2,4,'archived',3,39.70806,-84.36348,'staff','Data Coordinator','alice.lopez@testemail.test'),
	 ('Sam','Lee',5,4,'active',2,39.75301,-84.16726,'caregiver','Caregiver','sam.lee@testemail.test'),
	 ('Victor','Jackson',5,4,'active',1,39.64542,-84.13958,'caregiver','Caregiver','victor.jackson@testemail.test'),
	 ('George','Miller',5,4,'active',5,39.75443,-84.0838,'caregiver','Caregiver','george.miller@testemail.test'),
	 ('Fiona','White',5,4,'active',3,39.67726,-84.28298,'caregiver','Caregiver','fiona.white@testemail.test');
INSERT INTO public.users (first_name,last_name,permissions,supervisor_id,status,"program",latitude,longitude,"type",title,email) VALUES
	 ('Victor','Taylor',5,4,'active',5,39.63898,-84.14229,'caregiver','Caregiver','victor.taylor@testemail.test'),
	 ('Fiona','Davis',4,2,'active',5,39.65188,-84.08132,'staff','Home Visitor','fiona.davis@testemail.test'),
	 ('Liam','Lee',1,NULL,'active',6,39.66171,-84.32759,'staff','Supervisor','liam.lee@testemail.test'),
	 ('Victor','Brown',4,1,'active',1,39.69742,-84.02118,'staff','Home Visitor','victor.brown@testemail.test'),
	 ('Victor','Rodriguez',2,2,'active',5,39.6323,-84.20608,'staff','Data Coordinator','victor.rodriguez@testemail.test'),
	 ('Xavier','Garcia',2,2,'active',6,39.62095,-84.24549,'staff','Data Coordinator','xavier.garcia@testemail.test'),
	 ('Paul','Jackson',1,NULL,'archived',5,39.61649,-84.02562,'staff','Supervisor','paul.jackson@testemail.test'),
	 ('Karen','Robinson',1,NULL,'archived',4,39.60802,-84.0928,'staff','Supervisor','karen.robinson@testemail.test'),
	 ('Alice','Lopez',4,19,'active',4,39.6575,-84.31053,'staff','Home Visitor','alice.lopez@testemail.test'),
	 ('Paul','Miller',4,13,'active',1,39.68665,-84.33836,'staff','Home Visitor','paul.miller@testemail.test');
INSERT INTO public.users (first_name,last_name,permissions,supervisor_id,status,"program",latitude,longitude,"type",title,email) VALUES
	 ('Wendy','Davis',1,NULL,'active',1,39.67935,-84.13526,'staff','Supervisor','wendy.davis@testemail.test'),
	 ('Karen','Miller',1,NULL,'active',1,39.66789,-84.34778,'staff','Supervisor','karen.miller@testemail.test'),
	 ('Noah','Thomas',2,8,'active',5,39.7889,-84.24324,'staff','Data Coordinator','noah.thomas@testemail.test'),
	 ('Alice','Lopez',1,NULL,'archived',3,39.78063,-84.21903,'staff','Supervisor','alice.lopez@testemail.test'),
	 ('Victor','Gonzalez',3,11,'active',5,39.66711,-84.16281,'staff','Service Coordinator','victor.gonzalez@testemail.test'),
	 ('Victor','Clark',4,11,'archived',3,39.63162,-84.22685,'staff','Home Visitor','victor.clark@testemail.test'),
	 ('Bob','Martinez',2,24,'archived',1,39.70207,-84.04587,'staff','Data Coordinator','bob.martinez@testemail.test'),
	 ('Xavier','Rodriguez',3,30,'active',5,39.67747,-84.07121,'staff','Service Coordinator','xavier.rodriguez@testemail.test'),
	 ('Hannah','Taylor',5,36,'active',2,39.62865,-84.02616,'caregiver','Caregiver','hannah.taylor@testemail.test'),
	 ('Wendy','Lewis',5,6,'active',5,39.68178,-84.01636,'caregiver','Caregiver','wendy.lewis@testemail.test');
INSERT INTO public.users (first_name,last_name,permissions,supervisor_id,status,"program",latitude,longitude,"type",title,email) VALUES
	 ('Zach','Gonzalez',5,6,'active',5,39.63169,-84.02316,'caregiver','Caregiver','zach.gonzalez@testemail.test'),
	 ('Yvonne','Lopez',5,22,'active',5,39.71454,-84.09355,'caregiver','Caregiver','yvonne.lopez@testemail.test'),
	 ('Jack','Clark',5,20,'archived',6,39.7539,-84.01997,'caregiver','Caregiver','jack.clark@testemail.test'),
	 ('Uma','Davis',5,42,'active',1,39.7524,-84.21374,'caregiver','Caregiver','uma.davis@testemail.test'),
	 ('Zach','Robinson',5,30,'active',3,39.73251,-84.21254,'caregiver','Caregiver','zach.robinson@testemail.test'),
	 ('Charlie','Moore',5,22,'active',3,39.61959,-84.15218,'caregiver','Caregiver','charlie.moore@testemail.test'),
	 ('Hannah','Jackson',5,13,'active',3,39.63962,-84.03492,'caregiver','Caregiver','hannah.jackson@testemail.test'),
	 ('Mia','Garcia',5,38,'archived',1,39.74694,-84.13045,'caregiver','Caregiver','mia.garcia@testemail.test'),
	 ('Hannah','Miller',5,19,'active',2,39.78184,-84.188,'caregiver','Caregiver','hannah.miller@testemail.test'),
	 ('Yvonne','Lewis',5,8,'active',2,39.77477,-84.21996,'caregiver','Caregiver','yvonne.lewis@testemail.test');
INSERT INTO public.users (first_name,last_name,permissions,supervisor_id,status,"program",latitude,longitude,"type",title,email) VALUES
	 ('Uma','Garcia',5,37,'active',3,39.67277,-84.08948,'caregiver','Caregiver','uma.garcia@testemail.test'),
	 ('Ivan','Martinez',5,4,'active',5,39.66365,-84.14876,'caregiver','Caregiver','ivan.martinez@testemail.test'),
	 ('Tina','Jackson',5,26,'active',3,39.64887,-84.15305,'caregiver','Caregiver','tina.jackson@testemail.test'),
	 ('Noah','Hernandez',5,33,'active',2,39.78281,-84.01879,'caregiver','Caregiver','noah.hernandez@testemail.test'),
	 ('Olivia','Moore',5,18,'archived',5,39.71164,-84.27395,'caregiver','Caregiver','olivia.moore@testemail.test'),
	 ('George','Miller',5,56,'active',6,39.7913,-84.34982,'caregiver','Caregiver','george.miller@testemail.test'),
	 ('Xavier','Anderson',5,30,'active',6,39.7942,-84.2536,'caregiver','Caregiver','xavier.anderson@testemail.test'),
	 ('Liam','Martinez',5,21,'active',4,39.68212,-84.13409,'caregiver','Caregiver','liam.martinez@testemail.test'),
	 ('Mia','Martinez',1,4,'active',1,39.64076,-84.17539,'staff','Supervisor','mia.martinez@testemail.test'),
	 ('Yvonne','Martinez',4,4,'active',4,39.7933,-84.16714,'staff','Home Visitor','yvonne.martinez@testemail.test');
INSERT INTO public.users (first_name,last_name,permissions,supervisor_id,status,"program",latitude,longitude,"type",title,email) VALUES
	 ('Jack','Williams',4,4,'active',1,39.70222,-84.17916,'staff','Home Visitor','jack.williams@testemail.test'),
	 ('Charlie','Brown',2,4,'active',5,39.74614,-84.1854,'staff','Data Coordinator','charlie.brown@testemail.test'),
	 ('Tina','Thomas',4,4,'active',2,39.63524,-84.37906,'staff','Home Visitor','tina.thomas@testemail.test'),
	 ('Hannah','Lewis',3,4,'active',2,39.7865,-84.015,'staff','Service Coordinator','hannah.lewis@testemail.test'),
	 ('Victor','Clark',2,4,'archived',1,39.60039,-84.38873,'staff','Data Coordinator','victor.clark@testemail.test'),
	 ('Zach','Thomas',4,5,'active',4,39.62393,-84.35979,'staff','Home Visitor','zach.thomas@testemail.test'),
	 ('Wendy','Anderson',1,NULL,'active',6,39.70083,-84.08037,'staff','Supervisor','wendy.anderson@testemail.test'),
	 ('Paul','Martin',5,40,'archived',1,39.74909,-84.05778,'caregiver','Caregiver','paul.martin@testemail.test'),
	 ('Noah','Davis',5,21,'active',6,39.78632,-84.10613,'caregiver','Caregiver','noah.davis@testemail.test'),
	 ('Karen','Garcia',5,33,'archived',6,39.77308,-84.21752,'caregiver','Caregiver','karen.garcia@testemail.test');
INSERT INTO public.users (first_name,last_name,permissions,supervisor_id,status,"program",latitude,longitude,"type",title,email) VALUES
	 ('Karen','Johnson',5,55,'active',1,39.62648,-84.21306,'caregiver','Caregiver','karen.johnson@testemail.test');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (46,5,1,16,'Unconfirmed','2024-06-21'),
	 (46,5,1,35,'Completed','2024-06-20'),
	 (46,5,1,71,'Attempted','2025-02-15'),
	 (46,5,1,32,'Completed','2024-10-18'),
	 (46,5,1,63,'Completed','2024-07-18'),
	 (46,5,1,70,'Unconfirmed','2024-03-20'),
	 (46,5,1,32,'Cancelled','2024-03-17'),
	 (46,5,1,64,'Completed','2025-02-06'),
	 (46,5,1,21,'Cancelled','2024-10-29'),
	 (46,5,1,68,'Completed','2024-11-25');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (43,1,2,66,'Completed','2024-09-10'),
	 (43,3,2,32,'Unconfirmed','2024-12-10'),
	 (43,1,2,15,'Cancelled','2024-06-20'),
	 (43,1,2,72,'Cancelled','2024-05-20'),
	 (43,3,2,45,'Completed','2024-03-16'),
	 (43,3,2,74,'No-Show','2024-09-28'),
	 (52,1,3,44,'Unconfirmed','2024-05-22'),
	 (52,1,3,42,'Completed','2024-05-27'),
	 (52,1,3,31,'Cancelled','2024-10-28'),
	 (52,1,3,27,'Cancelled','2024-03-11');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (52,1,3,52,'Unconfirmed','2024-06-01'),
	 (52,1,3,54,'No-Show','2024-03-19'),
	 (52,1,3,51,'No-Show','2024-10-04'),
	 (52,1,3,12,'No-Show','2024-12-05'),
	 (52,1,3,46,'No-Show','2024-07-23'),
	 (52,1,3,46,'Completed','2024-04-21'),
	 (52,1,3,44,'Completed','2024-07-17'),
	 (39,1,4,52,'Completed','2025-01-01'),
	 (39,1,4,47,'No-Show','2024-10-08'),
	 (39,1,4,51,'Cancelled','2024-07-09');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (39,1,4,49,'Attempted','2024-07-10'),
	 (39,1,4,37,'Attempted','2024-06-21'),
	 (39,1,4,20,'No-Show','2024-08-24'),
	 (39,1,4,14,'Unconfirmed','2024-10-09'),
	 (39,1,4,71,'Completed','2024-09-30'),
	 (58,1,5,35,'Attempted','2024-04-06'),
	 (58,1,5,71,'No-Show','2024-11-29'),
	 (58,1,5,52,'No-Show','2025-01-22'),
	 (58,1,5,44,'Cancelled','2024-09-17'),
	 (58,1,5,38,'No-Show','2025-02-18');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (58,1,5,43,'Cancelled','2024-10-19'),
	 (58,1,5,34,'Unconfirmed','2024-07-17'),
	 (58,1,5,74,'Completed','2025-02-24'),
	 (58,1,5,41,'Unconfirmed','2024-04-30'),
	 (59,5,6,67,'Completed','2024-03-31'),
	 (59,3,6,36,'Cancelled','2025-02-28'),
	 (59,3,6,62,'Attempted','2024-12-11'),
	 (59,5,6,47,'Attempted','2024-08-29'),
	 (59,5,6,10,'Attempted','2024-04-24'),
	 (59,5,6,57,'Unconfirmed','2024-04-10');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (59,3,6,48,'Attempted','2024-07-25'),
	 (59,5,6,12,'Attempted','2025-02-27'),
	 (60,2,7,44,'Completed','2024-07-18'),
	 (60,2,7,25,'Cancelled','2024-08-09'),
	 (60,2,7,19,'Completed','2025-01-18'),
	 (60,2,7,56,'Unconfirmed','2024-09-17'),
	 (60,2,7,42,'Cancelled','2025-01-01'),
	 (60,2,7,70,'Cancelled','2024-07-08'),
	 (60,2,7,15,'Unconfirmed','2024-04-10'),
	 (60,2,7,50,'No-Show','2024-12-09');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (42,6,8,10,'Attempted','2024-08-27'),
	 (42,6,8,23,'Attempted','2024-10-23'),
	 (42,6,8,51,'Completed','2024-07-24'),
	 (42,6,8,24,'Unconfirmed','2024-08-06'),
	 (42,6,8,56,'Attempted','2025-02-08'),
	 (42,6,8,47,'Cancelled','2024-10-14'),
	 (42,6,8,69,'No-Show','2024-03-15'),
	 (42,6,8,24,'Completed','2025-01-14'),
	 (42,6,8,71,'Completed','2024-07-25'),
	 (42,6,8,35,'Unconfirmed','2024-10-19');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (42,6,8,24,'Unconfirmed','2024-12-14'),
	 (58,2,9,19,'Completed','2025-01-12'),
	 (58,2,9,65,'Unconfirmed','2024-08-29'),
	 (58,3,9,53,'Attempted','2024-08-14'),
	 (58,3,9,54,'Unconfirmed','2025-01-23'),
	 (58,3,9,55,'Completed','2024-11-14'),
	 (58,3,9,20,'Unconfirmed','2025-01-13'),
	 (58,2,9,10,'Completed','2025-01-03'),
	 (58,2,9,10,'Cancelled','2024-05-12'),
	 (58,2,9,47,'Attempted','2024-04-05');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (58,3,9,38,'Attempted','2024-05-13'),
	 (41,4,10,66,'Completed','2024-05-30'),
	 (41,4,10,74,'No-Show','2024-11-30'),
	 (41,4,10,69,'Unconfirmed','2024-08-08'),
	 (41,4,10,43,'Unconfirmed','2024-10-23'),
	 (41,4,10,54,'Unconfirmed','2024-12-11'),
	 (41,4,10,51,'No-Show','2024-11-04'),
	 (41,4,10,22,'No-Show','2024-06-15'),
	 (41,4,10,24,'Attempted','2024-05-23'),
	 (41,4,10,42,'Completed','2024-03-15');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (40,4,11,26,'Unconfirmed','2024-12-08'),
	 (40,4,11,12,'Unconfirmed','2025-02-23'),
	 (40,4,11,35,'Attempted','2024-11-06'),
	 (40,4,11,70,'Unconfirmed','2024-06-01'),
	 (40,4,11,63,'Completed','2025-01-21'),
	 (40,4,11,57,'Completed','2024-04-05'),
	 (40,4,11,67,'Unconfirmed','2024-09-21'),
	 (40,4,11,27,'Unconfirmed','2024-03-23'),
	 (32,4,12,17,'Completed','2024-05-30'),
	 (32,4,12,72,'Attempted','2025-02-12');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (32,4,12,28,'Completed','2024-06-11'),
	 (32,4,12,29,'Attempted','2025-02-11'),
	 (32,4,12,27,'No-Show','2024-07-04'),
	 (32,4,12,44,'Unconfirmed','2025-01-15'),
	 (45,4,13,32,'Unconfirmed','2024-11-18'),
	 (45,4,13,40,'Cancelled','2024-08-11'),
	 (45,4,13,41,'Cancelled','2024-09-05'),
	 (45,4,13,14,'Cancelled','2025-02-27'),
	 (45,4,13,13,'Cancelled','2024-07-17'),
	 (45,4,13,68,'Unconfirmed','2024-09-16');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (52,4,14,61,'No-Show','2024-03-27'),
	 (52,4,14,51,'Cancelled','2024-05-18'),
	 (52,4,14,43,'No-Show','2024-09-10'),
	 (52,4,14,71,'Attempted','2024-10-11'),
	 (52,4,14,31,'No-Show','2024-06-18'),
	 (51,5,15,28,'No-Show','2024-10-13'),
	 (51,5,15,34,'Unconfirmed','2024-07-12'),
	 (51,5,15,23,'Completed','2024-06-25'),
	 (51,5,15,10,'No-Show','2024-09-22'),
	 (51,5,15,71,'No-Show','2024-09-30');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (51,5,15,64,'Attempted','2024-07-08'),
	 (51,5,15,55,'Unconfirmed','2024-04-24'),
	 (51,5,15,64,'No-Show','2024-11-15'),
	 (51,5,15,23,'Unconfirmed','2025-01-16'),
	 (51,5,15,70,'Cancelled','2025-03-03'),
	 (36,1,16,39,'Completed','2024-11-25'),
	 (36,1,16,36,'Completed','2024-10-08'),
	 (36,1,16,55,'Attempted','2025-02-08'),
	 (36,2,16,74,'Cancelled','2024-05-14'),
	 (36,1,16,74,'No-Show','2024-12-09');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (36,1,16,50,'Completed','2024-04-03'),
	 (36,2,16,48,'Cancelled','2024-04-07'),
	 (31,2,17,59,'Completed','2024-12-08'),
	 (31,2,17,41,'Completed','2025-02-26'),
	 (31,2,17,72,'Unconfirmed','2025-01-08'),
	 (31,2,17,30,'Cancelled','2025-02-21'),
	 (31,2,17,53,'No-Show','2024-06-20'),
	 (31,2,17,52,'Cancelled','2024-12-10'),
	 (48,2,18,24,'Attempted','2024-03-26'),
	 (48,4,18,70,'Completed','2024-09-23');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (48,2,18,24,'Completed','2024-05-15'),
	 (48,2,18,19,'Unconfirmed','2024-07-21'),
	 (48,4,18,23,'Unconfirmed','2024-09-23'),
	 (57,1,19,73,'Attempted','2024-03-21'),
	 (57,1,19,49,'No-Show','2024-07-24'),
	 (57,1,19,51,'No-Show','2024-08-10'),
	 (57,5,19,75,'Completed','2024-08-26'),
	 (57,1,19,48,'Completed','2024-12-29'),
	 (57,5,19,46,'Completed','2024-11-18'),
	 (57,1,19,44,'Attempted','2025-01-06');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (60,6,20,59,'Attempted','2024-10-22'),
	 (60,2,20,38,'Cancelled','2024-08-20'),
	 (60,2,20,23,'Cancelled','2024-03-20'),
	 (60,6,20,38,'Attempted','2025-01-20'),
	 (60,6,20,35,'Cancelled','2024-05-12'),
	 (60,6,20,75,'Cancelled','2024-03-19'),
	 (60,2,20,23,'No-Show','2024-12-01'),
	 (60,6,20,27,'Completed','2025-01-15'),
	 (60,6,20,38,'Cancelled','2025-01-27'),
	 (60,2,20,11,'Completed','2025-01-23');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (49,6,21,24,'Attempted','2024-10-22'),
	 (49,6,21,46,'Completed','2024-07-03'),
	 (49,4,21,31,'Cancelled','2024-09-07'),
	 (49,4,21,70,'Cancelled','2024-12-04'),
	 (49,4,21,42,'Unconfirmed','2024-07-30'),
	 (49,6,21,25,'Completed','2024-10-03'),
	 (49,4,21,27,'No-Show','2024-10-14'),
	 (49,6,21,11,'Completed','2024-10-08'),
	 (49,4,21,36,'Unconfirmed','2024-07-06'),
	 (37,5,22,22,'Unconfirmed','2025-01-11');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (37,5,22,42,'Completed','2024-09-10'),
	 (37,5,22,31,'No-Show','2024-06-30'),
	 (37,5,22,17,'No-Show','2024-11-28'),
	 (37,5,22,23,'Unconfirmed','2024-03-29'),
	 (42,2,23,34,'Cancelled','2024-04-20'),
	 (42,2,23,71,'Completed','2024-05-03'),
	 (42,4,23,11,'Cancelled','2024-05-26'),
	 (42,4,23,48,'Unconfirmed','2025-01-26'),
	 (42,4,23,51,'Attempted','2024-05-23'),
	 (42,2,23,75,'Completed','2024-11-28');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (42,2,23,54,'Unconfirmed','2025-03-01'),
	 (42,2,23,37,'Completed','2024-10-01'),
	 (31,1,24,46,'Cancelled','2024-03-18'),
	 (31,1,24,69,'Cancelled','2024-07-27'),
	 (31,1,24,25,'No-Show','2024-04-23'),
	 (31,1,24,73,'Attempted','2024-07-28'),
	 (31,1,24,74,'No-Show','2024-05-27'),
	 (31,1,24,11,'Unconfirmed','2024-09-24'),
	 (31,1,24,20,'No-Show','2024-10-12'),
	 (31,1,24,53,'Completed','2024-04-09');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (31,1,24,53,'Attempted','2024-04-30'),
	 (31,1,24,54,'Cancelled','2024-07-12'),
	 (35,5,25,26,'Unconfirmed','2024-04-13'),
	 (35,5,25,19,'Unconfirmed','2024-08-01'),
	 (35,5,25,58,'Cancelled','2025-01-05'),
	 (35,5,25,59,'Unconfirmed','2024-06-24'),
	 (35,5,25,42,'Completed','2024-06-09'),
	 (35,5,25,19,'Cancelled','2025-02-08'),
	 (58,3,26,52,'Cancelled','2024-05-26'),
	 (58,6,26,13,'Completed','2025-02-16');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (58,6,26,47,'No-Show','2024-05-05'),
	 (58,6,26,73,'Unconfirmed','2024-07-11'),
	 (58,6,26,29,'Unconfirmed','2024-11-27'),
	 (58,3,26,75,'Attempted','2024-10-09'),
	 (58,6,26,51,'Cancelled','2024-11-19'),
	 (58,3,26,35,'Attempted','2024-06-20'),
	 (58,3,26,18,'Cancelled','2024-10-03'),
	 (58,3,26,27,'Completed','2024-05-17'),
	 (48,3,27,62,'Attempted','2024-07-30'),
	 (48,2,27,64,'Attempted','2025-02-27');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (48,2,27,58,'Completed','2024-04-19'),
	 (48,3,27,32,'Unconfirmed','2024-08-03'),
	 (48,3,27,54,'Cancelled','2024-07-03'),
	 (48,2,27,73,'Attempted','2024-05-27'),
	 (48,3,27,21,'Completed','2024-06-18'),
	 (48,2,27,11,'No-Show','2024-03-16'),
	 (48,2,27,33,'Completed','2024-03-07'),
	 (35,6,28,47,'Cancelled','2024-10-02'),
	 (35,4,28,64,'Completed','2024-12-22'),
	 (35,6,28,26,'Cancelled','2024-08-10');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (35,4,28,43,'Unconfirmed','2025-01-17'),
	 (35,6,28,61,'Unconfirmed','2025-01-20'),
	 (35,4,28,52,'Attempted','2024-12-01'),
	 (46,6,29,10,'Cancelled','2024-05-08'),
	 (46,6,29,18,'Unconfirmed','2024-03-19'),
	 (46,3,29,63,'Attempted','2024-06-17'),
	 (46,3,29,20,'Completed','2024-05-21'),
	 (46,6,29,30,'No-Show','2024-08-27'),
	 (46,3,29,12,'Cancelled','2024-04-14'),
	 (46,3,29,64,'Unconfirmed','2024-12-03');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (46,3,29,18,'Unconfirmed','2024-06-16'),
	 (55,1,30,72,'No-Show','2024-08-09'),
	 (55,1,30,41,'Completed','2024-10-29'),
	 (55,3,30,37,'Unconfirmed','2024-06-17'),
	 (55,3,30,12,'Cancelled','2025-01-12'),
	 (55,3,30,66,'Completed','2024-07-29'),
	 (55,5,31,22,'Cancelled','2024-05-25'),
	 (55,5,31,61,'Attempted','2024-11-15'),
	 (55,5,31,61,'No-Show','2024-05-20'),
	 (55,5,31,73,'No-Show','2024-12-09');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (55,5,31,73,'Unconfirmed','2024-03-19'),
	 (55,5,31,42,'Unconfirmed','2025-02-24'),
	 (55,5,31,75,'Completed','2024-07-06'),
	 (35,5,32,28,'No-Show','2024-10-18'),
	 (35,5,32,12,'Cancelled','2024-06-14'),
	 (35,4,32,47,'Attempted','2024-06-10'),
	 (35,5,32,58,'No-Show','2025-01-30'),
	 (35,4,32,63,'Attempted','2024-05-06'),
	 (35,5,32,58,'Cancelled','2024-10-23'),
	 (35,5,32,29,'Cancelled','2024-08-29');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (35,5,32,57,'Cancelled','2024-04-11'),
	 (35,4,32,58,'Attempted','2024-08-13'),
	 (34,3,33,62,'Cancelled','2024-11-13'),
	 (34,3,33,14,'No-Show','2024-12-22'),
	 (34,3,33,21,'Unconfirmed','2025-01-21'),
	 (34,3,33,61,'Attempted','2025-02-17'),
	 (34,3,33,28,'Attempted','2024-09-12'),
	 (34,3,33,51,'Attempted','2024-05-30'),
	 (34,3,33,65,'No-Show','2024-09-26'),
	 (34,3,33,64,'Completed','2024-06-19');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (44,6,34,14,'No-Show','2024-10-28'),
	 (44,6,34,72,'Cancelled','2024-10-30'),
	 (44,6,34,16,'Attempted','2024-03-25'),
	 (44,6,34,35,'Cancelled','2024-06-19'),
	 (44,6,34,12,'Unconfirmed','2024-10-16'),
	 (55,6,35,37,'Unconfirmed','2024-12-06'),
	 (55,6,35,51,'Cancelled','2024-09-06'),
	 (55,6,35,60,'Attempted','2025-01-29'),
	 (55,6,35,62,'Completed','2024-04-18'),
	 (55,6,35,52,'Completed','2024-07-01');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (55,6,35,35,'Attempted','2024-11-11'),
	 (55,6,35,10,'No-Show','2024-09-05'),
	 (55,6,35,24,'Cancelled','2024-10-17'),
	 (55,6,35,55,'No-Show','2024-07-08'),
	 (55,6,35,19,'No-Show','2025-01-10'),
	 (60,1,36,27,'Attempted','2024-04-24'),
	 (60,1,36,20,'Completed','2025-02-19'),
	 (60,1,36,69,'Cancelled','2024-03-10'),
	 (60,1,36,64,'No-Show','2024-09-19'),
	 (60,1,36,29,'Completed','2024-12-09');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (60,1,36,16,'Cancelled','2024-05-17'),
	 (60,1,36,28,'Completed','2024-05-11'),
	 (54,2,37,58,'No-Show','2024-09-22'),
	 (54,2,37,40,'Cancelled','2025-02-20'),
	 (54,2,37,68,'Completed','2024-09-22'),
	 (54,6,37,65,'Cancelled','2024-07-11'),
	 (54,2,37,27,'Cancelled','2024-08-09'),
	 (54,2,37,67,'Cancelled','2025-01-15'),
	 (54,2,37,40,'No-Show','2024-07-08'),
	 (54,2,37,36,'Unconfirmed','2024-11-25');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (51,1,38,10,'Completed','2024-03-26'),
	 (51,1,38,23,'Completed','2024-09-28'),
	 (51,6,38,55,'Unconfirmed','2024-05-17'),
	 (51,1,38,60,'No-Show','2024-07-15'),
	 (51,1,38,37,'Completed','2025-01-25'),
	 (51,1,38,57,'Cancelled','2024-12-16'),
	 (51,1,38,29,'Completed','2024-05-13'),
	 (48,1,39,35,'Unconfirmed','2024-11-13'),
	 (48,1,39,22,'Cancelled','2025-02-06'),
	 (48,1,39,48,'No-Show','2024-04-07');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (48,1,39,58,'Attempted','2024-07-25'),
	 (48,1,39,45,'Attempted','2024-07-10'),
	 (52,1,40,51,'No-Show','2024-09-30'),
	 (52,1,40,63,'Completed','2024-08-20'),
	 (52,1,40,67,'No-Show','2024-03-23'),
	 (52,1,40,50,'Cancelled','2024-11-06'),
	 (52,1,40,65,'Unconfirmed','2025-02-15'),
	 (52,1,40,44,'Attempted','2024-04-19'),
	 (52,1,40,39,'Cancelled','2024-04-27'),
	 (52,1,40,15,'Cancelled','2024-09-16');
INSERT INTO public.visits (staff_dbkey,assigned_program_dbkey,assigned_child_dbkey,mileage,status,visit_date) VALUES
	 (52,1,40,23,'Cancelled','2024-03-09');
SET session_replication_role = 'origin';
