window.addEventListener("load", () => {
  const modalDelete = document.getElementById('modalDelete');
  const btnDelete =  document.querySelectorAll('.btn-delete');
  btnDelete.forEach(element => {
    element.addEventListener("click",event =>{
      const modal = bootstrap.Modal.getOrCreateInstance(modalDelete); 
      modal.show();
    });
    
  });

});