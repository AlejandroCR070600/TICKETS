let form=document.getElementById('formBuscar');

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
        console.log(data);
    })

});