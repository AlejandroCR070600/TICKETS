<?php
    require "conection.php";
    class ticket{
        
        public $folio;
        public $sucursal;
        public $usuario;
        public $telefono;
        public $descripcion;
        public $ipEquipo;
        public $problema;
        public$fecha_Abierto;
        public $hora_Abierto;
        public $fecha_Cerrado;
        public $hora_Cerrado;
        public $falla_Real;
        public $causa;
        public $recomendacion;
        public $area;
        public $equipo;
        public $modo;
        public $atendio;
        public $turno;
        public $error_Sucursal;
        public $estatus;
        public $tiempo_Solucion;
        public $mes;
        public $year;


        private function crearFolio(){
            $random_Num=random_int(1,99);
            $folio="SF".date("d").date("m").date("H").date("i").$random_Num;
            return $folio;
        }
        private function getTimeOfClosing(){
            global $conn;
            $sql="SELECT hora_Abierto from tickets where folio='$this->folio'";
            $result=$conn->query($sql);
            

            if($result->num_rows>0){
                $row=$result->fetch_assoc();
                    
                
            $hora1= new DateTime($row['hora_Abierto']);
            $hora2=new DateTime(date("H:i:s"));

            $diferencia=$hora1->diff($hora2);

            $tiempo=($diferencia->h*60)+$diferencia->i;
            
            return $tiempo;
                
            }


            
        }

        public function addTicket(){
            global $conn;
            $date=[];

            if(
                empty($this->sucursal) ||
                empty($this->usuario) ||
                empty($this->telefono) ||
                empty($this->problema) ||
                empty($this->descripcion) ||
                empty($this->ipEquipo)){
                
                
                $datesJS=["MENSAGE"=>"Tienes un campo vacio"];
                }else{
                
                
                $fecha_Abierto=date("Y-m-d");
                $hora_Abierto=date("H:i:s");
                $folio=$this->crearFolio();
                $sucursal=$this->sucursal;
                $usuario=$this->usuario;
                $telefono=$this->telefono;
                $problema=$this->problema;
                $descripcion=$this->descripcion;
                $ipEquipo=$this->ipEquipo;
                
            
                

                $sql="INSERT INTO tickets(folio, sucursal, usuario, telefono, descripcion, ip_Equipo, fecha_Abierto, hora_Abierto ,problema) values (?,?,?,?,?,?,?,?,?)";
                $stmt=$conn->prepare($sql);
                $stmt->bind_param("sissssssi", $folio,$sucursal,$usuario,$telefono,$descripcion,$ipEquipo,$fecha_Abierto, $hora_Abierto,$problema);

                if($stmt->execute()===true){
                    $MENSAGE=["MENSAGE"=>"se realizo el ticket con exito"];
                    echo json_encode($MENSAGE);
                    $stmt->close();
                    exit;
                }else{
                    $MENSAGE=["MENSAGE"=>"hubo un problema al realizar el ticket"];
                    echo json_encode($MENSAGE);
                    $stmt->close();
                    exit;
                }
            }
        }

        public function closeTicket(){
            global $conn;
            $this->tiempo_Solucion=$this->getTimeOfClosing();
            $sql="UPDATE tickets SET falla_Real=?, 
                causa=?, 
                recomendacion=?, 
                area=?, 
                equipo=?, 
                modo=?, 
                atendio=?,
                turno=?,
                error_Sucursal=?, 
                tiempo_solucion=?, 
                mes=?, 
                year=?,
                estatus=?, 
                fecha_Cerrado=?, 
                hora_Cerrado=? where folio = ?";

            $stmt=$conn->prepare($sql);
            $stmt->bind_param("sssiisiisiiissss",
            $this->falla_Real,
            $this->causa,
            $this->recomendacion,
            $this->area, 
            $this->equipo,
            $this->modo, 
            $this->atendio,
            $this->turno,
            $this->error_Sucursal,
            $this->tiempo_Solucion,
            $this->mes,
            $this->year,
            $this->estatus,
            $this->fecha_Cerrado,
            $this->hora_Cerrado,
            $this->folio);
            if($stmt->execute()===true){

                $MENSAGE=["MENSAGE"=>"se cerro el ticket con exito"];
                echo json_encode($MENSAGE);
                $stmt->close();
                exit;
            }else{
                $MENSAGE=["MENSAGE"=>"hubo un problema al cerrar el ticket"];
                echo json_encode($MENSAGE);
                $stmt->close();
                exit;
            }
                }

    }

?>