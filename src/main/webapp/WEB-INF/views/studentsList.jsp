<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <meta charset="UTF-8">
    <title>Students List</title>
</head>
<body>
    <div class="container mt-5">
        <table class="table table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>S.No</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Age</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.firstName}</td>
                        <td>${student.lastName}</td>
                        <td>${student.email}</td>
                        <td>${student.age}</td>
                        <td>
						 <button class="btn btn-primary" 
						        data-bs-toggle="modal" 
						        data-bs-target="#updateModal"
						        onclick="fillUpdateForm('${student.id}', '${student.firstName}', '${student.lastName}', '${student.email}', '${student.age}')">
						    Update
						</button>

						</td>

					<td>
					    <form action="deleteStudent" method="post" style="display:inline;">
					        <input type="hidden" name="id" value="${student.id}">
					        <button type="submit" class="btn btn-danger"
					                onclick="return confirm('Are you sure you want to delete this student?');">
					            Delete
					        </button>
					    </form>
					</td>
					

					                    </tr>
					                </c:forEach>
            </tbody>
        </table>
        
        <!-- Update Student Modal -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <form action="updateStudent" method="post">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Update Student</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span>&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <input type="hidden" name="id" id="updateId" />
          <div class="form-group">
            <label>First Name</label>
            <input type="text" name="firstName" id="updateFirstName" class="form-control" required />
          </div>
          <div class="form-group">
            <label>Last Name</label>
            <input type="text" name="lastName" id="updateLastName" class="form-control" required />
          </div>
          <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" id="updateEmail" class="form-control" required />
          </div>
          <div class="form-group">
            <label>Age</label>
            <input type="number" name="age" id="updateAge" class="form-control" required />
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-success">Update</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
        </div>
      </div>
    </form>
  </div>
</div>

<script>
function fillUpdateForm(id, firstName, lastName, email, age) {
    document.getElementById("updateId").value = id;
    document.getElementById("updateFirstName").value = firstName;
    document.getElementById("updateLastName").value = lastName;
    document.getElementById("updateEmail").value = email;
    document.getElementById("updateAge").value = age;
    alert( document.getElementById("updateId").value = id);
}
function closeModal() {
    var modal = bootstrap.Modal.getInstance(document.getElementById('updateModal'));
    modal.hide();
}

</script>

  

</script>
    </div>
</body>
</html>
