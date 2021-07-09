window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const fee = Math.floor( priceInput.value * 0.1 );
    const feePrice = document.getElementById("add-tax-price");
    feePrice.innerHTML = `${fee.toLocaleString()}`
    const salesProfit = priceInput.value - fee;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${salesProfit.toLocaleString()}`
  });
});