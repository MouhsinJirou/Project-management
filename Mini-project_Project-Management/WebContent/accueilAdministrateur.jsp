<%@page import="beans.Utilisateur"%>
<%@page import="daoImp.UtilisateurDaoImp"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%
   UtilisateurDaoImp utilisateurDao = new UtilisateurDaoImp();
	Utilisateur user = (Utilisateur) session.getAttribute("Utilisateur");
	List<Utilisateur> utilisateurs=utilisateurDao.findAll();
%>
<head>
<meta charset="ISO-8859-1">
<title>Accueil</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link"
				href="accueilAdministrateur.jsp">Administrateur: <%=user.getNom() + " " + user.getPrenom()%></a>
			</li>
			<li class="nav-item"><a class="nav-link"
				href="profileAdministrateur.jsp">Mon profile</a></li>
			<li class="nav-item"><a class="nav-link"
				href="LogoutServlet">Déconnecter</a></li>
		</ul>
	</div>
</nav>
</head>
<body>
	<h1>Bienvenue à e-Projet</h1>
	<%
					if (request.getAttribute("erreurDeleteUtilisateur") != null) {
				%>
				<div class="alert alert-danger" role="alert"><%=request.getAttribute("erreurDeleteUtilisateur")%></div>
				<%
					}
					if (request.getAttribute("erreur1DeleteUtilisateur") != null) {
				%>
				<div class="alert alert-danger" role="alert"><%=request.getAttribute("erreur1DeleteUtilisateur")%></div>
				<%
					}
					if (request.getAttribute("bienDeleteUtilisateur") != null) {
						%>
						<div class="alert alert-danger" role="alert"><%=request.getAttribute("bienDeleteUtilisateur")%></div>
						<%
							}
				%>
	<p align="center">Liste des employés</p>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">Code</th>
				<th scope="col">Nom</th>
				<th scope="col">Prenom</th>
				<th scope="col">Role</th>
				<th scope="col"></th>
			    <th scope="col"></th>
			</tr>
		</thead>

		<%
			for(Utilisateur uti : utilisateurs) {
		%>

		<tr>
			<td><%=uti.getNumero_user()%></td>
			<td><%=uti.getNom()%></td>
			<td><%=uti.getPrenom()%></td>
			<td><%=uti.getRole()%></td>
			<td><a href="editerUtilisateur.jsp?id=<%=uti.getNumero_user()%>">Editer</a></td>
		    <td><a href="DeleteUtilisateurServlet?numero_user=<%=uti.getNumero_user()%>">Supprimer</a></td>
		</tr>
		<%
			}
		%>
	</table>
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