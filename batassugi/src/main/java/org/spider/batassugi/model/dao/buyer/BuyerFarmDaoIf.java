package org.spider.batassugi.model.dao.buyer;

import java.util.List;
import org.spider.batassugi.model.vo.buyer.RentVo;


/**
 * 구매자가 자신이 대여한 농지 데이터를 접근하는 영속성 계층입니다.
 * 
 * @title 밭아쓰기
 * @packagename : org.spider.batassugi.model.dao.buyer
 * @filename : BuyerFarmDaoIf.java
 * @author : "SL SangUk Lee"
 * @since : 2018. 5. 18.
 * @version : 1.0
 * @see
 * 
 *      <pre>
 * == Modification Information ==
 * 
 * Date         AUTHOR           NOTE
 * -----------  -------------    --------------------------------
 * 2018. 5. 18.  "SL SangUk Lee"    최초작성
 * 2018. 5. 19.  "SL SangUk Lee"    findRentFarmInfoById 메서드 추가
 *      </pre>
 */
public interface BuyerFarmDaoIf {

  /**
   * 구매자가 대여한 농지정보 조회 메서드.
   * 
   * @author "SL SangUk Lee"
   * @param id 세션에 저장된 사용자 아이디.
   * @return List
   */
  public List<RentVo> findRentFarmInfoById(String id);

  /**
   * 구매자가 신청한 농지대여를 취소하는 메서드.
   * 
   * @author "SL SangUk Lee"
   * @param rentNo 대여신청번호.
   */
  public void deleteRentByRentNo(int rentNo);
}
