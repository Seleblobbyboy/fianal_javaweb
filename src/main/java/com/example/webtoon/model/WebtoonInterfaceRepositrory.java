package com.example.webtoon.model;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface WebtoonInterfaceRepositrory extends CrudRepository<Cartoon,Integer>{
	List<Cartoon> findByNameCartoonContainingIgnoreCase(String nameCartoon);
}
