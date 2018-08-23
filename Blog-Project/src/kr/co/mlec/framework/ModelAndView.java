package kr.co.mlec.framework;

import java.util.HashMap;
import java.util.Map;

/*
 *  Model	: 화면단(JSP)에서 사용할 데이터의 저장객체(request공유영역에 등록시킬 객체)
 *  View	: 응답할 JSP 정보 저장
 */
public class ModelAndView {
	
	private Map<String, Object> model;
	private String view;
	
	public ModelAndView() {
		model = new HashMap<>();
	}

	public ModelAndView(String view) {
		this();
		this.view = view;
	}

	public Map<String, Object> getModel() {
		return model;
	}

	public void setModel(Map<String, Object> model) {
		this.model = model;
	}

	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}
	
	public void addAttribute(String key, Object value) {
		model.put(key, value);
	}
	
}
