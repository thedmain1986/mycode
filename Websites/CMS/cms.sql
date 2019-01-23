-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2018 at 06:57 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(3) NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(19, 'PHP'),
(20, 'Bootstrap'),
(21, 'Procedural PHP'),
(22, 'Javascript'),
(23, 'TEST'),
(25, 'OOP');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(3) NOT NULL,
  `comment_post_id` int(3) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_status` varchar(255) NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_post_id`, `comment_author`, `comment_email`, `comment_content`, `comment_status`, `comment_date`) VALUES
(3, 1, 'cindy', 'cindy86@gmail.com', 'cindy cindy commenting cindy', 'approved', '2018-05-14'),
(5, 1, 'here', 'here@gmail.com', 'cmment stuff and more stuff and stuff and comment', 'unapproved', '2018-05-15'),
(6, 8, 'tashana', 'tb@gmail.com', 's error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi archite', 'approved', '2018-05-15'),
(7, 7, 'poop', 'poop@gmail.com', ' amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tem', 'unapproved', '2018-05-15'),
(9, 7, 'Juan', 'progert@gmail.com', 'we testing the comments and they look so good in this new page youre making', 'approved', '2018-05-18'),
(10, 1, 'Stan', 'stan123@gmail.com', 'hery', 'unapproved', '2018-05-18'),
(11, 1, 'Tom', 'tommy@gmail.com', 'tommy at tommy ', 'unapproved', '2018-05-18'),
(13, 1, 'test', 'test@test.com', 'testing', 'approved', '2018-07-02'),
(15, 36, 'Comment', 'comment@gmail.com', 'co', 'approved', '2018-09-26');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(3) NOT NULL,
  `post_category_id` int(11) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_user` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_tags` varchar(255) NOT NULL,
  `post_comment_count` varchar(255) NOT NULL,
  `post_status` varchar(255) NOT NULL DEFAULT 'draft',
  `post_views_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `post_title`, `post_author`, `post_user`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_count`, `post_status`, `post_views_count`) VALUES
(1, 19, 'Derrick CMS Practice', 'Derrick Jones', 'thedmain1986', '2018-07-18', 'gokuVegeta.png', 'Holy Cow! Goku and Vegeta are going crazy!\r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        ', 'JAVA, PLUS JAVA', '9', 'published', 8),
(7, 20, 'Best PHP Course Ever', 'Derrick J', 'peter2', '2018-06-20', 'gohanss2.png', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n        \r\n        \r\n        \r\n        \r\n        ', 'Bootstrap, PHP', '4', 'published', 0),
(8, 21, 'Test', 'Testy', 'blob', '2018-06-20', 'AWM-Gold.png', '        nde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, cons\r\n        \r\n        \r\n        ', 'JAVASCRIPT', '4', 'published', 0),
(14, 19, 'Just another post', 'Derrick', 'test2', '2018-07-24', '6-2-cool-effects-picture.png', '<p>just some content is here</p>', 'hello', '', 'published', 0),
(16, 23, 'Wow another post', 'Ted', 'test2', '2018-07-24', 'DiscoBall.gif', '<p>adfasdfa</p>', 'Bootstrap', '', 'draft', 0),
(18, 19, 'Here is a new post', 'Tom', 'peter2', '2018-07-24', 'electricspark.png', '<p>test</p>', 'Bootstrap', '', 'published', 1),
(28, 21, 'Test', 'testss', 'iamtesting', '2018-07-24', 'electricity4.png', '<p>testttttt</p>', 'Testing', '', 'published', 0),
(29, 25, 'example postsss', 'Goku Saiyan', 'blob', '2018-09-11', '43-blood-png-image.png', '<p>asdfasfsdaf</p>', 'test', '', 'published', 0),
(30, 25, 'To Test Author', 'Testy', 'iamtesting', '2018-09-18', 'Smiling_Mouth_PNG_Clipart_Image-323.png', '<p>asdfasdfasd &nbsp;asdfasdf</p>', 'Bootstrap', '', 'draft', 0),
(31, 19, 'Derrick CMS Practice', 'Derrick Jones', 'iamtesting', '2018-09-18', 'gokuVegeta.png', 'Holy Cow! Goku and Vegeta are going crazy!\r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        ', 'JAVA, PLUS JAVA', '', 'published', 0),
(32, 20, 'Best PHP Course Ever', 'Derrick J', 'test2', '2018-09-18', 'gohanss2.png', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n        \r\n        \r\n        \r\n        \r\n        ', 'Bootstrap, PHP', '', 'published', 0),
(33, 21, 'Test', 'Testy', 'blob', '2018-09-18', 'AWM-Gold.png', '        nde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, cons\r\n        \r\n        \r\n        ', 'JAVASCRIPT', '', 'published', 0),
(34, 19, 'Here is a new post', 'Tom', 'peter2', '2018-09-18', 'electricspark.png', '<p>test</p>', 'Bootstrap', '', 'published', 0),
(35, 21, 'Test', 'testss', 'blob', '2018-09-18', 'electricity4.png', '<p>testttttt</p>', 'Testing', '', 'published', 0),
(36, 19, 'Here is a new post', 'Tom', '', '2018-09-18', 'electricspark.png', '<p>test</p>', 'Bootstrap', '', 'published', 5),
(42, 20, 'tet', '', 'peter2', '2018-09-28', 'electricity2.png', '<p>adfasdf</p>', 'asdfasdf', '', 'published', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_image` text NOT NULL,
  `user_role` varchar(255) NOT NULL,
  `randSalt` varchar(255) NOT NULL DEFAULT '$2y$10$iusesomecrazystrings22'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_firstname`, `user_lastname`, `user_email`, `user_image`, `user_role`, `randSalt`) VALUES
(22, 'peter2', '$2y$12$.uA401xRtsxcAWyXHkZMp.alKPDqE3J0MF0ExVXFbr9Lun1oZDEwi', '', '', 'peter2@gmail.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22'),
(23, 'derrick', '$2y$12$5weZqQBDSwdVJHpE7Wjy/.lNxhlxg7Hfa/PuLISZy/m41d69Lpyji', '', '', 'derrick@gmail.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22'),
(25, 'thedmain1986', '$2y$12$qLCJtEVbhNOzOISOIGCsdO6v5mzaHB6E3Gz00eeSlIIrvi7Dnpaaa', '', '', 'thedmain1986@gmail.com', '', 'subscriber', '$2y$10$iusesomecrazystrings22'),
(28, 'test2', '$2y$12$0CDbSBD4DbYEUsanqy1pf.XivbgLCZGL.6hJn1vqUGOBSD5/NYz1u', 'testtest', 'test', 'testing@gmail.com', '', 'admin', '$2y$10$iusesomecrazystrings22'),
(30, 'blob', '$2y$10$5WuZ0N1x9qqxF7dBkJO6vu4FC701tOfeR.SDFa9CIcPfLeIqgh54e', 'blob', 'quit', 'blob@gmail.com', '', 'admin', '$2y$10$iusesomecrazystrings22'),
(31, 'iamtesting', '$2y$10$4WcoHeaCidIksZuz2CB3SeWBqmldSTVysLnlPXIt8A8/HZpDccRqy', 'test', 'testing', 'testing@gmail.com', '', 'admin', '$2y$10$iusesomecrazystrings22');

-- --------------------------------------------------------

--
-- Table structure for table `users_online`
--

CREATE TABLE `users_online` (
  `id` int(11) NOT NULL,
  `session` varchar(255) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_online`
--

INSERT INTO `users_online` (`id`, `session`, `time`) VALUES
(1, 'miuq8m2jtjgod5puc0pq408hco', 1537823270),
(2, '2s3477417dmc94tai47qmrj556', 1537827678),
(3, 'rs2g70modecndheg2rj15f7bd4', 1537911227),
(4, '0rbdv5kcam5r6v4bg9hv2hc20j', 1537909761),
(5, 'f5bhsm5vsbit4q81tkn5chvask', 1537912062),
(6, 'ld7tnuithlntqltcqljkilmsso', 1537912075),
(7, 'u62ddg7tc6f1kps7if4o29n0pp', 1537916428),
(8, 'aaqgjq6u99hj3reulid8ljanlu', 1537919907),
(9, 'i4dvcmccti7dt1m2bhordpric1', 1538001609),
(10, 'bdfq10u0qkkqt6adphtqgp25mt', 1538164625),
(11, '2c25m1eqdrlnqfrgv5vphlu3pr', 1538583318);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `users_online`
--
ALTER TABLE `users_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
