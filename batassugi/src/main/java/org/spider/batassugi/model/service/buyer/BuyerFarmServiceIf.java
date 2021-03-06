package org.spider.batassugi.model.service.buyer;

import java.io.IOException;
import java.util.List;
import org.spider.batassugi.model.vo.buyer.ApplySellerVo;
import org.spider.batassugi.model.vo.buyer.RentVo;
import org.spider.batassugi.model.vo.common.MemberInfoVo;


/**
 * 반드시 마침표를 찍습니다.
 * @title 밭아쓰기
 * @packagename : org.spider.batassugi.model.service.buyer
 * @filename : BuyerFarmServiceIf.java
 * @author : "SL SangUk Lee"
 * @since : 2018. 5. 19.
 * @version : 1.0
 * @see 
 * 
 * <pre>
 * == Modification Information ==
 * 
 * Date          AUTHOR             NOTE
 * -----------   -------------      --------------------------------
 * 2018. 5. 19.  "SL SangUk Lee"    최초작성
 * 2018. 5. 19.  "SL SangUk Lee"    findRentFarmInfoById 메서드 추가
 * 2018. 5. 19.  "SL SangUk Lee"    deleteRentByRentNo 메서드 추가
 * 2018. 5. 20.  "SL SangUk Lee"    registerApplySeller 메서드 추가
 * 2018. 5. 20.  "SL SangUk Lee"    farmerDocument 메서드 추가
 * 2018. 5. 20.  "SL SangUk Lee"    findApplySellerById 메서드 추가
 * 2018. 5. 29.  "SL SangUk Lee"    updateMemberLevel 메서드 추가
 * </pre>
 */
public interface BuyerFarmServiceIf {

  /**
   * 구매자가 대여한 농지정보 조회 메서드.
   * 
   * @author "SL SangUk Lee"
   * @param mvo 구매자정보.
   * @return RentVo
   */
  public List<RentVo> findRentFarmInfoById(MemberInfoVo mvo);
  
  /**
   * 구매자가 신청한 농지대여를 취소하는 메서드.
   * 
   * @author "SL SangUk Lee"
   * @param rentVo 대여신청번호.
   */
  public void deleteRentByRentNo(RentVo rentVo);
  
  /**
   * 구매자에서 판매자신청하는 메서드.
   * 
   * @author "SL SangUk Lee"
   * @param applySellerVo 판매자신청에 필요한 Vo객체.
   */
  public void registerApplySeller(ApplySellerVo applySellerVo);

  /**
   * 농지정보 파일업로드 메서드.
   * @author "SL SangUk Lee"
   * @param applySellerVo 판매자신청 정보 Vo객체.
   * @return string
   * @throws Exception 파일업로드 exception 처리.
   * @throws IOException 파일업로드 exception 처리.
   */
  public String farmerDocument(ApplySellerVo applySellerVo) throws Exception, IOException;

  /**
   * 구매자가 판매자 신청한 정보를 조회하는 메서드.
   * 
   * @author "SL SangUk Lee"
   * @param id 세션에 저장된 아이디.
   * @return ApplySellerVo
   */
  public ApplySellerVo findApplySellerById(String id);

  /**
   * 여기에 설명을 쓰시오.
   * @author "SL SangUk Lee"
   * @param mvo 회원정보 객체.
   * @return
   */
  public String updateMemberLevel(MemberInfoVo mvo);
}
