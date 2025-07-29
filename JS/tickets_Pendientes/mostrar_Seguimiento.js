let folio=document.getElementById("folioAside").value;

let datosE={
    "folio":folio
};

fetch("../PHP/tickets_Pendientes/mostrar_Seguimiento.php",{
    method:"POST",
    headers:{
        "Content-Type":"application/json"
    },
    body:JSON.stringify(datosE)

})
.then(res=>res.json())
.then(data=>{
console.log(data);
});
