<%@page import="daoImp.ProjetDaoImp"%>
<%@page import="beans.Utilisateur"%>
<%@page import="beans.Projet"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%
	ProjetDaoImp projetDao = new ProjetDaoImp();
	Utilisateur utilisateur = (Utilisateur) session.getAttribute("Utilisateur");
	
	List<Projet> projets=projetDao.findAll();
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
				href="accueilChefProjet.jsp">Chef de projet: <%=utilisateur.getNom() + " " + utilisateur.getPrenom()%></a>
			</li>
			<li class="nav-item"><a class="nav-link"
				href="profileChefProjet.jsp">Mon profile</a></li>
			<li class="nav-item"><a class="nav-link"
				href="LogoutServlet">Déconnecter</a></li>
		</ul>
	</div>
</nav>
</head>
<body style="background-color=green">
	<h1>Bienvenue à e-Projet</h1>
	<%
					if (request.getAttribute("erreurDeleteProjet") != null) {
				%>
				<div class="alert alert-danger" role="alert"><%=request.getAttribute("erreurDeleteTProjet")%></div>
				<%
					}
					if (request.getAttribute("erreur1DeleteProjet") != null) {
				%>
				<div class="alert alert-danger" role="alert"><%=request.getAttribute("erreur1DeleteProjet")%></div>
				<%
					}
					if (request.getAttribute("bienDeleteProjet") != null) {
						%>
						<div class="alert alert-danger" role="alert"><%=request.getAttribute("bienDeleteProjet")%></div>
						<%
							}
				%>
	<p align="center">Liste de mes projets</p>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">Code</th>
				<th scope="col">Intitule</th>
				<th scope="col">Description</th>
				<th scope="col">Charge Horaire</th>
				<th scope="col"></th>
			    <th scope="col"></th>
			</tr>
		</thead>

		<%
			for(Projet projet : projets) {
		%>

		<tr>
			<td><%=projet.getCode_projet()%></td>
			<td><%=projet.getIntitule()%></td>
			<td><%=projet.getDescription()%></td>
			<td><%=projet.getCharge_horaire()%></td>
			<td><a href="editerProjet.jsp?code_pro=<%=projet.getCode_projet()%>">Editer</a></td>
		    <td><a href="DeleteProjetServlet?code_pro=<%=projet.getCode_projet()%>">Supprimer</a></td>
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