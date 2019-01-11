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
			<button type="button" class="btn btn-danger" onclick="DeletePaper({{paper[0]}})">Delete</button>
		  </li>
		  % end
		</ul>
	  </div>
	</div>

	<div class="modal" id="DeleteModal" tabindex="-1" role="dialog" aria-labelledby="DeleteModal" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	      <h5 class="modal-title" id="DeleteModalLable">Delete paper info</h5>
	      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        <span aria-hidden="true">&times;</span>
	      </button>
		  </div>
	      <div class="modal-body">
		  <div id="ModalBody"></div>
	      </div>

	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
	        <a href="#" id="DeletePaperId" class="btn btn-primary">Yes</a>
	      </div>
		</div>
	  </div>
	</div>

  <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
  <script type="text/javascript" src="/static/js/main.js"></script>
</html>
