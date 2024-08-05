<%@page import="dao.CommunityDao"%>
<%@page import="dao.CommuNoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	
// 	out.println("여기로와");
// 	로그인해서 댓글을 작성한 사람
	//int usersIdx = 22; // 21=YB. 22=최승현. 유저idx 일단 가정해서 (로그인되면 밑에 방식으로 바꾸기) -----> 댓글 작성자
	int usersIdx = (Integer)session.getAttribute("L_users_idx");
	
 	int postIdx = Integer.parseInt(request.getParameter("post_idx"));
	String contents = request.getParameter("contents");
	
	Integer parentIdx = null;

	CommunityDao pDao = new CommunityDao();
	int postUserIdx = pDao.getPostUserIdxFromPostIdx(postIdx);    // post의작성자userIdx
	int commentsIdx = pDao.commentWrite(postIdx, usersIdx, contents, parentIdx);   // 댓글idx

	// 댓글 인설트 될때 알림 추가
	CommuNoticeDao nDao = new CommuNoticeDao();
// 	int postUserIdx = pDao.getPostWriterUserIdxFromPostIdx(postIdx);  수정해야함 (메서드가 안만들어져 있음)
	//String estimateMessage = "@name@ 고수님이 @svc_name@ 견적을 보냈습니다";
	
	String postMessage = "게시글에 @name@님이 댓글을 남겼습니다";
	//String chatMessage = "@name@ 고수님이 채팅을 보냈습니다";
	nDao.noticeInsert(postUserIdx, postMessage, commentsIdx, null, null);
		// WRONG : (postIdx, postMessage, postIdx, null, null);  /* (postUserIdx, postMessage, postIdx, null, null); */
%>
<script>
	alert("댓글 등록 완료");
	location.href= "soomgoQnA_Post.jsp?post_idx=<%=postIdx%>";
	
</script>