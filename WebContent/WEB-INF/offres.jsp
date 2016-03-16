<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>



<!-- Mirrored from coffeecreamthemes.com/themes/jobseek/site/ by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 02 May 2015 20:45:14 GMT -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Jobseek - Job Board Responsive HTML Template</title>
<link rel="shortcut icon" href="images/favicon.png">

<!-- Main Stylesheet -->

<link type="text/css" rel="stylesheet" href="css/style.css" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.2.min.js"></script>

<!-- HTML5 shiv and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
		<script src="js/html5shiv.js"></script>
		<script src="js/respond.min.js"></script>
		<![endif]-->

</head>
<body>
	<jsp:include page="common/menu.jsp" />


	<!-- ============ HEADER START ============ -->
	<jsp:include page="common/header.jsp" />


	<!-- ============ HEADER END ============ -->

	<!-- ============ TITLE START ============ -->

	<section id="title">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">
				<h1>Offers</h1>
				<h4>Find your perfect Job</h4>
			</div>
		</div>
	</div>
	</section>

	<!-- ============ TITLE END ============ -->



	<section id="jobs">
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<h2>Offres</h2>

				<div class="jobs">

					<!-- Job offer 1 -->
					<c:forEach var="offre" items="${offres}">
						<a href="offre?id=${offre.idOffre }">
							<div class="featured"></div> <img src="images/job1.jpg" alt=""
							class="img-circle" />
							<div class="title">
								<h5>${offre.titre}</h5>
								<p>${offre.entreprise}, Etat: ${offre.etatOffre}</p>
							</div>
							<div class="data">
								<span class="city"><i class="fa fa-map-marker"></i>${offre.ville}</span>

							</div>
						</a>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- ============ STATS END ============ -->

	<jsp:include page="common/footer.jsp" />



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
		<jsp:include page="common/login.jsp" />
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
		<jsp:include page="common/register.jsp" />
	</c:if>

	<!-- ============ REGISTER END ============ -->

	<!-- Modernizr Plugin -->
	<script src="js/modernizr.custom.79639.js"></script>



	<!-- Bootstrap Plugins -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Retina Plugin -->
	<script src="js/retina.min.js"></script>

	<!-- ScrollReveal Plugin -->
	<script src="js/scrollReveal.min.js"></script>

	<!-- Flex Menu Plugin -->
	<script src="js/jquery.flexmenu.js"></script>

	<!-- Slider Plugin -->
	<script src="js/jquery.ba-cond.min.js"></script>
	<script src="js/jquery.slitslider.js"></script>

	<!-- Carousel Plugin -->
	<script src="js/owl.carousel.min.js"></script>

	<!-- Parallax Plugin -->
	<script src="js/parallax.js"></script>

	<!-- Counterup Plugin -->
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/waypoints.min.js"></script>

	<!-- No UI Slider Plugin -->
	<script src="js/jquery.nouislider.all.min.js"></script>

	<!-- Bootstrap Wysiwyg Plugin -->
	<script src="js/bootstrap-wysiwyg.js"></script>
	<script src="js/jquery.hotkeys.js"></script>

	<!-- Flickr Plugin -->
	<script src="js/jflickrfeed.min.js"></script>

	<!-- Fancybox Plugin -->
	<script src="js/fancybox.pack.js"></script>

	<!-- Magic Form Processing -->
	<script src="js/magic.js"></script>

	<!-- jQuery Settings -->
	<script src="js/settings.js"></script>
	<script type="text/javascript">
		
	</script>


</body>

<!-- Mirrored from coffeecreamthemes.com/themes/jobseek/site/ by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 02 May 2015 20:45:44 GMT -->
</html>