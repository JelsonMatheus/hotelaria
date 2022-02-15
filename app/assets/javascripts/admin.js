function set_url(url){
  const btn = document.querySelector(".modal-btn-delete");
  console.log(btn);
  btn.href = url;
}

window.addEventListener("load", () => {
  const modalDelete = document.getElementById('modalDelete');
  const btnDelete =  document.querySelectorAll('.btn-delete');

  btnDelete.forEach(element => {
    element.addEventListener("click",event =>{
      const modal = bootstrap.Modal.getOrCreateInstance(modalDelete); 
      modal.show();
      const url = event.currentTarget.dataset.url;
      set_url(url);
    });
  });

  $(".phone").mask("(00) 000000000");

});