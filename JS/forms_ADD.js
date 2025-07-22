let btnFormSucursal = document.getElementById("btnFormSucursal");
let btnFormProblema = document.getElementById("btnFormProblema");
let btnFormAdmin = document.getElementById("btnFormAdmin");
let btnFormEquipo = document.getElementById("btnFormEquipo");
let btnFormSupervisor = document.getElementById("btnFormSupervisor");
let btnFormArea = document.getElementById("btnFormArea");
let btnFormPuesto = document.getElementById("btnFormPuesto");
let datos={};

btnFormSucursal.addEventListener('click', function(event){
    event.preventDefault();
    let inputFormSucursal = document.getElementById("inputFormSucursal").value;
    let inputFormSupervisorS = document.getElementById("inputFormSupervisorS").value;
    let inputFormSegmento = document.getElementById("inputFormSegmento").value;
    datos={
        "tabla":"sucursal",
        "sucursal":inputFormSucursal,
        "supervisor":inputFormSupervisorS,
        "segmento":inputFormSegmento
    };
    fetchDatos(datos);
});

btnFormProblema.addEventListener('click', function(event){
    event.preventDefault();
    let inputFormProblema = document.getElementById("inputFormProblema").value;
    datos={
        "tabla":"problema",
        "nombre":inputFormProblema
    };
    fetchDatos(datos);

});
btnFormAdmin.addEventListener('click', function(event){
    event.preventDefault();
    let inputFormAdmin = document.getElementById("inputFormAdmin").value;
    datos={
        "tabla":"admin",
        "nombre":inputFormAdmin
    };

    fetchDatos(datos);
});
btnFormEquipo.addEventListener('click', function(event){
    event.preventDefault();
    let inputFormEquipo = document.getElementById("inputFormEquipo").value;
    datos={
        "tabla":"equipo",
        "nombre":inputFormEquipo
    };

    fetchDatos(datos);
});
btnFormSupervisor.addEventListener('click', function(event){
    event.preventDefault();
    let inputFormSupervisor = document.getElementById("inputFormSupervisor").value;
    let inputFormCorreo = document.getElementById("inputFormCorreo").value;
    let inputFormTelefono = document.getElementById("inputFormTelefono").value;

    datos={
        "tabla":"supervisores",
        "nombre":inputFormSupervisor,
        "correo":inputFormCorreo,
        "telefono":inputFormTelefono
    };

fetchDatos(datos);
});
btnFormArea.addEventListener('click', function(event){
    event.preventDefault();
    let inputFormArea = document.getElementById("inputFormArea").value;
    datos={
        "tabla":"area",
        "nombre":inputFormArea
    };
    fetchDatos(datos);

});
btnFormPuesto.addEventListener('click', function(event){
    event.preventDefault();
    let inputFormPuesto = document.getElementById("inputFormPuesto").value;
    datos={
        "tabla":"puesto",
        "nombre":inputFormPuesto
    };

    fetchDatos(datos);
});

function fetchDatos(datos){
    fetch("../PHP/forms_ADD.php",{
        method:"POST",
        headers:{
            "Content-Type":"application/json"
        },
        body:JSON.stringify(datos)
    })
    .then(res=>res.json())
    .then(data=>{
        console.log(data["MENSAGE"]);
    })
}