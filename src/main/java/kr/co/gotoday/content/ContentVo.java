package kr.co.gotoday.content;

import java.sql.Timestamp;
import java.util.List;

<<<<<<< HEAD:src/main/java/kr/co/gotoday/content/ContentVo.java
public class ContentVo {
=======
import lombok.Data;
@Data
public class ContentVO {
>>>>>>> 0390013b8e1b2684066cc3fcdd2ac2cf330cdd34:src/main/java/kr/co/gotoday/content/ContentVO.java
	private int content_id;
    private String contentkind;
    private String category;
    private String location;
    private String title;
    private String description;
    private String reservation_type;
<<<<<<< HEAD:src/main/java/kr/co/gotoday/content/ContentVo.java
    private Timestamp start_at;
    private Timestamp end_at;
=======
    private String start_at;
    private String  end_at;
>>>>>>> 0390013b8e1b2684066cc3fcdd2ac2cf330cdd34:src/main/java/kr/co/gotoday/content/ContentVO.java
    private int adult_price;
    private int teen_price;
    private int child_price;
    private String main_image_path;
    private String detail_description;
    private Boolean is_active;
    private Boolean is_delete;
    private String content_time;
    private String instagram_url;
    private String x_url;
    private int admin_id;
    private String content_status;
    private List<ContentScheduleVO> contentScheduleList;
<<<<<<< HEAD:src/main/java/kr/co/gotoday/content/ContentVo.java
=======
    private int user_id;
    private String place_tag;
    
    private int like_count;// 각 content에 대한 like수
    
    public String getReservationTypeLabel() {
        if (reservation_type == null) return "";

        switch (reservation_type) {
            case "true":
                return "사전 예매";
            case "false":
                return "현장 대기 ";
            default:
                return reservation_type; // 혹시 모를 값
        }
    }
    
    
    public String getContentKindName() {
    	if (content_kind == null) return "";
    	if(content_kind.equals("popup")) {
    		return "팝업";
    	}
    	else if( content_kind.equals("exhibition"))
    		return "전시";
    
    	return "";
    }
    
>>>>>>> 0390013b8e1b2684066cc3fcdd2ac2cf330cdd34:src/main/java/kr/co/gotoday/content/ContentVO.java
}
