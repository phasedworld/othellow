package parkjieun.othellow.aspect;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;


@Aspect
@Component
public class LogAspect {
	private Logger logger;
	
	public LogAspect(){
		logger = LogManager.getLogger(LogAspect.class);
	}
	
	@Around("execution(* parkjieun.othellow.*.*(..))")
	public Object advice(ProceedingJoinPoint jp) throws Throwable{
		logger.info(jp.toShortString()+"시작");
		Object obj = jp.proceed();
		logger.info(jp.toShortString()+"끝");
		return obj;
	}
}
