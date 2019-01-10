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
	  <h1>Penper</h1>
	  <a href="/upload" class="btn btn-primary">Upload</a>

	  % if alert!=None:
	  <div class="alert alert-{{alert["mode"]}}" role="alert">
	  {{alert["message"]}}
	  </div>
	  % end
	  <div class="card">
		<div class="card-header">Contents</div>
		<ul class="list-group list-group-flush">
		  % for paper in papers:
		  <li class="list-group-item">
		    {{paper[0]}}<br>
		    {{paper[1]}}<br>
		    {{paper[2]}}<br>
		    {{paper[3]}}<br>
			<a href="/paper/pdf/{{paper[0]}}.pdf" class="btn btn-primary">View PDF</a>
			<button type="button" class="btn btn-info">View Memo</button>
			<button type="button" class="btn btn-success">Edit Memo</button>
			<button type="button" class="btn btn-danger">Delete</button>
		  </li>
		  % end
		</ul>
	  </div>
	</div>

  </body>
</html>
