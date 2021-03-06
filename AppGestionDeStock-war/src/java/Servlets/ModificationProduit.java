/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import EjbSession.MarqueFacadeLocal;
import EjbSession.ProduitFacadeLocal;
import Entites.Marque;
import Entites.Produit;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
public class ModificationProduit extends HttpServlet {

    @EJB
    private MarqueFacadeLocal marqueFacade;

    @EJB
    private ProduitFacadeLocal produitFacade;

     
 /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String nom = request.getParameter("nom");
            request.setAttribute( "nom", nom );
            String nomMarque = request.getParameter("nomMarque");
            request.setAttribute( "nomMarque", nomMarque );
            String denomination = request.getParameter("denomination");
            request.setAttribute( "denomination", denomination );
            String prix = request.getParameter("prix");
            request.setAttribute( "prix", prix );
            String poids = request.getParameter("poids");
            request.setAttribute( "poids", poids );
            String volume = request.getParameter("volume");
            request.setAttribute( "volume", volume );
             List<Marque> Listmarque = marqueFacade.findAll();
            request.setAttribute( "ListMarque", Listmarque );
            this.getServletContext().getRequestDispatcher("/WEB-INF/ModificationProduit.jsp").forward(request, response);
        }catch(Exception e){ System.out.println(e);}
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String reference = request.getParameter("nom");
            String nomMarque= request.getParameter("nomMarque");
            String denomination = request.getParameter("denomination");
            float prix= Float.parseFloat(request.getParameter("prix"));
            float poids= Float.parseFloat(request.getParameter("poids"));
            float volume= Float.parseFloat(request.getParameter("volume"));
            boolean b=false;
            Marque marqueP = marqueFacade.findMarque(nomMarque);
            Produit p = new Produit(reference, marqueP, denomination, prix, poids, volume);
            b=produitFacade.editP(p) ;
            
            if(b){
                response.sendRedirect("Produits");
            }else{
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Nouvelle marque</title>");            
                out.println("</head>");
                out.println("<body>");
                out.println("<H4 style=\"text-align: center\">Il semble que le produit "+reference+" rencontre un probl??me</H4>");
                out.println("<form  action = \"http://localhost:8080/AppGestionDeStock-war/Produits\" METHOD = \"GET\">");
                out.println("<input type=\"submit\" value=\"Retour\" style=\"width: 200px; margin-left: 40px; color: white; background-color: #1c355e; font-weight: 140px; height:30px\"/>");
                out.println("</form>");
                out.println("</body>");
                out.println("</html>");
            }
            
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>


}
