






view_Tickets();





function view_Tickets(){
     
fetch("../PHP/show_Tickets.php", {


})
.then(res=>res.json())
.then(data=>{
    
   let datos={};
    
    datos=data;
   if(Array.isArray(data)){
    console.log("hola");
     let columnas=["folio","fecha_Abierto","sucursal","usuario","telefono","problema","descripcion","ip_Equipo", "estatus"]
  for(let i= 0; i<datos.length;i++){
    let tr=document.createElement("tr");
    tr.id="tr"+i;
        tr.addEventListener("click", ()=>{
            click(tr.id);
    });
       
    //trs.push(tr.id);
    for(let e=0;e<9;e++){
      if(e===1){
        let td=document.createElement("td");
        td.classList.add('truncate-td');
        td.textContent=datos[i][columnas[e]]+"  "+datos[1]["hora_Abierto"];
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
   trMASSAGE.classList.add("text-center");
   trMASSAGE.appendChild(tdMASSAGE);
   tbody.appendChild(trMASSAGE);
   }
 
});
}


