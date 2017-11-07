<%@ page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceCandidature,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature,
                java.util.List"%>

<%
	IServiceCandidature serviceCandidature = (IServiceCandidature) ServicesLocator.getInstance().getRemoteInterface("ServiceCandidature");
	List<Candidature> candidatures = serviceCandidature.listeDesCandidatures();
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


          	<table aria-describedby="dataTables-example_info" role="grid" class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example">
            <thead>
              <tr role="row">
              	<th aria-label="Identifiant: activate to sort column descending" aria-sort="ascending" style="width: 126px;" colspan="1" rowspan="1" aria-controls="dataTables-example" tabindex="0" class="sorting_asc">Identifiant</th>
              	<th aria-label="Nom/prénom: activate to sort column ascending" style="width: 161px;" colspan="1" rowspan="1" aria-controls="dataTables-example" tabindex="0" class="sorting">Nom/prénom</th>
              	<th aria-label="Adresse postale: activate to sort column ascending" style="width: 184px;" colspan="1" rowspan="1" aria-controls="dataTables-example" tabindex="0" class="sorting">Adresse postale</th>
              	<th aria-label="Adresse email: activate to sort column ascending" style="width: 285px;" colspan="1" rowspan="1" aria-controls="dataTables-example" tabindex="0" class="sorting">Adresse email</th>
              	<th aria-label="Niveau de qualification: activate to sort column ascending" style="width: 250px;" colspan="1" rowspan="1" aria-controls="dataTables-example" tabindex="0" class="sorting">Niveau de qualification</th>
              	<th aria-label="Date de dépôt: activate to sort column ascending" style="width: 163px;" colspan="1" rowspan="1" aria-controls="dataTables-example" tabindex="0" class="sorting">Date de dépôt</th>
              	<th aria-label="Informations: activate to sort column ascending" style="width: 149px;" colspan="1" rowspan="1" aria-controls="dataTables-example" tabindex="0" class="sorting">Informations</th>
              </tr>
            </thead>
            <!--
              Contenu du tableau
            -->
            <tbody>
            <%
              for(Candidature candidature : candidatures)
              {
                %>
                <tr>
                 <td>CAND_<%=candidature.getIdCandidature()%></td>
                 <td><%=candidature.getNom()%></td>
                 <td><%=candidature.getAdressePostale()%></td>
                 <td><%=candidature.getAdresseEmail() %></td>
                 <td><%=candidature.getNiveauQualification().getIntitule()%></td>
                 <td><%= Utils.date2String(candidature.getDateDepot())%></td>
                 <td align="center"><a href="template.jsp?action=infos_candidature&id=<%=candidature.getIdCandidature()%>"><i class="fa fa-eye fa-lg"></i></a></td>
                </tr>
                <%
              }
              %>
           </tbody>
          </table></div></div>
       <p>
        </p><div class="col-md-offset-4 col-md-4">
          <div class="alert alert-success">
            <p class="text-center">Suivre les nouvelles candidatures : <a href="cabinet_recrutement_candidatures_rss.jsp"><i class="fa fa-rss-square fa-lg"></i></a></p>
          </div>
        </div>
        
        <!-- -------------------------- Affichage PIED DE PAGE ------------------------->
        </div> <!-- /.table-responsive -->
      </div> <!-- /.panel-body -->
    </div> <!-- /.panel -->
  </div> <!-- /.col-lg-12 -->
</div> <!-- /.row -->
</div>
