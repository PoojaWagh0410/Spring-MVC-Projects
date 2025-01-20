package com.qspiders.springMVC.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.qspiders.springMVC.dto.UserDTO;

@Component
public class UserDAO {

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

	public UserDTO addUser(UserDTO userDTO) {

		openConnection();
		entityTransaction.begin();
		entityManager.persist(userDTO);
		entityTransaction.commit();
		closeConnection();
		return userDTO;
	}

	public UserDTO authUser(String email, String password) {
		openConnection();
		Query query = entityManager
				.createQuery("SELECT user FROM UserDTO user WHERE user.email = ?1 AND user.password = ?2");
		query.setParameter(1, email);
		query.setParameter(2, password);
		UserDTO User = (UserDTO) query.getSingleResult();
		closeConnection();
		return User;
	}

	public UserDTO findUser(int id) {
		openConnection();
		entityTransaction.begin();
		UserDTO user = entityManager.find(UserDTO.class, id);
		entityTransaction.commit();
		closeConnection();
		return user;
	}

	public UserDTO updateUser(int id, String name, String email, long mobile, String password) {
		openConnection();
		UserDTO user = entityManager.find(UserDTO.class, id);
		user.setName(name);
		user.setEmail(email);
		user.setMobile(mobile);
		user.setPassword(password);
		entityTransaction.begin();
		entityManager.persist(user);
		entityTransaction.commit();
		closeConnection();
		return user;
	}

	@SuppressWarnings("unchecked")
	public List<UserDTO> findAllContacts() {
		openConnection();
		Query query = entityManager.createQuery("SELECT users FROM UserDTO users");
		List<UserDTO> users = query.getResultList();
		closeConnection();
		return users;
	}

	public void deleteUserById(int id) {
		openConnection();
		UserDTO userDTO = entityManager.find(UserDTO.class, id);
		entityTransaction.begin();
		entityManager.remove(userDTO);
		entityTransaction.commit();
		closeConnection();
	}

}
