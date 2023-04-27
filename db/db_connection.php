<?php

	class DbConnect {
		private $server = 'localhost';
		private $dbname = 'assignmentweb';
		private $user = 'root';
		private $pass = 'Trinh2s$haha';

		public function connect() {
			try {
                $conn = new mysqli($this->server, $this->user, $this->pass, $this->dbname);
				return $conn;
			} catch (\Exception $e) {
				echo "Database Error: " . $e->getMessage();
			}
		}
        
	}
?>