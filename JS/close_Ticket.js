let btnChange=document.getElementById("btnChange");
let btnReturnTicket=document.getElementById("btnReturnTicket");
let closeTicketButton=document.getElementById("closeTicketButton");
adminSelect();
equiposSelect();
areaSelect();
btnChange.addEventListener("click", function(){

let showTicket=document.getElementById("showTicket");
let formClose=document.getElementById("formClose");

showTicket.classList.add('d-none');
formClose.classList.remove('d-none')


});

btnReturnTicket.addEventListener("click", function(){
    let showTicket=document.getElementById("showTicket");
let formClose=document.getElementById("formClose");

showTicket.classList.remove('d-none');
formClose.classList.add('d-none');
});
closeTicketButton.addEventListener("click", function(event){
closeTicket()
.then(()=>{
    enviarDesdePHP();
    });
    
    
});
function equiposSelect(){
    
    fetch("../PHP/select_Equipo.php",{
    })
    .then(res=>res.json())
    .then(data=>{
        
        let selectEquipo=document.getElementById("equipoAside");
        //console.log(data);
        
            if(Array.isArray(data)){
                
                
                for(let i=0;i<data.length;i++){
                    
                    let option=document.createElement('option');
                    option.textContent=data[i]['nombre'];    
                    option.value=data[i]['id'];
                    selectEquipo.appendChild(option);
                }
           
            }else{
                let option=document.createElement('option');
                option.textContent="SIN EQUIPOS";
                selectEquipo.appendChild(option);
                selectEquipo.disabled=true;
            }
        

    
     

    })
}
function areaSelect(){
    
    fetch("../PHP/select_Area.php",{
    })
    .then(res=>res.json())
    .then(data=>{
        
        let selectArea=document.getElementById("areaAside");
        //console.log(data);
        
            if(Array.isArray(data)){
                
                
                for(let i=0;i<data.length;i++){
                    
                    let option=document.createElement('option');
                    option.textContent=data[i]['nombre'];    
                    option.value=data[i]['id'];
                    selectArea.appendChild(option);
                }
           
            }else{
                let option=document.createElement('option');
                option.textContent="SIN AREAS";
                selectArea.appendChild(option);
                selectArea.disabled=true;
            }
        

    
     

    })
}

function enviarDesdePHP() {
  fetch('../PHP/websocket.php')
    .then(res => res.text())
    .then(data => {
      //console.log('PHP ejecutado correctamente:', data);
    })
    .catch(err => {
      //console.error(' Error al llamar a PHP:', err);
    });
}


function closeTicket(){


    let folio=document.getElementById("folioAside").textContent;
    let falla_Real=document.getElementById("falla_RealAside").value;
    let causa=document.getElementById("causaAside").value;
    let recomendacion=document.getElementById("recomendacionAside").value;
    let area=document.getElementById("areaAside").value;
    let equipo=document.getElementById("equipoAside").value;
    let modo=document.getElementById("modoAside").value;
    let admin=document.getElementById("adminAside").value;
    let turno=document.getElementById("turnoAside").value;
    let error_Sucursal=document.getElementById("error_SucursalAside").value;
    


    let datos={
        "folio":folio,
        "falla_Real":falla_Real,
        "causa":causa,
        "recomendacion":recomendacion,
        "area":area,
        "equipo":equipo,
        "modo":modo,
        "admin":admin,
        "turno":turno,
        "error_Sucursal":error_Sucursal
    }

    console.log(datos);

    return fetch("../PHP/close_Tickets.php",{
        method:"POST",
        headers:{
            "Content-Type":"application/json"
        },
        body:JSON.stringify(datos)
    })
    .then(res=>res.json())
    .then(data=>{
        console.log(data['MENSAGE']);
        alert(data['MENSAGE']);
        
    })

    
    
}

function adminSelect(){
    fetch("../PHP/select_Admin.php",{
    })
    .then(res=>res.json())
    .then(data=>{
        let selectAdmin=document.getElementById("adminAside");
        
        
            if(Array.isArray(data)){
                    //console.log("hgolaasdasdfsdf");
                
                for(let i=0;i<data.length;i++){
                
                    let option=document.createElement('option');
                    option.textContent=data[i]['nombre'];    
                    option.value=data[i]['id'];
                    selectAdmin.appendChild(option);
                }
           
            }else{
                let option=document.createElement('option');
                option.textContent="SIN ADMINISTRADORES";
                selectAdmin.appendChild(option);
                selectAdmin.disabled=true;
            }
        

    
     

    })
}
