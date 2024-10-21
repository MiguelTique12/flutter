package com.ProyectoGT.CodeByte.Service.Security;

import java.util.Optional;

import com.ProyectoGT.CodeByte.IRepository.Security.IUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ProyectoGT.CodeByte.DTO.IUserDTO;
import com.ProyectoGT.CodeByte.Entity.Security.User;
import com.ProyectoGT.CodeByte.IService.Security.IUserService;
import com.ProyectoGT.CodeByte.Service.ObjectT.ObjectTService;

@Service
public class UserService extends ObjectTService<User> implements IUserService {

	private final BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private IUserRepository userRepository;

    public UserService(BCryptPasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    @Override
	public Optional<IUserDTO> getUserDTO(Long id) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

	@Override
	public User saveUsuarioJwt(User usuario) throws Exception {
		String encodedPassword = passwordEncoder.encode(usuario.getContrasenia());
		usuario.setContrasenia(encodedPassword);
		return userRepository.save(usuario);
	}

	@Override
	public Integer validarDatosPersonalesPersona(Integer usuarioId) {
		return userRepository.validarDatosPersonalesPersona(usuarioId);
	}

	@Override
	public Optional<User> findByUserName(String userName) {
		return userRepository.findByUserName(userName);
	}

	public boolean existsByUserName(String userName) {
	    return userRepository.findByUserName(userName).isPresent();
	}

}
