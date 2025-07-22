fetch("../PHP/forms_ADD_Selects.php",{

})
.then(res=>res.json())
.then(data=>{
    console.log(data['MENSAGE']);
});