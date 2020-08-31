window.addEventListener('load', function(){
  const getItemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const getProfit = document.getElementById("profit")

  getItemPrice.addEventListener('input', function(){
    const price = getItemPrice.value
    console.log(price)
    addTaxPrice.innerHTML = price * 0.1
    console.log(addTaxPrice.innerHTML)
    getProfit.innerHTML = price * 0.9
    console.log(getProfit.innerHTML)
  })
})  