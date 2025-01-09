<?php
    session_start();

    class Conectar{
        protected $dbh;

        protected function Conexion(){
            try {
                //Local
				$conectar = $this->dbh = new PDO("mysql:host=192.168.1.175;dbname=seguridad_tapje","Desarrollo","System01$");
                //Produccion
                //$conectar = $this->dbh = new PDO("mysql:host=localhost;dbname=db_soporte","usuairo_php_myadmin","contraseña_phpmyadmin");
				return $conectar;
			} catch (Exception $e) {
				print "¡Error BD!: " . $e->getMessage() . "<br/>";
				die();
			}
        }

        public function set_names(){
			return $this->dbh->query("SET NAMES 'utf8'");
        }

        public static function ruta(){
            //Local
			return "http://localhost/Soporte/";
		}

    }
?>