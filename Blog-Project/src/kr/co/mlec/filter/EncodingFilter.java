package kr.co.mlec.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

@WebFilter(urlPatterns= {"*"},
			initParams= {@WebInitParam(name="encoding", value="utf-8")})
public class EncodingFilter implements Filter{
	
	private FilterConfig config;

	@Override
	public void destroy() {
		System.out.println("filter 종료");		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {		
		System.out.println("filter 작업 시작");
		
		String charset = config.getInitParameter("encoding");
		request.setCharacterEncoding(charset);
		
//		request.setCharacterEncoding("utf-8");
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		System.out.println("filter 초기화");
		this.config = config;
	}
	
	
	
}
