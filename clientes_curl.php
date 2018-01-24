<?php

function curlExec($url, $post)
{
	$ch = curl_init($url);

	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

	curl_setopt($ch, CURLOPT_POST, true);

	curl_setopt($ch, CURLOPT_POSTFIELDS, $post);

	$result = curl_exec($ch);

	curl_close($ch);

	return($result);
}



$url = "http://localhost/avaliacao_php/clientes_db.php";

$nome = $_POST['nome'];
$postData = array(
	'nome' => $nome,
	'mensagem' => 'teste de post',
);

print_r (curlExec($url, $postData));
	
?>