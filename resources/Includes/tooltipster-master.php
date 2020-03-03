<?php
/**
 * Created by PhpStorm.
 * User: jgallina
 * Date: 22/05/2015
 * Time: 09:33 AM
 */
//include_once $_SERVER['DOCUMENT_ROOT'] . 'resources/Includes/master.php';

//echo "
  //  <!-- EasyUI -->
    //    <script src=\"" . HTTP . "/resources/JQuery-EasyUI-1.4.2/jquery.easyui.min.js\"></script>";
?>


<head>
	<link rel="stylesheet" type="text/css" href="../tooltipster-master/dist/css/tooltipster.bundle.min.css" />
	<script src="../JQuery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="../tooltipster-master/dist/js/tooltipster.bundle.min.js"></script>
</head>

<body>
	
	// Putting a tooltip on an image:
	<img src="http://i.vimeocdn.com/portrait/58832_300x300" title="This is my span's tooltip message!" class="tooltip"/>

	<script>
		$(document).ready(function() {
			$('.tooltip').tooltipster({
				animation: 'fade',
				delay: 200,
				theme: 'tooltipster-punk',
				trigger: 'click'
			});
			
			
		});
	</script>

</body>