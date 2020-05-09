$(function(){
  let mouses = $(".owl__carousel__sub");
  function imageSelect(){
    const index = mouses.index(this);
    var scrollvalue = -565 * index;
    $(".active").removeClass("active")
    $(this).addClass("active")
    $(".item__photo__content__detail__main").css("left", scrollvalue);
    $('.active').css('opacity', '1');
    $(".owl__carousel__main").removeClass("show").eq(index).addClass("show")
  };
  function imageNotSelect(){
    $(".active").css('opacity', '0.4');
  }
  mouses.mouseenter(imageSelect); 
  mouses.mouseleave(imageNotSelect)
});

$(function()  {
  $(window).load(function(){
    $('.show').show();
    $(".owl__carousel__sub").css('opacity', '0.4');
    $('.active').css('opacity', '1');
  })
});