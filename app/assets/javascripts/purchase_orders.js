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
  var purchaseCount = document.querySelectorAll('#purchase-list .purchase-name').length
  var elem = document.getElementById('purchase-count')
  elem.innerHTML = purchaseCount;
}

function addChildNodeToPurchasesList(message){
  var messageArray =  message.split("+")
  var purchase_list = document.getElementById('purchase-list')
  var messageName = messageArray[0];
  var messageCity = messageArray[1];
  var messageState = messageArray[2];
  var textNode= document.createTextNode(messageName + " " + "from" + " "+ messageCity+", "+ messageState)
  var newItem = document.createElement("dt");
  newItem.className = 'purchase-name';
  newItem.appendChild(textNode);
  purchase_list.insertBefore(newItem,purchase_list.childNodes[0]);
}
