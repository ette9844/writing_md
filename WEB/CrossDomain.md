### --> 요청하는 쪽에서 프록시 서블릿을 만드는 것이 가장 좋은 방법이다.

ajax로 최종url을 데이터로 포함해 서블릿을 요청 후
```
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/proxy")
public class ProxyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    
	    
		String strURL = request.getParameter("getURL");
		URL  url = new URL(strURL);
		URLConnection urlconnection = url.openConnection();
		urlconnection.setRequestProperty("CONTENT-TYPE","text/html"); 
	    BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(),"utf-8"));
	    String inputLine;
	    String buffer = "";
	    while ((inputLine = in.readLine()) != null){
		    out.print(inputLine.trim());
	     	buffer += inputLine.trim();
	    }
	    System.out.println("response : " + buffer);
	    in.close();
			}
}
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTgzNTUyMTg5OSwxMTI3ODQyMTcyXX0=
-->