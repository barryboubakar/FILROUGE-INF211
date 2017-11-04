<%@ page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceEntreprise,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceCandidature,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature"%>
                
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading"><h3><i class="fa fa-sign-in"></i> Connexion</h3></div> <!-- /.panel-heading -->
      <div class="panel-body">
       <div class="row col-xs-offset-2 col-xs-8">
 
<!---------------------------------------------------- DEBUT DE NOTRE APPLICATION  ----------------------------------->
<%
	  String identifiant = request.getParameter("identifiant");
	  if(identifiant == null) {
%>
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
<%
	}
	else {
			if(identifiant.equals(""))
		  	{
%>
		      <div class="row col-xs-offset-1 col-xs-10">
                        <div class="panel panel-red">
                          <div class="panel-heading ">
                            Impossible de se connecter
                          </div>
                          <div class="panel-body text-center">
                            <p class="text-danger"><strong>Veuillez renseignez un identifiant pour pouvoir vous connecter</strong></p>
                            <button type="button"
                                    class="btn btn-danger"
                                    onclick="window.location.href='connexion.jsp'">
                              Retour...
                            </button>
                          </div>
                        </div>
                      </div> <!-- /.row col-xs-offset-1 col-xs-10 -->
<%
		  	}
			else if(identifiant.startsWith("ENT_"))
		  	{
		  		IServiceEntreprise serviceEntreprise = (IServiceEntreprise) ServicesLocator.getInstance().getRemoteInterface("ServiceEntreprise");
		  		int id = Integer.parseInt(identifiant.substring(4)); // On enlève le préfixe "ENT_";
		  		Entreprise entreprise = serviceEntreprise.getEntreprise(id);
		  		if(entreprise == null)
		  			{
%>
		  				<p class="erreur">Erreur : il n'y a pas d'entreprise avec cet identifiant : <%=identifiant%></p>
		  				<a href="index.jsp">Retour...</a>
<%
		  			}
		  		else
		  			{
		       	 		session.setAttribute("utilisateur",entreprise);
		       	 		response.sendRedirect("index.jsp");
		  			}
		  	}
		  	else if(identifiant.startsWith("CAND_"))
		  	{
		  		IServiceCandidature serviceCandidature = (IServiceCandidature) ServicesLocator.getInstance().getRemoteInterface("ServiceCandidature");
		  		int id = Integer.parseInt(identifiant.substring(5)); // On enlève le préfixe "CAND_";
		  		Candidature candidature = serviceCandidature.getCandidature(id);
		      if(candidature == null)
		      	{
%>
		        	<p class="erreur">Erreur : il n'y a pas de candidature avec cet identifiant : <%=identifiant%></p>
		        	<a href="index.jsp">Retour...</a>
<%
		      	}
		      else
		      	{
		        	session.setAttribute("utilisateur",candidature);
		        	response.sendRedirect("index.jsp");
		      	}
		  	}
		  }
%>     
            </div>
           </div> <!-- /.panel-body -->
         </div> <!-- /.panel-default -->
       </div> <!-- /.col-lg-12 -->
     </div> <!-- /.row -->    

<!---------------------------------------------------- FIN DE NOTRE APPLICATION  ----------------------------------->
