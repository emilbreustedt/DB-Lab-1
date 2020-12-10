Drop Schema if exists minibuddy;
CREATE SCHEMA IF NOT EXISTS minibuddy;
USE minibuddy;  
CREATE TABLE user (
user_id int(4) NOT NULL,
name varchar(255) NOT NULL,
birthdate varchar(10) NOT NULL,
sex varchar(1) DEFAULT NULL,
constraint pk_user primary key(user_id)
)ENGINE = InnoDB Default Charset = utf8 COLLATE = utf8_unicode_ci;

CREATE TABLE friend (
user_id_1 int(4) NOT NULL,
user_id_2 int(4) NOT NULL,
date_friend varchar(10) NOT NULL,
constraint pk_friend primary key(user_id_1 , user_id_2),
constraint fk_friend_userid1 FOREIGN KEY(user_id_1) REFERENCES user(user_id),
constraint fk_friend_userid2 FOREIGN KEY(user_id_2) REFERENCES user(user_id)
)ENGINE = InnoDB Default Charset = utf8 COLLATE = utf8_unicode_ci;                    
					
CREATE TABLE `group` (
group_id int(4) NOT NULL,
name varchar(15) NOT NULL UNIQUE,
constraint pk_group primary key(group_id) 
)ENGINE = InnoDB Default Charset = utf8 COLLATE = utf8_unicode_ci;         
	
CREATE TABLE belong (
user_id int(4) NOT NULL,
group_id int(4) NOT NULL,
constraint pk_belong primary key(user_id , group_id) 
)ENGINE = InnoDB Default Charset = utf8 COLLATE = utf8_unicode_ci;   

CREATE TABLE message (
msg_id int(4) NOT NULL,
user_id int(4) NOT NULL,
date_time varchar(20) NOT NULL,
message varchar(140) NOT NULL,
constraint pk_message primary key(msg_id),
constraint fk_message_userid FOREIGN KEY(user_id) REFERENCES user(user_id)
)ENGINE = InnoDB Default Charset = utf8 COLLATE = utf8_unicode_ci;         

CREATE TABLE `like` (
user_id int(4) NOT NULL,
msg_id int(4) NOT NULL,
constraint pk_like primary key(user_id, msg_id),
constraint fk_like_userid FOREIGN KEY(user_id) REFERENCES user(user_id),
constraint fk_like_msgid FOREIGN KEY(msg_id) REFERENCES message(msg_id)
)ENGINE = InnoDB Default Charset = utf8 COLLATE = utf8_unicode_ci;         


CREATE TABLE dislike (
user_id int(4) NOT NULL,
msg_id int(4) NOT NULL,
constraint pk_dislike primary key(user_id, msg_id),
constraint fk_dislike_userid FOREIGN KEY(user_id) REFERENCES user(user_id),
constraint fk_dislike_msgid FOREIGN KEY(msg_id) REFERENCES message(msg_id)
)ENGINE = InnoDB Default Charset = utf8 COLLATE = utf8_unicode_ci;         