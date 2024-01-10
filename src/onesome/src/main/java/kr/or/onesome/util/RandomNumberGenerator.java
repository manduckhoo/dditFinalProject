package kr.or.onesome.util;

import org.springframework.stereotype.Component;

import java.util.Random;

@Component
public class RandomNumberGenerator {

    /**
     * <p>랜덤한 난수를 생성하기 위한 메서드</p>
     * @param codeLength 생성될 난수의 길이
     * @param includesText 생성될 난수에 문자 포함 여부
     * @return 생성된 난수 문자열
     */
    public String codeGeneration(int codeLength, boolean includesText){
        Random rnd = new Random();
        StringBuilder buffer = new StringBuilder();

        //includesText가 true면 난수에 문자를 포함하여 생성함
        if (includesText) {
            for (int i = 0; i < codeLength; i++) {
                //랜덤으로 boolean값 생성 후 해당 값에 따라 숫자 및 알파벳을 난수에 추가
                if (rnd.nextBoolean()) {
                    buffer.append(rnd.nextInt(10)); // 1 ~ 10까지 숫자 생성
                } else {
                    buffer.append((char) (rnd.nextInt(26) + 97)); //알파벳 난수 생성
                }
            }
        }else {
            for (int i = 0; i < codeLength; i++) {
                buffer.append(rnd.nextInt(10));
            }
        }

        return buffer.toString();
    }
}
