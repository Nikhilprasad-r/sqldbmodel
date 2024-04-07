
CREATE DATABASE IF NOT EXISTS guvi;
USE guvi;

CREATE TABLE IF NOT EXISTS `user` (
    `userid` INT PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(25) UNIQUE,
    `useremail` VARCHAR(255) UNIQUE,
    `usermobile` VARCHAR(10) NOT NULL
);


CREATE TABLE IF NOT EXISTS `course` (
    `course_id` INT AUTO_INCREMENT PRIMARY KEY,
    `userid` INT,
    `course_name` VARCHAR(25),
    `course_duration` VARCHAR(255),
    `course_fees` VARCHAR(25),
    FOREIGN KEY (`userid`) REFERENCES `user`(`userid`)
);


CREATE TABLE IF NOT EXISTS `admissions` (
    `userid` INT,
    `course_id` INT,
    `admission_fees` VARCHAR(25),
    FOREIGN KEY (`userid`) REFERENCES `user`(`userid`),
    FOREIGN KEY (`course_id`) REFERENCES `course`(`course_id`)
);


CREATE TABLE IF NOT EXISTS `codekata` (
    `userid` INT,
    `solved_problem` VARCHAR(25) NOT NULL,
    FOREIGN KEY (`userid`) REFERENCES `user`(`userid`)
);

CREATE TABLE IF NOT EXISTS `mentor` (
    `userid` INT,
    `course_id` INT NOT NULL,
    `mentor_name` VARCHAR(25),
    FOREIGN KEY (`userid`) REFERENCES `user`(`userid`),
    FOREIGN KEY (`course_id`) REFERENCES `course`(`course_id`)
);


CREATE TABLE IF NOT EXISTS `studentsAttendance` (
    `A_id` INT AUTO_INCREMENT PRIMARY KEY,
    `userid` INT,
    `A_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `status` BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (`userid`) REFERENCES `user`(`userid`)
);


CREATE TABLE IF NOT EXISTS `task` (
    `userid` INT,
    `submited_task` VARCHAR(25) NOT NULL,
    `task_mark` VARCHAR(25),
    FOREIGN KEY (`userid`) REFERENCES `user`(`userid`)
);


CREATE TABLE IF NOT EXISTS `leaderboard` (
    `userid` INT,
    `course_id` INT,
    `batch` VARCHAR(25) NOT NULL,
    `submited_task` VARCHAR(25) NOT NULL,
    FOREIGN KEY (`userid`) REFERENCES `user`(`userid`),
    FOREIGN KEY (`course_id`) REFERENCES `course`(`course_id`)
);


CREATE TABLE IF NOT EXISTS `queries` (
    `userid` INT,
    `topics` VARCHAR(2000),
    `reasons_queries` VARCHAR(2550),
    FOREIGN KEY (`userid`) REFERENCES `user`(`userid`)
);
