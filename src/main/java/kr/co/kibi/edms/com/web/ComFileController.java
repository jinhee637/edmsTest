package kr.co.kibi.edms.com.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kibi.edms.admin.service.DocVO;
import kr.co.kibi.edms.com.service.FileVO;
import kr.co.kibi.edms.com.service.KibiFileMngService;
import kr.co.kibi.edms.com.service.LoginVO;
import kr.co.kibi.edms.com.util.UserDetailHelper;
import kr.co.kibi.edms.user.service.UserDocService;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ComFileController implements ApplicationContextAware ,InitializingBean{
	private ApplicationContext applicationContext;
		
		/*
		 * 서비스 불러오기 Start
		 */
		@Resource(name = "KibiFileMngService")
	    private KibiFileMngService fileMngService;
		
		@Resource(name = "UserDocService")
		private UserDocService userDocService;
		/*
		 * 서비스 불러오기 End
		 */	
		
		/**
		 * 브라우저에 따른 파일 다운로드 처리를 위한 메소드
		 * @author 이진희
		 */
		private void setDisposition(String filename, HttpServletRequest request, HttpServletResponse response) throws Exception {
			String browser = getBrowser(request);
			
			String dispositionPrefix = "attachment; filename=";
			String encodedFilename = null;
			
			if (browser.equals("MSIE")) {
			    encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
			} else if (browser.equals("Firefox")) {
			    encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
			} else if (browser.equals("Opera")) {
			    encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
			} else if (browser.equals("Chrome")) {
			    StringBuffer sb = new StringBuffer();
			    for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
				    sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
				    sb.append(c);
				}
			    }
			    encodedFilename = sb.toString();
			} else {
			    //throw new RuntimeException("Not supported browser");
			    throw new IOException("Not supported browser");
			}
			
			response.setHeader("Content-Disposition", dispositionPrefix + encodedFilename);

			if ("Opera".equals(browser)){
			    response.setContentType("application/octet-stream;charset=UTF-8");
			}
			
		}
		
		/**
		 * 사용자의 브라우저 체크 메소드
		 * @author 이진희
		 */
		private String getBrowser(HttpServletRequest request) {
			String header = request.getHeader("User-Agent");
	        if (header.indexOf("MSIE") > -1) {
	            return "MSIE";
	        } else if (header.indexOf("Chrome") > -1) {
	            return "Chrome";
	        } else if (header.indexOf("Opera") > -1) {
	            return "Opera";
	        }
	        return "Firefox";
		}
		
		/**
		 * 파일 다운로드
		 * @author 이진희
		 */
		@RequestMapping("/com/downloadFile.do")
		public void downLoadFile(Map<String, Object> commandMap, HttpServletRequest request, HttpServletResponse response, DocVO dvo) throws Exception{


			LoginVO user = (LoginVO)UserDetailHelper.getAuthenticatedUser();
			
			String dvoParty=Integer.toString(dvo.getPartySeq());
			
			String userParty=Integer.toString(user.getParty_seq());
			
			if(user.getBizrole_cd().equals("ADMIN")){
				
			}else if(dvo.getPartySeq() == user.getParty_seq()){
				
			}else{
				userDocService.updateDownCnt(dvo);
			}
			
	    	String articleId = (String)commandMap.get("articleId");
	    	String fileSeq = (String)commandMap.get("fileSeq");

		    FileVO fileVO = new FileVO();
		    fileVO.setArticleId(articleId);
		    fileVO.setFileSeq(fileSeq);
		    FileVO fvo = fileMngService.selectFileInf(fileVO);

		    File uFile = new File(fvo.getSavepathIf(), fvo.getSavefileNm());
		    
		    int fSize = (int)uFile.length();

		    if (fSize > 0) {
		    	String mimetype = "application/x-msdownload";

				response.setContentType(mimetype);
				
				setDisposition(fvo.getOrgfileNm(), request, response);
				
				response.setContentLength(fSize);
	
				BufferedInputStream in = null;
				BufferedOutputStream out = null;
	
				try {
				    in = new BufferedInputStream(new FileInputStream(uFile));
				    out = new BufferedOutputStream(response.getOutputStream());
	
				    FileCopyUtils.copy(in, out);
				    out.flush();
				} catch (Exception ex) {
				    //ex.printStackTrace();
				    // 다음 Exception 무시 처리
				    // Connection reset by peer: socket write error
				} finally {
				    if (in != null) {
					try {
					    in.close();
					} catch (Exception ignore) {
					    // no-op
					}
				    }
				    if (out != null) {
					try {
					    out.close();
					} catch (Exception ignore) {
					    // no-op
					}
				    }
				}
		    } else {
			response.setContentType("application/x-msdownload");

			PrintWriter printwriter = response.getWriter();
			printwriter.println("<html>");
			printwriter.println("<br><br><br><h2>Could not get file name:<br>" + fvo.getOrgfileNm() + "</h2>");
			printwriter.println("<br><br><br><center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
			printwriter.println("<br><br><br>&copy; webAccess");
			printwriter.println("</html>");
			printwriter.flush();
			printwriter.close();
		    }
		}
	    
		public void afterPropertiesSet() throws Exception {
			// TODO Auto-generated method stub
			
		}
	
		public void setApplicationContext(ApplicationContext applicationContext)
				throws BeansException {
			// TODO Auto-generated method stub
			
		}
}
