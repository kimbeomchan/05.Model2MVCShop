<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	function fncGetPageList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
	   	document.detailForm.submit();
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/listPurchase.do" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">
			��ü  ${resultPage.totalCount}  �Ǽ�,	���� ${resultPage.currentPage} ������
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="50">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
		<td class="ct_line02"></td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}" >
		<c:set var="i" value="${ i + 1 }" />
	
	<tr class="ct_list_pop">
		<td align="center">
			${ i }
		</td>
		<td></td>
		
		<td align="center">
			<a href="/getPurchase.do?tranNo=${purchase.tranNo}">${purchase.purchaseProd.prodName}</a> 
		<td/>
		
		<td align="center">
			<a href="/getUser.do?userId=${user.userId}">${user.userId}</a>
		</td>
		<td></td>
		
		<td align="center">${purchase.receiverName}</td>
		<td></td>
		
		<td align="center">${purchase.receiverPhone}</td>
		<td></td>
		
		<td align="center">	���� 
			<c:choose>
				<c:when test = "${purchase.tranCode.equals('1')}" >
					���ſϷ� �����Դϴ�. 
				</c:when>
				<c:when test = "${purchase.tranCode.equals('2')}">
					����� �����Դϴ�. 
					<a href="/updateTranCode.do?prodNo=${purchase.purchaseProd.prodNo}&tranCode=3">���ǵ���</a>
				</c:when>
				<c:when test = "${purchase.tranCode.equals('3')}">
					��ۿϷ� �����Դϴ�. 
				</c:when>
			</c:choose>
		</td>	
		<td></td>
<!-- 		<td align="left">
			�̿ϼ�
		</td> -->
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	</c:forEach>
	
</table>
<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
			
			<jsp:include page="../common/pageNavigator.jsp" />		
			
		</td>
	</tr>
</table>
<!-- PageNavigation End... -->
</form>

</div>

</body>
</html>