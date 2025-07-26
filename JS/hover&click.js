
    
   
        function click(id){
    
    let asideValues=[]
    let tds=document.querySelectorAll("#"+ id +" td"); 
    
    tds.forEach(td=>{
            
        asideValues.push(td.textContent);
    });
    let datosE={'folio': asideValues[1]};

    fetch("../PHP/showDataAside.php",{
        method:"POST",
        headers:{
            "Content-Type":"application/json"
        },
        body:JSON.stringify(datosE)

        })
        .then(res=>res.json())
        .then(data=>{
            console.log(data[0]['sucursal']);
             let asideValues=[]
    let sucursalAside=document.getElementById("sucursalAside");
    let folioAside=document.getElementById("folioAside");
    let fechaAside=document.getElementById("fechaAside");
    let usuarioAside=document.getElementById("usuarioAside");
    let telefonoAside=document.getElementById("telefonoAside");
    let problemaAside=document.getElementById("problemaAside");
    let ipEquipoAside=document.getElementById("ipEquipoAside");
    let descripcionAside=document.getElementById("descripcionAside");
    
   
        sucursalAside.textContent=data[0]['sucursal'];
        folioAside.textContent=data[0]['folio'];
        fechaAside.textContent=data[0]['fecha_Abierto'] + " " + data[0]['hora_Abierto'];
        usuarioAside.textContent=data[0]['usuario'];
        telefonoAside.textContent=data[0]['telefono'];
        problemaAside.textContent=data[0]['problema'];
        ipEquipoAside.textContent=data[0]['ip_Equipo'];
        descripcionAside.textContent=data[0]['descripcion'];
    });
        
}
        


function clickClose(id){

let asideValues=[]
  let tds=document.querySelectorAll("#"+ id +" td");
     
        tds.forEach(td=>{
            
            asideValues.push(td.textContent);
        })

        console.log(asideValues[1]);
        

fetch("../PHP/showAllInfoTicket.php",{
    method: "POST",
    headers:{
        "Content-Type":"application/json"
    },
    body:JSON.stringify(asideValues[1])

})
.then(res=>res.json())
.then(data=>{
    console.log(data);
    let sucursalClose=document.getElementById("sucursalClose");
    let folioClose=document.getElementById("folioClose");
    let fechaAbiertoClose=document.getElementById("fechaAbiertoClose");
    let usuarioClose=document.getElementById("usuarioClose");
    let telefonoClose=document.getElementById("telefonoClose");
    let problemaClose=document.getElementById("problemaClose");
    let ipEquipoClose=document.getElementById("ipEquipoClose");
    let descripcionClose=document.getElementById("descripcionClose");
    let fallaRealClose=document.getElementById("fallaRealClose");
    let causaClose=document.getElementById("causaClose");
    let recomendacionClose=document.getElementById("recomendacionClose");
    let areaClose=document.getElementById("areaClose");
    let equipoClose=document.getElementById("equipoClose");
    let atendioClose=document.getElementById("atendioClose");
    let turnoClose=document.getElementById("turnoClose");
    let modoClose=document.getElementById("modoClose");
    let errorSucursalClose=document.getElementById("errorSucursalClose");
    let fechaCerradoClose=document.getElementById("fechaCerradoClose");
    let tiempoSolucionClose=document.getElementById("tiempoSolucionClose");

    sucursalClose.textContent=data[0]['sucursal'];
    folioClose.textContent=data[0]['folio'];
    fechaAbiertoClose.textContent=data[0]['fecha_Abierto']+" "+data[0]['hora_Abierto'];
    usuarioClose.textContent=data[0]['usuario']
    telefonoClose.textContent=data[0]['telefono'];
    problemaClose.textContent=data[0]['problema'];
    ipEquipoClose.textContent=data[0]['ip_Equipo'];
    descripcionClose.textContent=data[0]['descripcion'];
    fallaRealClose.textContent=data[0]['falla_Real'];
    causaClose.textContent=data[0]['causa'];
    recomendacionClose.textContent=data[0]['recomendacion'];
    areaClose.textContent=data[0]['area'];
    equipoClose.textContent=data[0]['equipo'];
    atendioClose.textContent=data[0]['admin'];
    turnoClose.textContent=data[0]['turno'];
    modoClose.textContent=data[0]['modo'];
    errorSucursalClose.textContent=data[0]['error_Sucursal'];
    fechaCerradoClose.textContent=data[0]['fecha_Cerrado']+" "+data[0]['hora_Cerrado'];
    tiempoSolucionClose.textContent=data[0]['tiempo_Solucion'] + " MINUTOS";


    
});

}
