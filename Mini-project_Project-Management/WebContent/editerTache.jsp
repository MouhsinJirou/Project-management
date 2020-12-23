<%@page import="daoImp.TacheDaoImp"%>
<%@page import="beans.Tache"%>
<%@page import="beans.Utilisateur"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%
	TacheDaoImp tacheDao = new TacheDaoImp();
	Utilisateur utilisateur = (Utilisateur) session.getAttribute("Utilisateur");
	Tache tache = tacheDao.findById(Integer.parseInt(request.getParameter("id")));
%>
<head>
<meta charset="ISO-8859-1">
<title>Information tache</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link"
				href="accueilUtilisateur.jsp">Utilisateur: <%=utilisateur.getNom() + " " + utilisateur.getPrenom()%></a></li>
			<li class="nav-item"><a class="nav-link" href="profileUtilisateur.jsp">Mon
					profile</a></li>
			<li class="nav-item"><a class="nav-link"
				href="LogoutServlet">Déconnecter</a></li>
		</ul>
	</div>
</nav>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<%
					if (request.getAttribute("erreurUpdateTache") != null) {
				%>
				<div class="alert alert-danger" role="alert"><%=request.getAttribute("erreurUpdateTache")%></div>
				<%
					}
				%>
				<form method="post" action="UpdateTacheServlet">
					<fieldset>
						<h1>Bienvenue à e-Projet</h1>
						<input type="hidden" name="id"
							value=<%=tache.getNumero_tache()%>>
						<div class="form-group">
							<label for="id_tachee">ID</label> <input type="text"
								class="form-control" id="id_tachee" name="id"
								value=<%=tache.getNumero_tache()%> disabled>
						</div>
						<div class="form-group">
							<label for="description_tache">Description</label> <input
								type="text" class="form-control" id="description_tache"
								name="description_tache" value=<%=tache.getDescription()%>
								disabled>
						</div>
						<div class="form-group">
							<label for="duree">Duree</label> <input
								type="text" class="form-control" id="duree"
								name="charge_horaire_tache"
								value=<%=tache.getDuree()%> disabled>
						</div>
						
						<div class="form-group">
							<label for="statut_tache">Statut</label> <select
								id="statut_tache" name="statut_tache">
								
								<option value=<%=tache.getStatut()%> selected="selected"><%=tache.getStatut()%></option>
							</select>
						</div>
						<div class="form-group">
							<label for="date_debut_tache">Date de début</label> <input
								type="Date" class="form-control" id="date_debut_tache"
								name="date_debut_tache" value=<%=tache.getDate_debut()%>>
						</div>
						<div class="form-group">
							<label for="date_fin_tache">Date de fin</label> <input
								type="Date" class="form-control" id="date_fin_tache"
								name="date_fin_tache" value=<%=tache.getDate_fin()%>>
						</div>
						<button
								type="submit" class="btn btn-primary" value="Valider"
								name="valider">Submit</button>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>