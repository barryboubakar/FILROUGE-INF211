<%@ page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceEntreprise,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceCandidature,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature"%>
                

 
<!---------------------------------------------------- DEBUT DE NOTRE APPLICATION  ----------------------------------->
<%
	  String identifiant = request.getParameter("identifiant");
	  if(identifiant == null) {
%>
              <div class="row">
			  <div class="col-lg-12">
			    <div class="panel panel-default">
			      <div class="panel-heading"><h3><i class="fa fa-sign-in"></i> Connexion</h3></div> <!-- /.panel-heading -->
			      <div class="panel-body">
                    <div class="row col-xs-offset-2 col-xs-8">
            		  <!-- Formulaire -->
                      <form role="form" action="connexion.jsp" method="get">
                        <fieldset>
                          <div class="form-group">
                            <input class="form-control" placeholder="Identifiant" name="identifiant" type="text" autofocus>
                          </div>
                          <button type="submit" class="btn btn-lg btn-success btn-block">Login</button>
                        </fieldset>
                      </form>
                      <p/>
                      <!-- Message -->
                      <div class="alert alert-info col-xs-offset-3 col-xs-6">
                         L'identifiant est la clé primaire préfixée de :
                         <ul>
                           <li>pour une entreprise : <code>ENT_</code> <em>(ENT_12 par exemple)</em></li>
                           <li>pour une candidature : <code>CAND_</code> <em>(CAND_7 par exemple)</em></li>
                         </ul>
                         <br/>
                         <em>Note : l'identification se fait sans mot de passe.</em>
                       </div>          
                    </div>
			           </div> <!-- /.panel-body -->
			         </div> <!-- /.panel-default -->
			       </div> <!-- /.col-lg-12 -->
			     </div> <!-- /.row -->                 
<%
	}
	else {
			if(identifiant.startsWith("ENT_"))
		  	{
		  		try {
		  			IServiceEntreprise serviceEntreprise = (IServiceEntreprise) ServicesLocator.getInstance().getRemoteInterface("ServiceEntreprise");
		  			int id = Integer.parseInt(identifiant.substring(4)); // On enlève le préfixe "ENT_";
			  		Entreprise entreprise = serviceEntreprise.getEntreprise(id);
			  		
			  		if(entreprise == null)
		  			{
		  				response.sendRedirect("template.jsp?action=wrong_entreprise_id&identifiant="+ identifiant);
		  			}
		  			else
		  			{
		       	 		session.setAttribute("utilisateur",entreprise);
		       	 		response.sendRedirect("index.jsp");
		  			}
		  		}catch (Exception e){
		  			response.sendRedirect("template.jsp?action=wrong_entreprise_id&identifiant="+ identifiant);
		  		}
		  		
		  		
		  	}
		  	else if(identifiant.startsWith("CAND_"))
		  	{
			  	try {
			  		IServiceCandidature serviceCandidature = (IServiceCandidature) ServicesLocator.getInstance().getRemoteInterface("ServiceCandidature");
			  		int id = Integer.parseInt(identifiant.substring(5)); // On enlève le préfixe "CAND_";
			  		Candidature candidature = serviceCandidature.getCandidature(id);
				    if(candidature == null)
				    {
				    	response.sendRedirect("template.jsp?action=wrong_candidature_id&identifiant="+ identifiant);
				    }
				    else
				    {
				    	session.setAttribute("utilisateur",candidature);
				      	response.sendRedirect("index.jsp");
				    }
			  	}catch (Exception e){
		  			response.sendRedirect("template.jsp?action=wrong_entreprise_id&identifiant="+ identifiant);
		  		}
		  	}
		  	else
		  	{
				response.sendRedirect("template.jsp?action=no_id_connexion");
		  	}
	}
%>     
            

<!---------------------------------------------------- FIN DE NOTRE APPLICATION  ----------------------------------->
