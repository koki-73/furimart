$(function(){
  if (document.getElementById("token_submit") != null) {
    Payjp.setPublicKey("pk_test_f47e91d5301f664233e525d1");
    $("#token_submit").on("click", function(e){
      e.preventDefault();
      let card = {
        number: $("#card_number").val(),
        cvc: $("#cvc").val(),
        exp_month: $("#exp_month").val(),
        exp_year: $("#exp_year").val(),
      };
      Payjp.createToken(card, function(status, response){
        if (status === 200) {
          $("#card_number").removeAttr("name");
          $("#cvc").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name");
          $("#card_token").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          );
          $("#card-form").submit();
          alert("登録が完了しました");
        } else {
          alert("カード情報が正しくありません。");
        }
      })
    })
  }
  $(".form-content__add").on("click", function(){
    $(".form-content__seqcode-info").fadeToggle(500);
  })
})