package com.devsuperior.dslearnbds.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devsuperior.dslearnbds.entities.Role;

//Não é obrigatório
public interface RoleRepository extends JpaRepository<Role, Long> {

}
