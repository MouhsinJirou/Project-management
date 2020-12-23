package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoImp.UtilisateurDaoImp;


@WebServlet("/DeleteUtilisateurServlet")
public class DeleteUtilisateurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UtilisateurDaoImp utilisateurDao=new UtilisateurDaoImp();
   
    public DeleteUtilisateurServlet() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setContentType("text/html");
			int id_user = Integer.parseInt(request.getParameter("numero_user"));
			utilisateurDao.deleteUser(id_user);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("accueilAdministrateur.jsp");
			request.setAttribute("bienDeleteUtilisateur", "L'utilisateur est supprimé");
			requestDispatcher.forward(request, response);
		} catch (Exception e) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("accueilAdministrateur.jsp");
			request.setAttribute("erreurDeleteUtilisateur", "Suppression échouée");
			requestDispatcher.forward(request, response);
		}
	}

}
