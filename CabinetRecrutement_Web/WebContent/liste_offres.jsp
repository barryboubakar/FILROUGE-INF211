<%@ page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
				eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceOffreEmploi,
                eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi,
                java.util.List"%>

<%
  IServiceOffreEmploi serviceOffreEmploi = (IServiceOffreEmploi) ServicesLocator.getInstance().getRemoteInterface("ServiceOffreEmploi");
  List<OffreEmploi> offres = serviceOffreEmploi.listeDesOffres();
%>


<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading"><h3><i class="glyphicon glyphicon-transfer"></i> Liste de toutes les offres d'emploi référencées</h3></div> <!-- /.panel-heading -->
      <div class="panel-body">
     
          <div class="row"><div class="col-sm-12">
          
          <table aria-describedby="dataTables-example_info" role="grid" class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example"> 
            <!--
              Nom des colonnes
            -->
            <thead>
              <tr role="row">
              	<th aria-label="Numéro: activate to sort column descending" aria-sort="ascending" style="width: 118px;" colspan="1" rowspan="1" aria-controls="dataTables-example" tabindex="0" class="sorting_asc">Numéro</th>
              	<th aria-label="Titre: activate to sort column ascending" style="width: 358px;" colspan="1" rowspan="1" aria-controls="dataTables-example" tabindex="0" class="sorting">Titre</th>
              	<th aria-label="Entreprise: activate to sort column ascending" style="width: 238px;" colspan="1" rowspan="1" aria-controls="dataTables-example" tabindex="0" class="sorting">Entreprise</th>
              	<th aria-label="Niveau de qualification: activate to sort column ascending" style="width: 283px;" colspan="1" rowspan="1" aria-controls="dataTables-example" tabindex="0" class="sorting">Niveau de qualification</th>
              	<th aria-label="Date de dépôt: activate to sort column ascending" style="width: 186px;" colspan="1" rowspan="1" aria-controls="dataTables-example" tabindex="0" class="sorting">Date de dépôt</th>
              	<th aria-label="Informations: activate to sort column ascending" style="width: 171px;" colspan="1" rowspan="1" aria-controls="dataTables-example" tabindex="0" class="sorting">Informations</th>
              </tr>
            </thead>
            <!--
              Contenu du tableau
            -->
            <tbody>
              <%
              for(OffreEmploi offreEmp : offres)
              {
                %>                   
            	<tr>
                    <td><%=offreEmp.getIdOffreEmploi()%></td>
                    <td><%=offreEmp.getTitre()%></td>
                    <td><%=offreEmp.getEntreprise().getNom() %></td>
                    <td><%=offreEmp.getNiveauQualification().getIntitule() %></td>
                    <td><%=  Utils.date2String(offreEmp.getDateDepot())%> </td>                   
                    <td align="center"><a href="template.jsp?action=infos_offre&amp;id=<%=offreEmp.getIdOffreEmploi()%>"><i class="fa fa-eye fa-lg"></i></a></td>
                </tr>
                <%
              }
              %>
            </tbody>
          </table>
         </div>
        </div> <!-- /.table-responsive -->
        <p>
        </p>
        <div class="col-md-offset-4 col-md-4">
          <div class="alert alert-success">
            <p class="text-center">Suivre les nouvelles offres d'emploi : <a href="cabinet_recrutement_offres_rss.jsp"><i class="fa fa-rss-square fa-lg"></i></a></p>
          </div>
        </div>
      </div> <!-- /.panel-body -->
    </div> <!-- /.panel -->
  </div> <!-- /.col-lg-12 -->
</div> <!-- /.row -->

      