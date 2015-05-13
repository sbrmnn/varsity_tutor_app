document.addEventListener("DOMContentLoaded", function(event) {
  var totalPurchaseCount = parseInt(document.getElementById('hidden-count').textContent)
  populatePurchasersCount(totalPurchaseCount);
  var pusher = new Pusher('918394cde828768b0b59');
  var channel = pusher.subscribe('purchase_channel');
  channel.bind('my_event', function(data) {
    addChildNodeToPurchasesList(data.message);


  });


});

function updatePurchasersCount(){
    var elem = document.getElementById('purchase-count');
    elem.innerHTML = parseInt(elem.innerHTML) + 1;
}

function populatePurchasersCount(count){
  if (count != undefined){
    var pc = document.getElementById('purchase-count');
    pc.innerHTML = count;
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
    var limit = parseInt(document.getElementById('hidden-limit').textContent);
    removeLastChildIfLimitHasBeenReached(limit)
    updatePurchasersCount();
  }
}

function removeLastChildIfLimitHasBeenReached(limit){
  if (limit != undefined) {
    var purchaseListTable = document.getElementById('purchase-list');
    var purchaseList = document.querySelectorAll('#purchase-list .purchase-name');
    if (purchaseList.length >= limit){
      var lastElementInPurchaseListTable = purchaseListTable.lastElementChild;
      purchaseListTable.removeChild(lastElementInPurchaseListTable)
    }
  }

}
