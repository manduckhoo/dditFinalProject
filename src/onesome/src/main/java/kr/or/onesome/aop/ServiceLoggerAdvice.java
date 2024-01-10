package kr.or.onesome.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@Aspect
public class ServiceLoggerAdvice {

	// AOP대상(로그, 보안, 트랜잭션, 에러)
    // 포인트컷에 포함된 메서드를 대상으로 그 메서드가 실행되기 전에 로그를 출력
	@Before("execution(* kr.or.onesome.*..*(..))")
	public void startLog(JoinPoint jp) {
		log.info("startLog");

		// .getSignature() : 어떤 클래스의 어떤 메서드가 실행되었는지 보여줌. 파라미터 타입은 무엇인지 보여줌
		log.info("startLog: " + jp.getSignature());

		// .getArgs() : 전달 된 파라미터 정보를 보여줌
		log.info("startLog: " + Arrays.toString(jp.getArgs()));

	}
	// AfterReturning 어드바이스
	// 조인 포인트(메서드)가 정상적으로 종료한 후에 실행됨. 예외 발생 시 실행 안됨
	// execution -> public이던 private 이던 뭐던 상관없음
	@AfterReturning("execution(* kr.or.onesome.*..*(..))")
	public void logReturning(JoinPoint jp) {
		log.info("logreturning");

		// .getSignature() : 어떤 클래스의 어떤 메서드가 실행되었는지 보여줌.
	    // 파라미터 타입은 무엇인지 보여줌
		log.info("logReturning: " + jp.getSignature());

	}

	// After어드바이스
	// 조인 포인트 완료 후 실행. 예외 발생이 되더라도 항상 실행 됨
	@After("execution(* kr.or.onesome.*..*(..))")
	public void endLog(JoinPoint jp) {
		log.info("endLog");
		// .getSignature() : 어떤 클래스의 어떤 메서드가 실행되었는지 보여줌. 파라미터 타입은 무엇인지 보여줌
		log.info("endLog : " + jp.getSignature());
		// .getArgs() : 전달 된 파라미터 정보를 보여줌
		log.info("endLog : " + Arrays.toString(jp.getArgs()));
	}

	// ProceedingJoinPoint : around 어드바이스에서 사용함
	// 횡단관심사 - 포인트컷 대상 core메소드 - 횡단관심사
	// 스프링프레임워크가 컨트롤 하고 있는 비즈니스로직 호출을 가로챔. 책임이 around 어드바이스로 전가됨
	// 제어권을 스프링한테 받고 다 한 후에 다시 제어권을 스프링에게 줌
	// 그래서 비즈니스 메소드에 대한 정보를 around 어드바이스 메소드가 가지고 있어야 하고
	// 그 정보를 스프링 컨테이너가 around 어드바이스 메소드로 넘겨주면
	// ProceedingJoingPoint 객체로 받아서 around 어드바이스가 컨트롤 시 활용함
	@Around("execution(* kr.or.onesome.*..*(..))")
	public Object timeLog(ProceedingJoinPoint pjp) throws Throwable {

		// 메소드 실행 직전 시간 체킹
		long startTime = System.currentTimeMillis();
		log.info("pjpStart : " + Arrays.toString(pjp.getArgs()));

		// 메소드 실행
		Object result = pjp.proceed();

		// 메소드 실행 직후 시간 체킹
		long endTime = System.currentTimeMillis();
		log.info("pjpEnd : " + Arrays.toString(pjp.getArgs()));

		// 직후 시간 - 직전 시간 => 메소드 실행 시간
		log.info(pjp.getSignature().getName() + " : " + (endTime - startTime));

		return result;
	}
}








