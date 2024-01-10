package kr.or.onesome.security;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;

@Slf4j
public class CustomNoOpPasswordEncoder implements PasswordEncoder {
    @Override
    public String encode(CharSequence rawPassword) {
        log.warn("befor encode : " + rawPassword);
        return rawPassword.toString();
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        log.warn("matches : " + rawPassword + " : " + encodedPassword);
        return rawPassword.toString().equals(encodedPassword);
    }
}
