<%@ page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceEntreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise"%>
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading"><h3><i class="fa fa-th"></i> R�f�rencer une nouvelle entreprise</h3></div> <!-- /.panel-heading -->
      <div class="panel-body">
        
            <div class="col-lg-offset-2 col-lg-8
                        col-xs-12">
 
<!---------------------------------------------------- DEBUT DE NOTRE APPLICATION  ----------------------------------->
<%
	// On v�rifie si on est en mode traitement ou envois de formulaire
	  String traitement = request.getParameter("traitement");
	  if(traitement == null || !traitement.equals("go")) {
%>
              <form role="form" action="template.jsp" method="get">
                <input name="action" value="nouvelle_entreprise" type="hidden">
                <input name="traitement" value="go" type="hidden">
                <div class="form-group">
                  <input class="form-control" placeholder="Nom de l'entreprise" name="nom" required>
                </div>
                <div class="form-group">
                  <textarea class="form-control" placeholder="Descriptif de l'entreprise" rows="5" name="descriptif"></textarea>
                </div>
                <div class="form-group">
                  <input class="form-control" placeholder="Adresse postale (ville)" name="adresse_postale" required>
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
			if(traitement_descriptif != null || !traitement_descriptif.equals(""))
				descriptif = traitement_descriptif;
			if(traitement_adresse_postale != null || !traitement_adresse_postale.equals(""))
				adresse_postale = traitement_adresse_postale;
			
			if((nom != null) && (adresse_postale != null)){
			      IServiceEntreprise serviceEntreprise = (IServiceEntreprise) ServicesLocator.getInstance().getRemoteInterface("ServiceEntreprise");
			      Entreprise entreprise = serviceEntreprise.newEntreprise(nom,adresse_postale,descriptif);
			
			      %>
			      <div class="panel panel-success">
		                  <div class="panel-heading">
		                    Nouvelle entreprise r�f�renc�e
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
                  </div><%
			      
			}
		}
		catch(NumberFormatException e)
	    {
	      String erreur = "La valeur de l'identifiant n'est pas num�rique";
	    }
	}
	  
%>
     
           </div>
            
      </div> <!-- /.panel-body -->
    </div> <!-- /.panel -->
  </div> <!-- /.col-lg-12 -->
</div>

<!---------------------------------------------------- FIN DE NOTRE APPLICATION  ----------------------------------->
