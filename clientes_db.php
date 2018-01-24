<?php


/**
* Construct Class - connect database
*/
class Consulta 
{
	var $hostname;
	var $user;
	var $password;
	var $dbname;


	function __construct($hostname, $user, $password, $dbname)
	{
			$this->hostname = $hostname;
			$this->user = $user;
			$this->password = $password;
			$this->dbname = $dbname;
	}

	function connect()
	{
		return new mysqli($this->hostname, $this->user, $this->password, $this->dbname);
	}

	function select($query)
	{
		$db = $this->connect();

			$stmt = $db->prepare($query);

			
			//Execute the query
			$stmt->execute();
			
			//Fetch results
			$result = $stmt->get_result();
			
			//Create results object
			while ($row = $result->fetch_object()) {
				$results[] = $row;
			}
			return json_encode($results);
			//return ($results);

	}

}


$nome = $_POST['nome'];
$mesagem = $_POST['mensagem'];

$conn = new Consulta('localhost', 'root', '', 'avaliacao');

//$query = "SELECT * FROM tbl_clientes WHERE cli_nome ='" . $nome . "' ";
$query = "SELECT tbl_clientes.cli_nome, tbl_categorias.cat_nome 
				FROM tbl_clientes
				JOIN tbl_categorias 
				ON tbl_clientes.cli_categoria = tbl_categorias.cat_index 
				WHERE tbl_clientes.cli_nome  LIKE '%" . $nome . "%' 
				ORDER BY tbl_clientes.cli_nome";

print_r($conn->select($query));	

?>