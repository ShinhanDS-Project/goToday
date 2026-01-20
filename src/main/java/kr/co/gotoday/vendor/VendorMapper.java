package kr.co.gotoday.vendor;

public interface VendorMapper {
<<<<<<< HEAD

=======
	
	int createContent(ContentVO contentVo);
	int createSchedule(ContentScheduleVO contentScheduleVO);
	List<ContentVO> selectContentList(Map<String, Object> param);
	ContentVO selectContentOne(Integer content_id);
	List<ContentScheduleVO> selectContentScheduleList(Integer content_id);
	int deleteContentSchedule(Integer content_id);
	int updateContent(ContentVO contentVO);
>>>>>>> 0390013b8e1b2684066cc3fcdd2ac2cf330cdd34
}
