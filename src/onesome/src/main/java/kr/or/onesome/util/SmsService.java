package kr.or.onesome.util;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@Service
public class SmsService {

    @Autowired
    DefaultMessageService messageService;
    @Autowired
    String smsSenderNo;
    @Autowired
    RandomNumberGenerator generator;

    public SingleMessageSentResponse sendSmsCode(String recipientNumber, String code) {
        Message message = new Message();

        message.setFrom(smsSenderNo);
        message.setTo(recipientNumber);

        String content = "안녕하세요 Onesome place 입니다.\n" +
                "인증번호는 [ " + code + " ] 입니다. ^_^";
        message.setText(content);


        return messageService.sendOne(new SingleMessageSendingRequest(message));
    }

}
