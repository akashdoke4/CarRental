-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2016 at 03:57 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `online_car_rental_system`
--

CREATE DATABASE `online_car_rental_system`;
use `online_car_rental_system`;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE IF NOT EXISTS `booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_user_id` varchar(255) NOT NULL,
  `booking_name` varchar(255) NOT NULL,
  `booking_mobile` varchar(255) NOT NULL,
  `booking_email` varchar(255) NOT NULL,
  `booking_pickup` varchar(255) NOT NULL,
  `booking_drop` varchar(255) NOT NULL,
  `booking_from_date` varchar(255) NOT NULL,
  `booking_to_date` varchar(255) NOT NULL,
  `booking_car_id` varchar(255) NOT NULL,
  `booking_no_passengar` varchar(255) NOT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `booking_user_id`, `booking_name`, `booking_mobile`, `booking_email`, `booking_pickup`, `booking_drop`, `booking_from_date`, `booking_to_date`, `booking_car_id`, `booking_no_passengar`) VALUES
(1, '1', 'Sumit Singh', '9898767876', 'sumit@gmail.com', 'Sector 23, Nashik Manid', 'Sector 23, Nashik Manid', '09 August,2016', '11 August,2016', '1', '2'),
(2, '1', 'Anuj Kumar', '9897656787', 'anuj@gmail.com', 'Vasundhara, Ghaziabad', 'Vasundhara, Ghaziabad', '01 July,2016', '11 July,2016', '4', '4'),
(3, '2', 'Sumnan Singh', '9456768767', 'suman@gmail.com', 'Sector 21, Noida', 'Sector 21, Noida', '11 June,2016', '21 June,2016', '5', '5'),
(4, '1', 'Kaushal Kishore', '08376986802', 'kaushal.rahuljaiswal@gmail.com', '89, Pusta Gali, \r\nNew Lahore Colony, \r\nSastri Nagar\r\nNew Delhi', '89, Pusta Gali, \r\nNew Lahore Colony, \r\nSastri Nagar\r\nNew Delhi', '19 August,2016', '27 August,2016', '6', '4'),
(5, '1', 'Amit Singh', '08376986802', 'amit@gmail.com', '95, Pusta Gali, \r\nNew Lahore Colony,\r\n Sastri Nagar\r\nSastri Nagar', '95, Pusta Gali, \r\nNew Lahore Colony, \r\nSastri Nagar\r\nSastri Nagar', '20 August,2016', '22 August,2016', '1', '4'),
(6, '1', 'Amit Singh', '8987678767', 'amit@gmail.com', 'House 355\r\nSector 12\r\nNoida', 'House 355\r\nSector 12\r\nNoida', '19 August,2016', '21 August,2016', '5', '4');

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE IF NOT EXISTS `car` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `car_name` varchar(255) NOT NULL,
  `car_description` varchar(255) NOT NULL,
  `car_number` varchar(255) NOT NULL,
  `car_company` varchar(255) NOT NULL,
  `car_city` varchar(255) NOT NULL,
  `car_type` varchar(255) NOT NULL,
  `car_seats` varchar(255) NOT NULL,
  `car_price_per_day` varchar(255) NOT NULL,
  `car_image` varchar(255) NOT NULL,
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `car_name`, `car_description`, `car_number`, `car_company`, `car_city`, `car_type`, `car_seats`, `car_price_per_day`, `car_image`) VALUES
(1, 'Nisan Micra', 'The first car which BMW successfully produced and the car which launched BMW on the road to automobile production was the Dixi, based on the Austin 7 and licensed from the Austin Motor Company in Birmingham, England.', 'UP 70 BS 5282', '2', '2', '2', '4', '1000', '2328469b-e713-43b2-9a55-6207cf74387c.jpg.jpg'),
(4, 'Renault Duster', 'BMW was established as a business entity following a restructuring of the Rapp Motorenwerke aircraft manufacturing firm in 1917. After the end of World War I in 1918, BMW was forced to cease aircraft-engine production by the terms of the Versailles Armist', 'DL 12 H 1234', '1', '2', '4', '4', '1200', '498.jpg'),
(5, 'Mercedez Bens', 'BMW first significant aircraft engine, and commercial product of any sort, was the BMW IIIa inline-six liquid-cooled engine of 1918, known for good fuel economy and high-altitude performance. With German rearmament in the 1930s, the company again began pr', 'BXZ 102', '2', '2', '4', '5', '400', '473.jpg'),
(6, 'BMW S20', 'The factory in Munich made ample use of forced labour: foreign civilians, prisoners of war and inmates of the concentrationcamp Dachau . Among its successful World War II engine designs were the BMW 132 and BMW 801 air-cooled radial engines.', 'UXD 122', '2', '2', '4', '5', '400', 'coal-powered-car.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `city_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_name` varchar(45) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`) VALUES
(1, 'Mumbai'),
(2, 'Delhi'),
(3, 'Chenai'),
(4, 'Banglore'),
(5, 'Varanasi'),
(6, 'Kolkatta');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL,
  `company_description` varchar(255) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `company_description`) VALUES
(1, 'Toyata', 'Toyata Company Cars'),
(2, 'Nissan', 'Nissan Company Cars'),
(3, 'Mahindra', 'Mahindra Company Cars'),
(4, 'Tata', 'Tata Company Cars');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`) VALUES
(1, 'India'),
(2, 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL,
  `customer_mobile` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_password` varchar(255) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `customer_city` varchar(255) NOT NULL,
  `customer_state` varchar(255) NOT NULL,
  `customer_pincode` varchar(255) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_mobile`, `customer_email`, `customer_password`, `customer_address`, `customer_city`, `customer_state`, `customer_pincode`) VALUES
(1, 'Amit Kumar', '9876543212', 'amit@gmail.com', 'test', 'Allahabad', 'Mumbai', '4', '201301'),
(2, 'Kaushal Kishore', '9183769868', 'kaushal.rahuljaiswal@gmail.com', 'test', 'A : 42/6 Sector 62', 'Noida', '2', '26101'),
(3, 'Amit', '9876543212', 'rahul@gmail.com', 'test', 'Test', 'Patna', '3', '876786'),
(4, 'Sunita', '9878987678', 'sunita@gmail.com', 'lkjkljk', 'kjlkj', 'Gurgaon', '1', '211003'),
(5, 'Mahesh', '9567654565', 'mahesh@gmail.com', 'kjh', 'fsa', 'New Delhi', '1', '232123');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`) VALUES
(1, 'IT Department'),
(2, 'Java Developement'),
(3, 'HR Department'),
(4, 'Web Developement');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_manager_id` varchar(255) NOT NULL,
  `employee_role` varchar(255) NOT NULL,
  `employee_sal` varchar(100) NOT NULL,
  `employee_first_name` varchar(100) NOT NULL,
  `employee_middle_name` varchar(100) NOT NULL,
  `employee_last_name` varchar(100) NOT NULL,
  `employee_gender` varchar(100) NOT NULL,
  `employee_address` varchar(100) NOT NULL,
  `employee_village` varchar(100) NOT NULL,
  `employee_state` varchar(100) NOT NULL,
  `employee_country` varchar(100) NOT NULL,
  `employee_landline` varchar(100) NOT NULL,
  `employee_mobile` varchar(100) NOT NULL,
  `employee_email` varchar(100) NOT NULL,
  `employee_status` varchar(255) NOT NULL,
  `employee_deparment` varchar(255) NOT NULL,
  `employee_dob` varchar(255) NOT NULL,
  `employee_nationalty` varchar(255) NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1017 ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `employee_manager_id`, `employee_role`, `employee_sal`, `employee_first_name`, `employee_middle_name`, `employee_last_name`, `employee_gender`, `employee_address`, `employee_village`, `employee_state`, `employee_country`, `employee_landline`, `employee_mobile`, `employee_email`, `employee_status`, `employee_deparment`, `employee_dob`, `employee_nationalty`) VALUES
(1001, '0', '1', '1', 'Amit', 'Kumar', 'Singh', 'Male', 'A : 42/6', 'Ghaziabad', '4', '1', 'Uttar Pradesh', '09876543212', 'kaushal@gmail.com', '2', '1', '12 January, 2014', 'Indian'),
(1002, '1001', '2', '2', 'Kaushal', 'Kishore', 'Jaiswal', 'Male', 'A : 42/6', 'Ghaziabad', '1', '1', 'Uttar Pradesh', '09876543212', 'kaushal.rahuljaiswal@gmail.com', '1', '3', '7 July,1988', 'Indian'),
(1003, '1002', '3', '1', 'Sumit', 'Kumar', 'Aggarwal', 'Male', 'A : 42/6', 'Ghaziabad', '1', '1', 'Uttar Pradesh', '09876543212', 'kishore@gmail.com', '2', '1', '12 January, 1988', 'Indian'),
(1014, '1002', '3', '1', 'Anuj', 'Kumar', 'Dubej', 'Male', 'A : 42/6 Sector 62', 'Bhabua (Kaimur)', '1', '1', '9876543212', '9876543212', 'anuj@gmail.com', '1', '1', '12 January 1985', 'Indian'),
(1015, '1001', '4', '2', 'Amit', 'Kumar', 'Rastogi', 'Male', 'A : 42/6', 'Ghaziabad', '1', '1', '987654312', '8765432123', 'amit@gmail.com', '1', '3', '12 January, 1988', 'Indian'),
(1016, '1002', '3', '1', 'Neeraj', 'Kumar', 'Singh', 'Male', 'Allahabad', 'Allahabad', '4', '1', '120345613421', '9876543212', 'neeraj@gmail.com', '1', '2', '1 July,1988', 'Indian');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_emp_id` int(11) NOT NULL,
  `login_user` varchar(255) NOT NULL,
  `login_password` varchar(255) NOT NULL,
  `login_level` int(11) NOT NULL DEFAULT '3',
  `login_email` varchar(100) NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `login_emp_id`, `login_user`, `login_password`, `login_level`, `login_email`) VALUES
(1, 1001, 'admin', 'test', 1, 'admin@gmail.com'),
(2, 1002, 'reporter', '1234', 2, 'reporter@gmail.com'),
(3, 1003, 'employee', 'test', 3, 'employee@gmail.com'),
(21, 1014, 'anuj', 'test', 3, 'anuj@gmail.com'),
(22, 1015, 'finance', '123456', 4, 'amit@gmail.com'),
(23, 1016, 'neeraj', 'test', 3, 'neeraj@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `month`
--

CREATE TABLE IF NOT EXISTS `month` (
  `month_id` int(11) NOT NULL AUTO_INCREMENT,
  `month_name` varchar(100) NOT NULL,
  PRIMARY KEY (`month_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `month`
--

INSERT INTO `month` (`month_id`, `month_name`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_title` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_title`) VALUES
(1, 'Admin'),
(2, 'Report Manager'),
(3, 'Employee'),
(4, 'Finance');

-- --------------------------------------------------------

--
-- Table structure for table `salutions`
--

CREATE TABLE IF NOT EXISTS `salutions` (
  `sl_id` int(11) NOT NULL AUTO_INCREMENT,
  `sl_name` varchar(255) NOT NULL,
  PRIMARY KEY (`sl_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `salutions`
--

INSERT INTO `salutions` (`sl_id`, `sl_name`) VALUES
(1, 'Mr.'),
(2, 'Mrs.');

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE IF NOT EXISTS `skill` (
  `skill_id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_emp_id` int(11) NOT NULL,
  `skill_name` varchar(255) NOT NULL,
  `skill_grade` varchar(255) NOT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(255) NOT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `state_name`) VALUES
(1, 'Maharastra'),
(2, 'Gujrat'),
(3, 'Bihar'),
(4, 'Uttar Pradesh'),
(5, 'Delhi'),
(6, 'Haryana');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `status_name`) VALUES
(1, 'Permanent Employee'),
(2, 'Consultant'),
(3, 'Intern'),
(5, 'Fresher');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  `type_description` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_id`, `type_name`, `type_description`) VALUES
(1, 'Sedan', 'Sedan Cars'),
(2, 'Hatchback ', 'Hatchback Cars'),
(3, 'SUV', 'SUV Cars'),
(4, 'MUV', 'MUV Cars');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
