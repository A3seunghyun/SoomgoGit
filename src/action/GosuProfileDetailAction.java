package action;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.Gosu_profileDao;
import dto.*; // DTO 클래스들이 위치한 패키지에 따라 수정 필요

public class GosuProfileDetailAction implements Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int users_idx = -1;
        
        try {
        	users_idx = Integer.parseInt(request.getParameter("users_idx"));
            System.out.println("유저 idx : " + users_idx);
            
            // 인덱스가 null일 경우 예외 처리
//            if (usersIdx == null) {
//            	  throw new NumberFormatException("유효하지 않은 사용자 인덱스입니다.");            }
        } catch (Exception e) {
            // 예외 발생 시 콘솔에 출력
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "유효하지 않은 사용자 인덱스입니다.");
            return; // 예외 발생 시 더 이상 진행하지 않음
        }

        // 각종 정보를 DAO를 통해 조회
        ArrayList<Gosu_profile_member_inforDto> mdto = null;
        ArrayList<Gosu_profile_header_inforDto> hidto = null;
        ArrayList<Gosu_profile_countDto> cdto = null;
        ArrayList<Gosu_profile_transaction_countDto> tcdto = null;
        ArrayList<Gosu_profile_explainDto> edto = null;
        ArrayList<Gosu_profile_service_plus_titleDto> spdto = null;
        ArrayList<Gosu_profile_career_yearDto> cydto = null;
        ArrayList<Gosu_profile_careerDto> pcdto = null;
        ArrayList<Gosu_profile_portfolio_outterDto> podto = null;
        ArrayList<Gosu_profile_photo_videoDto> pvdto = null;
        ArrayList<Gosu_profile_reviewDto> rdto = null;
        ArrayList<Gosu_profile_qna_answerDto> qadto = null;
        ArrayList<Gosu_profile_ReservationDto> prdto = null;
        
        Gosu_profileDao gpDao = new Gosu_profileDao();
        
        try {
//            int users_idx = Integer.parseInt(usersIdx); // String을 int로 변환

            mdto = gpDao.getGosuprofileMember(users_idx);
            hidto = gpDao.getGosuprofileHeader(users_idx); 
            cdto = gpDao.getGosuprofileCount(users_idx);
            tcdto = gpDao.getGosuprofileTransactionCount(users_idx);
            edto = gpDao.getGosuprofileExplain(users_idx);
            spdto = gpDao.getGosuprofileServicePlus(users_idx);
            cydto = gpDao.getGosuprofileCareerYear(users_idx);
            pcdto = gpDao.getGosuprofileCareer(users_idx);
            podto = gpDao.getGosuprofilePortfolioOutter(users_idx);
            pvdto = gpDao.getGosuprofilePhotoVideo(users_idx);
            rdto = gpDao.getGosuprofileReview(users_idx);
            qadto = gpDao.getGosuprofileQnaAnswer(users_idx);
            prdto = gpDao.getGosuprofileReservation(users_idx);
        } catch (Exception e) {
            // 예외 발생 시 콘솔에 출력
            e.printStackTrace();
        }

        // 조회한 데이터를 request에 저장
        request.setAttribute("mdto", mdto);
        request.setAttribute("hidto", hidto);
        request.setAttribute("cdto", cdto);
        request.setAttribute("tcdto", tcdto);
        request.setAttribute("edto", edto);
        request.setAttribute("spdto", spdto);
        request.setAttribute("cydto", cydto);
        request.setAttribute("pcdto", pcdto);
        request.setAttribute("podto", podto);
        request.setAttribute("pvdto", pvdto);
        request.setAttribute("rdto", rdto);
        request.setAttribute("qadto", qadto);
        request.setAttribute("prdto", prdto);

        // 결과를 보여줄 JSP 페이지로 포워딩
        request.getRequestDispatcher("Gosu.profile.p.jsp").forward(request, response);
    }
}