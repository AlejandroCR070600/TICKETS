
view_Tickets();





function view_Tickets(){
    let estatus={"estatus":"ABIERTO"};
fetch("../PHP/show_Ticket_All/show_Tickets_Usuario.php", {
    method:"POST",
    headers:{
        "Content-Type":"application/json"
    },
    body:JSON.stringify(estatus)


})
.then(res=>res.json())
.then(data=>{
    
    
   let datos={};
    
    datos=data;
    
   if(Array.isArray(data)){
    
     let columnas=["sucursal","folio","fecha_Abierto","descripcion"]
  for(let i= 0; i<datos.length;i++){
    let tr=document.createElement("tr");
    tr.id="tr"+i;
        tr.addEventListener("click", ()=>{
            click(tr.id);
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

    let trMASSAGE=document.createElement("tr");
   let tdMASSAGE=document.createElement("td");
   tdMASSAGE.colSpan=9;
   tdMASSAGE.textContent="NO HAY NINGUN TICKET ABIERTO";
   tdMASSAGE.id="tdMASSAGE";
   trMASSAGE.id="noHayTicket"
   trMASSAGE.classList.add("text-center");
   trMASSAGE.appendChild(tdMASSAGE);
   tbody.appendChild(trMASSAGE);
   }
 
});
}


