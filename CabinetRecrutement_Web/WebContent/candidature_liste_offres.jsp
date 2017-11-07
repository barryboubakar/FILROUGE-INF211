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
	// Recuperation de la session
	HttpSession maSession = request.getSession();

	// Récupération des services
	IServiceOffreEmploi serviceOffreEmploi = (IServiceOffreEmploi) ServicesLocator.getInstance().getRemoteInterface("ServiceOffreEmploi");
	IServiceCandidature serviceCandidature = (IServiceCandidature) ServicesLocator.getInstance().getRemoteInterface("ServiceCandidature");
	
	boolean gestionOffre = false;
	String plus = "";
	
	List<OffreEmploi> offresEmploi = null;
	
	// Appel de la fonctionnalité désirée auprès du service 
	if(request.getParameter("id_candidature") != null){
		int id = Integer.parseInt(request.getParameter("id_candidature"));
		offresEmploi = serviceOffreEmploi.listeDesOffresPourUneCandidature(id);
	}
	
%>

<!--  ENTETE POUR AFFICHAGE -->
<div class="row">
  <div class="col-lg-12">      
    <div class="panel panel-default">
      <div class="panel-heading"><h3><i class="fa fa-users"></i> Liste des candidatures référencées</h3></div> <!-- /.panel-heading -->
      <div class="panel-body">
        <div class="dataTable_wrapper">
          <div class="dataTables_wrapper form-inline dt-bootstrap no-footer" id="dataTables-example_wrapper">
          	<div class="row"><div class="col-sm-12">
        
<!-- FIN ENTETE POUR AFFICHAGE -->
      

<%
if(offresEmploi.isEmpty()){%>
	<p>Aucune offre d'emploi à afficher</p>
<% } else { %>

<div class="dataTables_wrapper form-inline dt-bootstrap no-footer" id="dataTables-example_wrapper">
	<div class="row">
		<div class="col-sm-6">
			<div id="dataTables-example_length" class="dataTables_length">
			<label>Show <select class="form-control input-sm" aria-controls="dataTables-example" name="dataTables-example_length"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label></div>
		</div>
		<div class="col-sm-6"><div class="dataTables_filter" id="dataTables-example_filter"><label>Search:<input aria-controls="dataTables-example" placeholder="" class="form-control input-sm" type="search"></label>
		</div></div>
	</div>
		
            
<table id="affichage" aria-describedby="dataTables-example_info" role="grid" class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example">
	<thead>
		<tr role="row"> 
			<th tabindex="0" class="sorting" aria-controls="dataTables-example">Numéro</th>
			<th tabindex="0" class="sorting">Titre</th>
			<th tabindex="0" class="sorting">Entreprise</th>
			<th tabindex="0" class="sorting">Niveau de qualification</th>
			<th tabindex="0" class="sorting">Secteur(s) d'activité</th>
			<th tabindex="0" class="sorting">Date de dépôt</th>
			<th tabindex="0" class="sorting">Informations</th>
		</tr>
	</thead>
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
		<td align="center"><a href="template.jsp?action=infos_offre&amp;id=<%=offreEmploi.getIdOffreEmploi()%>"><i class="fa fa-eye fa-lg"></i></a></td>
	</tr>
	<%
		}
	%>
</table>
<% } %>

<a href="index.jsp">Retour au menu</a>

        <!-- -------------------------- Affichage PIED DE PAGE ------------------------->
        </div> <!-- /.table-responsive -->
      </div> <!-- /.panel-body -->
    </div> <!-- /.panel -->
  </div> <!-- /.col-lg-12 -->
</div> <!-- /.row -->
</div>