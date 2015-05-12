document.addEventListener("DOMContentLoaded", function(event) {
  getPurchasersCount();
  var pusher = new Pusher('918394cde828768b0b59');
  var channel = pusher.subscribe('purchase_channel');
  channel.bind('my_event', function(data) {
    addChildNodeToPurchasesList(data.message);
    getPurchasersCount();

  });


});

function getPurchasersCount(){
  var purchaseList = document.querySelectorAll('#purchase-list .purchase-name');
  if (purchaseList != undefined){
    var elem = document.getElementById('purchase-count');
    elem.innerHTML = purchaseList.length;
  }
}

function addChildNodeToPurchasesList(message){
  var purchaseList = document.getElementById('purchase-list');
  if (purchaseList != undefined){
    var textNode= document.createTextNode(message);
    var newItem = document.createElement("dt");
    newItem.className = 'purchase-name';
    newItem.appendChild(textNode);
    purchaseList.insertBefore(newItem, purchaseList.childNodes[0]);
  }
}
