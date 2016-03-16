<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- ============ NAVBAR START ============ -->
<script type="text/javascript">
	$(function() {
		$('#deconnexion').on('click', function(e) {
			$.ajax({
				type : 'POST',
				url : 'deconnexion',
				//data : $('#login-form').serialize(),
				success : function(result) {
					location.reload();
				}
			});

		});
	});
</script>
<div class="fm-container">
	<!-- Menu -->
	<div id="menu-login" class="menu">
		<div class="button-close text-right">
			<a class="fm-button"><i class="fa fa-close fa-2x"></i></a>
		</div>
		<ul class="nav">
			<li class="active"><a href="#home">Acceuil</a></li>
			<li><a href="all-offres">Offres</a></li>
			<li><a href="newOffre">Déposer une offre</a></li>
			<li><a href="candidates">Candidats</a></li>
			<c:if
				test="${empty sessionScope.recruteur && empty sessionScope.candidat}">
				<li><a class="link-register">S'enregistrer</a></li>
				<li><a class="link-login">Login</a></li>
			</c:if>
			<c:if
				test="${!empty sessionScope.recruteur || !empty sessionScope.candidat}">
				<li><a href="${sessionScope.togo}">Mon espace</a>
				<li><a id="deconnexion">Se deconnecter</a></li>

			</c:if>

		</ul>
	</div>
	<!-- end Menu -->
</div>
<!-- ============ LOGIN START ============ -->

	<script type="text/javascript">
		$(function() {
			$('#login-form').on('submit', function(e) {
				$.ajax({
					type : 'POST',
					url : '/JobBoard/authenticate',
					data : $('#login-form').serialize(),
					success : function(result) {
						var resultat = $(result).find("#login-form").html();
						$("#login-form").html(resultat);
					}
				});
				e.preventDefault();

			});
		});
	</script>

	<c:if
		test="${(empty sessionScope.recruteur) &&  (empty sessionScope.candidat)}">
		<jsp:include page="login.jsp" />
	</c:if>


	<!-- ============ LOGIN END ============ -->



	<!-- ============ REGISTER START ============ -->


	<script type="text/javascript">
		$(function() {
			$('#register-form-c').on(
					'submit',
					function(e) {
						$.ajax({
							type : 'POST',
							url : '/JobBoard/inscriptionC',
							data : $('#register-form-c').serialize(),
							success : function(result) {
								var resultat = $(result).find(
										"#register-form-c").html();
								$("#register-form-c").html(resultat);
							}
						});
						e.preventDefault();
					});
			$('#register-form-r').on(
					'submit',
					function(e) {
						$.ajax({
							type : 'POST',
							url : '/JobBoard/inscriptionR',
							data : $('#register-form-r').serialize(),
							success : function(result) {
								var resultat = $(result).find(
										"#register-form-r").html();
								$("#register-form-r").html(resultat);
							}
						});
						e.preventDefault();
					});
		});
	</script>

	<c:if test="${empty sessionScope.recruteur}">
		<jsp:include page="register.jsp" />
	</c:if>

	<!-- ============ REGISTER END ============ -->
<!-- ============ NAVBAR END ============ -->