package org.spider.batassugi.model.service.seller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.annotation.Resource;
import org.spider.batassugi.model.dao.common.PathInfo;
import org.spider.batassugi.model.dao.seller.RecruitDaoIf;
import org.spider.batassugi.model.dao.seller.SellerFarmDaoIf;
import org.spider.batassugi.model.vo.common.CropsVo;
import org.spider.batassugi.model.vo.common.PagingBean;
import org.spider.batassugi.model.vo.seller.FarmVo;
import org.spider.batassugi.model.vo.seller.ListVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

/**
 * 판매자의 농지를 등록 및 수정하는 서비스와 농지를 대여중인 구매자들을 관리하는 서비스입니다.
 * 
 * @title 밭아쓰기
 * @packagename : org.spider.batassugi.model.service.seller
 * @filename : SellerFarmService.java
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
 * 2018. 5. 17.  "GL SangKyoung"    밭등록 farmInsert 메소드 생성.
 *      </pre>
 */
@Service
public class SellerFarmService implements SellerFarmServiceIf, PathInfo {

  @Resource
  private SellerFarmDaoIf sellerFarmDao;
  
  @Resource
  private RecruitDaoIf recruitDao;

  @Transactional
  @Override
  public void farmInsert(FarmVo fvo) {
    fvo.getMemberInfoVo().setId(fvo.getMemberInfoVo().getMemberVo().getId());
    sellerFarmDao.farmInsert(fvo);
    Map<String, Integer> testmap = new HashMap<String, Integer>();
    testmap.put("farm_no", fvo.getFarmNo());
    for (int i = 0; i <= fvo.getCropsNo().size() - 1; i++) {
      testmap.put("crops_no", Integer.parseInt(fvo.getCropsNo().get(i)));
      sellerFarmDao.avaliableCrops(testmap);// 밭등록시 선택한 작물에 번호를 가지고 작물등록dao
    }
  }

  @Transactional
  @Override
  public List<FarmVo> findSellerFarmList(String id) {
    List<FarmVo> farmList = sellerFarmDao.findSellerFarmList(id);
    for (int i = 0; i < farmList.size(); i++) {
      List<CropsVo> cropsList = sellerFarmDao.findAvailableCropsList(farmList.get(i).getFarmNo());
      farmList.get(i).setCropsVo(cropsList);
      List<String> labels = sellerFarmDao.findLabels(farmList.get(i).getFarmNo());
      farmList.get(i).setLabels(labels);
    }
    return farmList;
  }

  @Transactional
  @Override
  public Map<String, Object> findFarmDetail(String farmNo) {
    Map<String, Object> map = new HashMap<String, Object>();
    FarmVo vo = sellerFarmDao.findFarmDetail(farmNo);
    vo.setLabels(sellerFarmDao.findLabels(Integer.parseInt(farmNo)));
    vo.setCropsVo(sellerFarmDao.findAvailableCropsList(Integer.parseInt(farmNo)));
    
    map.put("canRecruitSize", recruitDao.findRestFarmSizeByFarmNo(farmNo));//모집 가능한 크기
    map.put("recruitSize",sellerFarmDao.findRecruitSizeByFarmNo(farmNo));//모집중인 크기
    map.put("rentSize", sellerFarmDao.findRentSizeByFarmNo(farmNo));//대여중인 크기
    map.put("farmVo", vo);
    map.put("rentList", sellerFarmDao.findRentByFarmNo(farmNo));

    return map;

  }

  @Override
  public List<CropsVo> getCropsData() {
    List<CropsVo> list = sellerFarmDao.getCropsData();
    return list;
  }

  @Override
  public String getNow_Date() {
    return sellerFarmDao.getNow_Date();

  }

  @Transactional
  @Override
  public ListVo findRecruitListByFarmNo(String farmNo, String nowPage) {
    ListVo listVo = new ListVo();
    int totalCount = sellerFarmDao.getTotalRentListByFarmNo(farmNo);
    if (nowPage == null) {
      listVo.setPb(new PagingBean(totalCount));
    } else {
      listVo.setPb(new PagingBean(Integer.parseInt(nowPage), totalCount));
    }
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("farmNo", farmNo);
    map.put("pagingBean", listVo.getPb());

    listVo.setRentList(sellerFarmDao.findRentPagingList(map));

    return listVo;

  }

  @Transactional
  @Override
  public Object findBuyerDetailByRentNo(String rentNo) {
    Map<String, String> map = sellerFarmDao.findBuyerDetailByRentNo(rentNo);

    int harvest = Integer.parseInt(String.valueOf(map.get("HARVESTSTATUS")));
    map.remove("HARVESTSTATUS");

    if (harvest < 25) {
      harvest = 1;
    } else if (harvest < 50) {
      harvest = 2;
    } else if (harvest < 75) {
      harvest = 3;
    } else {
      harvest = 4;
    }

    String harv = String.valueOf(harvest);
    map.put("HARVESTSTATUS", harv);

    return map;
  }

  @Override
  public String farmImg(FarmVo fvo) throws IllegalStateException, IOException {
    MultipartFile multifile = fvo.getFile();
    String filename = multifile.getOriginalFilename();
    String fileSavePath = Image_PATH + "\\farm_photo\\";
    UUID uu = UUID.randomUUID();
    File f = new File(fileSavePath + uu + "_" + filename);
    multifile.transferTo(f);
    return f.getName();
  }


}
