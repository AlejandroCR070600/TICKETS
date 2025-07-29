let btnEstatusPendiente=document.getElementById("btnEstatusPendiente");






btnEstatusPendiente.addEventListener("click", function(event){
    let folio=document.getElementById('folioAside').textContent;
    let inputProceso=document.getElementById('inputProceso').value;
    console.log(inputProceso);
    if(inputProceso===""){
        alert("el valor esta vacio");
    }else{
        datosE={
                "folio":folio,
                "estatus":"PENDIENTE",
                "seguimiento":inputProceso
            };
            
            fetch("../PHP/ticket_Pendiente.php",{
                method:"POST",
                headers:{
                    "Content-Type":"application/json"
                },
                body:JSON.stringify(datosE)
            })
            .then(res=>res.json())
            .then(data=>{
                console.log(data);
                alert(data['MESSAGE']);
                enviarDesdePHP();
            
            });
    }
    

});