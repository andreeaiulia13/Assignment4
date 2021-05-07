const keyNameList = document.getElementsByClassName("food-name");
const priceList = document.getElementsByClassName("food-price");
const noOfPortions = new Array(12);

for (let i = 0; i < noOfPortions.length; i++) {
  noOfPortions[i] = 0;
}

function cartTotal() {
  let total = 0;
  for (let i = 0; i < noOfPortions.length; i++) {
    total += noOfPortions[i] * parseInt(priceList[i].textContent.replace("$", ""));
  }
  return total;
}

let element = document.getElementById("total-shopping-cart");
function updateTotal() {
  element.innerText = "Total: $" + cartTotal();
}

function addButton(i) {
  let price = priceList[i].textContent;
  let name = keyNameList[i].textContent;

  localStorage.setItem(name, price);
  noOfPortions[i]++;
  window.alert("You just added to the cart one portion of " + name + " (" + price + ")." + "\r\n" + " Your total is: $" + cartTotal());
  printInShoppingCart(name, price);
}

function printInShoppingCart(name, price) {
  let el = document.getElementById('cart-list');
  let node = document.createElement("li");

  node.innerText = name + " " + price;
  el.appendChild(node);
  updateTotal();
}

function openForm() {
  document.getElementById("my-form").style.display = "block";
}

function closeForm() {
  document.getElementById("my-form").style.display = "none";
}

