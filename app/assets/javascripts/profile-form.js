$(function(){
  const buildImg = (url)=> {
    const html = `<div class="profile-image">
                  <img width="150px" height="150px" src="${url}" >
                  </div>`;
    return html;
  }
  
  $("#profile-image-form").on("change", function(e){
    console.log("OK")
    $("img").remove();
    const blobUrl = window.URL.createObjectURL(e.target.files[0]);
    $("#profile-image-preview").append(buildImg(blobUrl));
    $("img").css("border-radius","50%");
  })
})