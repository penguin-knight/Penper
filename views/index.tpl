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
	  <form method="post" action="/upload" enctype="multipart/form-data">
	  File:
	  <input type="file" name="paper">

	  <button type="submit" class="btn btn-primary">Upload</button>
	  </form>
	  % if message!=None:
	  <div class="alert alert-primary" role="alert">
	  {{message}}
	  </div>
	  % end

	  <div class="card">
		<div class="card-header">Contents</div>
		<ul class="list-group list-group-flush">
		  % for paper in papers:
		  <li class="list-group-item">
		    {{paper}}<br>
			<a href="/paper/pdf/{{paper}}.pdf" class="btn btn-primary">View PDF</a>
			<button type="button" class="btn btn-success">Memo</button>
			<button type="button" class="btn btn-danger">Delete</button>
		  </li>
		  % end
		</ul>
	  </div>
	</div>

  </body>
</html>
