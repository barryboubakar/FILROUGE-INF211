<%@ page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceOffreEmploi,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceCandidature,
                eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi,
                eu.telecom_bretagne.cabinet_recrutement.data.model.SecteurActivite,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature,
                java.util.LinkedList,
                java.util.List,
                java.util.Set,
                java.text.SimpleDateFormat"%>

<%

	// Récupération des services
	IServiceOffreEmploi serviceOffreEmploi = (IServiceOffreEmploi) ServicesLocator.getInstance().getRemoteInterface("ServiceOffreEmploi");
	IServiceCandidature serviceCandidature = (IServiceCandidature) ServicesLocator.getInstance().getRemoteInterface("ServiceCandidature");
	
	boolean gestionOffre = false;
	String plus = "";
	
	List<OffreEmploi> offresEmploi = null;
	
	// Appel de la fonctionnalité désirée auprès du service 
	if(request.getParameter("id_entreprise") != null){
		int id = Integer.parseInt(request.getParameter("id_entreprise"));
		offresEmploi = serviceOffreEmploi.listeDesOffresPourUneEntreprise(id);
	}
%>

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading"><h3><i class="glyphicon glyphicon-transfer"></i> Liste des offres d'emploi référencées</h3></div> <!-- /.panel-heading -->
      <div class="panel-body">
     
          <div class="row"><div class="col-sm-12">
      

<%
if(offresEmploi.isEmpty()){%>
	<p>Aucune offre d'emploi à afficher</p>
<% } else { %>

<table id="affichage" aria-describedby="dataTables-example_info" role="grid" class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example">
	<tr role="row"> 
		<th tabindex="0" class="sorting" aria-controls="dataTables-example">Numéro</th>
		<th tabindex="0" class="sorting">Titre</th>
		<th tabindex="0" class="sorting">Entreprise</th>
		<th tabindex="0" class="sorting">Niveau de qualification</th>
		<th tabindex="0" class="sorting">Secteur(s) d'activité</th>
		<th tabindex="0" class="sorting">Date de dépôt</th>
		<th tabindex="0" class="sorting">Candidatures potentielles</th>
		<th tabindex="0" class="sorting">Modification</th>
		<th tabindex="0" class="sorting">Informations</th>
	</tr>
	<%
		Set<SecteurActivite> secteursActivite ;
		List<Candidature> candidatures;
		for (OffreEmploi offreEmploi : offresEmploi) {
			secteursActivite = offreEmploi.getSecteurActivites();
			candidatures = serviceCandidature.listeDesCandidatures();
	%>
	<tr>
		<td><%=offreEmploi.getIdOffreEmploi()%></td>
		<td><%=offreEmploi.getTitre()%></td>
		<td><%=offreEmploi.getEntreprise().getNom()%></td>
		<td><%=offreEmploi.getNiveauQualification().getIntitule()%></td>
		<td>
			<% for(SecteurActivite secteurActivite : secteursActivite){ %>
				<%=secteurActivite.getIntitule() %><br/>
			<% } %>
		</td>
		<td><%=Utils.date2String(offreEmploi.getDateDepot())%></td>
		<td>
			<% for(Candidature candidature : candidatures){ %>
				<a href="template.jsp?action=infos_candidature&id=<%=candidature.getIdCandidature()%> "> <%=candidature.getPrenom()%> <%= candidature.getNom().toUpperCase() %></br>
			<% } %>
		</td>
		<td align="center">
                        <a href="template.jsp?action=maj_offre&id_offre=<%=offreEmploi.getIdOffreEmploi()%>"><i class="fa fa-pencil-square-o fa-lg"></i></a>     
        </td>
		<td align="center"><a href="template.jsp?action=infos_offre&amp;id=<%=offreEmploi.getIdOffreEmploi()%>"><i class="fa fa-eye fa-lg"></i></a></td>
	</tr>
	<%
		}
	%>
</table>
<% } %>

<a href="index.jsp">Retour au menu</a>

      </div> <!-- /.panel-body -->
    </div> <!-- /.panel -->
  </div> <!-- /.col-lg-12 -->
</div> <!-- /.row -->