

let form=document.getElementById('formBuscar');
let selectChange=document.getElementById("selectBuscar");


selectChange.addEventListener('change', function(event){
    
    if(selectChange.value==="sucursal" || selectChange.value==="area" ||selectChange.value==="equipo" ||selectChange.value==="admin" || selectChange.value==="problema"){
        console.log(document.getElementById('inputBuscar'));  
         let removeInput=document.getElementById('inputBuscar');
         let divChange=document.getElementById('divChange');
            removeInput.remove();

        fetch("../PHP/selectChange.php",{
            method: "POST",
            headers:{
                "Content-Type":"application/json"
            },
            body: JSON.stringify(selectChange.value)
        })  
        .then(res=>res.json())
        .then(data=>{
            console.log(data);
          
            let select=document.createElement('select');
            select.classList.add('form-control', 'border-primary', 'shadow-sm');
            select.id="inputBuscar";
            divChange.appendChild(select);
            for(let i=0;i<data.length;i++){
                let option=document.createElement('option');
                option.value=data[i]['id'];
                option.textContent=data[i]['nombre'];
                select.appendChild(option);
            }
        })
    }else{
            let removeInput=document.getElementById('inputBuscar');
            let divChange=document.getElementById('divChange');
            removeInput.remove();
       
            let input=document.createElement('input');
            input.classList.add('form-control', 'border-primary', 'shadow-sm');
            input.id="inputBuscar";
            input.placeholder="Escribe tu búsqueda"

            divChange.appendChild(input);
          
        
    }
});





form.addEventListener('submit', function(event){
    event.preventDefault();
    let selectBuscar=form.elements['selectBuscar'].value;
    let inputBuscar=form.elements['inputBuscar'].value;
    console.log(inputBuscar + " " +selectBuscar);
    let datos={
        "selectBuscar":selectBuscar,
        "inputBuscar":inputBuscar
    };

    fetch("../PHP/buscar_Ticket.php", {
        method: "POST",
        headers: {
            "Content-Type":"application/json"
        },
        body: JSON.stringify(datos)
    })
    .then(res=>res.json())
    .then(data=>{
        
              let datos={};
    
    datos=data;
    
        if(Array.isArray(data)){
    
    
     let columnas=["sucursal","folio","fecha_Abierto","descripcion"]
              let tbody=document.getElementById("tbody")
      let trs=document.querySelectorAll("#tbody tr");
                  if(trs.length>0){
                        trs.forEach(tr=>{
                        console.log("wajapen")
                        tr.remove();
                        })
                    }

  for(let i= 0; i<datos.length;i++){
    console.log("hola");
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
        td.textContent=datos[i][columnas[e]]+"  "+datos[0]["hora_Abierto"];
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

});

