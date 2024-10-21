package com.ProyectoGT.CodeByte.IRepository.ObjectT;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface IObjectTRepository<T> extends JpaRepository<T, Long> {

    List<T> findByStatusTrue();
    
}

