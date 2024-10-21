package com.ProyectoGT.CodeByte.Service.Security;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ProyectoGT.CodeByte.Entity.Security.Role;
import com.ProyectoGT.CodeByte.IRepository.Security.IRolRepository;
import com.ProyectoGT.CodeByte.Service.ObjectT.ObjectTService;

@Service
public class RolService extends ObjectTService<Role>{

	@Autowired
    private IRolRepository roleRepository;

    public Role findByName(String name) {
        return roleRepository.findByName(name);
    }
}
