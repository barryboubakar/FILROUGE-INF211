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

	// R�cup�ration des services
	IServiceOffreEmploi serviceOffreEmploi = (IServiceOffreEmploi) ServicesLocator.getInstance().getRemoteInterface("ServiceOffreEmploi");
	IServiceCandidature serviceCandidature = (IServiceCandidature) ServicesLocator.getInstance().getRemoteInterface("ServiceCandidature");
	
	boolean gestionOffre = false;
	String plus = "";
	
	List<OffreEmploi> offresEmploi = null;
	
	// Appel de la fonctionnalit� d�sir�e aupr�s du service 
	if(request.getParameter("id_entreprise") != null){
		int id = Integer.parseInt(request.getParameter("id_entreprise"));
		offresEmploi = serviceOffreEmploi.listeDesOffresPourUneEntreprise(id);
	}
%>

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading"><h3><i class="glyphicon glyphicon-transfer"></i> Liste des offres d'emploi r�f�renc�es</h3></div> <!-- /.panel-heading -->
      <div class="panel-body">
       <div class="dataTable_wrapper">
      <div class="dataTables_wrapper form-inline dt-bootstrap no-footer" id="dataTables-example_wrapper">
          <div class="row"><div class="col-sm-12">
      

<%
if(offresEmploi.isEmpty()){ %>
	<p>Aucune offre d'emploi � afficher</p>
<% }  else { %>

	<table aria-describedby="dataTables-example_info" role="grid" class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example">
	<thead>
	<tr role="row"> 
		<th tabindex="0" class="sorting" aria-controls="dataTables-example">Num�ro</th>
		<th tabindex="0" class="sorting">Titre</th>
		<th tabindex="0" class="sorting">Entreprise</th>
		<th tabindex="0" class="sorting">Niveau de qualification</th>
		<th tabindex="0" class="sorting">Secteur(s) d'activit�</th>
		<th tabindex="0" class="sorting">Date de d�p�t</th>
		<th tabindex="0" class="sorting">Candidatures potentielles</th>
		<th tabindex="0" class="sorting">Modification</th>
		<th tabindex="0" class="sorting">Informations</th>
	</tr>
	</thead>
	<tbody>
	<%
		Set<SecteurActivite> secteursActivite ;
		List<Candidature> candidatures;
		
		for (OffreEmploi offreEmploi : offresEmploi) {
			secteursActivite = offreEmploi.getSecteurActivites();
			candidatures = serviceCandidature.listeDesCandidaturesPourUneOffre(offreEmploi.getIdOffreEmploi());
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
				<a href="template.jsp?action=infos_candidature&id=<%=candidature.getIdCandidature()%> "> <%=candidature.getPrenom()%> <%= candidature.getNom().toUpperCase() %></a><br>
			<% } %>
		</td>
		<td align="center">
                        <a href="template.jsp?action=maj_offre&id_offre=<%=offreEmploi.getIdOffreEmploi()%>"><i class="fa fa-pencil-square-o fa-lg"></i></a>     
        </td>
		<td align="center">
			<a href="template.jsp?action=infos_offre&amp;id=<%=offreEmploi.getIdOffreEmploi()%>"><i class="fa fa-eye fa-lg"></i></a>
		</td>
	</tr>
	<%
		}
	%>
	  </tbody>
</table>	
<% } %>

			</div>
			</div>
		  </div> <!-- /.table-responsive -->
      </div> <!-- /.panel-body -->
    </div> <!-- /.panel -->
  </div> <!-- /.col-lg-12 -->
</div> <!-- /.row -->
</div>
