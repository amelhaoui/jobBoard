<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="popup" id="login">
			<div class="popup-form">
				<div class="popup-header">
					<a class="close"><i class="fa fa-remove fa-lg"></i></a>
					<h2>Login</h2>
				</div>
				<form id="login-form" >
					<div class="form-group">
						<label for="login-email">Email</label>
						<input  type="text" name="email" value="${param.email}" class="form-control" id="login-email">
					</div>
					<div class="form-group">
						<label for="login-password">Password</label>
						<input type="password"  name="passWord" class="form-control" id="login-password">
					</div>
					<button type="submit" class="btn btn-primary">Login</button>
					<span class="login-result">${loginstatus}</span>
					<c:if test="${!empty sessionScope.recruteur}">
						 <script type="text/javascript">
						 location.href = "${sessionScope.togo}";
						 </script>

                   </c:if>
                   <c:if test="${!empty sessionScope.candidat}">
						 <script type="text/javascript">
						 location.href = "${sessionScope.togo}";
						 </script>

                   </c:if>
				</form>
			</div>
		</div>
