<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html lang="ja">
  <head>
	<link rel="stylesheet" href="/static/css/bootstrap.min.css">
	<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
	<title>
	  Penper
	</title>
  </head>

  <body>
	<div class="container-fluid">
	  <h1>Penper</h1>
	  <div class="row">
	  <div class="col-6">
	  <form method="post" action="/" enctype="multipart/form-data">
	  <div class="form-group">
	  <label for="InputFile">File</label>
	  <input type="file" name="paper" id="InputFile">
	  </div>

	  <div class="form-group">
	  <label for="InputTitle">Title</label>
	  <input type="text" class="form-control" name="title" id="InputTitle" maxlength=128>
	  </div>

	  <div class="form-group">
	  <label for="InputAuther">Auther</label>
	  <input type="text" class="form-control" name="auther" id="InputAuther" maxlength=128>
	  </div>

	  <div class="form-group">
	  <label for="InputNote">Note</label>
	  <input type="text" class="form-control" name="note" maxlength=256><br>
	  </div>

	  <button type="submit" class="btn btn-primary">Upload</button>
	  </form>
	  % if alert!=None:
	  <div class="alert alert-{{alert["mode"]}}" role="alert">
	  {{alert["message"]}}
	  </div>
	  % end
	  </div>
	  </div>

  </body>
</html>
