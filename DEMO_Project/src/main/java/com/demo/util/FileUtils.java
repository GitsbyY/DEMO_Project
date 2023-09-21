package com.demo.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
//공부하자. dependencyIngection 의존성 주입니다.
@Component("fileUtils")
public class FileUtils {

   private static final String filePath = "C:\\DEMO\\image";
   
   public List<Map<String,Object>> createFileinfo(int imgNo, String pathName,
            MultipartHttpServletRequest multipartHttpServletRequest) throws Exception{
	   								//파일이 들어가는 곳
      Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
      //멀티파트 요청
      MultipartFile multipartFile = null;
      String originalFileName = null;
      //파일 확장자명
      String originalFileExtension = null;
      String storedFileName = null;
      						//하나의 파일을 다룰 수도 여러개를 다룰 수도 있기에 리스트로 했다
      List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();
      Map<String,Object> fileInfoMap = null;
      				//경로에있는 파일을 쓸 준비를 한다.
      File file = new File(filePath + "\\" + pathName);
      
      //폴더가 있는지 확인한다.
      if(file.exists() == false) {
         file.mkdirs(); //폴더를 만들어준다
      }
      
      while(iterator.hasNext()) {
         multipartFile = multipartHttpServletRequest.getFile(iterator.next());
         
         if(multipartFile.isEmpty() == false) {
            originalFileName = multipartFile.getOriginalFilename();
            originalFileExtension
               = originalFileName.substring(originalFileName.lastIndexOf("."));
            //저장파일이름 무작위로 생성 
            storedFileName = CommonUtils.getRandomString()+originalFileExtension;
            
            file = new File(filePath + "\\" + pathName, storedFileName);
            //하드디스크에 파일이 만들어진다
            multipartFile.transferTo(file);
            
            fileInfoMap = new HashMap<String,Object>();
            fileInfoMap.put("imgNo", imgNo); // 멤버
            fileInfoMap.put("original_file_name", originalFileName);
            fileInfoMap.put("stored_file_name", storedFileName);
            fileInfoMap.put("file_size", multipartFile.getSize());
            
            //한 번에 여러 이미지를 올린다
            fileList.add(fileInfoMap);
            
         }
      }
      		//파일은 존재하지 않고, 데이터베이스와 매핑 된 정보만 남았다
      return fileList;
      
   }
   
   public void parseUpdateFileInfo(String pathName, Map<String, Object> tempFiMap)
		   throws Exception {
	   String storedFileName = (String)tempFiMap.get("STORED_FILE_NAME");
	   
	   File file = new File(filePath  + "\\" + pathName + "/" + storedFileName);
	   
	   if(file.exists()) {
		   //이 순간에 물리적으로 파일이 삭제가 된다.
		   file.delete();
	   }else {
		   System.out.println("file dose not exist");
	   }
   }

	public List<Map<String, Object>> createFileinfo(int imgNo,
			String pathName, MultipartFile multfile) throws Exception{
		// TODO Auto-generated method stub
	    String originalFileName = null;
	    //파일 확장자명
	    String originalFileExtension = null;
	    String storedFileName = null;
	    						//하나의 파일을 다룰 수도 여러개를 다룰 수도 있기에 리스트로 했다
	    List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();
	    Map<String,Object> fileInfoMap = null;
	    				//경로에있는 파일을 쓸 준비를 한다.
	    File file = new File(filePath + "\\" + pathName);
	    
	    //폴더가 있는지 확인한다.
	    if(file.exists() == false) {
	       file.mkdirs(); //폴더를 만들어준다
	    }
	    
       if(multfile.isEmpty() == false) {
          originalFileName = multfile.getOriginalFilename();
          originalFileExtension
             = originalFileName.substring(originalFileName.lastIndexOf("."));
          //저장파일이름 무작위로 생성 
          storedFileName = CommonUtils.getRandomString()+originalFileExtension;
          
          file = new File(filePath + "\\" + pathName, storedFileName);
          //하드디스크에 파일이 만들어진다
          multfile.transferTo(file);
          
          fileInfoMap = new HashMap<String,Object>();
          fileInfoMap.put("imgNo", imgNo); // 멤버
          fileInfoMap.put("original_file_name", originalFileName);
          fileInfoMap.put("stored_file_name", storedFileName);
          fileInfoMap.put("file_size", multfile.getSize());
          
          //한 번에 여러 이미지를 올린다
          fileList.add(fileInfoMap);
	          
	    }
	    		//파일은 존재하지 않고, 데이터베이스와 매핑 된 정보만 남았다
	    return fileList;
	}
   
}