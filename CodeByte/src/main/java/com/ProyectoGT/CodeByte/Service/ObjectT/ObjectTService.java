package com.ProyectoGT.CodeByte.Service.ObjectT;

import java.beans.PropertyDescriptor;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ProyectoGT.CodeByte.DTO.IUserDTO;
import com.ProyectoGT.CodeByte.Entity.Security.Person;
import com.ProyectoGT.CodeByte.IRepository.ObjectT.IObjectTRepository;
import com.ProyectoGT.CodeByte.IRepository.Security.IPersonRepository;
import com.ProyectoGT.CodeByte.IService.ObjectT.IObjectTService;
import com.ProyectoGT.CodeByte.Utils.GlobalConstants;

@Service
public abstract class ObjectTService<T> implements IObjectTService<T> {
	
    @Autowired
    public IPersonRepository loginRepository;

    @Autowired 
    private IObjectTRepository<T> repository;

    @Override
    public List<T> all() {
        return repository.findAll();
    }

    @Override
    public Optional<T> findById(Long id) {
        return repository.findById(id);
    }

    @Override
    public T save(T objeto) {
        return repository.save(objeto);
    }
    
    @Override
	public Optional<IUserDTO> userDTO(Long id) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

    @Override
    public void update(Long id, T objeto) throws Exception {
        Optional<T> optionalObjeto = this.repository.findById(id);

        if (optionalObjeto.isEmpty()) {
            throw new NoSuchElementException("No se encontró registro");
        }

        T objetoToUpdate = optionalObjeto.get();

        // Actualiza solo las propiedades no nulas
        updateFields(objeto, objetoToUpdate);

        this.repository.save(objetoToUpdate);
    }

    private void updateFields(T source, T target) {
        BeanWrapper src = new BeanWrapperImpl(source);
        BeanWrapper trg = new BeanWrapperImpl(target);

        for (PropertyDescriptor pd : src.getPropertyDescriptors()) {
            String propertyName = pd.getName();
            // Ignora propiedades no deseadas
            if ("class".equals(propertyName)) {
                continue;
            }

            Object newValue = src.getPropertyValue(propertyName);
            if (newValue != null) {
                trg.setPropertyValue(propertyName, newValue);
            }
        }
    }

    @Override
    public void delete(Long id) {
        repository.deleteById(id);
    }

    @Override
    public List<T> findByStatusTrue() {
        return repository.findByStatusTrue();
    }
}