package com.bc.mybatis;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

//장바구니 역할 클래스
public class Cart {
	private List<ShopVO> list; //카트에 담긴 제품 목록
	private int total; //카트에 담긴 전체 제품 가격(합계)
	
	public Cart() {
		list = new ArrayList<ShopVO>();
	}
	public int getTotal() { return total; }
	public List<ShopVO> getList() { return list; }
	
	/**
	 * 장바구니 담기 요청 처리(카트에 제품 추가)
	 * list에 없으면 제품 추가
	 * list에 동일제품이 있으면 수량만 하나 증가처리
	 * @param p_num 제품번호
	 * @param dao DB작업을 위한 DAO 객체
	 */
	public void addProduct(String p_num, ShopDAO dao) {
		//카트에 제품이 있는지 확인
		ShopVO vo = findProduct(p_num);
		
		if (vo != null) { //카트에 있음
			//1. 수량 증가(1개 증가)
			vo.setQuant(vo.getQuant() + 1);
			//2. total에 값 합산(제품 하나 판매가격 추가)
			total = total + vo.getP_saleprice();
		} else { //처음등록
			//1. p_num 조회해서 VO 객체 만들기
			vo = dao.selectOne(p_num);
			//1-1. 수량 1 설정 작업
			vo.setQuant(1);
			//2. 카트(list)에 추가
			list.add(vo);
			//3. total에 값 합산(장바구니 전체 품목 합계)
			total = total + vo.getP_saleprice();
		}
	}
	
	//제품번호와 수량을 전달받아 목록에 있는 제품의 수량 변경처리
	//1. 카트(list)에 제품(p_num)이 있는지 확인
	//2. 카트에 제품이 있을 때 처리사항
	//2-1. 제품이 있으면 수량 변경처리(list.ShopVO.quent 변경)
	//2-2. 제품의 합계금액 변경처리(list.ShopVO.totalprice 변경)
	//3. 카트의 합계금액(Cart.total) 변경처리
	public void setQuant(String p_num, int su) {
		ShopVO vo = findProduct(p_num);
		if (vo != null) {
			//카트 전체금액 변경처리
			//1. 카트의 합계금액 - 수량변경전 제품합계금액
			total = total - vo.getTotalprice();
			
			//2. 제품의 수량변경(제품 수, 제품합계금액 변경)
			vo.setQuant(su);
			
			//3. 카트의 합계금액 + 수량변경후 제품합계금액
			total = total + vo.getTotalprice();
		}
	}
	
	//카트에서 제품 삭제기능
	//카트에 제품이 있는지 확인
	//있으면 삭제처리(list에서 삭제 + cart.total 값 변경처리)
	public void delProduct(String p_num) {
		ShopVO vo = findProduct(p_num);
		if (vo != null) {
			list.remove(vo); //카트에서 삭제
			
			//카트의 전체제품가격에서 삭제된 제품합계금액 빼기
			total = total - vo.getTotalprice();
			
			vo = null; //가비지 컬렉터가 삭제처리하도록
		}
	}
	
	
	//카트에 제품이 있는지 검색기능
	public ShopVO findProduct(String p_num) {
		ShopVO vo = null;
		Iterator<ShopVO> ite = list.iterator();
		while (ite.hasNext()) {
			ShopVO listVO = ite.next();
			if (listVO.getP_num().equals(p_num)) {
				//list에 같은 제품 있음
				vo = listVO;
				break;
			}
		}
		return vo;
	}
	
}





