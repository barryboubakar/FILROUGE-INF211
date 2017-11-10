<%@page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceOffreEmploi,
                eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise,
                java.util.*"%>
                
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
      <div class="panel-heading"><h3><i class="glyphicon glyphicon-transfer"></i> Suppression d'une offre d'emploi</h3></div> <!-- /.panel-heading -->
      <div class="panel-body">
       
        
<!-- FIN ENTETE POUR AFFICHAGE -->

<div class="col-lg-offset-2 col-lg-8 col-xs-12">
<%
		// On vérifie si on est en mode traitement ou envois de formulaire
			int idOffre = new Integer(request.getParameter("sup"));
	
		//Récupération du service et de l'offre
			IServiceOffreEmploi serviceOffre = (IServiceOffreEmploi ) ServicesLocator.getInstance().getRemoteInterface("ServiceOffreEmploi");
			OffreEmploi o = serviceOffre.getOffreEmploi(idOffre) ;
			
		//Suppression de l'offre
			serviceOffre.removeOffreEmploi(idOffre) ;
		
%>

	<div class="panel-body">
        
            <div class="row col-xs-offset-1 col-xs-10">
                  <div class="alert alert-danger text-center">
             	 L'offre <strong><%= o.getTitre()%> </strong> (identifiant_offre=<%= o.getIdOffreEmploi()%>) <%= o.getEntreprise().getIdEntreprise()%> a été supprimée. 
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