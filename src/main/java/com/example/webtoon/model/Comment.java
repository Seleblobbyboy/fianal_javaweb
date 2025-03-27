package com.example.webtoon.model;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Comment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String name; 
	private String text;
	@ManyToOne
    @JoinColumn(name = "Cartoon_id") 
    private Cartoon cratoon;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Cartoon getCratoon() {
		return cratoon;
	}
	public void setCratoon(Cartoon cratoon) {
		this.cratoon = cratoon;
	}
	
	
}
