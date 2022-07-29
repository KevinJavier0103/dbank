
import {dbank } from "../../declarations/dbank";

window.addEventListener("load",  async function(){
  // console.log("Finished loading");
  update();
});

document.querySelector("form").addEventListener("submit", async function (event) {
  event.preventDefault();
  // console.log("The button was presed")

  const button = event.target.querySelector("#submit-btn");

  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

  button.setAttribute("disabled", true);

  //revision de que se ingreso un valor en la casilla de input
  if (document.getElementById("input-amount").value.length != 0) {

    await dbank.topUp(inputAmount);

  }

  if (document.getElementById("withdrawal-amount").value.length != 0){

    await dbank.reduceDow(outputAmount);
  }

  await dbank.compound();


  update();
  // seccion que genera que los inputs establecidos despues de ser presionado el boton se limpien
  document.getElementById("input-amount").value ="";
  document.getElementById("withdrawal-amount").value ="";

  button.removeAttribute("disabled");



});

async function update() {
  
  const currentAmount = await dbank.checkBalance();
  document.getElementById("value").innerText=Math.round(currentAmount*100)/100;
};