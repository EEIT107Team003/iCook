package com.web.icook.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.icook.model.CollectiontBean;
import com.web.icook.service.CollectionService;

@Controller
public class CollectController {
	@Autowired
	CollectionService service;

	@Autowired
	ServletContext context;

//========================================================================================================
//========================================================================================================

	// 查全部
	@RequestMapping(value = "/collections")
	public String ProductForm(Model model) {
		List<CollectiontBean> list = service.getAllCollections();
		model.addAttribute("collections", list);
		return "collections";
	}
	

	@RequestMapping("/collection/delete")
	public String deleteCollectiontById(@RequestParam("id") Integer id, Model model) {
		System.out.println("=================deleteCollectiontById    Start========================");
		System.out.println("Controller :"+model +" ，id :"+id );
		service.deleteCollection(id);
		System.out.println("Cotroeller : "+id);
		System.out.println("=================deleteCollectiontById    Finish========================");
		return "redirect:/collections";
	}

	


}
