<?php
date_default_timezone_set('America/Mazatlan');
    
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
        public $admin;
        public $turno;
        public $error_Sucursal;
        public $estatus;
        public $tiempo_Solucion;
        public $mes;
        public $year;
        public $seguimiento;


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
        private function getLastTicketPendiente(){
            global $conn;
            
            $sql="SELECT folio from tickets where estatus='PENDIENTE', sucursal= ORDER BY folio DESC limit 1";
            $result=$conn->query($sql);
            if($result->num_rows>0){
                $row=$result->fetch_assoc();
            }else{
                $row="NO HAY TICKETS PENDIENTES";
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
                echo json_encode($datesJS);
                exit();
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
                    $MENSAGE=["MESSAGE"=>"se realizo el ticket con exito"];
                    echo json_encode($MENSAGE);
                    $stmt->close();
                    exit;
                }else{
                    $MENSAGE=["MESSAGE"=>"hubo un problema al realizar el ticket"];
                    echo json_encode($MENSAGE);
                    $stmt->close();
                    exit;
                }
            }
        }
        public function asideLastInfo(){
            global $conn;
            $sql="SELECT 
                t.folio,
                t.fecha_Abierto,
                t.hora_Abierto,
                s.nombre AS sucursal,
                t.usuario,
                t.telefono,
                p.nombre AS problema,
                t.descripcion,
                t.ip_Equipo,
                t.estatus
            FROM tickets t
            INNER JOIN sucursal s ON t.sucursal = s.id
            INNER JOIN problema p ON t.problema = p.id
            WHERE estatus='$this->estatus'
            ORDER BY t.folio DESC
            LIMIT 1

            ";
            $result=$conn->query($sql);
            $datosE=[];

            if($result->num_rows>0){
                $row=$result->fetch_assoc();
                $datosE=$row;

                echo json_encode($datosE);
            }
        }
        public function buscarTickets($columna, $buscar){
            global $conn;
            if($columna==="sucursal" || $columna==="area" || $columna==="equipo"|| $columna==="atendio" || $columna==="problema" ){
                $valorBuscar=$buscar;
            }else{
                $valorBuscar="'$buscar'";
            }
            $datos=[];
            $sql="SELECT 
                    t.folio,
                    t.fecha_Abierto,
                    t.hora_Abierto,
                    s.nombre AS sucursal, 
                    t.descripcion
                    
                
                    FROM tickets t
                    INNER JOIN sucursal s ON t.sucursal = s.id
                    WHERE t.$columna = $valorBuscar
                    ORDER BY t.fecha_Abierto DESC, t.hora_Abierto DESC";

            


            $result=$conn->query($sql);
            if($result->num_rows>0){
                while($row=$result->fetch_assoc()){
                    $datos[]=$row;
                }
                echo json_encode($datos);
            }else{
                $datos=['MESSAGE'=>'no se encuentran tickets'];
                echo json_encode($datos);

            }

        }

        public function selectChange($seleccion){
            global $conn;
            $sql="select * from $seleccion";
            $result=$conn->query($sql);
            $datos=[];
            if($result->num_rows>0){
                while($row=$result->fetch_assoc()){
                    $datos[]=$row;
                }
                echo json_encode($datos);
            }else{
                    $datos=['MESSAGE'=>'no se encuentran tickets'];
                echo json_encode($datos);
            }
        }

        public function showDateAside(){
             global $conn;
             
             $sql="SELECT 
                t.folio,
                t.fecha_Abierto,
                t.hora_Abierto,
                s.nombre AS sucursal,
                t.usuario,
                t.telefono,
                p.nombre AS problema,
                t.descripcion,
                t.ip_Equipo,
                t.estatus,
                t.seguimiento
            FROM tickets t
            INNER JOIN sucursal s ON t.sucursal = s.id
            INNER JOIN problema p ON t.problema = p.id
            WHERE t.estatus = '$this->estatus' and t.folio = '$this->folio'
            ORDER BY t.fecha_Abierto DESC, t.hora_Abierto DESC
            ";
            $result=$conn->query($sql);
            $tickets=[];
            if($result->num_rows>0){
                while($row=$result->fetch_assoc()){
                    $tickets[]=$row;
                    
                }
            echo json_encode($tickets);
            }else{
                $tickets[ "MESSAGE"]="no hay tickets";
                echo json_encode($tickets);
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
                admin=?,
                turno=?,
                error_Sucursal=?, 
                tiempo_solucion=?, 
                mes=?, 
                year=?,
                estatus=?, 
                fecha_Cerrado=?, 
                hora_Cerrado=? where folio = ?";

            $stmt=$conn->prepare($sql);
            $stmt->bind_param("sssiisissiiissss",
            $this->falla_Real,
            $this->causa,
            $this->recomendacion,
            $this->area, 
            $this->equipo,
            $this->modo, 
            $this->admin,
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
        private function obtenerSucursal(){
            global $conn;
            $sql="SELECT * FROM sucursal where nombre='$this->sucursal'";
            $result=$conn->query($sql);

            if($result->num_rows>0){
                $row=$result->fetch_assoc();
                return $row['id'];
            }
        }

        public function ticketPendiente(){
            global $conn;
            $sql="UPDATE tickets SET estatus='PENDIENTE', seguimiento='$this->seguimiento' where folio='$this->folio'";
            $result=$conn->query($sql);
            if($result===true){
                  $MENSAGE=["MESSAGE"=>"TICKET PUESTO EN ESTATUS PENDIENTE"];
                    echo json_encode($MENSAGE);
                    
                    exit;
            }
        }
        public function selectEstatusTicketUsuario(){
            $sucursal=$this->obtenerSucursal();
            global $conn;
            $sql="SELECT 
                t.folio,
                t.fecha_Abierto,
                t.hora_Abierto,
                s.nombre AS sucursal,
                t.usuario,
                t.telefono,
                p.nombre AS problema,
                t.descripcion,
                t.ip_Equipo,
                t.estatus
            FROM tickets t
            INNER JOIN sucursal s ON t.sucursal = s.id
            INNER JOIN problema p ON t.problema = p.id
            WHERE t.estatus = ? and t.sucursal=?
            ORDER BY t.fecha_Abierto DESC, t.hora_Abierto DESC
            ";

            $stmt=$conn->prepare($sql);
            $stmt->bind_param("si", $this->estatus, $sucursal);
            $stmt->execute();
            $tickets=[];
            $result=$stmt->get_result();
            if($result->num_rows>0){
                
                while($row=$result->fetch_assoc()){
                    $tickets[]=$row;
                    
                    
                }
                echo json_encode($tickets);
            }else{
                $tickets[ "MESSAGE"]="no hay tickets";
                echo json_encode($tickets);
            }

        }

        public function showTicketsUsuarios(){

            global $conn;

            $sucursal=$this->obtenerSucursal();


            

            $sql="SELECT 
                    t.folio,
                    t.fecha_Abierto,
                    t.hora_Abierto,
                    s.nombre AS sucursal, 
                    t.descripcion
                    
                    
                FROM tickets t
                INNER JOIN sucursal s ON t.sucursal = s.id
                WHERE t.estatus = '$this->estatus' AND t.sucursal = $sucursal
                ORDER BY t.fecha_Abierto DESC, t.hora_Abierto DESC";
                $result=$conn->query($sql);
                $tickets=[];
                if($result->num_rows>0){
                    while($row=$result->fetch_assoc()){
                        $tickets[]=$row;
                        
                    }
                echo json_encode($tickets);
                }else{
                    $tickets["MESSAGE"]="no hay tickets";
                    echo json_encode($tickets);
                }



        }
        public function asieLIU(){
            global $conn;

            $sucursal=$this->obtenerSucursal();
                    $sql="SELECT 
            t.folio,
            t.fecha_Abierto,
            t.hora_Abierto,
            s.nombre AS sucursal,
            t.usuario,
            t.telefono,
            p.nombre AS problema,
            t.descripcion,
            t.ip_Equipo,
            t.estatus
            FROM tickets t
            INNER JOIN sucursal s ON t.sucursal = s.id
            INNER JOIN problema p ON t.problema = p.id where sucursal = $sucursal and estatus='$this->estatus'
            ORDER BY t.folio DESC
            LIMIT 1

            ";
            $result=$conn->query($sql);
            $datosE=[];

            if($result->num_rows>0){
                $row=$result->fetch_assoc();
                $datosE=$row;

                echo json_encode($datosE);
            }
        }

        public function asideLIC(){
            global $conn;
            $sql="SELECT
                t.folio,
                t.usuario,
                t.telefono,
                t.descripcion,
                t.ip_Equipo,
                t.falla_Real,
                t.causa,
                t.recomendacion,
                t.estatus,
                t.modo,
                t.turno,
                t.error_Sucursal,
                t.tiempo_Solucion,
                t.mes,
                t.year,
                t.fecha_Abierto,
                t.hora_Abierto,
                t.fecha_Cerrado,
                t.hora_Cerrado,

                s.nombre AS sucursal,
                a.nombre AS area,
                e.nombre AS equipo,
                u.nombre AS admin,
                p.nombre AS problema

                FROM tickets t 
                INNER JOIN sucursal s ON t.sucursal = s.id
                INNER JOIN area a ON t.area = a.id
                INNER JOIN equipo e ON t.equipo = e.id
                INNER JOIN admin u ON t.admin = u.id
                INNER JOIN problema p ON t.problema = p.id where estatus='CERRADO'
                ORDER BY t.folio limit 1

                ";
                $result=$conn->query($sql);
                $datosE=[];
                if($result->num_rows>0){
                    while($row=$result->fetch_assoc()){
                        $datosE[]=$row;

                    }
                    echo json_encode($datosE);
                    

                }
        }
    }
?>