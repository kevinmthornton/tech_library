<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Tech LIbrary - User</title>
<link rel="stylesheet" href="css/main.css" type="text/css" />
</head>
<body>
<?php 
session_start();
include("class.library.php");
$tech_library = new techLibrary;

$tech_library->checkSession($library_db);

# they are logging out
if(isset($_GET['logout'])) {
	$tech_library->logout();
}

#order the books available
$order_by = isset($_GET['order_by']) ? $_GET['order_by'] : "subject"; 


if(isset($_GET['check_out'], $_GET['book_id'])) {
	# check for bad book_id
	if(is_numeric($_GET['book_id'])) {
		$book_id = $_GET['book_id'];	
		$tech_library->checkOutBook($book_id, $library_db);
	} else {
		# wasn't an ISBN number
		echo "that wasn't a correct ISBN number";
	}
}

if(isset($_GET['check_in'], $_GET['book_id'])) {
	# check for bad book_id
	if(is_numeric($_GET['book_id'])) {
		$book_id = $_GET['book_id'];	
		$tech_library->checkInBook($book_id, $library_db);
	} else {
		# wasn't an ISBN number
		echo "that wasn't a correct ISBN number";
	}
}

$tech_library->showCheckedOutBooks($library_db);

# what can they check out?
$tech_library->showAvailableBooks($order_by, $library_db);

?>

<p><a href="user.php?logout=true">Log Out</a></p>

</body>
</html>