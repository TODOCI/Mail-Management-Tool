<?php
if (!isset($_ADMIN_EDIT_)) {
    throw new Exception("Code file not included for admin_edit.php!");
}
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
</head>

<body>

	<?php
	include __DIR__ .'/header.php';
	include __DIR__ .'/sidebar.php';
	?>

	<!-- Main workspace starts from here -->
	<div id="content-wrapper">
		<div class="row">
			<ol class="breadcrumb">
			    <li><a href="./dashboard.php">Home</a></li>
			    <li><a href="./admin_view.php">View Admins</a></li>
			    <li class="active">Edit Admin</li>
			</ol>
			<div class="col-md-7">
				<h3>Edit an admin</h3>
				<form role="form" id="add" type="post">
					<div class="form-group">
    					<label for="email"><h4>Email address:</h4></label>
    					<input type="email" class="form-control" name="email"style="width: 50%; min-width: 200px" value="someone@example.com" disabled>
    					<!-- TODO: Populate this input with the current user's email id  -->
  					</div>				
  					<h4 class="control-label">Access rights:</h4>
  					<div class="form-group">
  						<?php
  							foreach ($accesses as $value) {
  								echo '<div>';
  								echo '<input type="checkbox" name="access[]" value="' .$value['id'] .'">';
  								echo ' <strong style="text-transform: uppercase">' .$value['name'] .'</strong>: &nbsp; ' .$value['description'];
  								echo '</div>';
  							}
  						?>
  					</div>

  					<div class="clearfix"></div>
  					
  					<button type="submit" class="btn btn-default" value="Submit" id="btn">Edit</button>
				</form>					
			</div>
			<div class="col-md-4 pull-right">
				
			</div>
		</div>
		
	</div>

</body>
<script type="text/javascript">
  	$(document).ready(function() {
  		$("#btn").click(function(e){
	 		var jsonData = {};
	 		var formData = $("#add").serializeArray();
  			//console.log(formData);
   
   			$.each(formData, function() {
        		if (jsonData[this.name]) {
           			if (!jsonData[this.name].push) {
               			jsonData[this.name] = [jsonData[this.name]];
           			}
           			jsonData[this.name].push(this.value || '');
       			} else {
           			jsonData[this.name] = this.value || '';
       			}
	    	});
   			console.log(jsonData);
			$.ajax(
			{
				url : "ajaxserver.php",
				type: "POST",
				data : jsonData,
				success:function(data, textStatus, jqXHR) 
				{
					alert("Done. Open console for object.");
				}
			});
	 
    		e.preventDefault();	
		});
	});

</script>
</html>