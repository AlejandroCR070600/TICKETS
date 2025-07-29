
viewAsideOpenInfo("ABIERTO");

function viewAsideOpenInfo(estatus){

    datosE={
        "estatus":estatus
    };



fetch("../PHP/asideLastInfo.php",{
    method:"POST",
    headers:{
        "Content-Type":"application/json"
    },
    body:JSON.stringify(datosE)

})
.then(res=>res.json())
.then(data=>{

    let sucursalAside=document.getElementById("sucursalAside");
    let folioAside=document.getElementById("folioAside");
    let fechaAside=document.getElementById("fechaAside");
    let usuarioAside=document.getElementById("usuarioAside");
    let telefonoAside=document.getElementById("telefonoAside");
    let problemaAside=document.getElementById("problemaAside");
    let ipEquipoAside=document.getElementById("ipEquipoAside");
    let descripcionAside=document.getElementById("descripcionAside");
    
    let datos={}
    //console.log(data['folio']);

    sucursalAside.textContent=data['sucursal'];
    folioAside.textContent=data['folio'];
    fechaAside.textContent=data['fecha_Abierto'] + "  " + data['hora_Abierto'];
    usuarioAside.textContent=data['usuario'];
    telefonoAside.textContent=data['telefono'];
    problemaAside.textContent=data['problema'];
    ipEquipoAside.textContent=data['ip_Equipo'];
    descripcionAside.textContent=data['descripcion'];
    
});
    
}
