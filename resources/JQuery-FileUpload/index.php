<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<link href="CSS/uploadfile.css" rel="stylesheet">
<script src="../JQuery/jquery-1.11.2.min.js"></script>
<script src="JS/jquery.uploadfile.min.js"></script>
</head>
<body>

<div id="mulitplefileuploader">Upload</div>

<div id="status"></div>
<script type="text/javascript">
	$(document).ready(function(){
		var settings = {
			url: "PHP/upload.php",
			dragDrop:true,
			fileName: "myfile",
			allowedTypes:"jpg,png,gif,doc,pdf,zip,bmp,tif",	
			returnType:"json",
			 onSuccess:function(files,data,xhr)
			{
			   // alert((data));
			},
			showDelete:true,
			deleteCallback: function(data,pd)
			{
			for(var i=0;i<data.length;i++)
			{
				$.post("delete.php",{op:"delete",name:data[i]},
				function(resp, textStatus, jqXHR)
				{
					//Show Message  
					$("#status").append("<div>File Deleted</div>");      
				});
			 }      
			pd.statusbar.hide(); //You choice to hide/not.

		}
	}
	var uploadObj = $("#mulitplefileuploader").uploadFile(settings);


	});
</script>
</body>

