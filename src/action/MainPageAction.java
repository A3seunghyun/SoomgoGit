package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommuNoticeDao;
import dao.CommuServiceDao;
import dao.CommunityDao;
import dao.MainPageDao;
import dao.Soomgo_headerDao;
import dto.CommuCategoryDto;
import dto.CommuGosuKnowhowPostLisMaintDto;
import dto.CommuMainRandomGosuDto;
import dto.CommuMainpostListDto;
import dto.CommuServiceList;
import dto.MainPopularGosuDto;
import dto.MaincleaningDto;
import dto.Soomgo_header2Dto;
import dto.Soomgo_headerDto;



public class MainPageAction implements Action{
	// <%!   --> 메서드를 정의 할 수 있는 공간 
	public String convStr(String name) {	
		
		int length = name.length();			// 이름의 길이를 구함
		String ret = "" + name.charAt(0);	// 변수 ret에 이름첫글자를 담음
		
		for(int i=1; i<=length-1; i++) {	// 이름 길이 만큼 for문을 돌리면서 이름의 첫글자를 제외한 나머지 이름의 길이만큼 *을 추가함  -> 아래의 유저이름이 들어갈 공간에 메서드호출후 (dto.get이름)을 넣어줌
			ret += "*";						
		}
		return ret;
	}
	
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 user_idx
		
		HttpSession session = request.getSession();
		Integer userIdx = (Integer)(session.getAttribute("L_users_idx"));
		Integer isgosu = (Integer)(session.getAttribute("isgosu"));
		
		// 세션에서 isgosu를 가져옴, 존재하지 않으면 기본값 2 설정
		if (isgosu == null) {	
			// 고수일때 실행할 메서드
			isgosu = 2; // 기본값 2
		}	//else{
//		if (userIdx == null) {
//			userIdx = 0;
//		}
		// 고수아닐때 일반회원일때 실행할 메서드
		// }
		System.out.println("유저Idx (userIdx): " + userIdx);
		System.out.println("고수Idx (isgosu): " + isgosu);
		// 여기까지 
		
		
		

		MainPageDao mDao = new MainPageDao();
		CommunityDao cDao = new CommunityDao();
		CommuNoticeDao nDao = new CommuNoticeDao();
		CommuServiceDao sDao = new CommuServiceDao(); 

		//메인페이지 고수노하우 최근작성 순 상위 2개 포스트 뿌리기
		ArrayList<CommuGosuKnowhowPostLisMaintDto> mainList =  null;
		
		ArrayList<CommuCategoryDto> categoryList = null;
		// 메인페이지 게시글 최근작성 순 상위 3개 포스트 뿌리기
		ArrayList<CommuMainpostListDto> mainPostList = null;
		// 랜덤 고수
		ArrayList<CommuMainRandomGosuDto> mList = null;
//		ArrayList<CommuNoticeDto> nList = nDao.getNoticeList(users_idx);  
		// 알림 리스트를 가져올 메서드  로그인한 유저 idx 영현이 헤더에서idx 가져옴   (영현이가 컨틀로러 수정 하면 그때 처리)
//	 	검색창
		String searchString = request.getParameter("searchText");
		ArrayList<CommuServiceList> sList = null;
		
		ArrayList<MainPopularGosuDto> list = null;
		
		ArrayList<MaincleaningDto> mcList = null;
		
		
		try {
			mainList = mDao.getMainGkhPostList();
			categoryList = cDao.getCategorySelect();
			mainPostList = mDao.getMainPostList(); 
			mList = mDao.getRandomGosu();
			sList = sDao.getServiceList(searchString);
			list = mDao.getMainPopularGosuSelect();
			mcList = mDao.getMaincleaningListSelect();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("mcList:" + mcList);
		
		request.setAttribute("mainList", mainList);
		request.setAttribute("mainPostList", mainPostList);
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("mList", mList);
		request.setAttribute("sList", sList);
		request.setAttribute("list", list);
		request.setAttribute("mcList", mcList);
		
		request.getRequestDispatcher("soomgo_main.jsp").forward(request, response);
	}
}
