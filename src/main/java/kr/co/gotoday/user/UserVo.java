package kr.co.gotoday.user;

import java.sql.Timestamp;
import java.util.List;

<<<<<<< HEAD:src/main/java/kr/co/gotoday/user/UserVo.java
public class UserVo {
=======
import lombok.Data;
@Data
public class UserVO {
>>>>>>> 0390013b8e1b2684066cc3fcdd2ac2cf330cdd34:src/main/java/kr/co/gotoday/user/UserVO.java
	private int user_id;
    private String email;
    private int role; //0:유저 1:관리자
    private String password;
    private String login_type;
    private String name;
    private String gender;
    private String birthday;
    private Timestamp registered_at;
    private String phone_number;
    
    private List<UserTagVO> userTagList;
}
