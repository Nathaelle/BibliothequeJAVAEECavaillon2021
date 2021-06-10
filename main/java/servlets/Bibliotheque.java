package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Livre;

/**
 * Servlet implementation class Bibliotheque
 */
@WebServlet({ "/bibliotheque", "" })
public class Bibliotheque extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private ArrayList<Livre> bibliotheque;

    /**
     * Default constructor. 
     */
    public Bibliotheque() {
    	super();
        this.bibliotheque = new ArrayList<>();
    }
    
    @Override
    public void init() throws ServletException {
    	super.init();
    	initBibliotheque();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println(this.bibliotheque.size());
		if(request.getParameter("action") != null && request.getParameter("reference") != null) {
			
			if(request.getParameter("action").equals("delete")) {		
				delLivre((request.getParameter("reference")));
			} else if (request.getParameter("action").equals("modify")) {
				request.setAttribute("livre", find(request.getParameter("reference")));
			}
		}
		
		request.setAttribute("bibliotheque", this.bibliotheque);
		
		this.getServletContext().getRequestDispatcher("/jsps/bibliotheque.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		System.out.println(request.getParameter("reference"));
//		System.out.println(request.getParameter("titre"));
//		System.out.println(request.getParameter("auteur"));
		String reference = request.getParameter("reference");
		String titre = request.getParameter("titre");
		String auteur = request.getParameter("auteur");
		
		Livre livre = new Livre(reference, titre, auteur);
		
		this.bibliotheque.add(livre);
		
		response.sendRedirect(request.getContextPath());
	}
	
	/**
	 * Initialisation de la propriété "bibliotheque"
	 * En attendant de voir les bases de données
	 */
	private void initBibliotheque() {
		
		Livre livre1 = new Livre("rs548", "Les Misérables", "Victor Hugo");
		Livre livre2 = new Livre("nb548",  "L'Iliade et l'Odyssée", "Homère");
		Livre livre3 = new Livre("ut862", "1984", "George Orwell");
		Livre livre4 = new Livre("fr693", "Voyage au centre de le terre", "Jules Vernes");
		Livre livre5 = new Livre("sd861", "Ravage", "Barjavel");
		Livre livre6 = new Livre("zq695", "Les fleurs du mal", "Baudelaire");
		
		this.bibliotheque.add(livre1);
		this.bibliotheque.add(livre2);
		this.bibliotheque.add(livre3);
		this.bibliotheque.add(livre4);
		this.bibliotheque.add(livre5);
		this.bibliotheque.add(livre6);
	}

	public ArrayList<Livre> getBibliotheque() {
		return this.bibliotheque;
	}

	public void setBibliotheque(ArrayList<Livre> bibliotheque) {
		this.bibliotheque = bibliotheque;
	}
	
	private void delLivre(String ref) {
		
		Livre livre = find(ref);
		
		if(livre != null) {
			this.bibliotheque.remove(livre);
		}
	}
	
	private Livre find(String ref) {
		for(Livre livre: this.bibliotheque) {
			if(livre.getReference().equals(ref)) {
				return livre;
			}
		}
		return null;
	}
}
