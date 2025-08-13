<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Display Student Details</title>
</head>
<body>
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">S.No</th>
				<th scope="col">First Name</th>
				<th scope="col">Last Name</th>
				<th scope="col">Email</th>
				<th scope="col">Age</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>${firstName}</td>
				<td>${lastName}</td>
				<td>${email}</td>
				<td>${age}</td>

			</tr>

		</tbody>
	</table>





	<script>
function deleteStudent(studentId) {
    if (confirm("Are you sure you want to delete this student: "+studentId)) {
        fetch('/deleteStudent/' + studentId, {
            method: 'DELETE'
        })
        .then(response => {
            if (response.ok) {
                alert("Student deleted successfully");
                location.reload();
            } else {
                alert("Failed to delete student");
            }
        });
    }
}
</script>



	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>

</body>
</html>