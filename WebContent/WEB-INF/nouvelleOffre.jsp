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
<title>72h</title>
<link rel="shortcut icon" href="images/favicon.png">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.2.min.js"></script>

<!-- Main Stylesheet -->
<link href="css/style.css" rel="stylesheet">

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

	<!-- ============ JOBS START ============ -->



	<section id="jobs">
		<div class="container">

			<div class="row text-center">
				<div class="col-sm-12">
					<h1>Post a Job</h1>
					<h4>Find a Right Candidate</h4>
					<c:if test="${empty sessionScope.recruteur}">


						<div class="jumbotron">
							<h3>Have an account?</h3>
							<p>
								If you don’t have an account you can create one below by
								entering your email address/username.<br>
							</p>
							<p>
								<a class="link-register btn btn-primary">Sign In</a>
							</p>
						</div>
					</c:if>
				</div>
			</div>
			<c:if test="${!empty sessionScope.recruteur}">

				<div id="newOffre" style="margin-top:50px">
					<div class="col-sm-9">

						<h2>Details de l'offre</h2>

						<form id="offre-form" action="/JobBoard/newOffre" method="post">

							<div class="form-group" id="job-title-group">
								<label for="job-title">Titre</label> <input type="text"
									class="form-control" name="titre" value="${param.titre}"
									id="job-title" placeholder="e.g. Web developer" required>

							</div>
							<div class="form-group" id="job-region-group">
								<label for="job-firm">Entreprise</label> <input type="text"
									class="form-control" name="nomEntreprise"
									value="${sessionScope.recruteur.nomEntreprise}"
									id="newjob-firm" required />
							</div>

							<div class="form-group" id="job-region-group">
								<label for="job-region">Ville</label> <input
									class="form-control" name="ville" id="newjob-region" required />
							</div>


							<div class="form-group" id="job-category-group">
								<label for="expiration">Date d'expiration (YYYY-MM-DD) :</label>
								<input type="date" id="expiration" name="expiration"
									class="form-control" value="${param.expiration}" required />
							</div>

							<div class="form-group" id="job-category-group">
								<label for="description">Description</label>
								<textarea id="description" name="description" rows="4"
									class="form-control" required></textarea>
							</div>

							<div class="form-group" id="job-category-group">
								<label for="motsCle">Mots clés : </label>
								<jsp:include page="common/jquery.jsp" />
							</div>



							<input type="submit" class="btn btn-primary btn-lg"
								value="Ajouter une offre"> <i class="fa fa-arrow-right"></i>
						</form>
					</div>
				</div>
			</c:if>
		</div>
	</section>

	<!-- ============ JOBS END ============ -->


	<!-- ============ FOOTER START ============ -->

<jsp:include page="common/footer.jsp"></jsp:include>

	<!-- ============ FOOTER END ============ -->



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

<!-- Mirrored from coffeecreamthemes.com/themes/jobseek/site/post-a-job.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 02 May 2015 20:46:04 GMT -->
</html>