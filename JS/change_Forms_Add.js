


let btnChangeSucursal=document.getElementById('btnChangeSucursal');
let btnChangeProblema=document.getElementById('btnChangeProblema');
let btnChangeAdmin=document.getElementById('btnChangeAdmin');
let btnChangeEquipo=document.getElementById('btnChangeEquipo');
let btnChangeSupervisor=document.getElementById('btnChangeSuper');
let btnChangeArea=document.getElementById('btnChangeArea');
let btnChangePuesto=document.getElementById('btnChangePuesto');


btnChangeSucursal.addEventListener('click', function(event){
    event.preventDefault();
    mostrarFormulario(1);
});

btnChangeProblema.addEventListener('click', function(event){
    event.preventDefault();
    mostrarFormulario(2);
});

btnChangeAdmin.addEventListener('click', function(event){
    event.preventDefault();
    mostrarFormulario(3);
});

btnChangeEquipo.addEventListener('click', function(event){
    event.preventDefault();
    mostrarFormulario(4);
});

btnChangeSupervisor.addEventListener('click', function(event){
    event.preventDefault();
    mostrarFormulario(5);
});

btnChangeArea.addEventListener('click', function(event){
    event.preventDefault();
    mostrarFormulario(6);
});
btnChangePuesto.addEventListener('click', function(event){
    event.preventDefault();
    mostrarFormulario(7);
});



function mostrarFormulario(number) {
  let forms = document.querySelectorAll('article');

  
  forms.forEach(function(form, i) {
    
    form.classList.add('d-none'); // Oculta todos
    if (i === number-1) {
      form.classList.remove('d-none'); // Muestra solo uno
    }
  });
}