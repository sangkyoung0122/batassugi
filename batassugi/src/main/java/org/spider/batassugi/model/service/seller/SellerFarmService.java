package org.spider.batassugi.model.service.seller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.spider.batassugi.model.dao.seller.SellerFarmDaoIf;
import org.spider.batassugi.model.vo.common.CropsVo;
import org.spider.batassugi.model.vo.seller.FarmVo;
import org.springframework.stereotype.Service;

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
public class SellerFarmService implements SellerFarmServiceIf {
  @Resource
  private SellerFarmDaoIf sellerFarmDao;

  @Override
  public void farmInsert(FarmVo fvo) {

    List<CropsVo> cvo = new ArrayList<CropsVo>();
    sellerFarmDao.farmInsert(fvo);
    Map<String, Integer> testmap = new HashMap<String, Integer>();
    testmap.put("farm_no", fvo.getFarmNo());

    for (int i = 0; i <= fvo.getCropsNo().size() - 1; i++) {
      testmap.put("crops_no", Integer.parseInt(fvo.getCropsNo().get(i)));
      sellerFarmDao.avaliableCrops(testmap);// 밭등록시 선택한 작물에 번호를 가지고 작물등록dao
    }
  }

  @Override
  public List<FarmVo> getSellerFarmList(String id) {
    List<FarmVo> farmList = sellerFarmDao.getSellerFarmList(id);
    for (int i = 0; i < farmList.size(); i++) {
      List<CropsVo> cropsList = sellerFarmDao.getAvailableCropsList(farmList.get(i).getFarmNo()); 
      farmList.get(i).setCropsVo(cropsList);
    }
    return farmList;
  }

  @Override
  public Map<String,Object> findFarmDetail(String farmNo) {
    Map<String,Object> map = new HashMap<String, Object>();
    FarmVo vo = sellerFarmDao.findFarmDetail(farmNo);
    vo.setCropsVo(sellerFarmDao.getAvailableCropsList(Integer.parseInt(farmNo)));
    map.put("farmVo", vo);
    map.put("rentList", sellerFarmDao.findRentByFarmNo(farmNo));
    return map;
    
  }

  
}
