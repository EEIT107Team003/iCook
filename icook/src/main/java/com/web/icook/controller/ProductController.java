package com.web.icook.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.web.icook.model.CategoriesBean;
import com.web.icook.model.CategoryBean;
import com.web.icook.model.MemberBean;
import com.web.icook.model.ProductBean;
import com.web.icook.service.MemberService;
import com.web.icook.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	ProductService service;

	@Autowired
	ServletContext context;
	
	
	@RequestMapping(value = "/product_Test")
	public String producttest(Model model) {
		List<ProductBean> list = service.getAllProducts();
		model.addAttribute("products", list);
		return "products/test";
	}
	
	@Autowired
	MemberController mcontroller;

	@Autowired
	MemberService mservice;
	
	@RequestMapping(value = "/MultiplePicture", method = RequestMethod.GET)
	public List<ProductBean> MultiplePicture() {
		System.out.println("==========MultiplePicture=============");
		return null;
	}
	

	@ResponseBody
	@RequestMapping(value = "/SelectByCategoriesAndDescriptionForProduct/{txt}", method = RequestMethod.GET)
	public List<ProductBean> SelectByCategoriesAndDescriptionForProduct(@PathVariable String txt) {
		System.out.println("======SelectByCategoriesAndDescriptionForProduct IN==============");
		System.out.println("txt: "+txt);	
		String fileName = txt;// Categories.name AjAX後端抓不到 硬塞一個String去接
		String remark = service.getOneCategory(txt).get(0).getCategorybean().getName();// Category.name AjAX後端抓不到 硬塞一個String去接
		String description="";
//        System.out.println("remark : "+remark);
		//		String description = searchBean.getDescription().trim();
//		if (searchBean.getStock() == null) {
//			searchBean.setStock(1);
//		}
//		int stock = searchBean.getStock();
//		System.out.println("pageValue :" + stock);
//		System.out.println("remark :" + remark + "fileName :" + fileName + "，description :" + description);
		List<ProductBean> list = service.SelectByCategoriesAndDescriptionForPage(remark, fileName, description);
		for(ProductBean bb :list) {
			System.out.println("id :"+bb.getProduct_id()
			+"  description :"+bb.getDescription() +"Name"+bb.getRemark());
		}
		System.out.println("======SelectByCategoriesAndDescriptionForProduct OUT==============");
		return list;
	}

	@RequestMapping(value = "/productsEx", method = RequestMethod.GET, produces = "application/vnd.ms-excel")
	public String AllProductsExcel(Model model) {
		System.out.println("========Excel IN===========");
		List<ProductBean> list = service.getAllProducts();
		for(ProductBean vv : list) {
			System.out.println("vv :"+vv.getName());
		}
		System.out.println("list:" + list);
		model.addAttribute("allProducts", list);
		System.out.println("========Excel OUT===========");
		return "products/allProducts";
	}

	@RequestMapping(value = "/productsByCategoryEx", method = RequestMethod.GET, produces = "application/vnd.ms-excel")
	public String ProductsByCategoryExcel(HttpServletRequest request, HttpServletResponse resopnse, Model model) {
		System.out.println("========productsByCategoryEx IN===========");
		String remark = request.getParameter("remark");
		String fileName = request.getParameter("fileName");
		String description = request.getParameter("description");
		List<ProductBean> list = service.SelectByCategoriesAndDescriptionForPage(remark, fileName, description);
		model.addAttribute("productsByCategory", list);
		System.out.println("========productsByCategoryEx OUT===========");
		return "products/productsByCategory";
	}

	// ========================================================================================================
	// ========================================================================================================

	@RequestMapping(value = "/category/{txt}", method = RequestMethod.GET)
	@ResponseBody
	public List<CategoriesBean> getOneCategory(@PathVariable String txt) {
		System.out.println("======category IN==============");
		System.out.println("category name :" + txt);
//	    	String nvrsjson = JSONArray.toJSONString(bean);
		List<CategoriesBean> list = service.getOneCategory(txt);
		for (CategoriesBean bb : list) {
//			System.out.println("name : "+bb.getCategorybean().getName());
		}
		System.out.println("======category OUT=============");
		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/ForPage", method = RequestMethod.POST)
	public List<ProductBean> ForPage(@RequestBody ProductBean searchBean, HttpServletRequest request,
			HttpServletResponse resopnse) {
		System.out.println("======ForPageController IN==============");
		String fileName = searchBean.getFileName().trim();// Categories.name AjAX後端抓不到 硬塞一個String去接
		String remark = searchBean.getRemark().trim();// Category.name AjAX後端抓不到 硬塞一個String去接
		String description = searchBean.getDescription().trim();
		System.out.println("remark :" + remark + "fileName :" + fileName + "，description :" + description);
		List<ProductBean> list = service.SelectByCategoriesAndDescriptionForPage(remark, fileName, description);
//		for(ProductBean bb :list) {
//			System.out.println("id :"+bb.getProduct_id()
//			+"  description :"+bb.getDescription() +"Name"+bb.getRemark());
//		}
		System.out.println("======ForPageController OUT==============");
		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/SelectByCategoriesAndDescription", method = RequestMethod.POST)
	public List<ProductBean> SelectByCategoriesAndDescription(@RequestBody ProductBean searchBean) {
		System.out.println("======SelectByCategoriesAndDescription IN==============");
//		System.out.println("Page: "+request.getParameter("pagebut"));	
		String fileName = searchBean.getFileName().trim();// Categories.name AjAX後端抓不到 硬塞一個String去接
		String remark = searchBean.getRemark().trim();// Category.name AjAX後端抓不到 硬塞一個String去接
		String description = searchBean.getDescription().trim();
		if (searchBean.getStock() == null) {
			searchBean.setStock(1);
		}
		int stock = searchBean.getStock();
		System.out.println("pageValue :" + stock);
		System.out.println("remark :" + remark + "fileName :" + fileName + "，description :" + description);
		List<ProductBean> list = service.SelectByCategoriesAndDescription(remark, fileName, description, stock);
//		for(ProductBean bb :list2) {
//			System.out.println("id :"+bb.getProduct_id()
//			+"  description :"+bb.getDescription() +"Name"+bb.getRemark());
//		}
		System.out.println("======SelectByCategoriesAndDescription OUT==============");
		return list;
	}

//	@ResponseBody
//	@RequestMapping(value = "/SelectByCategories/{txt}", method = RequestMethod.GET)
//	public List<ProductBean> SelectByCategories( @PathVariable String txt,Model model) {
//		System.out.println("======SelectByCategories IN==============");
//		System.out.println("category name :"+txt);
//		List<ProductBean> list=service.gteAllProductByCategories(txt);
//		for(ProductBean bb : list) {
//			System.out.println("id :"+bb.getProduct_id()+"categories: "+bb.getCategoriesbean().getName());
//		}
//		model.addAttribute("SelectByCategories", list);
//		System.out.println("======SelectByCategories OUT=============");
//		return list;
//	}

	@RequestMapping(value = "/categories/{txt}", method = RequestMethod.GET)
	@ResponseBody
	public List<CategoriesBean> categoriesSelect(@PathVariable String txt) {
		System.out.println("======categoriesSelect IN==============");
//		System.out.println("category name :"+txt);
		List<CategoriesBean> list = service.getAllCategories(txt);
//	    	String nvrsjson = JSONArray.toJSONString(bean);
		for (CategoriesBean bb : list) {
//			System.out.println("name : "+bb.getName());
		}
		System.out.println("======categoriesSelect OUT=============");
		return list;
	}

// Category 後臺送到前端 successful
//			,produces = MediaType.APPLICATION_JSON_VALUE ,consumes = MediaType.APPLICATION_JSON_VALUE
	@RequestMapping(value = "/category", method = RequestMethod.POST)
	@ResponseBody
	public List<CategoryBean> categorySelect() {
//		System.out.println("======CategorySelect IN==============");
		List<CategoryBean> bean = service.getAllCategory();
//	    	String nvrsjson = JSONArray.toJSONString(bean);
		for (CategoryBean bb : bean) {
//			System.out.println("name : "+bb.getName());
		}
//		System.out.println("======CategorySelect OUT=============");
		return bean;
	}

	@RequestMapping("/product/addToCollection")
	public String addToCollection(@RequestParam("id") Integer id, Model model) {
		// 暫時用member=5
		int memberId = 2;
		service.addtoCollection(id, memberId);
//		model.addAttribute("product", bb);
		return "redirect:/products";
	}

	// 查全部
	@RequestMapping(value = "/products")
	public String ProductForm(Model model) {

		// 要在下頁用EL顯示會員${LoginOK.member_id}需在controller裡面加此行,-----------------------------
		//測試成功
		if (!mcontroller.getPrincipal().equals("anonymousUser")) {
			MemberBean mb = mservice.selectByUsername(mcontroller.getPrincipal());
			model.addAttribute("LoginOK", mb);
		}
		// -----------------------------------------------------------------------
		List<ProductBean> list = service.getAllProducts();
		model.addAttribute("products", list);
		return "products/products";
	}

	// 查單筆
	@RequestMapping("/product")
	public String getProductById(@RequestParam("id") Integer id, Model model) {
		// 要在下頁用EL顯示會員${LoginOK.member_id}需在controller裡面加此行,-----------------------------
		//測試成功
		if (!mcontroller.getPrincipal().equals("anonymousUser")) {
			MemberBean mb = mservice.selectByUsername(mcontroller.getPrincipal());
			model.addAttribute("LoginOK", mb);
		}
		// -----------------------------------------------------------------------

		ProductBean bb = service.getProductById(id);
		model.addAttribute("product", service.getProductById(id));
		return "products/product";
	}

	@RequestMapping(value = "/getProductPicture/{product_Id}", method = RequestMethod.GET)
//  ResponseEntity代表一個所有回應的東西(狀態列:Status Line、回應標頭  Response Header、 回應本體 Response Body)
//  會直接挑過Dispatcher 直接回應給Browser	。@PathVariable("可省略，但上面大括號內德變數要跟後面的變數一樣")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer product_Id) {
		System.out.println("getProductPicture================");
//             回應本體的資料型態                   
		String filePath = "/resources/images/NoImage.jpg";
//                           設定預設圖路徑
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		ProductBean bean = service.getProductById(product_Id);
		if (bean != null) {
			Blob blob = bean.getImage();
			filename = bean.getFileName();
//            System.out.println("filename  = "+filename);
//            System.out.println("blob  = "+blob);
			if (blob != null) {
				try {
					// blob.lenght---> Long型態
					len = (int) blob.length();
					media = blob.getBytes(1, len); // blob.getBytes(1, len): 是 1 開頭。Jdbc相關的類別都是1 開頭。
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
				// 有Bean但沒有圖檔時設定為預設圖
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
			// 沒有Bean
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		if (mimeType == null)
			mimeType = "image/jpeg";
//		System.out.println("mimeType ="+mimeType);
		MediaType mediaType = MediaType.valueOf(mimeType);
//		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);

		return responseEntity;
	}

//File 路經如果是"/"開頭，會從應用系統跟目錄開始(C://.....)
	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		try {
//			String realPath=context.getRealPath(filepath);
//			File file = new File(realPath);
//			long size = file.length();
//			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
//			fis.read(b);
//        如果要將字元轉成字元陣列可以轉乘Clob物件陣列 :  CharArrayWriter.toCharArray ---> SerialClob(char[]ch)
//         FileOutputStream 寫到硬碟上，ByteArrayOutputStream寫到記憶體，相對速度比較快
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			byte[] tmp = new byte[81920];
			int len = 0;
			while ((len = fis.read(tmp)) != -1) {
				baos.write(tmp, 0, len);
			}
			b = baos.toByteArray();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}

//限定輸入欄位	
	@InitBinder
	public void whiteListing(WebDataBinder binder) {
		binder.setAllowedFields("product_id，", "description", "unit_size", "price", "color", "stock", "productImage");
	}

	@RequestMapping(value = "/products/upd", method = RequestMethod.GET)
	public String updateProduct(Model model, @RequestParam("id") Integer id) {
		System.out.println("update From Start============================================");
		ProductBean bb = new ProductBean();
		bb.setProduct_id(id);
		ProductBean previousbean = service.getProductById(id);
		model.addAttribute("productBeanObject", bb);
		model.addAttribute("previousbean", previousbean);
//		bb.setCategory("鍋子");
//		Map<String, Object> map = model.asMap();
//		Set<String> set = map.keySet();
//		for (String key : set) {
//			System.out.println("Key=" + key);
//			if (key.equals("productBeanObject")) {
//				ProductBean bean = (ProductBean) map.get(key);
//				System.out.println(bean);
//			}
//		}
		System.out.println("update Form Finish============================================");
		return "products/updProduct";
	}

//  此方法是新建表單以及設定表單初始，
	@RequestMapping(value = "/products/add", method = RequestMethod.GET)
	public String getAddNewProductForm(Model model) {
		System.out.println("Init From Start============================================");
		ProductBean bb = new ProductBean();
//		bb.setCategory("鍋子");
		model.addAttribute("productBeanObject", bb);
		Map<String, Object> map = model.asMap();
		Set<String> set = map.keySet();
		for (String key : set) {
			System.out.println("Key=" + key);
			if (key.equals("productBeanObject")) {
				ProductBean bean = (ProductBean) map.get(key);
				System.out.println(bean);
			}
		}
		System.out.println("Init Form Finish============================================");
		return "products/addProduct";
	}

//submit表單
	@RequestMapping(value = { "/products/add", "/products/upd" }, method = RequestMethod.POST)
	public String processAddNewProductForm(@ModelAttribute("productBeanObject") ProductBean bb,
			@RequestParam String product_id, Model model, BindingResult result, HttpServletRequest request)
			throws IOException {
		System.out.println("\nSubmit Form Start============================================");
		String Categoriesname = request.getParameter("fileName");
		String Category = request.getParameter("name");
		String gender = request.getParameter("gender");
		if (gender == null)
			gender = "2";
		if (Category == null || Category.length() == 0)
			Category = "其他";
		if (Categoriesname == null || Categoriesname.length() == 0)
			Categoriesname = "其他";
		System.out.println(gender + "，" + Category + "，" + Categoriesname);
		bb.setName(Category);
		bb.setStatus(Integer.valueOf(gender));
		bb.getCategoriesbean().setName(Categoriesname);
		System.out.println(model.asMap());
		Map<String, Object> map = model.asMap();
		Set<String> set = map.keySet();
		for (String key : set) {
			System.out.println("Key=" + key);
			if (key.equals("productBeanObject")) {
				ProductBean bean = (ProductBean) map.get(key);
				System.out.println(bean + ", ");
			}
		}

		if (bb != null & bb.getStock() == null) {
			bb.setStock(0);
		}
		System.out.println("product_id======================================" + product_id);

		MultipartFile productImage = bb.getProductImage();
		String originalFilename = productImage.getOriginalFilename();
		bb.setFileName(originalFilename);
		String ext = null;
		if (originalFilename != null && !originalFilename.isEmpty())
			ext = originalFilename.substring(originalFilename.lastIndexOf("."));

		// ext :抓檔案副檔名 從" . "以後含點都取

		// -----------------------------------------寫入寫出-----------------------------------------------------------------------
		System.out.println("=====input start");
		InputStream ins = productImage.getInputStream();
		OutputStream ous = new FileOutputStream(
				"C:\\springMVC\\workspace\\icookProject\\src\\main\\webapp\\WEB-INF\\views\\images\\pictures"
						+ originalFilename + ext);
		int lenght = -1;
		byte[] tmp = new byte[81920];

		while ((lenght = ins.read(tmp)) != -1) {
			ous.write(tmp, 0, lenght);
		}
		ins.close();
		ous.close();
		System.out.println("=====outputf finish");
		// -----------------------------------------寫入寫出-----------------------------------------------------------------------
		String rootDirectory = context.getRealPath("/");

		String Nameof_contextOath = context.getContextPath();
		String getServletPath = request.getServletPath();

		getServletPath = getServletPath.trim().substring(getServletPath.length() - 3, getServletPath.length());
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (productImage != null && !productImage.isEmpty()) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				bb.setImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		if (getServletPath.equals("add")) {
			service.addProduct(bb);
			System.out.println("insert successful~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		} else if (getServletPath.equals("upd")) {
			service.updateProducts(bb, product_id);
			System.out.println("update successful~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		}

		// 將上傳的檔案移到指定的資料夾
		try {
			// 在rooDirectory 找images資料夾內找
			System.out.println("ext : " + ext);
			System.out.println("rootDirectory : " + rootDirectory);
			System.out.println("getServletPath : " + getServletPath);
			System.out.println("Nameof_contextOath : " + Nameof_contextOath);
			File imageFolder = new File(rootDirectory, "images");
			if (!imageFolder.exists())
				// 如果檔案不存在，就建一個
				imageFolder.mkdirs();
			File file = new File(imageFolder, bb.getProduct_id() + ext);
			// 檔案取得後再加入附檔名
			productImage.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}
		System.out.println("Submit Form Finish============================================");
		return "redirect:/productTable";
	}

}
