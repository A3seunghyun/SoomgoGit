package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import dao.EstimateDao;

@WebServlet("/EstimateAnswerServlet")
public class EstimateAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int userIdx;
	    int serviceIdx;
	    
	    // idx 가져오기
	    try {
	        userIdx = Integer.parseInt(request.getParameter("users_idx"));
	        serviceIdx = Integer.parseInt(request.getParameter("serviceIdx"));
	    } catch (NumberFormatException  e) {
	    	response.sendError(HttpServletResponse.SC_BAD_REQUEST, "idx 중 format 오류");
	        return;
	    }
	    
	    // 문자열 읽어오기
	    StringBuilder jsonAnswerBuilder = new StringBuilder();
	    try (BufferedReader reader = request.getReader()) {
	        String line;
	        while ((line = reader.readLine()) != null) {
	            jsonAnswerBuilder.append(line);
	        }
	    } catch(Exception e) {
	    	e.printStackTrace();
	    }
	    String jsonAnswerString = jsonAnswerBuilder.toString();
	    
	    // DB 저장하기
	    try {
	    	EstimateDao eDao = new EstimateDao();
			eDao.insertDataEstimate(userIdx, serviceIdx, jsonAnswerString);		
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		
	}
//        // Convert to JSONObject using json-simple
//        String jsonString = stringBuilder.toString();
//        JSONParser parser = new JSONParser();
//        JSONObject jsonObject = null;
//        try {
//            jsonObject = (JSONObject) parser.parse(new StringReader(jsonString));
//        } catch (ParseException e) {
//            e.printStackTrace();
//            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//            response.getWriter().write("Invalid JSON format");
//            return;
//        }
//
//        // Extract data from JSONObject
//        String key1 = (String) jsonObject.get("key1");
//        String key2 = (String) jsonObject.get("key2");
//
//        // Save data to Oracle DB
//        try {
//            saveToDatabase(key1, key2);
//            response.setStatus(HttpServletResponse.SC_OK);
//            response.getWriter().write("Data saved successfully");
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//            response.getWriter().write("Error saving data");
//        }
//        
//        
//    }
//	
//    private void saveToDatabase(String key1, String key2) throws Exception {
//        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl"; // Oracle JDBC URL
//        String dbUser = "soomgo";
//        String dbPassword = "soomgo";
//        
//        Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
//        
//        String sql = "INSERT INTO your_table (column1, column2) VALUES (?, ?)";
//        PreparedStatement statement = connection.prepareStatement(sql);
//        statement.setString(1, key1);
//        statement.setString(2, key2);
//        
//        statement.executeUpdate();
//        statement.close();
//        connection.close();
//    }

}
