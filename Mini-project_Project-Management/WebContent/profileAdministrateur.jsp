<%@page import="beans.Utilisateur"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%
 Utilisateur utilisateur = (Utilisateur) session.getAttribute("Utilisateur");
%>
<head>
<meta charset="ISO-8859-1">
<title>Profil administrateur</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="accueilAdministrateur.jsp">Administrateur:
					<%=utilisateur.getNom() + " " + utilisateur.getPrenom()%></a></li>
			<li class="nav-item"><a class="nav-link" href="profileAdministrateur.jsp">Mon
					profile</a></li>
			<li class="nav-item"><a class="nav-link"
				href="LogoutServlet">Déconnecter</a></li>
		</ul>
	</div>
</nav>
</head>
<body>
	<form>
		<div class="container">
			<div class="row">
				<div class="col-6">
					<h1>Bienvenue à e-Projet</h1>
					<div class="form-group">
						<label for="id">ID</label> <input type="text" class="form-control"
							id="id" name="id" value=<%=utilisateur.getNumero_user()%> disabled>
					</div>
					<div class="form-group">
						<label for="nom">Nom</label> <input type="text"
							class="form-control" id="nom" name="nom"
							value=<%=utilisateur.getNom()%> disabled>
					</div>
					<div class="form-group">
						<label for="prenom">Prénom</label> <input type="text"
							class="form-control" id="prenom" name="prenom"
							value=<%=utilisateur.getPrenom()%> disabled>
					</div>
					<div class="form-group">
						<label for="role">Role</label> <input type="text"
							class="form-control" id="role" name="role"
							value=<%=utilisateur.getRole()%> disabled>
					</div>
					<div class="form-group">
						<label for="password">Password</label> <input type="text"
							class="form-control" id="password" name="password"
							value=<%=utilisateur.getMot_passe()%> disabled>
					</div>
					<div class="form-group">
						<label for="email">Email</label> <input type="email"
							class="form-control" id="email" name="email"
							aria-describedby="emailHelp" value=<%=utilisateur.getEmail()%> disabled>
					</div>
					
				</div>
			</div>
		</div>
	</form>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
</html>