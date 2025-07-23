fetch("../PHP/forms_ADD_Selects.php",{

})
.then(res=>res.json())
.then(data=>{
    console.log(data);

     let selectS=document.getElementById('selectFormSupervisorS');
            for(let i=0;i<data['supervisores'].length;i++){
                let optionS=document.createElement('option');
                optionS.value=data['supervisores'][i]['id'];
                optionS.textContent=data['supervisores'][i]['nombre'];
                selectS.appendChild(optionS);
                
            }

    let selectP=document.getElementById('selectFormPuesto');
               for(let i=0;i<data['puesto'].length;i++){
                let optionP=document.createElement('option');
                optionP.value=data['puesto'][i]['id'];
                optionP.textContent=data['puesto'][i]['nombre'];
                selectP.appendChild(optionP);
            }
});