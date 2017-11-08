<%@ page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceOffreEmploi,
                eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceNiveauQualification,
                eu.telecom_bretagne.cabinet_recrutement.data.model.NiveauQualification,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceSecteurActivite,
                eu.telecom_bretagne.cabinet_recrutement.data.model.SecteurActivite,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise,
                java.util.*, java.util.List, java.util.HashSet"%>


<!---------------------------------------------------- DEBUT DE NOTRE APPLICATION  ----------------------------------->
<%
		// On vérifie si on est en mode traitement ou envois de formulaire
	  	String traitement = request.getParameter("traitement");
		int idOffre = new Integer(request.getParameter("id_offre"));
		
	  if(traitement == null || !traitement.equals("go")) {

		  IServiceNiveauQualification serviceNiveau = (IServiceNiveauQualification) ServicesLocator.getInstance().getRemoteInterface("ServiceNiveauQualification");
    	  List<NiveauQualification> listeNiveau = serviceNiveau.listeDesNiveauxQualifications();
    	  
    	  IServiceSecteurActivite serviceSectAct = (IServiceSecteurActivite) ServicesLocator.getInstance().getRemoteInterface("ServiceSecteurActivite");
    	  List<SecteurActivite> listeSectAct = serviceSectAct.listeDesSecteursActivite();
    	  
    	  IServiceOffreEmploi serviceOffre = (IServiceOffreEmploi) ServicesLocator.getInstance().getRemoteInterface("ServiceOffreEmploi");
    	  OffreEmploi offre = serviceOffre.getOffreEmploi(idOffre);
    	  
    	  Set<SecteurActivite> listeSectOffre = offre.getSecteurActivites();
    	  
%>      
<div class="row">
  <div class="col-lg-12">      
    <div class="panel panel-default">
      <div class="panel-heading"><h3><i class="fa fa-th"></i> Mettre à jour les informations de l'entreprise</h3></div> <!-- /.panel-heading -->
      <div class="panel-body">
      
            <div class="col-lg-offset-2 col-lg-8               col-xs-12">
            
              <form role="form" action="template.jsp" method="get">
                <input name="action" value="maj_candidature" type="hidden">
                <input name="traitement" value="go" type="hidden">
                <input name="id_offre" value="<%= offre.getIdOffreEmploi()%>" type="hidden">
                
                <div class="form-group">
                  <input class="form-control" placeholder="ID de l'ofre" name="id" disabled="disabled" value="<%= offre.getIdOffreEmploi() %>">
                </div>
                
                <div class="form-group">
                  <input class="form-control" placeholder="Titre de l'offre" name="titre" required value="<%= offre.getTitre() %>">
                </div>
                
                <div class="form-group">
                  <input class="form-control" placeholder="Descriptif de la mission" name="descriptif_mission" required value="<%= offre.getDescriptifMission()%>">
                </div>
                
                 <div class="form-group">
                  <input class="form-control" placeholder="Profil recherché" name="profil_recherche" required value="<%= offre.getProfilRecherche() %>">
                </div>
                
             
	            <div class="col-lg-3">
	                  <div class="form-group">
	                    <label>Niveau de qualification</label>
	                    <small>
	                      <div class="radio" required>
	                      <%
	                  	for (NiveauQualification niv : listeNiveau) { %>
	                          <label>
	                            	<%
	                            		if( offre.getNiveauQualification().getIdNiveauQualification().intValue() ==  niv.getIdNiveauQualification().intValue() ) {
	                            	%>	<input name="niveau" value="<%= niv.getIdNiveauQualification() %>" type="radio" required checked><%= niv.getIntitule() %>
	                            	<% } else  { %>
	                            		<input name="niveau" value="<%= niv.getIdNiveauQualification() %>" type="radio" required ><%= niv.getIntitule() %>
	                            	<%
	                            		}
	                            	%>
	                          </label><br>
	                    <% }%>    
						</div>
	                        
	                    </small>
	                  </div>
	             </div>
                
	                <div class="col-lg-9">
	                <div class="form-group">
	                  <label>Secteur(s) d'activité</label>
	                  <small>
	                    <table border="0" width="100%">
	                          <tbody>
	                 			 <% 
								Set<SecteurActivite> secteursActiviteCandidature = offre.getSecteurActivites();
								int [] idSA = new int[secteursActiviteCandidature.size()];
								int i=0;
								for(SecteurActivite secteurActivite : secteursActiviteCandidature){
									idSA[i] = secteurActivite.getIdSecteurActivite();
									i++;
								}
								for(SecteurActivite sA : listeSectAct){
									String checked = "";
									for(i=0 ; i<idSA.length ; i++){
										if(sA.getIdSecteurActivite() == idSA[i]) checked = "checked";
									}%>
	                            <tr>
	                            		<td>
											<input name="secteur" value="<%= sA.getIdSecteurActivite() %>" type="checkbox" <%=checked %>><%= sA.getIntitule() %>
	                            		</td>
	                            </tr>  
	                            <% } 
	                            %>                   
	                    	</tbody>
	                    </table>                
	                  </small>
	                </div>
	                </div>
                <div class="col-lg-12">
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
	                <i class="glyphicon glyphicon-remove-sign fa-lg"></i> Supprimer cette offre d'emploi
	              </button>
	              <!-- Modal -->
	              <div class="modal fade" id="modalSuppressionOffre" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
	                <div class="modal-dialog">
	                  <div class="modal-content">
	                    <div class="modal-header">
	                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                      <h4 class="modal-title" id="myModalLabel">Êtes-vous sûr de vouloir supprimer votre offre<br> ?</h4>
	                    </div>
	                    <div class="modal-body">
	                      Attention, cette opération n'est pas réversible !
	                    </div>
	                    <div class="modal-footer">
	                      <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
	                      <button type="button" class="btn btn-primary" onclick="window.location.href='suppression_offre.jsp?sup=<%= offre.getIdOffreEmploi() %>'">
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
				OffreEmploi offre;
				
			// Variable a traiter
		    	String traitement_titre = request.getParameter("titre");
		    	String traitement_descriptif = request.getParameter("descriptif_mission");
				String traitement_profil = request.getParameter("profil_recherche");
			  	String traitement_niveau = request.getParameter("niveau");
			  	String traitement_secteur[] = request.getParameterValues("secteur");
			
			  	
			    // Variable pour inserer
		   		String titre = null;
		    	String descriptif = null;
		    	String profil = null;
		    	Integer niveau = null;
		    	ArrayList<Integer> secteurs = new ArrayList<Integer>();
		    	
		    	  // Traitement des variables
				if(traitement_titre != null || !traitement_titre.equals(""))
					titre = traitement_titre;
		    
				if(traitement_descriptif != null || !traitement_descriptif.equals(""))
					descriptif = traitement_descriptif;
	 
				if(traitement_profil != null || !traitement_profil.equals("")){
					profil = traitement_profil;
				}
				
				if(traitement_niveau != null || !traitement_niveau.equals("")){
					niveau = Integer.parseInt(traitement_niveau);
				}

				if(traitement_secteur != null || !traitement_secteur[0].equals("")){
					for(int i=0;i<traitement_secteur.length;i++){
						secteurs.add(Integer.parseInt(traitement_secteur[i]));
					}	
				} 
				
				IServiceOffreEmploi serviceOffreEmploi = (IServiceOffreEmploi) ServicesLocator.getInstance().getRemoteInterface("ServiceOffreEmploi");  
				offre = serviceOffreEmploi.updateOffreEmploi(idOffre, titre, descriptif, profil, niveau, secteurs);
			 				
		%>
		<div class="row">
  <div class="col-lg-12">      
    <div class="panel panel-default">
      <div class="panel-heading"><h3><i class="glyphicon glyphicon-transfert"></i>Mettre à jour les informations de l'offre d'emploi</h3></div> <!-- /.panel-heading -->
      <div class="panel-body">
      
        
              <div class="col-lg-offset-2 col-lg-8
                          col-xs-12">
                <div class="panel panel-success">
                  <div class="panel-heading">
                    Informations mises à jour pour l'offre
                  </div>
                  <div class="panel-body">

                   <small>
                     <table class="table">
                       <tbody>
                         <tr class="success">
                           <td><strong>Identifiant de l'offre</strong></td>
                           <td><%=offre.getIdOffreEmploi()%></td>
                         </tr>
                         <tr class="warning">
                           <td><strong>Titre</strong></td>
                           <td><%= offre.getTitre()%></td>
                         </tr>
                         <tr class="warning">
                           <td><strong>Descriptif de la mission</strong></td>
                           <td><%= offre.getDescriptifMission()%></td>
                         </tr>
                         <tr class="warning">
                           <td><strong>Profil recherché</strong></td>
                           <td><%= offre.getProfilRecherche()%></td>
                         </tr>
                         <tr class="warning">
                           <td><strong>Niveau de qualification</strong></td>
                           <td><%=offre.getNiveauQualification().getIntitule()%></td>
                         </tr>
                         <tr class="warning">
                           <td><strong>Secteur(s) d'activité</strong></td>
                           <td>
                             <ul><% for (SecteurActivite sect : offre.getSecteurActivites()){ %>               
                                 <li><%=sect.getIntitule() %></li>
                                 <%  } %>
                             </ul>
                           </td>
                         </tr>
                         <tr class="warning">
                           <td><strong>Date de dépôt</strong></td>
                           <td><%=Utils.date2String(offre.getDateDepot()) %></td>
                         </tr>
                       </tbody>
                     </table>
                   </small>
                  </div>
                </div>
              </div>
              
     	 </div>
		<%
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