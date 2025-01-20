package com.qspiders.springMVC.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.qspiders.springMVC.dao.ContactDAO;
import com.qspiders.springMVC.dto.ContactDTO;

@Component
public class ContactService {

	@Autowired
	private ContactDAO contactDAO;

	public boolean addContact(String firstname, String lastname, String email, long mobile, long work, String gender,
			String dob, String address, String website) {

		ContactDTO contactDTO = new ContactDTO();

		contactDTO.setFirstName(firstname);
		contactDTO.setLastName(lastname);
		contactDTO.setEmail(email);
		contactDTO.setMobile(mobile);
		contactDTO.setWork(work);
		contactDTO.setGender(gender);
		contactDTO.setDob(dob);
		contactDTO.setAddress(address);
		contactDTO.setWebsite(website);

		try {
			contactDAO.addContact(contactDTO);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<ContactDTO> findAllContacts() {
		List<ContactDTO> contacts = contactDAO.findAllContacts();

		if (contacts.size() > 0)
			return contacts;
		else
			return null;
	}

	public boolean deleteContactById(int id) {
		try {
			contactDAO.deleteContactById(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public ContactDTO findContactById(int id) {
		ContactDTO contact = contactDAO.findContactById(id);
		return contact;
	}

	public boolean updateContact(int id, String firstname, String lastname, String email, long mobile, long work,
			String gender, String dob, String address, String website) {
		try {
			contactDAO.updateContact(id, firstname, lastname, email, mobile, work, gender, dob, address, website);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
