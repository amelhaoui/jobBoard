<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="DAO.Candidature"%>
<%@page import="java.util.Iterator"%>
<%@page import="Services.Services"%>

<%@page import="java.util.List"%>
<%@page import="DAO.Offre"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="DAO.Recruteur"%>
<%@page import="DAO.Candidat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<!-- Mirrored from coffeecreamthemes.com/themes/jobseek/site/post.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 02 May 2015 20:46:10 GMT -->
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description"
	content="Jobseek - Job Board Responsive HTML Template">
<meta name="author" content="Coffeecream Themes, info@coffeecream.eu">
<title>Jobseek </title>
<link rel="shortcut icon" href="images/favicon.png">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<link rel="stylesheet"
	href="css/jquery-ui.css">

<script src="js/jquery-1.11.2.min.js"></script>
<script src="js/jquery-ui.js"></script>


<!-- Main Stylesheet -->
<link href="css/style.css" rel="stylesheet">

<!-- HTML5 shiv and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
		<script src="js/html5shiv.js"></script>
		<script src="js/respond.min.js"></script>
		<![endif]-->

</head>
<body>

	<c:if test="${empty sessionScope.candidat}">
		<script type="text/javascript">
			location.href = "home";
		</script>
	</c:if>

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

	<section id="title" style="padding-top: 35px">
		<div class="container">
			<div class="row">
				<div class="col-sm-2" style="width: 105px;">
					<img src="images/testimonial1.jpg" alt="" style="width: 75px;"
						class="img-responsive img-circle" />
				</div>
				<div class="col-sm-10">
					<h2 style="margin-bottom: 5px">Bienvenue dans votre espace
						Candidat .${sessionScope.candidat.prenom}</h2>
					<div class="meta">
							<c:if test="${empty sessionScope.candidat.cvChemin}">
								<span style="color:red">CV introuvable</span>
							</c:if>

							<c:if test="${sessionScope.candidat.description == '' || empty sessionScope.candidat.description }">
								<span style="color:red">, Description non specifie</span>
							</c:if>
						<form action="/JobBoard/deconnexion" method="post">
							<input type="submit" value="Se Deconnecter" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- ============ TITLE END ============ -->

	<!-- ============ CONTENT START ============ -->
	<script type="text/javascript">
		function ShowCandidatures() {
			$('#candidatures').css('display', 'block');
			$('#profil').css('display', 'none');
			$('#offres-suggeres').css('display', 'none');

		}
		function ShowProfil() {
			$('#profil').css('display', 'block');
			$('#candidatures').css('display', 'none');
			$('#offres-suggeres').css('display', 'none');

		}

		function ShowOffresSuggeres() {
			$('#offres-suggeres').css('display', 'block');
			$('#candidatures').css('display', 'none');
			$('#profil').css('display', 'none');

		}
	</script>
	<section id="blog" style="padding-top: 70px">
		<div class="container">
			<div class="row">
				<div class="col-sm-3" id="sidebar">

					<div class="sidebar-links" id="categories">
						<h5>
							<span class="fa-stack fa-lg"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-folder fa-stack-1x fa-inverse"></i>
							</span> Menu
						</h5>
						<ul>
							<li><a href="javascript:void(0)"
								onclick="ShowCandidatures()" class="candidatures">Mes
									candidatures</a></li>
							<li><a href="javascript:void(0)"
								onclick="ShowOffresSuggeres()">Offres suggeres </a></li>
							<li><a href="javascript:void(0)" onclick="ShowProfil()">Modifier
									mon Profil</a></li>
						</ul>
					</div>

				</div>


				<!-- SIDEBAR START -->




				<div class="col-sm-9">

					<!-- POSTS START -->



					<div class="table-responsive" id="candidatures">
						<h2>Mes candidatures</h2>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Soumis le</th>
									<th>Etat Candidature</th>
									<th>Titre</th>
									<th>Entreprise</th>
									<th>Expiration Offre</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="cd" items="${candidatures}">
									<tr>
										<td>${cd.getDate()}</td>
										<c:if test="${cd.getEtat() == 'Confirme'}">
											<td><a
												href="mailto:${cd.getOffre().getRecruteur().getEmail()}">Contact
													Recruteur</a></td>
										</c:if>
										<c:if test="${cd.getEtat() != 'Confirme'}">
											<td>${cd.getEtat()}</td>
										</c:if>
										<td><a href="offre?id=${cd.getOffre().getIdOffre()}">${cd.getOffre().getTitre()}</a></td>
										<td>${cd.getOffre().getEntreprise()}</td>

										<c:if test="${cd.offre.etatOffre == 'Expire'}">
											<td>${cd.offre.etatOffre}</td>
										</c:if>
										<c:if test="${cd.offre.etatOffre == 'Active'}">
											<td>${cd.getOffre().getExpiration()}</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<!--  Scripts  -->
					<script type="text/javascript">
						$(function() {
							var ville = [ "Rabat", "Casablanca", "Marrakech",
									"Oujda", "Kenitra", "Fes", "Tanger",
									"Tetouan", "Paris", "Toulouse", "Tunis",
									"Alger", "Madrid", "Autre" ];
							var specialites = [ "Systeme d'informations",
									"Industriel", "Mecanique", "Batiment",
									"Administration de reseaux",
									"Architecture", "Medecine", "Management", ];

							$("#profile-ville").autocomplete({
								source : ville
							});
							$("#profile-specialite").autocomplete({
								source : specialites
							});
						});
					</script>

					<script>
						$(function() {
							var skills = [ "Asp", "BASIC", "C", "C++", "Java",
									"JavaScript", "Perl", "PHP", "Python",
									"Ruby", "Scala", "Wordpress", "RH" ];
							function split(val) {
								return val.split(/,\s*/);
							}
							function extractLast(term) {
								return split(term).pop();
							}

							$("#profile-skills")
									// don't navigate away from the field on tab when selecting an item
									.bind(
											"keydown",
											function(event) {
												if (event.keyCode === $.ui.keyCode.TAB
														&& $(this)
																.autocomplete(
																		"instance").menu.active) {
													event.preventDefault();
												}
											})
									.autocomplete(
											{
												minLength : 0,
												source : function(request,
														response) {
													// delegate back to autocomplete, but extract the last term
													response($.ui.autocomplete
															.filter(
																	skills,
																	extractLast(request.term)));
												},
												focus : function() {
													// prevent value inserted on focus
													return false;
												},
												select : function(event, ui) {
													var terms = split(this.value);
													// remove the current input
													terms.pop();
													// add the selected item
													terms.push(ui.item.value);
													// add placeholder to get the comma-and-space at the end
													terms.push("");
													this.value = terms
															.join(", ");
													return false;
												}
											});
						});
					</script>

					<div id="profil" style="display: none">
						<form id="offre-form" action="/JobBoard/update" method="post"
							enctype="multipart/form-data">
							<div class="col-sm-8">
								<h2>Votre Profil</h2>

								<div class="form-group" id="job-title-group">
									<label for="profile-nom">Nom</label> <input type="text"
										class="form-control" name="nom"
										value="${sessionScope.candidat.nom}" id="profile-nom" required>
								</div>
								<div class="form-group" id="job-region-group">
									<label for="profile-prenom">Prenom</label> <input type="text"
										class="form-control" name="prenom"
										value="${sessionScope.candidat.prenom}" id="profile-prneom" required/>
								</div>

								<div class="form-group" id="job-region-group">
									<label for="profile-email">Email</label> <input type="text"
										class="form-control" name="email"
										value="${sessionScope.candidat.email}" id="profile-email" required/>
								</div>

								<div class="form-group" id="job-region-group">
									<label for="profile-tel">Telephone</label> <input type="text"
										class="form-control" name="tel"
										value="${sessionScope.candidat.tel}" id="profile-tel" required/>
								</div>

								<div class="form-group" id="job-region-group">
									<label for="job-specialite">Specialite</label> <input
										type="text" class="form-control" name="specialite"
										value="${sessionScope.candidat.specialites}"
										id="profile-specialite" required />
								</div>

								<div class="form-group ui-widget" id="job-region-group">
									<label for="profile-ville">Ville</label> <input
										class="form-control" name="ville" id="profile-ville"
										value="${sessionScope.candidat.ville}" required>

								</div>

								<div class="form-group" id="job-region-group">
									<label for="job-code">Code Postale</label> <input type="text"
										class="form-control" name="codePostal"
										value="${sessionScope.candidat.codePostal}" id="profile-code" />
								</div>

								<div class="form-group" id="job-region-group">
									<label for="job-pays">Pays</label> <input type="text"
										class="form-control" name="pays"
										value="${sessionScope.candidat.pays}" id="profile-pays" required/>
								</div>

								<div class="form-group" id="job-region-group">
									<label for="profile-skills">Skills</label> <input type="text"
										class="form-control" name="skills" id="profile-skills" value="${skills}" required/>
								</div>

								<div class="form-group" id="job-region-group">
									<label for="profile-description">Description </label>
									<textarea class="form-control" id="profile-description"
										name="description" required>${sessionScope.candidat.description}</textarea>
								</div>

								<div class="form-group">
									<label for="fichier">Uploader CV :<c:if
											test="${!empty candidat.cvChemin }">
											<a href="${candidat.cvChemin }">${filename}</a>
										</c:if>
									</label> <input type="file" id="fichier" class="form-control"
										name="fichier" value="${candidat.cvChemin }" />
								</div>

								<div class="row text-center">
									<input type="submit" class="btn btn-primary btn-lg"
										value="Mettre a jour"> <i class="fa fa-arrow-right"></i>
								</div>

							</div>

						</form>

					</div>

					<div id="offres-suggeres" style="display: none">
						<div class="col-sm-8">
							<h2>Offres Suggeres</h2>
							<div class="jobs">
								<!-- Job offer  -->
								<c:forEach var="item" items="${result}">
									<a href="offre?id=${item.getIdOffre()}"> <img
										src="images/job1.jpg" alt="" class="img-circle" />
										<div class="title">
											<h5>
												<c:out value="${item.titre}" />
											</h5>
											<p>${item.entreprise}</p>
										</div>
										<div class="data">
											<span class="city"><i class="fa fa-map-marker"></i> <c:out
													value="${item.ville}" /></span> <span class="type full-time"><i
												class="fa fa-clock-o"></i> <c:out value="${item.expiration}" /></span>
											<span class="sallary"><i class="fa fa-dollar"></i> <c:out
													value="${item.etatOffre}" /></span>
										</div>
									</a>
								</c:forEach>
							</div>
						</div>
					</div>
					<!-- POSTS END -->

					<hr>

					<!-- COMMENT FORM START -->

					<!-- COMMENTS FORM END -->

				</div>

				<!-- SIDEBAR END -->

			</div>
		</div>
	</section>

	<!-- ============ CONTENT END ============ -->



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

<!-- Mirrored from coffeecreamthemes.com/themes/jobseek/site/post.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 02 May 2015 20:46:51 GMT -->
</html>