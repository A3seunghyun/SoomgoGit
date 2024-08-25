package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.CategoryServiceListAction;
import action.CommuMainListAction;
import action.EstimateChatAction;
import action.EstimateListAction;
import action.GosuJoinAction;
import action.GosuKnhDetailAction;
import action.GosuKnhListAction;
import action.GosuKnhWriteFormAction;
import action.GosuProfileDetailAction;
import action.GosuZimAction;
import action.HeaderAction;
import action.LoginAction;
import action.MainPageAction;
import action.MarketProductDetailAction;
import action.MarketProductListAction;
import action.MarketProductReserveAction;
import action.MarketProductReserveCompleteAction;
import action.PostDeleteAction;
import action.PostDetailAction;
import action.PostListAction;
import action.PostSoomgoStoryAction;
import action.PostUpdateAction;
import action.PostUpdateFormAction;
import action.PostWriteAction;
import action.PostWriteFormAction;
import action.RegionListAction;
import action.RequestSelectAction;
import action.SoomgoMypageAction;
import action.UserJoinAction;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String command = request.getParameter("command");
		System.out.println("컨트롤러 command : " + command);
		
		Action action = null;

		switch(command) {
		// 승현
		case "soomgo_mypage": action = new SoomgoMypageAction(); break;
		case "market_list": action = new MarketProductListAction(); break;
		case "market_detail": action = new MarketProductDetailAction(); break;
		case "market_reserve": action = new MarketProductReserveAction(); break;
		case "reserve_complete": action = new MarketProductReserveCompleteAction(); break;
		
		// 용준
		case "main_page" : action = new MainPageAction(); break;							// 숨고 메인화면으로 이동
		case "post_main_list" : action = new CommuMainListAction(); break;					// 커뮤 전체 화면으로 이동
		case "post_list" : action = new PostListAction(); break;							// 게시글 리스트 화면으로 이동 (고수에게 묻다, 함께해요, 고수광장 등)
		case "post_detail" : action = new PostDetailAction(); break;						// 상세 게시글 화면으로 이동
		case "post_delete" : action = new PostDeleteAction(); break;						// 게시글 삭제
		case "post_write" : action = new PostWriteFormAction(); break;	// 수정필요					// 게시글 작성 화면으로 이동
		case "post_write_action" : action = new PostWriteAction(); break;					// 게시글 작성 후 상세 페이지로 이동 추후 제거 예정( 파일 업로드 때문에)
		case "post_update_form" : action = new PostUpdateFormAction(); break;				// 게시글 수정 화면으로 이동
		case "post_update_action" : action = new PostUpdateAction(); break;					// 게시글 수정 후 화면으로 이동  -> 추후 제거 예정(파일 업로드 떄문에)
		case "post_soomgo_story_list" : action = new PostSoomgoStoryAction(); break;		// 숨고이야기 게시글  리스트로 이동
		case "gosu_knowhow_list" : action = new GosuKnhListAction(); break;					// 고수 노하우 게시글 리스트로 이동
		case "gosu_knowhow_detail" : action = new GosuKnhDetailAction(); break;				// 고수 노하우 상세 게시글 화면으로 이동
		case "gosu_knowhow_write_form" : action = new GosuKnhWriteFormAction(); break;		// 고수노하우 글쓰기 화면으로 이동
		
		// 영현
		case "gosu_profile_detail" : action = new GosuProfileDetailAction(); break;
		case "gosu_zim" : action = new GosuZimAction(); break;
		case "gosu_join" : action = new GosuJoinAction(); break;
		case "users_join" : action = new UserJoinAction(); break;
		case "users_Login" : action = new LoginAction(); break;
		case "soomgo_header" : action = new HeaderAction(); break;
		
		// 민기
		case "category_list": action = new CategoryServiceListAction(); break;
		case "request_select" : action = new RequestSelectAction(); break;
		case "estimate_list" : action = new EstimateListAction(); break;
		case "estimate_chat" : action = new EstimateChatAction(); break;
		case "region_list" : action = new RegionListAction(); break;
		case "region_select" : action = new RequestSelectAction(); break;
		}
		
		action.execute(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}


}










