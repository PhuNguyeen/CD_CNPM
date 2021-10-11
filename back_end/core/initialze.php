<?php

	defined('DS') ? null : define('DS', DIRECTORY_SEPARATOR);
	defined('SIZE_ROOT') ? null : define('SIZE_ROOT', DS. 'wamp64'.DS. 'www'.DS.'phprest');
	//wamp64/www/phprest/includes
	defined('INC_PATH') ? null : define('INC_PATH', SIZE_ROOT.DS.'includes');
	defined('CORE_PATH') ? null : define('CORE_PATH', SIZE_ROOT.DS.'core');
	
	// load the config filr first
	require_once(INC_PATH.DS.'config.php');

	// core classes
	require_once(INC_PATH.DS.'post.php');
	

?>