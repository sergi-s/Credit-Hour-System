-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2020 at 05:49 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university management`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(10) UNSIGNED NOT NULL,
  `c_name` varchar(50) NOT NULL,
  `c_cred` int(11) NOT NULL,
  `c_sem` int(11) NOT NULL,
  `c_teach` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `c_name`, `c_cred`, `c_sem`, `c_teach`) VALUES
(1, 'Object oriented Programming', 3, 2, 1),
(3, 'Programming 1', 3, 1, 1),
(4, 'Petro;', 2, 8, 3),
(5, 'Intro to computing technology', 3, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE `dept` (
  `dept_id` int(10) UNSIGNED NOT NULL,
  `dept_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`dept_id`, `dept_name`) VALUES
(1, 'Software industrial and Multimedia'),
(2, 'Industrial Microbiology&Applied Chemistry');

-- --------------------------------------------------------

--
-- Table structure for table `enrolled`
--

CREATE TABLE `enrolled` (
  `std_id` int(10) UNSIGNED NOT NULL,
  `c_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enrolled`
--

INSERT INTO `enrolled` (`std_id`, `c_id`) VALUES
(2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `finished`
--

CREATE TABLE `finished` (
  `t_c_id` int(10) NOT NULL,
  `t_std_id` int(10) NOT NULL,
  `t_marks` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `finished`
--

INSERT INTO `finished` (`t_c_id`, `t_std_id`, `t_marks`) VALUES
(3, 2, 99);

-- --------------------------------------------------------

--
-- Table structure for table `stud_info`
--

CREATE TABLE `stud_info` (
  `s_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(60) NOT NULL,
  `gender` char(10) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `e_id` varchar(70) NOT NULL,
  `s_cred` int(10) NOT NULL,
  `s_sem` int(10) NOT NULL,
  `s_dep` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stud_info`
--

INSERT INTO `stud_info` (`s_id`, `s_name`, `gender`, `dob`, `address`, `phone`, `e_id`, `s_cred`, `s_sem`, `s_dep`) VALUES
(2, 'Mohamed', 'Male', '2000-10-07', 'blablabla', '01555555555', 'mohamed@test.com', 6, 1, 1),
(3, 'reda', 'Male', '1998-12-28', 'blablabla4', '01555555559', 'reda@gmail.com', 0, 1, 1),
(4, 'foula', 'Male', '2000-10-07', 'blablabla5', '01555555510', 'foula@gmail.com', 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacher_id` int(10) UNSIGNED NOT NULL,
  `t_name` varchar(30) NOT NULL,
  `gender` char(10) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `e_id` varchar(70) NOT NULL,
  `t_dep` int(10) UNSIGNED NOT NULL,
  `salary` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacher_id`, `t_name`, `gender`, `dob`, `address`, `phone`, `e_id`, `t_dep`, `salary`) VALUES
(1, 'Sergi', 'male', '2000-10-01', 'balbalbal3', '01555555551', 'sergi@gmail.com', 1, 2009000),
(2, 'Sandra', 'Female', '1998-12-28', 'blablabla2', '01555555557', 'sandra@gmail.com', 1, 3000),
(3, 'Samuel', 'Male', '1999-05-06', 'blablabla3', '01555555558', 'samuel@gmail.com', 2, 2000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `c_teach` (`c_teach`);

--
-- Indexes for table `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `enrolled`
--
ALTER TABLE `enrolled`
  ADD KEY `std_id` (`std_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `stud_info`
--
ALTER TABLE `stud_info`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacher_id`),
  ADD KEY `t_dep` (`t_dep`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dept`
--
ALTER TABLE `dept`
  MODIFY `dept_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stud_info`
--
ALTER TABLE `stud_info`
  MODIFY `s_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `teacher_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`c_teach`) REFERENCES `teacher` (`teacher_id`);

--
-- Constraints for table `enrolled`
--
ALTER TABLE `enrolled`
  ADD CONSTRAINT `enrolled_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `stud_info` (`s_id`),
  ADD CONSTRAINT `enrolled_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `course` (`course_id`);

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`t_dep`) REFERENCES `dept` (`dept_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
