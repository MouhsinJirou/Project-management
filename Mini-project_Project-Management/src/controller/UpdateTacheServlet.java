package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoImp.TacheDaoImp;

@WebServlet("/UpdateTacheServlet")
public class UpdateTacheServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static TacheDaoImp tacheDao = new TacheDaoImp();

	public UpdateTacheServlet() {
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			response.setContentType("text/html");
			int id_tache = Integer.parseInt(request.getParameter("id"));
			String statut_tache = request.getParameter("statut_tache");
			Date date_debut_tache=new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date_debut_tache"));
			Date date_fin_tache=new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date_fin_tache"));
			tacheDao.updateTache(id_tache, statut_tache, date_debut_tache, date_fin_tache);
			response.sendRedirect("accueilUtilisateur.jsp");
		} catch (Exception e) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("accueilUtilisateur.jsp");
			request.setAttribute("erreurUpdateTache", "Echec de modification veuiller réessayer");
			requestDispatcher.forward(request, response);
		}
	}
}
