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
<title>Jobseek </title>
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
<body id="home">

	<!-- ============ PAGE LOADER START ============ -->

	<div id="loader">
		<i class="fa fa-cog fa-4x fa-spin"></i>
	</div>

	<!-- ============ PAGE LOADER END ============ -->

	<jsp:include page="common/menu.jsp" />


	<jsp:include page="common/header.jsp" />

	<jsp:include page="common/slides.jsp" />


	<!-- ============ JOBS START ============ -->
	<script type="text/javascript">
		$.ajax({
			type : 'get',
			url : '/JobBoard/offres',
			success : function(data) {
				var resultat = $(data).find(".jobs").html();
				$(".jobs").html(resultat);
			}
		});
	</script>
	<section id="jobs">
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<h2>Recent Jobs</h2>

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

				<a class="btn btn-primary" href="all-offres" id="more-jobs"> <span
					class="more">Show More Jobs <i class="fa fa-arrow-down"></i></span>
				</a>

			</div>
			
		</div>
	</div>
	</section>

	<!-- ============ JOBS END ============ -->


	<!-- ============ STATS START ============ -->


	<!-- ============ STATS END ============ -->

	<jsp:include page="common/footer.jsp" />



	

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