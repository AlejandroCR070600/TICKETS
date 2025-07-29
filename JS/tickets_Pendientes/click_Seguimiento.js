function click_Seguimiento(folio){
let datosE={
    "folio":folio
};
fetch("../PHP/tickets_Pendientes/click_Seguimiento.php",{
    method:"POST",
    headers:{
        "Content-Type":"application/json"
    },
    body:JSON.stringify(datosE)

})
.then(res=>res.json())
.then(data=>{
    let mostrar_Seguimiento=document.getElementById("mostrar_Seguimiento");
//    console.log(data);
    mostrar_Seguimiento.innerHTML="";

    for(let i=0;i<data.length;i++){
        let p=document.createElement("p");
        p.textContent=i+1+".- " + data[i];
        mostrar_Seguimiento.appendChild(p);

        console.log(data[i]);
    }

});

}
