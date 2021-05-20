window.addEventListener("load", ()=>{
  
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  itemPrice.addEventListener("input",()=>{
    const itemValue = itemPrice.value;
    addTaxPrice.innerHTML = Math.floor( itemValue * 0.1 );
    profit.innerHTML = Math.floor( itemValue * 0.9 );
  });
});