//primero vamos a definir las variables que ocupamos del DOM

let btnCerrado =document.getElementById('btnTicketCerrado');
let btnAbierto =document.getElementById('btnTicketAbierto');
let btnPendiente=document.getElementById('btnTicketPendiente');
let showTicket=document.getElementById("showTicket");
let formClose=document.getElementById("formClose");
let showTicketClose=document.getElementById("showTicketClose");
let btnProcesoDnone=document.getElementById("btnProceso-D-none");
let proceso=document.getElementById("proceso-D-none");

//Creamos los botones

btnAbierto.addEventListener("click", function(event){

  viewAsideOpenInfo("ABIERTO");

  //lo primero que hacen es ocultar todo agregando un d-none a los paneles y despues quita el d-none al panel que quiere mostrar

  
  showTicket.classList.remove("d-none");
  formClose.classList.add("d-none");
  showTicketClose.classList.add("d-none");
  proceso.classList.add('d-none');

  btnProcesoDnone.classList.remove("d-none");

    let opcion={
        "ESTATUS":"ABIERTO"
    };
    selecEstatus(opcion, "ABIERTO");

});

btnPendiente.addEventListener('click', function(event){
  viewAsideOpenInfo("PENDIENTE");
  
  
  proceso.classList.remove("d-none");
  showTicketClose.classList.add("d-none");
  formClose.classList.add("d-none");
  showTicket.classList.remove("d-none");
//  btnProcesoDnone.classList.add("d-none")
  
   let opcion={
        "ESTATUS":"PENDIENTE"
    };
    selecEstatus(opcion, "PENDIENTE");
});

btnCerrado.addEventListener("click", function(event){
  asideLIC();
   showTicket.classList.add("d-none");
   formClose.classList.add("d-none");
  showTicketClose.classList.remove("d-none");
  
  
    
    let opcion={
        "ESTATUS":"CERRADO"
    };
    selecEstatus(opcion, "CERRADO");

});



function selecEstatus(opcion, estatus){
  console.log(estatus);
    fetch("../PHP/selectEstatusTicket.php", {
        method: "POST",
        headers:{
            "Content-Type":"application/json"
        },
        body: JSON.stringify(opcion)
    })
    .then(res=>res.json())
    .then(data=>{
        let datos={};
    
    datos=data;
    console.log(datos);
   if(Array.isArray(data)){
    console.log("hola");
    let tbody=document.getElementById("tbody")
    let trs=document.querySelectorAll("#tbody tr");
      console.log(trs.length);

  if(trs.length>0){
    trs.forEach(tr=>{
      console.log("wajapen")
      tr.remove();
    })
  }
     let columnas=["sucursal","folio","fecha_Abierto","descripcion"]
  for(let i= 0; i<datos.length;i++){
    let tr=document.createElement("tr");
    tr.id="tr"+i;
        tr.addEventListener("click", ()=>{

        switch(estatus){
          case "ABIERTO":
            click(tr.id);
            break;
          case "PENDIENTE":
            clickPendiente(tr.id);
            break;
          case "CERRADO":
            clickClose(tr.id);
            break;
          default:
            click(tr.id);
            break;
        }
           
    });
       
    //trs.push(tr.id);
    for(let e=0;e<4;e++){
      if(e===2){
        let td=document.createElement("td");
        td.classList.add('truncate-td');
        td.textContent=datos[i][columnas[e]]+"  "+datos[i]["hora_Abierto"];
        tr.appendChild(td);
      }else{
          let td=document.createElement("td");
        td.classList.add('truncate-td');
        td.textContent=datos[i][columnas[e]];
        tr.appendChild(td);
      }
    }

     
  tbody.appendChild(tr);
 

  
  
  
  }
   }else{
       let tbody=document.getElementById("tbody")
      let trs=document.querySelectorAll("#tbody tr");
      console.log(trs.length);

  if(trs.length>0){
    trs.forEach(tr=>{
      console.log("wajapen")
      tr.remove();
    })
  }
    let trMASSAGE=document.createElement("tr");
   let tdMASSAGE=document.createElement("td");
   tdMASSAGE.colSpan=9;
   tdMASSAGE.textContent="NO HAY NINGUN TICKET ABIERTO";
   tdMASSAGE.id="tdMASSAGE";
   trMASSAGE.classList.add("text-center");
   trMASSAGE.appendChild(tdMASSAGE);
   tbody.appendChild(trMASSAGE);
   }
    })
}

function asideLIC(){
  fetch("../PHP/showAllInfoTicketEstatus.php",{
 

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