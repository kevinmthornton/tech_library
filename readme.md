This is code written for Sheila at Graphic Products to apply for a PHP position based on criteria given the PDF file.

The tech_library.sql file has all the information for the database. I included the data for the tbl_users table. I got this into the database via the insertUsers function which is commented out on line 34 of the index.php file. 

I also included data for the tbl_checked_out table just so the lines would be color coded on the index page when first starting out.


Users
	first: david
	last: marks
	email: david@marks.com
	password: rt5u78eg

	first: john
	last: folks
	email: john@folks.com
	password: u889fllt

	first: mike
	last: knot
	email: mike@ knot.com
	password: jfu33gsr


Database
tbl_books
	id - primary key, auto increment
	title - varchar(100)
	subject - varchar(100)
	isbn - int(10)

tbl_users
	id - primary key, auto increment
	first - varchar(20)
	last - varchar(30)
	email - varchar(50)
	password - char(128)
	salt - char(128)

tbl_checked_out
	id - primary key, auto increment
	book_id - foreign key : tbl_books->id
	user_id - foreign key : tbl_users->id
	when_checked_out - date
	return date - 3 weeks after when_checked_out

=== FILES ===
class.library.php
	contains all the functions for each page	

index.php
	showBookStatus
		show book listing, checked in/out, who, and return date if checked out
	showLogin
		show the login form with submit to login.php
		check to see if message sent

login.php
	checkLogin
		check user/pass against database
		if OK, set session and send to user.php
		else, send back to index.php with message
	setSession
		set up the session for the user id
	logout
		user indicates they want to logout
		kill session, send to index.php with logout message

user.php
	checkSession
		are they allowed to see this page?
	showCheckedOut
		which books does this user have checked out?
		show listing with check in button to return
	checkInBook
		book id is sent to remove this from tbl_checked_out
		get user id from session
	checkOutBook
		book id is sent to add to tbl_checked_out
		get user id from session


variables.php
	vars for DB connection
	best practice would be to put above www files but, if so, change the path in the include
	















