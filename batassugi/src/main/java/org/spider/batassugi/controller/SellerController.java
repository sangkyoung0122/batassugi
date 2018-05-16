package org.spider.batassugi.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.spider.batassugi.model.service.seller.SellerFarmServiceIf;
import org.spider.batassugi.model.vo.common.MemberVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 판매자가 처리한 서비스와 뷰를 연결해주는 컨트롤러입니다.
 * 
 * @title 밭아쓰기
 * @packagename : org.spider.batassugi.controller
 * @filename : SellerController.java
 * @author : "PM KimYoungHo"
 * @since : 2018. 5. 14.
 * @version : 1.0
 * @see
 * 
 *      <pre>
 * == Modification Information ==
 * 
 * Date         AUTHOR           NOTE
 * -----------  -------------    --------------------------------
 * 2018. 5. 14.  "PM KimYoungHo"    최초작성
 *      </pre>
 */
@Controller
public class SellerController {
  
  @Resource
  private SellerFarmServiceIf sellerFarmService;
  
  /**
   * 판매자의 마이페이지로 이동하는데 사용하는 Controller입니다. 
   * 판매자 마이페이지로 이동할 경우 판매자의 현재 등록한 밭 정보들을 
   * 가져와야 하기 때문에 getSellerFarmList(id)를 호출합니다.
   * @author "PM KimYoungHo"
   * @param request request를 저장하는 객체입니다..
   * @param model farmList를 보내기 위한 객체입니다.
   * @return
   */
  @RequestMapping("sellerInfoView")
  public String sellerInfoView(HttpServletRequest request, Model model) {
    HttpSession session = request.getSession(false);
    MemberVo vo = (MemberVo)session.getAttribute("mvo");
    model.addAttribute("farmList", sellerFarmService.getSellerFarmList(vo.getId()));
    return "/infoTemplates/seller_info";
  }
}
