<%@page import="eu.telecom_bretagne.cabinet_recrutement.service.ServiceSecteurActivite"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.sun.xml.rpc.encoding.SingletonDeserializerFactory"%>
<%@ page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceCandidature,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceNiveauQualification,
                eu.telecom_bretagne.cabinet_recrutement.data.model.NiveauQualification,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceSecteurActivite,
                eu.telecom_bretagne.cabinet_recrutement.data.model.SecteurActivite,
                java.util.*"%>


  
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading"><h3><i class="fa fa-user"></i> Référencer une nouvelle candidature</h3></div> <!-- /.panel-heading -->
      <div class="panel-body">
        

<!---------------------------------------------------- DEBUT DE NOTRE APPLICATION  ----------------------------------->
  <%
	// On vérifie si on est en mode traitement ou envois de formulaire
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
                <input name="action" value="nouvelle_candidature" type="hidden">
                <input name="traitement" value="go" type="hidden">
                <div class="form-group">
                  <input class="form-control" placeholder="Nom" name="nom">
                </div>
                <div class="form-group">
                  <input class="form-control" placeholder="Prénom" name="prenom">
                </div>
                <div class="form-group">
                  <input class="form-control" placeholder="Date de naissance (format jj/mm/aaaa)" name="date_naissance">
                </div>
                <div class="form-group">
                  <input class="form-control" placeholder="Adresse postale (ville)" name="adresse_postale">
                </div>
                <div class="form-group">
                  <input class="form-control" placeholder="Adresse email" name="adresse_email">
                </div>
                <div class="form-group">
                  <textarea class="form-control" placeholder="Curriculum vitæ" rows="5" name="cv"></textarea>
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
                      <!-- Un petit système à la volée pour mettre les checkboxes en deux colonnes...  -->
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
                  <button type="reset" class="btn btn-warning btn-circle btn-lg"><i class="fa fa-times"></i></button>
                </div>
              </form>
 <%             
              }
	else {
		try {
 
			Candidature candidature;
			
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
		     candidature = serviceCandidature.newCandidature(nom, prenom, date_naissance, adresse_postale, adresse_email, cv, niveau, secteurs);		
		
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

