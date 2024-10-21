package com.ProyectoGT.CodeByte.IService.Security;

import java.util.Optional;

import com.ProyectoGT.CodeByte.DTO.IUserDTO;
import com.ProyectoGT.CodeByte.Entity.Security.User;
import com.ProyectoGT.CodeByte.IService.ObjectT.IObjectTService;

import java.util.List;

public interface IUserService extends IObjectTService<User>{
	
	Optional<IUserDTO> getUserDTO(Long id);

	public User saveUsuarioJwt(User usuario) throws Exception;

	Integer validarDatosPersonalesPersona(Integer usuarioId);

	Optional<User> findByUserName(String userName);
}
