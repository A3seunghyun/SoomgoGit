package servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MarketRegistrationDAO;

@WebServlet("/SoomgoMarketRegistrationServlet")
public class SoomgoMarketRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		// 마켓 상품등록 JDBC insert
		MarketRegistrationDAO market = new MarketRegistrationDAO();
		
		ServletContext application = request.getServletContext();
		String path = application.getRealPath("/upload");
		System.out.println("절대경로 path = " + path);
		
		int size = 1024 * 1024 * 100;
		
		MultipartRequest multi = new MultipartRequest(request, 	
				path,		
				size,		
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		boolean success = true;
		
		
//		File newPath = new File(path);
//		if(!newPath.exists()) {
//			newPath.mkdirs();
//		}
//		
//		
//		ArrayList<String> filenames = new ArrayList<String>(); 	// 첨부파일명
//		ArrayList<String> orgfilenames = new ArrayList<String>(); // 첨부파일명
//		
//		try {
//			String strFilename = multi.getParameter("serviceName");
//			System.out.println("serviceName : " + strFilename);
//			
//			int sizeOfThumbnailImgs = Integer.parseInt(multi.getParameter("sizeThumbnailImgs"));
//			
//			Enumeration<?> e = multi.getFileNames();
//			while (e.hasMoreElements()) {
//				String file = (String)e.nextElement();
//				filenames.add(multi.getFilesystemName(file));			
//				orgfilenames.add(multi.getOriginalFileName(file));
//			}
//		} catch(Exception e) {
//			System.out.println(e);
//		}
//		
//		for(int i=filenames.size()-1; i>=0; i--) {
//			if(filenames.get(i)==null) continue;
//			System.out.println("----> " + filenames.get(i));
//			
//			try {
//				market.marketThumbnailImg(filenames.get(i));
//			} catch (Exception e) {
//				success = false;
//				e.printStackTrace();
//			}
//		};
		
		
		int serviceName = 1;	// 카테고리명
		
		int userIdx = 20;	// 유저idx
		
		String itemTitle = multi.getParameter("itemTitle_val");	// 상품명
		System.out.println("상품명 : "+itemTitle);
		
		String untact = multi.getParameter("online_val");	// 온라인여부
		System.out.println("온라인 : " + untact);
		
		String contact = multi.getParameter("meet_val");	// 대면여부
		System.out.println("대면 : " + contact);
		
		int serviceAreaIdx = 1;	// 서비스지역idx
		
		String detailContent= multi.getParameter("detailText_val");	// 상세설명
		System.out.println("상세설명 : "+detailContent);
		
		String askRefund = multi.getParameter("ask_refund_val"); // 취소환불
		System.out.println("취소환불 : "+askRefund);
	
		int marketIdx = 0;
		try {
			marketIdx = market.market(serviceName, itemTitle, userIdx);
			market.marketDetail(marketIdx, untact, contact, serviceAreaIdx, detailContent);
			market.marketAskRefund(marketIdx,askRefund);
			
		} catch (Exception e) {
			success = false;
			e.printStackTrace();
		};
		
		
		
		int sizeOptions = Integer.parseInt(multi.getParameter("sizeOptions")); // 가격옵션 
		
		for(int i = 0; i <= sizeOptions-1; i++) {
			int price = Integer.parseInt(multi.getParameter("option_price_"+i));
			String title = multi.getParameter("option_title_"+i);
			String content = multi.getParameter("option_content_"+i);
			System.out.println("옵션 가격 :" + i +" "+ price);
			System.out.println("옵션명 : " + i + " " + title);
			System.out.println("옵션 설명 : " + i + " " + content);
			
			try {
				market.marketOption(marketIdx, title, content, price);
			} catch (Exception e) {
				success = false;
				e.printStackTrace();
			}
		};
		
		int sizeSchedules = Integer.parseInt(multi.getParameter("sizeSchedules")); // 스케쥴
		
		for(int i = 0; i <= sizeSchedules-1; i++) {
			String dayWeek = multi.getParameter("schedule_day_"+i);
			String st_time = multi.getParameter("schedule_st_time_"+i);
			String ed_time = multi.getParameter("schedule_ed_time_"+i);
			
			System.out.println("요일"+i+" : "+dayWeek);
			System.out.println("시작시간"+i+" : "+st_time);
			System.out.println("종료시간"+i+" : "+ed_time);
			
			try {
				market.marketSchedule(marketIdx,dayWeek, st_time, ed_time);
			} catch (Exception e) {
				success = false;
				e.printStackTrace();
			}
		}
	
		int sizeFaqs = Integer.parseInt(multi.getParameter("sizeFaqs")); // 자주묻는 질문/답변
		
		for(int i = 0; i <= sizeFaqs-1; i++) {
			String question = multi.getParameter("faq_title_"+i);
			String answer = multi.getParameter("faq_answer_"+i);
			
			System.out.println("질문"+i+" : "+question);
			System.out.println("답변"+i+" : "+answer);
			
			try {
				market.marketAsk(marketIdx, question, answer);
				
			} catch (Exception e) {
				success = false;
				e.printStackTrace();
			}
		}
		
		
		/*대표 이미지*/
		File newPath = new File(path);
		if(!newPath.exists()) {
			newPath.mkdirs();
		}
		
		
		ArrayList<String> filenames = new ArrayList<String>(); 	// 첨부파일명
		ArrayList<String> orgfilenames = new ArrayList<String>(); // 첨부파일명
		
		try {
			int sizeOfThumbnailImgs = Integer.parseInt(multi.getParameter("sizeThumbnailImgs"));
			
			Enumeration<?> e = multi.getFileNames();
			while (e.hasMoreElements()) {
				String file = (String)e.nextElement();
				filenames.add(multi.getFilesystemName(file));			
				orgfilenames.add(multi.getOriginalFileName(file));
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		
		for(int i=filenames.size()-1; i>=0; i--) {
			if(filenames.get(i)==null) continue;
			System.out.println("----> " + filenames.get(i));
			
			try {
				market.marketThumbnailImg(marketIdx, filenames.get(i));
			} catch (Exception e) {
				success = false;
				e.printStackTrace();
			}
		};
		
		
		if(success) {
			RequestDispatcher rd = request.getRequestDispatcher("soomgo_market_success.jsp");
			rd.forward(request, response);
		} else {
			try {
				market.marketDelete(marketIdx);
				market.marketDetailDelete(marketIdx);
				market.marketOptionDelete(marketIdx);
				market.marketScheduleDelete(marketIdx);
				market.marketAskDelete(marketIdx);
				market.marketAskRefundDelete(marketIdx);
				market.marketThumbnailImgDelete(marketIdx);
				market.marketDetailImgDelete(marketIdx);
				response.sendRedirect("soomgo_market_registration.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
	}
	
}
