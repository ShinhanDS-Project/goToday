package kr.co.gotoday.vendor;

public interface VendorMapper {
	
	int createContent(ContentVO contentVo);
	int createSchedule(ContentScheduleVO contentScheduleVO);
	List<ContentVO> selectContentList(Map<String, Object> param);
	ContentVO selectContentOne(Integer content_id);
	List<ContentScheduleVO> selectContentScheduleList(Integer content_id);
	int deleteContentSchedule(Integer content_id);
	int updateContent(ContentVO contentVO);
}
