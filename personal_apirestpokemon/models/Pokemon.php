<?php

    class Pokemon extends conectar{

        public function get_pokemon(){
            $conectar= parent::conexion();
            parent::set_names();
            $sql="SELECT * FROM pokemones;";
            $sql = $conectar->prepare($sql);
            $sql->execute();
            return $resultado=$sql->fetchAll(pdo::FETCH_ASSOC);
        }
    }
?>