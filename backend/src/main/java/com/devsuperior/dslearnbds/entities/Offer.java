package com.devsuperior.dslearnbds.entities;

import java.io.Serializable;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name = "tb_offer")
public class Offer implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String edition;
	@Column(columnDefinition = "TIMESTAMP WITHOUT TIME ZONE")
	private Instant startMoment;
	@Column(columnDefinition = "TIMESTAMP WITHOUT TIME ZONE")
	private Instant endMoment;
	
	/*No Spring, um relacionamento Many-to-One é um tipo de associação onde várias entidades 
	 de uma classe estão relacionadas a uma única entidade de outra classe. Em termos de banco de 
	 dados, isso geralmente é implementado por meio de uma chave estrangeira em uma tabela, 
	 que referencia a tabela pai.*/
	@ManyToOne
	/*Geralmente, a chave estrangeira é mapeada usando a anotação @JoinColumn. Você pode 
	 adicionar essa anotação na propriedade anotada com @ManyToOne para especificar o nome 
	 da coluna que será usada como chave estrangeira na tabela do banco de dados.*/
	@JoinColumn(name = "course_id")
	private Course course;
	
	@OneToMany(mappedBy = "offer")
	private List<Resource> resources = new ArrayList<>();
	
	@OneToMany(mappedBy = "offer")
	private List<Topic> topics = new ArrayList<>();
	
	
	public Offer() {
		
	}

	public Offer(Long id, String edition, Instant startMoment, Instant endMoment, Course course) {
		super();
		this.id = id;
		this.edition = edition;
		this.startMoment = startMoment;
		this.endMoment = endMoment;
		this.course = course;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getEdition() {
		return edition;
	}


	public void setEdition(String edition) {
		this.edition = edition;
	}


	public Instant getStartMoment() {
		return startMoment;
	}


	public void setStartMoment(Instant startMoment) {
		this.startMoment = startMoment;
	}


	public Instant getEndMoment() {
		return endMoment;
	}


	public void setEndMoment(Instant endMoment) {
		this.endMoment = endMoment;
	}


	public Course getCourse() {
		return course;
	}


	public void setCourse(Course course) {
		this.course = course;
	}

	public List<Resource> getResources() {
		return resources;
	}

	public List<Topic> getTopics() {
		return topics;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Offer other = (Offer) obj;
		return Objects.equals(id, other.id);
	}

}
