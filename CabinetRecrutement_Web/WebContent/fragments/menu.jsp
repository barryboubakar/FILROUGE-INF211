<%@page import="eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceEntreprise,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceCandidature,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceOffreEmploi,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature,
                java.util.List"%>

<%
  Object utilisateur = session.getAttribute("utilisateur");

%>

<div class="navbar-default sidebar" role="navigation">
  <div class="sidebar-nav navbar-collapse">
  
    <ul class="nav" id="side-menu">

      <!--
        MENU PRINCIPAL
      -->

      <li><a href="index.jsp"><i class="fa fa-home"></i> Accueil</a></li>
      <li>
        <a href="#"><i class="fa fa-th"></i> Gestion des entreprises<span class="fa arrow"></span></a>
        <ul class="nav nav-second-level">
          <li><a href="template.jsp?action=nouvelle_entreprise">Nouvelle entreprise</a></li>
          <li><a href="template.jsp?action=liste_entreprises">Liste des entreprises</a></li>
          <li><a href="template.jsp?action=liste_offres">Liste de toutes les offres d'emploi</a></li>
        </ul> <!-- /.nav-second-level -->
      </li>
      <li>
        <a href="#"><i class="fa fa-users"></i> Gestion des candidatures<span class="fa arrow"></span></a>
        <ul class="nav nav-second-level">
          <li><a href="template.jsp?action=nouvelle_candidature">Nouvelle candidature</a></li>
          <li><a href="template.jsp?action=liste_candidatures">Liste des candidatures</a></li>
        </ul> <!-- /.nav-second-level -->
      </li>

      <!--
        MENU SECONDAIRE
      -->

      <li><h4>&nbsp;</h4></li>
<%      if(utilisateur instanceof Entreprise)
	  	{
			Entreprise e = (Entreprise) utilisateur;
%>  		
      <li><a href="#"><i class="fa fa-th"></i> Menu <strong>ENTREPRISE</strong><span class="fa arrow"></span></a>
      <ul class="nav nav-second-level">
              <li><a href="template.jsp?action=maj_entreprise&id_entreprise=<%= e.getIdEntreprise() %>">Mettre à jour les informations de l'entreprise</a></li>
              <li><a href="template.jsp?action=nouvelle_offre">Nouvelle offre d'emploi</a></li>
              <li>
                <a href="template.jsp?action=entreprise_liste_offres&id_entreprise=<%= e.getIdEntreprise() %>">Liste de mes offres d'emploi (<%= e.getOffreEmplois().size()%>)</a>
              </li>
            </ul> <!-- /.nav-second-level -->
      </li>
      
<%	
		} 	
		else if(utilisateur instanceof Candidature)
	  	{
			// Récupération des services
			IServiceOffreEmploi serviceOffreEmploi = (IServiceOffreEmploi) ServicesLocator.getInstance().getRemoteInterface("ServiceOffreEmploi");
	  		Candidature c = (Candidature) utilisateur;
	  		
	  		List<OffreEmploi> offresEmploi = null;

		  	// On recupere les offres qui matchs
		  	offresEmploi = serviceOffreEmploi.listeDesOffresPourUneCandidature(c.getIdCandidature());
		 
%>
			<li>
            <a href="#"><i class="fa fa-user"></i> Menu <strong>CANDIDATURE</strong><span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
              <li><a href="template.jsp?action=maj_candidature&id_candidature=<%= c.getIdCandidature()%> ">Mettre à jour les informations de la candidature</a></li>
              <li>
                <a href="template.jsp?action=candidature_liste_offres&id_candidature=<%= c.getIdCandidature()%> "> Liste des offres d'emploi potentielles (<%= offresEmploi.size()%>)
                </a>
              </li>
            </ul> <!-- /.nav-second-level -->
          </li>	  
<%	  	
	  	}
%>
    </ul>
  </div> <!-- /.sidebar-collapse -->
</div> <!-- /.navbar-static-side -->
