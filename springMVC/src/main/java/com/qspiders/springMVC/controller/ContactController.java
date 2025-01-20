package com.qspiders.springMVC.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.qspiders.springMVC.dto.ContactDTO;
import com.qspiders.springMVC.service.ContactService;

@Controller
public class ContactController {

	@Autowired
	private ContactService contactService;

	@RequestMapping(path = "/add-contact-page")
	protected String getAddContactPage() {
		return "add_contact";
	}

	@RequestMapping(path = "/add-contact", method = RequestMethod.POST)
	protected String addContact(@RequestParam(name = "first_name") String firstname,
			@RequestParam(name = "last_name") String lastname, @RequestParam(name = "email") String email,
			@RequestParam(name = "mobile") long mobile, @RequestParam(name = "work") long work,
			@RequestParam(name = "gender") String gender, @RequestParam(name = "dob") String dob,
			@RequestParam(name = "address") String address, @RequestParam(name = "website") String website,
			ModelMap modelMap) {

		boolean contactAdded = contactService.addContact(firstname, lastname, email, mobile, work, gender, dob, address,
				website);

		if (contactAdded)
			modelMap.addAttribute("message", "Contact added");
		else
			modelMap.addAttribute("message", "Something went wrong");

		return "contacts";
	}

	@RequestMapping(path = "/contacts")
	protected String findAllContacts(ModelMap modelMap) {

		List<ContactDTO> contacts = contactService.findAllContacts();

		if (contacts != null)
			modelMap.addAttribute("contacts", contacts);
		else
			modelMap.addAttribute("message", "Contact not found");

		return "contacts";
	}

	@RequestMapping(path = "/delete-contact")
	protected String deleteContact(@RequestParam(name = "id") int id, ModelMap modelMap) {
		boolean contactDeleted = contactService.deleteContactById(id);

		if (contactDeleted) {
			modelMap.addAttribute("message", "Contact Deleted sucessfully");
			List<ContactDTO> contacts = contactService.findAllContacts();

			if (contacts != null)
				modelMap.addAttribute("contacts", contacts);
			else
				modelMap.addAttribute("message", "Contacts not found");

		} else
			modelMap.addAttribute("message", "Something went wrong");

		return "contacts";
	}

	@RequestMapping(path = "/edit-contact")
	protected String editContactById(@RequestParam(name = "id") int id, ModelMap modelMap) {
		ContactDTO contacts = contactService.findContactById(id);
		modelMap.addAttribute("contacts", contacts);
		return "edit_contact";
	}

	@RequestMapping(path = "/update-contact", method = RequestMethod.POST)
	protected String updateContact(@RequestParam(name = "id") int id,
			@RequestParam(name = "first_name") String firstname, @RequestParam(name = "last_name") String lastname,
			@RequestParam(name = "email") String email, @RequestParam(name = "mobile") long mobile,
			@RequestParam(name = "work") long work, @RequestParam(name = "gender") String gender,
			@RequestParam(name = "dob") String dob, @RequestParam(name = "address") String address,
			@RequestParam(name = "website") String website, ModelMap modelMap) {

		boolean contactUpdated = contactService.updateContact(id, firstname, lastname, email, mobile, work, gender, dob,
				address, website);

		if (contactUpdated) {
			modelMap.addAttribute("message", "Contact updated");
			List<ContactDTO> contacts = contactService.findAllContacts();
			modelMap.addAttribute("contacts", contacts);
		} else
			modelMap.addAttribute("message", "Something went wrong");
		return "contacts";
	}

}
