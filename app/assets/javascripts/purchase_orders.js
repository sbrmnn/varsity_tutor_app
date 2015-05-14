document.addEventListener("DOMContentLoaded", function(event) {
  var purchaseCount = document.getElementById('purchase-count');
  var purchaseList = document.getElementById('purchase-list');

  function updatePurchasersCount(){
    if(purchaseCount != undefined){
      var elemInt = parseInt(purchaseCount.innerHTML)
      if (elemInt != NaN){
        purchaseCount.innerHTML = elemInt + 1;
      }
    }
  }

  function addChildNodeToPurchasesList(message){
    if (purchaseList != undefined){
      var textNode= document.createTextNode(message);
      var newItem = document.createElement("dt");
      newItem.className = 'purchase-name';
      newItem.appendChild(textNode);
      purchaseList.insertBefore(newItem, purchaseList.childNodes[0]);
      var hiddenLimit = document.getElementById('hidden-limit')
      if (hiddenLimit != undefined){
        var limit = parseInt(document.getElementById('hidden-limit').textContent);
        removeLastChildIfLimitHasBeenReached(limit)
        updatePurchasersCount();
     }
    }
  }

  function removeLastChildIfLimitHasBeenReached(limit){
    if (limit != undefined) {
      var purchasers = document.querySelectorAll('#purchase-list .purchase-name');
      if (purchaseList != undefined && purchasers!= [] && purchasers.length > limit){
        var lastElementInPurchaseListTable = purchaseList.lastElementChild;
        purchaseList.removeChild(lastElementInPurchaseListTable)
      }
    }
  }

  var pusher = new Pusher('918394cde828768b0b59');
  var channel = pusher.subscribe('purchase_channel');
  channel.bind('my_event', function(data) {
    addChildNodeToPurchasesList(data.message);

  });

});
