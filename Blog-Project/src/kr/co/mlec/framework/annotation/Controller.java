package kr.co.mlec.framework.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;


@Target(ElementType.TYPE)
// TYPE으로 하면 클래스 위에 @Override 처럼 쓸 수 있음
@Retention(RetentionPolicy.RUNTIME)
// Controller 인식 기간
public @interface Controller {

}
