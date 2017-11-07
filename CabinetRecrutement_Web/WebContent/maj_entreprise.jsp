<%@ page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceEntreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise"%>
                
                <!--  ENTETE POUR AFFICHAGE -->
<div class="row">
  <div class="col-lg-12">      
    <div class="panel panel-default">
      <div class="panel-heading"><h3><i class="fa fa-th"></i> Mettre à jour les informations de l'entreprise</h3></div> <!-- /.panel-heading -->
      <div class="panel-body">
       
        
<!-- FIN ENTETE POUR AFFICHAGE -->

<!---------------------------------------------------- DEBUT DE NOTRE APPLICATION  ----------------------------------->
<%
		// On vérifie si on est en mode traitement ou envois de formulaire
	  	String traitement = request.getParameter("traitement");
		int idEntreprise = new Integer(request.getParameter("id_entreprise"));
		
	  if(traitement == null || !traitement.equals("go")) {

		// Récupération des services
			IServiceEntreprise serviceEntreprise = (IServiceEntreprise) ServicesLocator.getInstance().getRemoteInterface("ServiceEntreprise");
		    Entreprise ent = serviceEntreprise.getEntreprise(idEntreprise);
%>
		 <div class="col-lg-offset-2 col-lg-8 col-xs-12">
              <form role="form" action="template.jsp" method="get">
   
                <input name="action" value="maj_entreprise" type="hidden">
                <input name="traitement" value="go" type="hidden">
                <input name="id_entreprise" value="<%= ent.getIdEntreprise() %>" type="hidden">
                
                 <div class="form-group">
                  <input class="form-control" placeholder="ID de l'entreprise" name="id" disabled="disabled" value="ENT_<%= ent.getIdEntreprise() %>">
                </div>
                
                <div class="form-group">
                  <input class="form-control" placeholder="Nom de l'entreprise" name="nom" required value="<%= ent.getNom() %>">
                </div>
                
                <div class="form-group">
                  <textarea class="form-control" placeholder="Descriptif de l'entreprise" rows="5" name="descriptif"><%= ent.getDescriptif() %></textarea>
                </div>
                
                <div class="form-group">
                  <input class="form-control" placeholder="Adresse postale (ville)" name="adresse_postale" value="<%= ent.getAdressePostale() %>"required>
                </div>
                
                <div class="text-center">
                  <button type="submit" class="btn btn-success btn-circle btn-lg" name="submit-insertion"><i class="fa fa-check"></i></button>
                  <button type="reset" class="btn btn-warning btn-circle btn-lg"><i class="fa fa-times"></i></button>
                </div>
                </form>
                </div>
                
                <div class="col-lg-12 text-center">
	              <br>
	              <!-- Button trigger modal -->
	              <button class="btn btn-danger" data-toggle="modal" data-target="#modalSuppressionCandidature">
	                <i class="glyphicon glyphicon-remove-sign fa-lg"></i> Supprimer cette entreprise
	              </button>
	              <!-- Modal -->
	              <div class="modal fade" id="modalSuppressionCandidature" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
	                <div class="modal-dialog">
	                  <div class="modal-content">
	                    <div class="modal-header">
	                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                      <h4 class="modal-title" id="myModalLabel">Êtes-vous sûr de vouloir supprimer votre entreprise<br>et les offres d'emploi associées ?</h4>
	                    </div>
	                    <div class="modal-body">
	                      Attention, cette opération n'est pas réversible !
	                    </div>
	                    <div class="modal-footer">
	                      <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
	                      <button type="button" class="btn btn-primary" onclick="window.location.href='template.jsp?action=suppression_entreprise&id_entreprise=<%= ent.getIdEntreprise() %>'">
	                        Supprimer
	                      </button>
	                    </div>
	                  </div> <!-- /.modal-content -->
	                </div> <!-- /.modal-dialog -->
	              </div> <!-- /.modal -->
            	</div>
                
              
              
              
<%
	}
	else {		
	
		try {
		    // Variable a traiter
		    String traitement_nom = request.getParameter("nom");
		  	String traitement_descriptif = request.getParameter("descriptif");
		  	String traitement_adresse_postale = request.getParameter("adresse_postale");
	  	
	    // Variable pour inserer
	   		String nom = null;
	    	String descriptif = null;
	   		String adresse_postale  = null;
	    
	    // Traitement des variables
			if(traitement_nom != null || !traitement_nom.equals(""))
				nom = traitement_nom;
			if(traitement_descriptif != null)
				descriptif = traitement_descriptif;
			if(traitement_adresse_postale != null || !traitement_adresse_postale.equals(""))
				adresse_postale = traitement_adresse_postale;
			
			if((nom != null) && (adresse_postale != null)){
			      IServiceEntreprise serviceEntreprise = (IServiceEntreprise) ServicesLocator.getInstance().getRemoteInterface("ServiceEntreprise");
			      Entreprise entreprise = serviceEntreprise.updateEntreprise(idEntreprise,nom,adresse_postale,descriptif);
			
			      %>
			      <div class="col-lg-offset-2 col-lg-8 col-xs-12">
			      <div class="panel panel-success">
		                  <div class="panel-heading">
		                   Informations mises à jour pour l'entreprise 
		                  </div>
		                  <div class="panel-body">
		                    <small>
		                      <table class="table">
		                        <tbody>
		                          <tr class="success">
		                            <td><strong>Identifiant (login)</strong></td>
		                            <td>ENT_<%=entreprise.getIdEntreprise() %></td>
		                          </tr>
		                          <tr class="warning">
		                            <td><strong>Nom</strong></td>
		                            <td><%= entreprise.getNom() %></td>
		                          </tr>
		                          <tr class="warning">
		                            <td><strong>Adresse postale (ville)</strong></td>
		                            <td><%= entreprise.getAdressePostale() %></td>
		                          </tr>
		                          <tr class="warning">
		                            <td><strong>Descriptif</strong></td>
		                            <td><%= entreprise.getDescriptif() %></td>
		                          </tr>
		                        </tbody>
		                      </table>
		                    </small>
		                  </div>
                  </div>
                  </div>
             <%
				}
			}
			catch(NumberFormatException e)
		    {
		      String erreur = "La valeur de l'identifiant n'est pas numérique";
		    }

		}

%>

        <!-- -------------------------- Affichage PIED DE PAGE ------------------------->
    </div> <!-- /.panel -->
  </div> <!-- /.col-lg-12 -->
</div> <!-- /.row -->
</div>