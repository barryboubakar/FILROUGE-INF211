<%
//Suppression de la candidature
		Object utilisateur = session.getAttribute("utilisateur");
		session.invalidate();
%>			
<%@ page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceEntreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise"%>
                
                
                <!--  ENTETE POUR AFFICHAGE -->
<!DOCTYPE html>
<html lang="en">
  <jsp:include page="fragments/head.html" />
  <body>
    <div id="wrapper">
      <!-- Navigation -->
      <nav class="navbar
                  navbar-default
                  navbar-static-top"
           role="navigation"
           style="margin-bottom: 0">
        <jsp:include page="fragments/bandeau.jsp" />
        <jsp:include page="fragments/menu.jsp" />
      </nav>
      <div id="page-wrapper">
        <p style="font-size: 5">&nbsp;</p>


<div class="row">
  <div class="col-lg-12">      
    <div class="panel panel-default">
      <div class="panel-heading"><h3><i class="fa fa-user"></i> Suppression d'une entreprise</h3></div> <!-- /.panel-heading -->
      <div class="panel-body">

<!-- FIN ENTETE POUR AFFICHAGE -->

<div class="col-lg-offset-2 col-lg-8 col-xs-12">
<%
		// On v�rifie si on est en mode traitement ou envois de formulaire
		int idEntreprise = new Integer(request.getParameter("id_entreprise"));

		//R�cup�ration du service et de l'entreprise
		IServiceEntreprise serviceEntreprise = (IServiceEntreprise) ServicesLocator.getInstance().getRemoteInterface("ServiceEntreprise");
		Entreprise e = serviceEntreprise.getEntreprise(idEntreprise);
		
		//Suppression de l'entreprise
		serviceEntreprise.removeEntreprise(idEntreprise);

%>

	<div class="panel-body">
        
            <div class="row col-xs-offset-1 col-xs-10">
                  <div class="alert alert-danger text-center">
                    L'entreprise <strong><%= e.getNom() %></strong> (identifiant=ENT_<%= e.getIdEntreprise() %>) a �t� supprim�e.
                  </div>
            </div>
        
     </div>
     
</div>


        <!-- -------------------------- Affichage PIED DE PAGE ------------------------->
    </div> <!-- /.panel -->
  </div> <!-- /.col-lg-12 -->
</div> <!-- /.row -->
</div>

      </div> <!-- /#page-wrapper -->
    </div> <!-- /#wrapper -->
    <jsp:include page="fragments/fin_de_page.html" />
  </body>
</html>