<html>
<head>
    <title>Spring MVC Demo</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Optional Bootstrap JS (for components like modals, dropdowns) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<h2 class="text-center mt-4">Spring MVC Demo using CRUD operations</h2>

<div class="container mt-5">
	<form action="addStudents" method="post">
		  <div class="form-group mb-3">
		    <label for="firstName">First Name</label>
		    <input type="text" class="form-control" name="firstName" id="firstName" aria-describedby="firstName" placeholder="Enter your First Name">
		  </div>
		  <div class="form-group mb-3">
		    <label for="lastName">Last Name</label>
		    <input type="text" class="form-control" name="lastName" id="lastName" placeholder="Enter your Last Name">
		  </div>
		  
		  <div class="form-group mb-3">
		    <label for="email">Email</label>
		    <input type="email" class="form-control" name="email" id="email" placeholder="Enter your email address">
		  </div>
		  
		  <div class="form-group mb-3">
		    <label for="age">Age</label>
		    <input type="text" class="form-control" name="age" id="age" placeholder="Enter your age">
		  </div>
		
		  <button type="submit" class="btn btn-primary">Submit</button>
	</form>
</div>

<div class="container mt-5">
	<form action="getStudents" method="get">
		<h2 class="text-center mt-4">See the list of students here</h2>
	
		 <div class= "text-center mt-4">
		 	 <button type="submit" class="btn btn-primary">Get Student List</button>
		 </div>
	</form>
</div>
</body>
</html>
