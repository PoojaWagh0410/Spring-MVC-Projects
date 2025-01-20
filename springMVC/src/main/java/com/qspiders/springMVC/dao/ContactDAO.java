package com.qspiders.springMVC.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.qspiders.springMVC.dto.ContactDTO;

@Component
public class ContactDAO {

	private EntityManagerFactory entityManagerFactory;
	private EntityManager entityManager;
	private EntityTransaction entityTransaction;

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	private void openConnection() {
		entityManagerFactory = Persistence.createEntityManagerFactory("contact_manager");
		entityManager = entityManagerFactory.createEntityManager();
		entityTransaction = entityManager.getTransaction();
	}

	private void closeConnection() {
		if (entityManagerFactory != null)
			entityManagerFactory.close();
		if (entityManager != null)
			entityManager.close();
		if (entityTransaction != null) {
			if (entityTransaction.isActive())
				entityTransaction.rollback();
		}
	}

	public void addContact(ContactDTO contactDTO) {
		openConnection();
		entityTransaction.begin();
		entityManager.persist(contactDTO);
		entityTransaction.commit();
		closeConnection();
	}

	@SuppressWarnings("unchecked")
	public List<ContactDTO> findAllContacts() {

		openConnection();
		Query query = entityManager.createQuery("SELECT contacts FROM ContactDTO contacts");
		List<ContactDTO> contacts = query.getResultList();
		closeConnection();
		return contacts;
	}

	public void deleteContactById(int id) {
		openConnection();
		entityTransaction.begin();
		ContactDTO contact = entityManager.find(ContactDTO.class, id);
		entityManager.remove(contact);
		entityTransaction.commit();
		closeConnection();
	}

	public ContactDTO findContactById(int id) {
		openConnection();
		ContactDTO contact = entityManager.find(ContactDTO.class, id);
		closeConnection();
		return contact;
	}

	public ContactDTO updateContact(int id, String firstname, String lastname, String email, long mobile, long work,
			String gender, String dob, String address, String website) {

		openConnection();
		ContactDTO contactDTO = entityManager.find(ContactDTO.class, id);
		contactDTO.setFirstName(firstname);
		contactDTO.setLastName(lastname);
		contactDTO.setEmail(email);
		contactDTO.setMobile(mobile);
		contactDTO.setWork(work);
		contactDTO.setGender(gender);
		contactDTO.setDob(dob);
		contactDTO.setAddress(address);
		contactDTO.setWebsite(website);
		entityTransaction.begin();
		entityManager.persist(contactDTO);
		entityTransaction.commit();
		return contactDTO;
	}

}
