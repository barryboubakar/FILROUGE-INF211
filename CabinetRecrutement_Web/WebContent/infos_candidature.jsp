<%@ page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceCandidature,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature,
                eu.telecom_bretagne.cabinet_recrutement.data.model.SecteurActivite,
                java.text.SimpleDateFormat"%>

<%
  SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); 
  String erreur = null;
  String idStringValue = request.getParameter("id");
  int id = -1;
  Candidature candi = null;
  
  if(idStringValue == null)
  {
    erreur="Aucun identifiant de candidature n'est fourni dans la demande.";
  }
  else
  {
    try
    {
      id = new Integer(idStringValue);
      // C'est OK : on a bien un id
      IServiceCandidature serviceCandidature = (IServiceCandidature) ServicesLocator.getInstance().getRemoteInterface("ServiceCandidature");
      
      candi = serviceCandidature.getCandidature(id);
      if(candi == null)
      {
        erreur="Aucune candidature ne correspond à cet identifiant : " + id;
      }
    }
    catch(NumberFormatException e)
    {
      erreur = "La valeur de l'identifiant n'est pas numérique";
    }
  }
%>

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading"><h3><i class="fa fa-user"></i> Informations sur la candidature</h3></div> <!-- /.panel-heading -->
      <div class="panel-body">
        <%
        if(erreur != null) // Une erreur a été détectée et est affichée.
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
                  <td><%=candi.getIdCandidature()%></td>
                </tr>
                <tr class="warning">
                  <td><strong>Nom</strong></td>
                  <td><%=candi.getNom()%></td>
                </tr>
                <tr class="warning">
                  <td><strong>Prénom</strong></td>
                  <td><%=candi.getPrenom()%></td>
                </tr>
                <tr class="warning">
                  <td><strong>Date de naissance</strong></td>
                  <td><%= dateFormat.format(candi.getDateNaissance())%></td>
                </tr>
                <tr class="warning">
                  <td><strong>Adresse postale (ville)</strong></td>
                  <td><%=candi.getAdressePostale()%></td>
                </tr>
                <tr class="warning">
                  <td><strong>Adresse email</strong></td>
                  <td> <a href="mailto:<%=candi.getAdresseEmail()%>"><%=candi.getAdresseEmail()%></a> </td>
                </tr>
                <tr class="warning">
                  <td><strong>Curriculum vitæ</strong></td>
                  <td><%= Utils.text2HTML(candi.getCv())%></td>
                <tr class="warning">
                  <td><strong>Niveau de qualification</strong></td>
                  <td><%= candi.getNiveauQualification().getIntitule()%></td>
                </tr>
                <tr class="warning">
                  <td><strong>Secteur(s) d'activité</strong></td>
                  <td> <ul> <% for(SecteurActivite sa:  candi.getSecteurActivites()) { %> <li>  <%= sa.getIntitule() %> </li><%  }  %> </ul></td>
                </tr>
                <tr class="warning">
                  <td><strong>Date de dépôt</strong></td>
                  <td><%= dateFormat.format(candi.getDateDepot()) %></td>
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
