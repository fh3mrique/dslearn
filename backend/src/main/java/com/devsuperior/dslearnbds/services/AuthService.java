package com.devsuperior.dslearnbds.services;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.devsuperior.dslearnbds.entities.User;
import com.devsuperior.dslearnbds.repositories.UserRepository;
import com.devsuperior.dslearnbds.services.exceptions.ForbiddenException;
import com.devsuperior.dslearnbds.services.exceptions.UnauthorizedException;

@Service
public class AuthService {

	@Autowired
	private UserRepository userRepository;

	@Transactional(readOnly = true)
	public User authenticated() {

		try {
			/*
			 SecurityContextHolder.getContext() obtém o contexto de segurança atual da
			 aplicação, geralmente usado em sistemas que empregam frameworks de segurança,
			 como o Spring Security, para gerenciar autenticação e autorização de
			 usuários.
			  
			 getAuthentication() recupera as informações de autenticação do contexto de
			 segurança, incluindo detalhes sobre o usuário autenticado, como seu nome de
			 usuário, funções (roles) e outras informações relacionadas à autenticação.
			  
			 getName() obtém o nome de usuário associado à autenticação atual, que é um
			 identificador exclusivo para o usuário autenticado e é comumente usado para
			 identificar e autorizar o usuário em várias partes da aplicação.*/
			String username = SecurityContextHolder.getContext().getAuthentication().getName();
			return userRepository.findByEmail(username);
		} 
		catch (Exception e) {
			throw new UnauthorizedException("Invalid user");
		}

	}
	
	public void validateSelfOrAdmin(Long userId) {
		User user = authenticated();
		if (!user.getId().equals(userId) && !user.hasHole("ROLE_ADMIN")) {
			throw new ForbiddenException("Acess danied");
		}
	}
	
	

}
