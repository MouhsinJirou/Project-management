<%@page import="daoImp.TacheDaoImp"%>
<%@page import="beans.Utilisateur"%>
<%@page import="beans.Tache"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<%
			TacheDaoImp tacheDao = new TacheDaoImp();
			Utilisateur utilisateur = (Utilisateur) session.getAttribute("Utilisateur");
			List<Tache> taches =tacheDao.findByIdUser(utilisateur.getNumero_user());
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
      <li class="nav-item">
        <a class="nav-link" href="accueilEmploye.jsp">Employé: <%=utilisateur.getNom()+" "+utilisateur.getPrenom() %></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="profileEmploye.jsp">Mon profile</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="LogoutServlet">Déconnecter</a>
      </li>
    </ul>
  </div>
</nav>
</head>
<body>
	<h1>Bienvenue à e-Projet</h1>
	<p align="center">Liste de mes taches</p>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Description</th>
				<th scope="col">Duree</th>
				<th scope="col">Statut</th>
				<th scope="col">Projet</th>
				<th scope="col">  </th>
			</tr>
		</thead>

		<%
			for(Tache tache : taches){
		%>

			<tr>
				<td><%= tache.getNumero() %></td>
				<td><%= tache.getDescription() %></td>
				<td><%= tache.getDuree() %></td>
				<td><%= tache.getStatut() %></td>
				<td><%= tache.getProjet().getCode_projet() %>
				<td><a href="editerTache.jsp?id=<%= tache.getNumero() %>">Editer</a></td>
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