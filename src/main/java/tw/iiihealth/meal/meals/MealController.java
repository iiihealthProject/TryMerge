package tw.iiihealth.meal.meals;

import java.io.File;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.iiihealth.elder.model.Equip;

@RequestMapping(path = "meals")
@Controller("MealController")
public class MealController {

	@Autowired
	private MealService mealService;

	@RequestMapping(path = "/mealIndex.controller",method = { RequestMethod.POST, RequestMethod.GET })
	public String processShowIndex(HttpServletRequest request,Model m) throws SQLException  {
		
		ArrayList<MealBean> mb = mealService.findAllMeals();
		
		request.getSession().setAttribute("queryAll", mb);
		
		return "meal/Meals/Meals";
	}

	@RequestMapping(path = "/mealCreate.controller", method = RequestMethod.GET)
	public String processShowForm(Model m) {
		return "meal/Meals/MealForm";
	}
	
	@RequestMapping(path = "/mealUpdate.controller", method = RequestMethod.GET)
	public String processShowUpdate(Model m) {
		return "meal/Meals/UpdateMeal";
	}

	@RequestMapping(path = "/mealDelete.controller", method = RequestMethod.GET)
	public String processShowDelete(Model m) {
		return "meal/Meals/DeleteMeal";
	}

	//新增餐點
	@RequestMapping(path = "/addMeals.controller", method = RequestMethod.POST)
	public ModelAndView processFormAction(@RequestParam(name = "name") String name,@ModelAttribute(name = "Mealform") MealBean meal2
										 ,@RequestParam("pic") MultipartFile multipartFile,HttpServletRequest request) throws Exception {

		if (mealService.findMeal(name) != null) {
			return new ModelAndView("forward:/WEB-INF/pages/meal/Meals/existfail.jsp");
		}else {
			if (multipartFile!= null && !multipartFile.isEmpty()) {
				
				// 抓取檔案名稱
				String fileName = multipartFile.getOriginalFilename();
				
				String suffixName = fileName.substring(fileName.lastIndexOf("."));
				
				//生成檔名稱通用方法(加入現在的時間以及亂數100)
		        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
		        Random r = new Random();
		        StringBuilder tempName = new StringBuilder();
		        tempName.append(sdf.format(new Date())).append(r.nextInt(100)).append(suffixName);
				
				String saveName = tempName.toString();
				
				// 設定檔案路徑
				String saveDir  = request.getSession().getServletContext().getRealPath("/") + "MealImg\\";
				
				// 創建目的資料夾
				File saveDirFile = new File(saveDir);
				saveDirFile.mkdirs();
				
				// 最終檔案路徑
				String saveFilePath = saveDir + File.separator+ saveName;
				File saveFile = new File(saveFilePath);
				
				
				// 儲存圖片
				multipartFile.transferTo(saveFile);
			
				// 將檔名存入equip
				meal2.setPhoto(saveName);

			}
			mealService.insert(meal2);
			return new ModelAndView("forward:/meals/mealView.controller");
		}

	}
	
	// 管理者儲存
	@PostMapping(path="save")
	public ModelAndView saveById(@ModelAttribute("Mealform") MealBean meal2, 
						   @RequestParam("pic") MultipartFile multipartFile,
						   HttpServletRequest request) throws Exception{
		
		
		
		if (multipartFile!= null && !multipartFile.isEmpty()) {
			
			// 抓取檔案名稱
			String fileName = multipartFile.getOriginalFilename();
			
			String suffixName = fileName.substring(fileName.lastIndexOf("."));
			
			//生成檔名稱通用方法(加入現在的時間以及亂數100)
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
	        Random r = new Random();
	        StringBuilder tempName = new StringBuilder();
	        tempName.append(sdf.format(new Date())).append(r.nextInt(100)).append(suffixName);
			
			String saveName = tempName.toString();
			
			// 設定檔案路徑
			String saveDir  = request.getSession().getServletContext().getRealPath("/") + "MealImg\\";
			
			// 創建目的資料夾
			File saveDirFile = new File(saveDir);
			saveDirFile.mkdirs();
			
			// 最終檔案路徑
			String saveFilePath = saveDir + File.separator+ saveName;
			File saveFile = new File(saveFilePath);
			
			
			// 儲存圖片
			multipartFile.transferTo(saveFile);
		
			// 將檔名存入equip
			meal2.setPhoto(saveName);

		}
		
		mealService.save(meal2);
		
		
		return new ModelAndView("forward:/meals/mealView.controller");
	}

	//查詢菜單
	@RequestMapping(path="/mealView.controller",method = { RequestMethod.POST, RequestMethod.GET })
	public String processQueryAll(HttpServletRequest request,Model m) throws SQLException {

		ArrayList<MealBean> mb = mealService.findAllMeals();
		
		request.getSession().setAttribute("queryAll", mb);
		
		return "meal/Meals/ViewMenu";
	}
	
	// 刪除餐點
	@RequestMapping(path = "/deleteByName.controller", method = RequestMethod.POST)
	public String deleteByName(@RequestParam(name = "name") String name,HttpServletRequest request, Model m) throws SQLException {

		if (mealService.findMeal(name) != null) {
			MealBean mb = mealService.findMeal(name);
			request.getSession().setAttribute("m", mb);
			return "meal/Meals/DisplayDeleteMeal";
		}else {
			return "meal/Meals/notexistfail";
		}
	}

	// 確認刪除
	@RequestMapping(path = "/deleteConfirm.controller", method = RequestMethod.POST)
	public ModelAndView deleteConfirm(@RequestParam(name = "selected") int mId) {

	    mealService.delete(mId);
		
		return new ModelAndView("forward:/meals/mealView.controller");
	}
	

	// 修改餐點
	@RequestMapping(path = "/updateByName.controller", method = RequestMethod.POST)
	public String updateByName(@RequestParam(name = "name") String name,HttpServletRequest request, Model m) throws SQLException {

		if (mealService.findMeal(name) != null) {
			MealBean mb = mealService.findMeal(name);
			request.getSession().setAttribute("u", mb);
	    	request.getSession(true).setAttribute("un",mb.getName());
	    	request.getSession(true).setAttribute("us",mb.getStore_ID());
			return "meal/Meals/DisplayUpdateMeal";
		}else {
			return "meal/Meals/notexistfail";
		}
	}
	
	// 確認修改
	@RequestMapping(path = "/updateConfirm.controller", method = RequestMethod.POST)
	public ModelAndView updateConfirm(@ModelAttribute(name = "DisplayUpdateMeal") MealBean meal2
									 ,@RequestParam("pic") MultipartFile multipartFile,
									  HttpServletRequest request) throws Exception {
		
		if (multipartFile!= null && !multipartFile.isEmpty()) {
			
			// 抓取檔案名稱
			String fileName = multipartFile.getOriginalFilename();
			
			String suffixName = fileName.substring(fileName.lastIndexOf("."));
			
			//生成檔名稱通用方法(加入現在的時間以及亂數100)
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
	        Random r = new Random();
	        StringBuilder tempName = new StringBuilder();
	        tempName.append(sdf.format(new Date())).append(r.nextInt(100)).append(suffixName);
			
			String saveName = tempName.toString();
			
			// 設定檔案路徑
			String saveDir  = request.getSession().getServletContext().getRealPath("/") + "MealImg\\";
			
			// 創建目的資料夾
			File saveDirFile = new File(saveDir);
			saveDirFile.mkdirs();
			
			// 最終檔案路徑
			String saveFilePath = saveDir + File.separator+ saveName;
			File saveFile = new File(saveFilePath);
			
			
			// 儲存圖片
			multipartFile.transferTo(saveFile);
		
			// 將檔名存入equip
			meal2.setPhoto(saveName);

		}
		String name = (String) request.getSession(true).getAttribute("un");
		int store_ID =(int) request.getSession(true).getAttribute("us");
		meal2.setName(name);
		meal2.setStore_ID(store_ID);
		meal2.setID(mealService.findMeal(name).getID());
		
	    mealService.update(meal2);
		
	    return new ModelAndView("forward:/meals/mealView.controller");
	}

}
