<?php
	/**
	 * require model
	 */
	class Bridge
	{
		function __construct($model)
		{
			// headers
			header('Access-Control-Allow-Origin: *');
			header('Content-Type: application/json; charset: UTF-8;');
			if(file_exists(realpath(dirname(__FILE__) . '/../model/'. $model .'.php'))){
				require_once(realpath(dirname(__FILE__) . '/../core/Database.php'));
				require_once(realpath(dirname(__FILE__) . '/../model/'. $model .'.php'));
			}else{
				$this->message('No found model');
			}
		}

		function message($message)
		{
			echo json_encode(array('message'=>$message));
		}

		function validateValueGet($index)
		{
			if (isset($_GET[$index])) {
				return $_GET[$index];
			}else{
				$this->message($index." cann't empty");
				die();
			}
		}
	}
?>