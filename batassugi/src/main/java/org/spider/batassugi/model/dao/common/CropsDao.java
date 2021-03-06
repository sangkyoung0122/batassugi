package org.spider.batassugi.model.dao.common;

import java.util.List;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.spider.batassugi.model.vo.common.CropsInfoVo;
import org.springframework.stereotype.Repository;

/**
 * 모든 회원과 비회원이 작물사전을 볼 수 있도록 작물 데이터를 가져오는 영속성 계층입니다.
 * 
 * @title 밭아쓰기
 * @packagename : org.spider.batassugi.dao.common
 * @filename : CropsDao.java
 * @author : "Team Spider"
 * @since : 2018. 5. 12.
 * @version : 1.0
 * @see
 * 
 *      <pre>
 * == Modification Information ==
 * 
 * Date         AUTHOR           NOTE
 * -----------  -------------    --------------------------------
 * 2018. 5. 12.  "Team Spider"    최초작성
 * 2018. 5. 16.  "DL KimJieun"      getCropsIconList() 메소드 추가
 *      </pre>
 */
@Repository
public class CropsDao implements CropsDaoIf {
  @Resource
  private SqlSessionTemplate template;

  @Override
  public List<CropsInfoVo> getCropsIconList() {
    return template.selectList("crops.getIconList");
  }

  @Override
  public CropsInfoVo getCropsDetail(String cropsNo) {
    return template.selectOne("crops.getCropsDetail", cropsNo);
  }
}
