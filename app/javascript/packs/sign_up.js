const workerNode = document.getElementById("worker");
const companyNode = document.getElementById("company");

document.querySelector("#worker").addEventListener('click', () => {

  if (workerNode.classList.contains('active') === false) {
    workerNode.classList.add('active');
    companyNode.classList.remove('active');
  }
});

document.querySelector("#company").addEventListener('click', () => {
  
  if (companyNode.classList.contains('active') === false) {
    workerNode.classList.remove('active');
    companyNode.classList.add('active');  
   }
}); 


