
let btnTicket=document.getElementById('btnAgregarTicket');
btnTicket.addEventListener('click', function(){
    agregarTicket()
    .then(()=>{
    enviarDesdePHP();
    })
    .catch(err =>{
        console.error("error al agregar el ticket");
    })


})

function enviarDesdePHP() {
  fetch('../PHP/websocket.php')
    .then(res => res.text())
    .then(data => {
      console.log('📤 PHP ejecutado correctamente:', data);
    })
    .catch(err => {
      console.error('❌ Error al llamar a PHP:', err);
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
    }
    console.log(datos['telefono']);

    return fetch("../PHP/add_Ticket.php",{
        method:"POST",
        headers: {
            "Content-Type":"application/json"
        },
        body: JSON.stringify(datos)
    })
    .then(res=>res.json())
    .then(data=>{
        alert(data);
    })

}