package com.ProyectoGT.CodeByte.IRepository.Security;

import com.ProyectoGT.CodeByte.Entity.Security.Role;
import com.ProyectoGT.CodeByte.IRepository.ObjectT.IObjectTRepository;

public interface IRolRepository extends IObjectTRepository<Role>{

	 Role findByName(String name);
	
}
