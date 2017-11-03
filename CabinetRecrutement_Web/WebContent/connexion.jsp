<%@ page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils"%>
                
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
	   		session.getSessionContext();
		 }
	  
%>
     
            </div>
           </div> <!-- /.panel-body -->
         </div> <!-- /.panel-default -->
       </div> <!-- /.col-lg-12 -->
     </div> <!-- /.row -->    

<!---------------------------------------------------- FIN DE NOTRE APPLICATION  ----------------------------------->
