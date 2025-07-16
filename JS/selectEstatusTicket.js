
let btnCerrado =document.getElementById('btnTicketCerrado');
let btnAbierto =document.getElementById('btnTicketAbierto');
let showTicket=document.getElementById("showTicket");
let formClose=document.getElementById("formClose");
let showTicketClose=document.getElementById("showTicketClose");


btnCerrado.addEventListener("click", function(event){
   showTicket.classList.add("d-none");
   formClose.classList.add("d-none");
  showTicketClose.classList.remove("d-none");
  
    
    let opcion={
        "ESTATUS":"CERRADO"
    };
    selecEstatus(opcion, click());

});

btnAbierto.addEventListener("click", function(event){
  viewAsideOpenInfo();
  
  showTicket.classList.remove("d-none");
  formClose.classList.add("d-none");
  showTicketClose.classList.add("d-none");
    console.log("si me escucho");
    let opcion={
        "ESTATUS":"ABIERTO"
    };
    selecEstatus(opcion, "ABIERTO");

});



function selecEstatus(opcion, estatus){
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
     let columnas=["folio","fecha_Abierto","sucursal","usuario","telefono","problema","descripcion","ip_Equipo", "estatus"]
  for(let i= 0; i<datos.length;i++){
    let tr=document.createElement("tr");
    tr.id="tr"+i;
        tr.addEventListener("click", ()=>{
           if(estatus==="ABIERTO"){
            click(tr.id);
           }else{
            clickClose(tr.id);
           }
    });
       
    //trs.push(tr.id);
    for(let e=0;e<9;e++){
      if(e===1){
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