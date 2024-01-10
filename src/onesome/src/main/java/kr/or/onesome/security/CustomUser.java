package kr.or.onesome.security;

import kr.or.onesome.vo.AdminVO;
import kr.or.onesome.vo.FranchiseOwnerVO;
import kr.or.onesome.vo.MemberVO;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;
import java.util.stream.Collectors;

public class CustomUser extends User {
    private AdminVO adminVO;
    private FranchiseOwnerVO ownerVO;
    private MemberVO memberVO;

    public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }

    public CustomUser(AdminVO adminVO) {
        super(adminVO.getAdminEmail(), adminVO.getAdminPw(),
                adminVO.getAdminAuthVOList().stream()
                        .map(auth -> new SimpleGrantedAuthority(auth.getAdminAuthCd()))
                        .collect(Collectors.toList()));

        this.adminVO = adminVO;
    }

    public CustomUser(FranchiseOwnerVO ownerVO) {
        super(ownerVO.getFrcsOwnrEmail(), ownerVO.getFrcsOwnrPw(),
                ownerVO.getFranchiseOwnerAuthVOList().stream()
                        .map(auth -> new SimpleGrantedAuthority(auth.getFrcsAuthCd()))
                        .collect(Collectors.toList()));

        this.ownerVO = ownerVO;
    }

    public CustomUser(MemberVO memberVO) {
        super(memberVO.getMemId(), memberVO.getMemPw(),
                memberVO.getMemberAuthVOList().stream()
                        .map(auth -> new SimpleGrantedAuthority(auth.getMemAuthCd()))
                        .collect(Collectors.toList()));

        this.memberVO = memberVO;
    }

    public AdminVO getAdminVO() {
        return adminVO;
    }

    public void setAdminVO(AdminVO adminVO) {
        this.adminVO = adminVO;
    }

    public FranchiseOwnerVO getOwnerVO() {
        return ownerVO;
    }

    public void setOwnerVO(FranchiseOwnerVO ownerVO) {
        this.ownerVO = ownerVO;
    }

    public MemberVO getMemberVO() {
        return memberVO;
    }

    public void setMemberVO(MemberVO memberVO) {
        this.memberVO = memberVO;
    }
}
