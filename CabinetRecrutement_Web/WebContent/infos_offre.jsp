<%@ page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceOffreEmploi,
                eu.telecom_bretagne.cabinet_recrutement.data.model.OffreEmploi,
                eu.telecom_bretagne.cabinet_recrutement.data.model.SecteurActivite"%>

<%
  String erreur = null;
  String idStringValue = request.getParameter("id");
  int id = -1;
  OffreEmploi offre = null;
  
  if(idStringValue == null)
  {
    erreur="Aucun identifiant d'offre n'est fourni dans la demande.";
  }
  else
  {
    try
    {
      id = new Integer(idStringValue);
      // C'est OK : on a bien un id
      IServiceOffreEmploi serviceOffreEmploi = (IServiceOffreEmploi) ServicesLocator.getInstance().getRemoteInterface("ServiceOffreEmploi");
      offre = serviceOffreEmploi.getOffreEmploi(id);
      if(offre == null)
      {
        erreur="Aucune offre ne correspond � cet identifiant : " + id;
      }
    }
    catch(NumberFormatException e)
    {
      erreur = "La valeur de l'identifiant n'est pas num�rique";
    }
  }
%>

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading"><h3><i class="fa fa-th"></i> Informations sur l'offre d'emploi</h3></div> <!-- /.panel-heading -->
      <div class="panel-body">
        <%
        if(erreur != null) // Une erreur a �t� d�tect�e et est affich�e.
        {
         %>
         <div class="row col-xs-offset-1 col-xs-10">
           <div class="panel panel-red">
             <div class="panel-heading ">
               Impossible de traiter la demande
             </div>
             <div class="panel-body text-center">
               <p class="text-danger"><strong><%=erreur%></strong></p>
             </div>
           </div>
         </div> <!-- /.row col-xs-offset-1 col-xs-10 -->
         <%
         }
        else
        {
           %>
        <div class="table-responsive">
            <small>
            <table class="table">
              <tbody>
                <tr class="success">
                  <td width="200"><strong>Identifiant</strong></td>
                  <td>ENT_<%=offre.getIdOffreEmploi()%></td>
                </tr>
                <tr class="warning">
                  <td><strong>Titre</strong></td>
                  <td><%=offre.getTitre()%></td>
                </tr>
                <tr class="warning">
                  <td><strong>Entreprise</strong></td>
                  <td><%= Utils.text2HTML(offre.getEntreprise().getDescriptif()) %></td>
                </tr>
                <tr class="warning">
                  <td><strong>Descriptif de la mission</strong></td>
                  <td><%= Utils.text2HTML(offre.getDescriptifMission())%></td>
                </tr>
                <tr class="warning">
                  <td><strong>Profil recherch�</strong></td>
                  <td><%= Utils.text2HTML(offre.getProfilRecherche())%></td>
                </tr>
                <tr class="warning">
                  <td><strong>Lieu de la mission</strong></td>
                  <td><%= offre.getEntreprise().getAdressePostale()%></td>
                </tr>
                <tr class="warning">
                  <td><strong>Niveau de qualification</strong></td>
                  <td><%= offre.getNiveauQualification().getIntitule()%></td>
                </tr>
                <tr class="warning">
                  <td><strong>Secteur(s) d'activit�</strong></td>
                  <td> <ul> <% for(SecteurActivite sa:  offre.getSecteurActivites()) { %> <li>  <%= sa.getIntitule() %> </li><%  }  %> </ul></td>
                </tr>
               
      
              </tbody>
            </table>
            </small>      
        </div>
          <%
        }
        %>
      </div> <!-- /.panel-body -->
    </div> <!-- /.panel -->
  </div> <!-- /.col-lg-12 -->
</div> <!-- /.row -->
