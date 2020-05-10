function test(item_id, buyer_id) {
  var param = {
    item_id: item_id,
    buyer_id: buyer_id
  }
  console.log(param);
  $.ajax({
    url: "api/items",
    type: 'put',
    dataType: 'json',
    data: param
  })
    .done(function () {
      alert("OK");
    })
    .fail(function () {
      alert("error");
    })
}
