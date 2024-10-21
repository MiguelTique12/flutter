package com.ProyectoGT.CodeByte.IRepository.Security;

import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ProyectoGT.CodeByte.DTO.IUserDTO;
import com.ProyectoGT.CodeByte.Entity.Security.User;
import com.ProyectoGT.CodeByte.IRepository.ObjectT.IObjectTRepository;

public interface IUserRepository extends IObjectTRepository<User>{
	
	Optional<User> findByUserName(String userName); // Método para buscar por nombre de usuario

	 @Query("SELECT u.id AS id, u.status AS status, u.createdAt AS createdAt, " +
	           "u.updtatedAt AS updatedAt, u.deletedAt AS deletedAt, " +
	           "u.userName AS userName, u.profilePhoto AS profilePhoto " +
	           "FROM User u WHERE u.id = :id")
	    Optional<IUserDTO> usersDTO(@Param("id") Long id);


	 @Query(value = "select count(*) " +
			 "from users " +
			 "inner join person on users.person_id = person.id " +
			 "where users.id = :usuarioId " +
			 "and ( " +
			 " person.names IS NULL OR " +
			 " person.last_name IS NULL OR " +
			 " person.gender IS NULL OR " +
			 " person.email IS NULL OR " +
			 " person.document_type IS NULL OR " +
			 " person.document_photo IS NULL OR " +
			 " person.document IS NULL OR " +
			 " person.birthdate IS NULL " +
			 ")", nativeQuery = true)
	 Integer validarDatosPersonalesPersona(Integer usuarioId);

}
