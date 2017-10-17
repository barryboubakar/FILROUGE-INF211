<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="min-height: 601px;" id="page-wrapper">
        <p style="font-size: 5">&nbsp;</p>
     
     
<!---------------------------------------------------- DEBUT DE NOTRE APPLICATION  ----------------------------------->
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading"><h3><i class="fa fa-th"></i> Référencer une nouvelle entreprise</h3></div> <!-- /.panel-heading -->
      <div class="panel-body">
        
            <div class="col-lg-offset-2 col-lg-8
                        col-xs-12">
              <form role="form" action="template.jsp" method="get">
                <input name="action" value="nouvelle_entreprise" type="hidden">
                <div class="form-group">
                  <input class="form-control" placeholder="Nom de l'entreprise" name="nom">
                </div>
                <div class="form-group">
                  <textarea class="form-control" placeholder="Descriptif de l'entreprise" rows="5" name="descriptif"></textarea>
                </div>
                <div class="form-group">
                  <input class="form-control" placeholder="Adresse postale (ville)" name="adresse_postale">
                </div>
                <div class="text-center">
                  <button type="submit" class="btn btn-success btn-circle btn-lg" name="submit-insertion"><i class="fa fa-check"></i></button>
                  <button type="reset" class="btn btn-warning btn-circle btn-lg"><i class="fa fa-times"></i></button>
                </div>
              </form>
            </div>
            
      </div> <!-- /.panel-body -->
    </div> <!-- /.panel -->
  </div> <!-- /.col-lg-12 -->
</div> <!-- /.row -->
<!---------------------------------------------------- FIN DE NOTRE APPLICATION  ----------------------------------->

</div>
      
</body>
</html>