package com.example.webtoon.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.webtoon.model.Cartoon;

import com.example.webtoon.model.Comment;
import com.example.webtoon.model.CommentInterfaceRepositrory;
import com.example.webtoon.model.WebtoonInterfaceRepositrory;
import java.util.Date;
import org.springframework.transaction.annotation.Transactional;
import com.example.webtoon.controller.ThaiDateConverter;




@Controller
public class CartoonController {
	
	@Autowired
	WebtoonInterfaceRepositrory repo;
	
	@Autowired
	CommentInterfaceRepositrory Commentrepo;
	
	@GetMapping("/s")
	public String CartoonAll(Model model) {
		Iterable<Cartoon> Cartoons = repo.findAll();
		model.addAttribute("Cartoons",Cartoons);
		return "home";
	}
	
	@GetMapping("/Cartoon/detail/{id}")
	public String detailStudent(@PathVariable int id,Model model) {
		Optional<Cartoon> Cartoons =  repo.findById(id);
		Iterable<Comment> Comment =  Commentrepo.findAll();
		if(Cartoons.isPresent()) {
			model.addAttribute("Cartoons", Cartoons.get());
			model.addAttribute("Comments", Comment);
		}
		else {
			Cartoon unknoewStudent = new Cartoon();
			unknoewStudent.setId(0);
			unknoewStudent.setNameCartoon(null);
			unknoewStudent.setLove(0);
			unknoewStudent.setDetail(null);
			unknoewStudent.setDate(null);
			model.addAttribute("students", unknoewStudent);
		}
		
		return "detail";
	}
	
	
	
	@PostMapping("/add-comment")
	public String addComment(@ModelAttribute("comment") Comment comment,@RequestParam int cartoonID,Model model) {
		Cartoon cartoon = repo.findById(cartoonID).get();
		comment.setCratoon(cartoon);
		Commentrepo.save(comment);
		return "redirect:/Cartoon/detail/"+cartoonID;
	}
	
	
	@GetMapping("/searchCartoon")
	public String searchForum(@RequestParam("keyword") String keyword, Model model) {
	    List<Cartoon> searchResults;
	    
	    if (keyword == null || keyword.trim().isEmpty()) {
	        searchResults = (List<Cartoon>) repo.findAll();
	    } else {
	
	        searchResults = repo.findByNameCartoonContainingIgnoreCase(keyword);
	    }
	    
	    model.addAttribute("Cartoons", searchResults);
	    return "home";
	}
	
	@GetMapping("/add/love/{id}")
	public String Addlove(@PathVariable int id,Model model) {
		Cartoon Cartoon = repo.findById(id).orElse(null);
		if (Cartoon != null) {
			Cartoon.setLove(Cartoon.getLove() + 1);
			repo.save(Cartoon);
		}
		return "redirect:/s";
	}
	
	@GetMapping("/updat/{id}")
	public String addGrade(@PathVariable int id,Model model) {
		Optional<Cartoon> Cartoons =  repo.findById(id);
		model.addAttribute("Cartoons", Cartoons.get());
		return "edit";
	}
	@GetMapping("/add/cartoon")
	public String addGrade() {
		
		return "addcartoon";
	}
	
	@PostMapping("/update-cartoon")
	public String updateStudent(@ModelAttribute("cartoon") Cartoon cartoon) {
		Date d = new Date();
		cartoon.setDate(d); 
		repo.save(cartoon); 
		return "redirect:/s";
	}
	
	@PostMapping("/inseart-cartoon")
	public String inseartCartoon(@ModelAttribute("cartoon") Cartoon cartoon) {
		Date d = new Date();
		cartoon.setDate(d);
		cartoon.setLove(0);  // กำหนดจำนวนไลค์เริ่มต้นเป็น 0
		repo.save(cartoon); 
		return "redirect:/s";
	}
	
	@GetMapping("/delete/{id}")
	public String Delet(@PathVariable int id) {
    // ลบ Cartoon ตาม id
	    repo.deleteById(id);
	    return "redirect:/s";
	}



	
	

	
}
