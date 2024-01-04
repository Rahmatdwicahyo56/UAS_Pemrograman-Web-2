<?php
	include"koneksi.php";
	session_start();
	unset($_SESSION['ceklog']);
	unset($_SESSION['type']);
	header('Location: ../');
?>