<?php
	require_once "./fungsi/koneksi.php";
	if($_SESSION['type'] != 'admin' and $_SESSION['type'] != 'pimpinan'): ?>
		<html>
		<head>
		<title></title>
		<script type="text/javascript" src="../lib/sweet.js"></script>
		</head>
		<body>
			<script>
				swal({
			  		title: 'Access Denied...!',
			  		text: 'Silahkan Login Akun Dengan Level Yang Lebih Tinggi!',
			  		showConfirmButton: false,
			  		type: 'warning',
			  		backdrop: 'rgba(123,0,0,5)',
				});
				window.setTimeout(function(){
					window.location.replace('index.php');
		 		} ,2000); 
		 	</script>;
		</body>
		</html>
<?php endif;?>
