function priceCalc(){
  const priceForm = document.getElementById("item-price")
  priceForm.addEventListener('keyup', () => {
    const price = priceForm.value
    const tax = Math.floor( price / 10 )
    const profit = priceForm - tax
    const taxDisplay = document.getElementById("add-tax-price")
    const profitDisplay = document.getElementById("profit")
    if (tax >= 1){
      taxDisplay.innerHTML = tax
    } else {
      taxDisplay.innerHTML = "0"
    }
    profitDisplay.innerHTML = price - tax
  })
}

window.addEventListener('load',priceCalc)