import {dbank} from "../../declarations/dbank";

window.addEventListener("load", async ()=>{
  const currentAmount = await dbank.checkBalance();
  document.querySelector("#value").innerHTML= Math.round(currentAmount * 100) / 100;
})

document.querySelector("form").addEventListener("submit", async (event)=>{
  event.preventDefault();

  const button = event.target.querySelector("#submit-btn");
  const inputAmount = parseFloat(document.querySelector("#input-amount").value);
  const outputAmount = parseFloat(document.querySelector("#withdraw-amount").value);

  button.setAttribute("disabled", true);
  await dbank.topUp(inputAmount);
  await dbank.withdraw(outputAmount);

  const currentAmount = await dbank.checkBalance();
  document.querySelector("#value").innerHTML= Math.round(currentAmount * 100) / 100;

  document.querySelector("#input-amount").value="0";
  document.querySelector("#withdraw-amount").value="0";
  button.removeAttribute("disabled");
})