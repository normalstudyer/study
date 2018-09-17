package com.controller;

import java.io.*;


import java.util.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.bean.Photo;
import com.service.PhotoService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemHeaders;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.Product;
import com.service.TestService;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value="root")
public class TestController {
	@Autowired
	private TestService testService;
	@Autowired
	private PhotoService photoService;
	// 保存文件的目录
	private static String PATH_FOLDER = "/";
	// 存放临时文件的目录
	private static String TEMP_FOLDER = "/";
    @SuppressWarnings("rawtypes")
	@RequestMapping(value="/limit",method=RequestMethod.POST)
    @ResponseBody
    public List zhanshi(@RequestBody Map map,Model model,HttpServletResponse res,HttpServletRequest req) throws IOException{
    	System.out.println("已经进入");
    	
    	String start1 = (String) map.get("pstart");
    	String size1 = (String)map.get("psize");
    	int pstart = Integer.parseInt(start1);
    	int psize = Integer.parseInt(size1);
    	System.out.println("start+size"+pstart+"...."+psize);
    	List<Product> list = new ArrayList<Product>();
    	list=testService.Testlimit(0, 5);
    	//model.addAttribute("book", list);
    	req.getSession().setAttribute("book", list);
    	return list;
    }
    @RequestMapping(value="/limit1")
    public void limit1(HttpServletRequest req){
    	String name = req.getParameter("name");
    	System.out.println(name);
    }
    @RequestMapping(value="/uploadPic")
	@ResponseBody
	public Map<String,Object> manyImageUpload(/*MultipartFile file1,*/ HttpServletRequest request, ServletConfig config) throws IOException{
		System.out.println("---------upload------------");
		JSONObject jsonobj = new JSONObject();
		ServletContext servletCtx = config.getServletContext();
		// 初始化路径
		// 缩略图保存路径
		PATH_FOLDER = "E:/db/eclipse-jee-neon-3-win32-x86_64/Shop/Images";
		System.out.println("保存缩略图的目录===========" + PATH_FOLDER);
		// 存放临时文件的目录,存放xxx.tmp文件的目录
		TEMP_FOLDER = servletCtx.getRealPath("/temp");
		System.out.println("存放临时文件的目录===========" + TEMP_FOLDER);
		File dir = new File(PATH_FOLDER);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}
		File dir2 = new File(TEMP_FOLDER);
		if (!dir2.isDirectory()) {
			dir2.mkdir();
		}
		//调用服务层来处理数据
		//System.out.println("name="+repname);
		/*System.out.println("=="+file1.getName());//文件名字
		System.out.println("1="+file1.getContentType());
		System.out.println("2="+file1.getOriginalFilename());
		System.out.println("3="+file1.getSize());
		System.out.println("--"+file1.getInputStream());*/
		Map<String,Object> aMap=new HashMap<String,Object>();
		int returnTag = -1;
		String saveName=null;
		//上传的文件名
		String filename=null;
		// 获得磁盘文件条目工厂
		try{

		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 如果没以下两行设置的话，上传大的 文件 会占用 很多内存，
		// 设置暂时存放的 存储室 , 这个存储室，可以和 最终存储文件 的目录不同
		/**
		 * 原理 它是先存到 暂时存储室，然后在真正写到 对应目录的硬盘上， 按理来说 当上传一个文件时，其实是上传了两份，第一个是以
		 * .tem 格式的 然后再将其真正写到 对应目录的硬盘上
		 */
		factory.setRepository(new File(TEMP_FOLDER));
		// 设置 缓存的大小，当上传文件的容量超过该缓存时，直接放到 暂时存储室
		factory.setSizeThreshold(1024 * 1024);

		// 高水平的API文件上传处理
		ServletFileUpload upload = new ServletFileUpload(factory);

		// 提交上来的信息都在这个list里面
		// 这意味着可以上传多个文件
		// 请自行组织代码
		List<FileItem> list = upload.parseRequest(request);

		// 获取上传的文件
		for (FileItem file : list) {
			FileItem item = file;
			// 获取文件名
			filename =getUploadFileName(item);

			//filename = file1.getName();
			System.out.println("获取的文件名============================"
					+ filename);
			String suffix = filename
					.substring(filename.lastIndexOf(".") + 1);
			System.out
					.println("获取的文件后缀名=========================" + suffix);
			String[] regular = { "JPG", "GIF","PNG","JPEG" ,"BMP"};
			boolean flag = false;
			// 判断文件格式是否合法
			for (String str : regular) {
				if (suffix.equalsIgnoreCase(str)) {
					flag = true;
				}
			}
			if (!flag) {
				returnTag = 0;
				throw new Exception("文件格式不合法！");
			}

			// 保存后的文件名
			saveName = new Date().getTime()
					+ filename.substring(filename.lastIndexOf("."));
			// 保存后图片的浏览器访问路径
			//String picUrl = App.UPLOAD_SAVE_IMG_URL+saveName;

			System.out.println("存放目录:=================================="
					+ PATH_FOLDER);
			System.out.println("文件名:===================================="
					+ filename);
			/*System.out.println("浏览器访问路径:============================="
					+ picUrl);*/

			// 真正写到磁盘上

			item.write(new File(PATH_FOLDER, saveName)); // 第三方提供的

		}
		System.out.println("==========以上为上传代码=============");
		if (returnTag != -1) {
			// 请求失败
			aMap.put("STATUS", "1");
		} else {
			aMap.put("CODE", 0);
		}
		/*response.getWriter().write(jsonobj.toString());
		response.getWriter().close();*/
	} catch (Exception e) {
		e.printStackTrace();
		aMap.put("errorCode", 0);
		/*response.getWriter().write(jsonobj.toString());
		response.getWriter().close();*/

	}
	return aMap;
		/*//返回结果
		Map<String,Object> aMap=new HashMap<String,Object>();
		aMap.put("code", 0);
		return aMap;*/
	}
	private String getUploadFileName(FileItem item) {
		// 获取路径名
		String value = item.getName();
		// 索引到最后一个反斜杠
		int start = value.lastIndexOf("/");
		// 截取 上传文件的 字符串名字，加1是 去掉反斜杠，
		String filename = value.substring(start + 1);

		return filename;
	}
	public int i =1;
	@RequestMapping(value="/upload")
	@ResponseBody
	public Map load(MultipartFile file, Photo photo,ModelMap map,HttpServletRequest request) throws IOException{
    	/**
        * 上传图片
        */
    	//通过request来接受前台传来的data的数据
    	System.out.println(request.getParameter("name"));
		//图片上传成功后，将图片的地址写到数据库
		String filePath = "E:\\db\\eclipse-jee-neon-3-win32-x86_64\\Shop\\Images";//保存图片的路径
		//获取原始图片的拓展名
		String originalFilename = file.getOriginalFilename();
		//新的文件名字
		String newFileName = UUID.randomUUID()+originalFilename;
       //封装上传文件位置的全路径
		File targetFile = new File(filePath,newFileName);
       //把本地文件上传到封装上传文件位置的全路径
		file.transferTo(targetFile);
		System.out.println("图片上传成功");
		photo.setpName(newFileName);
        System.out.println(i);
		photo.setpId(i);
		/**
		 * 保存商品
		 */
		photoService.save1(photo.getpName());
		//photoService.save(photo.getpId(),photo.getpName());
		Map map1 = new HashMap();
		map1.put("code",0);
		i++;
		return map1;
	}
}
