package com.ProyectoGT.CodeByte.IService.ObjectT;

import java.util.List;
import java.util.Optional;

import com.ProyectoGT.CodeByte.DTO.IUserDTO;



public interface IObjectTService<T> {
	
	public List <T> all();
	public Optional<T> findById (Long id);
	public T save (T objeto);
	public void update (Long id, T objeto) throws Exception;
	public void delete (Long id);
	public List<T> findByStatusTrue();
	Optional<IUserDTO> userDTO(Long id);
	
	
}
