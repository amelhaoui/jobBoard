<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description"
	content="Jobseek - Job Board Responsive HTML Template">
<meta name="author" content="Coffeecream Themes, info@coffeecream.eu">
<title>Jobseek - Job Board Responsive HTML Template</title>
<link rel="shortcut icon" href="images/favicon.png">

<!-- Main Stylesheet -->
<link href="css/style.css" rel="stylesheet">
<script src="js/jquery-1.11.2.min.js"></script>

<!-- HTML5 shiv and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
		<script src="js/html5shiv.js"></script>
		<script src="js/respond.min.js"></script>
		<![endif]-->

</head>
<body>

	<!-- ============ PAGE LOADER START ============ -->

	<div id="loader">
		<i class="fa fa-cog fa-4x fa-spin"></i>
	</div>

	<!-- ============ PAGE LOADER END ============ -->

	<!-- ============ NAVBAR START ============ -->

	<jsp:include page="common/menu.jsp" />


	<!-- ============ NAVBAR END ============ -->

	<!-- ============ HEADER START ============ -->

	<jsp:include page="common/header.jsp" />


	<!-- ============ HEADER END ============ -->

	<!-- ============ TITLE START ============ -->

	<section id="title">

		<c:if test="${!sucess}">
			<div class="alert alert-success"
				style="margin-left: auto; margin-right: auto; width: 50%;"
				role="alert">
				<strong>Votre candidature a été soumis!</strong> Vous pouvez suivre
				vos candidature sur votre <a href="/JobBoard/homecandidat">
					Espace Candidat</a>
			</div>
		</c:if>
		<c:if test="${sucess && registred}">
			<div class="alert alert-danger"
				style="margin-left: auto; margin-right: auto; width: 50%;"
				role="alert">
				<strong>Votre avez deja postule pour cette ofrre!</strong> Vous
				pouvez suivre vos candidatures sur votre <a
					href="/JobBoard/homecandidat"> Espace Candidat</a>
			</div>
		</c:if>
		<div class="container">
			<div class="row">
				<div class="col-sm-12 text-center">
					<h1>${offre.titre}</h1>
					<h4>
						<span><i class="fa fa-map-marker"></i>${offre.ville },
							${offre.entreprise }</span>
					</h4>
				</div>
			</div>
		</div>
	</section>

	<!-- ============ TITLE END ============ -->

	<!-- ============ CONTENT START ============ -->

	<section id="jobs">
		<div class="container">
			<div class="row">
				<div class="col-sm-8">
					<article>
						<h2>Job Details</h2>
						<h3>Description</h3>
						<p>${offre.description}</p>

						<h3>Pour postuler</h3>
						<p>
							Pour toute information complementaire, veuillez vous adresser a <a
								href="mailto:contact@${offre.entreprise}.com">contact@${offre.entreprise}.com</a>
						</p>

						<form action="/JobBoard/postuler" method="post">
							<p style="margin-bottom:5px">
								<input type="hidden" value="${offre.idOffre}" name="id" />
								<c:choose>

									<c:when test="${empty sessionScope.candidat }">
										<input type="submit" class="btn btn-primary btn-lg"
											value="Apply Here" disabled />
									</c:when>
									<c:when
										test="${!empty sessionScope.candidat && offre.etatOffre !='Expire' }">
										<input type="submit" class="btn btn-primary btn-lg"
											value="Apply Here" />
									</c:when>
									<c:when
										test="${!empty sessionScope.candidat && offre.etatOffre =='Expire' }">

										<input type="submit" class="btn btn-primary btn-lg"
											value="Apply Here" disabled />
										<p style="color: red">L'offre a expire, nous n'acceptons
											plus d'applications. Merci</p>
									</c:when>
								</c:choose>
							</p>

						</form>
					</article>
				</div>
				<div class="col-sm-4" id="sidebar">
					<div class="sidebar-widget" id="company-jobs">
						<h2>More jobs from this company</h2>
						<ul>
						<c:forEach var="autre" items="${offre_entreprise }">
							<li><a href="offre?id=${autre.idOffre}">${autre.titre}</a></li>
						</c:forEach>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- ============ CONTENT END ============ -->


	<!-- ============ FOOTER START ============ -->
	<jsp:include page="common/footer.jsp" />


	<!-- ============ FOOTER END ============ -->

	<!-- ============ LOGIN START ============ -->


	<!-- ============ LOGIN END ============ -->



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


</body>

<!-- Mirrored from coffeecreamthemes.com/themes/jobseek/site/job-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 02 May 2015 20:46:06 GMT -->
</html>