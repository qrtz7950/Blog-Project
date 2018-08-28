package kr.co.mlec.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import kr.co.mlec.board.dao.BoardDAO;
import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.login.dao.LoginDAO;
import kr.co.mlec.login.service.LoginService;

/**
 * Application Lifecycle Listener implementation class ContextListener
 *
 */
@WebListener
public class ContextListener implements ServletContextListener {
	
	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent event)  { 
         // TODO Auto-generated method stub
    	System.out.println("리스너 종료");
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent event)  { 
    	System.out.println("리스너 시작");
    	
    	ServletContext sc = event.getServletContext();
    	
    	sc.setAttribute("boardDAO", new BoardDAO());
    	BoardDAO boardDao = new BoardDAO();
    	sc.setAttribute("boardService", new BoardService(boardDao));
    	
    	LoginDAO loginDao = new LoginDAO();
    	sc.setAttribute("loginService", new LoginService(loginDao));
    }
	
}
