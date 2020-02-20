<?php

$replace = "autoindex " . $_POST['button'] . ";\n";

function replace_a_line($data) {
	global $replace;
	if (stristr($data, 'autoindex')) {
     		return $replace;
  	 }
   return $data;
}

if (isset($_POST['button'])) {
	$data = file('/etc/nginx/sites-available/default');
	$data = array_map('replace_a_line',$data);
	file_put_contents('/etc/nginx/sites-available/default', implode('', $data));
	exec('/usr/bin/sudo /etc/init.d/nginx reload');
}

?>

<HTML>
	<BODY>
		<form action="" method="post">
			<input type='submit' name='button' value='on'>
			<input type='submit' name='button' value='off'>
		</form>
	<BODY>
</HTML>
