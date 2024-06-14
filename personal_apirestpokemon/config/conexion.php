<?php

    class conectar{
        protected $dbh;

        protected function conexion(){

            try{
                $conectar = $this->dbh = new PDO("mysql:local=localhost;
                dbname=pokedex","root","");
                return $conectar;
            }catch(Exception $e){
                print "!error DB!: ". $e->getMessage() . "<br/>";
                die();
            }
        }

        protected function set_names(){
            return $this->dbh->query("SET NAME 'utf8'");
        }
    }



?>