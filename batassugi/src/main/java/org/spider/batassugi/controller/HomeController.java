package org.spider.batassugi.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.spider.batassugi.model.exception.LoginException;
import org.spider.batassugi.model.service.admin.AccuseServiceIf;
import org.spider.batassugi.model.service.common.MemberServiceIf;
import org.spider.batassugi.model.vo.admin.AccusePostVo;
import org.spider.batassugi.model.vo.common.MemberInfoVo;
import org.spider.batassugi.model.vo.common.MemberStateVo;
import org.spider.batassugi.model.vo.common.MemberVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 클래스 설명 : 공통내용을 담을 Controller입니다.
 * 
 * @title 밭아쓰기
 * @packagename : org.spider.batassugi.controller
 * @filename : HomeController.java
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
 * 2018. 5. 15.  "PL_Seonhwa"     회원가입 register 메소드 추가(이미지 파일업로드)
 * 2018. 5. 16.  "PL_Seonhwa"     회원가입 시 아이디, 닉네임 중복검사 메소드 추가
 * 2018. 5. 17.  "PL_Seonhwa"     회원가입, 로그인 메소드 로직 변경
 *                                로그인시 멤버 기호작물 리스트에 넣어주기
 *      </pre>
 */
@Controller
public class HomeController {
  @Resource
  private MemberServiceIf memberService;
  @Resource
  private AccuseServiceIf accuseService;
  
  /**
   * 기본 페이지로 이동.
   * 
   * @author "Team Spider"
   * @return String /로 접속시 home.tiles로 이동합니다.
   */
  @RequestMapping("/")
  public String home() {
    return "home.tiles";
  }

  /**
   * 디렉토리/페이지가 별도의 매핑이 없으면 같은이름에 tiles로 보냄.
   * 
   * @author "PL_Seonhwa"
   * @param dirName 해당 페이지가 존재하는 디렉토리.
   * @param viewName 이동하려는 페이지.
   * @return
   */
  @RequestMapping("{dirName}/{viewName}")
  public String showView(@PathVariable String dirName, @PathVariable String viewName) {
    return dirName + "/" + viewName + ".tiles";
  }

  /**
   * 로그인 후 MemberInfoVo를 세션에 넣음.
   * 
   * @author "PL_Seonhwa"
   * @param request 세션처리를 위해 request값을 가져옴.
   * @param model 로그인 중 에러시 에러 메세지 전송.
   * @param vo 로그인시 아이디 패스워드를 담은 객체.
   * @return
   */
  @RequestMapping("login")
  public String login(HttpServletRequest request, Model model, MemberVo vo) {
    try {
      HttpSession session = request.getSession();
      MemberInfoVo mvo = memberService.login(vo);
      //멤버 기호작물 List에 넣기
      memberService.findLikeCropsById(mvo);
      
      session.setAttribute("mvo", mvo);
      return "redirect:/";
    } catch (LoginException e) {
      model.addAttribute("message", e.getMessage());
      return "member/login_fail";
    }
  }



  /**
   * 회원가입 처리.
   * 
   * @author "PL_Seonhwa"
   * @param vo 회원가입시 입력한폼.
   * @return
   */
  @RequestMapping("register")
  public String register(@ModelAttribute("memberInfoVo") MemberInfoVo vo) {
    // 1. memberState등록
    MemberStateVo mstVo = new MemberStateVo(null, "활동", null);
    memberService.registerMemberState(mstVo);
    // - member상태번호를 셋팅
    vo.getMemberVo().setState(mstVo.getStateNumber());

    // 2. 프로필 이미지 업로드
    String path = "default.png";
    // - 업로드할 파일이 있다면 파일업로드
    if (vo.getFile() != null) {
      try {
        path = memberService.registerImg(vo);
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
    // - 이미지 처리 결과 경로를 vo에 넣음
    vo.setImage(path);
    // 3. DB에 데이터 적용
    memberService.register(vo);
    return "redirect:home/register_success";
  }


  /**
   * 로그아웃을 위한 메소드.
   * 
   * @author "DL KimJieun"
   * @param request 세션 설정을 위한 파라미터.
   * @return
   */
  @RequestMapping("logout")
  public String logout(HttpServletRequest request) {
    HttpSession session = request.getSession(false);
    if (session != null) {
      session.invalidate();
    }
    return "redirect:/";
  }

  /**
   * ajax로 회원가입시 아이디중복 체크.
   * 
   * @author "PL_Seonhwa"
   * @param id 회원가입 시도한 ID.
   * @return
   */
  @RequestMapping("checkId")
  @ResponseBody
  public Object checkId(String id) {
    return memberService.checkId(id);
  }


  /**
   * ajax로 회원가입시 닉네임 체크.
   * 
   * @author "PL_Seonhwa"
   * @param nickname 회원가입 시도한 닉네임.
   * @return
   */
  @RequestMapping("checkNickname")
  @ResponseBody
  public Object checkNickname(String nickname) {
    return memberService.checkNickname(nickname);
  }
  
  /**
   * 회원정보 등록폼으로 이동.
   * 
   * @author "PL_Seonhwa"
   * @param model
   * @return
   */
  @RequestMapping("registerView")
  public String getAllCropsList(Model model) {
    model.addAttribute("list", memberService.getAllCropsList());
    return "home/registerView.tiles";
  }
  

  @RequestMapping("accuse")
  public String registerAccuseInfo(AccusePostVo accusePostVo) {
    String path = "default.png";
    // - 업로드할 파일이 있다면 파일업로드
    if (accusePostVo.getFile() != null) {
      try {
        path = accuseService.registerImg(accusePostVo);
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
    // - 이미지 처리 결과 경로를 vo에 넣음
    accusePostVo.setAccuseProof(path);
    accuseService.registerAccuseInfo(accusePostVo);
    return "home/accuse_success.tiles";
  }
  
  @RequestMapping("home/accuse_board")
  public String getAllMemberList(Model model) {
   List<MemberInfoVo> list = accuseService.getAllMemberList();
   model.addAttribute("list", list);
  return "home/accuse_board.tiles";
 }
}
