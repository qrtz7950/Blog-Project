package kr.co.mlec.framework;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import kr.co.mlec.framework.annotation.RequestMapping;

/*
 * 	key   : uri
 *  value : controller + method 
 */

public class HandlerMapping {

	private Map<String, CtrlAndMethod> mappings;
	
	public HandlerMapping(String ctrlNames) throws Exception {
//		kr.co.mlec.board.control.BoardController|
//		kr.co.mlec.login.control.LoginController]
		
		mappings = new HashMap<>();
		
		String[] ctrls = ctrlNames.split("\\|");
		
		for(String ctrl : ctrls) {
			ctrl = ctrl.trim();
			Class<?> clz = Class.forName(ctrl);
			
			Object target = clz.newInstance();
			
			Method[] methods = clz.getMethods();
			for(Method method : methods) {
				RequestMapping reqAnno = method.getAnnotation(RequestMapping.class);
//				System.out.println(method + " : " + reqAnno);
				
				if(reqAnno != null) {
					String uri = reqAnno.value();
					mappings.put(uri, new CtrlAndMethod(target, method));
//					System.out.println("uri : " + uri);
//					System.out.println("instance object : " + target);
//					System.out.println("method : " + method);
					
				}
			}
		}
	}
	
	public CtrlAndMethod getCtrlAndMethod(String uri) {
		return mappings.get(uri);
	}
}