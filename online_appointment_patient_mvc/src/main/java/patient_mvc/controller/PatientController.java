package patient_mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpMethod;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import patient_mvc.entity.PatientEntity;
import patient_mvc.model.Appointment;
import patient_mvc.model.Doctor;
import patient_mvc.model.Patient;

@Controller
public class PatientController {

	
	@Autowired
	private RestTemplate restTemplate;
	static final String PATIENT_MS_URL="http://localhost:8080/api/";
	@Bean
	public RestTemplate create()
	{
		return new RestTemplate();
	}
	
	@GetMapping("/")
	public String home()
	{
		return "index";
	}
	

	
	@GetMapping("/processlogin")
	public String loginProcess(Model model)
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		PatientEntity patient = (PatientEntity) auth.getPrincipal();
		System.out.println(patient);
		if(patient != null)
		{
			model.addAttribute("patientName",patient.getName());
			return "welcomePatient";
			
		}else{
				return "index";
		}
	}
	
	
	
	@GetMapping("/register")
	public String about()
	{
		return "patientRegistrationForm";
	}
	
	@PostMapping("/processregister")
	public  String registerDoctor(@ModelAttribute("patient") Patient patient) {
		System.out.println(patient);
		String postForObject = restTemplate.postForObject(PATIENT_MS_URL+"patient/add",patient,String.class);
		System.out.println(postForObject);
		return "index";
	}
	
	
	@GetMapping("/searchdoctor")
	public String getDoctorsByCategory(@RequestParam("specialization") String specialization,Model model){
	  Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	  PatientEntity patient = (PatientEntity) auth.getPrincipal();
	  List<Doctor> doctorList=restTemplate.getForObject(PATIENT_MS_URL+"doctor/category/"+specialization,List.class, HttpMethod.GET);
	  model.addAttribute("doctorList",doctorList);
	  model.addAttribute("patientName",patient.getName());
	  return "searchDoctors";
	}
	
	
	//booking the appointment
	@GetMapping("/booking/{doctorName}/conf")
	public String bookAppointment(@PathVariable("doctorName") String doctorName,Model model)
	{ 
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		PatientEntity patient = (PatientEntity) auth.getPrincipal();
		Appointment appointment = new Appointment();
		appointment.setDateTime("21/5/2021");
		appointment.setStatus("unknown");
		appointment.setPayment("unpaid");
		appointment.setDoctorName(doctorName);
		appointment.setPatientName(patient.getName());
		
		String postForObject= restTemplate.postForObject(PATIENT_MS_URL+"appointment/add",appointment,String.class);
		System.out.println(postForObject);
		
		List<Appointment> appoList=restTemplate.getForObject(PATIENT_MS_URL+"appointment/patient/"+patient.getName(),List.class, HttpMethod.GET);
		model.addAttribute("appoList",appoList);
		return "appointment_payment";
	}
	
	@GetMapping("/payment/{bookId}/conf")
	public String payment(@PathVariable("bookId") String bookId,Model model)
	{ 
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		PatientEntity patient = (PatientEntity) auth.getPrincipal();
		String object = restTemplate.getForObject(PATIENT_MS_URL+"appointment/payment/"+bookId,String.class, HttpMethod.GET);
		System.out.println(object);
		List<Appointment> appoList=restTemplate.getForObject(PATIENT_MS_URL+"appointment/patient/"+patient.getName(),List.class, HttpMethod.GET);
		model.addAttribute("appoList",appoList);
		return "viewpatientappointments";
	}
	
	
	
}
