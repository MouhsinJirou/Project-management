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

import daoImp.UtilisateurDaoImp;


@WebServlet("/UpdateIUtilisateurServlet")
public class UpdateIUtilisateurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static UtilisateurDaoImp utilisateurDao=new UtilisateurDaoImp();   
  
    public UpdateIUtilisateurServlet() {
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setContentType("text/html");
			int id_user=Integer.parseInt(request.getParameter("id"));
			String nom=request.getParameter("nom");
			String prenom=request.getParameter("prenom");
			String role=request.getParameter("role");
			String password=request.getParameter("password");
			String email=request.getParameter("email");
			
			utilisateurDao.updateUser(id_user, nom, prenom, role,password,email);
			response.sendRedirect("accueilAdministrateur.jsp");
		}catch(Exception e) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("editerUtilisateur.jsp");
			request.setAttribute("erreurUpdateUtilisateur", "Echec de modification veuiller réessayer");
			requestDispatcher.forward(request, response);
		}
	}

}
