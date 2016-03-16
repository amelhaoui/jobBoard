<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="DAO.Candidature"%>
<%@page import="java.util.Iterator"%>
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
<title>Jobseek - Job Board Responsive HTML Template</title>
<link rel="shortcut icon" href="images/favicon.png">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

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
	<c:if test="${empty sessionScope.recruteur}">
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
					<h2 style="margin-bottom: 5px">
						Bienvenue dans votre espace recruteur 
						<c:out value="${sessionScope.recruteur.prenom}" />
					</h2>
					<div class="meta">
						<form action="/JobBoard/deconnexion" method="post">
							<input type="submit" value="Se Deconnecter" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- ============ TITLE END ============ -->
	<script>
		function ShowOffre() {
			$('#offre').css('display', 'block');
			$('#profil').css('display', 'none');
			$('#newOffre').css('display', 'none');

		}
		function ShowProfil() {
			$('#profil').css('display', 'block');
			$('#offre').css('display', 'none');
			$('#newOffre').css('display', 'none');

		}

		function ShowNew() {
			$('#newOffre').css('display', 'block');
			$('#profil').css('display', 'none');
			$('#offre').css('display', 'none');

		}
	</script>
	<!-- ============ CONTENT START ============ -->

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
							<li><a href="javascript:void(0)" onclick="ShowOffre()">Mes
									offres</a></li>
							<li><a href="javascript:void(0)" onclick="ShowNew()">Ajouter
									une Offre</a></li>
							<li><a href="javascript:void(0)" onclick="ShowProfil()">Modifier
									mon Profil</a></li>
						</ul>
					</div>

				</div>


				<!-- SIDEBAR START -->




				<div id="offre" class="col-sm-9">

					<!-- POSTS START -->
					<script type="text/javascript">
						$(function() {
							$('#supprimer-form').on(
									'submit',
									function(e) {
										$.ajax({
											type : 'POST',
											url : '/JobBoard/deleteOffre',
											data : $('#supprimer-form')
													.serialize(),
											success : function(result) {
												var resultat = $(result).find(
														"#offre").html();
												$("#offre").html(resultat);
											}
										});
										e.preventDefault();

									});
						});
					</script>

					<h2 style="margin-bottom: 40px">Vos Offres</h2>


					<c:forEach var="offre" items="${offres}">
						<c:set scope="page" var="candidats"
							value="${offre.getCandidatures()}" />
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a class="accordion-toggle" data-toggle="collapse"
										data-parent="#accordion" href="#collapseOne">
										${offre.titre} <i
										class="indicator glyphicon glyphicon-chevron-up pull-right"></i>
									</a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in">
								<div class="panel-body">
									<div class="table-responsive">
										<table style="max-width: 100%" class="table table-striped">
											<thead>
												<tr>
													<th>Date</th>
													<th>Description</th>
													<th>Etat</th>
													<th>Expiration</th>
													<th>Options</th>
												</tr>
											</thead>
											<tbody>
												<tr>

													<td>${offre.getDate() }</td>
													<td><a href="offre?id=${offre.getIdOffre()}">${offre.titre}</a></td>
													<td>${offre.getEtatOffre() }</td>
													<td>${offre.getExpiration() }</td>
													<td>
														<form action="deleteOffre" method="post">
															<input type="hidden" name="id"
																value="${offre.getIdOffre()}" /> <input type="submit"
																value="Supprimer" />
														</form>
													</td>
													<td>
														<form action="updateOffre" method="get">
															<input type="hidden" name="id"
																value="${offre.getIdOffre()}" /> <input type="submit"
																value="Modifier" />
														</form>
													</td>
												</tr>

											</tbody>
										</table>
									</div>
									<h4 style="margin: 0px">Candidatures</h4>
									<div class="table-responsive">
										<table style="max-width: 100%" class="table table-striped">
											<thead>
												<tr>
													<th>Nom</th>
													<th>Prenom</th>
													<th>Specialite</th>
													<th>Email</th>
													<th>Tel</th>
													<th>Ville</th>
													<th>CV</th>
													<th>Options</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="candidat" items="${candidats }">
													<tr>
														<td><a href="candidat?id=${candidat.getCandidat().idUtilisateur}">${candidat.getCandidat().getNom()}</a></td>
														<td>${candidat.getCandidat().getPrenom() }</td>
														<td>${candidat.getCandidat().getSpecialites() }</td>
														<td>${candidat.getCandidat().getEmail() }</td>
														<td>${candidat.getCandidat().getTel() }</td>
														<td>${candidat.getCandidat().getVille() }</td>
														<td><a href="${candidat.getCandidat().getCvChemin()}">CV</a></td>

														<td>
															<form action="confirmer" method="post">
																<input type="hidden" name="id"
																	value="${candidat.getIdCandidature()}" />
																<c:if test="${candidat.getEtat() != 'Confirme' }">
																	<input type="submit" value="Confirmer" />
																</c:if>
																<c:if test="${candidat.getEtat() == 'Confirme' }">
																	<input type="text" value="Confirmer" readonly />
																</c:if>
															</form>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- POSTS END -->

				</div>

				<div id="profil" class="col-sm-8" style="display: none">
					<form id="profil-form" action="updaterec" method="post">
						<h2>Votre Profil</h2>

						<div class="form-group" id="job-title-group">
							<label for="profile-nom">Nom</label> <input type="text"
								class="form-control" name="nom"
								value="${sessionScope.recruteur.nom}" id="profile-nom">
						</div>
						<div class="form-group" id="job-region-group">
							<label for="profile-prenom">Prenom</label> <input type="text"
								class="form-control" name="prenom"
								value="${sessionScope.recruteur.prenom}" id="profile-prneom" />
						</div>

						<div class="form-group" id="job-region-group">
							<label for="profile-email">Email</label> <input type="text"
								class="form-control" name="email"
								value="${sessionScope.recruteur.email}" id="profile-email" />
						</div>

						<div class="form-group" id="job-region-group">
							<label for="profile-tel">Telephone</label> <input type="text"
								class="form-control" name="tel"
								value="${sessionScope.recruteur.tel}" id="profile-tel" />
						</div>

						<div class="form-group" id="job-region-group">
							<label for="job-firm">Entreprise</label> <input type="text"
								class="form-control" name="nomEntreprise"
								value="${sessionScope.recruteur.nomEntreprise}" id="job-firm" />
						</div>

						<div class="form-group" id="job-region-group">
							<label for="job-region">Ville</label> <input class="form-control"
								name="villeEntreprise"
								value="${sessionScope.recruteur.villeEntreprise}"
								id="job-region" />

						</div>

						<div class="form-group" id="job-region-group">
							<label for="job-specialite">Code Postale</label> <input
								type="text" class="form-control" name="codePostal"
								value="${sessionScope.recruteur.codePostal}"
								id="profile-specialite" />
						</div>

						<div class="row text-center">
							<input type="submit" class="btn btn-primary btn-lg"
								value="Mettre a jour"> <i class="fa fa-arrow-right"></i>
						</div>


					</form>

				</div>


				<div id="newOffre" style="display: none">
					<div class="col-sm-8">

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

				<!-- COMMENT FORM START -->

				<!-- COMMENTS FORM END -->

			</div>

			<!-- SIDEBAR END -->

		</div>
	</section>

	<!-- ============ CONTENT END ============ -->



	<!-- ============ FOOTER START ============ -->

	<footer>
		<div id="prefooter">
			<div class="container">
				<div class="row">
					<script type="text/javascript">
						$(function() {
							var ville = [ "Rabat", "Casablanca", "Marrakech",
									"Oujda", "Kenitra", "Fes", "Tanger",
									"Tetouan", "Paris", "Toulouse", "Tunis",
									"Alger", "Madrid", "Autre" ];
							var entreprise = [ "Managem", "Microsoft", "IBM",
									"Unilever", "NeilArmonia", "Amazon",
									"Google", "Inwi", ];

							$("#job-region").autocomplete({
								source : ville
							});
							$("#job-firm").autocomplete({
								source : entreprise
							});
							$("#newjob-region").autocomplete({
								source : ville
							});
							$("#newjob-firm").autocomplete({
								source : entreprise
							});
						});
					</script>


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