
let btnLogin=document.getElementById('btnLogin');

btnLogin.addEventListener('click',function(event){
    let usuario=document.getElementById('usuario').value;
let password=document.getElementById('password').value;
    event.preventDefault();
    console.log(usuario + " " + password);
    let datos={
        "usuario":usuario,
        "password":password
    };
    fetch("../PHP/login.php",{
        method:"POST",
        headers:{
            "Content-Type":"application/json"
        },
        body:JSON.stringify(datos)
    })
    .then(res=>res.json())
    .then(data=>{
        if(data['success']===true){
            alert(data['message']);
            window.location.href = "../HTML/add_Ticket.html";
        }else{
            alert(data['message']);
        }
    })
})
