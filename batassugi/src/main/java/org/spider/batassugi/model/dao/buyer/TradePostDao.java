package org.spider.batassugi.model.dao.buyer;

import java.util.List;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.spider.batassugi.model.vo.buyer.BuyerPagingBean;
import org.spider.batassugi.model.vo.buyer.TradePostSearchVo;
import org.spider.batassugi.model.vo.buyer.TradePostVo;
import org.springframework.stereotype.Repository;

/**
 * 구매자가 거래 게시판의 데이터를(작성, 수정, 삭제, 검색) 접근하는 영속성 계층입니다.
 * 
 * @title 밭아쓰기
 * @packagename : org.spider.batassugi.dao.buyer
 * @filename : TradePostDao.java
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
 * 2018. 5. 12. "SL SangUk Lee"  최초작성
 * 2018. 5. 15  "SL SangUk Lee"  findPostList, getTotalPostCount, findTradePostDetailByNo 메서드 추가
 * 2018. 5. 15. "SM HyeonGil Kim" deleteTradePostByNo 메서드 추가
 * 2018. 5. 16. "SM HyeonGil Kim" updateTradePost, createTradePost 추가
 * 2018. 5. 17. "SM HyeonGil Kim" updateHitsTradePost 추가
 * 2018. 5. 28. "SM HyeonGil Kim" findtradePostBySearch 추가
 * 2018. 5. 28. "SM HyeonGil Kim" getTotalTradeSearchCount 추가
 *      </pre>
 */
@Repository
public class TradePostDao implements TradePostDaoIf {
  
  @Resource
  private SqlSessionTemplate template;

  @Override
  public List<TradePostVo> findTradePostList(BuyerPagingBean pb) {
    return template.selectList("trade.getTradePostList", pb);
  }

  @Override
  public int getTotalTradePostCount() {
    return template.selectOne("trade.getTotalTradePostCount");
  }

  @Override
  public TradePostVo findTradePostDetailByNo(int no) {
    return template.selectOne("trade.findTradePostDetailByNo", no);
  }

  @Override
  public void deleteTradePostByNo(int no) {
    template.delete("trade.deleteTradePostByNo", no);
  }

  @Override
  public void updateTradePost(TradePostVo tvo) {
    template.update("trade.updateTradePostByNo", tvo);
  }

  @Override
  public void createTradePost(TradePostVo tvo) {
    template.insert("trade.createTradePost", tvo);
  }

  @Override
  public void updateHitsTradePost(TradePostVo tvo) {
    template.update("trade.updateHitsTradePost", tvo);
  }

  @Override
  public List<TradePostVo> findtradePostBySearch(TradePostSearchVo tps) {
    return template.selectList("trade.findtradePostBySearch", tps);
  }

  @Override
  public int getTotalTradeSearchCount(TradePostSearchVo tps) {
    return template.selectOne("trade.findtradePostBySearchCount", tps);
  }
  
}
