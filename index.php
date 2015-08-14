<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Tech LIbrary</title>
<link rel="stylesheet" href="css/main.css" type="text/css" />
</head>
<body>
<?php 
session_start();
include("class.library.php");
$tech_library = new techLibrary;

# any messages sent to this page?
$login_msg = isset($_GET['login_msg']) ? $_GET['login_msg'] : 0;

#order the books available
$order_by = isset($_GET['order_by']) ? $_GET['order_by'] : "subject"; 

if(isset($_POST['email'], $_POST['password'])) {
	# can check email/password for junk
	# do this with JS on the front end but, doesn't hurt to do it again
	$email_regex = '/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/'; 
	if (preg_match($email_regex, $_POST['email'])) {
		$email = $_POST['email'];
		$password = $_POST['password'];
		$tech_library->checkLogin($email, $password, $library_db);
	} else {
		# not a proper email address, go home with msg
		$tech_library->changeLocation("index.php?login_msg=1");
	}
} else {
	#insert user
	#$tech_library->insertUsers($library_db);
	
	# listing of all the books
	$tech_library->showBookStatus($order_by, $library_db);
	
	# login form
	$tech_library->showLogin($login_msg);
	# much easier to just include an html file
	include("login_form.html");
}
?>
</body>
</html>