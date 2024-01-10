package kr.or.onesome.member;

import kr.or.onesome.member.service.MemberService;
import kr.or.onesome.util.RandomNumberGenerator;
import kr.or.onesome.util.SmsService;
import kr.or.onesome.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

@Slf4j
@RequestMapping("/mem")
@RestController
public class MemberAjaxController {

    @Autowired
    MemberService memberService;

    @Autowired
    RandomNumberGenerator generator;

    @Autowired
    SmsService smsService;

    @PostMapping("/codeVerification")
    public Map<String, String> codeVerification(@RequestBody Map<String, String> inputMap,
                                                HttpServletRequest request){
        String code = inputMap.get("inputCode");
        log.warn("code : " + code);

        HttpSession session = request.getSession();
        String sendedCode = (String) session.getAttribute("smsCode");

        Map<String, String> result = new HashMap<>();

        if (code.equals(sendedCode)){
            result.put("rst", "ok");
        }else {
            result.put("rst", "fail");
        }

        return result;
    }

    @PostMapping("/phoneAuthentication")
    public Map<String, String> phoneAuthentication(@RequestBody MemberVO memberVO, HttpServletRequest request){
        log.warn("memberVO : " + memberVO);

        Map<String, String> result = new HashMap<>();

        int cnt = memberService.duplicateTelCheck(memberVO);

        if (cnt > 0){
            result.put("rst", "fail");
            result.put("msg", "이미 가입된 전화번호입니다.");
        }else {
            String code = generator.codeGeneration(8, false);
            SingleMessageSentResponse sentResponse = smsService.sendSmsCode(memberVO.getMemTel(), code);
            if (sentResponse != null){
                log.warn("sentResponse : " + sentResponse);
                HttpSession session = request.getSession();
                session.setAttribute("smsCode", code);
                session.setMaxInactiveInterval(180);

                result.put("rst", "ok");
                result.put("msg", "발송완료");
            }else {
                result.put("rst", "fail");
                result.put("msg", "발송실패.");
            }
        }
        return result;
    }

    @PostMapping("/idAvailabilityCheck")
    public Map<String, String> idAvailabilityCheck(@RequestBody MemberVO memberVO) {

        log.warn("memId : " + memberVO.getMemId());

        Map<String, String> result = new HashMap<>();

        if (!Pattern.matches("^[a-zA-Z0-9]*$", memberVO.getMemId())) {
            result.put("rst", "fail");
            result.put("msg", "ID에는 특수문자 사용이 불가능 합니다.");
            return result;
        }

        if (!Pattern.matches("^(?=.*[0-9])[a-zA-Z0-9]{4,20}$", memberVO.getMemId())) {
            result.put("rst", "fail");
            result.put("msg", "ID는 알파벳과 숫자를 포함하여 4~20글자 입니다.");
            return result;
        } else {
            int cnt = memberService.duplicateMemberCheck(memberVO);
            if (cnt > 0) {
                result.put("rst", "fail");
                result.put("msg", "이미 사용 중인 아이디입니다.");
            }else {
                result.put("rst", "ok");
                result.put("msg", "사용 가능한 아이디입니다.");
            }
            return result;
        }
    }
}
