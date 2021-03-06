package tw.iiihealth.elder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tw.iiihealth.elder.model.Equip;
import tw.iiihealth.elder.model.EquipService;

@Controller
@RequestMapping(path="/consumer")
public class EquipConsumerController {

	
	
	@Autowired
	EquipService equipService;
	
	// 到使用者商品頁面
	@RequestMapping(path="/toTheFrontPage")
	public ModelAndView  toTheFrontPage() {
		ModelAndView  mAndView = new ModelAndView();
		
		
		// 查詢熱門商品並顯示在Modal上
		String hot = "Y";
		List<Equip> list= equipService.findByHot(hot);
		
		mAndView.addObject("list", list);
		mAndView.setViewName("equipsell/all-equip-page");
		
		return mAndView;
	}
	
	

	// Ajax請求商品內容
	@PostMapping(path="/findallforConsumerByPage/{pageNo}")
	@ResponseBody
	public List<Equip> findallforConsumerByPage(@PathVariable("pageNo") int pageNo, Model m){
		
		// 每頁幾筆
		int pageSize = 8;
				
		// 要查詢幾頁 (因為是從0算起，所以要減掉1)， 每頁幾筆
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
			
		// 開始查詢
		Page<Equip> page = equipService.findAllByPage(pageable);
		
		return page.getContent();
	}
	
	
	
	
	// 向使用者顯示單項商品
	@GetMapping(path="/findByIdforCustomer/{eId}")
	public String findByIdForCustomer(@PathVariable("eId") int eid, Model model) {
		Equip equip = equipService.findById(eid);
		model.addAttribute("equip", equip);
		return "equipsell/equip-detail-page";
	}
	
	
	
	// Ajax請求商品內容(依商品種類)
	@PostMapping(path="/findSortforConsumerByPage/{type}/{pageNo}")
	@ResponseBody
	public List<Equip> findSortforConsumerByPage(@PathVariable("type") String type, @PathVariable("pageNo") int pageNo){
		
		// 每頁幾筆
		int pageSize = 8;
				
		// 要查詢幾頁 (因為是從0算起，所以要減掉1)， 每頁幾筆
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
			
		// 開始查詢
		Page<Equip> page = equipService.findSortByPage(type, pageable);
		

		return page.getContent();
	}
	
	
	// Ajax請求商品內容(價格低到高)
	@PostMapping(path="/ascend/{pageNo}")
	@ResponseBody
	public List<Equip> ascend( @PathVariable("pageNo") int pageNo){
		
		// 每頁幾筆
		int pageSize = 8;
				
		// 要查詢幾頁 (因為是從0算起，所以要減掉1)， 每頁幾筆
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
			
		// 開始查詢
		Page<Equip> page = equipService.findAscendByPage(pageable);
		

		return page.getContent();
	}
	
	
	// Ajax請求商品內容(價格高到低)
	@PostMapping(path="/descend/{pageNo}")
	@ResponseBody
	public List<Equip> descend(@PathVariable("pageNo") int pageNo){
		
		// 每頁幾筆
		int pageSize = 8;
				
		// 要查詢幾頁 (因為是從0算起，所以要減掉1)， 每頁幾筆
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
			
		// 開始查詢
		Page<Equip> page = equipService.findDescendByPage(pageable);
		
		return page.getContent();
	}
	
	
	
	// Ajax請求商品內容(熱門)
	@PostMapping(path="/hot/{pageNo}")
	@ResponseBody
	public List<Equip> hot(@PathVariable("pageNo") int pageNo){
		
		// 熱門產品
		String hot = "Y";
		
		// 每頁幾筆
		int pageSize = 8;
				
		// 要查詢幾頁 (因為是從0算起，所以要減掉1)， 每頁幾筆
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
			
		// 開始查詢
		Page<Equip> page = equipService.findHotByPage(hot, pageable);
		
		return page.getContent();
	}

}
