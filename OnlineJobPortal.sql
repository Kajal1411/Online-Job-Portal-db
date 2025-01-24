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

create table messages(msg_id number(10) constraints msg_id_pk primary key,emp_id number(10),job_seeker_id number(10),subject varchar2(50),msg_body varchar2(250),send_at date,is_read varchar2(20),constraints emp_id_fk4 foreign key(emp_id) references employers(emp_id),constraints job_seeker_id_fk4 foreign key(job_seeker_id) references job_seekers(job_seeker_id));

create table certifications(certification_id number(10) constraints certification_id_pk primary key,resume_id number(10),certification_name varchar2(50),institute_name varchar2(50),start_date date,end_date date,grade varchar2(10),job_seeker_id number(10),constraints resume_id_fk7 foreign key(resume_id) references resumes(resume_id),constraints job_seeker_id_fk7 foreign key(job_seeker_id) references job_seekers(job_seeker_id));

create table applications(application_id number(10) constraints application_id_pk primary key,job_id number(10),job_seeker_id number(10),application_date date,application_status varchar2(30),resume_id number(10),constraints job_id_fk8 foreign key(job_id) references jobs2(job_id),constraints job_seeker_id_fk8 foreign key(job_seeker_id) references job_seekers(job_seeker_id),constraints resume_id_fk8 foreign key(resume_id) references resumes(resume_id));

create table interview_schedules(interview_schedule_id number(10) constraints interview_schedule_id_pk primary key,application_id number(10),emp_id number(10),interview_date date,location varchar2(50),interview_type varchar2(50),job_seeker_id number(10),interview_status varchar2(30),constraints application_id_fk9 foreign key(application_id) references applications(application_id),constraints emp_id_fk9 foreign key(emp_id) references employers(emp_id),constraints job_seeker_id_fk9 foreign key(job_seeker_id) references job_seekers(job_seeker_id));


insert all
into users values(1, 'amit123', 'Amit', 'Sharma', 'amit@email.com', 'amit@123', 9876543201, 'job_seeker', 'active')
into users values(2, 'karan456', 'Karan', 'Verma', 'karan@email.com', 'karan@456', 9876543202, 'employer', 'active')
into users values(3, 'jay789', 'Jay', 'Patel', 'jay@email.com', 'jay@789', 9876543203, 'job_seeker', 'inactive')
into users values(4, 'vijay012', 'Vijay', 'Rao', 'vijay@email.com', 'vijay@012', 9876543204, 'employer', 'active')
into users values(5, 'om345', 'Om', 'Mehta', 'om@email.com', 'om@345', 9876543205, 'job_seeker', 'active')
into users values(6, 'ravi678', 'Ravi', 'Kumar', 'ravi@email.com', 'ravi@678', 9876543206, 'employer', 'inactive')
into users values(7, 'raju901', 'Raju', 'Singh', 'raju@email.com', 'raju@901', 9876543207, 'job_seeker', 'active')
into users values(8, 'ajay234', 'Ajay', 'Gupta', 'ajay@email.com', 'ajay@234', 9876543208, 'employer', 'active')
into users values(9, 'rohit567', 'Rohit', 'Mishra', 'rohit@email.com', 'rohit@567', 9876543209, 'job_seeker', 'inactive')
into users values(10, 'anil890', 'Anil', 'Yadav', 'anil@email.com', 'anil@890', 9876543210, 'employer', 'active')
into users values(11, 'rahul321', 'Rahul', 'Joshi', 'rahul@email.com', 'rahul@321', 9876543211, 'job_seeker', 'active')
into users values(12, 'mohan654', 'Mohan', 'Desai', 'mohan@email.com', 'mohan@654', 9876543212, 'employer', 'inactive')
into users values(13, 'raj123', 'Raj', 'Singhania', 'raj@email.com', 'raj@123', 9876543213, 'job_seeker', 'active')
into users values(14, 'aman456', 'Aman', 'Khanna', 'aman@email.com', 'aman@456', 9876543214, 'employer', 'active')
into users values(15, 'arjun789', 'Arjun', 'Bajaj', 'arjun@email.com', 'arjun@789', 9876543215, 'job_seeker', 'inactive')
into users values(16, 'sanjay012', 'Sanjay', 'Sethi', 'sanjay@email.com', 'sanjay@012', 9876543216, 'employer', 'active')
into users values(17, 'vivek345', 'Vivek', 'Kapoor', 'vivek@email.com', 'vivek@345', 9876543217, 'job_seeker', 'active')
into users values(18, 'ankit678', 'Ankit', 'Chauhan', 'ankit@email.com', 'ankit@678', 9876543218, 'employer', 'inactive')
into users values(19, 'deepak901', 'Deepak', 'Nair', 'deepak@email.com', 'deepak@901', 9876543219, 'job_seeker', 'active')
into users values(20, 'sumit234', 'Sumit', 'Roy', 'sumit@email.com', 'sumit@234', 9876543220, 'employer', 'active')
into users values(21, 'manoj567', 'Manoj', 'Thakur', 'manoj@email.com', 'manoj@567', 9876543221, 'job_seeker', 'inactive')
into users values(22, 'sunil890', 'Sunil', 'Das', 'sunil@email.com', 'sunil@890', 9876543222, 'employer', 'active')
into users values(23, 'vikas321', 'Vikas', 'Agrawal', 'vikas@email.com', 'vikas@321', 9876543223, 'job_seeker', 'active')
into users values(24, 'ramesh654', 'Ramesh', 'Pandey', 'ramesh@email.com', 'ramesh@654', 9876543224, 'employer', 'inactive')
into users values(25, 'shyam123', 'Shyam', 'Malhotra', 'shyam@email.com', 'shyam@123', 9876543225, 'job_seeker', 'active')
into users values(26, 'pranav456', 'Pranav', 'Tiwari', 'pranav@email.com', 'pranav@456', 9876543226, 'employer', 'active')
into users values(27, 'nilesh789', 'Nilesh', 'Bhatia', 'nilesh@email.com', 'nilesh@789', 9876543227, 'job_seeker', 'inactive')
into users values(28, 'ganesh012', 'Ganesh', 'Naik', 'ganesh@email.com', 'ganesh@012', 9876543228, 'employer', 'active')
into users values(29, 'ashok345', 'Ashok', 'Reddy', 'ashok@email.com', 'ashok@345', 9876543229, 'job_seeker', 'active')
into users values(30, 'suresh678', 'Suresh', 'Shetty', 'suresh@email.com', 'suresh@678', 9876543230, 'employer', 'inactive')
into users values(31, 'lokesh901', 'Lokesh', 'Kohli', 'lokesh@email.com', 'lokesh@901', 9876543231, 'job_seeker', 'active')
into users values(32, 'manish234', 'Manish', 'Dutta', 'manish@email.com', 'manish@234', 9876543232, 'employer', 'active')
into users values(33, 'abhay567', 'Abhay', 'Sen', 'abhay@email.com', 'abhay@567', 9876543233, 'job_seeker', 'inactive')
into users values(34, 'atul890', 'Atul', 'Mitra', 'atul@email.com', 'atul@890', 9876543234, 'employer', 'active')
into users values(35, 'tarun321', 'Tarun', 'Rai', 'tarun@email.com', 'tarun@321', 9876543235, 'job_seeker', 'active')
into users values(36, 'dinesh654', 'Dinesh', 'Saxena', 'dinesh@email.com', 'dinesh@654', 9876543236, 'employer', 'inactive')
into users values(37, 'ajit123', 'Ajit', 'Puri', 'ajit@email.com', 'ajit@123', 9876543237, 'job_seeker', 'active')
into users values(38, 'gopal456', 'Gopal', 'Chandra', 'gopal@email.com', 'gopal@456', 9876543238, 'employer', 'active')
into users values(39, 'naveen789', 'Naveen', 'Dewan', 'naveen@email.com', 'naveen@789', 9876543239, 'job_seeker', 'inactive')
into users values(40, 'lalit012', 'Lalit', 'Tripathi', 'lalit@email.com', 'lalit@012', 9876543240, 'employer', 'active')
into users values(41, 'vinay345', 'Vinay', 'Awasthi', 'vinay@email.com', 'vinay@345', 9876543241, 'job_seeker', 'active')
into users values(42, 'siddharth678', 'Siddharth', 'Nair', 'siddharth@email.com', 'siddharth@678', 9876543242, 'employer', 'inactive')
into users values(43, 'neha901', 'Neha', 'Gupta', 'neha@email.com', 'neha@901', 9876543243, 'job_seeker', 'active')
into users values(44, 'priya234', 'Priya', 'Mehta', 'priya@email.com', 'priya@234', 9876543244, 'employer', 'active')
into users values(45, 'rahul456', 'Rahul', 'Bansal', 'rahul2@email.com', 'rahul@456', 9876543245, 'job_seeker', 'inactive')
into users values(46, 'kavita789', 'Kavita', 'Sharma', 'kavita@email.com', 'kavita@789', 9876543246, 'employer', 'active')
into users values(47, 'gita012', 'Gita', 'Bhatia', 'gita@email.com', 'gita@012', 9876543247, 'job_seeker', 'active')
into users values(48, 'shweta345', 'Shweta', 'Choudhary', 'shweta@email.com', 'shweta@345', 9876543248, 'employer', 'inactive')
into users values(49, 'komal678', 'Komal', 'Singh', 'komal@email.com', 'komal@678', 9876543249, 'job_seeker', 'active')
into users values(50, 'rahul789', 'Rahul', 'Yadav', 'rahul3@email.com', 'rahul@789', 9876543250, 'employer', 'active')
into users values(51, 'deepika012', 'Deepika', 'Kumar', 'deepika@email.com', 'deepika@012', 9876543251, 'job_seeker', 'inactive')
into users values(52, 'neeraj345', 'Neeraj', 'Soni', 'neeraj@email.com', 'neeraj@345', 9876543252, 'employer', 'active')
into users values(53, 'shivani678', 'Shivani', 'Sharma', 'shivani@email.com', 'shivani@678', 9876543253, 'job_seeker', 'active')
into users values(54, 'kiran901', 'Kiran', 'Pillai', 'kiran@email.com', 'kiran@901', 9876543254, 'employer', 'inactive')
into users values(55, 'manju234', 'Manju', 'Deshmukh', 'manju@email.com', 'manju@234', 9876543255, 'job_seeker', 'active')
into users values(56, 'reema456', 'Reema', 'Agarwal', 'reema@email.com', 'reema@456', 9876543256, 'employer', 'active')
into users values(57, 'pankaj789', 'Pankaj', 'Jha', 'pankaj@email.com', 'pankaj@789', 9876543257, 'job_seeker', 'inactive')
into users values(58, 'girish012', 'Girish', 'Bansal', 'girish@email.com', 'girish@012', 9876543258, 'employer', 'active')
into users values(59, 'suresh345', 'Suresh', 'Choudhary', 'suresh2@email.com', 'suresh@345', 9876543259, 'job_seeker', 'active')
into users values(60, 'anuj678', 'Anuj', 'Patel', 'anuj@email.com', 'anuj@678', 9876543260, 'employer', 'inactive')
into users values(61, 'aakash901', 'Aakash', 'Yadav', 'aakash@email.com', 'aakash@901', 9876543261, 'job_seeker', 'active')
into users values(62, 'pranav234', 'Pranav', 'Gupta', 'pranav2@email.com', 'pranav@234', 9876543262, 'employer', 'active')
into users values(63, 'rakesh456', 'Rakesh', 'Dutta', 'rakesh@email.com', 'rakesh@456', 9876543263, 'job_seeker', 'inactive')
into users values(64, 'vinod789', 'Vinod', 'Rai', 'vinod@email.com', 'vinod@789', 9876543264, 'employer', 'active')
into users values(65, 'pooja012', 'Pooja', 'Verma', 'pooja@email.com', 'pooja@012', 9876543265, 'job_seeker', 'active')
into users values(66, 'preeti345', 'Preeti', 'Agrawal', 'preeti@email.com', 'preeti@345', 9876543266, 'employer', 'inactive')
into users values(67, 'sanjana678', 'Sanjana', 'Sharma', 'sanjana@email.com', 'sanjana@678', 9876543267, 'job_seeker', 'active')
into users values(68, 'rajesh901', 'Rajesh', 'Bhatia', 'rajesh@email.com', 'rajesh@901', 9876543268, 'employer', 'active')
into users values(69, 'bala234', 'Bala', 'Nair', 'bala@email.com', 'bala@234', 9876543269, 'job_seeker', 'inactive')
into users values(70, 'tanu678', 'Tanu', 'Desai', 'tanu@email.com', 'tanu@678', 9876543270, 'employer', 'active')
select * from dual;


insert all
into resumes values(101, 'Savitribai Phule University', 'B.Tech', 2020, 'A', '2 year', 'Tech Solutions', 'Software Engineer', 'English, Hindi', NULL)
into resumes values(102, 'Shivaji University kolhapur', 'M.Sc', 2019, 'B', '1 year', 'DataCorp', 'Data Analyst', 'English', 'Mr. Sharma')
into resumes values(103, 'Symbiosis International University', 'MBA', 2022, 'A+', NULL, NULL, NULL, 'English, French', NULL)
into resumes values(104, 'Bharati Vidyapeeth Deemed University', 'B.Com', 2023, 'B+', '1.5 year', 'Finance Inc', 'Accountant', 'English, Spanish', 'Mr. Sharma')
into resumes values(105, 'Vishwakarma Institute of Technology', 'B.Sc', 2022, 'A', NULL, NULL, NULL, 'English', NULL)
into resumes values(106, 'D.Y. Patil College of Engineering', 'B.Tech', 2024, 'A+', '3 year', 'Tech Innovations', 'Full Stack Developer', 'English, Hindi', 'Ms. Verma')
into resumes values(107, 'Fergusson College', 'Ph.D', 2020, 'A+', NULL, NULL, NULL, 'English, Mandarin', NULL)
into resumes values(108, 'Wadia College', 'MCA', 2022, 'B', '2 year', 'Web Solutions', 'Web Developer', 'English', NULL)
into resumes values(109, 'Sinhgad Institute of Technology and Science', 'MCA', 2018, 'B', NULL, NULL, NULL, 'English, German', 'Ms. Verma')
into resumes values(110, 'Dr. D.Y. Patil Vidyapeeth', 'M.Tech', 2018, 'A', NULL, NULL, NULL, 'English', NULL)
into resumes values(111, 'Indira Gandhi Institute', 'BCA', 2019, 'A+', '4 year', 'Data Solutions', 'Data Scientist', 'English, Hindi', NULL)
into resumes values(112, 'B.K. Birla College', 'M.Sc', 2021, 'B', NULL, NULL, NULL, 'English', 'Mr. Rao')
into resumes values(113, 'Institute of Business Management', 'MBA', 2020, 'A', '2 year', 'Business Inc.', 'Business Analyst', 'English, Spanish', NULL)
into resumes values(114, 'Wadia College','B.Com', 2018, 'C+', NULL, NULL, NULL, 'English, French', 'Ms. Patel')
into resumes values(115, 'Shivaji University Pune', 'MCA', 2022, 'B+', '1 year', 'IT Solutions', 'Junior Developer', 'English', NULL)
into resumes values(116, 'Maharashtra Institute of Technology ', 'B.Tech', 2024, 'A', NULL, NULL, NULL, 'English', 'Mr. Gupta')
into resumes values(117, 'Saraswati College of Engineering', 'MCA', 2021, 'A+', '3 year', 'App Development', 'Mobile Developer', 'English, Hindi', NULL)
into resumes values(118, 'Sanjivani College of Engineering', 'MBA', 2020, 'B+', NULL, NULL, NULL, 'English, Mandarin', 'Ms. Joshi')
into resumes values(119, 'AISSMS College of Engineering', 'B.Tech', 2023, 'A', '2 year', 'CyberTech', 'Security Analyst', 'English', NULL)
into resumes values(120, 'Pune School of Business Management', 'MBA', 2021, 'A+', NULL, NULL, NULL, 'English, German', 'Mr. Mehta')
into resumes values(121, 'University of Mumbai', 'M.Tech', 2018, 'B+', '5 year', 'Retail Co.', 'Operations Manager', 'English', NULL)
into resumes values(122, 'IIT', 'MCA', 2020, 'A', '1 year', 'Marketing Firm', 'Marketing Executive', 'English', NULL)
into resumes values(123, 'Veermata Jijabai Technological Institute', 'MCA', 2021, 'B+', NULL, NULL, NULL, 'English', 'Mr. Mehta')
into resumes values(124, 'Sardar Patel Institute', 'M.Sc', 2020, 'A', '4 years', 'HealthTech', 'Quality Analyst', 'English, Hindi', NULL)
into resumes values(125, 'Rajiv Gandhi Institute', 'MCA', 2022, 'B+', NULL, NULL, NULL, 'English', NULL)
into resumes values(126, 'Smt. Indira Gandhi College', 'M.Tech', 2021, 'A', '3 year', 'Tech Innovations', 'DevOps Engineer', 'English, Spanish', 'Mr. Naik')
into resumes values(127, 'Government College of Engineering, Karad', 'MCA', 2020, 'A', NULL, NULL, NULL, 'English, Hindi', NULL)
into resumes values(128, 'Y.C. college of Science karad', 'BBA', 2019, 'B', '2 year', 'Retail Group', 'Sales Executive', 'English', NULL)
into resumes values(129, 'SGM college karad', 'B.Com', 2022, 'C+', NULL, NULL, NULL, 'English, Hindi', 'Mr. Kapoor')
into resumes values(130, 'Savitribai Phule University', 'B.Tech', 2021, 'A+', '1 year', 'E-commerce Co.', 'Product Manager', 'English', NULL)
into resumes values(131, 'Pune School of Business Management', 'MBA', 2020, 'A', NULL, NULL, NULL, 'English, Mandarin', 'Ms. Desai')
into resumes values(132, 'IIT', 'B.Tech', 2019, 'B', '2 years', 'Logistics Co.', 'Logistics Manager', 'English', NULL)
into resumes values(133, 'Wadia College', 'BBA', 2021, 'A+', NULL, NULL, NULL, 'English', NULL)
into resumes values(134, 'Shivaji University Pune', 'MBA', 2020, 'B+', '3 year', 'Consulting Inc.', 'Consultant', 'English, Spanish', 'Mr. Singh')
into resumes values(135, 'Dr. D.Y. Patil Vidyapeeth', 'Ph.D', 2021, 'A', NULL, NULL, NULL, 'English', NULL)
into resumes values(136, 'Symbiosis International University', 'B.Sc', 2019, 'C', '2 years', 'Finance Group', 'Financial Analyst', 'English, Hindi', NULL)
into resumes values(137, 'Government College of Engineering, Karad', 'M.Tech', 2022, 'B+', '1 year', 'Engineering Co.', 'Research Assistant', 'English', 'Mr. Singh')
into resumes values(138, 'AISSMS College of Engineering', 'BCA', 2020, 'A', NULL, NULL, NULL, 'English', NULL)
into resumes values(139, 'Fergusson College', 'MBA', 2023, 'B', '4 years', 'Real Estate', 'Agent', 'English, Mandarin', NULL)
into resumes values(140, 'Fergusson College', 'M.Com', 2024, 'A', NULL, NULL, NULL, 'English', 'Mr. Desai')
into resumes values(141, 'MIT School of Business', 'MBA', 2021, 'A+', '2 year', 'Finance Corp', 'Financial Manager', 'English, Hindi', NULL)
into resumes values(142, 'Institute of Technology', 'B.Tech', 2020, 'B+', NULL, NULL, NULL, 'English', 'Mr. Patil')
into resumes values(143, 'Birla Institute of Technology', 'M.Sc', 2019, 'A', '1 year', 'Analytics Co.', 'Data Scientist', 'English, Spanish', NULL)
into resumes values(144, 'Nirma University', 'B.Com', 2023, 'A', NULL, NULL, NULL, 'English', NULL)
into resumes values(145, 'LNM Institute of Technology', 'B.Tech', 2022, 'A+', '3 year', 'Tech Innovators', 'Software Developer', 'English', 'Ms. Iyer')
into resumes values(146, 'SRM University', 'MCA', 2021, 'B', '2 year', 'App Solutions', 'App Developer', 'English', NULL)
into resumes values(147, 'Manipal University', 'Ph.D', 2020, 'A+', NULL, NULL, NULL, 'English, French', 'Dr. Rao')
into resumes values(148, 'Bharati Vidyapeeth University', 'M.Sc', 2018, 'C', '1 year', 'Health Solutions', 'Health Analyst', 'English', NULL)
into resumes values(149, 'PES University', 'B.Tech', 2023, 'B+', '1 year', 'Cyber Security', 'Security Consultant', 'English, Hindi', 'Mr. Singh')
into resumes values(150, 'Dhirubhai Ambani Institute', 'MBA', 2021, 'A+', NULL, NULL, NULL, 'English, Mandarin', NULL)
into resumes values(151, 'Jadavpur University', 'M.Tech', 2019, 'A', '2 year', 'Engineering Corp', 'Project Manager', 'English', 'Mr. Gupta')
into resumes values(152, 'Delhi University', 'BCA', 2022, 'B+', NULL, NULL, NULL, 'English', 'Ms. Sharma')
into resumes values(153, 'Jamia Millia Islamia', 'MBA', 2020, 'B', NULL, NULL, NULL, 'English, Spanish', NULL)
into resumes values(154, 'Osmania University', 'BBA', 2019, 'A', '3 year', 'Marketing Firm', 'Marketing Manager', 'English', 'Mr. Kapoor')
into resumes values(155, 'Loyola College', 'M.Com', 2021, 'A+', '2 year', 'Finance House', 'Account Manager', 'English', NULL)
into resumes values(156, 'NIT Surat', 'B.Tech', 2023, 'A', NULL, NULL, NULL, 'English, Hindi', 'Mr. Iyer')
into resumes values(157, 'SASTRA University', 'M.Tech', 2020, 'B+', '1 year', 'Tech Solutions', 'DevOps Engineer', 'English', NULL)
into resumes values(158, 'UPES', 'M.Sc', 2021, 'A', '2 year', 'Energy Co.', 'Quality Engineer', 'English', 'Mr. Sharma')
into resumes values(159, 'GGSIPU', 'MBA', 2023, 'A+', '3 year', 'Consulting Group', 'Consultant', 'English, French', NULL)
into resumes values(160, 'Rajasthan Technical University', 'B.Com', 2022, 'C', '1 year', 'Retail Corp', 'Store Manager', 'English', NULL)
into resumes values(161, 'Thapar University', 'MCA', 2020, 'A+', NULL, NULL, NULL, 'English', 'Ms. Joshi')
into resumes values(162, 'Punjab University', 'B.Tech', 2019, 'B+', '2 year', 'Software Inc', 'Software Tester', 'English', NULL)
into resumes values(163, 'BHU', 'M.Sc', 2021, 'B', NULL, NULL, NULL, 'English, Hindi', 'Mr. Mehta')
into resumes values(164, 'Aligarh Muslim University', 'MBA', 2020, 'A', '3 year', 'Finance Services', 'Financial Analyst', 'English', NULL)
into resumes values(165, 'Lovely Professional University', 'BCA', 2022, 'B+', NULL, NULL, NULL, 'English', 'Mr. Desai')
into resumes values(166, 'University of Pune', 'M.Com', 2019, 'A+', '4 year', 'Finance Group', 'Tax Consultant', 'English', 'Ms. Patel')
into resumes values(167, 'GITAM University', 'BBA', 2023, 'B', NULL, NULL, NULL, 'English', NULL)
into resumes values(168, 'SVNIT', 'B.Tech', 2020, 'C+', '2 year', 'Tech Solutions', 'Technical Support', 'English', NULL)
into resumes values(169, 'DIT University', 'M.Tech', 2021, 'A+', NULL, NULL, NULL, 'English, Hindi', 'Mr. Gupta')
into resumes values(170, 'Shivaji University', 'M.Sc', 2020, 'B+', NULL, NULL, NULL, 'English', NULL)
select * from dual;