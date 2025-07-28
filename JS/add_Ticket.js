let btnTicket=document.getElementById('btnAgregarTicket');
sucursalesSelect();
problemaSelect();

btnTicket.addEventListener('click', async function(){
    
    try{
        let sucursal=document.getElementById("selectSucursal").value;
        console.log(sucursal);    
        await agregarTicket();
        await enviarCorreo();
        await enviarDesdePHP();
        alert('Ticket Agregado Con Exito');
  
    }catch(error){
        alert("hubo un error al procesar el ticket");
    }


});

function sucursalesSelect(){
    fetch("../PHP/select_Sucursal.php",{
    })
    .then(res=>res.json())
    .then(data=>{
        let selectSucursal=document.getElementById("selectSucursal");
        
        
            if(Array.isArray(data)){
                
                
                for(let i=0;i<data.length;i++){
                    
                    let option=document.createElement('option');
                    option.textContent=data[i]['nombre'];    
                    option.value=data[i]['id'];
                    selectSucursal.appendChild(option);
                }
           
            }else{
                let option=document.createElement('option');
                option.textContent="SIN SUCURSALES";
                selectSucursal.appendChild(option);
                selectSucursal.disabled=true;
            }
        

    
     

    });
}

function problemaSelect(){
    fetch("../PHP/select_Problema.php",{
    })
    .then(res=>res.json())
    .then(data=>{
        let selectSucursal=document.getElementById("selectProblema");
        
        
            if(Array.isArray(data)){
                
                
                for(let i=0;i<data.length;i++){
                    
                    let option=document.createElement('option');
                    option.textContent=data[i]['nombre'];    
                    option.value=data[i]['id'];
                    selectSucursal.appendChild(option);
                }
           
            }else{
                let option=document.createElement('option');
                option.textContent="SIN PROBLEMAS";
                selectSucursal.appendChild(option);
                selectSucursal.disabled=true;
            }
        

    
     

    });
}

function enviarCorreo(){
    let sucursal=document.getElementById("selectSucursal").value;
    fetch("../PHP/correo/enviarCorreo.php", {
        method:"POST",
        headers:{
            "Content-Type":"application/json"
        },
        body:JSON.stringify(sucursal)
    })
    .then(res=>res.json())
    .then(data=>{
        console.log(data);
    });

}

function enviarDesdePHP() {
  fetch('../PHP/websocket.php')
    .then(res => res.text())
    .then(data => {
      console.log(' PHP ejecutado correctamente:', data);
    })
    .catch(err => {
      console.error(' Error al llamar a PHP:', err);
    });
}

function agregarTicket(){
    
    
    let sucursal=document.getElementById("selectSucursal").value;
    let problema=document.getElementById("selectProblema").value;
    let usuario=document.getElementById("usuario").value;
    let telefono=document.getElementById("telefonoAdd").value;
    let descripcion=document.getElementById("descripcion").value;
    let ipEquipo=document.getElementById("ipEquipo").value;
    let datos={
        "sucursal":sucursal,
        "usuario":usuario,
        "telefono":telefono,
        "problema":problema,
        "descripcion":descripcion,
        "ipEquipo":ipEquipo
    };
    console.log(datos);
    
    

    return fetch("../PHP/add_Ticket.php",{
        method:"POST",
        headers: {
            "Content-Type":"application/json"
        },
        body: JSON.stringify(datos)
    })
    .then(res=>res.json())
    .then(data=>{
        alert(data['MESSAGE']);
    });

}