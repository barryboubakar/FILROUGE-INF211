<%@ page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceCandidature,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceNiveauQualification,
                eu.telecom_bretagne.cabinet_recrutement.data.model.NiveauQualification,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceSecteurActivite,
                eu.telecom_bretagne.cabinet_recrutement.data.model.SecteurActivite,
                java.util.*, java.util.List, java.util.HashSet"%>


<!---------------------------------------------------- DEBUT DE NOTRE APPLICATION  ----------------------------------->
<%
		// On vérifie si on est en mode traitement ou envois de formulaire
	  	String traitement = request.getParameter("traitement");
		int idCandidature = new Integer(request.getParameter("id_candidature"));
		
	  if(traitement == null || !traitement.equals("go")) {

		  IServiceNiveauQualification serviceNiveau = (IServiceNiveauQualification) ServicesLocator.getInstance().getRemoteInterface("ServiceNiveauQualification");
    	  List<NiveauQualification> listeNiveau = serviceNiveau.listeDesNiveauxQualifications();
    	  
    	  IServiceSecteurActivite serviceSectAct = (IServiceSecteurActivite) ServicesLocator.getInstance().getRemoteInterface("ServiceSecteurActivite");
    	  List<SecteurActivite> listeSectAct = serviceSectAct.listeDesSecteursActivite();
    	  
    	  IServiceCandidature serviceCand = (IServiceCandidature) ServicesLocator.getInstance().getRemoteInterface("ServiceCandidature");
    	  Candidature cand = serviceCand.getCandidature(idCandidature);
    	  
    	  Set<SecteurActivite> listeSectCand = cand.getSecteurActivites();
    	  
%>      
<div class="row">
  <div class="col-lg-12">      
    <div class="panel panel-default">
      <div class="panel-heading"><h3><i class="fa fa-user"></i> Mettre à jour les informations de la candidature</h3></div> <!-- /.panel-heading -->
      <div class="panel-body">
      
            <div class="col-lg-offset-2 col-lg-8               col-xs-12">
            
              <form role="form" action="template.jsp" method="get">
                <input name="action" value="maj_candidature" type="hidden">
                <input name="traitement" value="go" type="hidden">
                <input name="id_candidature" value="<%= cand.getIdCandidature() %>" type="hidden">
                
                <div class="form-group">
                  <input class="form-control" placeholder="ID de la candidature" name="id" disabled="disabled" value="CAND_<%= cand.getIdCandidature() %>">
                </div>
                
                <div class="form-group">
                  <input class="form-control" placeholder="Nom" name="nom" required value="<%= cand.getNom() %>">
                </div>
                
                <div class="form-group">
                  <input class="form-control" placeholder="Prénom" name="prenom" required value="<%= cand.getPrenom() %>">
                </div>
                
                <div class="form-group">
                  <input class="form-control" placeholder="Date de naissance (format jj/mm/aaaa)" name="date_naissance" required value="<%= Utils.date2String(cand.getDateNaissance()) %>">
                </div>
                
                <div class="form-group">
                  <input class="form-control" placeholder="Adresse postale (ville)" name="adresse_postale" required value="<%= cand.getAdressePostale() %>">
                </div>
                
                <div class="form-group">
                  <input class="form-control" placeholder="Adresse email" name="adresse_email" required value="<%= cand.getAdresseEmail() %>">
                </div>
                
                <div class="form-group">
                  <textarea class="form-control" placeholder="Curriculum vitæ" rows="5" name="cv" required> <%= cand.getCv() %></textarea>
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
	                            		if( cand.getNiveauQualification().getIdNiveauQualification().intValue() ==  niv.getIdNiveauQualification().intValue() ) {
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
								Set<SecteurActivite> secteursActiviteCandidature = cand.getSecteurActivites();
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
	                <i class="glyphicon glyphicon-remove-sign fa-lg"></i> Supprimer cette candidature
	              </button>
	              <!-- Modal -->
	              <div class="modal fade" id="modalSuppressionCandidature" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
	                <div class="modal-dialog">
	                  <div class="modal-content">
	                    <div class="modal-header">
	                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                      <h4 class="modal-title" id="myModalLabel">Êtes-vous sûr de vouloir supprimer votre candidature<br> ?</h4>
	                    </div>
	                    <div class="modal-body">
	                      Attention, cette opération n'est pas réversible !
	                    </div>
	                    <div class="modal-footer">
	                      <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
	                      <button type="button" class="btn btn-primary" onclick="window.location.href='suppression_candidature.jsp?sup=<%= cand.getIdCandidature() %>'">
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
				Candidature candidature;
				
				System.out.println(idCandidature);
				
		    // Variable a traiter
		    	String traitement_nom = request.getParameter("nom");
		    	String traitement_prenom = request.getParameter("prenom");
				String traitement_date_naissance = request.getParameter("date_naissance");
			  	String traitement_adresse_postale = request.getParameter("adresse_postale");
			  	String traitement_adresse_email = request.getParameter("adresse_email");
			  	String traitement_cv = request.getParameter("cv");
			  	String traitement_niveau = request.getParameter("niveau");
			  	String traitement_secteur[] = request.getParameterValues("secteur");
			
			  	
		    // Variable pour inserer
		   		String nom = null;
		    	String prenom = null;
		    	Date date_naissance = null;
		    	String adresse_postale = null;
		    	String adresse_email = null;
		    	String cv = null;
		    	Integer niveau = null;
		    	ArrayList<Integer> secteurs = new ArrayList<Integer>();
		    	
		    // Traitement des variables
				if(traitement_nom != null || !traitement_nom.equals(""))
					nom = traitement_nom;
		    
				if(traitement_prenom != null || !traitement_prenom.equals(""))
					prenom = traitement_prenom;
	 
				if(traitement_date_naissance != null || !traitement_date_naissance.equals("")){
					date_naissance = Utils.string2Date(traitement_date_naissance);
				}
				
				if(traitement_adresse_postale != null || !traitement_adresse_postale.equals(""))
					adresse_postale = traitement_adresse_postale;
				
				if(traitement_adresse_email != null || !traitement_adresse_email.equals(""))
					adresse_email = traitement_adresse_email;
				
				if(traitement_cv != null || !traitement_cv.equals(""))
					cv = traitement_cv;
				
				if(traitement_niveau != null || !traitement_niveau.equals("")){
					niveau = Integer.parseInt(traitement_niveau);
				}
					
				if(traitement_secteur != null || !traitement_secteur[0].equals("")){
					for(int i=0;i<traitement_secteur.length;i++){
						secteurs.add(Integer.parseInt(traitement_secteur[i]));
					}	
				}
				
				
				 IServiceCandidature serviceCandidature = (IServiceCandidature) ServicesLocator.getInstance().getRemoteInterface("ServiceCandidature");  
			     candidature = serviceCandidature.updateCandidature(idCandidature,nom, prenom, date_naissance, adresse_postale, adresse_email, cv, niveau, secteurs);					
		%>
		<div class="row">
  <div class="col-lg-12">      
    <div class="panel panel-default">
      <div class="panel-heading"><h3><i class="fa fa-th"></i>Mettre à jour les informations de la candidature</h3></div> <!-- /.panel-heading -->
      <div class="panel-body">
      
        
              <div class="col-lg-offset-2 col-lg-8
                          col-xs-12">
                <div class="panel panel-success">
                  <div class="panel-heading">
                    Informations mises à jour pour la candidature
                  </div>
                  <div class="panel-body">

                   <small>
                     <table class="table">
                       <tbody>
                         <tr class="success">
                           <td><strong>Identifiant (login)</strong></td>
                           <td><%=candidature.getIdCandidature() %></td>
                         </tr>
                         <tr class="warning">
                           <td><strong>Nom</strong></td>
                           <td><%=candidature.getNom()%></td>
                         </tr>
                         <tr class="warning">
                           <td><strong>Prénom</strong></td>
                           <td><%=candidature.getPrenom()%></td>
                         </tr>
                         <tr class="warning">
                           <td><strong>Date de naissance</strong></td>
                           <td><%=Utils.date2String(candidature.getDateNaissance())%></td>
                         </tr>
                         <tr class="warning">
                           <td><strong>Adresse postale (ville)</strong></td>
                           <td><%=candidature.getAdressePostale()%></td>
                         </tr>
                         <tr class="warning">
                           <td><strong>Adresse email</strong></td>
                           <td><a href="mailto:<%=candidature.getAdresseEmail()%>"><%=candidature.getAdresseEmail()%></a></td>
                         </tr>
                         <tr class="warning">
                           <td><strong>Curriculum vitæ</strong></td>
                           <td><%=candidature.getCv()%></td>
                         </tr>
                         <tr class="warning">
                           <td><strong>Niveau de qualification</strong></td>
                           <td><%=candidature.getNiveauQualification().getIntitule()%></td>
                         </tr>
                         <tr class="warning">
                           <td><strong>Secteur(s) d'activité</strong></td>
                           <td>
                             <ul><% for (SecteurActivite sect : candidature.getSecteurActivites()){ %>               
                                 <li><%=sect.getIntitule() %></li>
                                 <%  } %>
                             </ul>
                           </td>
                         </tr>
                         <tr class="warning">
                           <td><strong>Date de dépôt</strong></td>
                           <td><%=Utils.date2String(candidature.getDateDepot()) %></td>
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