function DeletePaper(num){
  $('#DeletePaperId').attr("href", "/delete?id="+num);
  document.getElementById("ModalBody").innerText = "Can I delete No." + num + " paper info?";
  $('#DeleteModal').modal();
}
