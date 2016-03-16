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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<script src="js/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
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

			<div id="modifier_offre">
				<div class="col-sm-8">

					<h2>Details de l'offre</h2>

					<form action="updateOffre" method="post">

						<div class="form-group" id="job-title-group">
							<label for="job-title">Titre</label> <input type="text"
								class="form-control" name="titre" value="${offre.titre}"
								id="job-title" placeholder="e.g. Web developer">

						</div>
						<div class="form-group" id="job-region-group">
							<label for="job-region">Entreprise</label> <input type="text"
								class="form-control" name="entreprise"
								value="${offre.entreprise}" id="job-firm" />
						</div>

						<div class="form-group" id="job-region-group">
							<label for="job-region">Ville</label> <input type="text"
								class="form-control" value="${offre.ville }" name="ville"
								id="job-region" />

						</div>



						<div class="form-group" id="job-category-group">
							<label for="expiration">Date d'expiration (YYYY-MM-DD) :</label>
							<input type="date" id="expiration" name="expiration"
								class="form-control" value="${offre.expiration}" />
						</div>
						<div class="form-group" id="job-category-group">
							<label for="motsCle">Mots clés : </label> <input type="text"
								id="motsCle" name="motsCle" value="${offre.motsCles}"
								class="form-control" />

						</div>
						<input type="hidden" value="${offre.idOffre}" name="id" /> <input
							type="submit" class="btn btn-primary btn-lg"
							value="Modifier l'offre"> <i class="fa fa-arrow-right"></i>
					</form>
				</div>
			</div>



		</div>
	</section>

	<!-- ============ JOBS END ============ -->


	<!-- ============ FOOTER START ============ -->

	<footer>
		<div id="prefooter">
			<div class="container">
				<div class="row">
					<div class="col-sm-6" id="newsletter">
						<h2>Newsletter</h2>
						<form class="form-inline">
							<div class="form-group">
								<label class="sr-only" for="newsletter-email">Email
									address</label> <input type="email" class="form-control"
									id="newsletter-email" placeholder="Email address">
							</div>
							<button type="submit" class="btn btn-primary">Sign up</button>
						</form>
					</div>
					<div class="col-sm-6" id="social-networks">
						<h2>Get in touch</h2>
						<a href="#"><i class="fa fa-2x fa-facebook-square"></i></a> <a
							href="#"><i class="fa fa-2x fa-twitter-square"></i></a> <a
							href="#"><i class="fa fa-2x fa-google-plus-square"></i></a> <a
							href="#"><i class="fa fa-2x fa-youtube-square"></i></a> <a
							href="#"><i class="fa fa-2x fa-vimeo-square"></i></a> <a href="#"><i
							class="fa fa-2x fa-pinterest-square"></i></a> <a href="#"><i
							class="fa fa-2x fa-linkedin-square"></i></a>
					</div>
				</div>
			</div>
		</div>
		<div id="credits">
			<div class="container text-center">
				<div class="row">
					<div class="col-sm-12">
						&copy; 2015 Jobseek - Responsive Job Board HTML Template<br>
						Designed &amp; Developed by <a
							href="http://themeforest.net/user/Coffeecream" target="_blank">Coffeecream
							Themes</a>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<!-- ============ FOOTER END ============ -->
	<script type="text/javascript">
		$(function() {
			var ville = [ "Rabat", "Casablanca", "Marrakech", "Oujda",
					"Kenitra", "Fes", "Tanger", "Tetouan", "Paris", "Toulouse",
					"Tunis", "Alger", "Madrid", "Autre" ];
			var entreprise = [ "Managem", "Microsoft", "IBM", "Unilever",
					"NeilArmonia", "Amazon", "Google", "Inwi", ];

			$("#job-region").autocomplete({
				source : ville
			});
			$("#job-firm").autocomplete({
				source : entreprise
			});

		});
	</script>




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

<!-- Mirrored from coffeecreamthemes.com/themes/jobseek/site/post-a-job.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 02 May 2015 20:46:04 GMT -->
</html>