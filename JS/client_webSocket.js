const socket = io('http://localhost:3000'); // Usa tu IP real si accedes desde otro dispositivo

  let trs=document.querySelectorAll("tr");
  //console.log(trs);

socket.on('connect', () => {
  //console.log(' Conectado al WebSocket:', socket.id);
});
trsID=[];
socket.on('mensaje', (msg) => {
  const datos = JSON.parse(msg); // Muy importante
  //console.log (datos);
  let tbody=document.getElementById("tbody")
  let columnas=["sucursal","folio","fecha_Abierto","descripcion"]
  let trs=document.querySelectorAll("#tbody tr");
  console.log(trs[0]['id']);
  if(trs.length>0){
    if(trs[0]['id']==='noHayTicket'){
      trs.forEach(tr=>{
      let trRemove=document.getElementById(tr.id);
      trRemove.remove();
    })
    }else{
      trs.forEach(tr=>{
      let trRemove=document.getElementById(tr.id);
      trRemove.remove();
    })
    }

  }

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
  
  
  
  
 

    
});


