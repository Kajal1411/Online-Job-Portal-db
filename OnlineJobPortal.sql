create table users(user_id number(10) constraints user_id_pk primary key,username varchar2(30),constraint username_uk unique(username),first_name varchar2(30),last_name varchar2(30),email varchar2(30),constraint email_uk unique(email),password varchar2(30),mob number(10),user_tye varchar2(20),status varchar2(10));

create table resumes(resume_id number(10) constraints resume_id_pk primary key,college varchar2(50),education varchar2(30),passout_year number(10),grade varchar2(10),experiance varchar2(20),experiance_company varchar2(30),experiance_position varchar2(30),languages_spoken varchar2(50),references varchar2(50));

create table job_categories(job_category_id number(10) constraints job_category_id_pk primary key,category_name varchar2(40),constraints category_name_uk unique(category_name),category_description varchar2(500),avg_salary number(10),job_count number(10));

create table location(location_id number(10) constraints location_id_pk primary key,location_name varchar2(30),city varchar2(30),state varchar2(30),country varchar2(30),pincode number(10));
