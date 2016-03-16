<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="popup" id="register">
			<div class="popup-form">

			

                
				<div class="popup-header">
					<a class="close"><i class="fa fa-remove fa-lg"></i></a>
					<h2>S'enregistrer</h2>
				</div>

				<div style="background: #fff;padding: 30px 30px 0px 30px;">
					<label class="radio-block">
   						<input id="candidat-radio" type="radio" name="optionsRadios" value="candidat" checked="checked">
  						Candidat
					</label>
					<label class="radio-block">
					    <input id="recruteur-radio" type="radio" name="optionsRadios" value="recruteur">  
					    Recruteur
						</label>
				</div>

				<form class="form-candidat"  id="register-form-c" style="display :visible" enctype="multipart/form-data">
					<hr style="margin-top:0px">
					<div class="form-group">
						<label for="register-name">Nom</label>
						<input type="text" class="form-control" name="nom" value="<c:out value="${param.nom}"/>" id="register-name" required>
					</div>
					<div class="form-group">
						<label for="register-surname">Prenom</label>
						<input type="text" class="form-control" name="prenom"  value="<c:out value="${param.prenom}"/>" id="register-surname" required>
					</div>
					<div class="form-group">
						<label for="register-telephone">Telephone</label>
						<input type="text" class="form-control" name="tel"  value="<c:out value="${param.tel}"/>" id="register-telephone" >
					</div>

					<div class="form-group">
						<label for="register-pays">Pays</label>
						<input type="text" class="form-control" name="pays"  value="<c:out value="${param.pays}"/>" id="register-pays" >
					</div>
					
					<hr>
					<div class="form-group">
						<label for="register-email">Email</label>
						<input type="text" value="<c:out value="${param.email}"/>" class="form-control" name="email" id="register-email" required>
					</div>
					<div class="form-group">
					
						<label for="register-password1">Mot de passe</label>
						<input type="password" class="form-control" name="passWord" id="register-password1" required>
					</div>
					<div class="form-group">
						<label for="register-password2">Confirmation mot de passe</label>
						<input type="password" class="form-control" name ="confirmation" id="register-password2">
					</div>
					<button type="submit" class="submit-candidat btn btn-primary">S'enregistrer</button>
					
					<p class="${empty erreurs ? 'succes' :'erreur'}">${resultat}</p> 
									<c:forEach var="entry" items="${erreurs}"> 
									<c:out value="${entry.value}"/> <br/>
									</c:forEach>
					
					
				</form>


				<form class="form-recruteur" id="register-form-r"  style="display :none " enctype="multipart/form-data" >
					<hr style="margin-top:0px">
					<div class="form-group">
						<label for="register-name">Nom</label>
						<input type="text" class="form-control" name="nom" value="<c:out value="${param.nom}"/>" id="register-name" required>
					</div>
					<div class="form-group">
						<label for="register-surname">Prenom</label>
						<input type="text" class="form-control" name="prenom"  value="<c:out value="${param.prenom}"/>" id="register-surname" required>
					</div>
					<div class="form-group">
						<label for="register-telephone">Telephone</label>
						<input type="text" class="form-control" name="tel"  value="<c:out value="${param.tel}"/>" id="register-telephone" >
					</div>

					<div class="form-group">
						<label for="register-entreprise">Entreprise</label>
						<input type="text" class="form-control" name="nomEntreprise" value="${param.nomEntreprise }" id="register-entreprise">
					</div>
					<div class="form-group">
						<label for="register-pays">Pays</label>
						<input type="text" class="form-control" name="pays"  value="<c:out value="${param.pays}"/>" id="register-pays">
					</div>

					<hr>
					<div class="form-group">
						<label for="register-email">Email</label>
						<input type="text" value="<c:out value="${param.email}"/>" class="form-control" name="email" id="register-email">
					</div>
					<div class="form-group">
						<label for="register-password1">Mot de passe</label>
						<input type="password" class="form-control" name="passWord" id="register-password1">
					</div>
					<div class="form-group">
						<label for="register-password2">Confirmation mot de passe</label>
						<input type="password" class="form-control" name ="confirmation" id="register-password2">
					</div>
					<button type="submit" class="btn btn-primary">S'enregistrer</button>
					
					<p class="${empty erreurs ? 'succes' :'erreur'}">${resultat}</p> 
									<c:forEach var="entry" items="${erreurs}"> 
									<c:out value="${entry.value}"/> <br/>
									</c:forEach>
				</form>

				
			</div>
		</div>
