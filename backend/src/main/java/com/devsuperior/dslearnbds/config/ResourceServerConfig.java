package com.devsuperior.dslearnbds.config;


import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.ResourceServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.store.JwtTokenStore;


/*A classe ResourceServerConfigurerAdapter do Spring Security simplifica a configuração do servidor de recursos em uma 
aplicação Spring Boot. Ela oferece métodos convenientes para personalizar a segurança do servidor de recursos e proteger 
os endpoints da API. Ao estender essa classe e anotá-la com @Configuration, é possível sobrescrever os métodos para definir 
as configurações desejadas de forma fácil e flexível. Isso permite que você defina regras de autorização, configure a 
autenticação, gerencie os recursos protegidos e muito mais, adaptando o servidor de recursos às necessidades específicas 
da sua aplicação.*/
@Configuration
@EnableResourceServer
/*A anotação @EnableResourceServer do Spring Security configura a aplicação Spring Boot para atuar como um servidor 
de recursos OAuth2. Com essa anotação em uma classe de configuração, o Spring Security automaticamente valida e 
processa tokens de acesso, protegendo os recursos da aplicação.*/
public class ResourceServerConfig  extends ResourceServerConfigurerAdapter{
	
	@Autowired
	private Environment env;
	
	@Autowired
	private JwtTokenStore tokenStore;
	
	private static final String[] PUBLIC = {"/oauth/token", "/h2-console/**"};

		
	/*configure(ResourceServerSecurityConfigurer resources): Permite configurar aspectos específicos do servidor de recursos, 
	como o gerenciador de recursos e o token de acesso. Você pode definir o formato do token, configurar validação de token, 
	configurar manipuladores de exceção personalizados, entre outros.*/
	@Override
	public void configure(ResourceServerSecurityConfigurer resources) throws Exception {
		resources.tokenStore(tokenStore);
	}

	/*configure(HttpSecurity http): Permite configurar a segurança HTTP para os endpoints da API. Você pode definir as regras 
	 de autorização, exigir autenticação, configurar CORS (Cross-Origin Resource Sharing), entre outras configurações 
	 relacionadas à segurança.*/
	@Override
	public void configure(HttpSecurity http) throws Exception {
		
	   if (Arrays.asList( env.getActiveProfiles()).contains("test")) {
			http.headers().frameOptions().disable();
		}
		
		
		http.authorizeRequests()
		/* Permite acesso público a URLs definidas na lista PUBLIC.*/
		.antMatchers(PUBLIC).permitAll()
		.anyRequest().authenticated();	
	}
	
	

}
