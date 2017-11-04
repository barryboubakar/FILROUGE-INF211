<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature"%>

<%
  Object utilisateur = session.getAttribute("utilisateur");
%>

<div class="navbar-header">
  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
    <span class="sr-only">Toggle navigation</span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
  </button>
  <h4><a class="navbar-brand" href="template.jsp">Cabinet de recrutement</a></h4><br/>
  <%
	  if(utilisateur == null)
	  {
	    %>
			<h4 class="navbar-brand"></h4>
			</div> <!-- /.navbar-header -->
			<ul class="nav navbar-top-links navbar-right">
			  <!-- Menu des messages -->
			  <!-- Menu connexion -->
			  <li class="dropdown">
			    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
			      <i class="fa fa-user fa-2x"></i>
			      <i class="fa fa-caret-down fa-2x"></i>
			    </a>
			    <ul class="dropdown-menu dropdown-user">
			        <li><a href="#"><i class="fa fa-user fa-fw"></i> Aucun utilisateur connecté</a></li>
			        <li class="divider"></li>
			        <li><a href="?action=connexion"><i class="fa fa-sign-in fa-fw"></i> Login</a></li>      
			    </ul> <!-- /.dropdown-user -->
			  </li> <!-- /.dropdown -->
			</ul>
		  
	    <%
	  }
	  else
	  {
		if(utilisateur instanceof Entreprise)
	  	{
	  		Entreprise e = (Entreprise) utilisateur;
        %>
	  		<h4 class="navbar-brand"> <i class="fa fa-th fa-fw"></i><i><%=e.getNom()%></i>&nbsp;<em>(entreprise)</em>
	  		</h4>
	  		</div> <!-- /.navbar-header -->
	  		<ul class="nav navbar-top-links navbar-right">
			  <!-- Menu des messages -->
			  <!-- Menu connexion -->
			  <li class="dropdown">
			    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
			      <i class="fa fa-user fa-2x"></i>
			      <i class="fa fa-caret-down fa-2x"></i>
			    </a>
			    <ul class="dropdown-menu dropdown-user">
			        <li><a href="#"><i class="fa fa-th fa-fw"></i><i><%=e.getNom()%></i>&nbsp;<em>(entreprise)</em></a></li>
			        <li class="divider"></li>
			        <li><a href="deconnexion.jsp"><i class="fa fa-sign-in fa-fw"></i> Logout</a></li>      
			    </ul> <!-- /.dropdown-user -->
			  </li> <!-- /.dropdown -->
			</ul>
	  		
        <%
	  	}
	  	else if(utilisateur instanceof Candidature)
	  	{
	  		Candidature c = (Candidature) utilisateur;
	      %>
	     <h4 class="navbar-brand"><small><i class="fa fa-user fa-fw"></i><i><%=c.getNom()%> <%=c.getPrenom()%></i>&nbsp;<em>(candidature)</em></small>
	     </h4>
	     </div> <!-- /.navbar-header -->
	  		<ul class="nav navbar-top-links navbar-right">
			  <!-- Menu des messages -->
			  <!-- Menu connexion -->
			  <li class="dropdown">
			    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
			      <i class="fa fa-user fa-2x"></i>
			      <i class="fa fa-caret-down fa-2x"></i>
			    </a>
			    <ul class="dropdown-menu dropdown-user">
			        <li><a href="#"><i class="fa fa-user fa-fw"></i><i><%=c.getNom()%> <%=c.getPrenom()%></i>&nbsp;<em>(candidature)</em></a></li>
			        <li class="divider"></li>
			        <li><a href="deconnexion.jsp"><i class="fa fa-sign-in fa-fw"></i> Logout</a></li>      
			    </ul> <!-- /.dropdown-user -->
			  </li> <!-- /.dropdown -->
			</ul>
	      <%
	  	}
	  }
	%>


