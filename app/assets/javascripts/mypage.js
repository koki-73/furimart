$(function(){
  let tabs1 = $(".mypage-tab-notification-todo li h3")
  let tabs2 = $(".mypage-tab-items li h3")

  function tabSwitch1() {
    $(".mypage-tab-notification-todo li.active").removeClass("active");
    $(this).parent().addClass("active");

    const index = tabs1.index(this);
    $("#mypage-tab.notification-todo").removeClass("active").eq(index).addClass("active");
  }

  function tabSwitch2() {
    $(".mypage-tab-items li.active").removeClass("active");
    $(this).parent().addClass("active");

    const index = tabs2.index(this);
    $("#mypage-tab.items").removeClass("active").eq(index).addClass("active");
  }

  tabs1.click(tabSwitch1);
  tabs2.click(tabSwitch2);

})