package com.devsuperior.dslearnbds.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tb_lesson")
/*A anotação @Inheritance é usada em frameworks de persistência, como o Java Persistence API (JPA), para 
 definir a estratégia de herança a ser usada em uma hierarquia de classes.*/
/*A anotação @Inheritance com a estratégia InheritanceType.JOINED é usada para definir a herança entre 
classes em um contexto de persistência. Com essa estratégia, cada subclasse tem sua própria tabela no banco 
de dados, enquanto a tabela da classe pai contém apenas as colunas compartilhadas por todas as subclasses. 
Isso permite uma modelagem flexível, onde cada classe pode ter suas colunas específicas na tabela 
correspondente.*/
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class Lesson  implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String title;
	private Integer position; 
	
	@ManyToOne
	@JoinColumn(name = "section_id")
	private Section section;
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "tb_lesson_done", 
	joinColumns = @JoinColumn(name = "lesson_id"), 
	inverseJoinColumns = {
			@JoinColumn(name = "user_id"),
			@JoinColumn(name = "offer_id")
	})
	private Set<Enrollment> enrollmentsDone = new HashSet<>();
	
	@OneToMany(mappedBy = "lesson")
	private List<Deliver> deliveries = new ArrayList<>(); 
		
	public Lesson() {
		
	}

	public Lesson(Long id, String title, Integer position, Section section) {
		super();
		this.id = id;
		this.title = title;
		this.position = position;
		this.section = section;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getPosition() {
		return position;
	}

	public void setPosition(Integer position) {
		this.position = position;
	}

	public Section getSection() {
		return section;
	}

	public void setSection(Section section) {
		this.section = section;
	}

	public Set<Enrollment> getEnrollmentsDone() {
		return enrollmentsDone;
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
		Lesson other = (Lesson) obj;
		return Objects.equals(id, other.id);
	}

}
