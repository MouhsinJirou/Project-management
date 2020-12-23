<%@page import="beans.Utilisateur"%>
<%@page import="daoImp.UtilisateurDaoImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%
	UtilisateurDaoImp utilisateurDao = new UtilisateurDaoImp();
	Utilisateur user = (Utilisateur) session.getAttribute("Utilisateur");
	Utilisateur usere = utilisateurDao.findById(Integer.parseInt(request.getParameter("id")));
%>
<head>
<meta charset="ISO-8859-1">
<title>Profil chef de projet</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link"
				href="accueilAdministrateur.jsp">Administrateur: <%=user.getNom() + " " + user.getPrenom()%></a></li>
			<li class="nav-item"><a class="nav-link"
				href="profileAdministrateur.jsp">Mon profile</a></li>
			<li class="nav-item"><a class="nav-link" href="LogoutServlet">Déconnecter</a></li>
		</ul>
	</div>
</nav>
</head>
<body>
		<div class="container">
			<div class="row">
				<div class="col-6">
				<%
					if (request.getAttribute("erreurUpdateUtilisateur") != null) {
				%>
				<div class="alert alert-danger" role="alert"><%=request.getAttribute("erreurUpdateUtilisateur")%></div>
				<%
					}
				%>
					<form method="post" action="UpdateIUtilisateurServlet">
						<fieldeset>
						<h1>Bienvenue à e-Projet</h1>
						<div class="form-group">
							<label for="idd">ID</label> <input type="text"
								class="form-control" id="iddd" name="id"
								value=<%=usere.getNumero_user()%> readonly>
						</div>
						<div class="form-group">
							<label for="nom">Nom</label> <input type="text"
								class="form-control" id="nom" name="nom"
								value=<%=usere.getNom()%> >
						</div>
						<div class="form-group">
							<label for="prenom">Prénom</label> <input type="text"
								class="form-control" id="prenom" name="prenom"
								value=<%=usere.getPrenom()%> >
						</div>
						<div class="form-group">
							<label for="role">Role</label> <input type="text"
								class="form-control" id="role" name="role"
								value=<%=usere.getRole()%> >
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="text"
								class="form-control" id="password" name="password"
								value=<%=usere.getMot_passe()%> >
						</div>
						<div class="form-group">
							<label for="email">Email</label> <input type="email"
								class="form-control" id="email" name="email"
								aria-describedby="emailHelp" value=<%=usere.getEmail()%> >
						</div>
						
						<button type="submit" class="btn btn-primary">Modifier</button>
						</fieldeset>
					</form>
				</div>
			</div>
		</div>
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