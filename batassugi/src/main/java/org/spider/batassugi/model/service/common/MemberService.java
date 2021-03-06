package org.spider.batassugi.model.service.common;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.annotation.Resource;
import org.spider.batassugi.model.dao.common.MemberDaoIf;
import org.spider.batassugi.model.dao.common.PathInfo;
import org.spider.batassugi.model.exception.LoginException;
import org.spider.batassugi.model.vo.common.CropsInfoVo;
import org.spider.batassugi.model.vo.common.CropsVo;
import org.spider.batassugi.model.vo.common.MemberInfoVo;
import org.spider.batassugi.model.vo.common.MemberVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

/**
 * 공통에서 회원부분을 처리하는 서비스입니다.
 * 
 * @title 밭아쓰기
 * @packagename : org.spider.batassugi.service.common
 * @filename : MembeerServiceImpl.java
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
 * 2018. 5. 15.  "DL KimJieun"    회원로그인을 위해 login 메소드 등록
 * 2018. 5. 15.  "PL_Seonhwa"     회원등록을 위해 registerImg(회원프로필사진 등록), register 메소드 등록
 * 2018. 5. 16.  "PL_Seonhwa"     회원가입시 아이디 닉네임 중복확인 메소드 추가
 * 2018. 5. 17.  "PL_Seonhwa"     회원가입시 회원상태, 기호작물 입력 메소드 추가
 *                                로그인시 멤버 기호작물 리스트에 넣어주기
 *                                회원정보 수정 처리
 *      </pre>
 */
@Service
public class MemberService implements MemberServiceIf, PathInfo {

  @Resource
  private MemberDaoIf memberDao;

  @Override
  public MemberInfoVo login(MemberVo vo) throws LoginException {
    MemberVo memberVo = memberDao.findMemberById(vo.getId());
    String password = vo.getPassword();
    if (memberVo == null) {
      throw new LoginException("아이디가 존재하지 않습니다.");
    } else if (!password.equals(memberVo.getPassword())) {
      throw new LoginException("비밀번호가 다릅니다.");
    } else if (Integer.parseInt(memberVo.getState()) == 2) {
      throw new LoginException("3개월동안 활동이 중지된 회원입니다. 관리자에게 문의하세요.");
    } else if (Integer.parseInt(memberVo.getState()) == 3) {
      throw new LoginException("강제 탈퇴된 회원입니다.");
    }
    return memberDao.login(vo);
  }

//  @Override
//  public void registerMemberState(MemberStateVo mstVo) {
//    memberDao.registerMemberState(mstVo);
//  }

  @Override
  public String registerImg(MemberInfoVo vo) throws Exception, IOException {
    // MemberInfoVo의 파일을 multipartfile 형태로 저장
    MultipartFile multifile = vo.getFile();

    // 파일이름을 변형해서 저장하기 위한 작업
    // 원본의 이름을 가져옴
    String filename = multifile.getOriginalFilename();

    // 저장할 위치를 지정
    String fileSavePath = Image_PATH + "\\profile_img\\";

    // 이름에 현재 날짜를 붙이자
    // String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());
    // 파일 이름에 난수 붙이기
    UUID uu = UUID.randomUUID();

    // 새로운 이름으로 파일저장
    File f = new File(fileSavePath + uu + "_" + filename);

    // 저장된 경로에 파일 생성
    multifile.transferTo(f);
    return f.getName();
  }

  @Override
  @Transactional
  public void register(MemberInfoVo vo, String[] likeCropsNo) {
    
    memberDao.registerBasic(vo);
    memberDao.registerExtend(vo);
    
    // 기호 작물 정보를 가져와서 기호작물을 넣어준다. 
    List<CropsVo> updateCrops = new ArrayList<CropsVo>();
    for (int i = 0; i < likeCropsNo.length; i++) {
      updateCrops.add(new CropsVo(likeCropsNo[i]));
    }
    vo.setLikeCrops(updateCrops);
    
    if (vo.getLikeCrops() != null) {
      List<CropsVo> likeCrops = vo.getLikeCrops();

      for (CropsVo crops : likeCrops) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("id", vo.getMemberVo().getId());
        map.put("crops", crops.getCropsNo());
        map.put("cropsName", crops.getCropsName());
        memberDao.registerLikeCrop(map);
      }
    }
  }

  @Override
  public String checkId(String id) {
    int number = memberDao.checkId(id);
    if (number == 0) {
      return "ok";
    }
    return "fail";
  }

  @Override
  public String checkNickname(String nickname) {
    int number = memberDao.checkNickname(nickname);
    if (number == 0) {
      return "ok";
    }
    return "fail";
  }

  @Override
  public void findLikeCropsById(MemberInfoVo mvo) {
    // 작물 갯수 확인
    int cropsNumber = memberDao.findCropsCountById(mvo);

    // 없으면 셋팅 안함, 있으면 List형태로 넣어줌
    if (cropsNumber > 0) {
      List<CropsVo> cropsList = memberDao.findLikeCropsById(mvo);
      mvo.setLikeCrops(cropsList);
    }
  }

  @Override
  @Transactional
  public MemberInfoVo updateMemberInfo(MemberInfoVo uvo, String[] likeCropsNo) {
    // 1. 기존회원정보 가져오기
    MemberInfoVo orgVo = memberDao.findMemberInfoById(uvo.getMemberVo().getId());

    // 2. 패스워드 없으면 기존 password를 uvo에 넣어줌
    if (uvo.getMemberVo().getPassword().length() < 1) {
      uvo.getMemberVo().setPassword(orgVo.getMemberVo().getPassword());
    }

    // 3. 사진 정보가 없으면 Img에 기존 경로 넣어주고, 있으면 등록 후 새 경로를 넣어준다.
    if (uvo.getFile().getOriginalFilename().length() < 1) {
      uvo.setImage(orgVo.getImage());
    } else {
      try {
        String path = registerImg(uvo);
        uvo.setImage(path);
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
    
    // 기호 작물 정보를 가져와서 기호작물을 넣어준다. 
    List<CropsVo> updateCrops = new ArrayList<CropsVo>();
    for (int i = 0; i < likeCropsNo.length; i++) {
      updateCrops.add(new CropsVo(likeCropsNo[i]));
    }
    uvo.setLikeCrops(updateCrops);
    
    // 4. DB에 정보 update
    memberDao.updateMember(uvo.getMemberVo());
    memberDao.updateMemberInfo(uvo);
    
    // - 기존 작물이 없고, 새로운 작물이 있으면 추가
    if (uvo.getLikeCrops() != null) {
      // - 기존 작물 지움
      memberDao.deleteLikeCrops(orgVo.getMemberVo().getId());
      // - 새로운 작물 등록
      List<CropsVo> likeCrops = uvo.getLikeCrops();
      for (CropsVo crops : likeCrops) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("id", uvo.getMemberVo().getId());
        map.put("crops", crops.getCropsNo());
        map.put("cropsName", crops.getCropsName());
        memberDao.registerLikeCrop(map);
      }
    }
    MemberInfoVo memberInfoVo = memberDao.login(uvo.getMemberVo());
    return memberInfoVo;
  }

  @Override
  public List<CropsInfoVo> getAllCropsList() {
    List<CropsInfoVo> list = memberDao.getAllCropsList();
    return list;
  }

  @Override
  public MemberInfoVo updateMemberInfo(MemberInfoVo uvo) {
    return null;
  }

  @Override
  public void register(MemberInfoVo vo) {}

}
