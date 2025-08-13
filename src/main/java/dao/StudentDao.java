package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import config.HibernateUtil;
import entity.Student;

@Repository
public class StudentDao {

	// saving data using jdbc
//	@Autowired
//	private DataSource dataSource;
//	
//	
//	public void saveStudent(Student student) {
//		 String sql = "INSERT INTO student.student_records (first_name, last_name, email, age) VALUES (?, ?, ?, ?)";
//		 
//		 try (Connection conn = dataSource.getConnection();
//	             PreparedStatement ps = conn.prepareStatement(sql)) {
//
//	            ps.setString(1, student.getFirstName());
//	            ps.setString(2, student.getLastName());
//	            ps.setString(3, student.getEmail());
//	            ps.setInt(4, student.getAge());
//
//	            int count = ps.executeUpdate();
//	            System.out.println("Number of rows affected: "+count);
//	          
//	        } catch (SQLException e) {
//	            e.printStackTrace();
//	      }
//		 
//		 System.out.println("Student Records have been updated........");
//	}

	// saving data using hibernate

	public void saveStudent(Student student) {
		Transaction transaction = null;

		Session session = HibernateUtil.getSessionFactory().openSession();

		transaction = session.beginTransaction();

		session.persist(student);

		transaction.commit();

		System.out.println("Student saved successfully!");
	}

	@SuppressWarnings("deprecation")
	public List<Student> getStudents() {

		Session session = HibernateUtil.getSessionFactory().openSession();

		List<Student> student = session.createQuery("FROM Student", Student.class).getResultList();
		System.out.println("Number of Student list: " + student.size());
		return student;
	}

	public void updateStudent(Student s) {

		Transaction t = null;

		Session session = HibernateUtil.getSessionFactory().openSession();

		Student existing = session.get(Student.class, s.getId());

		if (existing != null) {
			t = session.beginTransaction();

			session.merge(s);

			t.commit();

			System.out.println("Student records updated......");
		} else {
			System.out.println("No student found with ID: " + s.getId());
		}

	}

	@SuppressWarnings("deprecation")
	public void deleteStudent(int id) {
		Transaction transaction = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		transaction = session.beginTransaction();
		Student existingStudent = session.get(Student.class, id);

		if (existingStudent != null) {
			session.remove(existingStudent);
			System.out.println("Student record deleted: " + existingStudent.getId());
		} else {
			System.out.println("No student found with ID: " + id);
		}

		transaction.commit();
	}
}
