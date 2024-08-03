<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

/* MultipartRequest multi = new MultipartRequest(
		request,	// 요청 객체
		path,		// 파일이 저장될 절대 경로
		100*1024*1024,	// 파일최대크기 (ex, 100MB)
		"UTF-8", 	// 한글인코딩설정 --> 파일명 한글깨짐 방지
		new DefaultFileRenamePolicy()//기본적인 'rename 정책'
	// 여기까지 파일 저장 완료	
);	
 */		




/* 
//String desc = request.getParameter("desc"); (x) request.getParameter를 사용 못함 multipart로 폼태그 넘길시
String desc = multi.getParameter("desc");


System.out.println(filename);			// 서버에 저장된 이름  (db에 저장될 이름)
//System.out.println(fileOriginalName);	// 웹브라우저에서 선택한 이름
//System.out.println(fileSize);			//파일 사이즈(용량)

request.setAttribute("imgSrc", filename);  //다음페이ㅈㅣ로 값을 넘겨줌 키:밸류  (값을셋팅)
RequestDispatcher rd = request.getRequestDispatcher("Ex12FileUploadResult.jsp");
rd.forward(request, response); */
	
%>