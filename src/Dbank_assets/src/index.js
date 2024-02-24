import { Dbank } from "../../declarations/Dbank";

window.addEventListener("load", async function(){
 //  console.log("finished laoding ");
  const currentAmount = await  Dbank.checkBalance();

  document.getElementById("value").innerText = currentAmount.toFixed(2);

});

document.querySelector("form").addEventListener("submit",async function(event){
 event.preventDefault();

const button =event.target.querySelector("#submit-btn");

 const inputAmount = parseFloat(document.getElementById("input-amount").value );
 const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value) ;

button.setAttribute("disabled",true);


// so that the empty add value makes the current value to NAN
if( document.getElementById("input-amount").value.length != 0){

 await Dbank.topUp(inputAmount);
 const currentAmount = await  Dbank.checkBalance();
 document.getElementById("value").innerText = currentAmount.toFixed(2);

}
if(document.getElementById("withdrawal-amount").value.length != 0){
 
  await Dbank.withdraw(outputAmount);
  const currentAmount = await  Dbank.checkBalance();
 document.getElementById("value").innerText = currentAmount.toFixed(2);

}

await Dbank.compound();

//to remove the value from the dialog box
 document.getElementById("input-amount").value ="";
 document.getElementById("withdrawal-amount").value ="";
 button.removeAttribute("disabled");


});