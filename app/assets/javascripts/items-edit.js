$(function(){
  const buildFileField = (index)=> {
    const html = `<div class="js-file-group" data-index="${index}" >
                    <input class="js-file" type="file"
                    name="item[item_images_attributes][${index}][image]"
                    id="item_item_images_attributes_${index}_image">
                  </div>`;
    return html;
  }

  const buildImg = (index, url)=> {
    const html = `<div class="new-wrapper__main__preview__image">
                    <img data-index="${index -1}" width="131px" height="160px" src="${url}" >
                    <div class="delete-btn">
                      <i class="far fa-times-circle delete-icon" data-index="${index - 1}"></i>
                    </div>
                  </div>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.js-file-group:last').data('index');
  fileIndex.splice(0, lastIndex);
  let fileCount = 10 - fileIndex.length

  $('.hidden-destroy').hide();
  $("#image-wrapper").attr("for",`item_item_images_attributes_${fileIndex[0] - 1}_image`);
  if (fileIndex.length == 0) $("#image-wrapper").css("display","none");

  $("#image-box").on("change", function(e){
    let imageCount = $(".new-wrapper__main__preview__image").length
    let formCount = $(".js-file-group").length
    const blobUrl = window.URL.createObjectURL(e.target.files[0]);
    $("#previews").append(buildImg(fileIndex[0], blobUrl));
    $(".new-wrapper__main__image-field").append(buildFileField(formCount));
    $(".js-file-group").css("display","none");
    $("#image-wrapper").attr("for",`item_item_images_attributes_${formCount}_image`)
    fileIndex.shift();

    if (imageCount == 9) $("#image-wrapper").css("display","none");
  })

  $('#image-box').on('click', '.delete-icon', function() {
    $("#image-wrapper").css("display","block");
    const targetIndex = $(this).data('index')
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    fileIndex.unshift(10 - fileIndex.length);

    if (targetIndex < fileCount) {
      hiddenCheck.prop('checked', true)
      $("#image-wrapper").attr("for",`item_item_images_attributes_${fileCount}_image`);
    } else {
      $(".js-file-group")[(targetIndex)].remove();
      $(".js-file-group")[(targetIndex)].remove();
      $(".new-wrapper__main__image-field").append(buildFileField(fileIndex[0] - 1));
      $("#image-wrapper").attr("for",`item_item_images_attributes_${fileIndex[0] - 1}_image`);
    };
    
    $(this).parent().parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    

    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
    
  });
})