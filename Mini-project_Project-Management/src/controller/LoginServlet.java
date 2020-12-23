package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UtilisateurDao;
import daoImp.UtilisateurDaoImp;	
import beans.Utilisateur;;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
		
	private static final long serialVersionUID = 1L;
		private static UtilisateurDaoImp utilisateur = new UtilisateurDaoImp();
	
		public LoginServlet() {
			super();
		}
		
	
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			doPost(request, response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			try {
				response.setContentType("text/html");
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				Utilisateur user = utilisateur.findByEmailPassword(email, password);
				if (user == null) {
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
					request.setAttribute("erreurLogin", "Email ou mot de passe incorrecte");
					requestDispatcher.forward(request, response);
				} else {
					HttpSession session = request.getSession();
					session.setAttribute("Email", email);
					session.setAttribute("Utilisateur", user);
					if (user.getRole().equals("Employe"))
						response.sendRedirect("accueilEmploye.jsp");
					if(user.getRole().equals("Chefdeprojet"))
						response.sendRedirect("accueilChefProjet.jsp");
					if(user.getRole().equals("Administrateur"))
						response.sendRedirect("accueilAdministrateur.jsp");
				}
			} catch (Exception e) {
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
				request.setAttribute("erreur", "Email ou mot de passe incorrecte");
				requestDispatcher.forward(request, response);
			}
		}
	}

