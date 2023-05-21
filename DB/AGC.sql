===Database arcade game center db

== Table structure for table branche

|------
|Column|Type|Null|Default
|------
|//**Branch_ID**//|int(11)|No|
|Branche_name|varchar(45)|No|
== Dumping data for table branche

|1|Arcade Game Center The First
|2|Arcade Games The Second
|3|Arcade Games The Third
== Table structure for table branche_address

|------
|Column|Type|Null|Default
|------
|Building|varchar(100)|No|
|City|varchar(45)|No|
|Branch_ID|int(11)|No|
== Dumping data for table branche_address

|Cairo Mall|Cairo|1
|Mall Of Egyept|6-Octoba|2
|Zyzinya Mall|El-Maidy|3
== Table structure for table branche_days

|------
|Column|Type|Null|Default
|------
|Branch_ID|int(11)|No|
|day|varchar(20)|No|
== Dumping data for table branche_days

|1|Sunday
|1|Monday
|1|Tuesday
|1|Wednesday
|1|Thursday
|1|Friday
|2|Saturday
|2|Friday
|2|Thursday
|2|Wednesday
|2|Tuesday
|3|Sunday
|3|Monday
|3|Wednesday
|3|Friday
== Table structure for table branch_phone_numbers

|------
|Column|Type|Null|Default
|------
|//**Branch_Phone_Number**//|int(11)|No|
|Branch_ID|int(11)|No|
== Dumping data for table branch_phone_numbers

|1123045819|1
|1147585638|1
|1235847699|1
|1023548857|2
|1023556954|2
|1253482248|2
|1024827847|3
|1235957664|3
== Table structure for table competition

|------
|Column|Type|Null|Default
|------
|//**Competition_Id**//|int(11)|No|
|Competition_name|varchar(45)|Yes|NULL
|Start_date|date|Yes|NULL
|End_date|date|Yes|NULL
|EmployeeID|int(11)|No|
== Dumping data for table competition

|1|Competition a|2022-01-01|2022-01-15|10
|2|Competition b|2022-01-16|2022-01-30|15
|3|Competition c|2022-02-01|2022-02-15|10
== Table structure for table competition_prizes

|------
|Column|Type|Null|Default
|------
|Prize_Rank|int(11)|No|
|Competition_Id|int(11)|No|
|Prize_ID|int(11)|No|
== Dumping data for table competition_prizes

|1|1|1
|2|1|2
|3|1|3
|1|2|4
|2|2|5
|3|2|6
|1|3|7
|2|3|8
|3|3|9
== Table structure for table contract

|------
|Column|Type|Null|Default
|------
|//**Contract_Id**//|int(11)|No|
|Employment_contract_status|enum(&#039;Ongoing&#039;, &#039;Rejected&#039;, &#039;Temporarily Suspended&#039;)|No|
|Employment_status|enum(&#039;Temporary&#039;, &#039;Permanent&#039;)|No|
|Main_salary|float|No|
|Annual_salary_increase_rate|float|No|
|Salary_after_Increase|float|Yes|NULL
== Dumping data for table contract

|1|Ongoing|Permanent|10000|10|NULL
|2|Ongoing|Permanent|5000|9|NULL
|3|Ongoing|Permanent|5000|9|NULL
|4|Rejected|Temporary|2000|5|NULL
|5|Temporarily Suspended|Temporary|3000|5|NULL
|6|Temporarily Suspended|Permanent|6000|7.5|NULL
|7|Ongoing|Temporary|4000|8|NULL
|8|Rejected|Temporary|2000|7.5|NULL
|9|Temporarily Suspended|Temporary|4000|8|NULL
|10|Rejected|Temporary|3000|6|NULL
|11|Ongoing|Temporary|1500|3|NULL
|12|Ongoing|Permanent|4000|5|NULL
|13|Ongoing|Permanent|4000|5|NULL
|14|Ongoing|Permanent|4000|4|NULL
|15|Ongoing|Temporary|5000|6|NULL
== Table structure for table cornars

|------
|Column|Type|Null|Default
|------
|//**Corner_Number**//|int(11)|No|
|Games_type|varchar(45)|No|
|Corner_Name|varchar(45)|No|
|Required_age|int(11)|No|
|Num_of_machines|int(11)|Yes|NULL
|visitors_num|int(11)|Yes|NULL
|Branch_ID|int(11)|No|
== Dumping data for table cornars

|1|subway|cornA|15|0|1|1
|2|gata|cornB|14|0|2|2
|3|mafia|cornC|10|0|3|3
|4|pes|cornD|11|0|4|1
|5|callofduty|cornE|17|0|5|2
|6|bubg|cornF|19|0|6|3
|7|stray|cornJ|7|0|7|1
|8|creatied|cornH|20|0|8|2
|9|elharata|cornK|16|0|9|3
|10|mone|cornL|22|0|10|1
== Table structure for table employee

|------
|Column|Type|Null|Default
|------
|//**EmployeeID**//|int(11)|No|
|Name|varchar(50)|No|
|Date_of_birth|date|No|
|**National_number**|int(11)|No|
|JobId|int(11)|No|
|ShiftID|int(11)|No|
|Branch_ID|int(11)|No|
== Dumping data for table employee

|1|Abdelrhman Hussien|2001-03-22|369852147|1|1|1
|2|Ahmed Ali|2001-01-01|147852369|2|1|1
|3|Abdelrhman Mohammed|2001-04-10|123456789|2|1|1
|4|Mohammed Ibrahem|2001-05-02|123654741|4|1|1
|5|Gamal mohammed|1995-05-09|120524585|3|2|2
|6|Sara gamal|1998-08-15|963582147|2|2|2
|7|Hala Fared|1996-03-05|859623571|6|1|2
|8|Mariam Mahmood|1979-08-09|951357852|8|3|2
|9|Fares Mahmood|1981-07-05|856923471|8|3|3
|10|Yousef Hany|1992-08-04|985695357|7|1|3
|11|Khaled Mohamed|2000-04-01|956842847|8|2|3
|12|Lilia Emad|1996-08-15|856235964|5|1|3
|13|Omar Ziad|1991-09-22|458569235|3|2|2
|14|Kareem Hashm|1990-10-25|759628354|3|3|1
|15|Hesham Ahmed|1999-12-12|548756647|7|3|1
== Table structure for table employee_address

|------
|Column|Type|Null|Default
|------
|Street|varchar(50)|No|
|City|varchar(45)|No|
|EmployeeID|int(11)|No|
== Dumping data for table employee_address

|El-Badrashin|Giza|1
|El-Haram|Giza|2
|El-Maide|Cairo|3
|El-Haram|Giza|4
|El-Maide|Cairo|5
|El-Haram|Giza|6
|El-Maide|Cairo|7
|El-Haram|Giza|8
|El-Maide|Cairo|9
|El-Haram|Giza|10
|El-Maide|Cairo|11
|El-Haram|Giza|12
|El-Maide|Cairo|13
|El-Haram|Giza|14
|El-Maide|Cairo|15
== Table structure for table employee_attendance_time

|------
|Column|Type|Null|Default
|------
|Attendance_status|enum(&#039;Attend&#039;, &#039;Absent&#039;)|No|Absent
|Attendance_date_time|datetime|No|
|Departure_date_time|datetime|No|
|ShiftID|int(11)|No|
|EmployeeID|int(11)|No|
== Dumping data for table employee_attendance_time

|Absent|2022-12-01 07:55:00|2022-12-01 16:00:00|1|1
|Attend|2022-12-01 15:55:00|0000-00-00 00:00:00|2|2
|Absent|2022-12-01 23:55:00|2022-12-01 08:00:00|3|3
|Attend|2022-12-01 07:55:00|2022-12-01 16:00:00|1|4
|Absent|2022-12-01 15:55:00|0000-00-00 00:00:00|2|5
|Attend|2022-12-01 23:55:00|2022-12-01 08:00:00|3|6
|Absent|2022-12-01 07:55:00|2022-12-01 16:00:00|1|7
|Attend|2022-12-01 15:55:00|0000-00-00 00:00:00|2|8
== Table structure for table employee_phone_numbers

|------
|Column|Type|Null|Default
|------
|//**Phone_number**//|int(11)|No|
|EmployeeID|int(11)|No|
== Dumping data for table employee_phone_numbers

|1022555555|1
|1000222222|2
|1023253669|3
|1026956633|4
|1011111522|5
|1000659699|6
|1023536269|7
|1207821622|8
|1023536779|9
|1150981408|10
|1021538776|11
|1209221622|12
|1023358779|13
|1150151408|14
|1029738776|15
== Table structure for table jobs

|------
|Column|Type|Null|Default
|------
|//**JobId**//|int(11)|No|
|**Job_title**|varchar(45)|No|
== Dumping data for table jobs

|4|Chief
|8|Cleaners
|7|Comption Manager
|5|Corner Service
|3|Guard
|6|Maintenance Worke
|1|Manager
|2|Receptionist
== Table structure for table joined_user

|------
|Column|Type|Null|Default
|------
|Join_Date|datetime|Yes|NULL
|Competition_Id|int(11)|No|
|UserID|int(11)|No|
== Dumping data for table joined_user

|2021-01-22 11:30:22|1|1
|2022-02-22 19:30:22|2|2
|2022-03-22 09:30:22|3|3
|2022-04-22 18:30:22|1|4
|2021-05-22 19:30:22|2|5
|2022-06-22 15:30:22|3|6
|2021-05-22 12:30:22|1|7
|2022-08-22 13:30:22|2|8
|2022-11-22 19:30:22|3|9
|2022-02-22 16:30:22|1|10
== Table structure for table ls_lifted

|------
|Column|Type|Null|Default
|------
|Lifted_Data|date|No|
|//** Lifted_reason**//|varchar(250)|No|
|Machine_ID|int(11)|No|
== Dumping data for table ls_lifted

|2022-12-15|Mechanical damage|9
|2022-12-10|software erorr|7
|2022-12-11|User Usage Defect|3
== Table structure for table machine

|------
|Column|Type|Null|Default
|------
|//**Machine_ID**//|int(11)|No|
|**Machine_name**|varchar(45)|No|
|**Machine_type**|varchar(45)|No|
|Machine_price|float|No|
|Total_number_of_prizes|int(11)|No|
|Date_of_entry|date|No|
|Date_of_upload|date|No|
|Machine_statues|varchar(100)|No|
|Usage_fees|float|No|
|Machine_returns_money|float|No|
|Total_time_of_use|float|Yes|NULL
|Corner_Number|int(11)|No|
== Dumping data for table machine

|1|MachineA|J|25000|8|2022-12-01|0000-00-00|89|40|200000|0|1
|2|Machineb|K|45000|9|2022-12-01|0000-00-00|92|50|450000|0|2
|3|Machinec|A|20000|10|2022-12-01|0000-00-00|99|40|100000|0|3
|4|Machinedd|B|10000|1|2022-12-01|0000-00-00|98|50|150000|0|6
|5|Machinede|C|30000|5|2022-12-01|0000-00-00|85|50|170000|0|5
|6|Machinef|D|15000|9|2022-12-01|0000-00-00|19|30|250000|0|4
|7|Machineg|E|11000|2|2022-12-01|0000-00-00|65|45|250000|0|1
|8|Machineh|F|12000|6|2022-12-01|0000-00-00|98|30|350000|0|8
|9|Machinei|G|15000|8|2022-12-01|0000-00-00|100|40|159000|0|9
|10|Machinej|H|17000|4|2022-12-01|0000-00-00|90|50|156000|0|10
== Table structure for table make_contract

|------
|Column|Type|Null|Default
|------
|Work_end_date|date|Yes|NULL
|Work_start_date|date|No|
|Contract_Id|int(11)|No|
|EmployeeID|int(11)|No|
== Dumping data for table make_contract

|0000-00-00|2021-01-22|1|1
|0000-00-00|2022-02-22|2|2
|0000-00-00|2022-03-22|3|3
|0000-00-00|2022-04-22|4|4
|0000-00-00|2021-05-22|5|5
|0000-00-00|2022-06-22|6|6
|0000-00-00|2021-05-22|7|7
|0000-00-00|2022-08-22|8|8
|0000-00-00|2022-11-22|9|9
|0000-00-00|2022-02-22|10|10
|0000-00-00|2021-01-22|11|11
|0000-00-00|2022-02-22|12|12
|0000-00-00|2022-03-22|13|13
|0000-00-00|2022-04-22|14|14
|0000-00-00|2021-05-22|15|15
== Table structure for table permitted_machine

|------
|Column|Type|Null|Default
|------
|Package_ID|int(11)|No|
|Machine_ID|int(11)|No|
== Dumping data for table permitted_machine

|1|1
|2|1
|3|1
|1|2
|1|1
|1|2
|1|3
|2|1
|2|5
|2|6
|3|7
|3|1
|3|9
|4|8
|4|10
|4|7
|4|9
|4|2
== Table structure for table prizes

|------
|Column|Type|Null|Default
|------
|//**Prize_ID**//|int(11)|No|
|Prize Name|varchar(45)|Yes|NULL
|Prize_type|varchar(45)|Yes|NULL
|Prize_price|float|Yes|NULL
|Machine_ID|int(11)|No|
== Dumping data for table prizes

|1|iphone|gold|25|1
|2|dabdob|silver|25|2
|3|Kotchyna|silver|25|3
|4|Kotchyna|silver|25|4
|5|dabdob|silver|25|5
|6|iphone|gold|25|6
|7|Kotchyna|gold|25|7
|8|Kotchyna|silver|25|8
|9|Ibad|gold|25|9
|10|labtop|gold|25|10
|11|Kotchyna|silver|25|6
|12|gun game |silver|200|7
|13|iphone|gold|25000|8
|14|Kotchyna|silver|25|9
|15|phone|gold|5000|10
== Table structure for table repair

|------
|Column|Type|Null|Default
|------
|Repair_date_time|datetime|No|
|Repairs_cost|float|No|
|Malfunction|varchar(100)|No|
|Machine_ID|int(11)|No|
|EmployeeID|int(11)|No|
== Dumping data for table repair

== Table structure for table shift

|------
|Column|Type|Null|Default
|------
|//**ShiftID**//|int(11)|No|
|**Shift_Name**|varchar(45)|No|
|Shift_Start_Time|time|No|
|Shift_End_Time|time|No|
== Dumping data for table shift

|1|Morning|08:00:00|16:00:00
|2|day|16:00:00|24:00:00
|3|evening|24:00:00|08:00:00
== Table structure for table subscription_package

|------
|Column|Type|Null|Default
|------
|//** Package_ID**//|int(11)|No|
|**Package_name**|varchar(45)|No|
|Package_price|float|No|
|Package_Duration|int(11)|No|
|Package_limits|int(11)|No|
== Dumping data for table subscription_package

|1|family package |1000|2|10
|2|el sohab package|1500|1|15
|3|arcyed package|700|2|9
|4|al lama package|2000|5|22
== Table structure for table tak_ salary

|------
|Column|Type|Null|Default
|------
|Total_salary|float|Yes|NULL
|Date_of_receipt|date|No|
|Contract_Id|int(11)|No|
|EmployeeID|int(11)|No|
== Dumping data for table tak_ salary

== Table structure for table user

|------
|Column|Type|Null|Default
|------
|//**UserID**//|int(11)|No|
|User_name|varchar(50)|No|
|User_gender|varchar(30)|No|
|Birth_date|date|No|
== Dumping data for table user

|1|ahmed|male|2009-09-07
|2|ahmed |male|2000-09-07
|3|hassan|male|2009-10-01
|4|ali|male|2002-02-07
|5|maha|famale|2008-09-30
|6|nada|famale|2001-06-07
|7|mohamed|male|2000-09-11
|8|mostafa|male|2009-07-01
|9|fatma|famale|2010-10-07
|10|amira|famale|2011-09-22
== Table structure for table user_address

|------
|Column|Type|Null|Default
|------
|Streat|varchar(60)|No|
|City|varchar(45)|No|
|UserID|int(11)|No|
== Dumping data for table user_address

|abo madyn street|abshawy|1
|dala street|fayoum|3
|el harm street |giza|5
|nasser street|maadi|2
|abbod street |october|4
|abo madyn street|abshawy|1
|nasser street|maadi|2
|dala street|fayoum|3
|abbod street |october|4
|el harm street |giza|5
|el harm street|giza|6
|sfarat street|cairo|7
|ahmed street|cairo|8
|abdo street|el sharaya|9
|mohamed street|fayoum|10
== Table structure for table user_phon_ number

|------
|Column|Type|Null|Default
|------
|//**Phone_number**//|int(11)|No|
|UserID|int(11)|No|
== Dumping data for table user_phon_ number

|1022555555|1
|1000222222|2
|1023253669|3
|1026956633|4
|1011111522|5
|1000659699|6
|1023536269|7
|1205621622|8
|1023568779|9
|1150171408|10
== Table structure for table user_subscription

|------
|Column|Type|Null|Default
|------
|Subscription_date|datetime|No|
|UserID|int(11)|No|
|Package_ID|int(11)|No|
== Dumping data for table user_subscription

|2022-12-01 07:55:00|1|1
|2022-12-10 16:03:00|2|3
|2022-12-03 12:11:00|3|2
|2022-12-08 22:15:00|4|4
|2022-12-22 08:00:00|9|4
== Table structure for table user_use_machine

|------
|Column|Type|Null|Default
|------
|Time_of_use|datetime|No|
|Machine_ID|int(11)|No|
|UserID|int(11)|No|
== Dumping data for table user_use_machine

|2022-12-01 07:55:00|1|1
|2022-12-10 16:03:00|2|2
|2022-12-03 12:11:00|3|3
|2022-12-08 22:15:00|4|4
|2022-12-22 08:00:00|5|5
|2022-12-01 07:55:00|6|6
|2022-12-10 16:03:00|7|7
|2022-12-03 12:11:00|8|8
|2022-12-08 22:15:00|9|9
|2022-12-22 08:00:00|10|10
|2022-12-29 09:30:39|1|10
== Table structure for table user_win_competition

|------
|Column|Type|Null|Default
|------
|Rank|int(11)|No|
|Competition_Id|int(11)|No|
|UserID|int(11)|No|
== Dumping data for table user_win_competition

|1|1|1
|2|3|10
|3|1|9
|1|3|7
|2|2|9
|3|3|3
== Table structure for table user_win_prize

|------
|Column|Type|Null|Default
|------
|Draw_timing|datetime|Yes|NULL
|Prize_ID|int(11)|No|
|UserID|int(11)|No|
== Dumping data for table user_win_prize

|2022-12-01 07:55:00|1|1
|2022-12-10 16:03:00|2|10
|2022-12-03 12:11:00|3|9
|2022-12-08 22:15:00|4|7
|2022-12-22 08:00:00|5|9
|2022-12-08 22:15:00|6|3
== Table structure for table visit_branch

|------
|Column|Type|Null|Default
|------
|Time_of_entry|datetime|No|
|Time_of_go|datetime|Yes|NULL
|Branch_ID|int(11)|No|
|UserID|int(11)|No|
== Dumping data for table visit_branch

|2022-12-01 07:55:00|2022-12-01 08:55:00|1|1
|2022-12-08 22:15:00|2022-12-01 22:55:00|3|2
|2022-12-08 22:15:00|2022-12-01 22:55:00|3|3
|2022-12-08 22:15:00|2022-12-01 22:55:00|2|4
|2022-12-08 22:15:00|2022-12-01 22:55:00|1|5
|2022-12-08 22:15:00|2022-12-01 22:55:00|3|6
|2022-12-08 22:15:00|2022-12-01 22:55:00|1|7
|2022-12-22 08:00:00|2022-12-01 11:55:00|2|8
|2022-12-03 12:11:00|2022-12-01 13:55:00|3|9
|2022-12-10 16:03:00|2022-12-01 19:55:00|2|10
== Table structure for table visit_corner

|------
|Column|Type|Null|Default
|------
|Time_of_entry|datetime|No|
|Time_of_go|datetime|Yes|NULL
|Corner_Number|int(11)|No|
|UserID|int(11)|No|
== Dumping data for table visit_corner

|2022-12-01 07:55:00|2022-12-01 08:55:00|1|1
|2022-12-08 22:15:00|2022-12-01 22:55:00|3|2
|2022-12-08 22:15:00|2022-12-01 22:55:00|3|3
|2022-12-08 22:15:00|2022-12-01 22:55:00|2|4
|2022-12-08 22:15:00|2022-12-01 22:55:00|1|5
|2022-12-08 22:15:00|2022-12-01 22:55:00|3|6
|2022-12-08 22:15:00|2022-12-01 22:55:00|1|7
|2022-12-22 08:00:00|2022-12-01 11:55:00|2|8
|2022-12-03 12:11:00|2022-12-01 13:55:00|3|9
|2022-12-10 16:03:00|2022-12-01 19:55:00|2|10
