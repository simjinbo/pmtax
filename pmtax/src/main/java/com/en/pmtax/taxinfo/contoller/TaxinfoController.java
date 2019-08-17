package com.en.pmtax.taxinfo.contoller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.en.pmtax.taxinfo.model.service.TaxinfoService;
import com.en.pmtax.taxinfo.model.vo.Taxinfo;

@Controller
public class TaxinfoController {
	// AdminService DI
	@Autowired
	private TaxinfoService taxinfoService;

	@RequestMapping(value = "taxinfoList.do")
	public ModelAndView moveTaxinfoListMethod(ModelAndView mv, HttpServletRequest request) {
		int nowpage = Integer.parseInt(request.getParameter("nowpage"));
		int totalList =  taxinfoService.getTotalCount();
		
		int row = 15;
		int totalpage = totalList / row -1;
		if((totalList % row) > 0) {
			totalpage++;
		}
		int startpoint = nowpage * row;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("startpoint", startpoint);
		map.put("row", row);
		
		ArrayList<Taxinfo> list = taxinfoService.selectTaxinfoList(map);
		
		if (list != null) {
			mv.addObject("totalpage", totalpage);
			mv.addObject("nowpage", nowpage);
			mv.addObject("list", list);
			mv.setViewName("taxinfo/taxinfoList");
		} else {
			mv.addObject("message", "목록 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}
		return mv;
	}

	@RequestMapping(value = "taxinfoDetail.do")
	public ModelAndView selectTaxinfoDetail(Taxinfo taxinfo, ModelAndView mv, HttpServletRequest request) {
		int info_no = Integer.parseInt(request.getParameter("info_no"));
		int nowpage = Integer.parseInt(request.getParameter("nowpage"));
		taxinfo.setInfo_no(info_no);
		taxinfo = taxinfoService.selectTaxinfoDetail(info_no);
		if (taxinfo != null) {
			mv.addObject("taxinfo", taxinfo);
			mv.addObject("nowpage", nowpage);
			mv.setViewName("taxinfo/taxinfoDetail");
		} else {
			mv.addObject("message", "세무정보 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}

		return mv;

	}

	@RequestMapping(value = "tiFileDown.do")
	public void fileDownload(HttpServletRequest mrequest, HttpServletResponse response)
			throws UnsupportedEncodingException {

		String fileName = mrequest.getParameter("file");
		mrequest.setCharacterEncoding("UTF-8");

		// 파일 업로드된 경로
		try {
			String savePath = mrequest.getSession().getServletContext().getRealPath("/files/taxinfo/");

			// 실제 내보낼 파일명
			InputStream in = null;
			OutputStream os = null;
			File file = null;
			boolean skip = false;
			String client = "";

			// 파일을 읽어 스트림에 담기
			try {
				file = new File(savePath, fileName);
				in = new FileInputStream(file);
			} catch (FileNotFoundException fe) {
				skip = true;
			}

			client = mrequest.getHeader("User-Agent");

			// 파일 다운로드 헤더 지정
			response.reset();
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Description", "JSP Generated Data");

			if (!skip) {
				// IE
				if (client.indexOf("MSIE") != -1) {
					response.setHeader("Content-Disposition", "attachment; filename=\""
							+ java.net.URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
					// IE 11 이상.
				} else if (client.indexOf("Trident") != -1) {
					response.setHeader("Content-Disposition", "attachment; filename=\""
							+ java.net.URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
				} else {
					// 한글 파일명 처리
					response.setHeader("Content-Disposition",
							"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
					response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
				}
				response.setHeader("Content-Length", "" + file.length());
				os = response.getOutputStream();
				byte b[] = new byte[(int) file.length()];
				int leng = 0;
				while ((leng = in.read(b)) > 0) {
					os.write(b, 0, leng);
				}
			} else {
				response.setContentType("text/html;charset=UTF-8");
				System.out.println("파일을 찾을 수 없습니다");
			}
			in.close();
			os.close();
		} catch (Exception e) {
			System.out.println("ERROR : " + e.getMessage());
		}

	}

	@RequestMapping(value = "taxinfoWriteView.do")
	public String moveTaxinfoWriteMethod() {
		return "taxinfo/taxinfoWrite";
	}

	@RequestMapping(value = "tiinsert.do", method = RequestMethod.POST)
	public String taxinfoInsertMethod(Taxinfo taxinfo, MultipartHttpServletRequest mrequest) {
		List<MultipartFile> files = mrequest.getFiles("upfile");
		String savePath = mrequest.getSession().getServletContext().getRealPath("/files/taxinfo/");
		File file = new File(savePath);
		// 파일이 없다면 디렉토리를 생성
		if (file.exists() == false) {
			file.mkdirs();
		}

		if (files.get(0).getOriginalFilename() != "") {
			for (int i = 0; i < files.size(); i++) {
				file = new File(savePath + files.get(i).getOriginalFilename());
				try {
					files.get(i).transferTo(file);

					if (i == 0) {
						taxinfo.setFile1(files.get(i).getOriginalFilename());
					}
					if (i == 1) {
						taxinfo.setFile2(files.get(i).getOriginalFilename());
					}
					if (i == 2) {
						taxinfo.setFile3(files.get(i).getOriginalFilename());
					}
					if (i == 3) {
						taxinfo.setFile4(files.get(i).getOriginalFilename());
					}
					if (i == 4) {
						taxinfo.setFile5(files.get(i).getOriginalFilename());
					}
					if (i == 5) {
						taxinfo.setFile6(files.get(i).getOriginalFilename());
					}
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
		}
		taxinfo.setInfo_no(0);
		taxinfo.setInfo_title(mrequest.getParameter("title"));
		taxinfo.setInfo_contents(mrequest.getParameter("contents"));

		int result = taxinfoService.insertTaxinfo(taxinfo);

		if (result > 0) {
			return "redirect:taxinfoList.do?nowpage=0";
		} else {
			return "common/error";
		}
	}

	@RequestMapping(value = "taxinfoUpdateView.do")
	public ModelAndView moveTaxinfoUpdateMethod(Taxinfo taxinfo, ModelAndView mv, HttpServletRequest request) {
		int info_no = Integer.parseInt(request.getParameter("info_no"));
		int nowpage = Integer.parseInt(request.getParameter("nowpage"));
		taxinfo.setInfo_no(info_no);
		taxinfo = taxinfoService.selectTaxinfoDetail(info_no);
		if (taxinfo != null) {
			mv.addObject("taxinfo", taxinfo);
			mv.addObject("nowpage", nowpage);
			mv.setViewName("taxinfo/taxinfoUpdate");
		} else {
			mv.addObject("message", "세무정보 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}

		return mv;
	}

	@RequestMapping(value = "tiupdate.do")
	public String updateTaxinfo(Taxinfo taxinfo, ModelAndView mv, MultipartHttpServletRequest mrequest) {
		String savePath = mrequest.getSession().getServletContext().getRealPath("/files/taxinfo/");
		int info_no = Integer.parseInt(mrequest.getParameter("info_no"));
		int nowpage = Integer.parseInt(mrequest.getParameter("nowpage"));
		taxinfo.setInfo_no(info_no);

		List<MultipartFile> files = null;
		
		if (mrequest.getFiles("upfile").get(0).getOriginalFilename() != "") {
			files = mrequest.getFiles("upfile");
			File file = new File(savePath);
			// 파일이 없다면 디렉토리를 생성
			if (file.exists() == false) {
				file.mkdirs();
			}

			if (mrequest.getParameter("file1") != null) {
				File originFile = new File(savePath + taxinfo.getFile1());
				if (originFile.exists()) {
					originFile.delete();
				}
			}
			if (mrequest.getParameter("file2") != null) {
				File originFile = new File(savePath + taxinfo.getFile2());
				if (originFile.exists()) {
					originFile.delete();
				}
			}
			if (mrequest.getParameter("file3") != null) {
				File originFile = new File(savePath + taxinfo.getFile3());
				if (originFile.exists()) {
					originFile.delete();
				}
			}
			if (mrequest.getParameter("file4") != null) {
				File originFile = new File(savePath + taxinfo.getFile4());
				if (originFile.exists()) {
					originFile.delete();
				}
			}
			if (mrequest.getParameter("file5") != null) {
				File originFile = new File(savePath + taxinfo.getFile5());
				if (originFile.exists()) {
					originFile.delete();
				}
			}
			if (mrequest.getParameter("file6") != null) {
				File originFile = new File(savePath + taxinfo.getFile6());
				if (originFile.exists()) {
					originFile.delete();
				}
			}

			for (int i = 0; i < files.size(); i++) {
				file = new File(savePath + files.get(i).getOriginalFilename());
				try {
					files.get(i).transferTo(file);
					if (i == 0) {
						taxinfo.setFile1(files.get(i).getOriginalFilename());
						taxinfo.setFile2(null);
						taxinfo.setFile3(null);
						taxinfo.setFile4(null);
						taxinfo.setFile5(null);
						taxinfo.setFile6(null);
					}
					if (i == 1) {
						taxinfo.setFile2(files.get(i).getOriginalFilename());
						taxinfo.setFile3(null);
						taxinfo.setFile4(null);
						taxinfo.setFile5(null);
						taxinfo.setFile6(null);
					}
					if (i == 2) {
						taxinfo.setFile3(files.get(i).getOriginalFilename());
						taxinfo.setFile4(null);
						taxinfo.setFile5(null);
						taxinfo.setFile6(null);
					}
					if (i == 3) {
						taxinfo.setFile4(files.get(i).getOriginalFilename());
						taxinfo.setFile5(null);
						taxinfo.setFile6(null);
					}
					if (i == 4) {
						taxinfo.setFile5(files.get(i).getOriginalFilename());
						taxinfo.setFile6(null);
					}
					if (i == 5) {
						taxinfo.setFile6(files.get(i).getOriginalFilename());
					}
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		taxinfo.setInfo_title(mrequest.getParameter("info_title"));
		taxinfo.setInfo_contents(mrequest.getParameter("info_contents"));

		int result = taxinfoService.updateTaxinfo(taxinfo);

		if (result > 0) {
			return "redirect:taxinfoDetail.do?info_no=" + info_no+"&nowpage="+nowpage;
		} else {
			return "common/error";
		}
	}

	@RequestMapping("tidelete.do")
	public String deleteTaxinfo(HttpServletRequest request) {
		int info_no = Integer.parseInt(request.getParameter("info_no"));

		Taxinfo taxinfo = taxinfoService.selectTaxinfoDetail(info_no);

		int result = taxinfoService.deleteTaxinfo(info_no);

		String savePath = request.getSession().getServletContext().getRealPath("/files/taxinfo/");
		if (result > 0) {
			if (taxinfo.getFile1() != null) {
				File file = new File(savePath + taxinfo.getFile1());
				if (file.exists()) {
					file.delete();
				}
			}
			if (taxinfo.getFile2() != null) {
				File file = new File(savePath + taxinfo.getFile2());
				if (file.exists()) {
					file.delete();
				}
			}
			if (taxinfo.getFile3() != null) {
				File file = new File(savePath + taxinfo.getFile3());
				if (file.exists()) {
					file.delete();
				}
			}
			if (taxinfo.getFile4() != null) {
				File file = new File(savePath + taxinfo.getFile4());
				if (file.exists()) {
					file.delete();
				}
			}
			if (taxinfo.getFile5() != null) {
				File file = new File(savePath + taxinfo.getFile5());
				if (file.exists()) {
					file.delete();
				}
			}
			if (taxinfo.getFile6() != null) {
				File file = new File(savePath + taxinfo.getFile6());
				if (file.exists()) {
					file.delete();
				}
			}
			return "redirect:taxinfoList.do?nowpage=0";
		} else {
			return "common/error";
		}
	}

	// 다중파일업로드
	@RequestMapping("file_uploader_html5.do")
	public void file_uploader_html5(HttpServletRequest request, HttpServletResponse response) {
		try {
			String sFileInfo = "";
			// 파일명 - 싱글파일업로드와 다르게 멀티파일업로드는 HEADER로 넘어옴
			String filename = request.getHeader("file-name");
			// 파일확장자
			String filename_ext = filename.substring(filename.lastIndexOf(".") + 1);
			// 파일확장자를 소문자로 변경
			filename_ext = filename_ext.toLowerCase();
			// 이미지 검증 배열변수
			String[] allow_file = { "jpg", "png", "bmp", "gif" };
			// 돌리면서 확장자가 이미지인지
			int cnt = 0;
			for (int i = 0; i < allow_file.length; i++) {
				if (filename_ext.equals(allow_file[i])) {
					cnt++;
				}
			}
			// 이미지가 아님
			if (cnt == 0) {
				PrintWriter print = response.getWriter();
				print.print("NOTALLOW_" + filename);
				print.flush();
				print.close();
			} else {
				// 이미지이므로 신규 파일로 디렉토리 설정 및 업로드
				// 파일 기본경로
				String dftFilePath = request.getSession().getServletContext().getRealPath("/");
				// 파일 기본경로 _ 상세경로
				String filePath = dftFilePath + "resources" + File.separator + "editor" + File.separator + "multiupload"
						+ File.separator;
				File file = new File(filePath);
				if (!file.exists()) {
					file.mkdirs();
				}
				String realFileNm = filename.substring(filename.lastIndexOf("."));
				String rlFileNm = filePath + realFileNm;
				///////////////// 서버에 파일쓰기 /////////////////
				InputStream is = request.getInputStream();
				OutputStream os = new FileOutputStream(rlFileNm);
				int numRead;
				byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
				while ((numRead = is.read(b, 0, b.length)) != -1) {
					os.write(b, 0, numRead);
				}
				if (is != null) {
					is.close();
				}
				os.flush();
				os.close();
				///////////////// 서버에 파일쓰기 /////////////////
				// 정보 출력
				sFileInfo += "&bNewLine=true";
				// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
				sFileInfo += "&sFileName=" + filename;
				sFileInfo += "&sFileURL=" + "\\pmtax\\resources\\editor\\multiupload\\" + realFileNm;
				PrintWriter print = response.getWriter();
				print.print(sFileInfo);
				print.flush();
				print.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
