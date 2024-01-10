package kr.or.onesome.security;

import kr.or.onesome.admin.mapper.AdminMapper;
import kr.or.onesome.franchise.mapper.FranchiseOwnerMapper;
import kr.or.onesome.member.mapper.MemberMapper;
import kr.or.onesome.vo.AdminVO;
import kr.or.onesome.vo.FranchiseOwnerVO;
import kr.or.onesome.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.validator.GenericValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Slf4j
@Service
public class CustomUserDetailService implements UserDetailsService {

    @Autowired
    AdminMapper adminMapper;

    @Autowired
    FranchiseOwnerMapper franchiseOwnerMapper;

    @Autowired
    MemberMapper memberMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        //입력받은 username이 이메일 형태인지 검사
        if (GenericValidator.isEmail(username)){
            AdminVO adminVO = adminMapper.adminDetail(username);
            FranchiseOwnerVO ownerVO = franchiseOwnerMapper.frcsOwDetail(username);

            //어드민 계정으로 로그인시
            if (adminVO != null){
                return new CustomUser(adminVO);
            }else if (ownerVO != null){ //가맹점주 계정으로 로그인시
                return new CustomUser(ownerVO);
            }
        }else {
            MemberVO memberVO = memberMapper.memDetail(username);
            if (memberVO != null) return new CustomUser(memberVO);
        }

        return null;
    }

}
