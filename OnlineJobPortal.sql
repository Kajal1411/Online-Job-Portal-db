create table users(user_id number(10) constraints user_id_pk primary key,username varchar2(30),constraint username_uk unique(username),first_name varchar2(30),last_name varchar2(30),email varchar2(30),constraint email_uk unique(email),password varchar2(30),mob number(10),user_tye varchar2(20),status varchar2(10));

create table resumes(resume_id number(10) constraints resume_id_pk primary key,college varchar2(50),education varchar2(30),passout_year number(10),grade varchar2(10),experiance varchar2(20),experiance_company varchar2(30),experiance_position varchar2(30),languages_spoken varchar2(50),references varchar2(50));

create table job_categories(job_category_id number(10) constraints job_category_id_pk primary key,category_name varchar2(40),constraints category_name_uk unique(category_name),category_description varchar2(500),avg_salary number(10),job_count number(10));

create table location(location_id number(10) constraints location_id_pk primary key,location_name varchar2(30),city varchar2(30),state varchar2(30),country varchar2(30),pincode number(10));

create table job_type(job_type_id number(10) constraints job_type_id_pk primary key,type_name varchar2(30),type_description varchar2(250),remote_option varchar2(20),hours_per_day number(10),type_category varchar2(30),work_schedule varchar2(30));

create table companies(company_id number(10) constraints company_id_pk primary key,company_name varchar2(30),constraints company_name_uk unique(company_name),founded_year number(10),no_of_emp number(10),website_url varchar2(50),email varchar2(50),constraints email2_uk unique(email),phone number(10),company_size varchar2(30),headquarters_location varchar2(30));

create table employers(emp_id number(10) constraints emp_id_pk primary key,user_id number(10),company_id number(10),company_size varchar2(30),company_name varchar2(30),address varchar2(100),website_url varchar2(50),industry varchar2(50),constraints user_id_fk foreign key(user_id) references users(user_id),constraints company_id_fk foreign key(company_id) references companies(company_id));

create table job_seekers(job_seeker_id number(10) constraints job_seeker_id_pk primary key,user_id number(10),resume_id number(10),location_id number(10),profile_summary varchar2(500),desired_salary number(10),availabilty varchar2(30),constraints user2_id_fk foreign key(user_id) references users(user_id),constraints resume_id_fk foreign key(resume_id) references resumes(resume_id),constraints location_id_fk foreign key(location_id) references location(location_id));

