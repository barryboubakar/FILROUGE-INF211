<%@page import="com.sun.xml.rpc.encoding.SingletonDeserializerFactory"%>
<%@ page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceOffreEmploi,
                eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceNiveauQualification,
                eu.telecom_bretagne.cabinet_recrutement.data.model.NiveauQualification,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceSecteurActivite,
				eu.telecom_bretagne.cabinet_recrutement.data.model.SecteurActivite,
                java.util.*"
%>


  
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading"><h3><i class="glyphicon glyphicon-transfer"></i> Référencer une nouvelle offre d'emploi</h3></div> <!-- /.panel-heading -->
      <div class="panel-body">
        
<!---------------------------------------------------- DEBUT DE NOTRE APPLICATION  ----------------------------------->
<%
	// On vérifie si on est en mode traitement ou envoi de formulaire
	  String traitement = request.getParameter("traitement");
	  if(traitement == null || !traitement.equals("go")) {
		  
		  IServiceNiveauQualification serviceNiveau = (IServiceNiveauQualification) ServicesLocator.getInstance().getRemoteInterface("ServiceNiveauQualification");
    	  List<NiveauQualification> listeNiveau = serviceNiveau.listeDesNiveauxQualifications();
    	  
    	  IServiceSecteurActivite serviceSectAct = (IServiceSecteurActivite) ServicesLocator.getInstance().getRemoteInterface("ServiceSecteurActivite");
    	  List<SecteurActivite> listeSectAct = serviceSectAct.listeDesSecteursActivite();
%>      



            <div class="col-lg-offset-2 col-lg-8
                        col-xs-12">
              <form role="form" action="template.jsp" method="get">
                <input type="hidden" name="action" value="nouvelle_offre" />
                <input name="traitement" value="go" type="hidden">
                <div class="form-group">
                  <input class="form-control" placeholder="Titre de l'offre" name="titre" />
                </div>
                <div class="form-group">
                  <textarea class="form-control" placeholder="Descriptif de la mission" rows="5" name="descriptif_mission"></textarea>
                </div>
                <div class="form-group">
                  <textarea class="form-control" placeholder="Profil recherché" rows="5" name="profil_recherche"></textarea>
                </div>
                <div class="col-lg-3">
                  <div class="form-group">
                    <label>Niveau de qualification</label>
                    <small>
                      
                         <%
                  	for (NiveauQualification niv : listeNiveau) { %>
                        <div class="radio">
                          <label>
                            <input name="niveau" value="<%= niv.getIdNiveauQualification() %>" type="radio"><%= niv.getIntitule() %>
                          </label>
                        </div>
                    <% } %>    
                        
                    </small>
                  </div>
                </div>
                <div class="col-lg-9">
                <div class="form-group">
                  <label>Secteur(s) d'activité</label>
                  <small>
                    <table border="0" width="100%">
                        <tbody>
                            <% for(SecteurActivite sect : listeSectAct){ %>
                            <tr>
                            		<td><input name="secteur" value="<%= sect.getIdSecteurActivite() %>" type="checkbox"><%= sect.getIntitule() %></td>
                            </tr>  
                            <% } %>                   
                    	</tbody>
                    </table>
                  </small>
                </div>
                </div>
                <div class="text-center">
                  <button type="submit" class="btn btn-success btn-circle btn-lg" name="submit-insertion"><i class="fa fa-check"></i></button>
                  <button type="reset"  class="btn btn-warning btn-circle btn-lg"><i class="fa fa-times"></i></button>
                </div>
              </form>
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
			
			offre = serviceOffreEmploi.newCandidature(nom, prenom, date_naissance, adresse_postale, adresse_email, cv, niveau, secteurs);		
		
		%>
		<div class="panel-body">
        
              <div class="col-lg-offset-2 col-lg-8
                          col-xs-12">
                <div class="panel panel-success">
                  <div class="panel-heading">
                    Nouvelle candidature référencée
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
            
 <!---------------------------------------------------- FIN DE NOTRE APPLICATION  ----------------------------------->            
      </div> <!-- /.panel-body -->
    </div> <!-- /.panel -->
  </div> <!-- /.col-lg-12 -->
</div> <!-- /.row -->
