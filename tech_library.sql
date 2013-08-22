DROP DATABASE IF EXISTS `tech_library` ;
CREATE DATABASE `tech_library` ;

CREATE USER 'library_user'@'localhost' IDENTIFIED BY 'uuHHTRee45vrT';
GRANT SELECT, INSERT, UPDATE, DELETE ON `tech_library`.* TO 'library_user'@'localhost';

CREATE TABLE `tech_library`.`tbl_users` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  `first` VARCHAR(20) NOT NULL, 
  `last` VARCHAR(30) NOT NULL, 
  `email` VARCHAR(50) NOT NULL, 
  `password` CHAR(128) NOT NULL, 
  `salt` CHAR(128) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE `tech_library`.`tbl_books` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  `title` VARCHAR(100) NOT NULL, 
  `subject` VARCHAR(100) NOT NULL, 
  `isbn` INT NOT NULL
   ) ENGINE = InnoDB;
  
CREATE TABLE `tech_library`.`tbl_checked_out` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  `book_id` INT NOT NULL, 
  `user_id` INT NOT NULL, 
  `when_checked_out` VARCHAR(30) NOT NULL,
  `return_date` VARCHAR(30) NOT NULL,
  FOREIGN KEY (book_id) REFERENCES tbl_books(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (user_id) REFERENCES tbl_users(id) ON DELETE CASCADE ON UPDATE CASCADE
   ) ENGINE = InnoDB;


INSERT INTO  `tech_library`.`tbl_books` (`title`,`subject`,`isbn`) VALUES ( 'Programming PHP',  'PHP',  '1449392776');
INSERT INTO  `tech_library`.`tbl_books` (`title`,`subject`,`isbn`) VALUES ( 'Learning PHP',  'PHP',  '1449319262');
INSERT INTO  `tech_library`.`tbl_books` (`title`,`subject`,`isbn`) VALUES ( 'Begining PHP',  'PHP',  '0470413964');
INSERT INTO  `tech_library`.`tbl_books` (`title`,`subject`,`isbn`) VALUES ( 'PHP and MySQL',  'PHP',  '9780672329166');
INSERT INTO  `tech_library`.`tbl_books` (`title`,`subject`,`isbn`) VALUES ( 'Learning C',  'C',  '0131103628');
INSERT INTO  `tech_library`.`tbl_books` (`title`,`subject`,`isbn`) VALUES ( 'Programming in  C',  'C',  '0672326663');
INSERT INTO  `tech_library`.`tbl_books` (`title`,`subject`,`isbn`) VALUES ( 'Beginning C',  'C',  '0672305100');
INSERT INTO  `tech_library`.`tbl_books` (`title`,`subject`,`isbn`) VALUES ( 'All in one  C',  'C',  '0764570692');
INSERT INTO  `tech_library`.`tbl_books` (`title`,`subject`,`isbn`) VALUES ( 'Programming in  Ruby',  'Ruby',  '0364937496');
INSERT INTO  `tech_library`.`tbl_books` (`title`,`subject`,`isbn`) VALUES ( 'Beginning Ruby',  'Ruby',  '0736984653');
INSERT INTO  `tech_library`.`tbl_books` (`title`,`subject`,`isbn`) VALUES ( 'Learning Ruby',  'Ruby',  '0284933176');
INSERT INTO  `tech_library`.`tbl_books` (`title`,`subject`,`isbn`) VALUES ( 'Ruby for dummies',  'Ruby',  '0648231779');
INSERT INTO  `tech_library`.`tbl_books` (`title`,`subject`,`isbn`) VALUES ( 'All in one  iOS',  'iOS',  '0453776844');
INSERT INTO  `tech_library`.`tbl_books` (`title`,`subject`,`isbn`) VALUES ( 'Programming in  iOS',  'iOS',  '0217849376');
INSERT INTO  `tech_library`.`tbl_books` (`title`,`subject`,`isbn`) VALUES ( 'Beginning iOS',  'iOS',  '0836619675');
INSERT INTO  `tech_library`.`tbl_books` (`title`,`subject`,`isbn`) VALUES ( 'Learning iOS',  'iOS',  '0957629667');


INSERT INTO `tech_library`.`tbl_users` (`id`, `first`, `last`, `email`, `password`, `salt`) VALUES
(1, 'david', 'marks', 'david@marks.com', '080e0d92195b6a07c0147ec3a8b15ef193ea35d1f52c4813cf0596c0aeae0aa2446864996f96f81fb6d69f59ac73adc27a5ebaf2cb313d0dbb079b9e0fc90860', '6ebc05bdbfb251f881bbda767ebcdd08bbc0aed6d6486d2d5032777a3b339ad0166f4f64fdb9e22b07ae9c4fe4876134f691d5ff3927dc2dac252da2454246ad'),
(2, 'john', 'folks', 'john@folks.com', 'fce54e49f7b04a51137ac5b0a2de9fde6153477ec5e31abe402234228d3492cba4c9e97ac99d6870d76acbc659cedac3fb3dfada345965a5378cc60f418747fb', '7f270731ce15c53d9a774980cfecb8b14c9b37488e85f8920f383db71a18152b3cfb63e75a4b7e798312a54c5a121f4ea8f36123451a71b082759668c7e3c5a6'),
(3, 'mike', 'knot', 'mike@ knot.com', '22c56b72ae58c0355077f044d317bc2e8c9da923c20d69fd30985c3846479d0709ef81973d4831e239266201041f554299ba406c04aaab08cdae3d91d79d0176', '846ff4fa39874bd8c012591044a1646d78b36be4a5c9209d064db3f14f5d2a29b994b864f7cfeeb56427a8b2c0717986c8b62000b11c445a3810c5edf5931d94');


INSERT INTO `tech_library`.`tbl_checked_out` (`id`, `book_id`, `user_id`, `when_checked_out`, `return_date`) VALUES
(1, 5, 1, 'August 21, 2013', 'September, 4, 2013'),
(2, 14, 1, 'August 21, 2013', 'September, 4, 2013'),
(3, 10, 1, 'August 21, 2013', 'September, 4, 2013'),
(4, 4, 2, 'August 21, 2013', 'September, 4, 2013'),
(5, 3, 2, 'August 21, 2013', 'September, 4, 2013');

