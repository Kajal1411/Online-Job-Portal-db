create table users(user_id number(10) constraints user_id_pk primary key,username varchar2(30),constraint username_uk unique(username),first_name varchar2(30),last_name varchar2(30),email varchar2(30),constraint email_uk unique(email),password varchar2(30),mob number(10),user_tye varchar2(20),status varchar2(10));

create table resumes(resume_id number(10) constraints resume_id_pk primary key,college varchar2(50),education varchar2(30),passout_year number(10),grade varchar2(10),experiance varchar2(20),experiance_company varchar2(30),experiance_position varchar2(30),languages_spoken varchar2(50),references varchar2(50));

create table job_categories(job_category_id number(10) constraints job_category_id_pk primary key,category_name varchar2(40),constraints category_name_uk unique(category_name),category_description varchar2(500),avg_salary number(10),job_count number(10));

create table location(location_id number(10) constraints location_id_pk primary key,location_name varchar2(30),city varchar2(30),state varchar2(30),country varchar2(30),pincode number(10));

create table job_type(job_type_id number(10) constraints job_type_id_pk primary key,type_name varchar2(30),type_description varchar2(250),remote_option varchar2(20),hours_per_day number(10),type_category varchar2(30),work_schedule varchar2(30));

create table companies(company_id number(10) constraints company_id_pk primary key,company_name varchar2(30),constraints company_name_uk unique(company_name),founded_year number(10),no_of_emp number(10),website_url varchar2(50),email varchar2(50),constraints email2_uk unique(email),phone number(10),company_size varchar2(30),headquarters_location varchar2(30));

create table employers(emp_id number(10) constraints emp_id_pk primary key,user_id number(10),company_id number(10),company_size varchar2(30),company_name varchar2(30),address varchar2(100),website_url varchar2(50),industry varchar2(50),constraints user_id_fk foreign key(user_id) references users(user_id),constraints company_id_fk foreign key(company_id) references companies(company_id));

create table job_seekers(job_seeker_id number(10) constraints job_seeker_id_pk primary key,user_id number(10),resume_id number(10),location_id number(10),profile_summary varchar2(500),desired_salary number(10),availabilty varchar2(30),constraints user2_id_fk foreign key(user_id) references users(user_id),constraints resume_id_fk foreign key(resume_id) references resumes(resume_id),constraints location_id_fk foreign key(location_id) references location(location_id));

create table jobs2(job_id number(10) constraints job_id_pk2 primary key,emp_id number(10),job_tittle varchar2(50),job_description varchar2(500),job_category_id number(10),location_id number(10),job_type_id number(10),min_salary number(10),max_salary number(10),closing_date date,constraints emp_id_fk2 foreign key(emp_id) references employers(emp_id),constraints job_category_id_fk2 foreign key(job_category_id) references job_categories(job_category_id),constraints location_id_fk2 foreign key(location_id) references location(location_id),constraints job_type_id_fk2 foreign key(job_type_id) references job_type(job_type_id));

create table job_required_skills(skill_id number(10) constraints skill_id_pk primary key,skill_name varchar2(30),constraints skill_name_uk unique(skill_name),skill_description varchar2(500),proficiency_level varchar2(50),skill_category varchar2(50),job_id number(10),constraints job_id_fk foreign key(job_id) references jobs2(job_id));

create table company_offices(office_id number(10) constraints office_id_pk primary key,company_id number(10),office_location varchar2(20),city varchar2(30),state varchar2(30),country varchar2(30),contact_number number(10),email varchar2(30),manager_name varchar2(30),constraints company_id_fk2 foreign key(company_id) references companies(company_id));

create table job_seekers_skills(job_seekers_skill_id number(10) constraints job_seekers_skill_id_pk primary key,job_seeker_id number(10),skill_id number(10),proficiency_level varchar2(30),experiance varchar2(30),certification varchar2(30),related_projects varchar2(50),skill_rating number(10),resume_id number(10),constraintsjob_seeker_id_fk foreign key(job_seeker_id) references job_seekers(job_seeker_id),constraints skill_id_fk foreign key(skill_id) references job_required_skills(skill_id),constraints resume_id_fk2 foreign key(resume_id) references resumes(resume_id));

create table employer_reviews(review_id number(10) constraints review_id_pk primary key,emp_id number(10),job_seeker_id number(10),review_date date,review_text varchar2(250),rating number(10),job_position_reviewed varchar2(30),pros varchar2(100),cons varchar2(100),constraints emp_id_fk3 foreign key(emp_id) references employers(emp_id),constraints job_seeker_id_fk2 foreign key(job_seeker_id) references job_seekers(job_seeker_id));
