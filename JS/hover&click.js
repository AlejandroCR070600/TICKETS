
function click(id){
    let asideValues=[]
    let sucursalAside=document.getElementById("sucursalAside");
    let folioAside=document.getElementById("folioAside");
    let fechaAside=document.getElementById("fechaAside");
    let usuarioAside=document.getElementById("usuarioAside");
    let telefonoAside=document.getElementById("telefonoAside");
    let problemaAside=document.getElementById("problemaAside");
    let ipEquipoAside=document.getElementById("ipEquipoAside");
    let descripcionAside=document.getElementById("descripcionAside");

     let tds=document.querySelectorAll("#"+ id +" td");
     
        tds.forEach(td=>{
            
            asideValues.push(td.textContent);
        })

        sucursalAside.textContent=asideValues[2];
        folioAside.textContent=asideValues[0];
        fechaAside.textContent=asideValues[1];
        usuarioAside.textContent=asideValues[3];
        telefonoAside.textContent=asideValues[4];
        problemaAside.textContent=asideValues[5];
        ipEquipoAside.textContent=asideValues[7];
        descripcionAside.textContent=asideValues[6];

        
}