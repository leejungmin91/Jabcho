<p><%@ page language="java" contentType="text/html; charset=EUC-KR"
		pageEncoding="EUC-KR"%>
	<%@ page import="org.apache.commons.lang3.StringUtils"%>
	<%@ page import="org.apache.http.impl.client.BasicResponseHandler"%>
	<%@ page import="org.apache.http.impl.client.DefaultHttpClient"%>
	<%@ page import="org.apache.http.client.methods.HttpGet"%>
	<%@ page import="org.apache.http.client.methods.HttpPost"%>
	<%@ page import="com.restfb.exception.FacebookOAuthException"%>
	<%@ page import="com.restfb.Parameter"%>
	<%@ page import="com.restfb.types.FacebookType"%>
	<%@ page import="com.restfb.DefaultFacebookClient"%>
	<%@ page import="com.restfb.FacebookClient"%>
	<%@ page import="com.restfb.types.*"%>
	<%@ page import="java.io.*"%>
	<%@ page import="org.json.*"%>
	<%@ page import="java.text.ParseException"%>
	<%@ page import="java.nio.charset.StandardCharsets"%>
	<%@page import="org.apache.log4j.*"%>
	<%!static Logger logger = Logger.getLogger("fbdata.jsp"); //log4j¸¦ À§ÇØ%>
	<%
		String appKey = "551330758343154";
		String appSecret = "87eea895171903c9f7c360ee7373aa8e";
		String code = request.getParameter("code");
		String errorReason = request.getParameter("error_reason");
		String error = request.getParameter("error");
		String errorDescription = request.getParameter("error_description");

		String accesstoken = "";
		String result = "";
		String result2 = "";
		String result3 = "";

		if (StringUtils.isNotEmpty(code)) {
			HttpGet get = new HttpGet(
					"https://graph.facebook.com/oauth/access_token"
							+ "?client_id="
							+ appKey
							+ "&client_secret="
							+ appSecret
							+ "&redirect_uri=http://localhost:8080/test/fbdata.do"
							+ "&code=" + code);
			DefaultHttpClient http = new DefaultHttpClient();
			result = http.execute(get, new BasicResponseHandler());

			accesstoken = result.substring(result.indexOf("=") + 1);
			logger.info(accesstoken);

			HttpGet get2 = new HttpGet(
					"https://graph.facebook.com/me?access_token="
							+ accesstoken);

			DefaultHttpClient http2 = new DefaultHttpClient();
			result2 = http2.execute(get2, new BasicResponseHandler());
			session.setAttribute("fbtoken", accesstoken);
			
			logger.info("result2 = " + result2);
			
			
		}
		String jsonData = "";

		BufferedReader br = null;
		try {
			String line;
			InputStream stream = new ByteArrayInputStream(
					result2.getBytes(StandardCharsets.UTF_8));
			br = new BufferedReader(new InputStreamReader(stream));
			while ((line = br.readLine()) != null) {
				jsonData += line + "\n";
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (br != null)
					br.close();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
		JSONObject json = new JSONObject(jsonData);
		session.setAttribute("session_id", json.getString("email"));
		session.setAttribute("session_fb_id", json.getString("id"));
		String email = json.getString("email");
		String name = json.getString("name");
		String gender = json.getString("gender");
	%>

	<!DOCTYPE html>
	<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>facebook</title>
</head>
<body>
	<form name="sendForm" method="post">
		<input type="hidden" name="name" value="<%=name%>"> <input
			type="hidden" name="email" value="<%=email%>"> <input
			type="hidden" name="gender" value="<%=gender%>">
	</form>
	<script type="text/javascript">
		
		document.sendForm.action = "http://localhost:8080/test/main.do";
		document.sendForm.submit();

		//window.open("about:blank", "_self").close();
	</script>

</body>
	</html>
</p>