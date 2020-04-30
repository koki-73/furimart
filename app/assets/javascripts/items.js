$(function() {
  $('.left_lists__category').hover(function() {
    $('.category-box').css('display', 'block');
  }, function() {
    $('.category-box').css('display', 'none');
  });
  $('.category-box').hover(function() {
    $(this).css('display', 'block');
  }, function() {
    $(this).css('display', 'none');
  });
});