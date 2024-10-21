package com.ProyectoGT.CodeByte.IRepository.Security;

import java.util.Optional;

import com.ProyectoGT.CodeByte.Entity.Security.Person;
import com.ProyectoGT.CodeByte.IRepository.ObjectT.IObjectTRepository;

public interface IPersonRepository extends IObjectTRepository<Person>{

	 Optional<Person> findByEmail(String email);
}
