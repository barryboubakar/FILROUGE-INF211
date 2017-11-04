<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<div class="row">
          <div class="col-lg-12">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3><i class="fa fa-sign-in"></i> Connexion</h3>
              </div> <!-- /.panel-heading -->
              <div class="panel-body">
                
                      <div class="row col-xs-offset-1 col-xs-10">
                        <div class="panel panel-red">
                          <div class="panel-heading ">
                            Impossible de se connecter
                          </div>
                          <div class="panel-body text-center">
                            <p class="text-danger"><strong>Veuillez renseignez un identifiant pour pouvoir vous connecter</strong></p>
                            <button type="button"
                                    class="btn btn-danger"
                                    onclick="window.location.href='template.jsp?action=connexion'">
                              Retour...
                            </button>
                          </div>
                        </div>
                      </div> <!-- /.row col-xs-offset-1 col-xs-10 -->
                        
                  </div> <!-- /.panel-body -->
                </div> <!-- /.panel-default -->
              </div> <!-- /.col-lg-12 -->
</div> <!-- /.row -->