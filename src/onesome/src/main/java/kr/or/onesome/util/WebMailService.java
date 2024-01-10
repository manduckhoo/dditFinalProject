package kr.or.onesome.util;

import kr.or.onesome.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Slf4j
@Service
public class WebMailService {

    @Autowired
    JavaMailSenderImpl mailSender;

    @Autowired
    RandomNumberGenerator generator;

    // 일반 회원이 회원가입 완료 후 환영 메일 발송
    public String sendWelcomeMail(MemberVO memberVO){
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);

        try {
            helper.setTo(memberVO.getMemMail());
            helper.setSubject("[Onesomeplace] 회원가입을 환영합니다.");

            String content = "<hr>\n" +
                    "<br>\n" +
                    "<p align=\"center\"> "+ memberVO.getMemNick() +" 님 원썸플레이스 회원가입을 환영합니다. </p>\n" +
                    "<br>\n" +
                    "<hr>";
            helper.setText(content, true);

            mailSender.send(message);
        } catch (MessagingException e) {
            log.error(e.getMessage());
            return "fail";
        }
        return "ok";
    }

    //인증번호를 이메일로 보내기 위한 메서드
    public String sendAuthenticationCode(String email){
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);

        String code = generator.codeGeneration(8, true);
        try {
            helper.setTo(email);
            helper.setText("[Onesomeplace] 인증코드를 확인해주세요.");

            String content = "<hr>\n" +
                    "<br>\n" +
                    "<p align=\"center\"> 인증코드 : <strong>"+ code +"</strong></p>\n" +
                    "<br>\n" +
                    "<hr>";
            helper.setText(content, true);

            mailSender.send(message);
        } catch (MessagingException e) {
            log.error(e.getMessage());
        }

        return code;
    }

    //점주계정 생성시 이메일로 보내기 위한 메서드
    public String createAccount(String email){
    	MimeMessage message = mailSender.createMimeMessage();
    	MimeMessageHelper helper = new MimeMessageHelper(message);
    	
    	String code = generator.codeGeneration(8, true);
    	try {
    		helper.setTo(email);
    		helper.setText("[Onesomeplace]의 가맹점주가 되신것을 환영합니다");
    		
    		String content = "<hr>\n" +
    				"<br>\n" +
    				"<p align=\"center\"> 로그인아이디 : <strong>"+ email +"</strong></p>\n" +
    				"<p align=\"center\"> 임시비밀번호 : <strong>"+ code +"</strong></p>\n" +
    				"<br>\n" +
    				"<hr>";
    		helper.setText(content, true);
    		
    		mailSender.send(message);
    	} catch (MessagingException e) {
    		log.error(e.getMessage());
    	}
    	
    	return code;
    }
}
