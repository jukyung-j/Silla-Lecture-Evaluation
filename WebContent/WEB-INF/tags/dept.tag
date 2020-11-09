<%@ tag dynamic-attributes="optionMap" body-content="empty"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<select required name="dept" class="textbox">
	<option value="" >학과를 선택해 주세요</option>
    <c:forEach var="item" items="${optionMap}">
        <option value="${item.key}">${item.value}</option>
    </c:forEach>
</select>