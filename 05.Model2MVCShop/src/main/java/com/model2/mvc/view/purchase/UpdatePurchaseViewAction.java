package com.model2.mvc.view.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;
import com.model2.mvc.service.domain.Purchase;

public class UpdatePurchaseViewAction extends Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int tranNo = Integer.parseInt(request.getParameter("tranNo"));
		
		PurchaseService purchaseService = new PurchaseServiceImpl();
		Purchase purchase = purchaseService.findPurchase(tranNo);
		
		request.setAttribute("purchase", purchase);
		
		return "forward:/purchase/updatePurchaseView.jsp";
	}

}
