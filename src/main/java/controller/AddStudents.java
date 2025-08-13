package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.StudentDao;
import entity.Student;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AddStudents {

	@Autowired
	private StudentDao studentDao;

	@PostMapping("/addStudents")
	public ModelAndView addStudents(HttpServletRequest httpServletRequest) {

		Student s = new Student();
		s.setFirstName(httpServletRequest.getParameter("firstName"));
		s.setLastName(httpServletRequest.getParameter("lastName"));
		s.setEmail(httpServletRequest.getParameter("email"));
		s.setAge(Integer.parseInt(httpServletRequest.getParameter("age")));

		studentDao.saveStudent(s);

		ModelAndView mv = new ModelAndView();
		mv.addObject("firstName", s.getFirstName());
		mv.addObject("lastName", s.getLastName());
		mv.addObject("email", s.getEmail());
		mv.addObject("age", s.getAge());

		mv.setViewName("displayStudents");
		return mv;
	}

	@GetMapping("/getStudents")
	public ModelAndView getStudents() {

		List<Student> students = studentDao.getStudents();
		System.out.println("Students: " + students.toString());
		ModelAndView mv = new ModelAndView();
		mv.addObject("students", students);
		mv.setViewName("studentsList");

		return mv;
	}

	@PostMapping("/updateStudent")
	public String updateStudent(@RequestParam("id") int id, @RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName, @RequestParam("email") String email,
			@RequestParam("age") int age) {
		Student s = new Student();
		s.setId(id);
		s.setFirstName(firstName);
		s.setLastName(lastName);
		s.setEmail(email);
		s.setAge(age);

		studentDao.updateStudent(s);

		return "redirect:/studentsList";

	}

	@GetMapping("/studentsList")
	public String getStudentList(Model model) {
		List<Student> students = studentDao.getStudents();
		model.addAttribute("students", students);
		return "studentsList";
	}

	@PostMapping("/deleteStudent")
	public String deleteStudent(@RequestParam("id") int id) {

		studentDao.deleteStudent(id);
		return "redirect:/studentsList";
	}
}
